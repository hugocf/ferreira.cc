---
date: 2022-09-30T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


# 2022-09-30 api-not-found


> But a 400 error might mean one of two things: the developer has a bug in their request, or the user made an incorrect request using the developer’s app.

To allow API consumers to distinguish between these 2 scenarios:

> I recommend that API designers include a **ping **method. **Ping **methods always return 200 OK, and a small status message, no matter how it is called or what headers are sent. If a developer calls **ping** and receives anything other than 200 OK, they know something prevents the app from reaching the API.

> I also recommend that developers of query APIs should always return 200 OK, *even if zero rows matching the query are found*. A developer working against this API does not need to show an error code if zero records are found; they just show zero records — because that is the correct result, and no error occurred.

https://medium.com/codex/should-apis-use-404-as-an-error-code-82e41ac96ffe

[https://medium.com/codex/should-apis-use-404-as-an-error-code-82e41ac96ffe](https://medium.com/codex/should-apis-use-404-as-an-error-code-82e41ac96ffe)

