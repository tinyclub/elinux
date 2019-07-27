**关注译者公众号**：
<br/>
<img src='../../../../pic/tinylab-wechat.jpg' width='110px'/>
<br/>

> From: [eLinux.org](http://elinux.org/Ftrace "http://eLinux.org/Ftrace")

原文：[eLinux.org](http://eLinux.org/Ftrace) <br />
翻译：@[unicornx](https://github.com/unicornx) <br />
校订：@ <br />


# Ftrace

Ftrace 是 Linux 内核内置的跟踪器，从 2.6.27 版本开始进入 Linux 内核。虽然当初被
命名为 Ftrace 的原因是取自 function tracer 的缩写（译者注，即“函数跟踪器”的意思），
但目前的 Ftrace 也包含了许多其他的特性。Ftrace 的函数跟踪功能十分强大，它可以跟
踪几乎内核中的所有函数。Ftrace 还支持动态开关，平时处于关闭状态下对内核的性能开
销几乎没有影响。

使用者可以通过 debugfs 文件系统下的 traceing 目录访问 Ftrace 子系统的功能。更详
细的信息可以通过访问
[Documentation/trace/ftrace.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/trace/ftrace.txt;).

## 目录

-   [1 trace-cmd](#trace-cmd)
-   [2 小贴士](#tips)
    -   [2.1 使用 Ftrace 跟踪一个指定的进程](#tracing-a-specific-process-with-the-ftrace-interface)
    -   [2.2 使用 trace-cmd 跟踪一个指定的进程](#tracing-a-specific-process-with-trace-cmd)
    -   [2.3 捕获内核启动过程中的异常并输出到串口控制台](#capturing-an-oops-from-startup-to-the-serial-console)
    -   [2.4 定位内核启动过程中的延迟](#find-latencies-on-kernel-startup)
    -   [2.5 内核栈的跟踪](#find-deepest-kernel-stack)
    -   [2.6 附加资源](#additional-resources)
    -   [2.7 pytimechart](#pytimechart)
    -   [2.8 使用 Ftrace 和 pytimechart 生成类似 bootchart 的输出效果](#bootchart-like-traces-with-ftrace-and-pytimechart)
    -   [2.9 输出](#output)

## trace-cmd

直接通过 debugfs 访问 Ftrace 十分繁琐耗时。所以系统提供了一个命令行的小工具
 trace-cmd 来和 Ftrace 交互，详细的说明可以参考 man 手册。

这里给出一些使用 trace-cmd 的例子：

    # trace-cmd record -e sched myprogram

上例中，使能了所有调度子系统（即 sched ）下的 Ftrace 跟踪点。通过查看 debugfs 文件
系统获得所有跟踪点的列表：

    # mount -t debugfs nodev /sys/kernel/debug
    # ls /sys/kernel/debug/tracing/events/sched
    enable                  sched_process_fork  sched_stat_sleep
    filter                  sched_process_free  sched_stat_wait
    sched_kthread_stop      sched_process_wait  sched_switch
    sched_kthread_stop_ret  sched_signal_send   sched_wait_task
    sched_migrate_task      sched_stat_iowait   sched_wakeup
    sched_process_exit      sched_stat_runtime  sched_wakeup_new

使用 trace-cmd 命令允许你无需访问 debugfs 文件系统就可以获取以上信息.

    # trace-cmd list -e | grep sched:
    sched:sched_kthread_stop
    sched:sched_kthread_stop_ret
    sched:sched_wait_task
    sched:sched_wakeup
    sched:sched_wakeup_new
    sched:sched_switch
    sched:sched_migrate_task
    sched:sched_process_free
    sched:sched_process_exit
    sched:sched_process_wait
    sched:sched_process_fork
    sched:sched_signal_send
    sched:sched_stat_wait
    sched:sched_stat_runtime
    sched:sched_stat_sleep
    sched:sched_stat_iowait

trace-cmd 代码的[git库](http://git.kernel.org/?p=linux/kernel/git/rostedt/trace-cmd.git;a=summary)

在该代码库中还有一个工具叫做 KernelShark，它是 trace-cmd 的图形用户界面。我们可
以使用 "make" 命令制作 trace-cmd，如果要制作 KernelShark 可以使用 "make gui" 命令。
KernelShark 额外依赖 GTK 库，而 trace-cmd 不需要。故允许 trace-cmd 单独编译，便于在嵌入式环境中使用。

## 小贴士

### 使用 Ftrace 跟踪一个指定的进程

（改编自 Steven Rostedt 的电子邮件）若要跟踪某个程序中调用的内核函数，可以将虚拟
变量 'set-ftrace-pid' 的值设置为执行该程序的进程的进程号（pid）。

如果执行该进程还未运行，那么我们该如何获得进程号并设置呢？方法是编写一个 shell 脚
本并通过调用 'exec' 命令来实现。

方法如下：

    #!/bin/sh
    echo $$ > /debug/tracing/set_ftrace_pid
    # can set other filtering here
    echo function > /debug/tracing/current_tracer
    exec $*

在这个例子里，'\$\$' 可以获得当前执行进程的进程号（也就是执行该 shell 脚本的进程
的进程号。将该进程号设置到 'set\_ftrace\_pid' 变量中，然后使能 'function' 跟踪器。
最后该脚本调用 'exec' 命令执行该程序（执行程序的命令由脚本的参数指定）。

一个例子（假设脚本的名字为'trace\_command'）：

    trace_command ls

### 使用 trace-cmd 跟踪一个指定的进程

    # trace-cmd record -p function -F ls

### 捕获内核启动过程中的异常并输出到串口控制台

若要捕获一个导致异常的函数调用，可在内核启动命令行加入下述参数：

    ftrace=function ftrace_dump_on_oops

*注意：如果你愿意也可以使用 'ftrace=function\_graph' 。*

内核的 Documentation/trace/ftrace.txt 介绍了如何在内核运行过程中去动态设置 
ftrace\_dump\_on\_oops 这个参数，但我发现，试图借此捕获内核启动中的异常，非常困难。
所以比较靠谱的方法还是在内核启动前就通过命令行参数设置，只不过该方法的缺点在于
会输出内核启动中（用户空间程序启动前）的所有异常信息。

注意这样的话，输出的内容会非常长，请保持耐心。

输出的例子大致如下：

         ash-56      0d..2. 159400967us : _raw_spin_lock <-vprintk
         ash-56      0d..2. 159400972us : __raw_spin_lock <-_raw_spin_lock
         ash-56      0d..2. 159400974us : add_preempt_count <-__raw_spin_lock
         ash-56      0d..3. 159400978us : log_prefix <-vprintk
         ash-56      0d..3. 159400979us : emit_log_char <-vprintk
         ash-56      0d..3. 159400981us : console_trylock <-vprintk
         ash-56      0d..3. 159400983us : down_trylock <-console_trylock
         ash-56      0d..3. 159400985us : _raw_spin_lock_irqsave <-down_trylock
         ash-56      0d..3. 159400987us : __raw_spin_lock_irqsave <-_raw_spin_lock_irqsave
         ash-56      0d..3. 159400989us : add_preempt_count <-__raw_spin_lock_irqsave
         ash-56      0d..4. 159400991us : _raw_spin_unlock_irqrestore <-down_trylock
         ash-56      0d..4. 159400993us : sub_preempt_count <-_raw_spin_unlock_irqrestore
         ash-56      0d..3. 159400994us : _raw_spin_unlock <-vprintk
         ash-56      0d..3. 159400997us : sub_preempt_count <-_raw_spin_unlock
         ash-56      0d..2. 159400999us : console_unlock <-vprintk
         ash-56      0d..2. 159401000us : _raw_spin_lock_irqsave <-console_unlock
         ash-56      0d..2. 159401002us : __raw_spin_lock_irqsave <-_raw_spin_lock_irqsave
         ash-56      0d..2. 159401004us : add_preempt_count <-__raw_spin_lock_irqsave
         ash-56      0d..3. 159401006us : _raw_spin_unlock <-console_unlock
         ash-56      0d..3. 159401008us : sub_preempt_count <-_raw_spin_unlock
         ash-56      0d..2. 159401010us : _call_console_drivers <-console_unlock
         ash-56      0d..2. 159401012us : _call_console_drivers <-console_unlock
         ash-56      0d..2. 159401014us : _raw_spin_lock_irqsave <-console_unlock
         ash-56      0d..2. 159401015us : __raw_spin_lock_irqsave <-_raw_spin_lock_irqsave
         ash-56      0d..2. 159401017us : add_preempt_count <-__raw_spin_lock_irqsave
         ash-56      0d..3. 159401019us : up <-console_unlock
         ash-56      0d..3. 159401021us : _raw_spin_lock_irqsave <-up
         ash-56      0d..3. 159401023us : __raw_spin_lock_irqsave <-_raw_spin_lock_irqsave
         ash-56      0d..3. 159401024us : add_preempt_count <-__raw_spin_lock_irqsave
         ash-56      0d..4. 159401027us : _raw_spin_unlock_irqrestore <-up
         ash-56      0d..4. 159401029us : sub_preempt_count <-_raw_spin_unlock_irqrestore
         ash-56      0d..3. 159401031us : _raw_spin_unlock_irqrestore <-console_unlock
         ash-56      0d..3. 159401033us : sub_preempt_count <-_raw_spin_unlock_irqrestore
         ash-56      0d..2. 159401034us : wake_up_klogd <-console_unlock
         ash-56      0d..2. 159401037us : sub_preempt_count <-vprintk
         ash-56      0d..1. 159401039us : die <-__do_kernel_fault
         ash-56      0d..1. 159401041us : oops_enter <-die
    ---------------------------------
    Modules linked in:
    CPU: 0    Not tainted  (3.0.27_nl-kzm-a9-rt46-00022-g5e35327 #2)
    PC is at sysrq_handle_crash+0x40/0x50
    LR is at _raw_spin_unlock_irqrestore+0x34/0x54
    pc : [<801b7dd4>]    lr : [<802f5420>]    psr: 60000093
    sp : 9f0cdeb0  ip : 802f7ed4  fp : 9f0cdebc
    r10: 9f0cdf68  r9 : 9fbaedc8  r8 : 00000000
    r7 : 60000013  r6 : 00000063  r5 : 00000001  r4 : 8044b890
    r3 : 00000000  r2 : 00000001  r1 : 20000093  r0 : 00000001
    Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
    Control: 10c5787d  Table: 5f11c04a  DAC: 00000015
    Process ash (pid: 56, stack limit = 0x9f0cc2f0)
    Stack: (0x9f0cdeb0 to 0x9f0ce000)
    dea0:                                     9f0cdee4 9f0cdec0 801b85d0 801b7da0
    dec0: 9f0cdf68 00000002 801b867c 9f07a960 00000002 2ad20000 9f0cdefc 9f0cdee8
    dee0: 801b86b0 801b852c 9f0cdf68 9fbaed80 9f0cdf2c 9f0cdf00 80108a84 801b8688
    df00: 9f0cdf68 00000002 9f07a960 2ad20000 9f0cdf68 2ad20000 00000001 00000000
    df20: 9f0cdf5c 9f0cdf30 800c2f14 80108a00 00000002 00000889 800c4978 00000002
    df40: 9f07a960 0005a750 00000002 2ad20000 9f0cdfa4 9f0cdf60 800c3250 800c2e5c
    df60: 00020001 0004423c 00000000 00000000 9f0cc000 00000000 9f0cdfa4 00000002
    df80: 2ad20000 0005a750 00000004 8000db24 9f0cc000 00000000 00000000 9f0cdfa8
    dfa0: 8000d8c0 800c3208 00000002 2ad20000 00000001 2ad20000 00000002 00000889
    dfc0: 00000002 2ad20000 0005a750 00000004 00000001 00000000 2ad093b8 7e8766d4
    dfe0: 00000000 7e8766c0 2ac20f08 2ac023ec 40000010 00000001 00000000 00000000
    Backtrace:
    [<801b7d94>] (sysrq_handle_crash+0x0/0x50) from [<801b85d0>] (__handle_sysrq+0xb0/0x15c)
    [<801b8520>] (__handle_sysrq+0x0/0x15c) from [<801b86b0>] (write_sysrq_trigger+0x34/0x44)
     r8:2ad20000 r7:00000002 r6:9f07a960 r5:801b867c r4:00000002
    r3:9f0cdf68
    [<801b867c>] (write_sysrq_trigger+0x0/0x44) from [<80108a84>] (proc_reg_write+0x90/0xa4)
     r4:9fbaed80 r3:9f0cdf68
    [<801089f4>] (proc_reg_write+0x0/0xa4) from [<800c2f14>] (vfs_write+0xc4/0x150)
    [<800c2e50>] (vfs_write+0x0/0x150) from [<800c3250>] (sys_write+0x54/0x110)
     r8:2ad20000 r7:00000002 r6:0005a750 r5:9f07a960 r4:00000002
    [<800c31fc>] (sys_write+0x0/0x110) from [<8000d8c0>] (ret_fast_syscall+0x0/0x30)
    Code: 0a000000 e12fff33 e3a03000 e3a02001 (e5c32000)
    ---[ end trace feb441c6e3b9c3f1 ]---
    Kernel panic - not syncing: Fatal exception
    Backtrace:
    [<80011908>] (dump_backtrace+0x0/0x114) from [<802f2304>] (dump_stack+0x20/0x24)
     r6:9f0cdd1c r5:8039bb64 r4:8045dc40 r3:00000002
    [<802f22e4>] (dump_stack+0x0/0x24) from [<802f2404>] (panic+0xfc/0x220)
    [<802f2308>] (panic+0x0/0x220) from [<80011dd4>] (die+0x18c/0x1d0)
     r3:00000001 r2:9f0cdd28 r1:20000113 r0:8039bb64
     r7:00000001
    [<80011c48>] (die+0x0/0x1d0) from [<80014edc>] (__do_kernel_fault+0x74/0x94)
     r8:00000000 r7:9f0cde68 r6:9f0c1d40 r5:00000817 r4:00000000
    [<80014e68>] (__do_kernel_fault+0x0/0x94) from [<802f7ca0>] (do_page_fault+0x254/0x274)
     r8:00000817 r7:9f0c1d40 r6:9f06d5e0 r5:00000000 r4:9f0cde68
    r3:9f0cde68
    [<802f7a4c>] (do_page_fault+0x0/0x274) from [<802f7db0>] (do_DataAbort+0x40/0xa8)
    [<802f7d70>] (do_DataAbort+0x0/0xa8) from [<802f5d98>] (__dabt_svc+0x38/0x60)
     r8:00000000 r7:9f0cde9c r6:ffffffff r5:60000093 r4:801b7dd4
    [<801b7d94>] (sysrq_handle_crash+0x0/0x50) from [<801b85d0>] (__handle_sysrq+0xb0/0x15c)
    [<801b8520>] (__handle_sysrq+0x0/0x15c) from [<801b86b0>] (write_sysrq_trigger+0x34/0x44)
     r8:2ad20000 r7:00000002 r6:9f07a960 r5:801b867c r4:00000002
    r3:9f0cdf68
    [<801b867c>] (write_sysrq_trigger+0x0/0x44) from [<80108a84>] (proc_reg_write+0x90/0xa4)
     r4:9fbaed80 r3:9f0cdf68
    [<801089f4>] (proc_reg_write+0x0/0xa4) from [<800c2f14>] (vfs_write+0xc4/0x150)
    [<800c2e50>] (vfs_write+0x0/0x150) from [<800c3250>] (sys_write+0x54/0x110)
     r8:2ad20000 r7:00000002 r6:0005a750 r5:9f07a960 r4:00000002
    [<800c31fc>] (sys_write+0x0/0x110) from [<8000d8c0>] (ret_fast_syscall+0x0/0x30)
    CPU1: stopping
    Backtrace:
    [<80011908>] (dump_backtrace+0x0/0x114) from [<802f2304>] (dump_stack+0x20/0x24)
     r6:00000006 r5:00000001 r4:00000000 r3:00000000
    [<802f22e4>] (dump_stack+0x0/0x24) from [<80008308>] (do_IPI+0xd8/0x148)
    [<80008230>] (do_IPI+0x0/0x148) from [<802f5df4>] (__irq_svc+0x34/0xd0)
    Exception stack(0x9fb47f68 to 0x9fb47fb0)
    7f60:                   00000000 00000000 f300a000 00000000 9fb46000 80432444
    7f80: 8045d464 802fd754 4000406a 411fc092 00000000 9fb47fbc 8000e660 9fb47fb0
    7fa0: 8000e67c 8000e680 60000013 ffffffff
     r7:9fb47f9c r6:f0020000 r5:60000013 r4:8000e680
    [<8000e64c>] (default_idle+0x0/0x38) from [<8000e920>] (cpu_idle+0x88/0xcc)
    [<8000e898>] (cpu_idle+0x0/0xcc) from [<802f0130>] (secondary_start_kernel+0x140/0x164)
     r7:8045d57c r6:10c0387d r5:8043a2f8 r4:00000001
    [<802efff0>] (secondary_start_kernel+0x0/0x164) from [<402efab4>] (0x402efab4)
     r5:00000015 r4:5fb4806a

### 定位内核启动过程中的延迟

使用 ftrace 的 'tracing\_thresh' 选项可以记录函数执行是否超过了一个特定的时长。
这可以被用来检查函数在内核启动过程中是否消耗了较长的时间，从而帮助我们优化启动时
长：

-   确保如下内核配置选项打开：
    -   CONFIG\_FTRACE: "Tracers"
    -   CONFIG\_FUNCTION\_TRACER: "Kernel Function Tracer"
    -   CONFIG\_FUNCTION\_GRAPH\_TRACER: "Kernel Function Graph Tracer"
-   在内核启动命令行参数中使用如下选项：
    -   tracing\_thresh=200 ftrace=function\_graph
        -   这样设置会跟踪所有执行超过200微秒（0.2毫秒）的函数。你可以根据自己的需要指定时间阈值。
-   获取跟踪结果的方法：
    -   \$ mount -t debugfs debugfs /debug
    -   \$ cat /debug/tracing/trace

如上命令可能需要编写在初始化脚本中（作为 init 脚本的一部分）以避免数据丢失。

-   捕获操作的生效范围
    -   跟踪发生在初始化期间，而且必然发生在时间初始化完成之后。


### 内核栈的跟踪

若能跟踪函数调用栈的最大深度，那对于调试系统将是一件很有用的事。Ftrace 可以持续
地监视所有进程的函数调用栈的深度，当超出最大深度时可以将此时的函数栈完整记录下来。

（下面的说明适用于 Linux 的 v3.0 的内核）

-   内核配置：需要设置如下内核配置选项：
    -   CONFIG\_FTRACE: "Tracers"
    -   CONFIG\_FUNCTION\_TRACER: "Kernel Function Tracer"
    -   CONFIG\_STACK\_TRACER: "Trace max stack"
-   功能开关：在引导阶段或者任何运行期间都可以打开或者关闭该功能。
    -   在内核引导阶段，使用如下内核命令行参数：
        -   stacktrace
    -   在内核运行阶段：
        -   echo 1 \>/proc/sys/kernel/stack\_tracer\_enabled
-   获取跟踪结果的方法：
    -   \$ mount -t debugfs debugfs /debug
    -   \$ cat /debug/tracing/stack\_trace
-   捕获操作的生效范围
    -   对函数栈的跟踪会持续进行指导你关闭该功能，关闭的方法如下：
        -   echo 0 \>/proc/sys/kernel/stack\_tracer\_enabled

### 附加资源

参考 [http://lwn.net/Articles/295955/](http://lwn.net/Articles/295955/)

### pytimechart

pytimechart 是一款可以将 ftrace 的跟踪结果可视化输出的工具。参考
[http://packages.python.org/pytimechart/userguide.html](http://packages.python.org/pytimechart/userguide.html)

### 使用 Ftrace 和 pytimechart 生成类似 bootchart 的输出效果

添加如下内核启动命令行参数可以在内核启动过程中启动跟踪采样，可以使用 pytimechart 
对其输出进行处理产生方便人观察的结果。

        trace_event=sched:*,timer:*,irq:* trace_buf_size=40M

### 输出

在ARM架构上输出的例子：

    /debug/tracing # cat stack_trace
            Depth    Size   Location    (42 entries)
            -----    ----   --------
      0)     3328      16   ftrace_test_stop_func+0x28/0x34
      1)     3312      28   __gnu_mcount_nc+0x58/0x60
      2)     3284      52   skb_release_data+0xc0/0xc8
      3)     3232      24   __kfree_skb+0x24/0xc0
      4)     3208      32   consume_skb+0xe4/0xf0
      5)     3176      56   smsc911x_hard_start_xmit+0x188/0x2f4
      6)     3120      72   dev_hard_start_xmit+0x440/0x6a4
      7)     3048      40   sch_direct_xmit+0x8c/0x1f8
      8)     3008      48   dev_queue_xmit+0x2c8/0x570
      9)     2960      56   neigh_resolve_output+0x32c/0x390
     10)     2904      40   ip_finish_output+0x2bc/0x37c
     11)     2864      32   ip_output+0xb0/0xb8
     12)     2832      24   ip_local_out+0x38/0x3c
     13)     2808      32   ip_send_skb+0x18/0xa4
     14)     2776      56   udp_send_skb+0x274/0x394
     15)     2720     240   udp_sendmsg+0x4dc/0x748
     16)     2480      32   inet_sendmsg+0x70/0x7c
     17)     2448     232   sock_sendmsg+0xa8/0x160
     18)     2216      32   kernel_sendmsg+0x40/0x48
     19)     2184      96   xs_send_kvec+0xa8/0xb0
     20)     2088      64   xs_sendpages+0x90/0x1f8
     21)     2024      40   xs_udp_send_request+0x4c/0x13c
     22)     1984      48   xprt_transmit+0x114/0x214
     23)     1936      40   call_transmit+0x208/0x27c
     24)     1896      48   __rpc_execute+0x88/0x334
     25)     1848      24   rpc_execute+0x68/0x70
     26)     1824      24   rpc_run_task+0xa8/0xb4
     27)     1800      64   rpc_call_sync+0x68/0x90
     28)     1736      32   nfs_rpc_wrapper.clone.6+0x3c/0x7c
     29)     1704      48   nfs_proc_getattr+0x70/0xac
     30)     1656      48   __nfs_revalidate_inode+0xe4/0x1f8
     31)     1608      56   nfs_lookup_revalidate+0x1ac/0x40c
     32)     1552      72   do_lookup+0x228/0x2e4
     33)     1480      72   do_last.clone.44+0x10c/0x688
     34)     1408      88   path_openat+0x2fc/0x394
     35)     1320     144   do_filp_open+0x40/0x8c
     36)     1176      40   open_exec+0x2c/0xc0
     37)     1136     136   load_elf_binary+0x1cc/0x12b8
     38)     1000      72   search_binary_handler+0x150/0x3a0
     39)      928      56   do_execve+0x170/0x328
     40)      872      32   sys_execve+0x44/0x64
     41)      840     840   ret_fast_syscall+0x0/0x30


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux tracing](http://eLinux.org/Category:Linux_tracing "Category:Linux tracing")

