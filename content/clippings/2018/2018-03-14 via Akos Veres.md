---
date: 2018-03-14T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


2018-03-14 via Akos Veres
https://equalexperts.slack.com/archives/C02QDL3SZ/p1519048976000391

tags: monitoring, micro services, support, operations, latency, errors, saturation, traffic, performance

>RED came about because Wilkie was frustrated with the popular USE methodology of performance measurement. [Created by Brendan Gregg](http://www.brendangregg.com/usemethod.html), USE buckets system performance metrics around these groups:
>
> * Utilization (U): The percentage of time a resource is in use.
> * Saturation (S): The amount of work the resource must (the “queue” of work).
> * Errors (E): A count of errors.

>As an alternative, Wilkie [developed](https://www.weave.works/blog/the-red-method-key-metrics-for-microservices-architecture/) another easy-to-remember acronym, RED, when he was working at Weave. RED [is based around requests](http://rancher.com/red-method-for-prometheus-3-key-metrics-for-monitoring/), characterizing microservice performance thusly:
>
> * Rate (R): The number of requests per second.
> * Errors (E): The number of failed requests.
> * Duration (D): The amount of time to process a request.

>Wilkie said that RED is actually derived from another, little-known, set of performance metrics (…) called [The Four Golden Signals](https://landing.google.com/sre/book/chapters/monitoring-distributed-systems.html):

> * Latency: The time it takes to service a request.
> * Traffic: A measure of how much demand on the system.
> * Errors: The rate of failed requests.
> * Saturation: A measure of how “full” a service is, often measured by latency.

See also [The USE Method](http://www.brendangregg.com/usemethod.html)
[https://thenewstack.io/monitoring-microservices-red-method/](https://thenewstack.io/monitoring-microservices-red-method/)

