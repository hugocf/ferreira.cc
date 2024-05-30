---
date: 2023-04-20T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


2023-04-20 auto-dependencies-updates


**In favour** of automatically updating dependencies. Risks analysed:

> **New dependencies breaking things:** this risk can be mostly (but never entirely) addressed by having a comprehensive build that tests your service with the new version and only accepts the new version if the build passes. …

> **Increased number of releases:** while I think that it is highly desirable to deploy to production every single version that is produced by your build pipeline, I don’t think it’s strictly necessary. …

> **Updating with intent:** … Software is in continuous flux, there are new vulnerabilities and bugs every day. … this way I’m likely to address issues before I even know about them. …

> **Protecting against malicious updates:** I think this is more or less of an issue depending on the particular technology / community and the provenance of the dependency itself. …

> In summary, although automated dependency updates brings some risks, I do believe that the benefits far outweigh them.

[https://www.cosotateam.com/post/automating-dependency-updates-the-big-debate](https://www.cosotateam.com/post/automating-dependency-updates-the-big-debate)

**Against** automatically updating dependencies. Risks analysed:

> **Continuous Integration**
> First of all, automatic dependency updates do require mature delivery pipelines. …

> **Continuous Delivery**
> … In such places [without mature CD] it might not be the best idea to push for automatically updating dependencies.

> **Maintenance at Scale**

> … I think that at scale it is not feasible to make lots of changes just because a dependency gets updated. If there is that subtle bug that might only found in production, overworked live teams often don’t get the time to monitor all the deployments and look for signs of things subtly going wrong. …

> **Legacy software**

> … There is a lot of ancient software … that makes money or are the most critical for successful operations. …

> **But but but security?**

> … In _Curating Dependency Vulnerabilities_ I show how that many vulnerabilities are false positives. In _on the weaponisation of open source_ I explore how automatically updating can have negative impact without it being traditional supply chain poisoning.

> **Update with Intent**
> This is why I think that software should be updated with intent. It should be a positive choice to make an update to a dependency. …

[https://beny23.github.io/posts/automatic_dependency_updates/](https://beny23.github.io/posts/automatic_dependency_updates/)

