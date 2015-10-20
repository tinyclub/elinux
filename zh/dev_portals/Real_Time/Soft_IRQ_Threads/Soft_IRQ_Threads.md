> 原文：[eLinux.org](http://eLinux.org/Soft_IRQ_Threads "http://eLinux.org/Soft_IRQ_Threads")<br/>
> 翻译：[@hduffddybz](https://github.com/hduffddybz)<br/>
> 校订：[@lzufalcon](https://github.com/lzufalcon)

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
-   [4 样例结果](#sample-results)
-   [5 未来工作](#future-work)

## 简介

本文描述了软中断线程，这是一种机制，它通过可调度的内核线程来执行某些中断的底半部分，这样就可以和其他线程或进程一样在一个调度类里面做优先级调度。


### LKML 讨论

最近（2004 年 7 月），两个补丁被提交到 Linux 内核，用于支持软中断线程。

#### [Time Sys](http://eLinux.org/Time_Sys "Time Sys") 的补丁

阅读
[http://lkml.org/lkml/2004/7/13/125](http://lkml.org/lkml/2004/7/13/125)

该补丁适用于 2.6.8-mm1 内核，但是其中 PPC 特定部分无法打上。

#### Korty 的补丁

阅读
[http://lkml.org/lkml/2004/7/13/152](http://lkml.org/lkml/2004/7/13/152)

### 基本原理

该特性十分重要因为它允许软中断以比实时线程更低的优先级来调度。这会使 Linux 有更好的实时处理能力。

## 下载

### 补丁

    - [Patch for CELF version XXXXXX is *here*]
    - [Patch for 2.4.xx is *here*]
    - [Patch for 2.6.xx is *here*]

### 实用程序

无

## 如何使用

[这部分要补充]

## 样例结果

## 未来工作

这里有一系列未来可以为该功能做的事情

    （现在暂无）


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [内核](http://eLinux.org/Category:Kernel "Category:Kernel")

