---
date: 2018-03-22T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


2018-03-22 via Ali Asad Lotia
https://equalexperts.slack.com/archives/C03L7FXDH/p1521613051000127

> What are the pitfalls of running Java or JVM-based applications in containers? In this article, Jörg Schad and Ken Sipe discuss the challenges and solutions.

In short, set the following to automatically lock your min/max heap to half your container memory:

```
JAVA_OPTS=-XX:MaxRAMFraction=2 -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
```

Also, good explanation of the role of Linux kernel control groups (`cgroups`) and namespaces in containerisation.

See also [OpenJDK and Containers - RHD Blog](https://developers.redhat.com/blog/2017/04/04/openjdk-and-containers/) for many more JVM configurations in containers.
[https://mesosphere.com/blog/java-container/](https://mesosphere.com/blog/java-container/)

