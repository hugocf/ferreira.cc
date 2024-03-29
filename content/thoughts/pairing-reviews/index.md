---
cover:
  relative: true
  image: unspash-code-reviews.jpg
  alt: a pair of glasses sitting on a table facing two blurred screens filled with code
  caption: "[Photo](https://unsplash.com/photos/w7ZyuGYNpRQ) by [Kevin Ku](https://unsplash.com/@ikukevk) on [Unsplash](https://unsplash.com/)"
date: 2023-05-08T22:16:55
drafted: 2020-11 until 2021-02
lang: en
source:
- "[Slack messages, Neha Datt, 2018-12-06](https://equalexperts.slack.com/archives/DDVFQU1FZ/p1544085389000200)"
- "[Slack messages, Tiago Almeida, 2020-10-21](https://ios.slack.com/archives/G02ATA0M9/p1603299069415200?thread_ts=1603287825.411300&amp;cid=G02ATA0M9)"
tags: [ pairing, code reviews, alternatives, how to ]
title: "Pairing Reviews: Bridging the gap between pair programming and code reviews"
summary: Paring technical sessions for kick-offs and reviews can be a good alternative for programmers frustrated with async code reviews and unhappy with continuous pair programming.
---

> One thing I have experienced to work well in the recent past is to have a technical/design kickoff with other team members when starting a feature: we trade ideias, discuss options, and align on a way forward
>
> — https://twitter.com/hugocf/status/1116437142010507266



> When the time for code review comes it’s a) obvious who should review it, b) easier to review because people have the context already, c) quicker to review because it becomes more focused on details and easier things to correct
>
> — https://twitter.com/hugocf/status/1116437755670740992



Over the years I’ve worked in many software delivery teams under a multitude of working formats:

* Sometimes working collocated, others as a remote satellite worker, to completely distributed[^fn-remote]
* With people having very different skill sets and levels of experience[^fn-engineers]
* Dealing with many different geographical and cultural backgrounds[^fn-culture]

[^fn-remote]: See post section [The Many Shades of Remoteness](https://www.martinfowler.com/articles/remote-or-co-located.html#TheManyShadesOfRemoteness) by [Martin Fowler](https://www.martinfowler.com/aboutMe.html).
[^fn-engineers]: See [Guides for reaching Staff-plus engineering roles](https://staffeng.com/guides/overview-overview/) by [Will Larson](https://lethain.com/about/).
[^fn-culture]: See book [The Culture Map](https://www.goodreads.com/book/show/22085568-the-culture-map) by [Erin Meyer](https://erinmeyer.com/about/).

Under very different types of pressures,

* Greenfield projects with strict deadlines
* Rescuing huge legacy codebases
* Long running product development

All these experiences forced me to reassess some of my long held assumptions about ways of working.

In particular, the dichotomy between **pair programming** and **async code reviews**[^fn-review] started to feel too strict and “religious” at times. There are many situations where people don’t want the burden of lengthy code reviews for which they lack context. Many other cases where continuous pair programming is not even possible (e.g. large timezone differences or appalling internet connections).

[^fn-review]: See the [GitHub flow](https://docs.github.com/en/get-started/quickstart/github-flow) pull request (PR) model, popularised by GitHub.

 ## Pair programming is not for everyone

![two men with their backs turned to the camera coding together in a laptop with two other large screens displaying code](unsplash-pair-programming.jpg)

*[Photo](https://unsplash.com/photos/fSWOVc3e06w) by [Alvaro Reyes](https://unsplash.com/@alvarordesign) on [Unsplash](https://unsplash.com/)*

This story started during a project with a tight 3 month deadline. We had to be very strict with our scope and be fast on how we ensured quality in the delivery.

All members had years of exposure to pair programming, so they chose to work like that, as a way to deliver faster. By bouncing ideas and reviewing code on-the-fly, we could evolve the code base as a team in an organic way.

One colleague was struggling though. They couldn't adjust to the format under this particular context and delivery pressures.

Either due to personality traits[^fn-traits] or personal preferences[^fn-prefs], whatever it was at the core, the team felt the need to embrace it and make some adjustments on the way we worked.

[^fn-traits]: For example, some people have a way of “thinking with their fingers” where they need to do exploratory code refactoring. Others prefer to do a more strict TDD style, write test cases first and let production code evolve in a fluid way. There are those who need conceptual thinking and brainstorming before writing any code.
[^fn-prefs]: For example, listening to music or chasing “the zone” are things that you cannot do in pairing.

There are many ways around personal differences to make pair programming work. In fact, this is a common practice in pairing since no two people are alike. But sometimes those differences are irreconcilable and this was such a case.

We all agreed that several people looking at the same piece of code was essential to ensure code quality. So, our initial change was to use the most common alternative in the industry: **async code reviews**.

## The problems we faced with async code reviews

Code reviews are easy, right? 

1. The team kicks off a story
2. A developer works on it on their own until development is “done”
3. Some team members review it

and then… well, then what? Then that’s where our problems started.

Setting aside how hard it was for a reviewer to get up to speed with the code to review, due to the lack of detailed context…

Setting aside that, since it required quite a significant mental effort to do the above, finding the time to review was also a problem…

Once a code review was in though, the type of issues we caught would fall under 3 categories:

1. **Finishes and polish**

   * Stuff that’s simple and easy to change: better names, move something around, extract a method, inline a variable, etc.
   * It was easy for the author and reviewer(s) to discuss and align these changes. It improves the code base a little and the cost is very low.
   * ✅ Small benefit
   * ⛔️ Small cost

2. **Marginal better structure**
   * The change to the codebase is not wrong or unworkable. We could improve something and bring marginal benefits but it is not trivial to change at this stage.
   * These changes ended up not happening. They were hard to justify at this stage with the *perception* was that the benefits were small. It was also hard to overcome the arguments of “but it’s already working”.
   
   * ✅ Small benefit
   * ⛔️ ⛔️ Medium cost
   
3. **Wrong implementation approach**
    * This is where something was “lost in translation” completely. This might not be that frequent but we’ve seen it happen enough times to hate the experience.
    * Catching severe misconceptions in the implementation approach at such a later stage has a very high cost. This means lots of rework, lost time, and waste. Regardless, we must do it.
    * ✅ ✅ ✅ Large benefit
    * ⛔️ ⛔️ ⛔️ Large cost


The first category of issues (#1) is a no brainer and hardly a contentious point. This is an obvious benefit of code reviews to improve code quality.

The last category (#3) is very painful and quite a blow to the team. To throw away and rework all the investment at such a late stage is painful. It’s a necessary evil that everyone can agree and, again, a clear benefit of code reviews.

The biggest problem and what concerns us the most were the middle category (#2) of issues. These missed opportunities lie *only* on the fact that the team caught these issues *too late*.

There reason these changes are so important relate with the [broken windows theory](https://en.wikipedia.org/wiki/Broken_windows_theory). There’s the *perception* that these benefits are marginal, but they compound over time. They end up becoming a tangled web inaccurate abstractions, faulty approaches and bad code. These are not straight forward to solve, especially in a time constrained project.

**Catching issues too late** is a good summary of the key problems we faced with code reviews.

Pair programming gives realtime feedback, since discussions happen *as people write the code*. Being used to that, all the waste illustrated above was more that the teams could handle.

## Our guiding principles

When we have conflict between people due to *practices we deem fundamental*, where do we draw the line?

All this adds tension and complexity to our ways of working. Working through these differences and find effective strategies, requires **compassion** between team members. 

More than specific *practices*, our focus should be in the *immutable principles* behind those practices. They set the stage and give context for the team’s choices.

These are the key foundational principles that were guiding our directions:

1. **Team-based ownership of the entire delivery**
   * At the technical level, this means more than one person understanding and caring for each piece of code written.
   * Not only the technical aspects (codebase, pipelines, observability) but also including roadmap, backlog, priorities, etc.
   * Several people together think better than a single one. Over time, this reflects in an increased quality of the code base.
2. **Include all the members of the team as equals**
   * It is usually said that whenever someone leaves or joins a team, it becomes a new team altogether.
   * Being a cohesive team implies welcoming the participation and voices of all its members.
   * Seek for “consent” and “acceptance” from the group, rather than aiming for the elusive “consensus” or “agreement” from everyone.

## A positive mix between both approaches

> I think both techniques are clearly a net *good*, although they each have their particular pros and cons.
>
> I don't think it's a matter of picking one over the other so much as **ensuring you have more than one pair of eyes looking at the code you've written**
>
> — [Jeff Atwood](https://blog.codinghorror.com/about-me/) in [Pair Programming vs. Code Reviews](https://blog.codinghorror.com/pair-programming-vs-code-reviews/)

How could we leverage the benefits of pair programming and avoid the flaws of async code reviews? Something that incorporates some of the learnings and key strengths of both approaches:

* Develop code with collaboration built-in from the start
* Avoid building a wasteful inventory of code changes pending review
* Make the review experience engaging and straightforward, with reduced cognitive load (as possible)

So we started doing what you can call a **“sandwich”** of both approaches:

* **Start** with a pair programming session for **technical kick-off** and code design/exploration
* **Continue** with individual **async development** and implementation
* **End** with a pair programming session for **code review** and discussion

In more detail, the story development workflow became:

1. Story kick-off with all the team’s disciplines[^fn-trios] involved (UX + PO + QA + DEVs)

    * Here we shape the user story acceptance criteria and scenarios.

2. Once it’s over, the DEVs (a pair or trio) would stay on for a technical kick-off

    * Here they discuss the actual technical design and implementation approaches
    * This implies going over the code base and exploring alternatives
    * Discuss modelling options (e.g. extend a class vs extract an interface), explore potential new patterns or structural refactoring, etc.

3. The solo DEV would move on and do the development as discussed with their colleagues in #2

4. Once it’s development finishes, it’s time for the code review

    * It’s now trivial to identify *who* should join the code review: those that were in the technical discussion in step #2 
    * They join the DEV implementing to walkthrough the code changes and discuss them

    * Depending if the changes are quite simple, if it remains aligned with the initial direction, then this could an async step
    

[^fn-trios]: Some people call this “3 amigos” but this is more like “all the amigos”. Every discipline in the team joins to discuss it together.

Notice that step #3 implies a good level of maturity from the solo DEV implementing the story. They need to reassemble with the people from the pairing kick-off in step #2 whenever the direction diverges:

* They face a roadblock or start entering a rabbit hole
* They realise the initial ideas are no longer valid with new discoveries
* The direction becomes impractical or turns out more complex than expected

The main takeaway is that the team must discuss technical approaches together, and the earlier this happens, the better. This approach promotes those discussions to happen much earlier than in async code review.

---

**So, does this mean more meetings?**

No, definitely not. These are work sessions. You start, work together, and finish when the group understands they're in a good place of understanding. It takes 30 min or several half days, depending on the complexity of the work at hand.

**Then it’s only for complex stories?**

Not at all. Do it for *every* user story, no matter how simple it seems at first. 

While complex stories need to involve the entire DEV team, simpler stories should only need one other developer. And if the story turns out to be very simple, them it’ll take only a few minutes and you’re done.

The most important factor is to build the habit muscle of doing it always. This will help you catch and avoid several blind spots and assumptions. Sometimes behind that seems simple hides a crucial decision when you start trading ideas with others.

**Does splitting up and coming together increase Work in Progress (WIP)?**  
*(by [Gerald Benischke](https://beny23.github.io/about/))*

It’s the same as if you’d be in an “async code review” model where each dev picks up a story individually.

If you switched an entire team doing pair programming into this model, then yes, WIP would increase since you’d now have single devs coding stories instead of pairs.

In our case though, we applied it only to the single dev mentioned in the story above. The two other pairs continued to do pair programming, so there was no significant change in WIP.

---

## Benefits of the “pairing code reviews” approach

To start with, the focus of the reviews became all about the “1. Finishes and polish”. Easy refactoring, practical renames, etc. which code reviews well suited for stayed.

The problems with “2. Marginal better structure” and “3. Wrong implementation approach” disappeared from the reviews. They’d either be all discussed at the start or along the way, close to when they became relevant.

Pairing at the time of code review also helped with the fluidity of the review. Since all had context, it was much easier to discuss and change the code as we went along. Much better than dealing with a lengthy back and forth of asynchronous interruptions.

It lifted the weight of constant pairing, for those who had difficulty with it or which the timezones did not permit. Because it happened only at clear distinct milestones in the development lifecycle, 

Also, it removed the feeling a being “evaluated”. It added a more collaborative mindset of working together, of building something together.

---

**There are no silver bullets for most things in life. Everything is a tradeoff. With this, you have one more useful approach to consider when your context needs it.**

---

Shared to:

* [LinkedIn](https://www.linkedin.com/posts/hugocf_pairing-reviews-bridging-the-gap-between-activity-7061741994934439936-2b9w)
* [Mastodon](https://mastodon.online/@hugocf/110339721804211796)
* [Medium](https://hugocf.medium.com/pairing-reviews-bridging-the-gap-between-pair-programming-and-code-reviews-781a1c6ba4bc)
* [Twitter](https://twitter.com/hugocf/status/1655976747760746510?s=20)

🔒 *(groups)*

* [Equal Experts Slack](https://equalexperts.slack.com/archives/DDVFQU1FZ/p1683651516481779)
* [iOS PT Slack](https://ios.slack.com/archives/C0721L3CL/p1683650827356959)
* [Telegram](https://t.me/c/1363309933/8770)
