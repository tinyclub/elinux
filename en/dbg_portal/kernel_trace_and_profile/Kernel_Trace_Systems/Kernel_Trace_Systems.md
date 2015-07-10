> From: [eLinux.org](http://eLinux.org/Kernel_Trace_Systems "http://eLinux.org/Kernel_Trace_Systems")


# Kernel Trace Systems



Here are some links to information about different kernel tracing
systems:

## Contents

-   [1 General Purpose tracing
    systems](#general-purpose-tracing-systems)
-   [2 Special Purpose tracing
    systems](#special-purpose-tracing-systems)
-   [3 Trace Infrastructure](#trace-infrastructure)
-   [4 Sampling Systems](#sampling-systems)
-   [5 Related facilities](#related-facilities)
-   [6 Other Systems](#other-systems)
-   [7 Collaboration Efforts](#collaboration-efforts)

## General Purpose tracing systems

Some major Linux general-purpose tracing systems are:

-   ptrace - ability to trace syscall entry and exit, and signal
    delivery, to a process (also used for debugging a process)
    -   see "man ptrace" and "man strace"
-   [Ftrace](http://eLinux.org/Ftrace "Ftrace")
    -   [Ftrace Function Graph
        ARM](http://eLinux.org/Ftrace_Function_Graph_ARM "Ftrace Function Graph ARM") -
        presentations and patches by Tim Bird to add function graph and
        duration tracing to ARM systems
        -   The presentation has good introductory material on ftrace,
            as well as links to additional resources
    -   tracer for kernel functions
    -   can also be used for debugging or analyzing latencies and
        performance issues
    -   in mainline since 2.6.27
    -   See [Measuring Function Duration with
        FTrace](http://eLinux.org/Measuring_Function_Duration_with_FTrace "Measuring Function Duration with FTrace")
        - outline of presentation by Tim Bird for Linux Symposium 2009
-   [System Tap](http://eLinux.org/System_Tap "System Tap") - System Tap is a system for
    building and executing tracing and sampling systems that can be
    applied to a running Linux system
-   LTTng - [Linux Trace
    Toolkit](http://eLinux.org/Linux_Trace_Toolkit "Linux Trace Toolkit"), next
    generation
-   LKST - [Linux Kernel State
    Tracer](http://eLinux.org/Linux_Kernel_State_Tracer "Linux Kernel State Tracer")

## Special Purpose tracing systems

There are some other notable special-purpose kernel tracing systems:

-   KFT - [Kernel Function
    Trace](http://eLinux.org/Kernel_Function_Trace "Kernel Function Trace") - traces
    functions to show function durations and call graphs
-   latency trace - RT-preempt tool for measuring interrupt and mutex
    latency
    -   The latency tracer is embedded in the RT-preempt patch - see
        [Realtime
        Preemption](http://eLinux.org/Realtime_Preemption "Realtime Preemption") and
        [RT-preempt Article](http://lwn.net/Articles/97811/)
-   block tracer (blktrace) - allows you to see exactly what is going on
    in the block layer for a given queue
    -   Introduction by Jens Axboe:
        [Introduction](http://lwn.net/Articles/148761/)
    -   Execellent presentation:
        [blktrace.pdf](http://www.gelato.org/pdf/apr2006/gelato_ICE06apr_blktrace_brunelle_hp.pdf)
    -   Guide to using is at: [blktrace
        guide](https://secure.engr.oregonstate.edu/wiki/CS411/index.php/Blktrace_Guide)
    -   This appears to have been mainlined as of 2.6.17
    -   Timeline utility (blktrace post-processing tool): [blktrace
        timeline
        utility](http://www.nabble.com/NEW%3A-btt---blktrace-timeline-utility%3A-analyze-I-Os-collected-with-blktrace.-tf1644874.html)
-   delay accounting patches - collect statistics about the delays that
    are experienced by each task on the system
    -   see [delay accounting patches](http://lkml.org/lkml/2006/5/2/30)

## Trace Infrastructure

-   KProbes - grew out of dprobes, with information at:
    [dprobes](http://dprobes.sourceforge.net/)
    -   see an excellent tutorial at:
        [kprobes](http://www-users.cs.umn.edu/~boutcher/kprobes/)
    -   The mainline version of the KProbes supports x86,Alpha and PPC64
        architectures. A MIPS implementation has been completed on the
        2.6.16 kernel and tested on the Toshiba TX49 platform. Patch is
        available in the [Patch
        Archive](http://eLinux.org/Patch_Archive "Patch Archive").

-   [would be nice to have some djprobe stuff here]

## Sampling Systems

Note that profile systems (or "sampling systems") are slightly
different, in that they involve sampling instead of event tracing. Some
major ones for Linux are:

-   top - provides a dynamic real-time view of a running system,
    including processes
    -   see "man top"
    -   see also ksysguard, [Gnome system
        Monitor](http://freshmeat.net/projects/gnome-system-monitor/)
-   OProfile - system-wide profiler for Linux systems
    -   see [oprofile](http://oprofile.sourceforge.net/about/)
    -   also: [oprofile at
        IBM](http://www-128.ibm.com/developerworks/linux/library/l-oprof.html)
-   BootChart - samples bootup and provides visualization of process
    startup and system utilization
    -   see [Bootchart](http://eLinux.org/Bootchart "Bootchart")

## Related facilities

-   in-kernel statistics infrastructure - proposal for a generic
    implementation of statistics facilities inside the kernel
    -   see [inkernel stats](http://lkml.org/lkml/2006/5/19/106)
-   perfmon2 - interfaces to hardware performance monitoring features of
    the CPU
    -   see [perfmon](http://perfmon2.sourceforge.net/)
-   inotify -
    [inotify](http://www-128.ibm.com/developerworks/linux/library/l-inotify.html)

## Other Systems

Here are some systems I haven't classified yet:

-   Datastreams - a system for creating and monitoring tracepoints - see
    [datastreams](http://kusp.ittc.ku.edu/wiki/index.php/Main_Page)

## Collaboration Efforts

Some trace system project leaders are trying to collaborate: see
[Tracing Collaboration
Project](http://eLinux.org/Tracing_Collaboration_Project "Tracing Collaboration Project")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux tracing](http://eLinux.org/Category:Linux_tracing "Category:Linux tracing")

