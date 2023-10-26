---
date: 2023-10-26
lang: en
tags: [ tools, programming, databases, sql, generators ]
title: PRQL - Pipelined Relational Query Language
type: link
via: "[Robert MacLean](https://equalexperts.slack.com/archives/C02QDL3SZ/p1698310729154499)"
---

[PRQL](https://prql-lang.org/)

> **P**ipelined **R**elational **Q**uery **L**anguage, pronounced “Prequel”
>
> PRQL is a modern language for transforming data
— a simple, powerful, pipelined SQL replacement

For example, “Top N by group”:

```sql
from employees
group role (
  sort join_date
  take 1
)
```

```sql
WITH table_0 AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY role
      ORDER BY
        join_date
    ) AS _expr_0
  FROM
    employees
)
SELECT
  *
FROM
  table_0
WHERE
  _expr_0 <= 1
```
