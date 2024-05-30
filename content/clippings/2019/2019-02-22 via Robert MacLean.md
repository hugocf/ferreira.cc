---
date: 2019-02-22T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


2019-02-22 via Robert MacLean
https://equalexperts.slack.com/archives/C02QDL3SZ/p1550824917010000

> CVE-2019-0676 is a security issue where all websites that end with `.dev` MUST be https but they were ignoring it. (…) This has caused a lot of internal websites to break, since they are not HTTPS as they are meant for internal development. 
>
> `.dev` is *not* a reserved TLD and as such under Googles control (as the owner of the TLD). We should never use random TLDs for work when there is a good list of reserved TLD’s (https://tools.ietf.org/html/rfc6761):
> - `.test` _[free to use as any other domain]_
> - `.localhost` _[should resolve to loopback address]_
> - `.invalid`_[may choose to return NXDOMAIN or use as any other domain]_
> - `.example`_[for documentation only]_
[https://tools.ietf.org/html/rfc6761](https://tools.ietf.org/html/rfc6761)

