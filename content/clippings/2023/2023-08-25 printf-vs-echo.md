---
date: 2023-08-25T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


# 2023-08-25 printf-vs-echo
* Add also to unix snippets, linking here

via [`bats-core` Contributing Guidelines](https://github.com/bats-core/bats-core/blob/master/docs/CONTRIBUTING.md#generating-output)

[https://unix.stackexchange.com/questions/65803/why-is-printf-better-than-echo](https://unix.stackexchange.com/questions/65803/why-is-printf-better-than-echo)

**So what that means is that you can't use echo to display uncontrolled data. In other words, if you're writing a script and it is taking external input (from the user as arguments, or file names from the file system...), you can't use echo to display it.**

This is OK:
echo >&2 Invalid file.
This is not:
echo >&2 "Invalid file: $file"

printf, on the other hand, is more reliable, at least when it's limited to the basic usage of echo.
printf '%s\n' "$var"
Will output the content of $var followed by a newline character regardless of what character it may contain.
printf '%s' "$var"
Will output it without the trailing newline character.

