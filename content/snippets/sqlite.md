---
date: 2023-09-21
description: Small information nuggets and recipies about SQLite
lang: en
tags: [ sqlite, info, tips, tricks, how to ]
title: SQLite
showToc: true
tocOpen: true
---

<!--more-->

*(most recent on top)*

## Quick survival guide for exploring a new database

* [Command Line Shell For SQLite - 5. Changing Output Formats](https://www.sqlite.org/cli.html#changing_output_formats)
* [Command Line Shell For SQLite - 6. Querying the database schema](https://www.sqlite.org/cli.html#querying_the_database_schema)

```sql
.headers on
.mode column
.tables
.schema
```
```sql
select * from table limit 10;
```

## See the CLI command history

* [SQLite CLI command history](https://antonz.org/sqlite-history/)
  * `↑` and `↓` — recall last commands
  * `Ctrl+R` — search command history <mark>HF: Not working?</mark>

```shell
cat ~/.sqlite_history
```

