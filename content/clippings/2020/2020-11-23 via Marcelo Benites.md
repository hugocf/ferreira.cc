---
date: 2020-11-23T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


# 2020-11-23 via Marcelo Benites
https://springernature.slack.com/archives/C01ES456TDJ/p1606141178041300

TODO: Summarise in a simple table the: what + pros + cons

[https://www.softobiz.com/microservice-orchestration-vs-choreography/#:~:text=Microservice%20Orchestration%20and%20Choreography%20are,freedom%20to%20execute%20those%20decisions](https://www.softobiz.com/microservice-orchestration-vs-choreography/#:~:text=Microservice%20Orchestration%20and%20Choreography%20are,freedom%20to%20execute%20those%20decisions)

—//—

Update 2024-02-06:

via [David Hamilton](https://equalexperts.slack.com/archives/C03456VQ5B4/p1706869154718969?thread_ts=1706203378.183369&cid=C03456VQ5B4)

>>>
A lot of parts to unpack in this. Underlying it all is the discussion whether you're architecting your microservices using orchestration or choreography, which are fundamentally different approaches.
* 		There is a school of thought that the whole point of a microservices architecture is to decouple the services from each other, and that is not properly done unless that tight synchronous coupling is severed by introducing events to break what they call the "distributed monolith".
* 		The counter to that is that EDA everywhere is over-engineering, slowing development, and that APIs are a much more pragmatic solution, less ivory tower.
* 		There is another school of thought that even APIs are over-engineering at the early phase of a project, while the model is still evolving, and that it's better to start with a monolith rather than assuming either of the above, and then refactor once model and fracture planes are more clearly defined

Personally, I'm not sure I would term EDA as something to "move towards" as it suggests a Golden Hammer, just as hitting everything with REST APIs is (IMHO) a Golden Hammer. My current inclination is to look towards EDA for functional (so team aligned - DDD/Conway's law) fracture planes, and APIs for non-functional fracture planes, starting with monolith(s) of discover those planes. But every project is different...
Also, obligatory note that EDA is not just events - the design should be a mix of Commands (sync), Queries (sync), and Events (async) (edited) 

