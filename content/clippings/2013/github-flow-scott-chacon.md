---
date: 2013-08-29
lang: en
tags: [ branch, deployment, development, git, model, workflow ]
title: "GitHub Flow -- Scott Chacon"
type: link
---

[GitHub Flow -- Scott
Chacon](http://scottchacon.com/2011/08/31/github-flow.html)

> So, what is GitHub Flow?
>
> -   Anything in the master branch is deployable
> -   To work on something new, create a descriptively named branch off
>     of master (ie: ` new-oauth2-scopes ` )
> -   Commit to that branch locally and regularly push your work to the
>     same named branch on the server
> -   When you need feedback or help, or you think the branch is ready
>     for merging, open a [pull
>     request](http://help.github.com/send-pull-requests/)
> -   After someone else has reviewed and signed off on the feature, you
>     can merge it into master
> -   Once it is merged and pushed to 'master', you can and *should*
>     deploy immediately

> For teams that have to do formal releases on a longer term interval (a
> few weeks to a few months between releases), and be able to do
> hot-fixes and maintenance branches and other things that arise from
> shipping so infrequently,
> [git-flow](http://nvie.com/posts/a-successful-git-branching-model/)
> makes sense and I would highly advocate it's use.
>
> For teams that have set up a culture of shipping, who push to
> production every day, who are constantly testing and deploying, I
> would advocate picking something simpler like GitHub Flow.

