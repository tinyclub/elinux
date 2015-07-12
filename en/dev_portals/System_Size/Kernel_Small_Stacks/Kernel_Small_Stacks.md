> From: [eLinux.org](http://eLinux.org/Kernel_Small_Stacks "http://eLinux.org/Kernel_Small_Stacks")


# Kernel Small Stacks



Here is some random information about small kernel stack sizes.

The default stack size for a process running in kernel space is 8K (as
of 2011).

There used to be an option on x86 to reduce the stack size to 4K. And
indeed there were efforts in 2006 to make this the default stack size.
However, using a small stack opens up the dangerous possibility that the
stack will overflow, causing a kernel hang.

Besides wasting memory, if the stack space is not really needed, 8K
stacks also have an effect on, and are affected by, general kernel
memory allocation. To create an 8K stack requires an order-1 allocation,
meaning that 2 contiguous physical pages must be allocated together in
order to create a new process stack. If memory has become fragmented, it
may be impossible to fulfill an order-1 allocation, even though
individual pages of physical memory may be free. Thus 4K stack
allocations (order-0 allocations) are more likely to succeed. This is
important for systems operating under extreme memory pressure.

There were years of debate on the kernel mailing list about whether 4K
stacks should be the default, and lots of bug reports that ended up
being caused stack overflows with 4K stacks enabled. The option to
support 4k stacks on x86 was removed in 2010, from kernel version 2.6.37
with this commit: dcfa726280116dd31adad37da940f542663567d0

## Contents

-   [1 Historical information on 4K
    Stacks](#historical-information-on-4k-stacks)
-   [2 Stack layout](#stack-layout)
-   [3 Stack measuring/monitoring
    mechanisms](#stack-measuring-monitoring-mechanisms)
    -   [3.1 CONFIG\-FRAME\-WARN](#config-frame-warn)
    -   [3.2 checkstack.pl](#checkstack-pl)
    -   [3.3 stack\-size](#stack-size)
        -   [3.3.1 ARM results](#arm-results)
        -   [3.3.2 x86\-64 results](#x86-64-results)
    -   [3.4 CONFIG\-DEBUG\-STACK\-USAGE](#config-debug-stack-usage)
    -   [3.5 Stack tracer in ftrace](#stack-tracer-in-ftrace)
    -   [3.6 Stack limit patches](#stack-limit-patches)
-   [4 ARM 4K Stacks](#arm-4k-stacks)
-   [5 Possible mixed stack size
    feature](#possible-mixed-stack-size-feature)
-   [6 Problems](#problems)
    -   [6.1 Problem routines](#problem-routines)
        -   [6.1.1 do\-select, do\-sys\-poll](#do-select-do-sys-poll)
        -   [6.1.2 nlm\-clnt\-reclaim](#nlm-clnt-reclaim)
        -   [6.1.3 security\-load\-policy](#security-load-policy)

### Historical information on 4K Stacks

Here are some articles and links to information about 4K stacks:

-   [4K Stacks in 2.6](http://lwn.net/Articles/84583/) - LWN.net, May
    2004
-   [4K stacks for everyone?](http://lwn.net/Articles/150580/) -
    LWN.net, Sep 2005
-   [4K stacks - again](http://lwn.net/Articles/160138/) - LWN.net, Nov
    2005
-   [4K stacks by default?](http://lwn.net/Articles/279229/) - LWN.net,
    Apr 2008

-   [http://www.redhat.com/archives/rhl-list/2007-March/msg00854.html](http://www.redhat.com/archives/rhl-list/2007-March/msg00854.html)
    - James Wilkinson message about memory fragmentation.

## Stack layout

The kernel stack is laid out with the stack pointer at the top of each
stack (at the highest stack address), growing downward for each function
call and stack allocation. The thread\_info structure for a process is
at the bottom of the stack. There is no physical mechanism to detect, at
allocation time, if the stack pointer wanders into the thread\_info area
of the stack. Hence, if the stack overflows (the stack pointer goes into
the thread\_info area), the behavior of the system is undefined.

Stack structure:

    top     +----------------+
            | return vals    |
            |   & local vars |
            | ...            |
            |                |
            |                |
            | 0's            |
            | thread_info    |
    bottom  +----------------+



## Stack measuring/monitoring mechanisms

Because of previous efforts to conserve stack space, there are actually
a few different mechanisms for monitoring the kernel stack usage. Some
tools report on the static size of stack usage by kernel functions (a
check which is done by either the compiler or a separate tool operating
on the kernel binary), and some mechanisms can report on actual stack
utilization at runtime.

### CONFIG\_FRAME\_WARN

This kernel configuration option passes an option to the compiler to
cause it to emit a warning when a static stack size for a routine is
detected that is larger than the specified threshold. It requires gcc
version 4.4 or later in order to work.

The gcc option used is "-Wframe-larger-than=xxx".

By default, CONFIG\_FRAME\_WARN has the value of 1024, but you can set
it to any value from 0 to 8192.

Here is a sample of build output with this option configured to 256:

      ...
      CC      ipc/msg.o
      CC      ipc/sem.o
     .../linux-3.0.y/ipc/sem.c: In function 'semctl_main.clone.7':
     .../linux-3.0.y/ipc/sem.c:1021:1: warning: the frame size of 520 bytes is larger than 256 bytes
     .../linux-3.0.y/ipc/sem.c: In function 'sys_semtimedop':
     .../linux-3.0.y/ipc/sem.c:1514:1: warning: the frame size of 472 bytes is larger than 256 bytes
      CC      ipc/shm.o
      CC      ipc/ipcns_notifier.o

### checkstack.pl

The kernel source includes a script to perform static stack analysis
called scripts/checkstack.pl.

Usage is as follows:

    $(CROSS_COMPILE)objdump -d vmlinux | scripts/checkstack.pl [arch]

Replace [arch] with the architecture of the kernel being analyzed.
Several architectures are supported, including arm, mips and x86. You
should use a cross-objdump that matches the architecture you compiled
the kernel for. For example, if you used: arm-gnueabi-linux-gcc as your
compiler, you would use arm-gnueabi-linux-objdump as your object dump
program. This should have been included in your cross-compiler toolchain
package.

Below is some sample output from using checkstack.pl. Note that the file
is first dumped to an assembly file (.S), and then piped to
checkstack.pl. You can examine the assembly file to see in detail the
instructions used to reserve space on the stack, for routines of
interest found by checkstack.pl.

An item in brackets is a module name, in case of a loadable module. The
number at end is stack depth detected for function. The Leading value is
the address of the stack reservation code.

    $ arm-eabi-objdummp -d vmlinux -o vmlinux-arm.S
    $ cat vmlinux-arm.S | scripts/checkstack.pl arm
    0x0012c858 nlmclnt_reclaim [vmlinux-arm.o]:             720
    0x0025748c do_tcp_getsockopt.clone.11 [vmlinux-arm.o]:  552
    0x00258d04 do_tcp_setsockopt.clone.14 [vmlinux-arm.o]:  544
    0x000b2db4 do_sys_poll [vmlinux-arm.o]:                 532
    0x00138744 semctl_main.clone.7 [vmlinux-arm.o]:         532
    0x00138ec4 sys_semtimedop [vmlinux-arm.o]:              484
    0x000c5618 default_file_splice_read [vmlinux-arm.o]:    436
    0x00251de4 do_ip_setsockopt.clone.22 [vmlinux-arm.o]:   416
    0x00191fd4 extract_buf [vmlinux-arm.o]:                 408
    0x0019bc24 loop_get_status_old [vmlinux-arm.o]:         396
    0x000e6f88 do_task_stat [vmlinux-arm.o]:                380
    0x0019b8f0 loop_set_status_old [vmlinux-arm.o]:         380
    0x002078f0 snd_ctl_elem_add_user [vmlinux-arm.o]:       376
    0x0026267c tcp_make_synack [vmlinux-arm.o]:             372
    0x00127be4 nfs_dns_parse [vmlinux-arm.o]:               368
    0x000b2240 do_select [vmlinux-arm.o]:                   340
    0x001f6f10 mmc_blk_issue_rw_rq [vmlinux-arm.o]:         340
    0x001726a0 fb_set_var [vmlinux-arm.o]:                  336
    0x000c58d0 __generic_file_splice_read [vmlinux-arm.o]:  316
    0x0022a074 dev_seq_printf_stats [vmlinux-arm.o]:        316
    0x0006383c tracing_splice_read_pipe [vmlinux-arm.o]:    308
    0x000c53c8 vmsplice_to_pipe [vmlinux-arm.o]:            308
    0x002512b4 do_ip_getsockopt [vmlinux-arm.o]:            304
    0x00225f68 skb_splice_bits [vmlinux-arm.o]:             300

### stack\_size

Below are some results for static analysis of function stack depth in
the Linux kernel, using 'stack\_size'. (stack\_size is a custom tool
written by Tim Bird, before he found out about checkstack.pl.)

See this kernel message for a patch containing 'stack\_size':
[https://lkml.org/lkml/2011/10/18/479](https://lkml.org/lkml/2011/10/18/479)

#### ARM results

The following results include the reduction in size for 'struct
poll\_wqueue':

    $ ./stack_size vmlinux-arm
    ============ RESULTS ===============
    number of functions     = 14371
    max function stack depth= 736
    function with max depth = nlmclnt_reclaim

    Function Name                    Stack Depth
    =====================            ===========
    __generic_file_splice_read        352
    do_select                         376
    loop_set_status_old               392
    snd_ctl_elem_add_user             408
    extract_buf                       432
    default_file_splice_read          472
    sys_semtimedop                    520
    semctl_main.clone.7               560
    do_sys_poll                       568
    nlmclnt_reclaim                   736

#### x86\_64 results

    $ ./show_stacks_x86_64.py vmlinux-x86_64.o
    ============ RESULTS ===============
    number of functions     = 29587
    max function stack depth= 1208
    function with max depth = security_load_policy

    Function Name                    Stack Depth
    =====================            ===========
    x86_schedule_events               632
    drm_crtc_helper_set_mode          632
    sys_semtimedop                    664
    do_task_stat                      712
    node_read_meminfo                 760
    default_file_splice_read          792
    do_select                         920
    nlmclnt_reclaim                   936
    do_sys_poll                      1048
    security_load_policy             1208

### CONFIG\_DEBUG\_STACK\_USAGE

There is kernel feature to output the stack usage of each process, as
well as the process that uses the most stack in the system. This is
controlled by the kernel configuration option
CONFIG\_DEBUG\_STACK\_USAGE.

This option modifies the process creation path so that the stack is
initialized with all zeros. At any time, a request can be made to
measure the stack depth of all running processes. This is calculated by
measuring the amount of zeros from the end of thread\_info to the first
non-zero item on each stack.

In more detail, it does the following:

-   at process creation time, fills the stack with zeros (kernel/fork.c)
-   on sysrq 't', show free space, from call to stack\_not\_used()
    (kernel/sched.c)
    -   it shows as 0 otherwise ??
-   define check\_stack\_usage(), which emits printks on each low-water
    hit
    -   low-water appears to be global over all stacks
    -   check\_stack\_usage() is only called on process exit, so you
        might not know about a problem process until very late
-   stack\_not\_used() is defined in include/linux/sched.h. It counts
    the number of zero bytes following the end of thread\_info going up.

As the systems runs, any time the stack low-water mark is exceeded, then
the kernel prints a report (logs it to the kernel message log). This can
be viewed with the dmesg command:

Here is example output, greping the kernel message log for "greatest":

    # dmesg | grep greatest
    kworker/u:0 used greatest stack depth: 10564 bytes left
    busybox used greatest stack depth: 9512 bytes left
    busybox used greatest stack depth: 9504 bytes left
    grep used greatest stack depth: 9372 bytes left
    init used greatest stack depth: 9028 bytes left

To get a report on the stack usage of currently running processes, you
use 't' with sysrq. For example:

    $ echo t >/proc/sysrq-trigger

A stack dump for each process is shown, along with stack usage
information.


 Here is some sample output:

    $ echo t >/proc/sysrq-trigger
    $ dmesg | grep -v [[]
      task                PC stack   pid father
    init            S 802af8b0   932     1      0 0x00000000
    kthreadd        S 802af8b0  2496     2      0 0x00000000
    ksoftirqd/0     S 802af8b0  2840     3      2 0x00000000
    kworker/0:0     S 802af8b0  2776     4      2 0x00000000
    kworker/u:0     S 802af8b0  2548     5      2 0x00000000
    migration/0     S 802af8b0  2704     6      2 0x00000000
    migration/1     S 802af8b0  2704     7      2 0x00000000
    kworker/1:0     S 802af8b0  2560     8      2 0x00000000
    ksoftirqd/1     S 802af8b0  3024     9      2 0x00000000
    khelper         S 802af8b0  2824    10      2 0x00000000
    sync_supers     S 802af8b0  2872    11      2 0x00000000
    bdi-default     S 802af8b0  2584    12      2 0x00000000
    kblockd         S 802af8b0  2824    13      2 0x00000000
    khubd           S 802af8b0  2744    14      2 0x00000000
    rpciod          S 802af8b0  3024    15      2 0x00000000
    kworker/0:1     S 802af8b0  1240    16      2 0x00000000
    kswapd0         S 802af8b0  2848    17      2 0x00000000
    fsnotify_mark   S 802af8b0  2632    18      2 0x00000000
    nfsiod          S 802af8b0  3024    19      2 0x00000000
    kworker/u:1     S 802af8b0  2840    20      2 0x00000000
    hoge            S 802af8b0  3024    23      2 0x00000000
    kworker/1:1     S 802af8b0  1716    24      2 0x00000000
    flush-0:13      S 802af8b0  2528    28      2 0x00000000
    telnetd         S 802af8b0  1848    48      1 0x00000000
    ash             R running   1264    56      1 0x00000000

### Stack tracer in ftrace

For detailed instructions, see:
[Ftrace\#Find\_deepest\_kernel\_stack](http://eLinux.org/Ftrace#Find_deepest_kernel_stack "Ftrace")

Rough notes:

-   Turn on CONFIG\_STACK\_TRACER in kernel config
-   pass 'stacktrace' on kernel command line, or at runtime do:
-   echo 1 \>/proc/sys/kernel/stack\_tracer\_enabled
-   mount -t debugfs none /sys/kernel/debug
-   \<do some stuff\>
-   cat /sys/kernel/debug/tracing/stack\_trace

See [http://lwn.net/Articles/295955/](http://lwn.net/Articles/295955/)

### Stack limit patches

Sony has a series of patches which implement a stack guard page, and use
that to show a backtrace if the process uses more than a specified
amount in its kernel stack. In essence, this creates a hard failure for
a controlled stack overflow event.

These patches do the following: Add the config options:

-   CONFIG\_SNSC\_DEBUG\_STACK\_LIMIT - perform stack layout changes
-   CONFIG\_SNSC\_SUPPORT\_4KB\_MAPPING - re-map kernel memory for 4K
    TLB mappings
-   CONFIG\_SNSC\_DEBUG\_STACK\_LIMIT\_MANUAL - allow a user-specified
    starting stack size


 the patches do several things:

-   change the stack layout to place thread\_info at the top of the
    stack rather than at the bottom
-   change the stack size to 16KB (order 2)
-   allow configuring the default starting position of the stack, to
    simulate an arbitrary stack size (default is right below
    thread\_info)
-   remap the kernel memory so that 4KB mappings are used
    -   this allows unmapping the bottom page of the stack, so that a
        fault occurs when the page is accessed (on a stack overflow for
        a manually configured small stack)
    -   this is only turned on if you specify 'use\_4kb\_mapping' on the
-   unmap the bottom page of the stack (the guard page)
    -   this is only turned on if you specify 'unmap\_stack'


 [ FIXTHIS - need to add more to this section]

## ARM 4K Stacks

In October of 2011, Tim Bird submitted patches to add 4K stack support
for the ARM architecture to the Linux kernel. The patches he submitted
are here:

-   [https://lkml.org/lkml/2011/10/18/476](https://lkml.org/lkml/2011/10/18/476)
    - ARM 4Kstacks: introduction
-   [https://lkml.org/lkml/2011/10/18/477](https://lkml.org/lkml/2011/10/18/477)
    - ARM 4Kstacks: Add support for 4K kernel stacks to ARM
-   [https://lkml.org/lkml/2011/10/18/479](https://lkml.org/lkml/2011/10/18/479)
    - ARM: Add static kernel function stack size analyzer, for ARM
-   [https://lkml.org/lkml/2011/10/18/481](https://lkml.org/lkml/2011/10/18/481)
    - ARM 4Kstacks: Decrease poll and select stack usage, when using 4K
    stacks

After some discussion, these patches were not accepted into mainline.

The following points were problems that needed to be addressed for this
patch set:

    * Should make this depend on CONFIG_EXPERT (to warn developers who attempt to use this)
    * Should add interrupt stacks to ARM to take pressure off of 4K stacks
    * Should determine if 4K stacks use case will cause ripple effect and lots of ifdefs and hard maintenance issues throughout the kernel.  In particular, need to look at:
      * %pV recursion in printk.  This is used by several file systems
        * question: for operation or just reporting??

Dave Chinner ([here](https://lkml.org/lkml/2011/10/19/56)) wrote:

    There's a good reason 4k stacks went away: it's
    simply not enough space for the deep 60+ function call stacks we see
    with even trivial storage stack configurations.

    The stack usage on 32 bit ARM and x86 is going to be similar, so
    you're going to be fighting a losing battle - there is no stack
    space that can be trimmed from most paths. To make matter worse,
    there's been stuff done to the storage stack that significantly
    increases stack usage since 4k stacks went away (e.g. the on-stack
    block plugging changes).

    And FWIW, XFS is widely used on ARM based NAS devices, so this isn't
    a theoretical problem I'm making up here...

This is a pretty good example of people denying a use case with a red
herring.

## Possible mixed stack size feature

One option for realizing most of the benefits of 4K stacks, while
preserving more robustness, would be to utilize mixed stack sizes in the
kernel.

Processes known to exercise only certain, stack-conservative, code paths
in the kernel could utilize 4K stacks, and other processes could utilize
8K (or larger) stacks for safety purposes.

There would have to be a mechanism to support selecting the stack size
at process creation time. One simple mechanism would be to introduce a
child\_stack\_size parameter in thread\_info, settable via /proc, and
use this on the clone system call.

A system to support different-sized stacks by changing the stack size of
already running processes would likely be too complicated to be
practical.

Currently, the method of accessing the thread\_info structure for a task
in the kernel relies on the stack size of all processes being consistent
among all processes (and being a power of two). A pointer to
thread\_info is obtained by masking the current stack pointer with a
value dependent on the (global) size of the stack. With mixed stack
sizes, a different mechanism would be needed to convert from stack
pointer to thread\_info. One method which might work would be to
pre-allocate a stack pool for non-standard-sized stacks, and use pointer
comparison to see if SP fell within the pool. If the pool was exhausted,
the default stack size would be used.

This would work best in the case of a system with an identifiable number
of processes which would use special-sized stacks.

## Problems

This area has random notes for stack depth management issues:

### Problem routines

#### do\_select, do\_sys\_poll

The structure 'struct poll\_wqueue' is a large data structure used for
the select() and poll() system calls to manage a sub-set of the file
descriptors being polled. This structure includes an array of wait
queues which can be used immediately (without requiring or waiting for a
memory allocation) for polling file I/O.

The number of entries in the array of wait queues can be controlled via
macros in include/linux/poll.h

#### nlm\_clnt\_reclaim

network lock manager for network filesystems. Not applicable to most
embedded products (except possibly during development).

#### security\_load\_policy

An selinux routine, not applicable to embedded.


