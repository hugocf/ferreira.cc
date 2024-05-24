---
date: 2024-05-24T10:55:11Z
lang: en
tags: [ tools, programming, Kotlin, architecture, testing, rules, validation ]
title: LemonAppDev/konsist
type: link
via: "[Igor Wojda](https://kotlinconf.com/speakers/1db23323-e852-4faa-87e3-94d5f05d0b96/)"
---

[GitHub - LemonAppDev/konsist: Konsist is a powerful static code analyzer tailored for Kotlin, focused on ensuring codebase consistency and adherence to coding conventions.](https://github.com/LemonAppDev/konsist)

> Konsist is a powerful static code analyzer tailored for Kotlin, focused on ensuring codebase consistency and adherence to coding conventions.

---

> Konsist is a linter that guards the consistency of [Kotlin](https://kotlinlang.org/) projects by enforcing a cohesive code structure and unified architecture. Konsist guards are written in the form of unit tests ([JUnit](https://junit.org/) / [Kotest](https://kotest.io/)).
>
> …
>
> ```kotlin
> @Test
> fun `clean architecture layers have correct dependencies`() {
>     Konsist
>         .scopeFromProduction()
>         .assertArchitecture {
>             // Define layers
>             val domain = Layer("Domain", "com.myapp.domain..")
>             val presentation = Layer("Presentation", "com.myapp.presentation..")
>             val data = Layer("Data", "com.myapp.data..")
> 
>             // Define architecture assertions
>             domain.dependsOnNothing()
>             presentation.dependsOn(domain)
>             data.dependsOn(domain)
>         }
> }
> ```

