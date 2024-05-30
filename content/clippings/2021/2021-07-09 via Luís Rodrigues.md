---
date: 2021-07-09T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


# 2021-07-09 via Luís Rodrigues
https://t.me/c/1363309933/3545


> My general rule of thumb: don’t violate DRY within a microservice, but be relaxed about violating DRY across all services. The evils of too much coupling between services are far worse than the problems caused by code duplication.
>
> — Sam Newman in “Building Microservices”

[https://www.youtube.com/watch?v=cqKGDpnE4eY](https://www.youtube.com/watch?v=cqKGDpnE4eY)

at 5:40 [**emphaiss** added]

> A microservice is by definition independently deployable. **The whole point of a microservice is to allow organisational scaling through decoupling.** We want teams to be able to work independently of one another. **We don't get to test our microservices together before release or they wouldn't be independently deployable.**

See also:
[https://www.youtube.com/watch?v=cqKGDpnE4eY](https://www.youtube.com/watch?v=cqKGDpnE4eY)

> Small

* Fits inside [a developer] head
* Compartmentalises a particular problem, so it's easier to understand
* Rule of thumb “how micro is micro?”
	* If you throw it away and reimplement it, would you be able to do it in a couple of weeks max?
	* It the idea of rewriting it scares you, it's probably too big!

> Focus in a single task

* … when view from the outside
* i.e. separation of concerns in the problem domain

> Aligned with a bounded context

* “Are defined part of software where particular terms, definitions and rules apply in a consistent way” — Eric Evans in “Domain Driven Design” book
* Align with “seams” in the problem domain
* Whenever you transition a bounded context boundary, you should translate the information/ideas that cross the boundary
* This means something like “posts and adapters” to prevent leaking the internal domain representation

> Autonomy

* Freely change and deploy without needing to coordinate with anyone else
* Service Based Design ≠ Microservices

> Independently deployable

* An important aspect of autonomy
* Not being constrained by other groups makes teams significantly more effective

This means…

* You don't get to test your services together before you release
* You don't get to force changes that you make, to your service, on consumers of your service

> **Microservices are an organisation decoupling strategy**

* This is what they are for!
* If you don't need to decouple you organisation …, they're probably not the right thing to do [because of their cost]
* To achieve this, **microservices must be loosely coupled**
	* Make external & internal representations different
	* The microservice interface is like a public API (can't demand others to change with us)
	* Be very, very cautious of breaking changes at any point

> These are techniques of microservices, these is the cost of microservices, but for that cost you get some huge advantages.
