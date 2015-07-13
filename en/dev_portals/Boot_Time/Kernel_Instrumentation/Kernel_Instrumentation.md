> From: [eLinux.org](http://eLinux.org/Kernel_Instrumentation "http://eLinux.org/Kernel_Instrumentation")


# Kernel Instrumentation



Here is a listing of some instrumentation systems for the kernel:

## Contents

-   [1 Existing Instrumentation
    Systems](#existing-instrumentation-systems)
    -   [1.1 TimePegs](#timepegs)
    -   [1.2 Printk Times](#printk-times)
    -   [1.3 Boot Tracer](#boot-tracer)
    -   [1.4 Kernel Function Instrumentation
        (KFI)](#kernel-function-instrumentation-kfi)
    -   [1.5 Linux Trace Toolkit](#linux-trace-toolkit)
    -   [1.6 Kernel Tracer (in IKD
        patch)](#kernel-tracer-in-ikd-patch)
    -   [1.7 Function trace in KDB](#function-trace-in-kdb)
    -   [1.8 ftrace](#ftrace)
    -   [1.9 SystemTap / Kprobes](#systemtap-kprobes)
-   [2 Notes](#notes)

## Existing Instrumentation Systems

### TimePegs

Andrew Morton's system for measuring intervals between kernel events:

See
[http://www.zipworld.com.au/\~akpm/linux/timepeg.txt](http://www.zipworld.com.au/~akpm/linux/timepeg.txt)

Patches at:

[http://www.zip.com.au/\~akpm/linux/index.html\#timepegs](http://www.zip.com.au/~akpm/linux/index.html#timepegs)

### Printk Times

Produces printk's with extra time data on them. As of kernel 2.6.11 this
is part of the mainline kernel enabled by CONFIG\_PRINTK\_TIME. Previous
versions can add it via a very simple patch. It works for bootup time
measurements, or other places where you can just jam in a printk or two.

See [Printk Times](../../.././dev_portals/Boot_Time/Printk_Times/Printk_Times.md "Printk Times")

### Boot Tracer

Starting from 2.6.28 the kernel has this new feature to optimize the
boot time. It records the timings of the initcalls. Its aim is to be
parsed by the scripts/bootgraph.pl tool to produce graphics about boot
inefficiencies, giving a visual representation of the delays during
initcalls. Users need to boot with the "initcall\_debug" and
"printk.time=1" parameters, and run "dmesg | perl scripts/bootgraph.pl
\> output.svg" to generate the final data.

### Kernel Function Instrumentation (KFI)

A system which uses a compiler flag to instrument most of the functions
in the kernel. Timing data is recorded at each function entry and exit.
The data can be extracted and displayed later with a command-line
program.

The kernel portion of this is available in the CELF tree now.

Grep for CONFIG\_KFI.

See the page [Kernel Function
Instrumentation](http://eLinux.org/Kernel_Function_Instrumentation "Kernel Function Instrumentation")
page for some preliminary notes.

FIXTHIS - need to isolate this as a patch.

### Linux Trace Toolkit

See [Linux Trace Toolkit](http://www.opersys.com/LTT/)

### Kernel Tracer (in IKD patch)

This is part of a general kernel tools package, maintained by Andrea
Arcangeli.

See
[http://www.kernel.org/pub/linux/kernel/people/andrea/ikd/README](http://www.kernel.org/pub/linux/kernel/people/andrea/ikd/README)

The ktrace implementation is in the file kernel/debug/profiler.c It was
originally written by Ingo Molnar, Richard Henderson and/or Andrea
Arcangeli

It uses the compiler flag -pg to add profiling instrumentation to the
kernel.

### Function trace in KDB

Last year (Jan 2002) Jim Houston sent a patch to the kernel mailing list
which provides support compiler-instrumented function calls.

See
[http://www.ussg.iu.edu/hypermail/linux/kernel/0201.3/0888.html](http://www.ussg.iu.edu/hypermail/linux/kernel/0201.3/0888.html)

### ftrace

Ftrace is a simple function tracer which initially came from the -rt
patches but was mainlined in 2.6.27. Compiler profiling features are
used to insert an instrumentation call (with gcc *-pg* option) that can
be overwritten with a NOP sequence to ensure overhead is minimal with
tracing disabled (this is enabled through CONFIG\_DYNAMIC\_FTRACE).
There are a number of tracers in the kernel that use ftrace to trace
high level events such as irq enabling/disabling preemption
enabling/disabling, scheduler events and branch profiling.

The interface to access ftrace can be found in */debugfs/tracing*, and
is very extensively documented in
[Documentation/trace/ftrace.txt](http://lxr.free-electrons.com/source/Documentation/trace/ftrace.txt).

Steven Rostedt, ftrace's main developer, gave a conference on ftrace at
the Ottawa Linux Symposium 2008. The
[video](http://free-electrons.com/pub/video/2008/ols/ols2008-steven-rostedt-ftrace.ogg)
and [slides](http://people.redhat.com/srostedt/ftrace-tutorial.odp).

### SystemTap / Kprobes

[SystemTap](http://sourceware.org/systemtap/) is a sophisticated kernel
instrumentation tool that can be scripted with its own language to
gather information about a running kernel. It uses the Kprobes
infrastructure to implement it's tracing.

## Notes

Some random thoughts on instrumentation:

-   Most instrumentation systems need lots of memory to buffer the data
    produced
-   Some instrumentation systems support filters or triggers to allow
    for better control over the information saved
-   instrumentation systems tend to introduce overhead or otherwise
    interfere with the thing they are measuring
    -   instrumentation systems tend to pollute the cache lines for the
        processor
-   There doesn't seem to be a single API to support in-kernel timing
    instrumentation which is supported on lots of different
    architectures. This is the main reason for CELF's current project to
    define an [Instrumentation
    API](http://eLinux.org/Instrumentation_API "Instrumentation API")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

