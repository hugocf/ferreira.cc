---
date: 2017-03-29T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


[https://benmccormick.org/2017/03/28/the-mystery-of-docker-and-the-disk-eating-cow/](https://benmccormick.org/2017/03/28/the-mystery-of-docker-and-the-disk-eating-cow/)

2017-03-29 via Spike Lindsey
https://equalexperts.slack.com/archives/tech-community/p1490772251345367

tl;dr: run `ls -lah ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2`, there’s probably a ridiculously large file there, you can delete it safely but it will wipe all your images

https://equalexperts.slack.com/archives/tech-community/p1490775925934734
>Docker prune is also a good way to claim back disk https://docs.docker.com/engine/reference/commandline/system/

—//—

Maybe not???
