---
date: 2012-08-16
lang: en
tags: [ architecture, best practices, clean code, development, mvc, software ]
title: "(image)"
type: image
---

![](https://hugo.ferreira.cc/wp-content/uploads/2012/08/tumblr_m8v54dIOud1qz82meo1_1280.jpg){width="772"
height="567"
srcset="https://hugo.ferreira.cc/wp-content/uploads/2012/08/tumblr_m8v54dIOud1qz82meo1_1280.jpg 772w, https://hugo.ferreira.cc/wp-content/uploads/2012/08/tumblr_m8v54dIOud1qz82meo1_1280-300x220.jpg 300w"
sizes="(max-width: 772px) 100vw, 772px"}

via [The Clean Architecture  |  8th
Light](http://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html)
by ["Uncle" Bob Martin](http://www.8thlight.com/our-team/robert-martin)

>
> The outer circles are mechanisms. The inner circles are policies.
>
> The overriding rule that makes this architecture work is *The
> Dependency Rule* . This rule says that *source code dependencies* can
> only point *inwards* .
>
> 1.  **Entities**
> 2.  **Use Cases**
> 3.  **Adapters** (Controllers, Gateways, Presenters)
> 4.  **Frameworks**

>
> **Only Four Circles?**
>
> No, the circles are schematic. You may find that you need more than
> just these four. There's no rule that says you must always have just
> these four.

>
> **What data crosses the boundaries.**
>
> Typically the data that crosses the boundaries is simple data
> structures.
>
> So when we pass data across a boundary, it is always in the form that
> is most convenient for the inner circle.

See also " *[I've noticed a surprising resistance to the idea.
Apparently the notion that it's a good idea to hide the framework, UI,
or database from the application code is not universally
accepted.](http://blog.8thlight.com/uncle-bob/2011/11/22/Clean-Architecture.html)
"*

**Update 2013-11-11:\
** See also this interesting series of posts about application
architecture, with illustrative examples in PHP: **[OOP Business
Applications --- Whitewashing\
](http://www.whitewashing.de/categories/php.html)**

1.  [Trying to escape the
    mess](http://whitewashing.de/2012/08/11/oop_business_applications__trying_to_escape_the_mess.html)
2.  **[Entity, Boundary, Interactor
    (EBI)](http://whitewashing.de/2012/08/13/oop_business_applications_entity_boundary_interactor.html)**
3.  [Data, Context, Interaction
    (DCI)](http://whitewashing.de/2012/08/16/oop_business_applications__data__context__interaction.html)
4.  [Command-Query-Responsibility-Segregation
    (CQRS)](http://whitewashing.de/2012/08/18/oop_business_applications__command_query_responsibility_seggregation.html)

[best
