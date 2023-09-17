---
date: {{ .Date | dateFormat "2006-01-02" }}
draft: true
description: Small information nuggets and recipies about {{ .Name | humanize }}
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

*… notes*

```text     # https://gohugo.io/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages
# one code snippet
```

*… notes*

```text     # https://gohugo.io/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages
# another code snippet
```

## What something else does

- [Example link](http://example.com)

### Section

```text     # https://gohugo.io/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages
# one code snippet
```

### Section

```text     # https://gohugo.io/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages
# another code snippet
```