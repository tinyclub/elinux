> 原文: [eLinux.org](http://eLinux.org/Kernel_Timer_Systems "http://eLinux.org/Kernel_Timer_Systems")
> 翻译: [hduffddybz](https://github.com/hduffddybz)
> 校订：[]()

# Kernel Timer Systems



## Contents

-   [1 Timer Wheel, Jiffies and HZ (或者类似的)](#timer-wheel-jiffies-and-hz-or-the-way-it-was)
    -   [1.1 Ingo Molnar 关于 timer wheel 性能的解释](#ingo-molnar-s-explanation-of-timer-wheel-performance)
-   [2 ktimers](#ktimers)
    -   [2.1 材料需要重新写](#material-needs-rework)
    -   [2.2 clock events](#clock-events)
    -   [2.3 clocksource](#clocksource)
-   [3 Timer 信息](#timer-information)
    -   [3.1 /proc/timer\-list](#-proc-timer-list)
    -   [3.2 /proc/timer\-stats](#-proc-timer-stats)
-   [4 动态时钟](#dynamic-ticks)
    -   [4.1 测试](#testing)
    -   [4.2 Powertop](#powertop)
-   [5 定时器 API](#timer-api)
-   [6 时钟 API](#time-api)
-   [7 High Resolution Timers](#high-resolution-timers)
-   [8 旧的 wheel/jiffy 定时器替代提议](#old-timer-wheel-jiffy-replacement-proposals)
    -   [8.1 Jun Sun的 "tock" 提案](#-jun-sun-s-tock-proposal)
    -   [8.2 John Stultz](#john-stultz)
-   [9 Timer Tick Thread - LKML July
    2005](#timer-tick-thread-lkml-july-2005)

## Timer Wheel, Jiffies and HZ (或者类似的)

最初的内核时间系统（称作 “timer wheel”）基于每个时钟中断增加的内核内部的值.时钟中断成为了一个默认的调度系统, 并且其他的定时器都依赖于 jiffies. 定时器中断的频率（或者说 jiffy 增加的频率）取决于编译阶段设定的常数 HZ .不同的平台HZ是不同的. 曾经内核的 HZ 值为 100, 提供的 jiffy 的间隔是 10ms.到了 2.4 内核时，i386 的 HZ 值变为 1000，提供的 jiffy 时间间隔是 1ms. 最近的 2.6.13（译者注：翻译的时候最新内核已经到了4.2-rc2）i386 上的 HZ 值更改为 1。（1000确实太高了）

### Ingo Molnar 关于 timer wheel 性能的解释

Ingo Molnar 对当前的 “timer wheel” 实现的定时器性能做了深入的解释. 这是一系列关于增加 ktimers 的解释的信息一部分(ktimers 有不同的特性)。

这很可能是关于 timer wheel 的最佳解释: 看这里
[http://lkml.org/lkml/2005/10/19/46](http://lkml.org/lkml/2005/10/19/46)
and [http://lwn.net/Articles/156329/](http://lwn.net/Articles/156329/)

## ktimers

更新：ktimers 被 hrtimers 框架所替代，该框架作者同样是 Thomas Gleixner，只在linux/ktime.h 中使用一些函数和结构体。

### Material needs rework

由于考虑到 Thomas Gleixner 的 hrtimers，在这个部分中许多材料需要被创建或者被扩展。

### clock events

[在 LWN 中覆盖到了 clovkevents 的基本概念](http://lwn.net/Articles/223185/)

### clocksource

[关于 Clocksource 文档的补丁没有被接受](http://article.gmane.org/gmane.linux.kernel/1062438)。这个链接里有一些clock sources的阐释尽管该补丁的反馈说这些细节仍然需要被注意。

Clocksource 跟 Johb Stultz 所写的 GTOD(Generic time of day) 相关或者相同，并且hrtimers 要依赖于该框架(在 2006 年的 OLS 的演讲文稿的 18 页提及)。

同样可以看内核的文档 [高精度定时器和动态 tick 的设计文档](https://www.kernel.org/doc/Documentation/timers/highres.txt) 提及的一些关于 clock source 的文档.

## Timer 信息

有两个在 /proc 下的文件对于收集你系统下的时钟是非常有用的。

### /proc/timer\_list

/proc/timer\_list 有关于当前系统的时钟定时器的配置信息。 这对你调试当前定时器系统的信息十分有帮助 (特别是为你的平台开发 clockevent 和 clocksource 的支持)。

你可以通过查看不同的事情来辨别你的机器是否配置了高精度定时器:

对于标准精度 (jiffy 的精度), 该时钟的 ‘.resolution’ 值应等于 1 个 jiffy 周期的值。 对于嵌入式机器，HZ 的典型值是 100，则 ‘。resolution’的值为 10 ms，或者说 10000000 ns。

对于标准精度, 时钟事件设备的事件处理程序是 "tick\_handle\_periodic"。

对于高精度来说, 时钟的精度值列为 1 ns (看起来是可笑的，但是可作为任意精度的指标) ，另外时钟设备的事件处理程序是："hrtimer\_interrupt"。

* * * * *

[需要更多的信息 - 这可能已经写了并且放在了 Documentation/filesystems/proc.txt 下面]

### /proc/timer\_stats

/proc/timer\_stats 是一个在文件系统中 /proc 下的一个文件，你可以查看 Linux 内核中运行程序所需要的时钟。通过显示该文件，你可以哪些程序使用到许多时钟，它们多频繁使用，这将是非常有意思的。

为使用 /proc/timer\_status 需要配置内核使其支持该特性。也就是说, 在你的 .config 设置 CONFIG\_TIMER\_STATS=y 。这在  Kernel Hacking 菜单中, 提示语是: "Collect kernel timers statistics"。

编译安装你的内核，重启你的机器。

为激活状态的收集 (或者重启计数器), 尝试 "echo 1 >/proc/timer\_stats"

暂停状态的收集, 尝试 "echo 0 \>/proc/timer\_stats"

当你的收集系统在运行或者停止的时候你可以转存数据。 为转存数据, 使用 'cat /proc/timer\_stats'。这最后展示了平均的 事件/时间 指标，这样你可以得到系统的活动量的大致信息。

/proc/timer\_stats 字段值 (0.1 版本的格式):

    <count>,  <pid> <command>   <start_func> (<expire_func>)

## 动态时钟

Tickless kernel, dynamic ticks or NO\_HZ 是能使系统以非周期性tick运行的配置选项。时钟 tick 是一个在每秒内产生 HZ 个数的时钟中断， HZ 的值在编译的时候确定，在 100 到 1500 的范围之内 。不以timer tick来运行意味着内核在 idle 状态会做更少的工作而且很可能会做节省能量因为不需要定期的唤醒来服务于定时器。 配置选项是 Tickless 系统配置的 CONFIG\_NO\_HZ，在内核的配置菜单中。

-   查看 [Clockevents 和 动态定时器](http://lwn.net/Articles/223185/)
    LNW.net 文章

### 测试

为测试在你的内核中是否支持动态时钟可以查看：

在dmesg查看是否有这样一行：

     # dmesg | grep -i nohz
     Switched to NOHz mode on CPU #0

或者查看时钟中断跟 jiffies 的比较:

     # cat /proc/interrupts | grep -i time
     # sleep 10
     # cat /proc/interrupts | grep -i time

### Powertop

Powertop 是一个工具来处理 /proc/timer\_stats 输出信息并给出了在你的系统中什么导致了唤醒的图片。 减少这些唤醒可以减少你设备的能量消耗。Powertop 最高给 X86 所写，但也同样适用于嵌入式处理器。但是为了一个清晰的显示，需要一个 ncurses 库以支持宽字体。

一个较弱的 powertop 版本:

     # watch "cat /proc/timer_stats | sort -nr | head -n 20"

## 定时器 API

-   interval timers
-   posix timer API
-   sleep, usleep and nanosleep

## 时钟 API

- do_gettimeofday

## High Resolution Timers

查看 [High Resolution
Timers](http://eLinux.org/High_Resolution_Timers "High Resolution Timers"), 阐述了代替 jiffy 的定时器。

## 旧的 wheel/jiffy 定时器替代提议

### Jun Sun 的 "tock" 提议

查看这里
[http://linux.junsun.net/HRT/index.html](http://linux.junsun.net/HRT/index.html)

系统用 tocks (体系结构相关)，mtime (单调时间), wtime (流逝时间)来代替 jiffies 和 xtime，并提出了迁移的策略。

### John Stultz

在 2005, John Stultz 提出了定时器将以 64bit 的纳秒值为基础. 他于 2005 年在 OLS 上做了一个演讲(这可以在网上找得到)。

## Timer Tick Thread - LKML July 2005

这里有个在 2005 年 7 月内核邮件列表上的非常长的关于 timer, jiffies 和相关主题的线索

题目是: “回复: [补丁] i386: 可选的定时器中断的频率"

Linus 说 jiffies 不会消失

- 仍然需要 32 bit 的比较器，不应该是实时值(计算的负载太高)
- 高精度定时器不应该代替 HZ , 相反的是, HZ 的值应该是高的，而且 tick 的值跟 HZ 值不应该是 1：1关系。
    - 换句话说，HZ 值很高（例如 2K），在一些低频率的时候把定时器中断断开，在每个中断中 jiffies 增加的值超过 1。
    - 这么做的原因是一个保持一个单独的子系统。

Arjan 对于合并低精度定时器有着很好的观点

- 3 个场合:

    - 低精度定时处理
    - 高精度定时器的绝对唤醒 (每 10s 唤醒，无论上一个任务是否延迟)
    - 高精度定时器的相对唤醒(距现在 10ms 醒来)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

