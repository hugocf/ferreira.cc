---
date: 2024-05-29T11:15:37Z
lang: en
tags: [ unix, bash, styleguides, principles, tips, tricks, bugs, reference, how to ]
title: azet/community_bash_style_guide
type: link
---

[GitHub - azet/community_bash_style_guide: Community Bash Style Guide: writing useful and modern bash scripts, seriously.](https://github.com/azet/community_bash_style_guide)

> **When to use bash and when to avoid bash**
>
> it's rather simple:
>
> * does it need to glue userland utilities together? use bash.
> * does it need to do complex tasks (e.g. database queries)? use something else.
>
> Why? … It consumes a lot of time and is often very difficult to debug in comparison to dynamic programming languages such as python, ruby or even perl. You are simply going to waste valuable time, performance and nerve you could have spent better otherwise.

---

> **Style conventions**
>
> …
>
> * Thus, scripts should somewhat reflect the following general layout:
>
> ```
> #!/usr/bin/env bash
> #
> # AUTHORS, LICENSE and DOCUMENTATION
> #
> set -eu -o pipefail
> 
> Readonly Variables
> Global Variables
> 
> Import ("source scriptname") of external source code 
> 
> Functions
> …
> 
> Main
> …
> ```
> 

---

> **Use built in variable expansion instead of sed/awk**
>
> …
>
> same thing with string replacement.
>
> ```
> # ${VAR/PATTERN/STRING} # single replacement
> # ${VAR//PATTERN/STRING} # all match replacement
> # Use ${VAR#PATTERN} ${VAR%PATTERN} ${VAR/PATTERN} for string removal
>
> VAR=foofoobar
>${VAR/foo/bar} # barfoobar
> ${VAR//foo/bar} # barbarbar
>${VAR//foo} # bar
> ```
> 
> More examples and uses here: http://wiki.bash-hackers.org/syntax/pe *([Internet Archive 2023-04-08](https://web.archive.org/web/20230408142504/https://wiki.bash-hackers.org/syntax/pe))*


