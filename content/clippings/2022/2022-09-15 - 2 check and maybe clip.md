---
date: 2022-09-15T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


# 2022-09-15 | 2 check and maybe clip

Everything in Susan Fowler’s Production Ready Microservices. That's exactly what that book is - a list of questions and areas to review.  

https://equalexperts.slack.com/archives/C03L7FXDH/p1662541751598019?thread_ts=1662472517.226639&channel=C03L7FXDH&message_ts=1662541751.598019

https://www.oreilly.com/library/view/production-ready-microservices/9781491965962/

@Piotr Tempes At the end of the production-ready microservices book is a huge checklist of what you might want in the doc you’re after

(it’s also got the benefit of being a call to authority if someone says “i don’t think we need to do that to go to production” and you can point towards the book rather than just say “well I do”

—//—

https://equalexperts.slack.com/archives/C02QDL3SZ/p1662472574078459?thread_ts=1662461361.803219&channel=C02QDL3SZ&message_ts=1662472574.078459

Matthew Skelton (of team topologies fame, and friend of several EE consultants) has done this list of questions to find out the state of operability of a service/system
https://github.com/ConfluxHQ/operability-questions

—//—

At [JLewis] there is a service operability assessment. Quantitative checks are 100% automated e.g. do you have any monitoring dashboards. This frees up qualitative questions like 'do you have a plan for graceful degradation' or similar, and teams track necessary work. @yasin or @Mark could explain more

—//—

At a higher level, there's also things like https://www.gov.uk/service-manual/service-standard

—//—

Not sure  have done anything public about this that I can share specifics of e.g. the Operability Template. But in broad terms:

Our operability assessments are markdown files, organised by service/team and date in a shared git repository which our Service Catalogue system polls for changes.

The approach is a template markdown file with lots of probing questions which the team copies and will add comments against, if they determine they have actions around the discussion this created then they add JIRA references to their markdown and commit to a shared repository.

We have a job that ensures teams have an up-to-date assessment in place (quarterly I believe) allowing us to show on a dashboard a 🔴 / and days overdue per team and then we also give a count of open JIRA tasks associated to current and previous assessments.

Presuming the team regularly completes their assessments and works on (i.e. closes) any remediation or improvement stories they sponsored then they get a clean bill of health on our reports.

