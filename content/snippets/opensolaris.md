---
date: 2011-07-15
lang: en
tags: [ opensolaris, info, tips, tricks, how to ]
title: OpenSolaris
summary: Small information nuggets and recipies about OpenSolaris
showToc: true
tocOpen: true
---

*(most recent on top)*

## Joyent quick guide

* [Cheat-sheet: Useful Shell Commands [Joyent Wiki]](http://wiki.joyent.com/accelerators:kb:shell-cheatsheet)

> * Disk free, listed in Gig `df -ht`
> * Good view of both processor and memory statistics `prstat -Z -s cpu`
> * Processes currently running `ps -elf`
> * Admin user processes `ps -uadmin -o pcpu,user,pid,args,comm,s`
> * Another Admin user process list `ps -uadmin -o user,args,pcpu,pmem,vsz,time,comm`
> * Mysql user processes `ps -umysql -o pcpu,vsz,osz,args,comm,s`
> * True Virtual memory usage on [S or M size](https://web.archive.org/web/20100115191521/http://discuss.joyent.com/viewtopic.php?pid=146936#p146936) `prstat -Z`
> * True Virtual memory usage on [Shared Solaris Hosting](https://web.archive.org/web/20100115191521/http://discuss.joyent.com/viewtopic.php?pid=146936#p146936) `prstat -J`
> * Virtual memory statistics `vmstat 5 5`
> * Swap disk status (Solaris) `swap -l`
> * Report per processor statistics `mpstat 5 5 or psrinfo`
> * A site with some useful commands: <http://www.rocket99.com/unix/unix1.html>

## Show accelerator id

```shell
zonename
```

## Show cpu info

```shell
psrinfo -v
```

## Info about processes and zones

*… column RSS = memory*

```shell
prstat -Z
```

## Service management

```shell
svcs -a                     # status of all the services
svcs -vx                    # what is not running but should
svcs -x name                # details on a specific service name
svcadm action name          # enable|disable|restart a service by name
```
