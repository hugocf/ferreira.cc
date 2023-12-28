---
date: 2016-04-05
lang: en
tags: [ mysql, info, tips, tricks, how to ]
title: MySQL
summary: Small information nuggets and recipies about MySQL
showToc: true
tocOpen: true
---

*(most recent on top)*

## Show storage engine information (per table)

* [innodb - How can I check MySQL engine type for a specific table? - Stack Overflow](http://stackoverflow.com/a/4225613/1380781)

```sql
show engines;
```

```sql
select table_name, engine
from information_schema.tables
where table_schema = 'dbname';
```

## Drop all tables

*… execute the command below and then run the generated statements*

```sql
select concat('drop table if exists ', table_name, ' cascade;')
from information_schema.tables
where table_schema = 'database_name';
```

## Recreate a blank database

```sql
drop schema dbname;
```

```sql
create database dbname 
default character set utf8 collate utf8_general_ci;
```

## Show default character set

```sql
show variables like 'char%';
show variables like 'coll%';
```

## Change the database default character set

```sql
alter database dbname 
default character set utf8 collate utf8_general_ci;
```

## Change table character set

*… for each table*

```sql
alter table tablename 
convert to character set utf8 collate utf8_general_ci;
```

## Show permissions for a user

```sql
show grants for username@localhost;
```

## Show list of databases in server

```sql
show databases;
```

## Change permissions on a database

* [Stop using FLUSH PRIVILEGES – I used to be a MySQL DBA for Hire](http://dbahire.com/stop-using-flush-privileges/)
    - No need for doing flush privileges when using “higher level” commands
    - Only when directly manipulating the permissions tables with “low level” commands (insert, update, delete) does the flush privileges command need to be done to reload the permissions copy MySQL keeps cached in memory

```sql
grant all privileges on `dbname`.* to 'username'@'localhost';
```

```sql
revoke all privileges on `dbname`.* from 'username'@'localhost';
```

## List users in the database

```sql
select user, host, password from mysql.user;
```

## Rename a user

```sql
rename user 'oldname'@'localhost' to 'newname'@'localhost';
```
