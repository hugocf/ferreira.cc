---
date: 2021-02-18T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


# 2021-02-11 event-sourcing

## via Luís Rodrigues

* Make this into a “things I’ve collected about event-driven architectures”? (e.g. a page or a snippet?) instead of a clipping

# What is Event Sourcing good for?

**### Difficulties**
* Added complexity
	* Handling the system for doing simple things
	* Dealing with event versioning**
**

**### Benefits**
*Main ones*

* [HF: This is CQRS] Multiple producers: precisar de nunca bloquear escritas em entidades muito concorridas, onde a projecções eventualmente consistentes são aceitáveis
	* *by Luís Rodrigues*

* Capacidade de fazer spin-off the multiple read-models, of different formats, in different regions
	* *by Greg Young num dos slides da talk abaixo*

* Future flexibility, where we don’t know how what would be useful to explore in the future
	* *by Vitor Castro*

*Collateral (can be achieved in other ways)*

* Infherent auditing and logging of all the change history

—//—

> There are distinct costs to keeping things structured in events as an append-only model. It‘s not right for every project.
>
> — Greg Young @ 40:45 👇

“Why Event Sourced Systems Fail” by Greg Young
https://www.youtube.com/watch?v=FKFu78ZEIi8

Tags: 45 min, Event Sourcing

* Add link to the published clipping in things:///show?id=356tAKaa7oTDNkgE9YYD42

—//—

* 2 check out and read about versioning?

[https://leanpub.com/esversioning](https://leanpub.com/esversioning)

Update 2022-11-02: via Eduardo Taborda
https://springernature.slack.com/archives/CFVBR3XT9/p1667395260695379?thread_ts=1667391155.216499&cid=CFVBR3XT9

[https://www.eventstore.com/blog/event-immutability-and-dealing-with-change](https://www.eventstore.com/blog/event-immutability-and-dealing-with-change)

https://www.eventstore.com/blog/event-immutability-and-dealing-with-change

Update 2023-03-02
https://springernature.slack.com/archives/C027G6UV90C/p1677765040334039

**Lindsay Ryan**  1 hour ago

**folks: **do we have any steers or clarifications on **Event-Based**, **Event-Driven** (is there a difference?) and where we want to use them? @hugocf @Antonio José Molina Gutiérrez what's the current state of this in CA. Are there things you wouldn't do again or would do differently?
(**@ here) **Do we have any other notable event-driven or event-sourced architectures in play?

**Antonio José Molina Gutiérrez**  1 hour ago

event-driven as a communication pattern, where services sent events to a queue or messaging system is not something that is practised or recommended at SpringerNature AFAIK because of the highest level of complexity and some scars that have been left from previous failures

event-sourcing as a persistence strategy is recommended for entities that need heavy auditing and for which you need to have a deep understanding of the historical changes

successful use cases of event-sourcing on substantial systems include Snapp and Oasis

**Basavaraj Kalloli**
From my little experience I think event sourcing makes sense if you need auditing and you want to go back to what all happened in the system. But it does make things/code extremely difficult for people joining the team.

**Antonio José Molina Gutiérrez**
yep, it is not free. Is a change in paradigm that need to be well understood.

it will probably require to have 2 data models on the operational side: one for writes and one for reads

a substantial benefit is that you can evolve very easily the read data models

**Basavaraj Kalloli**
Also once you introduce event sourcing people just use it as a hammer and use it everywhere which I absolutely hate. You need to pragmatic and extra cautious whenever you try to introduce it

**Antonio José Molina Gutiérrez**  1 hour ago

yep, one solution must fit all problems, right? 🙂

event sourcing will make easier for you to push the operational data to an analytical platform/data-warehouse and by its nature will support the temporal nature of the analytical data plane better than if you have your operational data in a CRUD database
💯

those benefits are of no use if you plan to not have any analytics (as is quite often the case with many apps in SN)

hope that makes sense @lnr

**Lindsay Ryan**  40 minutes ago

this is exactly the insights i was hoping for. thanks both for chiming in so fast.

looking forward in Monetise, we don't have a clear need for heavy auditing; however there are two or three capabilities we're trying to enhance and I am considering where a formalisation around Domain Events might help. How that translates to either of the above is still open to me.

* We are focusing a lot on user journeys, experimenting with and reporting on them as sales funnels. Clearly defining and reporting these and related system events across our teams could provide better insights faster.
* I am looking into shifting to a headless eCommerce with 3rd party apis (from SaaS on one side and fully home grown on the other). I am wondering whether the orchestration of the users journey through these independent api calls would be handled with more resilience and observability via an event-driven architecture
* We are looking at opportunities to facilitate eCommerce activities that go between Librarian and patron, such as patrons requesting a book. We also would have expanded freedoms for internal Marketing and UX in the headless model. Both these raise the question of needing/benefiting from easier auditing.

Thoughts?

**Hugo Ferreira**  32 minutes ago

Just to add a couple of notes, in terms of terminology around this *“event-thingies” *space I always refer back to Martin Fowler’s definitions of patterns of event-driven architectures:
* Event Notification
* Event-carried State Transfer
* Event Sourcing
* CQRS

https://martinfowler.com/articles/201701-event-driven.html

Here he goes over several of the pros & cons of the different patterns, and where they’re most applicable: https://www.youtube.com/watch?v=STKCRSUsyP0

*(jumps to timestamps)*

* Pattern 1: Event Notification

* Pattern 2: Event-carried State Transfer

* Pattern 3: Event Sourcing

* Pattern 4: CQRS

Specifically to **Event Sourcing**, apart from what Antonio and Basu mentioned above, there’s also added flexibility (at the expense of complexity) to change and explore new functionality in the future

The capability of replaying all events and spinning-off new “projections” (read-models) of different formats, allows adding features that can potentially¹ apply to all the historical data

*¹ a long as the necessary events are available (you might have only started recording some events at a given point in time)* 

> 1. We are focusing a lot on user journeys, experimenting with and reporting on them as sales funnels. Clearly defining and reporting these and related system events across our teams could provide better insights faster.

State machine transitions, even if in a single direction sales funnel, could fit in an event source model.

The question here is whether the added complexity justifies the freedom to shape and change that state machine. If the funnel stages are clear, well know, and grow/change only occasionally, I’d probably be more inclined to think that a simpler more traditional solution would be more suitable.

> 2. …
> 3. …

Don’t have much to say about these, since i feel I’d need to understand the scenarios better

My only thought is that, in aggregate, they all together might constitute a good used case for a given event pattern

**Antonio José Molina Gutiérrez**  12 minutes ago

> if going for a more traditional solution, I would suggest that you capture as many timestamps as possible to enable temporal analytics later on

**Hugo Ferreira**  4 minutes ago

And for the event source pattern, I would just emphasise how relevant is the added complexity in equation, both ramping up to the mindset, in hiring and onboarding, etc.

As “learned lesson” I’d suggest avoiding doing any homegrown event storing by repurposing common storage solutions, and would be worth evaluating those specifically targeted at this space, like for example EventStoreDB

