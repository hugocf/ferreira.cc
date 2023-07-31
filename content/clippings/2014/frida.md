---
date: 2014-01-24
lang: en
tags: [ development, injection, inspection, ios, linux, osx, tool, windows ]
title: "Frida"
type: link
---

[Frida](http://www.frida.re/)

> Inject JavaScript to explore native apps on Windows, Mac, Linux and
> iOS.
>
> **Scriptable**
>
> Your own scripts get injected into black box processes to execute
> custom debugging logic. Hook any function, spy on crypto APIs or trace
> private application code, no source code needed!
>
> **Stalking**
>
> Stealthy code tracing without relying on software or hardware
> breakpoints. Think [DTrace](http://en.wikipedia.org/wiki/DTrace) in
> user-space, based on dynamic recompilation, like
> [DynamoRIO](http://www.dynamorio.org/) and
> [PIN](http://software.intel.com/en-us/articles/pin-a-dynamic-binary-instrumentation-tool)
> .
>
> **Quick-start Instructions**
>
>           ~ $ sudo easy_install frida
>           
>
>           ~ $ frida-trace -i 'recv*' Skype
>           
>
>           recvfrom: Auto-generated handler: …/recvfrom.js
>           
>
>           Started tracing 21 functions.
>           
>
>           1442 ms recvfrom()
>           
>
>           # Live-edit recvfrom.js and watch the magic!
>           
>
>           5374 ms recvfrom(socket=67, buffer=0x252a618, length=65536, flags=0, address=0xb0420bd8, address_len=16)
>          

