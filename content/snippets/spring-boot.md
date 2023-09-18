---
date: 2020-06-18
description: Small information nuggets and recipies about Spring Boot
lang: en
tags: [ spring-boot, info, tips, tricks, how to ]
title: Spring Boot
showToc: true
tocOpen: true
tocSide: right
---

<!--more-->

*(most recent on top)*

## Actuator: Application Management Endpoints

* [14. Production Monitoring and Management with Spring Boot Actuator - YouTube](https://www.youtube.com/watch?v=XbknBOmMuPQ&list=PLGDwUiT1wr6-Fn3N2oqJpTdhGjFHnIIKY)

```shell
curl http://localhost:8080/autoconfig
curl http://localhost:8080/beans
curl http://localhost:8080/configprops
curl http://localhost:8080/dump
curl http://localhost:8080/env
curl http://localhost:8080/health
curl http://localhost:8080/info
curl http://localhost:8080/mappings
curl http://localhost:8080/metrics
curl http://localhost:8080/shutdown          # disabled by default
curl http://localhost:8080/trace
```

*… activate/deactivate configuration at `application.properties`*

```properties
endpoints.health.id=status          # rename endpoint
endpoints.health.sensitive=true     # security requirement
endpoints.shutdown.enabled=true     # shutdown endpoint [default false]
endpoints.shutdown.sensitive=false  # shutdown endpoint [default true]
management.context-path=admin       # all accessible only via `/admin/`
```
