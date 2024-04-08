---
date: 2005-01-15T01:05:07Z
lang: en
tags: [ oracle, info, tips, tricks, how to ]
title: Oracle
summary: Small information nuggets and recipies about Oracle
showToc: true
tocOpen: true
---

*(most recent on top)*

## Database defaults

* DBNAME: `ORCL`
* SID: `ORCL`
* Users
    - user/pass: `scott`  / `tiger`
    - user/pass: `SYSTEM` / `oracle`
    - user/pass: `SYS` / `oracle`

## Services

```batch
net start OracleOraHome92TNSListener
net start OracleServiceORCL
```

## Oracle SQL*Plus

```sql
show all
set sqlprompt '&_user@&_connect_identifier > '
```

*… output config*

```sql
set pagesize 50000
set linesize 120
set wrap off
```

*… limit  rows*

```sql
select * from dual where rownum < 2;
```

*… table info*

```sql
select owner, table_name, num_rows from all_tables;
desc <tablename>
```

## Oracle SQL Developer

*… easier navigation via “Schema Browser”*

> 1. Right-click on a connection name
> 2. Select “Schema Browser”
> 3. Filter the list in the bottom search box

## SQL queries

### Describe constraint

```sql
select * from ALL_CONS_COLUMNS
where constraint_name='<name>'
order by position;
```

### Turn constraints on/off

```sql
alter table <tbl_name> disable constraint <cons_name> [cascade]
alter table <tbl_name> enable constraint <cons_name>
```

### Parent/child hierarchical relationship

* table: `entity`
* key: `id`
* field: `parentId`

#### Filter over the results

```sql
select *
from entity
where <condition>
start with <condition>
connect by <condition>
```

#### Get children of `?` (all below, including root)

```sql
select id
from entity
where <stop_condition>
start with id = ?
connect by nocycle prior id = parentId
```

#### Get children of `?` (all below, excluding root)

```sql
select id
from entity
where <stop_condition>
start with parentId = ?
connect by nocycle prior id = parentId
```

#### Get parents of `?` (all above, including self)

```sql
select id
from entity
where <stop_condition>
start with id = ?
connect by nocycle id = prior parentId
```

#### Get siblings of `?` (same parent)

```sql
select e1.id
from entity e1
join entity e2 on e1.parentId = e2.parentId
where e2.id = ?
```

```sql
-- same behaviour with sub query (`e1` and `e2` added for clarity)
select e1.id
from entity e1
where e1.parentId = (select e2.parentId from entity e2 where e2.id = ?)
```

#### Get far away from `?` (above and others)

```sql
select e1.id
from entity e1
join entity e2 on e1.id <> e2.id
start with e2.parentId = ?
connect by nocycle prior e2.id = e2.parentId
```

```sql
-- same behaviour with sub query (`e1` and `e2` added for clarity)
select e1.id
from entity e1
where e1.id not in (
    select e2.id
    from entity e2
    start with e2.parentId = ?
    connect by nocycle prior e2.id = e2.parentId
)
```

<mark>*👆 HF: Not tested, needs validation!*</mark>

## Support

### Show database version

```sql
select * from v$version
```

### List database sessions

```sql
select * from v$session
```

### Kill a session

```sql
alter system kill session '35, 5842'        -- 'sid, serial'
```

### What is a database process doing?

```sql
select s.hash_value, s.piece, s.sql_text, se.*
from v$session se, v$sqltext_with_newlines s
where s.hash_value = se.sql_hash_value
order by se.sql_hash_value, sid, piece
```

### Which tables are locked?

```sql
select a.object_name, a.object_type, o.session_id, o.oracle_username, o.os_user_name, o.locked_mode
from v$locked_object o, all_objects a
where a.object_id = o.object_id
order by a.object_name
```

### Increase number of processes, sessions, connections in Oracle XE

```sql
C:\>sqlplus /nolog
SQL> connect sys as sysdba
SQL> connect sys/admin@localhost as sysdba
```

```sql
SQL> show parameter processes
SQL> alter system set processes=150 scope=spfile;
SQL> shutdown immediate
SQL> startup
SQL> exit
```

## Tunning

### Check DBMS_MONITOR, since Oracle Database 10g

* <http://www.oracle.com/technology/oramag/oracle/04-sep/o54talking.html>

### Check statistics for tables

```sql
select table_name, last_analyzed, num_rows, blocks, empty_blocks, avg_row_len
from dba_tables
where owner = 'SCHEMA_NAME' and table_name = 'TABLE_NAME'
order by table_name;
```

### Check statistics for indexes

```sql
select table_name, index_name, last_analyzed, num_rows, leaf_blocks, blevel, clustering_factor
from dba_indexes
where owner = 'SCHEMA_NAME' and table_name = 'TABLE_NAME'
order by table_name;
```

### View long operations

```sql
select * from v$session_longops
where target like 'SCHEMA_NAME.%'
order by start_time desc;
```

### What is doing full table scans?

* *FTS = Full Table Scans*
* <http://www.dba-oracle.com/art_otn_cbo_p8.htm>

```sql
select p.owner, p.name, t.num_rows, ltrim(t.cache) ch,
    decode(t.buffer_pool,'KEEP','Y','DEFAULT','N') K,
    s.blocks blocks, sum(a.executions) nbr_FTS
from dba_tables t, dba_segments s, v$sqlarea a, (
        select distinct address, object_owner owner, object_name name
        from v$sql_plan
        where operation = 'TABLE ACCESS' and options = 'FULL'
    ) p
where a.address = p.address
  and t.owner = s.owner
  and t.table_name = s.segment_name
  and t.table_name = p.name
  and t.owner = p.owner
  and t.owner not in ('SYS','SYSTEM')
having sum(a.executions) > 9
group by p.owner, p.name, t.num_rows, t.cache, t.buffer_pool, s.blocks
order by sum(a.executions) desc;
```
