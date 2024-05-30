---
date: 2023-02-10T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


# 2023-02-10 event-driven-patterns


[https://martinfowler.com/articles/201701-event-driven.html](https://martinfowler.com/articles/201701-event-driven.html)

Patterns of event-driven architectures: Event Notification, Event-carried State Transfer, Event Sourcing, CQRS

* Pattern 1: Event Notification

* Pattern 2: Event-carried State Transfer

* Pattern 3: Event Sourcing 
* Pattern 4: CQRS

[https://www.youtube.com/watch?v=STKCRSUsyP0](https://www.youtube.com/watch?v=STKCRSUsyP0)

**Andreas Melcher** comment

> Timed index of the video
>
> 0:00 What people mean by EDA
> 
> 00:51 How he came to write down common patterns of EDA and hold this talk
> 
> 02:45 4 patterns detected
> People normally call their system "event-driven" if at least one of those patterns is in place
> 
> 03:20 **Pattern 1: Event Notification**
> Generic code notifies specific code by events, for example GUI elements
> 
> 08:33 Events vs Commands
> Events just indicate a change without expecting any particular response
> Commands are telling some service what to do
> 
> 11:30 Pro: Decoupling
> 
> 13:50 Contra: inability to understand what is going on by stepping through the code
> 
> 14:53 **Pattern 2: Event-carried State Transfer**
> Subscribers don't ask for additional information after an event occured, all necessary state is given in the events. 
> Subscribers copy whatever they need.
> Pro: can greatly reduce network traffic. Better availability because of the copied data
> Contra: consistency
> It's Less used
> 
> 20:51 **Pattern 3: Event Sourcing**
> Ability to rebuild the full state of the system by a persisted log of events
> Event Sourcing works with your data like version control systems work with your code
> Pro: "time traveling" like for debugging. use a copy of the system, feed it the events and see what happened
> 
> 32:11 Can be a very nice system development-wise
> 
> 33:43 Downside of Event Sourcing
> - unfamiliar
> - when I rebuild the state from the log I can't replay answers of external systems unless I record all answers as kind of events
> - old event schema still has to work somehow with new versions of code
> - IDs that are generated during replay are probably different than before
> - Asynchrony is difficult for people (but it's optional. You can synchronously use event sourcing)
> - Versioning (Snapshots can make that easier)
> 
> (Conclusion for me: Always remember that replay has to work for everything, otherwise there is no point in using event sourcing)
> 
> 38:46 Which events to record in the event store?
> Two events happen for a state change. One shows the intention (command), the other shows all the different changes that were done.
> Events that show intention often hold specific knowledge, the EventStore normally should stay generic (git only knows txt, not the used programming language syntax)
> It's important to think about which of those events are important to persist. Probably both.
> 
> 43:31 **Pattern 4: CQRS**
> Separate components for updating the system and reading from the system
> Different views of the data are pretty common (e.g. a reporting database), the important thing here is that the command model is never used for reading from outside
> 
> 47:39 Conclusion : How to use the knowledge about those 4 patterns
> When you hear about a system being "event-driven" ask questions to find out what patterns they use. Because the term "event-driven" is too imprecise.
> Have enough knowledge about each pattern to know where the problems are and what consequences they cause.

