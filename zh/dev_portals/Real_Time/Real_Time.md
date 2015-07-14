> From: [eLinux.org](http://eLinux.org/Real_Time "http://eLinux.org/Real_Time")


# 实时







## 内容

-   [2 简介](#简介)
-   [3 实时领域 Wiki](#实时领域 Wiki)
-   [4 软件项目](#软件项目)
-   [5 硬件实现](#硬件实现)
-   [6 文档](#文档)
-   [7 更多开源项目](#更多开源项目)


## 简介

该页面有实时Linux的相关信息. 也有Linux时间系统的相关消息. CE Linux 社区对此感兴趣是因为许多消费电子产品有实时需求 (例如在多媒体展示领域，或者是通信领域)

## 实时领域 Wiki

-   需注意到实时 Linux 的信息主要来源于新的 [RTWiki](http://rt.wiki.kernel.org/).

## 软件项目

-   [实时抢占](http://eLinux.org/Realtime_Preemption "Realtime Preemption") -
    Ingo Molnar 给 Linux2.6内核增添的一系列实时抢占的补丁
-   [内核时钟系统](http://eLinux.org/Kernel_Timer_Systems "内核时钟系统")
    - 改变内核时钟系统的不同提议
-   [中断线程化](http://eLinux.org/Soft_IRQ_Threads "中断线程化") -
    将中断线程化使得中断能够被抢占
    -   ***NOTE:** 中断线程化在2007 10月被并入 [Realtime Preemption](http://eLinux.org/Realtime_Preemption "Realtime Preemption") 补丁中
-   [高精度定时器](http://eLinux.org/High_Resolution_Timers "高精度定时器") - 系统支持非常高的定时精度
-   [VST](http://eLinux.org/Variable_Scheduling_Timeouts "Variable Scheduling Timeouts")
    - 系统支持tickless模式

## 硬件实现

Ti AM18XX PRUSSv1

[Ti\_AM33XX\_PRUSSv2](http://eLinux.org/Ti_AM33XX_PRUSSv2 "Ti AM33XX PRUSSv2")

Tools for PRUSS



## 文档

-   [Building Embedded Linux Systems, 2nd edition]
    (http://www.amazon.com/Building-Embedded-Linux-Systems-Yaghmour/dp/0596529686)
    讨论了实时抢占的补丁.
-   [CELF Realtime 规范](http://tree.celinuxforum.org/CelfPubWiki/RTSpecDraft_5fR2)
    (来源于2004年，相当旧的资料了)
-   Manas 于2005年在 CELF 技术会议上展示的实时抢占补丁
    [Media:Real-Time-Preemption-Patchset.pdf](http://eLinux.org/images/4/4e/Real-Time-Preemption-Patchset.pdf "Real-Time-Preemption-Patchset.pdf")
-   [实时测试的最佳实践](http://eLinux.org/Realtime_Testing_Best_Practices "Realtime Testing Best Practices")
    - 展示了最近测试结果的文档，给出了关于不同实验该如何测试的提示以及该如何避免错误。
-   [实时嵌入式 Linux](http://free-electrons.com/articles/realtime/)
-   [使用实时 Linux](http://www.celinux.org/elc08_presentations/Using_Real-Time_Linux.KlaasVanGend.ELC2008.pdf)
    - Klaas van Gends 于2008年在 ELC 做的展示. [视频](http://free-electrons.com/pub/video/2008/elc/elc2008-klaas-van-gend-using-real-time-linux.ogg).
-   Frank Rowand's 一系列演讲
    -   *实时性能调整上的经验*
        -   第一部分,
            [演示文稿](http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2008Presentations?action=AttachFile&do=get&target=adventures_in_real_time_performance_tuning_part_1-no_hidden.pdf)
            [视频](http://free-electrons.com/pub/video/2008/elce/elce2008-rowand-adventures-real-time-part1.ogv)ELCE 2008 版本
        -   第二部分,
            [演示文稿](http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2008Presentations?action=AttachFile&do=get&target=adventures_in_real_time_performance_tuning_part_2-no_hidden.pdf)
            [视频](http://free-electrons.com/pub/video/2008/elce/elce2008-rowand-adventures-real-time-part2.ogv)ELCE 2008 版本
    -   实时负载测量的一些分析
        [演示文稿](http://tree.celinuxforum.org/CelfPubWiki/ELC2009Presentations?action=AttachFile&do=get&target=musings_on_analysis_of_measurements_of_a_real-time_workload.pdf)
        [视频](http://free-electrons.com/pub/video/2009/elce/elce2009-rowand-measurement-diagnostic-tools.ogv)         ELC 2009 版本
    -   实时Linux的失败
        [演示文稿](http://eLinux.org/images/b/be/Real_time_linux_failure.pdf "Real time linux failure.pdf")
        [高清视频](http://free-electrons.com/pub/video/2011/elc/elc-2011-rowand-real-time-issues-i-cache-locks.webm)
        [450x800视频](http://free-electrons.com/pub/video/2011/elc/elc-2011-rowand-real-time-issues-i-cache-locks-x450p.webm) ECL2010版本
    -   Linux PREEMPT\_RT 是如何工作的
        [演示文稿](http://eLinux.org/images/5/51/Elce11_rowand.pdf "Elce11 rowand.pdf") ELCE 2011 版本
-   实时跟快速的比较, 该如何选择, Paul E.
    McKenney 于2008年在 Ottawa Linux Symposium会议上所做演讲.
    [文章](http://ols.fedoraproject.org/OLS/Reprints-2008/mckenney-reprint.pdf)
    [视频](http://free-electrons.com/pub/video/2008/ols/ols2008-paul-mckenney-real-time-vs-real-fast.ogg)

-   文章: "[Embedded GNU/Linux and Real-Time an executive
    summary](http://www.reliableembeddedsystems.com/pdfs/2010_03_04_rt_linux.pdf)",2010 by Robert Berger
    -   该文章为2010年的Embedded World Conference所写，包含了不同实时方法的比较（包括了PREEMPT_RT和双内核）
    -   该文章有许多参考文献列表.
-   教程 [RT-Preempt教程](http://eLinux.org/RT-Preempt_Tutorial "RT-Preempt Tutorial")
-   [OSADL Realtime 页面](https://www.osadl.org/Realtime-Linux.projects-realtime-linux.0.html)
    包含了实时延时的测试[testing](https://www.osadl.org/Continuous-latency-monitoring.qa-farm-monitoring.0.html).

## 更多开源项目

-   [Xenomai](http://www.xenomai.org) - 实时开发框架,其跟Linux社区有着紧密的合作. 在其他功能方面，其提供了从VxWorks,PSOS+等其他RTOS迁移到Linux的途径，其依赖于所谓的skins机制。


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Real Time](http://eLinux.org/Category:Real_Time "Category:Real Time"
