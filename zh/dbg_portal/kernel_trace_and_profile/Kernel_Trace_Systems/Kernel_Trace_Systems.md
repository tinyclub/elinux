> 原文：[eLinux.org](http://elinux.org/Kernel_Trace_Systems) <br />
> 翻译：[@Lotte-Bai](https://github.com/Lotte-Bai) <br />
> 校订：[@lzufalcon](https://github.com/lzufalcon) <br />


# Kernel Trace Systems

本文有一些关于不同内核跟踪系统的信息的链接:

## 目录

-   [1 通用跟踪系统](#general-purpose-tracing-systems)
-   [2 专用跟踪系统](#special-purpose-tracing-systems)
-   [3 跟踪基本架构](#trace-infrastructure)
-   [4 采样系统](#sampling-systems)
-   [5 相关工具](#related-facilities)
-   [6 其他系统](#other-systems)
-   [7 合作成果](#collaboration-efforts)

## 通用跟踪系统

一些主要的 Linux 通用跟踪系统是：
-   ptrace - 有能力跟踪系统调用的进入和退出，也能够用于跟踪信号如何传递到进程（也用于调试进程）
    -   见 'man ptrace' 和 'man strace'
-   [Ftrace](../../../dbg_portal/kernel_trace_and_profile/Ftrace/Ftrace.md "Ftrace")
    -   [Ftrace Function Graph ARM](../../../dbg_portal/kernel_trace_and_profile/Ftrace/Ftrace.md_Function_Graph_ARM "Ftrace Function Graph ARM") - Ftrace Function Graph ARM - 由 Tim Biard 准备的报告和补丁，这些补丁为 ARM 系统添加了 function graph（函数调用关系图）和 函数执行时间跟踪功能
        -   这个报告有些好的介绍 Ftrace 的资料，以及其他资源的链接
    -   kernel 函数跟踪器
    -   也可以用于调试或分析延迟和性能问题
    -   在主分支版本 2.6.27 后支持
    -   见 [用 FTrace 测量函数持续时间](http://eLinux.org/Measuring_Function_Duration_with_FTrace "用FTrace测量函数持续时间") - 2009 年 Linux 研讨会 Tim Bird 演示文稿的大纲
-   [System Tap](../../../dbg_portal/kernel_trace_and_profile/System_Tap/System_Tap.md "System Tap") - System Tap 是一个用于构建和执行跟踪和采样的系统，并可以应用于一个正在运行的 Linux 系统
-   LTTng - [Linux Trace Toolkit](../../../dbg_portal/kernel_trace_and_profile/Linux_Trace_Toolkit/Linux_Trace_Toolkit.md "Linux Trace Toolkit"), next generation （Linux 跟踪工具箱，下一代）
-   LKST - [Linux Kernel State Tracer](../../../dbg_portal/kernel_trace_and_profile/Linux_Kernel_State_Tracer/Linux_Kernel_State_Tracer.md "Linux Kernel State Tracer")（Linux 内核状态跟踪器）

## 专用跟踪系统

有一些其他重要的专用内核跟踪系统:
-   KFT - [Kernel Function Trace](../../.././dev_portals/Boot_Time/Kernel_Function_Trace/Kernel_Function_Trace.md "Kernel Function Trace") - 跟踪函数进而显示函数执行时间以及调用关系图
-   latency trace - 这是一个 RT-preempt（实时抢占）工具，可用于测量中断和互斥锁的延迟时间
    -   此延迟跟踪器被内嵌在 RT-preempt 补丁里 - 见 [Realtime Preemption](../../.././dev_portals/Real_Time/Realtime_Preemption/Realtime_Preemption.md "Realtime Preemption") and [RT-preempt Article](http://lwn.net/Articles/97811/)
-   block tracer (blktrace) - 允许精确地查看给定队列中的块层正在做什么操作
    -   来自 Jens Axboe 的介绍文档: [介绍](http://lwn.net/Articles/148761/)
    -   优秀的演示文档: [blktrace.pdf](http://www.gelato.org/pdf/apr2006/gelato_ICE06apr_blktrace_brunelle_hp.pdf)
    -   使用指南在这: [blktrace guide](https://secure.engr.oregonstate.edu/wiki/CS411/index.php/Blktrace_Guide)
    -   这项特性已经合入主线的 2.6.17 版本
    -   时间轴功能 (blktrace post-processing tool): [blktrace timeline utility](http://www.nabble.com/NEW%3A-btt---blktrace-timeline-utility%3A-analyze-I-Os-collected-with-blktrace.-tf1644874.html)
-   delay accounting patches（延时统计补丁） - 统计并收集系统中每个任务的延时
    -   见 [delay accounting patches](http://lkml.org/lkml/2006/5/2/30)

## 跟踪基本架构

-   KProbes - 前身是 dprobes, 相关信息在这里: [dprobes](http://dprobes.sourceforge.net/)
    -   参阅一份优秀的教程: [kprobes](http://www-users.cs.umn.edu/~boutcher/kprobes/)
    -   主线内核的 KProbes 已经支持 x86, Alpha 和 PPC64 架构，一个 MIPS 的实现也在 2.6.16 内核上完成并且在 Toshiba TX 49 平台上验证过，补丁可以从[补丁存档](http://eLinux.org/Patch_Archive)下载到。

-   [如果在这里加一些 djprobe 的资料就更好了]

## 采样系统

请注意，分析系统（或者“采样系统”）略有不同，在这里他们涉及到采样而不是时间跟踪。一些主要的 Linux 采样工具有：
-   top - 为正在运行的系统（包括进程）提供了一个动态实时的视图
    -   见 'man top'
    -   也可参见 ksysguard, [Gnome system Monitor](http://freshmeat.net/projects/gnome-system-monitor/)
-   OProfile - Linux 系统级的分析工具
    -   见 [oprofile](http://oprofile.sourceforge.net/about/)
    -   也可参考: [oprofile at IBM](http://www.ibm.com/developerworks/cn/linux/l-oprof/)
-   BootChart - 对启动过程分析和提供进程启动的可视化数据和系统利用率
    -   见 [Bootchart](../../.././dev_portals/Boot_Time/Bootchart/Bootchart.md "Bootchart")

## 相关工具

-   in-kernel statistics infrastructure - 一种提案，目标是在内核中实现一种通用的统计工具
    -   见 [inkernel stats](http://lkml.org/lkml/2006/5/19/106)
-   perfmon2 - 一种针对 CPU 的硬件性能监控特性的接口
    -   见 [perfmon](http://perfmon2.sourceforge.net/)
-   inotify - [inotify](http://www-128.ibm.com/developerworks/linux/library/l-inotify.html)

## 其他系统

这里有一些我尚未分类的系统:
-   Datastreams - 一个可以创建和监控跟踪点的系统 - 见 [datastreams](http://kusp.ittc.ku.edu/wiki/index.php/Main_Page)

## 合作成果

一些跟踪系统项目的领导人正在尝试合作: 见 [Tracing Collaboration Project](http://eLinux.org/Tracing_Collaboration_Project "Tracing Collaboration Project")

[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux 跟踪系统](http://eLinux.org/Category:Linux_tracing "Category:Linux tracing")




