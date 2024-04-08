---
date: 2023-09-17T00:24:30Z
lang: en
tags: [ chrome, emoji, unicode, rendering, issues ]
title: Google Chrome issue rendering emoji as unicode
type: text
---

[Chrome does not render emoji in color when using sans-serif font-face](https://stackoverflow.com/q/70705389)

![rendering example showing emoji rendering as plain unicode in sans-serif font](https://i.stack.imgur.com/aquHX.png)

---

There could be a workaround…

> UTF has special characters to control the rendering. `U+FE0E` asks OS and browser to render the previous glyph as text, `U+FE0F` asks to render the previous glyph as emoji.
>
> — Nikita Dubko in [Prevent text glyphs from turning into emojis](https://mefody.dev/chunks/emoji-to-text/)

… but another bug in Chrome prevent is from working

[964527 - Chrome often ignores emoji and text variation selectors U+FE0F and U+FE0E - chromium](https://bugs.chromium.org/p/chromium/issues/detail?id=964527)

---

See also lots details about rendering emoji by [Nikita Prokopov](https://tonsky.me/about/) in [Emoji under the hood @ tonsky.me](https://tonsky.me/blog/emoji/).
