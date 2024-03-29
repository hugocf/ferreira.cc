---
date: 2015-11-17T01:05:18
lang: en
tags: [ mongodb, info, tips, tricks, how to ]
title: MongoDB
summary: Small information nuggets and recipies about MongoDB
showToc: true
tocOpen: true
---

*(most recent on top)*

## Cleanup a single collection

```shell
mongo 'dbname' --eval 'db.collectionName.remove({})'
```

*… example*

```shell
mongo 'agent-paye' --eval 'db.optedInUsers.remove({}); db.termsAndConditions.remove({})'
```

## Drop all databases / collections

```shell
mongo --quiet --eval 'db.getMongo().getDBNames().forEach(
    function(i) { db.getSiblingDB(i).dropDatabase() }
)'
```

## Launch MongoDB on demand

```shell
mongod --config /usr/local/etc/mongod.conf &
```
