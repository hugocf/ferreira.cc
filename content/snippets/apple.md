---
aliases:
- ios
- macos
date: 2023-01-01
description: Small information nuggets and recipies about Apple
lang: en
tags: [ apple, ios, macos, info, tips, tricks, how to ]
title: Apple
showToc: true
tocOpen: true
tocSide: right
---

<!--more-->

*(most recent on top)*

## Link to Notes

* To find out the id of a Note use shortcut [Get URL of Note](https://showcuts.app/share/view/e370c4eacc7441a18e7ec95667b2e32f) (via [iBanks3](https://www.reddit.com/r/shortcuts/comments/aot272/get_url_of_note_copy_note_url_to_clipboard))

1. Run shortcut **Get URL of Note**
2. Enter node `Note` and check the `LNEntity` Supported Type to get the UUID, e.g.:

    ```xml
    <LNEntity: 0x123456789, identifier: NoteEntity/applenotes:note/12345678-abcd-bcde-cdef-123456789012, ...
    ```

    <mark>➔`12345678-abcd-bcde-cdef-123456789012`</mark>

3. Convert the UUID to ALL CAPS (*for example, using [Convert Case](https://convertcase.net/) or the **Pages** app*)

    <mark>➔`12345678-ABCD-BCDE-CDEF-123456789012`</mark>

4. Append it to the url sheme to open Notes:

    <mark>➔`applenotes://showNote?identifier=12345678-ABCD-BCDE-CDEF-123456789012`</mark>

---

*Note*: Sometimes you might get the following error:

> **An error occurred while running Get URL of Note**  
> Couldn't communicate with a helper application.

I haven’t found any way around it other than trying again some other time 🤷‍♂️ — restarts haven’t helped at all.
