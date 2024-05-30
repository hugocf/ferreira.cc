---
date: 2017-05-12T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


[https://www.devmynd.com/blog/five-factor-testing/](https://www.devmynd.com/blog/five-factor-testing/)

2017-05-12 via Franziska Sauerwein
https://softwarecraftsmanship.slack.com/archives/C0A8LF46S/p1494569798014539

> 1. Verify the code is working correctly
> 2. Prevent future regressions
> 3. Document the code’s behavior
> 4. Provide design guidance

Designing the interface for a piece of code is a delicate tightrope walk between specificity (solving the problem you have right now) and generality (solving a more general class of problems, with a eye to reusing the code elsewhere). 

Specific code is usually simpler in the now, but harder to evolve later. 

Generalized code usually adds some complexity now that is not strictly required to solve the current problem, in return for being easier to evolve later.

(…)

Using code in two contexts by writing a test for it means you build in a tiny bit of generality beyond what you specifically need in your primary client. It may be almost imperceptible, but importantly, it’s *not* speculative — in other words, you don’t risk going too far and building in generality that obscures meaning and that you probably won’t use.

> 5. Support refactoring

*The only constant in software is change*
