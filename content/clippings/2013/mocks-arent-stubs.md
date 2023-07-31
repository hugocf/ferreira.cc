---
date: 2013-10-24
lang: en
tags: [ bdd, development, reference, software, tdd, testing ]
title: "Mocks Aren't Stubs"
type: link
---

[Mocks Aren't
Stubs](http://martinfowler.com/articles/mocksArentStubs.html)

> Meszaros uses the term **Test Double** as the generic term for any
> kind of pretend object used in place of a real object for testing
> purposes. The name comes from the notion of a Stunt Double in movies.
> (...) Meszaros then defined four particular kinds of double:
>
> -   **Dummy** objects are passed around but never actually used.
>     Usually they are just used to fill parameter lists.
> -   **Fake** objects actually have working implementations, but
>     usually take some shortcut which makes them not suitable for
>     production (an in memory database is a good example).
> -   **Stubs** provide canned answers to calls made during the test,
>     usually not responding at all to anything outside what's
>     programmed in for the test. Stubs may also record information
>     about calls, such as an email gateway stub that remembers the
>     messages it 'sent', or maybe only how many messages it 'sent'.
> -   **Mocks** are what we are talking about here: objects
>     pre-programmed with expectations which form a specification of the
>     calls they are expected to receive.

> The **classical TDD** style is to use real objects if possible and a
> double if it's awkward to use the real thing. So a classical TDDer
> would use a real warehouse and a double for the mail service. The kind
> of double doesn't really matter that much.
>
> A **mockist TDD** practitioner, however, will always use a mock for
> any object with interesting behavior. In this case for both the
> warehouse and the mail service.

