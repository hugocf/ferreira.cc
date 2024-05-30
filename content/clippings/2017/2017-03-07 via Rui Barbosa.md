---
date: 2017-03-07T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


[https://eng.uber.com/ios-monorepo/](https://eng.uber.com/ios-monorepo/)

2017-03-07 via Rui Barbosa
https://ios.slack.com/archives/general/p1488877466018390

The Results: Centralizing All iOS Code
With the monorepo, we centralized all our iOS code into one place. We organized our repository into this directory structure:
├── apps │   ├── iphone-driver │   ├── iphone-eats │   ├── iphone-rider ├── libraries │   ├── analytics │   ├── … │   └── utilities └── vendor    ├── fbsnapshottestcase
   ├── …
   └── ocmock

