---
date: 2014-03-18T07:07:28Z
lang: en
tags: [ best practices, development, java, kata, tdd, tpp, unit testing ]
title: "Transformation Priority Premise"
type: video
---

Uncle Bob Martin walks through the "Prime Factors" kata in Java ([29m06s](http://www.youtube.com/watch?v=B93QezwTQpI#t=20m06s)) to illustrate the concept of [Transformation Priority Premise](http://blog.8thlight.com/uncle-bob/2013/05/27/TheTransformationPriorityPremise.html) as a way to address the common complaint about TDD: *the brainlessness*

> "As the tests get more specific, the code gets more generic."

... and "[here's the list of transformations](http://www.youtube.com/watch?v=B93QezwTQpI#t=47m53s)" ([47m53s](http://www.youtube.com/watch?v=B93QezwTQpI#t=47m53s)):

> So what are these transformations? Perhaps we can make a list of them:
>
> 1.  **({}--\>nil)** no code at all-\>code that employs nil
> 2.  **(nil-\>constant)**
> 3.  **(constant-\>constant+)** a simple constant to a more complex
>     constant
> 4.  **(constant-\>scalar)** replacing a constant with a variable or an
>     argument
> 5.  **(statement-\>statements)** adding more unconditional statements.
> 6.  **(unconditional-\>if)** splitting the execution path
> 7.  **(scalar-\>array)**
> 8.  **(array-\>container)**
> 9.  **(statement-\>recursion)**
> 10. **(if-\>while)**
> 11. **(expression-\>function)** replacing an expression with a
>     function or algorithm
> 12. **(variable-\>assignment)** replacing the value of a variable.
>
> There are likely others.

... and, the process:

> If we accept the Priority Premise, then we should amend the typical
> `red-green-refactor` process of TDD with the following provision:
>
> -   When passing a test, prefer higher priority [*simpler*]
>     transformations.
> -   When posing a test choose one that can be passed with higher
>     priority [*simpler*] transformations.
> -   When an implementation seems to require a low priority
>     transformation, backtrack to see if there is a simpler test to
>     pass.

( Source: <https://www.youtube.com/> )

