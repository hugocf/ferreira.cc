---
date: 2019-09-06T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


2019-09-06 via André Bergonse
https://naspersclassifieds.slack.com/archives/CL1LCQ03D/p1567725890023900

> This documentation is the canonical description of Google’s code review processes and policies.
>
> This page is an overview of our code review process. There are two other large documents that are a part of this guide:
>
> * [How To Do A Code Review](https://google.github.io/eng-practices/review//reviewer/): A detailed guide for code reviewers.
> * [The CL Author’s Guide](https://google.github.io/eng-practices/review//developer/): A detailed guide for developers whose CLs are going through review.
[https://google.github.io/eng-practices/review//](https://google.github.io/eng-practices/review//)

> In doing a code review, you should make sure that:
> * The code is well-designed.
> * The functionality is good for the users of the code.
> * Any UI changes are sensible and look good.
> * Any parallel programming is done safely.
> * The code isn’t more complex than it needs to be.
> * The developer isn’t implementing things they **might** need in the future but don’t know they need now.
> * Code has appropriate unit tests.
> * Tests are well-designed.
> * The developer used clear names for everything.
> * Comments are clear and useful, and mostly explain **why** instead of **what**.
> * Code is appropriately documented (generally in g3doc).
> * The code conforms to our style guides.
>
> Make sure to review ****every line**** of code you’ve been asked to review, look at the ****context****, make sure you’re ****improving code health****, and compliment developers on ****good things**** that they do.

> … what’s the most efficient way to manage a review that’s spread across multiple files?
>
> 1. Step One: Take a broad view of the change
> 2. Step Two: Examine the main parts of the CL
> 3. Step Three: Look through the rest of the CL in an appropriate sequence

> How to write code review comments:
>

> * Be kind.
> * Explain your reasoning.
> * Balance giving explicit directions with just pointing out problems and letting the developer decide.
> * Encourage developers to simplify code or add code comments instead of just explaining the complexity to you.

> ****Improving code health tends to happen in small steps.****

> … because they have a lot of work to do and the cleanup gets lost or forgotten in the press of other work. Thus, it is usually best to insist that the developer clean up their CL **now**, before the code is in the codebase and “done.” Letting people “clean things up later” is a common way for codebases to degenerate.

> If you previously had fairly lax code reviews and you switch to having strict reviews, some developers will complain very loudly. Improving the [_speed]__(_https://google.github.io/eng-practices/review/reviewer/speed.html_)_ of your code reviews usually causes these complaints to fade away.

