---
date: 2023-12-20
lang: en
tags: [ unicode, languages, rationale, explanation ]
title: "Unicode Zero-Width Characters"
type: link
via: "[Deepam Gupta](https://stackoverflow.com/questions/9868796/how-to-display-hidden-characters-by-default-zero-width-space-ie-8203/9872584#comment119483329_9868796)"
---

[The Beauty of Unicode: Zero-Width Characters](https://ptiglobal.com/the-beauty-of-unicode-zero-width-characters/)

> Did you know that there are five characters that have zero width? What could be their purpose? Let’s sort it out…

See examples in the linked article.

---

> **Zero-width space (U+200B)**
>
> The zero-width space can be used to enable line wrapping in long words, when using languages that don’t use spaces to separate words, or after certain characters like a slash /. Most applications treat the zero-width space like a regular space for word wrapping purposes, even though it is not visible.

---

> **Zero-width non-joiner (U+200C)**
>
> The zero-width non-joiner is a non-printing character used in writing systems that make use of ligatures. When placed between two characters that would otherwise be combined into a ligature, a zero-width non-joiner tells the font engine not to combine them.

---

> **Zero-width joiner (U+200D)**
>
> The zero-width joiner is essentially the opposite of the zero-width non-joiner. When placed between two characters that would otherwise not be connected, a zero-width joiner causes them to be printed in their connected forms (if they have one).

---


> **Word joiner (U+2060)**
>
> The word joiner, used in language scripts that don’t use spaces, prevents a line break between two characters, which can be useful to manually control sentence breaking in applications that don’t know how to properly wrap text in some languages. Its function is identical to the zero-width no-break space.

---

> **Zero-width no-break space (U+FEFF)**
>
> The zero-width no-break space is no longer to be used for its original purpose. Character U+FEFF should solely be used as a Byte Order Mark at the start of a Unicode text file. To keep lines from breaking between two characters, the word joiner (above) should be used instead.
