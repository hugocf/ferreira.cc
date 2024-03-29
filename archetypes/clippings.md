---
date: {{ .Date | dateFormat "2006-01-02T15:04:05" }}
draft: true
lang: en
tags: [ … ]
title: {{ .Name | humanize }}
type: audio chat image link quote text video
via: "[Who](http://example.com)"
---

<!-- audio -->

Context

{{<audio src="example.mp3" caption="Audio test file" title="Audio test file:" >}}

<!-- chat -->

> **Alice**: Question?
>
> **Bob**: Response
>
> *Something happens…*
>
> **Alice**: Question?
>
> **Bob**: Response

<!-- image -->

{{< figure src="example.jpg" alt="example description" caption="Example caption" link="http://example.com" attr="(source)" attrlink="http://example.com" >}}

> Snippet

<!-- link -->

[Page title](http://example.com)

> Snippet

<!-- quote -->

> Quote with citation.
>
> — <cite>Author</cite> in <cite>[Source](http://example.com)</cite>

<!-- text -->

Context

> Snippet

<!-- video -->

{{< youtube id="OCWj5xgu5Ng?start=10" title="Blank Video Placeholder (HD)" >}}

&nbsp;

{{< vimeo id="38772314#t=10s" title="Blank Video Placeholder (HD)" >}}

> Snippet
