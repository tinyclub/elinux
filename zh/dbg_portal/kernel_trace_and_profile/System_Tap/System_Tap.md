> From: [eLinux.org](http://eLinux.org/System_Tap "http://eLinux.org/System_Tap")


# System Tap

此页是关于**System Tap**的信息，嵌入式开发者一定会是很感兴趣的，因为追踪器在产品开发过程中对诊断问题是很有用的。
## 内容

-   [1 简介](#introduction)
-   [2 开源项目/邮件列表](#open-source-projects-mailing-lists)
-   [3 杂记](#miscellaneous-notes)
    -   [3.1 探针类型](#probe-types)
-   [4 参阅](#see-also)
    -   [4.1 ARM 支持](#arm-support)
-   [5 一些性能测量](#some-performance-measurements)
-   [6 链接](#links)

## 简介

SystemTap 是一个灵活和可扩展的系统，它可以在一个运行中的Linux内核中添加跟踪收集和分析。

SystemTap 设计非常灵活(允许插入任意C代码)，但同时易于使用(大多数跟踪语句是用一个简单的脚本语言编写的，在基本库中使用有用的数据收集和聚合的例程)。

SystemTap 的一个关键点是允许你创建一套的跟踪(“tapset”)，然后将它在运行的Linux系统上运行起来，而不需要修改或重新编译系统。要做到这一点，它使用了内核[KProbes](http://www-users.cs.umn.edu/~boutcher/kprobes/) 接口和装载内核模块来动态地添加探测点和新生成代码到运行的内核中。

## 开源项目/邮件列表

官方网站:
[http://sourceware.org/systemtap/](http://sourceware.org/systemtap/)

SystemTap的 邮件列表归档：
[http://sourceware.org/ml/systemtap/](http://sourceware.org/ml/systemtap/)

本系统一个很好的教程:
[http://sourceware.org/systemtap/tutorial/](http://sourceware.org/systemtap/tutorial/)

## 杂记

### 探针类型

有几种类型的探针：

-   kprobe & kretprobe, for dynamically insterted probes（动态插入探针）
-   timers（时间）
-   static instrumentation markers（静态检测标志）
-   performance counter events（性能计数事件）

在以后，可能是：

-   user-space probes,（用户空间探针）
-   user-space return probes, and（用户空间返回探针）
-   watchpoint probes (kernel & user)（检测点探针）
-   and more（更多）

## 参阅

请注意SystemTap是Linux内核的最重要的追踪系统之一。

（2006年春）在一些重要的追踪项中协调不同部分的追踪问题的工作正在进行中。参看 [跟踪协作项目](http://eLinux.org/Tracing_Collaboration_Project“跟踪合作项目”)页面获取更多信息。

### ARM 支持

System Tap 工作在ARM & OMAP 平台的指令是可用的 [here](http://omappedia.org/wiki/Systemtap)

## 一些性能测量

Jian Gui 写道（2006年7月在**System Tap** 邮件列表）：

    Hi, we've tested the overhead of systemtap/LKET with some benchmarks
    on a ppc64 machine.

    It shows the overhead of systemtap/LKET is acceptable generally.
    But it will also cause significant overhead for some benchmark of
    special behavior, e.g. dbench. Dbench calls kill() in a very high
    frequency to check whether a task is complete, thus leads to a high
    overhead.

    We categorized the event hooks into five groups in the testing:
    grp1 - syscall.entry, process
    grp2 - syscall.return, process
    grp3 - iosyscall, ioscheduler, scsi, aio, process
    grp4 - tskdispatch, pagefault, netdev, process
    grp5 - syscall.entry, syscall.return, process

    All the results are
       (score1 - score2)/score2 * 100%,  where:
    score1: the benchmark score when probed by systemtap
    score2: the benchmark score without probing

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

    Test environment:
    Machine:  Open Power 720/ 8 cpus/ 2 cores/ 6GB RAM (tiobench use 1G)
    Software: RHEL4-U3GA/ 2.6.17.2/ systemtap-20060718/ elfutils-0.122-0.4

## 链接

-   [SystemTap Sans Kernel: A Pure Userspace Backend](https://events.linuxfoundation.org/events/collaboration-summit/stone)

    [Slides](https://events.linuxfoundation.org/images/stories/pdf/lfcs2012_jstone.pdf)

    [Video](http://video.linux.com/videos/systemtap-sans-kernel-a-pure-userspace-backend)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")
