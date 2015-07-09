> From: [eLinux.org](http://eLinux.org/Ftrace "http://eLinux.org/Ftrace")


# Ftrace



Ftrace is the Linux kernel internal tracer that was included in the
Linux kernel in 2.6.27. Although Ftrace is named after the function
tracer it also includes many more functionalities. But the function
tracer is the part of Ftrace that makes it unique as you can trace
almost any function in the kernel and with dynamic Ftrace, it has no
overhead when not enabled.

The interface for Ftrace resides in the debugfs file system in the
tracing directory. Documentation for this can be found in the Linux
kernel source tree at
[Documentation/trace/ftrace.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/trace/ftrace.txt;).

## Contents

-   [1 trace-cmd](#trace-cmd)
-   [2 Tips](#tips)
    -   [2.1 Tracing a specific process with the Ftrace
        interface](#tracing-a-specific-process-with-the-ftrace-interface)
    -   [2.2 Tracing a specific process with
        trace-cmd](#tracing-a-specific-process-with-trace-cmd)
    -   [2.3 Capturing an oops (from startup) to the serial
        console](#capturing-an-oops-from-startup-to-the-serial-console)
    -   [2.4 Find latencies on kernel
        startup](#find-latencies-on-kernel-startup)
    -   [2.5 Find deepest kernel stack](#find-deepest-kernel-stack)
    -   [2.6 additional resources](#additional-resources)
    -   [2.7 pytimechart](#pytimechart)
    -   [2.8 bootchart like traces with ftrace and
        pytimechart](#bootchart-like-traces-with-ftrace-and-pytimechart)
    -   [2.9 output](#output)

## trace-cmd

Using the Ftrace debugfs interface can be awkward and time consuming.
trace-cmd was created to interface with Ftrace using a binary tool which
comes with full documentation in man pages.

Here's some examples of trace-cmd:

    # trace-cmd record -e sched myprogram

The above will enable all the Ftrace tracepoints that are grouped under
the sched system. You can find these tracepoints by looking at the
debugfs system:

    # mount -t debugfs nodev /sys/kernel/debug
    # ls /sys/kernel/debug/tracing/events/sched
    enable                  sched-process-fork  sched-stat-sleep
    filter                  sched-process-free  sched-stat-wait
    sched-kthread-stop      sched-process-wait  sched-switch
    sched-kthread-stop-ret  sched-signal-send   sched-wait-task
    sched-migrate-task      sched-stat-iowait   sched-wakeup
    sched-process-exit      sched-stat-runtime  sched-wakeup-new

trace-cmd allows you to see the possible events without needing to look
at this directory as well.

    # trace-cmd list -e | grep sched:
    sched:sched-kthread-stop
    sched:sched-kthread-stop-ret
    sched:sched-wait-task
    sched:sched-wakeup
    sched:sched-wakeup-new
    sched:sched-switch
    sched:sched-migrate-task
    sched:sched-process-free
    sched:sched-process-exit
    sched:sched-process-wait
    sched:sched-process-fork
    sched:sched-signal-send
    sched:sched-stat-wait
    sched:sched-stat-runtime
    sched:sched-stat-sleep
    sched:sched-stat-iowait

You can find trace-cmd in its
[git](http//git-kernel.org/?p=linux/kernel/git/rostedt/trace-cmd.git;a=summary)
repository.

Also within that same repository is KernelShark, which is a graphical
user interface to trace-cmd. trace-cmd is built with just "make" and
KernelShark is created with "make gui". This allows building trace-cmd
on your embedded device and keeping the build from needing the GTK
libraries required by KernelShark.



## Tips

### Tracing a specific process with the Ftrace interface

(Adapted from email by Steven Rostedt) To trace just the kernel
functions executed in the context of a particular function, set the
pseudo-variable 'set-ftrace-pid', to the process id (pid) of the
process.

If the process is not already running, you can use a wrapper shell
script and the 'exec' command, to execute a command as a known pid.

Like so:

    #!/bin/sh
    echo $$ > /debug/tracing/set-ftrace-pid
    # can set other filtering here
    echo function > /debug/tracing/current-tracer
    exec $*

In this example, '\$\$' is the pid of the currently executing process
(the shell script. This is set into the 'set\-ftrace\-pid' variable,
then the 'function' tracer is enabled. Then this script exec's the
command (specified by the first argument to the script).

Example usage (assuming script is called 'trace\-command'):

    trace-command ls

### Tracing a specific process with trace-cmd

    # trace-cmd record -p function -F ls

### Capturing an oops (from startup) to the serial console

You can capture the function calls leading up to a panic by placing the
following on the kernel command line:

    ftrace=function ftrace-dump-on-oops

*Note: You can also use 'ftrace=function\-graph' if you would prefer
that instead.*

The ftrace documentation, in Documentation/trace/ftrace.txt mentions how
to set ftrace\-dump\-on\-oops in a running system, but I have found it
very handy to have it configured to dump the trace from kernel startup,
so that any panics that occur during boot (before user-space is started)
are also captured.

Note that the output will be VERY long. Please be patient.

The output will look something like the following:

         ash-56      0d..2. 159400967us : -raw-spin-lock <-vprintk
         ash-56      0d..2. 159400972us : -raw-spin-lock <-raw-spin-lock
         ash-56      0d..2. 159400974us : add-preempt-count <-raw-spin-lock
         ash-56      0d..3. 159400978us : log-prefix <-vprintk
         ash-56      0d..3. 159400979us : emit-log-char <-vprintk
         ash-56      0d..3. 159400981us : console-trylock <-vprintk
         ash-56      0d..3. 159400983us : down-trylock <-console-trylock
         ash-56      0d..3. 159400985us : -raw-spin-lock-irqsave <-down-trylock
         ash-56      0d..3. 159400987us : -raw-spin-lock-irqsave <-raw-spin-lock-irqsave
         ash-56      0d..3. 159400989us : add-preempt-count <-raw-spin-lock-irqsave
         ash-56      0d..4. 159400991us : -raw-spin-unlock-irqrestore <-down-trylock
         ash-56      0d..4. 159400993us : sub-preempt-count <-raw-spin-unlock-irqrestore
         ash-56      0d..3. 159400994us : -raw-spin-unlock <-vprintk
         ash-56      0d..3. 159400997us : sub-preempt-count <-raw-spin-unlock
         ash-56      0d..2. 159400999us : console-unlock <-vprintk
         ash-56      0d..2. 159401000us : -raw-spin-lock-irqsave <-console-unlock
         ash-56      0d..2. 159401002us : -raw-spin-lock-irqsave <-raw-spin-lock-irqsave
         ash-56      0d..2. 159401004us : add-preempt-count <-raw-spin-lock-irqsave
         ash-56      0d..3. 159401006us : -raw-spin-unlock <-console-unlock
         ash-56      0d..3. 159401008us : sub-preempt-count <-raw-spin-unlock
         ash-56      0d..2. 159401010us : -call-console-drivers <-console-unlock
         ash-56      0d..2. 159401012us : -call-console-drivers <-console-unlock
         ash-56      0d..2. 159401014us : -raw-spin-lock-irqsave <-console-unlock
         ash-56      0d..2. 159401015us : -raw-spin-lock-irqsave <-raw-spin-lock-irqsave
         ash-56      0d..2. 159401017us : add-preempt-count <-raw-spin-lock-irqsave
         ash-56      0d..3. 159401019us : up <-console-unlock
         ash-56      0d..3. 159401021us : -raw-spin-lock-irqsave <-up
         ash-56      0d..3. 159401023us : -raw-spin-lock-irqsave <-raw-spin-lock-irqsave
         ash-56      0d..3. 159401024us : add-preempt-count <-raw-spin-lock-irqsave
         ash-56      0d..4. 159401-us : -raw-spin-unlock-irqrestore <-up
         ash-56      0d..4. 159401us : sub-preempt-count <-raw-spin-unlock-irqrestore
         ash-56      0d..3. 159401031us : -raw-spin-unlock-irqrestore <-console-unlock
         ash-56      0d..3. 159401033us : sub-preempt-count <-raw-spin-unlock-irqrestore
         ash-56      0d..2. 159401034us : wake-up-klogd <-console-unlock
         ash-56      0d..2. 159401037us : sub-preempt-count <-vprintk
         ash-56      0d..1. 159401039us : die <-do-kernel-fault
         ash-56      0d..1. 159401041us : oops-enter <-die
    ---------
    Modules linked in:
    CPU: 0    Not tainted  (3-0-nl-kzm-a9-rt46-00022-g5e35- #2)
    PC is at sysrq-handle-crash+0x40/0x50
    LR is at -raw-spin-unlock-irqrestore+0x34/0x54
    pc : [<801d4>]    lr : [<8-5420>]    psr: 60000093
    sp : 9f0cdeb0  ip : 8-7ed4  fp : 9f0cdebc
    r10: 9f0cdf68  r9 : 9fbaedc8  r8 : 00000000
    r7 : 60000013  r6 : 00000063  r5 : 00000001  r4 : 8044b890
    r3 : 00000000  r2 : 00000001  r1 : 20000093  r0 : 00000001
    Flags: nZCv  IRQs off  FIQs on  Mode SVC-32  ISA ARM  Segment user
    Control: 10c57  Table: 5f11c04a  DAC: 00000015
    Process ash (pid 56, stack limit = 0x9f0c-0)
    Stack: (0x9f0cdeb0 to 0x9f0ce000)
    dea0:                                     9f0cdee4 9f0cdec0 801b0 801a0
    dec0: 9f0cdf68 00000002 801b8- 9f07a960 00000002 2ad20000 9f0cdefc 9f0cdee8
    dee0: 801b86b0 801b8 9f0cdf68 9fbaed80 9f0cd 9f0cdf00 80108a84 801b8688
    df00: 9f0cdf68 00000002 9f07a960 2ad20000 9f0cdf68 2ad20000 00000001 00000000
    df20: 9f0cdf5c 9f0cdf30 800-14 80108a00 00000002 00000889 800c4978 00000002
    df40: 9f07a960 0005a750 00000002 2ad20000 9f0cdfa4 9f0cdf60 800c3250 800c2e5c
    df60: 00020001 0004423c 00000000 00000000 9f0cc000 00000000 9f0cdfa4 00000002
    df80: 2ad20000 0005a750 00000004 8000db24 9f0cc000 00000000 00000000 9f0cdfa8
    dfa0: 8000d8c0 800c3208 00000002 2ad20000 00000001 2ad20000 00000002 00000889
    dfc0: 00000002 2ad20000 0005a750 00000004 00000001 00000000 2ad093b8 7e8766d4
    dfe0: 00000000 7e8766c0 2ac20f08 2ac023ec 40000010 00000001 00000000 00000000
    Backtrace:
    [<80194>] (sysrq-handle-crash+0x0/0x50) from [<801b0>] (-handle-sysrq+0xb0/0x15c)
    [<801b8520>] (-handle-sysrq+0x0/0x15c) from [<801b86b0>] (write-sysrq-trigger+0x34/0x44)
     r8:2ad20000 r7:00000002 r6:9f07a960 r5:801b8- r4:00000002
    r3:9f0cdf68
    [<801b8->] (write-sysrq-trigger+0x0/0x44) from [<80108a84>] (proc-reg-write+0x90/0xa4)
     r4:9fbaed80 r3:9f0cdf68
    [<801089f4>] (proc-reg-write+0x0/0xa4) from [<800-14>] (vfs-write+0xc4/0x150)
    [<800c2e50>] (vfs-write+0x0/0x150) from [<800c3250>] (sys-write+0x54/0x110)
     r8:2ad20000 r7:00000002 r6:0005a750 r5:9f07a960 r4:00000002
    [<800c31fc>] (sys-write+0x0/0x110) from [<8000d8c0>] (ret-fast-syscall+0x0/0x30)
    Code: 0a000000 e-ff33 e3a03000 e3a02001 (e5c32000)
    -[ end trace feb441c6e3b9c3f1 ]-
    Kernel panic - not syncing: Fatal exception
    Backtrace:
    [<80011908>] (dump-backtrace+0x0/0x114) from [<8-2304>] (dump-stack+0x20/0x24)
     r6:9f0cdd1c r5:8039bb64 r4:80c40 r3:00000002
    [<8-22e4>] (dump-stack+0x0/0x24) from [<8-2404>] (panic+0xfc/0x220)
    [<8-2308>] (panic+0x0/0x220) from [<80011dd4>] (die+0x18c/0x1d0)
     r3:00000001 r2:9f0cd r1:20000113 r0:8039bb64
     r7:00000001
    [<80011c48>] (die+0x0/0x1d0) from [<80014edc>] (-do-kernel-fault+0x74/0x94)
     r8:00000000 r7:9f0cde68 r6:9f0c1d40 r5:00000817 r4:00000000
    [<80014e68>] (-do-kernel-fault+0x0/0x94) from [<8-a0>] (do-page-fault+0x254/0-4)
     r8:00000817 r7:9f0c1d40 r6:9f06d5e0 r5:00000000 r4:9f0cde68
    r3:9f0cde68
    [<8-7a4c>] (do-page-fault+0x0/0-4) from [<8b0>] (do-DataAbort+0x40/0xa8)
    [<870>] (do-DataAbort+0x0/0xa8) from [<898>] (-dabt-svc+0x38/0x60)
     r8:00000000 r7:9f0cde9c r6:ffffffff r5:60000093 r4:801d4
    [<80194>] (sysrq-handle-crash+0x0/0x50) from [<801b0>] (-handle-sysrq+0xb0/0x15c)
    [<801b8520>] (-handle-sysrq+0x0/0x15c) from [<801b86b0>] (write-sysrq-trigger+0x34/0x44)
     r8:2ad20000 r7:00000002 r6:9f07a960 r5:801b8- r4:00000002
    r3:9f0cdf68
    [<801b8->] (write-sysrq-trigger+0x0/0x44) from [<80108a84>] (proc-reg-write+0x90/0xa4)
     r4:9fbaed80 r3:9f0cdf68
    [<801089f4>] (proc-reg-write+0x0/0xa4) from [<800-14>] (vfs-write+0xc4/0x150)
    [<800c2e50>] (vfs-write+0x0/0x150) from [<800c3250>] (sys-write+0x54/0x110)
     r8:2ad20000 r7:00000002 r6:0005a750 r5:9f07a960 r4:00000002
    [<800c31fc>] (sys-write+0x0/0x110) from [<8000d8c0>] (ret-fast-syscall+0x0/0x30)
    CPU1: stopping
    Backtrace:
    [<80011908>] (dump-backtrace+0x0/0x114) from [<8-2304>] (dump-stack+0x20/0x24)
     r6:00000006 r5:00000001 r4:00000000 r3:00000000
    [<8-22e4>] (dump-stack+0x0/0x24) from [<80008308>] (do-IPI+0xd8/0x148)
    [<80008230>] (do-IPI+0x0/0x148) from [<8f4>] (-irq-svc+0x34/0xd0)
    Exception stack(0x9fb47f68 to 0x9fb47fb0)
    7f60:                   00000000 00000000 f300a000 00000000 9fb46000 80432444
    7f80: 80464 8-d754 4000406a 411fc092 00000000 9fb47fbc 8000e660 9fb47fb0
    7fa0: 8000e- 8000e680 60000013 ffffffff
     r7:9fb47f9c r6:f0020000 r5:60000013 r4:8000e680
    [<8000e64c>] (default-idle+0x0/0x38) from [<8000e920>] (cpu-idle+0x88/0xcc)
    [<8000e898>] (cpu-idle+0x0/0xcc) from [<8-0130>] (secondary-start-kernel+0x140/0x164)
     r7:80- r6:10c03 r5:8043-8 r4:00000001
    [<802efff0>] (secondary-start-kernel+0x0/0x164) from [<402efab4>] (0x402efab4)
     r5:00000015 r4:5fb4806a

### Find latencies on kernel startup

It is possible to use ftrace to record functions that exceed a certain
amount of time, using the 'tracing\-thresh' option. This can be used for
finding routines that are taking a long time on kernel startup, to help
optimize bootup time:

-   Make sure the following kerne configuration options are set:
    -   CONFIG\-FTRACE: "Tracers"
    -   CONFIG\-FUNCTION\-TRACER: "Kernel Function Tracer"
    -   CONFIG\-FUNCTION\-GRAPH\-TRACER: "Kernel Function Graph Tracer"
-   Use the following on the kernel command line:
    -   tracing\-thresh=200 ftrace=function\-graph
        -   this traces all functions taking longer than 200
            microseconds (-2 ms). You can use any duration threshhold
            you want.
-   to get the data:
    -   \$ mount -t debugfs debugfs /debug
    -   \$ cat /debug/tracing/trace

These command should be probably be done programatically (as part of an
init script), to avoid data loss

-   scope of operation
    -   the tracer starts sometime during initialization, and you only
        get timings after it starts



### Find deepest kernel stack

This is useful to find the routine with the deepest kernel stack The
system continually monitors the stack depth of all processes, and
whenever a low-water mark is hit (deepest stack), it records the list of
functions.

(The following instructions work for a v3-0 Linux kernel)

-   Kernel configuration: Set the following kernel configuration
    options:
    -   CONFIG\-FTRACE: "Tracers"
    -   CONFIG\-FUNCTION\-TRACER: "Kernel Function Tracer"
    -   CONFIG\-STACK\-TRACER: "Trace max stack"
-   Turning it on: You can turn it on at boot time or at runtime.
    -   At boot time, use the following on the kernel command line:
        -   stacktrace
    -   or, at runtime do:
        -   echo 1 \>/proc/sys/kernel/stack\-tracer\-enabled
-   To get the data:
    -   \$ mount -t debugfs debugfs /debug
    -   \$ cat /debug/tracing/stack\-trace
-   scope of operation
    -   the stack tracer will continue operating until you turn it off,
        which can be done with:
        -   echo 0 \>/proc/sys/kernel/stack\-tracer\-enabled

### additional resources

See [http://lwn.net/Articles5955/](http//lwn-net/Articles5955/)

### pytimechart

You can use pytimechart to explore ftrace traces visually. See
[http://packages.python.org/pytimechart/userguide.html](http//packages-python.org/pytimechart/userguide.html)

### bootchart like traces with ftrace and pytimechart

You can use the following kernel command line parameters to generate a
trace at boot, which can then be open with pytimechart to have a
browsable bootchart.

        trace-event=sched:*,timer:*,irq:* trace-buf-size=40M

### output

Here is what the output looks like, on ARM:

    /debug/tracing # cat stack-trace
            Depth    Size   Location    (42 entries)
            --    -   --
      0)     3      16   ftrace-test-stop-func+0/0x34
      1)     3312        -gnu-mcount-nc+0x58/0x60
      2)     4      52   skb-release-data+0xc0/0xc8
      3)     3232      24   -kfree-skb+0x24/0xc0
      4)     3208      32   consume-skb+0xe4/0xf0
      5)     3176      56   smsc911x-hard-start-xmit+0x188/0-4
      6)     3120      72   dev-hard-start-xmit+0x440/0x6a4
      7)     3048      40   sch-direct-xmit+0x8c/0x1f8
      8)     3008      48   dev-queue-xmit+08/0x570
      9)    60      56   neigh-resolve-output+0x/0x390
     10)    04      40   ip-finish-output+0x2bc/0x-
     11)    64      32   ip-output+0xb0/0xb8
     12)    32      24   ip-local-out+0x38/0x3c
     13)    08      32   ip-send-skb+0x18/0xa4
     14)    -76      56   udp-send-skb+0-4/0x394
     15)    -20     240   udp-sendmsg+0x4dc/0x748
     16)     2480      32   inet-sendmsg+0x70/0-
     17)     2448     232   sock-sendmsg+0xa8/0x160
     18)     2216      32   kernel-sendmsg+0x40/0x48
     19)     2184      96   xs-send-kvec+0xa8/0xb0
     20)     2088      64   xs-sendpages+0x90/0x1f8
     21)     2024      40   xs-udp-send-request+0x4c/0x13c
     22)     1984      48   xprt-transmit+0x114/0x214
     23)     1936      40   call-transmit+0x208/0-c
     24)     1896      48   -rpc-execute+0x88/0x334
     25)     1848      24   rpc-execute+0x68/0x70
     26)     1824      24   rpc-run-task+0xa8/0xb4
    )     1800      64   rpc-call-sync+0x68/0x90
    )     1736      32   nfs-rpc-wrapper.clone.6+0x3c/0-
    )     1704      48   nfs-proc-getattr+0x70/0xac
     30)     1656      48   -nfs-revalidate-inode+0xe4/0x1f8
     31)     1608      56   nfs-lookup-revalidate+0x1ac/0x40c
     32)     1552      72   do-lookup+0x/0x2e4
     33)     1480      72   do-last.clone.44+0x10c/0x688
     34)     1408      88   path-openat+0-c/0x394
     35)     1320     144   do-filp-open+0x40/0x8c
     36)     1176      40   open-exec+0/0xc0
     37)     1136     136   load-elf-binary+0x1cc/0x12b8
     38)     1000      72   search-binary-handler+0x150/0x3a0
     39)            56   do-execve+0x170/0x
     40)      872      32   sys-execve+0x44/0x64
     41)      840     840   ret-fast-syscall+0x0/0x30


[Category](http://eLinux.org/SpecialCategories "Special:Categories"):

-   [Linux tracing](http://eLinux.org/CategoryLinux-tracing "Category:Linux tracing")

