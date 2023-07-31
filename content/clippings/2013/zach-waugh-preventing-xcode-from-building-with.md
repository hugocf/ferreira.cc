---
date: 2013-08-31
lang: en
tags: [ code, development, ios, mobile ]
title: "Zach Waugh: Preventing Xcode from building with #error"
type: link
---

[Zach Waugh: Preventing Xcode from building with
#error](http://blog.zachwaugh.com/post/59312562596/preventing-xcode-from-building-with-error)

[zachwaugh](http://blog.zachwaugh.com/post/59312562596/preventing-xcode-from-building-with-error):

> (...) I wanted Xcode to not even build the app if conflicting
> conditions were enabled. I came across the ` #error ` preprocessor
> directive which does exactly that, and can be used like this:
>
>           #if defined(APP_STORE) && defined(BETA)
>     #error Beta enabled for App Store build!
>     #endif
>          

