---
date: 2016-01-10
lang: en
tags: [ css, info, tips, tricks, how to ]
title: CSS
summary: Small information nuggets and recipies about CSS
showToc: true
tocOpen: true
---

*(most recent on top)*

## Show link address when printing

* [CSS Content | CSS-Tricks](http://css-tricks.com/css-content/)

```css
@media print {
    a:after {
        content: " (" attr(href) ") ";
    }
}
```
