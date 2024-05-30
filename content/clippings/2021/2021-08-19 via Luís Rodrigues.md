---
date: 2021-08-19T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


# 2021-08-19 via Luís Rodrigues
https://t.me/c/1363309933/4261


Nice rant about “old is new again” and the importance of fast feedback loops in software development

* Can the quotes be simplified even further? (feels too much quoting)

> Split your codebase, split your teams, create a lot of opportunities for mediocre coders to grow into mediocre engineering managers, everybody was happy. Including your hardware vendor, because suddenly you needed much more hardware to run the same workloads.

> The feedback cycle became worse as well: in the monolith-with-XML days, your XML editor would get you mostly there and a quick local compile and run would leave you all but certain that your configuration was working. XML, however, was universally rejected in favour of things like JSON, Yaml, HCL, Toml - all free of structure, with zero indication whether a computer would find your prose gibberish or the next Shakespeare play until you actually pushed your code to some test cluster.

> Microservices have trouble scaling, and they are very complex. Most companies that employ them have no need for them, … this stacking of complexity on top of complexity becomes a necessity. … The feedback cycle is truly broken - testing a microservice is merely testing a cog in a machine and no guarantee that the cog will fit the machine - but we just throw more bodies at the problem because Gartner tells us this is the future.
>
> So, we’re now at the next phase of this game: maintaining these very complex systems is hard and not your core business, so outsource it (simplifying it would cost too many managers’ jobs, so that is not an option). The Cloud was born, first as a marketing label for an old business model (offering “virtual private servers” to the public), but more and more as a marketing label for an even older business model (the mainframe - we run it, we own it, you lease capacity).
> 
> Apparently, Worse Is Better and you can do worse than Virtual Private Servers, so through a short-lived detour through containerizing microservices … we have arrived at “Serverless”. You deploy individual stateless functions. But not inside a Java monolith, that is old, but on top of a distributed system. You would have been laughed out of the door if you had proposed that in 2000, and you should be laughed out of the door right now, but such is the power of marketing.

> This level of complexity is not sustainable, and my fear is that it will be solved the way our industry likes to solve the problems they have created themselves: by adding more complexity on top if it.

[http://evrl.com/devops/cloud/2020/12/18/serverless.html](http://evrl.com/devops/cloud/2020/12/18/serverless.html)

