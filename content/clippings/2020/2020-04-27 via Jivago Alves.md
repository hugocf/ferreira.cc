---
date: 2020-04-27T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


2020-04-27 via Jivago Alves
https://equalexperts.slack.com/archives/C02QDL3SZ/p1587980086024200

> Only unmanaged dependencies should be replaced with mocks. Use real instances of managed dependencies in tests.

TODO: Clip https://enterprisecraftsmanship.com/images/2020/2020-04-14-dependencies-2.png

TODO: Place this at the end

> This distinction splits out-of-process dependencies into two subcategories:
>
> - **Managed dependencies** — out-of-process dependencies you have full control over. These dependencies are only accessible through your application; interactions with them aren’t visible to the external world. A typical example is the application database. External systems don’t access your database directly; they do that through the API your application provides.
> - **Unmanaged dependencies** — out-of-process dependencies you don’t have full control over. Interactions with such dependencies **are** observable externally. Examples include an SMTP server and a message bus: both produce side effects visible to other applications.

[https://enterprisecraftsmanship.com/posts/when-to-mock/](https://enterprisecraftsmanship.com/posts/when-to-mock/)

