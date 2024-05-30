---
date: 2023-03-06T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


2023-03-06 audit-logs


> Whereas system logs are designed to help developers troubleshoot errors, audit logs help organizations document a historical record of activity for compliance purposes and other business policy enforcement.

What makes a good audit log:

* Summarise this, don't quote the entire thing

> Audit Log Quality Matrix Framework

Log Content (4pts)

Event types cover all actions taken in the system and include critical fields, such as source ip address.
Audit logs have external facing documentation on event types.
Logs contain enough information to attribute activity to a user within the platform.
The ability to get detailed audit logs is part of the core product or reasonably priced.
Log Collection (3pts)

The ability exists to stream logs to a cloud storage or SIEM provider (such as logpush to S3). Otherwise the API to self-retrieve logs is straightforward, documented and allows engineers to easily retrieve their logs.
Log collection makes it possible for event IDs to be sorted and straightforward in order to not miss log events or get duplicate events in the pipeline.
There is good log formatting and data structure choice, making it easy to parse logs once they are retrieved.
Quality & Consistency (3pts)

There is log constistency across product versioning and operating systems, including when pulling the logs. Backwards compatability introduced when needed.
Low rate of log quality related incidents. Logs are reliable and can be taken as a source of truth.
There is limited latency between when an action occurs and when the log event is available.

[https://audit-logs.tax/](https://audit-logs.tax/)

