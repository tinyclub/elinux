> From: [eLinux.org](http://eLinux.org/High_Resolution_Timers "http://eLinux.org/High_Resolution_Timers")


# High Resolution Timers



## Contents

-   [1 描述](#描述)
-   [2 基本原理](#基本原理)
-   [3 资源](#资源)
    -   [3.1 项目](#项目)
        -   [3.1.1 hrtimers - Thomas Gleixner 的补丁](#hrtimers-thomas-gleixner的补丁)
        -   [3.1.2 HRT - Geoge Anzinger 的补丁](#hrt-geoge-anzinger的补丁)
-   [4 下载](#下载)
    -   [4.1 补丁](#补丁)
-   [5 实用程序](#实用程序)
-   [6 如何使用](#如何使用)
-   [7 如何检测你的时间系统是否支持高精度定时器](#如何检测你的时间系统是否支持高精度定时器)
-   [8 如何验证](#如何验证)
-   [9 示例结果](#示例结果)
-   [10 案例学习 1](#案例学习1)
-   [11 案例学习 2](#案例学习2)
-   [12 状态](#状态)
-   [13 未来工作/操作项目](#未来工作/操作项目)
-   [14 陈旧的信息(2.4内核)](#陈旧的信息(2.4内核))

## 描述

高精度定时器项目的目标是在Linux中实现POSIX 1003.1b Section 14(时钟，定时器)的API。 包括了对高精度定时器的支持 - 也就是说定时器的精度超过1个滴答。

当该项目启动时，Linux不支持POSIX的时钟和定时器的API。一段时钟后，时钟和定时器的API被实现，对高精度定时器支持的核心架构被mainline kernel(2.6.21内核)所接受. 然而在写这篇文章时，并不是所有的嵌入式平台都支持高精度定时器, 并且尽管在内核代码出现了高精度定时器的支持，仍然可以在内核对其进行配置。

## 基本原理

当时，Linux中的定时器仅仅支持1个滴答精度，滴答的时间长度依赖于内核中的HZ值,在i386和其他一些平台中是1ms，而在绝大多数的嵌入式平台是10ms。

十分需要高精度定时器使系统能在更加精确的时间间隔中唤醒和处理数据。

## 资源

### 项目

#### hrtimers - Thomas Gleixner的补丁

支持高精度定时器的一个项目是Thomas Gleixner的hrtimers

Thomas 于2006年7月在渥太华的Linux研讨会上做了一个演讲展示了hrtimers的现状. 演讲稿见这里:
[OLS
hrtimers](https://docs.google.com/file/d/0BzuiPiVvL63cNTYwYWE1YTgtODFhMS00NzM1LTlkMTItYWVlNzU3MWQ1NzA5/edit?sort=name&layout=list&pli=1&pid=0BzuiPiVvL63cNzJlODhmYWEtYWY1MS00Yjc1LTg5YzUtODViMDUzOTZjNzUz&cindex=89#)

在2006年7月, “通用时钟源”被mailine kernel(2.6.18-rc 版本)所接受. 这意味着在合适的时候该特性会在2.6.18版本中出现。 高精度定时器应该很快出现，很可能在2.6.19内核中出现.
在2006年2月, 风河的James Perkins写到:

* * * * *

ktimers被hrtimers所替代, hrtimers的主要部分被合并并且出现在Linux 2.6.16-rc2版本中。 hrtimers是itimers，nanosleep，posix-timer的基础. 高精度定时器在以下链接中被Jonathan Corbet很好的阐释了
[http://lwn.net/Articles/167897/](http://lwn.net/Articles/167897/)

由于在2.6.16-rc2中只有hrtimers的核心，hrtimers大体上使用系统的定时器作为他们的时钟源，以HZ运行. John Stultz
的通用时钟源代码并没有被合并. Thomas Gleixner 维护他的git tree
[http://www.tglx.de/projects/hrtimers/](http://www.tglx.de/projects/hrtimers/)
包含有通用的定时器源, 新的timeofday 补丁, 对一些架构来说真正实现了高精度定时器。

高精度定时器是实验的并发展的，首先关注于能让X86工作, 如果这些就充足了，推荐你使用2.6.16版本内核, 让我们知道有哪些问题或者做了哪些改进. 相反的是，在2.6.8-2.6.10时期，George Anzinger 领导的先前实现中提供了一套相当复杂的功能, , 但在那个时候这并不是一个活跃的项目。

* * * * *

*注意到现在HRT的维护者反对该特性。*

#### HRT - Geoge Anzinger的补丁

早于hrtimers, 提供高精度定时器的主要是George Anzinger 的补丁.官方的HRT补丁的页面在:

-   [high-res-timers](http://sourceforge.net/projects/high-res-timers/)



## 下载

### 补丁

-   看 [补丁程序的存档](http://eLinux.org/Patch_Archive "Patch Archive")
-   Tom Rini 对早期的2.6版本提交了一些补丁:
    -   [trini
        patches](http://source.mvista.com/~trini/hrt/hrt_07Dec2004_001_2.6.10-rc3.patch)

## 实用程序

## 如何使用

为使用高精度定时器需要确认内核在目标处理器（或板子）支持该特性。然而你仍需要在Linux内核中配置以支持它。
在你的内核配置中设置CONFIG\_HIGH\_RES\_TIMERS=y

编译内核并且安装到你的目标板上。

为使用Posix的时钟API，请使用在线资源
[[1]](http://www.opengroup.org/onlinepubs/009695399/basedefs/time.h.html)

## 如何检测你的时间系统是否支持高精度定时器

有许多种方式可以判定你的系统是否支持高精度定时器

-  检查内核的启动信息

看内核的启动信息或者使用 `dmesg`. 如果内核成功打开了高精度定时器,在启动的时候会打印信息： "Switched to high resolution mode on CPU0" (或者相似的信息)。

-   查看 /proc/timer\_list

也可以查看timer\_list, 可以查看列出的时钟是否支持是否支持高精度 下面列出了一份在 [OSK](http://eLinux.org/OSK "OSK")(ARM系列开发板)的/proc/timer\_list，显示了高精度定时器的时钟配置。

-   -   cat /proc/timer\_list

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

有一些东西需要注意:

1. 检查你的时钟分辨率的报告。 如果你的时钟支持高精度，那么.resolution值将是1ns。如果不支持的话，.resolution值将等于1个tick对应的纳秒数（在嵌入式平台通常都是10000ns）。

2. 对于tick device检查event\_handler. 如果事件处理是 'hrtimer\_interrupt' 时钟会以高精度启动。如果事件处理是'tick\_handle\_periodic', 那么时钟设备会以依赖于tick的启动.

3. 检查timer的列表, 看属性 .hres\_active 的值是否为1. 如果是这样的话，高精度定时器的特性已经被激活了.

-   运行测试程序

可以运行简单的测试程序, 最后测量定时器返回少于一个滴答的周期. 如果是这样的话这是最有力的证据证明你的内核支持高精度定时器，一个你可以尝试的示例程序是
[cyclictest](http://rt.wiki.kernel.org/index.php/Cyclictest). 这里提供了一个使用nanosleep来测试定时器的示例命令行

-   -   cyclictest -n -p 80 -i 500 -l 5000

这是 clock\_nanosleep的一个测试, 优先级为80, 间隔500ms, 运行500次迭代测试.

## 如何验证

看上面关于cyclictest的描述

## 示例结果

[测量结果使用例子.]

## 案例学习 1

## 案例学习 2

## 状态

-   状态: 已经实现
-   支持的体系结构:

(对于每个架构, 其中一个结果: unknown, patches apply, compiles, runs, works,
accepted)

-   -   i386: 工作
    -   ARM: 不确定
    -   PPC: 工作
    -   MIPS: 不确定
    -   SH: 不确定

## 未来工作/操作项目

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


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")
