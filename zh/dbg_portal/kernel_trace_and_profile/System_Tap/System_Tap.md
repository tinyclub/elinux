**关注译者公众号**：
<br/>
<img src='../../../../pic/tinylab-wechat.jpg' width='110px'/>
<br/>


> 原文：[eLinux.org](http://elinux.org/System_Tap "http://eLinux.org/Debugging_The_Linux_Kernel_Using_Gdb") <br />
> 翻译：[@Lotte-Bai](https://github.com/Lotte-Bai) <br />
> 校订：[@lzufalcon](https://github.com/lzufalcon) <br />

# System Tap

本文是关于 **System Tap** 的信息，嵌入式开发者一定会很感兴趣的，因为追踪器在产品开发过程中对诊断问题是很有用的。
## 目录
-   [1 简介](#introduction)
-   [2 开源项目/邮件列表](#open-source-projects-mailing-lists)
-   [3 杂记](#miscellaneous-notes)
    -   [3.1 探针类型](#probe-types)
-   [4 参阅](#see-also)
    -   [4.1 ARM 支持](#arm-support)
-   [5 一些性能测量](#some-performance-measurements)
-   [6 链接](#links)

<span id="introduction"></span>

## 简介

SystemTap 是一个灵活而且可扩展的系统，允许为运行中的 Linux 内核添加跟踪信息的收集和分析。

SystemTap 设计得非常灵活（允许插入任意的 C 代码），而且易用（大多数跟踪语句用一种简单的脚本语言编写，并且附带有数据收集和聚合的例程，这些例程基本上以库的形式呈现）。

SystemTap 的一个关键点是它意图允许大家创建一个跟踪集（一个 tapset），无须修改或者重新编译系统所需，就可以执行于运行中的 Linux 系统。为了达到该目的，它使用内核 [Kprobes](http://www-users.cs.umn.edu/~boutcher/kprobes/) 接口和可加载的内核模块来动态地添加探针和新生成的代码到运行中的内核中。

<span id="open-source-projects-mailing-lists"></span>

## 开源项目/邮件列表

官方网站:
[http://sourceware.org/systemtap/](http://sourceware.org/systemtap/)

SystemTap 的邮件列表归档：
[http://sourceware.org/ml/systemtap/](http://sourceware.org/ml/systemtap/)

一本教程，很好地概述了本系统：
[http://sourceware.org/systemtap/tutorial/](http://sourceware.org/systemtap/tutorial/)

<span id="miscellaneous-notes"></span>

## 杂记

<span id="probe-types"></span>

### 探针类型

有几种类型的探针：

-   kprobe & kretprobe, for dynamically insterted probes（动态插入探针）
-   timers（定时器）
-   static instrumentation markers（静态检测标志）
-   performance counter events（性能计数事件）

在以后，可能是：

-   user-space probes,（用户空间探针）
-   user-space return probes, and（用户空间返回探针）
-   watchpoint probes (kernel & user) （监视点探针（内核空间 & 用户空间））
-   and more（更多）

<span id="see-also"></span>

## 参阅

请注意 Systemap 是 Linux 内核最主要的跟踪系统之一。

截至 2006 年春，有一项进行中的工作是尝试合作解决一些主要的跟踪项目之间存在的各类问题。参看 [跟踪协作项目](http://eLinux.org/Tracing_Collaboration_Project“跟踪合作项目”)页面获取更多信息。

<span id="arm-support"></span>

### ARM 支持

可以从 [这里](http://omappedia.org/wiki/Systemtap) 找到 ARM & OMAP 平台上使能 System Tap 的详细用法。

<span id="some-performance-measurements"></span>

## 一些性能测量

Jian Gui 写道（2006 年 7 月在 **System Tap** 邮件列表）：

    嗨，我们在 ppc64 平台上使用一些测试基准来测试过 systemtap/LKET 的开销。

    测试表明 systemtap/LKET 的开销一般情况下是可以接受的。但它在一些特殊行为的测试基准中也会导致很大的开销。例如 dbench. Dbench 在非常频繁地调用 kill() 来检测一个任务是否完成时，这样就会导致很大的开销。

    在测试中，我们把事件钩子归类为五组:
    grp1 - syscall.entry, process
    grp2 - syscall.return, process
    grp3 - iosyscall, ioscheduler, scsi, aio, process
    grp4 - tskdispatch, pagefault, netdev, process
    grp5 - syscall.entry, syscall.return, process

    所有的结果都是：(score1 - score2)/score2 * 100%，其中：
    score1：使用 systemtap 探测时的测试基准分数
    score2：未使用探测时的测试基准分数

    dbench (<3% is noise)
    --------------------
    grp1            -14.4%
    grp2            -33.1%
    grp3            -7.92%
    grp4            -13.6%
    grp5            -43.3%

    specjbb (<3% is noise)
    ---------------------
    grp 1           -0.87%
    grp 2           -0.67%
    grp 4           +0.47%
    grp 5           +0.05%

    tiobench (<3% is noise)
    ----------------------
    grp1       sequential reads      +1.45%
               sequential writes     -6.98%
               random reads          +0.57%
               random writes         -2.11%
    grp2       sequential reads      +0.11%
               sequential writes     -5.81%
               random reads          +0.03%
               random writes         -2.11%
    grp3       sequential reads      +1.42%
               sequential writes     -6.98%
               random reads          +0.51%
               random writes         -2.11%
    grp4       sequential reads      +1.38%
               sequential writes     -5.81%
               random reads          +0.60%
               random writes         -2.11%
    grp5       sequential reads      +0.22%
               sequential writes     -8.14%
               random reads          -0.10%
               random writes         -1.05%

    Rawiobench (<3% is noise)
    ------------------------
    grp1       sequential aioread()     0%
               sequential aiowrite()    0%
               random aioread()         0%
               random aiowrite()        0%
    grp2       sequential aioread()     0%
               sequential aiowrite()    0%
               random aioread()         0%
               random aiowrite()        -0.82%
    grp3       sequential aioread()     0%
               sequential aiowrite()    0%
               random aioread()         0%
               random aiowrite()        0%
    grp4       sequential aioread()     0%
               sequential aiowrite()    0%
               random aioread()         +0.79%
               random aiowrite()        -0.82%
    grp5       sequential aioread()     0%
               sequential aiowrite()    -6.41%
               random aioread()         +0.79%
               random aiowrite()        0%

    测试环境：
    硬件: Open Power 720/ 8 cpus/ 2 cores/ 6GB RAM (tiobench use 1G)
    软件: RHEL4-U3GA/ 2.6.17.2/ systemtap-20060718/ elfutils-0.122-0.4

<span id="links"></span>

## 链接

-   [SystemTap Sans Kernel: A Pure Userspace Backend](https://events.linuxfoundation.org/events/collaboration-summit/stone)

    [幻灯](https://events.linuxfoundation.org/images/stories/pdf/lfcs2012_jstone.pdf)
    
    [录像](http://video.linux.com/videos/systemtap-sans-kernel-a-pure-userspace-backend)


[分类](http://eLinux.org/Special:Categories "Special:Categories")

-   [开发工具](http://eLinux.org/Category:Development_Tools "Category:Development Tools")
