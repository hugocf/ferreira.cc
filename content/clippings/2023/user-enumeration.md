---
date: 2023-08-15
lang: en
tags: [ security, obscurity, user tracking ]
title: "user enumeration: what it is and why it matters"
subtitle: "an overview of user enumeration, its various forms, and its impacts"
type: link
via: "[Gerald Benischke](https://equalexperts.slack.com/archives/C6PUCB37E/p1692056078523089)"
---

<object data="https://cdn.githubraw.com/nyxgeek/track_the_planet/main/nyxgeek_Track_the_Planet_2023.08.14.pdf" type="application/pdf" width="100%">
    <p>Unable to display PDF file. <a href="https://cdn.githubraw.com/nyxgeek/track_the_planet/main/nyxgeek_Track_the_Planet_2023.08.14.pdf">Download</a></p>
</object>

[View](https://cdn.githubraw.com/nyxgeek/track_the_planet/main/nyxgeek_Track_the_Planet_2023.08.14.pdf) | [Source](https://github.com/nyxgeek/track_the_planet/blob/main/nyxgeek_Track_the_Planet_2023.08.14.pdf)

> This talk is about user enumeration, its impacts, and why Microsoft should take it seriously. Everything demonstrated is by design.
>
> Microsoft has decided that user enumeration does not qualify as a vulnerability.

---

> **What is User Enumeration?**
>
> * Enables an attacker to identify VALID accounts, and INVALID accounts based on server response
>
> Examples:
>
> * Verbose login response - "Your username is invalid"
>
> * Time-based login response
>     * INVALID Username response time: 10s
>     *  VALID Username login response time: 1s
>
> * Web server response differs (403 vs 404 HTTP Status Code)
>     * [404] http://fakedomain.com/application/users/tom
>     * [403] http://fakedomain.com/application/users/john

---

> User Enumeration is a Security Flaw
>
> * ENABLES:
>     * Password sprays
>     * Phishing
>     * Targeted RCE or similar (every so often)
>
> * Unnecessary "feature"
>
> * Allows identification and targeting of users directly
>     * Often includes full names (john.smith or john.j.smith formats)
>     * Durable lists - names change infrequently in a lifetime
>
> * Can't hit what you can't see (or at least it's harder