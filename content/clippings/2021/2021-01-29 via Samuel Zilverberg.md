---
date: 2021-01-29T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---
2021-01-29 via Samuel Zilverberg
https://springernature.slack.com/archives/C0R5SM347/p1611905819056600?thread_ts=1611857802.053700&ampchannel=C0R5SM347&ampmessage_ts=1611905819.056600


Interesting pitfalls of the `BigDecimal` class in Java:


```java
BigDecimal(900.00) == BigDecimal(&quot900") // true
```


and yet:


```java
BigDecimal(900) == BigDecimal(&quot900.00") // false
```


TODO: tldr the problems and solutions of what to do


<https://blogs.oracle.com/javamagazine/four-common-pitfalls-of-the-bigdecimal-class-and-how-to-avoid-them?source=:em:nw:mt:::RC:WWMK200429P00043:NSL400088260&elq_mid=172769&sh=162609181316181313222609291604350235&cmid=WWMK200429P00043C0008>

