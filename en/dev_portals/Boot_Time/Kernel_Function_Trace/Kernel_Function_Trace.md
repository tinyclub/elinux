> From: [eLinux.org](http://eLinux.org/Kernel_Function_Trace "http://eLinux.org/Kernel_Function_Trace")


# Kernel Function Trace



## Contents

-   [1 Introduction](#introduction)
-   [2 Basic Use](#basic-use)
-   [3 Download](#download)
    -   [3.1 Patches](#patches)
    -   [3.2 KFT utilities](#kft-utilities)
-   [4 How To Use](#how-to-use)
    -   [4.1 Adding platform support for the kft clock
        source](#adding-platform-support-for-the-kft-clock-source)
-   [5 Issues](#issues)
    -   [5.1 Overhead](#overhead)
-   [6 Similar technologies](#similar-technologies)
-   [7 Filter Q&A](#filter-q-26a)
-   [8 Sample results](#sample-results)
    -   [8.1 kft log output (excerpt)](#kft-log-output-excerpt)
    -   [8.2 kft log analysis with
        'kd'](#kft-log-analysis-with-kd)
    -   [8.3 kft nested call trace with 'kd
        -c'](#kft-nested-call-trace-with-kd-c)

## Introduction

Kernel Function Trace (KFT) is a kernel function tracing system, which
uses the "-finstrument-functions" capability of the gcc compiler to add
instrumentation callouts to every function entry and exit. The KFT
system provides for capturing these callouts and generating a trace of
events, with timing details. KFT is excellent at providing a good timing
overview of kernel procedures, allowing you to see where time is spent
in functions and sub-routines in the kernel.

The main mode of operation with KFT is to use the system with a dynamic
trace configuration. That is, you can set a trace configuration after
kernel startup, using the `/proc/kft` interface, and retrieve trace data
immediately. However, another (special) mode of operation is available,
called STATIC\_RUN mode, where the configuration for a KFT run is
configured and compiled statically into the kernel. This mode is useful
for getting a trace of kernel operation during system bootup (before
user space is running).

The KFT configuration lets you specify how to automatically start and
stop a trace, whether to include interrupts as part of the trace, and
whether to filter the trace data by various criteria (for minimum
function duration, only certain listed functions, etc.) KFT trace data
is retrieved by reading from `/proc/kft_data` after the trace is
complete.

Tools are supplied to convert numeric trace data to kernel symbols, and
to process and analyze the data in a KFT trace.

## Basic Use

Documentation for KFT is available (as of 2.6.12) in
Documentation/kft.txt, after applying the kft-all-in-one.patch.

An online guide is provided at [Using Kernel Function
Trace](../../../dbg_portal/kernel_trace_and_profile/Using_Kernel_Function_Trace/Using_Kernel_Function_Trace.md "Using Kernel Function Trace")

Here's a presentation about KFT usage:

-   Presentation: [Learning the Kernel and Finding Performance Problems
    with KFI](http://eLinux.org/images/7/7c/KFI-presentation.pdf "KFI-presentation.pdf")
-   Sample trace used with presentation:
    [omap-serial\_init.trace.txt](http://eLinux.org/images/1/1b/Omap-serial_init.trace.txt "Omap-serial init.trace.txt")

KFT used to be called KFI (for Kernel Function Instrumentation). For
prior releases of KFT, see KernelFunctionInstrumentation

## Download

### Patches

-   Download directory with recent versions:
    [ftp://dslab.lzu.edu.cn/pub/kft/](ftp://dslab.lzu.edu.cn/pub/kft/)
    -   This is a fairly slow link - you can download the patch for
        2.6.21 here:
        [kft-all-in-one-2.6.21.patch](http://eLinux.org/images/3/33/Kft-all-in-one-2.6.21.patch "Kft-all-in-one-2.6.21.patch")
-   Patches for Linux 2.6.8.1, 2.6.11 and 2.6.12: see the [Patch
    Archive](http://eLinux.org/Patch_Archive "Patch Archive") page (available as an
    all-in-one patch or a tar archive of broken-out patches)
-   Patch for Linux 2.6.11: (can just download
    [kfi-2.patch](http://eLinux.org/images/9/97/Kfi-2.patch "Kfi-2.patch"))
-   Patch for Linux 2.6.7 (for x86 only):
    [kfi-26-test1.patch](http://eLinux.org/images/a/a6/Kfi-26-test1.patch "Kfi-26-test1.patch")
-   Patch for CELF kernel (based on linux-2.4.20):
    [kfi-24-test4.patch](http://eLinux.org/images/b/bd/Kfi-24-test4.patch "Kfi-24-test4.patch")

### KFT utilities

KFT includes several helper scripts which are located in the kernel
`scripts` directory:

-   addr2sym - convert function addresses to symbols in the trace data
-   kd - KFT dump - does filtering, sorting, analysis and trace
    formatting of KFT trace logs
-   mkkftrun.pl - used during building the kernel to convert a
    configuration file into a C file to be compiled into the kernel
-   sym2addr - convert function names to addresses in a KFT
    configuration file (for a dynamic trace)

See Documentation/kft.txt, in the kernel source tree after applying the
patch, for instructions on using these programs.

## How To Use

-   download both the patch
-   apply the patch in the kernel top-level directory:
-   patch -p1 \<kft.patch
-   read the rest of the instructions in the Documentation/kft.txt file.
    (my apologies for being lazy!)

### Adding platform support for the kft clock source

The current patch (from Sep 2005), uses sched\_clock() as the clock
source for kft\_readclock(). sched\_clock() is new in the 2.6 kernel,
and returns a 64-bit value containing nanoseconds (not necessarily
relative to any particular time base, but assumed to be monotonically
increasing, and relatively frequency-stable.)

If your platform has good support for sched\_clock(), then KFT should
work for you unmodified. If not, you may wish to do one of two things:

-   improve support for sched\_clock() in your board port, or
-   write a custom kft\_readclock() routine.

A "good" sched\_clock() routine will provide at least microsecond
resolution on return values. Some architectures have sched\_clock()
returning values based on the `jiffy` variable, which on many embedded
platforms only has resolution to 10 milliseconds.

There are some sample custom kft\_readclock() routines in the current
patch for different architectures.

## Issues

Here is a list of things that need more work:

-   may need to add noinstrument attributes for some time-critical code
    (need to check this)
    -   maybe check "Function Trace in KDB" patch for help with this

### Overhead

Mitsubishi measured the overhead of KFI (the predecessor to KFT). The
period is from start\_kernel() to smp\_init().

Platform was: SH7751R 240MHz (Memory Clock 80MHz)

` With KFI      : 922.419 msec Without KFI   : 666.982 msec Overhead      : 27.69%`

## Similar technologies

There are other technologies for doing call traces or kernel profiling
that are similar to KFT. Some of these are mentioned on the [Kernel
Instrumentation](../../.././dev_portals/Boot_Time/Kernel_Instrumentation/Kernel_Instrumentation.md "Kernel Instrumentation") page.
One that is very similar is a kernel trace mechanism for use with KDB. A
patch was posted to LKML in January of 2002. See the message:
[http://www.uwsg.iu.edu/hypermail/linux/kernel/0201.3/0888.html](http://www.uwsg.iu.edu/hypermail/linux/kernel/0201.3/0888.html)

## Filter Q&A

Tim asked the question:

Q. Is there a way to adjust the trigger or filters to reduce the memory
usage?

A. The memory usage is determined by the size of the log, which is
specified by `logentries` in the KFT configuration. If `logentries` is
not specified, it defaults to a rather large number (20,000 in the
current code). To use a smaller trace log, specify a smaller number of
logentries in the KFT configuration.

The use of triggers and filters can help you fit more data (or more
pertinent data) into the log, so you can more readily see the
information you are interested in.

By setting start and stop triggers with a narrower "range" of operation,
then the amount of data put into the log will be more limited. For
example, the default configuration for a static trace uses

`trigger start entry start_kernel trigger stop entry to_userspace `

This will trace EVERYTHING that the kernel does between those two
routines. However, you can limit tracing to a much smaller time area of
kernel initialization using better triggers. Here is an example showing
a triggers for just watching mem\_init():
` trigger start entry mem_init trigger stop exit mem_init`

Filters are also vital to reduce the number of entries the trace log.
With no time filters in place, KFT will log every single function
executed by the kernel. This will quickly overrun the log (no matter
what size you have reserved with `logentries`.

When using KFT to find long-duration functions in the kernel, we usually
are not interested in routines that execute quickly, and instead use
something like "filter mintime 500" to filter out routines taking less
than 500 microseconds.

## Sample results

Here is an excerpt from a KFI log trace (processed with addr2sym). It
shows all functions which lasted longer than 500 microseconds, from when
the kernel entered start\_kernel() to when it entered to\_userspace().

### kft log output (excerpt)

` Kernel Instrumentation Run ID 0`

Logging started at 6785045 usec by entry to function start\_kernel
Logging stopped at 8423650 usec by entry to function to\_userspace

Filters: 500 usecs minimum execution time

Filter Counters:

Execution time filter count = 896348 Total entries filtered = 896348
Entries not found = 24

Number of entries after filters = 1757



    Entry      Delta      PID            Function                    Called At
          1          0       0                start_kernel   L6+0x0
         14       8687       0                  setup_arch   start_kernel+0x35
         39        891       0                setup_memory   setup_arch+0x2a8
         53        872       0   register_bootmem_low_pages   setup_memory+0x8f
         54        871       0                free_bootmem   register_bootmem_low_pages+0x95
         54        871       0           free_bootmem_core   free_bootmem+0x34
        930       7432       0                 paging_init   setup_arch+0x2af
        935       7427       0             zone_sizes_init   paging_init+0x4e
        935       7427       0              free_area_init   zone_sizes_init+0x83
        935       7427       0         free_area_init_node   free_area_init+0x4b
        935       3759       0        __alloc_bootmem_node   free_area_init_node+0xc5
        935       3759       0        __alloc_bootmem_core   __alloc_bootmem_node+0x43
       4694       3668       0         free_area_init_core   free_area_init_node+0x75
       4817       3535       0            memmap_init_zone   free_area_init_core+0x2bd
       8807     266911       0                   time_init   start_kernel+0xb6
       8807     261404       0               get_cmos_time   time_init+0x1c
     270211       5507       0                select_timer   time_init+0x41
     270211       5507       0                    init_tsc   select_timer+0x45
     270211       5507       0               calibrate_tsc   init_tsc+0x6c
     275718       1638       0                console_init   start_kernel+0xbb
     275718       1638       0                    con_init   console_init+0x59
     275954        733       0          vgacon_save_screen   con_init+0x288
     277376       6730       0                    mem_init   start_kernel+0xf8
     277376       1691       0            free_all_bootmem   mem_init+0x52
     277376       1691       0       free_all_bootmem_core   free_all_bootmem+0x24
     284118      25027       0             calibrate_delay   start_kernel+0x10f
     293860        770       0                     __delay   calibrate_delay+0x62
     293860        770       0                   delay_tsc   __delay+0x26
     294951       1534       0                     __delay   calibrate_delay+0x62
     294951       1534       0                   delay_tsc   __delay+0x26
     297134       1149       0                     __delay   calibrate_delay+0xbe
     297134       1149       0                   delay_tsc   __delay+0x26
     .
     .
     .
    1638605          0     145              filemap_nopage   do_no_page+0xef
    1638605          0     145                 __lock_page   filemap_nopage+0x286
    1638605          0     145                 io_schedule   __lock_page+0x95
    1638605          0     145                    schedule   io_schedule+0x24
    1638605          0       5                    schedule   worker_thread+0x217
    1638605          0       1                to_userspace   init+0xa6

The log is attached here:
[Media:Kfiboot-9.lst](http://eLinux.org/images/6/68/Kfiboot-9.lst "Kfiboot-9.lst") A
Delta value of 0 usually means the exit from the routine was not seen.

### kft log analysis with 'kd'

Below is a `kd` dump of the data from the above log.

For the purpose of finding areas of big time in the kernel, the
functions with high "Local" time are important. For example,
`delay_tsc()` is called 156 times, resulting in 619 milliseconds of
duration. Other time-consuming routines were: `isapnp_isolate()`,
`get_cmos_time()`, `default_idle()`.

The top line showing schedule() called 192 times and lasting over 5
seconds, is accounted wrong due to the switch in execution control
inside the schedule routine. (The count of 192 calls is correct, but the
duration is wrong.)

    $ ~/work/kft/kft/kd -n 30 kftboot-9.lst
    Function                  Count Time     Average  Local
    ------------------------- ----- -------- -------- --------
    schedule                    192  5173790    26946  5173790
    do_basic_setup                1  1159270  1159270       14
    do_initcalls                  1  1159256  1159256      627
    __delay                     156   619322     3970        0
    delay_tsc                   156   619322     3970   619322
    __const_udelay              146   608427     4167        0
    probe_hwif                    8   553972    69246      126
    do_probe                     31   553025    17839       68
    ide_delay_50ms              103   552588     5364        0
    isapnp_init                   1   383138   383138       18
    isapnp_isolate                1   383120   383120   311629
    ide_init                      1   339778   339778       22
    probe_for_hwifs               1   339756   339756      103
    ide_scan_pcibus               1   339653   339653       13
    init_setup_piix               2   339640   169820        0
    ide_scan_pcidev               2   339640   169820        0
    piix_init_one                 2   339640   169820        0
    ide_setup_pci_device          2   339640   169820      242
    probe_hwif_init               4   339398    84849       40
    time_init                     1   266911   266911        0
    get_cmos_time                 1   261404   261404   261404
    ide_generic_init              1   214614   214614        0
    ideprobe_init                 1   214614   214614        0
    wait_for_completion           6   194573    32428        0
    default_idle                183   192589     1052   192589
    io_schedule                  18   171313     9517        0
    __wait_on_buffer             14   150369    10740      141
    i8042_init                    1   137210   137210      295
    i8042_port_register           2   135318    67659      301
    __serio_register_port         2   135017    67508        0

### kft nested call trace with 'kd -c'

Below is a `kd -c` trace of the data from a log taken from a PPC440g
platform, from a (dynamic) trace of the function do\_fork().

Here is the configuration file that was used:
`new begin trigger start entry do_fork trigger stop exit do_fork end`

Here is the first part of the trace in nested call format: Times (Entry,
Duration and Local) are in micro-seconds. Note the timer interrupt
during the routine. ` `

         Entry      Duration   Local       Pid    Trace
            4      20428        209      33 do_fork
            7          6          6      33 |  alloc_pidmap
           18       2643         84      33 |  copy_process
           21        114         19      33 |  |  dup_task_struct
           24          8          6      33 |  |  |  prepare_to_copy
           27          2          2      33 |  |  |  |  sub_preempt_count
           35         22          9      33 |  |  |  kmem_cache_alloc
           38          2          2      33 |  |  |  |  __might_sleep
           43         11          9      33 |  |  |  |  cache_alloc_refill
           49          2          2      33 |  |  |  |  |  sub_preempt_count
           60         65          6      33 |  |  |  __get_free_pages
           63         59         14      33 |  |  |  |  __alloc_pages
           65          3          3      33 |  |  |  |  |  __might_sleep
           71          3          3      33 |  |  |  |  |  zone_watermark_ok
           77         37         17      33 |  |  |  |  |  buffered_rmqueue
           80          4          4      33 |  |  |  |  |  |  __rmqueue
           86          3          3      33 |  |  |  |  |  |  sub_preempt_count
           92          3          3      33 |  |  |  |  |  |  bad_range
           98          2          2      33 |  |  |  |  |  |  __mod_page_state
          103          8          5      33 |  |  |  |  |  |  prep_new_page
          106          3          3      33 |  |  |  |  |  |  |  set_page_refs
          117          2          2      33 |  |  |  |  |  zone_statistics
          141         25          4      33 |  |  do_posix_clock_monotonic_gettime
          143         21          6      33 |  |  |  do_posix_clock_monotonic_get
          146         15          6      33 |  |  |  |  do_posix_clock_monotonic_gettime_parts
          149          9          6      33 |  |  |  |  |  getnstimeofday
          152          3          3      33 |  |  |  |  |  |  do_gettimeofday
          169          3          3      33 |  |  copy_semundo
          174         41         17      33 |  |  copy_files
          177         19          9      33 |  |  |  kmem_cache_alloc
          180          2          2      33 |  |  |  |  __might_sleep
          185          8          5      33 |  |  |  |  cache_alloc_refill
          188          3          3      33 |  |  |  |  |  sub_preempt_count
          200          3          3      33 |  |  |  count_open_files
          209          2          2      33 |  |  |  sub_preempt_count
          218         19          8      33 |  |  kmem_cache_alloc
          220          2          2      33 |  |  |  __might_sleep
          225          9          6      33 |  |  |  cache_alloc_refill
          229          3          3      33 |  |  |  |  sub_preempt_count
          241          2          2      33 |  |  sub_preempt_count
          246        216          9      33 |  |  kmem_cache_alloc
          249        199        199      33 |  |  |  __might_sleep
                !!!! start
          253        151         63      33 timer_interrupt
          256          8          6      -1 !  profile_tick
          259          2          2      -1 !  !  profile_hit
          267         61         15      -1 !  update_process_times
          270          8          5      -1 !  !  account_system_time
          273          3          3      -1 !  !  !  update_mem_hiwater
          281          8          5      -1 !  !  run_local_timers
          284          3          3      -1 !  !  !  raise_softirq
          293         27         16      -1 !  !  scheduler_tick

. . .

To see the full trace, go to the
[KftDoForkTrace](http://eLinux.org/KftDoForkTrace "KftDoForkTrace") page.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Measuring](http://eLinux.org/Category:Measuring "Category:Measuring")
-   [Kernel Function
    Trace](http://eLinux.org/Category:Kernel_Function_Trace "Category:Kernel Function Trace")

