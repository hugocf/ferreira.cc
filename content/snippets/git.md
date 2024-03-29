---
date: 2020-10-12T01:03:51
lang: en
tags: [ git, info, tips, tricks, how to ]
title: Git
summary: Small information nuggets and recipies about Git
showToc: true
tocOpen: true
---

See also:

> So here are some bad situations I've gotten myself into, and how I eventually got myself out of them *in plain english*.
>
> — [Oh Shit, Git!?!](https://ohshitgit.com)

---

*(most recent on top)*

## Configure separate Git users for different repos

* via [Aleksander Sumowski](https://app.slack.com/team/UMGKV4QKH)

*… `~/.gitconfig`*

```properties
[user]
  name = First Last
  email = personal@example.org

[includeIf "gitdir:~/work/"]
  path = ~/work/.gitconfig
```

*… `~/work/.gitconfig`*

```properties
[user]
  email = work@example.com
```

## Revert changes of a single file of a commit

* via [Michael Brown](https://ios.slack.com/archives/C6DSYLCGZ/p1568122893055200)

```bash
git show <commit> -- some_file.c | git apply -R
```

## Manually ignore changes to a tracked file or directory

* [Git: Ignore changes to already-tracked files | Wildly Inaccurate](https://wildlyinaccurate.com/git-ignore-changes-in-already-tracked-files/)

*… stop tracking*

```bash
git update-index --assume-unchanged <file>
```

*… resume tracking*

```bash
git update-index --no-assume-unchanged <file>
```

## Rebase a topic branch into anywhere you want

* [Undoing a git rebase - Stack Overflow](https://stackoverflow.com/questions/134882/undoing-a-git-rebase/137363#137363)

*… `topic` info `master` (run from any branch)*

```bash
git rebase master topic                     # default is HEAD of master
git rebase master topic --onto commit
```

## Change the committer and author names

* [version control - How to change the author and committer name and e-mail of multiple commits in Git? - Stack Overflow](https://stackoverflow.com/questions/750172/how-to-change-the-author-and-committer-name-and-e-mail-of-multiple-commits-in-gi/1320317#1320317)

*… set default repo user*

```bash
git config user.name "User Name"
git config user.email user@example.com
```

*… author = **default**, committer = **default***

```bash
git commit --amend --no-edit --reset-author
```

*… author = **custom**, committer = **default***

```bash
git commit --amend --no-edit --author "Author Name <author@example.com>"
```

*… author = same, committer = **custom***

```bash
git -c user.name="Committer Name" -c user.email=committer@example.com commit --amend --no-edit
```

*… in many commits*

```bash
git rebase -i -p
# mark as: edit
# repeat as above
```

## Fixup commits and autosquash rebases

* [Auto-squashing Git Commits](https://robots.thoughtbot.com/autosquashing-git-commits)

*… create*

```bash
# squash fixed commit; prefixes message with "squash! "
git commit --squash e37dc68
```

```bash
# fixup relative commit; prefixes message with "fixup! "
git commit --fixup @~1
```

```bash
# fixup commit with string; prefixes message with "fixup! "
git commit --fixup :/foobar
```

*… apply*

```bash
# auto reorganises the squash/fixup and moves them to the right place
git rebase -i --autosquash
```

```bash
# makes it the default for all rebases
git config --global rebase.autosquash true
```

## Find broken commit

```bash
git bisect start <bad> <good>
```

*… example*

```bash
git bisect start @ origin/master
git bisect run bin/test.sh
```

## Detect which folders are affected by the latest commits (monorepo)

* via [Equal Experts](https://github.com/EqualExperts/ee-budget-app/blob/master/Jenkinsfile#L12)

```bash
git diff-tree --no-commit-id --name-only HEAD tag
```

## Delete remote branch or tag

* [How to delete a Git branch both locally and remotely? - Stack Overflow](http://stackoverflow.com/a/2003515/1380781)

*… as of v1.7*

```bash
git push origin --delete <branch_name>
git push origin --delete <tag_name>
```

*… before that*

```bash
git push origin :<branch_name>
```

## Differences between local and upstream

* via [Akshay on Twitter: "@tpope It was released around git v2.0 I think. It’s been nice to use: git diff @..@{u} to diff the local and the upstream branches."](https://twitter.com/ajh_17/status/673000158573944832)

```bash
git diff @{u}..@
```

## The `@` sign is an alias for `HEAD`

* [Tim Pope on Twitter: "whoa nice, @ is an alias for HEAD in git now git show @^"](https://twitter.com/tpope/status/671724545125040128)

```bash
git show @
git show @~2
```

## Change a commit original author date

* [How can one change the timestamp of an old commit in Git? - Stack Overflow](https://stackoverflow.com/questions/454734/how-can-one-change-the-timestamp-of-an-old-commit-in-git)
* [Update git commit author date when amending - Stack Overflow](https://stackoverflow.com/questions/9110310/update-git-commit-author-date-when-amending)

*… set author date*

```bash
git commit --amend --no-edit --date="Sun Dec 31 12:34:56 2017"
```

*… set committer date + author date*

```bash
GIT_COMMITTER_DATE="Sun Dec 31 23:45:00 2017" git commit --amend --no-edit --date="Sun Dec 31 23:45:00 2017"
```

*… set committer date = author date*

```bash
GIT_COMMITTER_DATE="Mon May 7 23:54:$(echo $((RANDOM % 50 + 10)) | cut -c-2) 2018" bash -c 'git commit --amend --no-edit --date="$GIT_COMMITTER_DATE"'
```

*… random seconds*

```bash
echo $((RANDOM % 50 + 10)) | cut -c-2
```

*… see also custom function shell [`git-commit-dates()`](https://github.com/hugocf/dotfiles/blob/a64f9b1/bash/bash_aliases#L55-L64)*

## Rebase commits to reset commit date to the original author date

* [git rebase without changing commit timestamps - Stack Overflow](http://stackoverflow.com/questions/2973996/git-rebase-without-changing-commit-timestamps/2976598#2976598)

```bash
git rebase --committer-date-is-author-date @~3
```

## Auto stash dirty directory on pull/rebase

* via [Anil Wadghule](https://equalexperts.slack.com/archives/today-i-learned/p1466446425000002)

*… autostash is only available since git version 2.9*

```bash
git pull --rebase --autostash
```

*… for earlier versions use:*

```bash
git config --global rebase.autoStash true
```

## Check lightweight vs. annotated tags

* [Git - Tagging#Annotated Tags](http://git-scm.com/book/en/v2/Git-Basics-Tagging#Annotated-Tags)

*… **annotated**: “You can see the tag data along with the commit that was tagged by using the* *git show* *command”*

```bash
$ git show annotated-tag
tag annotated-tag
Tagger: Hugo Ferreira <hugo@ferreira.cc>
Date:   Thu Dec 24 10:54:15 2015 +0000

message text with details

commit 6ec10ad250c8bbbdc42dba51a09c02b456e02187 (tag: annotated-tag)
Author: Hugo Ferreira <hugo.ferreira@digital.hmrc.gov.uk>
Date:   Thu Dec 24 10:23:50 2015 +0000
```

*… **lightweight**: “This time, if you run* *git show* *on the tag, you don’t see the extra tag information. The command just shows the commit”*

```bash
$ git show light-tag
commit f5d32c57c9612c610dc0c45cc0ff3f0b1d21fd53 (HEAD -> master, tag: light-tag)
Author: Hugo Ferreira <hugo@ferreira.cc>
Date:   Thu Dec 24 10:25:44 2015 +000
```

## Set user & email info

*… current repo only `.git/config`*

```bash
git config user.name "Hugo Ferreira"
git config user.email hugo.ferreira@example.com
```

*… default for all repos `~/.gitconfig`*

```bash
git config --global user.name "Hugo Ferreira"
git config --global user.email hugo.ferreira@example.com
```

## Prepare a patch formatted for email

```bash
git format-patch HEAD~1
git format-patch <sha>..@
```

## Apply a patch received as file

*… dry-run*

```bash
git apply --check --stat 0001-file.patch
```

*… apply and create commits*

```bash
git am 0001-file.patch
```

*… apply patch to files*

```bash
# files only
git apply 0001-file.patch
```

```bash
# files + index
git apply --index 0001-file.patch
```

```bash
# index only
git apply --cached 0001-file.patch
```

## Show files being ignored

* [Show ignored files in git - Stack Overflow](http://stackoverflow.com/a/467053/1380781)

```bash
git clean --dry-run -dX
```

```bash
git clean -ndX
```

## Choose a new root commit for the repo

* [git rebase - Change first commit of project with Git? - Stack Overflow](http://stackoverflow.com/questions/2246208/change-first-commit-of-project-with-git/14629246#14629246)

```bash
git rebase -i --root
```

## Visualise the entire commit graph

```bash
git log --graph --oneline --all --color --decorate
```

## Rollback the last commit for good

```bash
git reset HEAD~1 --hard
```

## Undo a rebase

* [Git how to rollback a rebase - Stack Overflow](https://stackoverflow.com/questions/41049711/git-how-to-rollback-a-rebase/41049867#41049867)

*… show the history of operations (like an “undo” stack)*

```bash
$ git reflog
b710729 HEAD@{0}: rebase: some commit
5ad7c1c HEAD@{1}: rebase: another commit
deafcbf HEAD@{2}: checkout: moving from master to my-branch
```

*… reset to the commit before the rebase*

```bash
git reset --hard deafcbf
```

## Recover lost commits

* [git ready » restoring lost commits](http://gitready.com/advanced/2009/01/17/restoring-lost-commits.html)

*… discover*

```bash
git fsck --lost-found
```

```bash
git reflog
```

```bash
git show <sha1>
```

*… restore*

```bash
git cherry-pick <sha1>
```

```bash
git merge <sha1>
```

## Show outgoing changes

```bash
git fetch && git whatchanged origin..
```

## Show incoming changes

```bash
git fetch && git whatchanged ..origin
```

## `git-flow` rules of engagement for releases (merge commit) messages

*… setup*

```bash
git config --global merge.log true
```

*… default message*

```bash
Merge branch 'release/1.0.0'

* develop:
  One commit message
  Another commit message
```

*… edit: commit message (merge)*

```bash
Merge branch 'release/1.0.0'

- One commit message
- Another commit message
```

*… edit: tag message (releases)*

```bash
release/1.0.0

- One commit message
- Another commit message
```
