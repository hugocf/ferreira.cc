---
date: 2024-03-05T00:34:16
draft: true
lang: en
tags: [ … ]
title: Using the expand and contract pattern for DB schema changes
type: link
via: "[Elmar Fasel](https://springernature.slack.com/archives/C063007RVGQ/p1709593954734759?thread_ts=1707817490.413629&cid=C063007RVGQ)"
---

[Using the expand and contract pattern | Prisma's Data Guide](https://www.prisma.io/dataguide/types/relational/expand-and-contract-pattern)

> While [database migration](https://www.prisma.io/dataguide/intro/database-glossary#migration) software can often be used to update the actual data structures, the data itself must also be converted to new formats, migrated to different tables or columns, and updated to conform to new expectations. These processes, while not always complicated, are especially sensitive when performed on live systems that are actively being used by clients.
>
> Fortunately, a multi-step process known as the expand and contract pattern can be applied to safely migrate clients to use new data structures incrementally without taking the system offline. In this guide, we will explore what the expand and contract pattern is, how it enables seamless transitions between new and old structures, and how to apply it to various database transformations.
