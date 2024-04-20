---
date: 2023-07-31T07:07:28Z
lang: en
tags: [ software, development, productivity, metrics ]
title: "How to measure and improve developer productivity | Nicole Forsgren"
type: video
---

{{< youtube id="dP8NmcEkxJI" title="How to measure and improve developer productivity | Nicole Forsgren" >}}

> Dr. Nicole Forsgren is a developer productivity and DevOps expert who works with engineering organizations to make work better. Best known as co-author of the Shingo Publication Award-winning book Accelerate and the DevOps Handbook, 2nd edition and author of the State of DevOps Reports, she has helped some of the biggest companies in the world transform their culture, processes, tech, and architecture.

> In today’s podcast, we discuss:
>
> * Two frameworks for measuring developer productivity: DORA and SPACE
> * Benchmarks for what good and great look like
> * Common mistakes to avoid when measuring developer productivity
> * Resources and tools for improving your metrics
> * Signs your developer experience needs attention
> * How to improve your developer experience
> * Nicole’s Four-Box framework for thinking about data and relationships

---

**Chapters**

> * [0:00](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=0s) Nicole’s background  
> * [7:55](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=475s) Unpacking the terms “developer productivity,” “developer experience,” and “DevOps”  
> * [10:06](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=606s) How to move faster and improve practices across the board
> * [13:43](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=823s) The DORA framework
> * [18:54](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=1134s) Benchmarks for success
> * [22:33](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=1353s) Why company size doesn’t matter
> * [24:54](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=1494s) How to improve DevOps capabilities by working backward
> * [29:23](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=1763s) The SPACE framework and choosing metrics
> * [32:51](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=1971s) How SPACE and DORA work together
> * [35:39](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=2139s) Measuring satisfaction
> * [37:52](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=2272s) Resources and tools for optimizing metrics
> * [41:29](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=2489s) Nicole’s current book project
> * [45:43](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=2743s) Common pitfalls companies run into when rolling out developer productivity/optimizations
> * [47:42](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=2862s) How the DevOps space has progressed
> * [50:07](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=3007s) The impact of AI on the developer experience and productivity
> * [54:04](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=3244s) First steps to take if you’re trying to improve the developer experience
> * [55:15](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=3315s) Why Google is an example of a company implementing DevOps solutions well
> * [56:11](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=3371s) The importance of clear communication
> * [57:32](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=3452s) Nicole’s Four-Box framework
> * [1:05:15](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=3915s) Advice on making decisions
> * [1:08:56](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=4136s) Lightning round


---

> Speed and stability move together.
>
> Most people only think about this from the speed standpoit, which means, when you move faster you are most stable. … smaller changes … smaller blast radious … easier to debug … faster to restore.
>
> Wthat that also means is the reverse. When you push changes less frequently, you will have less stable systems. … very large batch changes … large blast radious … larger “ball of mud” to understand what is worng …
>
> — Nicole Forsgren at [15:00](https://www.youtube.com/watch?v=dP8NmcEkxJI&t=900s)

---

<a id="summary">Summary</a> by [Tiago Almeida](https://twitter.com/_tiagoalmeida):

> *If you want you can skip to minute 10: first 8 are an intro, +2 talking about the relationship between DevOps, Dev Experience, and Productivity*
>
> 🙈 **Some contradictions**
>
> * Some executives answer her if “do we need to be faster?”
>     * Because they are afraid of the unknown trade-offs
>
> * We need to go faster, but also increase stability
>
> * Speed and stability move together
>
>     * Small changes and often
>
>         * More stable systems
>
>         * Easy to catch issues
>
>     * If we push large changes
>
>         * Large blast radius
>
>         * Big changes are hard to debug, reducing speed
>         * They also require a mental shift, because those changes could be done months ago
>
> 🏃 **Elite Performants**
>
> *What are signs of elite performant organizations?*
>
> * Deployment frequency: you can deploy on demand
> * Lead time for changes: less than a day
> * Time to restore: less than 1 hour
> * Change to failure rate is between 0 and 15%
> * You are not killing yourself, you are able to maintain a constant pace without brunout
>
> * We do not strive for precision in these metrics
>     * Less than 1 day is less than 1 day, it really doesn’t matter how many hours and minutes
>
> They also have:
>
> * Fast feedback loops
> * Trunk based development
> * Automated tests
>
> 🧐 **Some curiosities**
>
> * No statical differences between large and small companies
>
>     * Large companies say they have complex codebases, so many things to do
>
>     * Small companies say large companies have so much money and resources, this is not applies to me
>
> 🎩 **New things learned**
>
> * SPACE frameworks helps picking up the metrics we should be measuring for
>
>     * Satisfaction and well being
>
>         * Highly correlated with productivity and doing things well
>
>         * As soon as this starts to falling off everything starts to fail
>
>     * Performance
>
>     * Activity
>
>         * Usually a number
>
>         * Super easy to automate and collect
>
>     * Communication and collaboration
>
>         * How people communicate
>
>         * How our system communicate
>
>         * Searchability of a codebase
>
>     * Efficiency and Flow
>
>         * Time through the system
>
>         * Number of a hops a ticket takes until it reaches the right person
>
> * To use SPACE correctly we want to have 3 dimensions to balance things out
>
>     * DORA is a implementation of SPACE
>     * Each time you are going to implement a metric, see the dimension it fits and balance it with at least other 2 dimensions
>     * Although this is what the author recommends people usually couldn’t wrap about it
>
>     * Some people would pick bad metrics (i.e lines of code) and don’t pick other dimensions. In this case this is part of the “Activity Dimension”
>
> * Example: Working with a group to improve PRs
>
>     * Someone suggested pinging people every 15 minutes and measure the amount of alerts (I imagine if PRs were open)
>
>         * She knew from other literature that people would have alert fatigue
>
>         * People would tune out alerts
>
>         * So she kept this idea, but expanded the dimensions.
>
>         * So if we think about efficiency and flow, how much time would you have to work on your coding?
>
>         * This creates a balance. We need to protect time to work and pull to request review time at the same time
>
>     * For satisfaction metric sending a survey to eng team every few months can be a great way to measure it.
>         * Don’t discount what people say
>         * Sometimes she hear “but people lie” and she asks “why would people lie? what is the incentive to lie?”
>         * Even with the most advanced instrumentation doing surveys is fundamental because you can get new insights
>
>     * Four boxes framework is a framework that she helps to pick metrics, you can read more in [the transcript](https://www.lennyspodcast.com/how-to-measure-and-improve-developer-productivity-nicole-forsgren-microsoft-research-github-goo/)
>
> 🎯 **On Strategy**
>
> * “The key to having a good strategy is knowing what not to do.”
>
>     * And the key to executing a good strategy is actually not doing it
>
>     * You can’t fund everything
>     * You don’t get to pick everything
>
> * She has a [spreadsheet](https://docs.google.com/spreadsheets/d/1wItAODkhZ-zKnnFbyDERCd8Hq2NQ03WPvCfigBQ5vpc/edit?usp=sharing) to help decide what to do next
>
> 🔗 **Interesting links mentioned**
>
> * [Quick check to see how your org is doing](https://dora.dev/quickcheck/)
> * [SPACE paper](https://queue.acm.org/detail.cfm?id=3454124)
> * [DevOps Metrics](https://queue.acm.org/detail.cfm?id=3182626)
> * Good chapter “The Challenge of Intangibles” in book [How to Measure Anything: Finding the Value of "Intangibles" in Business](https://www.goodreads.com/book/show/444653.How_to_Measure_Anything) by Douglas W. Hubbard

---

<details>
<summary>Shared to…</summary>

🔒 *(groups)*

* [CTOs PT](https://ctospt.slack.com/archives/CF4VD6QPK/p1690830188725079)
* [iOS PT Slack](https://ios.slack.com/archives/C6DSYLCGZ/p1690830147170299)

</details>
