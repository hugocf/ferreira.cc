---
date: 2016-11-23T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


[https://nakedsecurity.sophos.com/2016/08/18/nists-new-password-rules-what-you-need-to-know/](https://nakedsecurity.sophos.com/2016/08/18/nists-new-password-rules-what-you-need-to-know/)

2016-11-23 via Sean Reilly
https://equalexperts.slack.com/archives/tech-community/p1479889622002142

tl;dr:
- allow longer passwords, don’t restrict maximum length below 64 chars
- allow all characters, including spaces and unicode emoji (I’m surprised by that one!)
- do check against a dictionary of bad choices
- *don’t* enforce composition rules (1 capital letter and 1 number)
- *don’t* allow password hints
- *don’t* have security questions (aka Knowledge Based Authentication)
- *don’t* expire passwords without reason. No more expiry schedules!
- *don’t* use SMS for 2FA (this isn’t a surprise)
- use PBKDF2 for key stretching (this isn’t a surprise either)
