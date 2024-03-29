---
date: 2024-03-22T21:13:30
lang: en
tags: [ observability, open telemetry, facebook, best practices ]
title: "All you need is Wide Events, not “Metrics, Logs and Traces”"
type: link
via: "[Gerald Benischke](https://equalexperts.slack.com/archives/C041T4BEHS4/p1711053324756439)"
---

[All you need is Wide Events, not “Metrics, Logs and Traces”](https://isburmistrov.substack.com/p/all-you-need-is-wide-events-not-metrics)

> … when it comes to the distributed systems at scale what’s more important is an ability to “dig” into data - “slice and dice” it, build and analyse various views, correlate, search for anomalies… And systems that offer all of this do exist.

---

> Wide Event is just a collection of fields with names and values, pretty much like a json document. If you need to record some information - whether it’s the current state of the system, or an event caused by an API call, background job or whatever - you can just write some Wide Event to Scuba.

---

> It took me quite a while to map my Scuba-based mental model to Open Telemetry mental model. I realised that Open Telemetry’s Span is, in fact, the Wide Event.
>
> …
>
> Span is the closest concept to Wide Event. The thing is - it’s extremely hard to advocate for this mental model when the one suggested by Open Telemetry is already learned. Which is really upsetting, because Traces, Metrics and Logs are all just special cases of Wide Events really

---

> I just wish that observability vendors took a stand against confusion, and offered a simple and natural way to interact with the system. [Honeycomb](https://www.honeycomb.io/) seems is [doing that](https://x.com/mipsytipsy/status/1738048200630792245?s=20), as well as some other systems like [Axiom](https://axiom.co/).
