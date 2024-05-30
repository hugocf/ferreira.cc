---
date: 2017-05-23T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


[https://vimeo.com/209681251](https://vimeo.com/209681251)

2017-05-23 via Martin Jackson
https://equalexperts.slack.com/archives/C03L7FXDH/p1495533950460405

> Should I make it an error or a warning?
>
> Imagine being paged at 4am for your error message

> **Captain’s Log — a pattern**
>
> Anyone should be able to figure out what is going one just from the error messages, even during development

> A log message should contain:
>
> - a **timestamp**, for humans (*with a timezone*) and machines (*epoch is fine*)
> - a unique **correlation id**, “edge-to-edge” (e.g. uuid)
> - the *cause*, the whole cause, and nothing but the cause
> - *answers* to the 3 questions, or at least pointers:
>     - What went wrong?
>     - Who’s impacted ?
>     - How to fix it?
>
> *A log is an append-only, read-only, user interface!*

> Every component should **heartbeat**
>
> There are lots of options for this: broadcasting a UDP packet, SNMP, etc.

