---
date: 2018-02-23T01:04:29
lang: en
tags: [ virtualbox, info, tips, tricks, how to ]
title: VirtualBox
summary: Small information nuggets and recipies about VirtualBox
showToc: true
tocOpen: true
---

*(most recent on top)*

## Resize disk files

*`.vmdk` = VMWare disk*

1. [How to resize a VirtualBox vmdk file - Stack Overflow](https://stackoverflow.com/questions/11659005/how-to-resize-a-virtualbox-vmdk-file/12456219#12456219)
2. [Resize /dev/sda1 disk of your Vagrant / VirtualBox VM](https://tvi.al/resize-sda1-disk-of-your-vagrant-virtualbox-vm/)

```shell
cd ~/.minikube/machines/minikube/
```

*… from 1.*

```shell
VBoxManage clonehd "disk.vmdk" "cloned.vdi" --format vdi
VBoxManage modifyhd "cloned.vdi" --resize 15360 # = 15 * 1024
# 1. open VirtualBox
# 2. detach old `disk.vmdk`
# 3. delete old `disk.vmdk`
VBoxManage clonehd "cloned.vdi" "disk.vmdk" --format vmdk
```

*… from 2.*

```shell
# Follow the tutorial on how to use `gparted` to extend the 
# partition inside the disk and use the new unallocated space
```
