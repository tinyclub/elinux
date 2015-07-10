> From: [eLinux.org](http://eLinux.org/Using_Kernel_Function_Trace "http://eLinux.org/Using_Kernel_Function_Trace")


# Using Kernel Function Trace



Using Kernel Function Trace Ver. 0.1.1 -- 2007-04-26 Most material
provided by Sony

* * * * *



## Contents

-   [1 Introduction](#introduction)
-   [2 Quick Overview](#quick-overview)
-   [3 Detailed instructions](#detailed-instructions)
    -   [3.1 Configuring the kernel for using
        KFT](#configuring-the-kernel-for-using-kft)
    -   [3.2 Editing the static trace run configuration
        (optional)](#editing-the-static-trace-run-configuration-optional)
    -   [3.3 Compiling the kernel](#compiling-the-kernel)
    -   [3.4 Configuring the trace run](#configuring-the-trace-run)
        -   [3.4.1 Triggers](#triggers)
        -   [3.4.2 Filters](#filters)
        -   [3.4.3 Configuration scenarios](#configuration-scenarios)
        -   [3.4.4 Handling a link error](#handling-a-link-error)
-   [4 Initiating a KFT run](#initiating-a-kft-run)
-   [5 Reading the trace data](#reading-the-trace-data)
-   [6 Processing the data](#processing-the-data)
    -   [6.1 Analyzing the data with kd](#analyzing-the-data-with-kd)
    -   [6.2 KFT utilities](#kft-utilities)
-   [7 Tips for using KFT](#tips-for-using-kft)
-   [8 Online Resources](#online-resources)
-   [9 Appendices](#appendices)
    -   [9.1 Appendix A - KFT configuration
        language](#appendix-a-kft-configuration-language)
        -   [9.1.1 A note on function names](#a-note-on-function-names)
        -   [9.1.2 configuration block](#configuration-block)
        -   [9.1.3 triggers](#triggers-2)
        -   [9.1.4 filters](#filters-2)
        -   [9.1.5 watches](#watches)
        -   [9.1.6 miscellaneous](#miscellaneous)
        -   [9.1.7 Configuration Samples](#configuration-samples)
    -   [9.2 Appendix B - Sample results](#appendix-b-sample-results)
        -   [9.2.1 kft log output
            (excerpt)](#kft-log-output-excerpt)
        -   [9.2.2 kft log analysis with
            'kd'](#kft-log-analysis-with-kd)
        -   [9.2.3 kft nested call trace with 'kd
            -c'](#kft-nested-call-trace-with-kd-c)
    -   [9.3 Appendix C - Using KFT for monitoring stack
        usage](#appendix-c-using-kft-for-monitoring-stack-usage)
    -   [9.4 Appendix D - Some notes on KFT
        operation](#appendix-d-some-notes-on-kft-operation)
        -   [9.4.1 Trace overhead](#trace-overhead)
            -   [9.4.1.1 Overhead measurement](#overhead-measurement)
        -   [9.4.2 Trace buffer exhaustion](#trace-buffer-exhaustion)
        -   [9.4.3 Early clock issues](#early-clock-issues)
            -   [9.4.3.1 Adding platform support for the KFT clock
                source](#adding-platform-support-for-the-kft-clock-source)
-   [10 Modification History](#modification-history)

## Introduction

This document describes how to use Kernel Function Trace with the Linux
kernel. It assumes you have already applied the KFT patch to your
kernel, or that it was otherwise previously integrated with your kernel
source code.

Kernel Function Trace (KFT) is a kernel function tracing system, which
examines every function entry and exit in the Linux kernel. The KFT
system provides for capturing a subset of these events along with timing
and other details. KFT is different from other kernel tracing systems in
that it is designed to be able to filter the events by the duration of
the function calls. Thus, KFT is good for finding out where time is
spent in functions and sub-routines in the kernel. When used in
unfiltered mode, KFT is very useful to collect information about the
flow of control in the kernel, which can help with debugging or
optimizing kernel code.

The main mode of operation with KFT is by running a "dynamic" trace.
That is, you start the kernel as usual, then, using the `/proc/kft`
interface, configure a trace, start it, and retrieve the trace data
immediately.

However, another special mode of operation is available for performing
bootup time tracing. In this mode, the configuration for a trace is
compiled statically into the kernel. This is sometimes referred to as
"static" mode. This mode is useful for getting a trace of the kernel
during system bootup, before user space is running and before any
services are available to configure and start a trace. This mode is
particularly helpful to find problems with kernel bootup time.

In either case, you specify a KFT configuration for the trace run. The
configuration tells how to automatically start and stop the trace,
whether to include interrupts as part of the trace, and whether to
filter the event data by various criteria (for minimum function
duration, only certain listed functions, etc.)

When a trace is complete, the event data collected during the trace is
retrieved by reading from `/proc/kft_data`.

Finally, KFT provides tools to process and analyze the data in a KFT
trace.

## Quick Overview

Quick overview for using KFT in dynamic mode:

-   Configure your kernel with support for KFT
-   Compile your kernel
-   Boot the kernel
-   Write a configuration to `/proc/kft`
-   Start the trace
-   Read the trace data from `/proc/kft_data`
-   Process the data
    -   Use `addr2sym` to convert addresses to function names
    -   use `kd` to analyze trace data

* * * * *

Quick overview for using KFT during bootup:

-   Configure your kernel with support for KFT and KFT\_STATIC\_RUN
-   Edit the configuration in `<linux_src>/kernel/kftstatic.conf`
-   Compile your kernel
-   Boot the kernel
    -   The run should be triggered during bootup
-   Read the trace data from `/proc/kft_data`
-   Process the data
    -   Use `addr2sym` to convert addresses to function names
    -   use `kd` to analyze trace data

## Detailed instructions

### Configuring the kernel for using KFT

Configure your kernel to support KFT by editing the kernel configuration
(.config) file.

For example, if you are using 'make menuconfig', set the following
option under the "Kernel Hacking" menu.

    Kernel Hacking --->
    [*] Kernel Function Trace

Save this configuration. This will set the option CONFIG\_KFT=y in your
kernel .config file.

* * * * *

If you wish to perform a trace during kernel bootup time, also configure
for KFT static mode.

For example, if you are using 'make menuconfig', set the following
option under the "Kernel Hacking" menu.

    Kernel Hacking --->
    [*] Kernel Function Trace
    [*] Static function tracing configuration

Save this configuration. This will set the following options in your
kernel .config file:

    CONFIG_KFT=y
    CONFIG_KFT_STATIC_RUN=y



### Editing the static trace run configuration (optional)

If you are performing a "static" trace, edit the file
`kernel/kftstatic.conf` to set the configuration for the trace run you
wish to perform at system boot. (see the next section "Configuring the
trace run" for details on the trace configuration syntax and options.)
Note that even if you perform or bootup time trace, you can still
perform dynamic traces any time while the system is running.

### Compiling the kernel

Build the kernel, and install it to boot on your target machine.

Make sure to save the `System.map` file from this build, since it will
be used later when processing the trace data.

If you get an error compiling the kernel, see the next section on
trouble-shooting configuration problems.

### Configuring the trace run

To configure your trace, you write a trace configuration file. This file
specifies when to start and stop the trace, and what events to save as
part of the trace data.

Here is a sample configuration file, commonly used during bootup:

    begin
      trigger start entry start_kernel
      trigger stop entry to_userspace
      filter mintime 500
    end


 This trace says to:

-   start tracing when the function "start\_kernel" is entered
-   stop tracing when the function "to\_userspace" is entered
-   don't save the events for any function that takes less than 500
    microseconds

The function "start\_kernel" is the first C function executed by the
kernel on startup. The function "to\_userspace" is a function called
immediately before execution is transferred to the first user space
program (usually `/sbin/init`). This trace configuration says to start
tracing immediately when the kernel starts executing, and stop tracing
right before the first user space program runs. It will only save in the
trace buffer a record of functions that took longer than 500
microseconds to execute.

#### Triggers

Triggers, in the configuration, are used to start and stop the data
collection of the trace system. Triggers can be based on a function
entry or exit event, or on the passage of time. The stop trigger is used
to control the amount of data collected. The trace will automatically
stop if the buffer runs out of space for trace data.

Time values are expressed in decimal microseconds. The start time is
relative to booting, or to the initialization of the clock used for
tracing (usually, whatever clock is being used by the internal kernel
function sched\_clock(). A stop time is relative to the start time.)

Here are some examples:

-   statement: `trigger start entry start_kernel`
    -   meaning: start tracing when the kernel enters the function
        "start\_kernel"

-   statement: `trigger stop exit do_fork`
    -   meaning: stop tracing when the kernel exits the function
        "do\_fork"

-   statement: `trigger start time 10000000`
    -   meaning: start tracing 10,000,000 microseconds (10 seconds)
        after booting

-   statement: `trigger stop time 5000`
    -   meaning: stop tracing 5,000 microseconds (5 milliseconds) after
        the trace starts

#### Filters

Filters control what data is collected during the trace. Since every
kernel function entry and exit is a possible candidate for trace event
recording, KFT can potentially generate a LOT of data. To control how
much data is recorded, it is customary to set filters used during the
trace.

You can filter by function duration, by interrupt context, or limit the
trace to specific functions. Times in a filter statement are expressed
in microseconds. Functions in a filter function list can be expressed by
name in a static configuration, but must be expressed by addressed in a
dynamic configuration.

Here are some examples:

-   statement: `filter mintime 100`
    -   meaning: only keep functions in the trace which last at least
        100 microseconds

-   statement: `filter maxtime 5000000`
    -   meaning: discard functions in the trace which last more than
        5,000,000 microseconds (5 seconds)

-   statement: `filter noints`
    -   meaning: discard functions in the trace which are executed when
        the processor is in interrupt context

-   statement: `filter onlyints`
    -   meaning: retain only the functions in the trace which are
        executed when the processor is in interrupt context

-   statement: `filter funclist do_fork sys_read fend`
    -   meaning: retain only events for the functions do\_fork and
        sys\_read.

#### Configuration scenarios

For other commands you can include in the trace configuration, see
Appendix A

#### Handling a link error

You may get an error linking the kernel if you reference certain
functions in the `kftstatic.conf` that are not visible globally. If you
see a linker error like the following: "undefined reference to
\`foo\_func'", then you can resolve this by making `'foo_func'` visible.
Usually, this means finding the declaration of `'foo_func'`, and
removing the `'static'` keyword from its declaration.

## Initiating a KFT run

If you are running in static mode, upon booting the kernel, the trace
should be initiated and run automatically, depending on the trigger and
filter settings in `kernel/kftstatic.conf`).

If you are running in dynamic mode, then you initiate a run by writing a
KFT configuration to `/proc/kft`, then "priming" the run.

Traces go through a state machine (a series of event transitions) in
order to actually start collecting data. This is to allow trace
collection to be separated from trace setup and preparation. The trace
configuration specifies a start trigger, which will initiate the
collection of data. When the configuration is written to `/proc/kft`, it
is not ready to run yet. Making the trace ready to run is called
"priming" it.

Therefore, the normal sequence of events for a trace run is:

1.  . The user writes the configuration file, usually using an editor
    and creating the file in the local filesystem. Helper scripts can be
    used to auto-generate simple configurations for common tasks.
    1.  . There is a helper script scripts/sym2addr, which converts
        function names in the configuration file to addresses. This can
        be copied to the target, along with the current System.map file,
        to make preparing the configuration file easier.

2.  The user writes the configuration to KFT (via /proc/kft)
    1.  e.g. `cat /tmp/trace.config >/proc/kft`

3.  If needed, the user prepares for trace by setting up programs to
    run.
4.  The user primes the trace
    1.  e.g. `echo "prime" >/proc/kft`

5.  A kernel event occurs which starts the trace (the start trigger
    fires)
6.  Trace data is collected
7.  A kernel event or buffer exhaustion stops the trace (that is, the
    stop trigger fires, or the buffer runs out)

It is possible to force the start or end of a trace using the
`/proc/kft` interface. This overrides steps 5 or 7, which are normally
performed by triggers in the trace configuration.

-   To manually start a trace: `echo "start" >/proc/kft`
-   To manually stop a trace: `echo "stop" >/proc/kft`

You can get the status of the current trace by reading `/proc/kft`.

To see the status of the currently configured trace:

-   `cat /proc/kft`

## Reading the trace data

When the trace is running, the trace data is accumulated in a buffer
inside the kernel. Once the trace data is collected, you can retrieve if
from the kernel by copying the data from `/proc/kft_data`. Usually, you
will want to save the data to a file for later analysis.

Here is an example:

-   `cat /proc/kft_data >/tmp/kft.log`

## Processing the data

Copy the `kft.log` file from the target to your host development system
(on which the kernel source resides), for example, into the `/tmp`
directory on your host machine.

The raw `kft.log` file will only have numeric function addresses. To
translate these addresses to symbols, use the `addr2sym` program, along
with the `System.map` file which was produced when you built the kernel.

Change directory to your kernel source top-level directory and run
`scripts/addr2sym` to translate addresses to symbols:

Example:

    $ scripts/addr2sym /tmp/kft.log -m System.map > /tmp/kft.lst

Here is an example fragment of output from `addr2sym` on a TI OMAP
Innovator. Entry and Delta value are times in microseconds. The Entry
time is the time time since machine boot, and the Delta time is the time
between the function entry and exit.



     Entry      Delta      PID            Function                    Called At
    --------   --------   -----   -------------------------   --------------------------
       23662       1333       0                    con_init   console_init+0x78
       25375     209045       0             calibrate_delay   start_kernel+0xf0
      234425     106067       0                    mem_init   start_kernel+0x130
      234432     105278       0       free_all_bootmem_node   mem_init+0xc8
      234435     105270       0       free_all_bootmem_core   free_all_bootmem_node+0x28
      340498       4005       0       kmem_cache_sizes_init   start_kernel+0x134


 In the above, `calibrate_delay` took about 209 milliseconds.

`mem_init` took 106 msecs, the majority of which (105 msecs) was in
`free_all_bootmem_core` (which is called by `free_all_bootmem_node`,
which is called by `mem_init`).

If you just look at the function duration, it may appear that lots of
time is being spent in certain functions, when in reality those
functions are "thin", and the real time-consuming function is one of its
children. Thus, rather than look just at the function Delta (or
duration), you should look at the function entry times. If there is a
big leap in the function entry times, that means a lot of time was
consumed in the function right before the leap.

In the example above, there is a leap from 234435 to 340498 (about 100
milliseconds) between the Entry times for `free_all_bootmem_core` and
`kmem_cache_sizes_init`. No other functions Entries (lasting more than
500 microseconds, based on the KFT configuration used) were recorded
during this time, so this means that this time was spent in
`free_all_bootmem_core`.

CPU-yielding functions like schedule\_timeout, switch\_to,
kernel\_thread, etc. can have large Delta values due intervening
scheduling activity, but these can often be quickly filtered out by
following the "leaps in the entry times in the Entry column" above.

### Analyzing the data with kd

You can use the program `"kd"` to further process the data. It is very
helpful at this point to have resolved the names of the functions in the
log file, but it is not strictly necessary. The `kd` program function
reads a KFT log file and determines the time spent locally in a function
versus the time spent in sub-routines. It sorts the functions by the
total time spent in the function, and can display various extra pieces
of information about each function (number of times called, average call
time, etc.)

Also `kd` can be used to re-generate a function call trace from the
trace log. This can be very helpful to see the sequence of execution
(including interrupts, context switches and returns) of the code that
was traced.

Use "./kd -h" for more usage help.

As of this writing, KFT and kd do not correctly account for scheduling
jumps. The time reported by KFT for function duration is just wall time
from entry to exit.

For examples of what kd can show, try the following commands on the
sample kft output file:

[show all functions sorted by time]

    $ ./kd kftsample.lst | less

[show only 10 top time-consuming functions]

    $ ./kd -n 10 kftsample.lst

[show only functions lasting longer than 100 milliseconds]

    $ ./kd -t 100000 kftsample.lst

[show each function's most time-consuming child, and the number of times
it was called. (You may want to make your terminal wider for this
output.)]

    $ ./kd -f Fcatlmn kftsample.lst

[show call traces]

    $ ./kd -c kftsample.lst

[show call traces with timing data, and functions interlaced]

    $ ./kd -c -l -i kftsample.lst

Note that the call trace mode may not produce accurate results if weird
filtering was used in the trace config (routines that are part of the
call tree may be missing, which will confuse kd).

### KFT utilities

KFT includes the following helper scripts which are located in the
kernel `scripts` directory:

-   mkkftrun.pl - used during building the kernel to convert a
    configuration file into a C file to be compiled into the kernel.
    This is run automatically by the kernel make system. Users of KFT
    should not need to worry about this.
-   sym2addr - convert function names to addresses in a KFT
    configuration file (for a dynamic trace). This is only used if a
    dynamic configuration has function names.
-   addr2sym - convert function addresses to symbols in the trace data
-   kd - KFT dump - does filtering, sorting, analysis and trace
    formatting of KFT trace logs

The use of most these are described elsewhere in this document. But this
list is here for the sake of completeness.

[ should provide usage for each command? ]

## Tips for using KFT

-   How to look for long-duration functions?

<!-- -->

      (searching child functions for local time)

-   -   how to avoid being fooled by bogus local times
    -   How to see a detailed function trace (don't use a min-filter)
    -   How to interpret trace results including context switches

## Online Resources

Here's a presentation about KFT usage: (Actually, the presentation
covers KFT's predecessor KFI, but all the information is basically the
same.)

-   [Learning the Kernel and Finding Performance Problems with
    KFI](http://eLinux.org/images/a/a6/KFI-presentation.ppt "KFI-presentation.ppt")
    Presentation by Tim Bird at CELF [International Technical
    Jamboree](http://eLinux.org/International_Technical_Jamboree "International Technical Jamboree")
    in 2005
    -   [Media:omap-serial\_init.trace.txt](http://eLinux.org/images/1/1b/Omap-serial_init.trace.txt "Omap-serial init.trace.txt")
        - Sample trace used with presentation

## Appendices

### Appendix A - KFT configuration language

This appendix describes the language for specifying a KFT trace run. Is
it used for both static mode (`kftstatic.conf`), and dynamic mode
(written to `/proc/kft`).

#### A note on function names

NOTE that for parameters referencing functions, you can use the function
name in `kftstatic.conf` (that is, when you using a static
configuration). However, you have to use the function address when
setting the configuration via the `/proc/kft` interface. The reason for
this is that kernel symbols are always available at compile-time, but
may not be available in the kernel at runtime, depending on your kernel
configuration.

To convert a function name to an address, you can look up the address
for the symbol in the System.map file for the current kernel. There is a
helper program provided called `sym2addr` which you can use to convert
the function names in a configuration file into addresses. To do this
manually, use:

e.g. grep do\_fork System.map

    c001d804 T do_fork

In this case, you would put 0xc001d804 in place of the function name in
the configuration file. (Note the leading '0x'.)

To use the helper function `sym2addr`, do the following:

    sym2addr trace_do_fork.conf System.map >trace_do_fork.conf2
    cat trace_do_fork.conf2 >/proc/kft

#### configuration block

The configuration for a single run is inside a block that starts with
'begin' and ends with 'end'. Inside the block are triggers, filters, and
miscellaneous entries. By convention, each configuration entry is placed
on its own line. When writing the configuration to /proc/kft, then the
keyword "new" should appear before the block 'begin' keyword.

#### triggers

    trigger:
             either "start" or "stop", and then one of:
            entry <funcname>
            exit <funcname>
            time <time-in-usecs>
    syntax:
    trigger start|stop entry|exit|time <arg>

Start time is relative to booting. Stop time is relative to trace start
time.

#### filters

    filters
        maxtime <max-time>
        mintime <min-time>
        noints
        onlyints
        funclist <func1> <func2> fend

    syntax:
    filter noints|onlyints|maxtime|mintime|funclist <args> fend

The funclist specifies a list of functions which will be traced. When a
funclist is specified, only those functions are traced, and all other
functions are ignored.

When specifying a configuration via /proc/kft, the 'fend' keyword must
be used to indicated the end of the function list. When the
configuration is specified via kftstatic.conf, no 'fend' keyword should
be used.

#### watches

    watches
        stack <low-water-threshold>
        worst-stack <starting-low-water-threshold>

    syntax:
    watch stack|worst-stack <threshold>

A watch is used to have KFT monitor the trace for a particular
condition, and act on the condition (usually preserve extra data to help
debug that condition). The only supported watches currently are for
monitoring the stack depth.

For a "stack" watch, while the trace is running the current position of
the stack pointer is checked upon entry to every function. If the stack
position is lower than the specified threshold, the current call stack
of functions is preserved in the log (no matter whether the functions
match other KFT filtering criteria or not), and the function durations
are marked with a -2 value, to highlight them in the log. This operation
(saving the call stack) is performed every time the stack position
underflows the threshold. In this mode, an arbitrary number of call
stacks can be recorded in the log (up to the limit of the log size).

For a "worst-stack" watch, the same monitoring is performed as with a
"stack" watch. However, every time the condition is met, the threshold
(worst stack left) is set to the new low stack value. In this mode, a
call stack is preserved for each new low-water condition. The last such
set of marked functions in the log will record the most stack-consuming
call stack seen during the trace. Note also that the lowest recorded
stack position is available in the KFT status information (from
/proc/kft).

#### miscellaneous

    logentries <num-entries>

specify the maximum number entries for the log for this run

    autorepeat

Repeat trace indefinitely. That is, on trace trigger stop, prime the
trace to run again, but leave the data in the buffer. The trace will
start again when the start trigger is matched, and stop again when the
stop trigger is matched. The trace will stop autorepeating when the
buffer becomes full.

    # Other options that may be supported in the future:
    # overwrite
    # Overwrite old data in the trace buffer.  This converts the trace buffer to
    # a circular buffer, and does not stop the trace when the buffer becomes full.
    # In overwrite mode, the end of the trace is available if the buffer is
    # not large enough to hold the entire trace.  In NOT overwrite mode (regular
    # mode) the beginning of the trace is available if the buffer is not large
    # enough to hold the entire trace.

    # untimed
    # Do not time function duration.  Normally, the log contains only function
    # entry events, with the start time and duration of the function.  In
    # untimed mode, the log contains entry AND exit events, with the start
    # time for each event.  Calculation of function duration must be done by
    # a log post-processing tool.

    # prime
    # Immediately prime the trace for execution.  "Priming" a trace means making
    # it ready to run.  A trace loaded without the "prime" command will not be
    # enabled until the user issues a separate "prime" command through the
    # /proc interface.

    # prime entry ??
    # primt exit ??
    # prime time ??



#### Configuration Samples

Here are some configuration samples:

Record all functions longer that 500 microseconds, during bootup. Don't
include functions executed inside interrupts.

    new
    begin
      trigger start entry start_kernel
      trigger stop exit to_userspace
      filter mintime 500
      filter maxtime 0
      filter noints
    end

* * * * *

Record all functions longer that 500 microseconds, for 5 seconds after
the next fork don't worry about interrupts

Assuming 'do\_fork' is at address 0xc001d804

    new
    begin
      trigger start entry 0xc001d804
      trigger stop time 5000000
      filter mintime 500
      filter maxtime 0
      filter noints
    end



-   record short routines called by do\_fork
-   use a small log

<!-- -->

    new
    begin
      trigger start entry do_fork
      trigger stop exit do_fork
      filter mintime 10
      filter maxtime 400
      filter noints
      logentries 500
    end

-   record interrupts for 5 milliseconds, starting 5 seconds after
    booting

<!-- -->

    new
    begin
      trigger start time 5000000
      trigger stop time 5000
      filter onlyints
    end

-   record all calls to schedule after 10 seconds
-   Assuming schedule is at address

kftstatic.conf version:

    begin
      trigger start time 10000000
      filter funclist schedule fend
    end

/proc/kft version, assuming schedule is at c02cb754

    new
    begin
      trigger start time 10000000
      filter funclist 0xc02cb754 fend
    end





### Appendix B - Sample results

Here is an excerpt from a KFI log trace (processed with addr2sym). It
shows all functions which lasted longer than 500 microseconds, from when
the kernel entered start\_kernel() to when it entered to\_userspace().

#### kft log output (excerpt)

    Kernel Instrumentation Run ID 0

    Logging started at 6785045 usec by entry to function start_kernel
    Logging stopped at 8423650 usec by entry to function to_userspace

    Filters:

500 usecs minimum execution time

    Filter Counters:

    Execution time filter count = 896348
    Total entries filtered = 896348
    Entries not found = 24

    Number of entries after filters = 1757



     Entry      Delta      PID            Function                    Called At
    --------   --------   -----   -------------------------   -------------------------
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

#### kft log analysis with 'kd'

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



#### kft nested call trace with 'kd -c'

Below is a `kd -c` trace of the data from a log taken from a PPC440g
platform, from a (dynamic) trace of the function do\_fork().

Here is the configuration file that was used:

    new
    begin
      trigger start entry do_fork
      trigger stop exit do_fork
    end


 Here is the first part of the trace in nested call format: Times
(Entry, Duration and Local) are in micro-seconds. Note the timer
interrupt during the routine.

     Entry      Duration   Local       Pid    Trace
    ---------- ---------- ---------- ------- ---------------------------------
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
    ----------- !!!! start --------------
          253        151         63      33 timer_interrupt
          256          8          6      -1 !  profile_tick
          259          2          2      -1 !  !  profile_hit
          267         61         15      -1 !  update_process_times
          270          8          5      -1 !  !  account_system_time
          273          3          3      -1 !  !  !  update_mem_hiwater
          281          8          5      -1 !  !  run_local_timers
          284          3          3      -1 !  !  !  raise_softirq
          293         27         16      -1 !  !  scheduler_tick
    .
    .
    .



### Appendix C - Using KFT for monitoring stack usage

    * configure CONFIG_KFI_SAVE_SP (if saving the stack pointer as part of trace data)
    *

### Appendix D - Some notes on KFT operation

#### Trace overhead

KFT uses the "-finstrument-functions" capability of the gcc compiler to
add instrumentation callouts to every kernel function entry and exit.
This generates a large amount of overhead during kernel execution, even
if a trace is not active. For this reason, KFT is turned off in the
default configuration for your target board.

This high overhead means that using KFT may interfere with
time-sensitive operations on your device. You should be careful when
interpreting performance results on you device when KFT is configured on
in your kernel, whether the results are obtained from KFT or from some
other performance measurement tool. KFT is great at providing data for
relative performance comparisons, but not for absolute performance
timings.

* * * * *

Performance: KFT adds a fair amount of overhead to kernel execution. The
reason for this is that the compiler adds instrumentation hooks to the
start and end of every function. These hooks take additional time to
execute. When a trace is active, even more time is used as events are
compared against triggers and filters, and as events are logged to the
trace buffer. It would be inappropriate to use an instrumented kernel
for production use.

Local-time: Be careful when using the 'local time' numbers provided by
'kd'. These are calculated using the entry and exit times for the
functions, and then subtracting the duration of other functions called
during the top function's lifetime. However, due to filtering, interrupt
handling, or context-switching, these numbers can be way off.

##### Overhead measurement

Mitsubishi measured the overhead of KFI (the predecessor to KFT) The
period is from start\_kernel() to smp\_init().

Platform was: SH7751R 240MHz (Memory Clock 80MHz)

    With KFI    : 922.419 msec
    Without KFI : 666.982 msec
    Overhead    : 27.69%

#### Trace buffer exhaustion

Because every function in the kernel is traced, with certain trace
configuration settings it is possible to VERY rapidly fill up the trace
buffer. Kernel functions are executed several thousand times a second,
even when the machine appears to be doing nothing.

The trace buffer is not circular. As soon as the buffer fills up with
data, the trace capture automatically stops. For this reason, it is
common to have the trace buffer exhausted during a trace.


 How to fix:

    * increase the trace buffer size
    * use filters
      * filter only by certain functions
      * increase the minimum function duration to save in the trace

* * * * *

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

    trigger start entry start_kernel
    trigger stop entry to_userspace


 This will trace EVERYTHING that the kernel does between those two
routines. However, you can limit tracing to a much smaller time area of
kernel initialization using better triggers. Here is an example showing
a triggers for just watching mem\_init():

    trigger start entry mem_init
    trigger stop exit mem_init


 Filters are also vital to reduce the number of entries the trace log.
With no time filters in place, KFT will log every single function
executed by the kernel. This will quickly overrun the log (no matter
what size you have reserved with `logentries`.

When using KFT to find long-duration functions in the kernel, we usually
are not interested in routines that execute quickly, and instead use
something like "filter mintime 500" to filter out routines taking less
than 500 microseconds.

#### Early clock issues

On many platforms, the clock used for performing trace timings is not
available immediately when the kernel begins execution. Often, the clock
is initialized sometime during the time\_init() function of kernel
startup. In this case, the function entry times and durations may be
incorrect, for functions which begin before the clock is set up. Also
time-related filters will not operate correctly on these functions.
Usually, this is not a problem, since the times come back as zero, and
any minimum time filters in place will remove the events from the trace
buffer.

The result of all this is that, on machines where the clock is not
immediately available at kernel start, there will be a "blind spot"
during initialization, which is effectively not traceable by KFT. You
can get event data for this "blind" period, by turning off the time
filter for events, but this will result in a very large set of events
(all without valid timing information) at the beginning of the event
log.

##### Adding platform support for the KFT clock source

By default, KFT uses sched\_clock() as the clock source for event
timings. This is called from the routine kft\_readclock().

sched\_clock() is new in the 2.6 kernel, and returns a 64-bit value
containing nanoseconds (not necessarily relative to any particular time
base, but assumed to be monotonically increasing, and relatively
frequency-stable.)

If your platform has good support for sched\_clock(), then KFT should
work for you unmodified. If not, you may wish to do one of two things:

-   improve support for sched\_clock() in your board port, or
-   write a custom kft\_readclock() routine.

A "good" sched\_clock() routine will provide at least microsecond
resolution on return values. Some architectures have sched\_clock()
returning values based on the `jiffy` variable, which on many embedded
platforms only has resolution to 10 milliseconds.

There are some sample custom kft\_readclock() routines in the current
code for different architectures. These alternate routines are not
active, via pre-processor conditionals. However, you can use them for
samples of how to write your own custom KFT clock routine.

## Modification History

<table>
<thead>
<tr class="header">
<th align="left"><strong>Date</strong></th>
<th align="left"><strong>Version</strong></th>
<th align="left"><strong>Description</strong></th>
<th align="left"></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">2006-10-13</td>
<td align="left">0.1.0</td>
<td align="left">First draft of document</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">2007-04-26</td>
<td align="left">0.1.1</td>
<td align="left">Fixed &quot;run run&quot; typo, and added some material on filters and triggers</td>
<td align="left"></td>
</tr>
</tbody>
</table>


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")
-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")

