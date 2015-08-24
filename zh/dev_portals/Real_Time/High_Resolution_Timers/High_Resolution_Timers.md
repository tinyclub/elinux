> 原文: [eLinux.org](http://eLinux.org/High_Resolution_Timers "http://eLinux.org/High_Resolution_Timers")
> 翻译: [@hduffddybz](https://github.com/hduffddybz)
> 校订: []()


# High Resolution Timers



## 目录

-   [1 描述](#description)
-   [2 基本原理](#rationale)
-   [3 资源](#resources)
    -   [3.1 项目](#projects)
        -   [3.1.1 hrtimers - Thomas Gleixner 的补丁](#hrtimers-thomas-gleixner-s-patch)
        -   [3.1.2 HRT - Geoge Anzinger 的补丁](#hrt-geoge-anzinger-s-patch)
-   [4 下载](#downloads)
    -   [4.1 补丁](#patch)
-   [5 实用程序](#utility-programs)
-   [6 如何使用](#how-to-use)
-   [7 如何检测你的定时器系统是否支持高精度定时器](#how-to-detect-if-your-timer-system-supports-high-resolution)
-   [8 如何验证](#how-to-validate)
-   [9 示例结果](#sample-results)
-   [10 案例学习 1](#case-study-1)
-   [11 案例学习 2](#case-study-2)
-   [12 状态](#status)
-   [13 未来工作/行动清单](#future-work-action-items)
-   [14 陈旧的信息(2.4内核)](#old-information-for-2-4-kernel)

## 描述

高精度定时器项目的目标是在 Linux 中实现 POSIX 1003.1b Section 14 （时钟，定时器）的 API 。 包括了对高精度定时器的支持 - 也就是说定时器的精度好于 1 个滴答。

当项目启动时，Linux 还不支持 POSIX 的时钟和定时器的 API 。随着时间推移，时钟和定时器的 API 被采纳，并且支持高精度时钟的核心基础设施被主线（ 2.6.21 内核）接受。在编写本文时，并不是所有的嵌入式平台都支持高精度定时器， 甚至即使内核中有支持的代码，配置起来也比较复杂。

## 基本原理

当时，Linux 中的定时器仅仅支持 1 个滴答精度，滴答的时间长度依赖于内核中的 HZ 值，在 i386 和其他一些平台中是 1ms ，而在绝大多数的嵌入式平台是 10ms 。

十分需要高精度定时器使系统能在更加精确的时间间隔中唤醒和处理数据。

## 资源

### 项目

#### hrtimers - Thomas Gleixner 的补丁

支持高精度定时器的一个项目是 Thomas Gleixner 的 hrtimers

Thomas 于 2006 年 7 月在渥太华的 Linux 研讨会上做了一个演讲展示了 hrtimers 的现状。 演讲稿见这里：
[OLS
hrtimers](https://docs.google.com/file/d/0BzuiPiVvL63cNTYwYWE1YTgtODFhMS00NzM1LTlkMTItYWVlNzU3MWQ1NzA5/edit?sort=name&layout=list&pli=1&pid=0BzuiPiVvL63cNzJlODhmYWEtYWY1MS00Yjc1LTg5YzUtODViMDUzOTZjNzUz&cindex=89#)

在 2006 年 7 月， “通用时钟源”被 主线内核树 ( 2.6.18-rc 版本)所接受。 这意味着在合适的时候该特性会在 2.6.18 版本中出现。 高精度定时器应该可能很快紧接着在 2.6.19 内核中出现。
在 2006 年 2 月，风河的 James Perkins 写到:

* * * * *

ktimers 被 hrtimers 所替代，hrtimers 的主要部分被合并并且出现在 Linux 2.6.16-rc2 版本中。hrtimers 是 itimers，nanosleep，posix-timer 的基础。Jonathan Corbet 在下文中很好地诠释了高精度定时器：
[http://lwn.net/Articles/167897/](http://lwn.net/Articles/167897/)

由于在 2.6.16-rc2 中只有 hrtimers 的核心，hrtimers 大体上使用系统的定时器作为他们的时钟源，以 HZ 运行。 John Stultz 的通用时钟源代码并没有被合并。 Thomas Gleixner 维护他的git 仓库并且优雅的发布到
[http://www.tglx.de/projects/hrtimers/](http://www.tglx.de/projects/hrtimers/)
包含有通用的时钟源（clocksource），新的 timeofday 补丁，并且为一部分架构提供了真正的高精度定时器。

高精度定时器工作是实验的并持续发展的，首先聚聚焦于让 X86 先工作起来，如果这些胜任你的要求，推荐使用 2.6.16 内核。 该项目让我们知道有哪些问题和改进. 相反的是，在 2.6.8-2.6.10 时期，George Anzinger 领导的早期实现中提供了相当复杂的一套功能，但是这个项目当时并不活跃。

* * * * *

*注意到现在HRT的维护者反对该特性。*

#### HRT - Geoge Anzinger 的补丁

早于 hrtimers，提供高精度定时器的主要是 George Anzinger 的补丁。官方的 HRT 补丁的页面在:

-   [high-res-timers](http://sourceforge.net/projects/high-res-timers/)



## 下载

### 补丁

-   看 [补丁程序的存档](http://eLinux.org/Patch_Archive "Patch Archive")
-   Tom Rini 对早期的2.6版本提交了一些补丁:
    -   [trini
        patches](http://source.mvista.com/~trini/hrt/hrt_07Dec2004_001_2.6.10-rc3.patch)

## 实用程序

## 如何使用

为使用高精度定时器需要确认内核在目标处理器（或板子）支持该特性。然而你仍需要在 Linux 内核中配置以支持它。
在你的内核配置中设置 `CONFIG_HIGH_RES_TIMERS=y`

编译内核并且安装到你的目标板上。

为使用 Posix 的定时器 API，请使用在线资源
[[1]](http://www.opengroup.org/onlinepubs/009695399/basedefs/time.h.html)

## 如何检测你的定时器系统是否支持高精度定时器

有许多种方式可以判定你的系统是否支持高精度定时器

-  检查内核的启动信息

看内核的启动信息或者使用 `dmesg`。 如果内核成功打开了高精度定时器,在启动的时候会打印信息： `Switched to high resolution mode on CPU0` (或者相似的信息)。

-   查看 `/proc/timer_list`

也可以查看 `timer_list`，可以看到列出的时钟是否支持高精度。下面列出了一份在 [OSK](http://eLinux.org/OSK "OSK")(ARM系列开发板)的 `/proc/timer_list`，显示了时钟被配置成高精度。

-   - `cat /proc/timer_list`

`
<!-- -->

    Timer List Version: v0.3
    HRTIMER_MAX_CLOCK_BASES: 2
    now at 294115539550 nsecs

    cpu: 0
     clock 0:
      .index:      0
      .resolution: 1 nsecs
      .get_time:   ktime_get_real
      .offset:     0 nsecs
    active timers:
     clock 1:
      .index:      1
      .resolution: 1 nsecs
      .get_time:   ktime_get
      .offset:     0 nsecs
    active timers:
     #0: <c1e39e38>, tick_sched_timer, S:01, tick_nohz_restart_sched_tick, swapper/0
     # expires at 294117187500 nsecs [in 1647950 nsecs]
     #1: <c1e39e38>, it_real_fn, S:01, do_setitimer, syslogd/796
     # expires at 1207087219238 nsecs [in 912971679688 nsecs]
      .expires_next   : 294117187500 nsecs
      .hres_active    : 1
      .nr_events      : 1635
      .nohz_mode      : 2
      .idle_tick      : 294078125000 nsecs
      .tick_stopped   : 0
      .idle_jiffies   : 4294966537
      .idle_calls     : 2798
      .idle_sleeps    : 1031
      .idle_entrytime : 294105407714 nsecs
      .idle_sleeptime : 286135498094 nsecs
      .last_jiffies   : 4294966541
      .next_jiffies   : 4294966555
      .idle_expires   : 294179687500 nsecs
    jiffies: 4294966542


    Tick Device: mode:     1
    Clock Event Device: 32k-timer
     max_delta_ns:   2147483647
     min_delta_ns:   30517
     mult:           140737
     shift:          32
     mode:           3
     next_event:     294117187500 nsecs
     set_next_event: omap_32k_timer_set_next_event
     set_mode:       omap_32k_timer_set_mode
     event_handler:  hrtimer_interrupt
`

下面有一些需要检查的事项:

1. 检查你的时钟分辨率的报告。 如果你的时钟支持高精度，那么 `.resolution` 值将是 多少 ns。如果不支持的话，`.resolution` 值将等于 1 个 tick 对应的纳秒数（在嵌入式平台通常都是 10000ns）。

2. 检查时钟设备的 `event_handler`。 如果事件处理例程是 `hrtimer_interrupt` 时钟被设置成高精度。如果事件处理例程是 `tick_handle_periodic`， 那么时钟设备会设置成有规律的滴答。

3. 检查 timers 的列表，看属性 `.hres_active` 的值是否为 1。 如果是 1，高精度定时器的特性已经被激活了。

-   运行测试程序

我们可以运行一个简单的测试程序，实际测量定时器是否在一个滴答的周期内返回。如果是这样的话，这就是内核支持高精度时钟的最有力的证据，可以尝试的示例程序是
[cyclictest](http://rt.wiki.kernel.org/index.php/Cyclictest)。这里提供了一个使用 nanosleep 来测试时钟的示例程序

  ` cyclictest -n -p 80 -i 500 -l 5000`

这个命令行使用 `clock_nanosleep` 做测试， 优先级为 80，间隔 500us， 运行 5000 次迭代测试。

## 如何验证

看上面关于 cyclictest 的描述

## 示例结果

[使用样例外加测量结果。]

## 案例学习 1

## 案例学习 2

## 状态

-   状态: 已经实现
-   支持的体系结构:

    (对于每个架构, 任选一个状态: unknown, patches apply, compiles, runs, works, accepted)

    -   i386: 工作
    -   ARM: 不确定
    -   PPC: 工作
    -   MIPS: 不确定
    -   SH: 不确定

## 未来工作/行动清单

列出了未来可以为该分支做的一些事情:

-   文档
-   测试

## 陈旧的信息 (2.4版本内核)(译者注：这里不做翻译)

The High Resolution Timers system allows a user space program to be wake
up from a timer event with better accuracy, when using the POSIX timer
APIs. Without this system, the best accuracy that can be obtained for
timer events is 1 jiffy. This depends on the setting of HZ in the
kernel. In the 2.4 kernel, HZ was set to 100, which means that the best
accuracy you could get on a timer wakeup in user space was 10
milliseconds.

Put differently, if you asked for a timer event in 500 microseconds, you
would wake up in 10 milliseconds (at least).

To support this feature on a particular board, you have to add a kernel
driver that uses a timer on the system and supports the interface
documented in: ` include/linux/hrtime.h (in the CELF tree)` Additional
documentation about this feature is available in
` Documentation/high-res-timers/`

Patches for high-res timers were first presented at the time of kernel
version 2.5.47, in November, 2002. See [early
patches](http://lwn.net/Articles/14538/)


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [内核](http://eLinux.org/Category:Kernel "Category:Kernel")
