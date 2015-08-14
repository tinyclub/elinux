> 原文: [eLinux.org](http://eLinux.org/Soft_IRQ_Threads "http://eLinux.org/Soft_IRQ_Threads")
> 翻译：[@hduffddybz](https://github.com/hduffddybz) 
> 校订：[]()

# 软中断线程



## 目录

-   [1 简介](#introduction)
    -   [1.1 LKML 讨论](#lkml-discussions)
        -   [1.1.1 Time Sys 的补丁](#time-sys-patch)
        -   [1.1.2 Korty 的补丁](#korty-patch)
    -   [1.2 基本原理](#rationale)
-   [2 下载](#downloads)
    -   [2.1 补丁](#patch)
    -   [2.2 实用程序](#utility-programs)
-   [3 如何使用](#how-to-use)
-   [4 样本结果](#sample-results)
-   [5 未来工作](#future-work)

## Introduction

这个页面描述了 [软
中断](http://eLinux.org/index.php?title=Soft_IRQ&action=edit&redlink=1 "Soft IRQ (page does not exist)")
线程，这是一种将一些中断的底半部分来用内核线程来执行的机制，这样就能跟其他线程或进程一样
划分到相同的调度类。


### LKML 讨论

最近(2004 年 7 月)，两个关于软中断线程补丁被提交到 Linux 内核。

#### [Time Sys](http://eLinux.org/Time_Sys "Time Sys") 的补丁

阅读
[http://lkml.org/lkml/2004/7/13/125](http://lkml.org/lkml/2004/7/13/125)

该补丁适用于 2.6.8-mm1 内核，一个 PPC 特性被拒绝。

#### Korty 的补丁

阅读
[http://lkml.org/lkml/2004/7/13/152](http://lkml.org/lkml/2004/7/13/152)

### 基本原理

该特性十分重要因为它允许 [软
中断](http://eLinux.org/index.php?title=Soft_IRQ&action=edit&redlink=1 "Soft IRQ (page does not exist)")
以比实时线程更低的优先级来调度。
这会使 Linux 有更好的实时处理能力。

## 下载

### 补丁

    - [Patch for CELF version XXXXXX is *here*]
    - [Patch for 2.4.xx is *here*]
    - [Patch for 2.6.xx is *here*]

### 实用程序

无

## 如何使用

[这部分要填补]

## 样本结果

## 未来工作

这里有一系列未来可以为该分支所做的事情

    （现在暂无）


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [内核](http://eLinux.org/Category:Kernel "Category:Kernel")

