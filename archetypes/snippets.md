---
date: {{ .Date | dateFormat "2006-01-02" }}
draft: true
lang: en
tags: [ {{ .Name | lower }}, info, tips, tricks, how to ]
title: {{ .Name | humanize }}
showToc: true
tocOpen: true
tocSide: right
---

<!--more-->

*(most recent on top)*

## What this thing does

- [Example link](http://example.com)

```text     # https://gohugo.io/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages
# the
# code
# snippet
```

## What another thing does

- [Example link](http://example.com)

*… section*

```text     # https://gohugo.io/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages
# one code snippet
```

*… section*

```text     # https://gohugo.io/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages
# another code snippet
```
