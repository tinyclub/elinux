> 原文：[eLinux.org](http://elinux.org/Kernel_Trace_Systems) <br />
> 翻译：[@Lotte-Bai](https://github.com/Lotte-Bai) <br />
> 校订：[@lzufalcon](https://github.com/lzufalcon) <br />


# Kernel Trace Systems

本文有一些关于不同内核跟踪系统的信息的链接:

## 目录

-   [1 通用跟踪系统](#general-purpose-tracing-systems)
-   [2 特殊跟踪系统](#special-purpose-tracing-systems)
-   [3 跟踪基本架构](#trace-infrastructure)
-   [4 取样系统](#sampling-systems)
-   [5 相关工具](#related-facilities)
-   [6 其他系统](#other-systems)
-   [7 合作成果](#collaboration-efforts)

## 通用跟踪系统

一些主要的 Linux 通用跟踪系统是：
-   ptrace - 具有跟踪系统调用的进入和退出，和信号在进程间传递的能力 (也用于调试进程)
    -   见 "man ptrace" 和 "man strace"
-   [Ftrace](../../../dbg_portal/kernel_trace_and_profile/Ftrace/Ftrace.md "Ftrace")
    -   [Ftrace Function Graph ARM](../../../dbg_portal/kernel_trace_and_profile/Ftrace/Ftrace.md_Function_Graph_ARM "Ftrace Function Graph ARM") - Ftrace 功能图 ARM - 由 Tim Bird 实现和向 ARM 系统提交补丁增加了功能图和持续跟踪的功能
        -   这个实现在 ftrace 上有好的入门资料，以及其他资源的链接
    -   kernel 函数跟踪器
    -   也可以用于调试或分析延迟和性能问题
    -   在主分支版本 2.6.27 后支持
    -   见 [用FTrace测量函数持续时间](http://eLinux.org/Measuring_Function_Duration_with_FTrace "用FTrace测量函数持续时间") - 2009 年 Linux 研讨会 Tim Bird 演示文稿的大纲
-   [System Tap](../../../dbg_portal/kernel_trace_and_profile/System_Tap/System_Tap.md "System Tap") - System Tap 是一个用于构建和执行跟踪和取样的系统，并可以应用于一个正在运行的 Linux 系统
-   LTTng - [Linux Trace Toolkit](../../../dbg_portal/kernel_trace_and_profile/Linux_Trace_Toolkit/Linux_Trace_Toolkit.md "Linux Trace Toolkit"), next generation （Linux 跟踪套件，下一代）
-   LKST - [Linux Kernel State Tracer](../../../dbg_portal/kernel_trace_and_profile/Linux_Kernel_State_Tracer/Linux_Kernel_State_Tracer.md "Linux Kernel State Tracer")（Linux 内核态跟踪器）

## 特殊跟踪系统

有一些其他重要的专用内核跟踪系统:
-   KFT - [Kernel Function Trace](../../.././dev_portals/Boot_Time/Kernel_Function_Trace/Kernel_Function_Trace.md "Kernel Function Trace") - 跟踪功能可以显示函数持续时间和调用关系图
-   latency trace - RT-preempt 工具可以测量中断和互斥锁的延迟时间
    -   此延迟跟踪器被封装在 RT-preempt 补丁里 - 见 [Realtime Preemption](../../.././dev_portals/Real_Time/Realtime_Preemption/Realtime_Preemption.md "Realtime Preemption") and [RT-preempt Article](http://lwn.net/Articles/97811/)
-   block tracer (blktrace) - 允许精确地察看在给定的队列中的块层正在做什么操作
    -   来自 Jens Axboe 的介绍文档: [介绍](http://lwn.net/Articles/148761/)
    -   优秀的演示文档: [blktrace.pdf](http://www.gelato.org/pdf/apr2006/gelato_ICE06apr_blktrace_brunelle_hp.pdf)
    -   使用指南在这: [blktrace guide](https://secure.engr.oregonstate.edu/wiki/CS411/index.php/Blktrace_Guide)
    -   这项特性已经合入主分支的 2.6.17 版本
    -   时间轴功能 (blktrace post-processing tool): [blktrace timeline utility](http://www.nabble.com/NEW%3A-btt---blktrace-timeline-utility%3A-analyze-I-Os-collected-with-blktrace.-tf1644874.html)
-   delay accounting patches（延时统计补丁） - 收集关于花费在每一个在系统中任务的延时的统计信息
    -   见 [delay accounting patches](http://lkml.org/lkml/2006/5/2/30)

## 跟踪基本架构

-   KProbes - 前身是 dprobes, 相关信息在这里: [dprobes](http://dprobes.sourceforge.net/)
    -   参阅一份优秀的教程: [kprobes](http://www-users.cs.umn.edu/~boutcher/kprobes/)
    -   主分支版本支持 x86, Alpha 和 PPC64 体系结构。MIPS 架构支持的实现已经在2.6.16版本的内核上完成和在 Toshiba TX49 平台上测试过。在 [Patch Archive](http://eLinux.org/Patch_Archive "Patch Archive") 的补丁是可用的。

-   [这里有一些 djprobe 的资料]

## 取样系统

请注意，分析系统（或者“取样系统）略有不同，在这他们涉及采样而不是事件跟踪。Linux 一些重要的工具是：
-   top - 为一个正在运行的系统提供了动态实时的视图，包括进程。
    -   见 "man top"
    -   也可参见 ksysguard, [Gnome system Monitor](http://freshmeat.net/projects/gnome-system-monitor/)
-   OProfile - Linux 系统级的分析工具
    -   见 [oprofile](http://oprofile.sourceforge.net/about/)
    -   也可参考: [oprofile at IBM](http://www-128.ibm.com/developerworks/linux/library/l-oprof.html)
-   BootChart - 对启动过程分析和提供进程启动的可视化数据和系统利用率
    -   见 [Bootchart](../../.././dev_portals/Boot_Time/Bootchart/Bootchart.md "Bootchart")

## 相关工具

-   in-kernel statistics infrastructure - 对内核中统计工具的一种通用实现的提议方案
    -   见 [inkernel stats](http://lkml.org/lkml/2006/5/19/106)
-   perfmon2 - 对 CPU 硬件性能监控功能的接口
    -   见 [perfmon](http://perfmon2.sourceforge.net/)
-   inotify - [inotify](http://www-128.ibm.com/developerworks/linux/library/l-inotify.html)

## 其他系统

这里有一些我没尚未分类的系统:
-   Datastreams - 一个可以创建和监控跟踪点的系统 - 见 [datastreams](http://kusp.ittc.ku.edu/wiki/index.php/Main_Page)

## 合作成果

一些跟踪系统项目的领导人正在尝试合作: 见 [Tracing Collaboration Project](http://eLinux.org/Tracing_Collaboration_Project "Tracing Collaboration Project")

[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux tracing](http://eLinux.org/Category:Linux_tracing "Category:Linux tracing")




