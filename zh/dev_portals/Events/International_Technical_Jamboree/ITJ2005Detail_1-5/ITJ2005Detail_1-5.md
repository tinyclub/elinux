> From: [eLinux.org](http://eLinux.org/ITJ2005Detail_1-5 "http://eLinux.org/ITJ2005Detail_1-5")


# ITJ2005Detail 1-5



## Contents

-   [1 Technical Discussion: "Learning the Kernel, and Finding
    Performance Problems, with
    KFI"](#-technical-discussion-learning-the-kernel-and-finding-performance-problems-with-kfi)
    -   [1.1 by Tim Bird (Sony)](#by-tim-bird-sony)
    -   [1.2 Description](#description)
    -   [1.3 Presentation materials](#presentation-materials)

## Technical Discussion: "Learning the Kernel, and Finding Performance Problems, with KFI"

### by Tim Bird (Sony)

### Description

Kernel Function Instrumentation is a simple tracing system for the Linux
kernel, which is easy to use and very powerful. Profiling systems, such
as OPROFILE, perform a statistical sampling of execution locations over
a period of time. Other event tracing systems, like LKST or LTT, utilize
a relatively small number of fixed tracepoints to analyze state
transitions and event flow in a Linux system. KFI differs from these in
that it provides highly detailed and comprehensive call-graphs with
timing data (essentially instrumenting EVERY function in the kernel).

Because of this high level of detail, KFI is useful for learning how the
kernel operates, and because of KFI's runtime filtering and
post-processing tools, it is especially useful for finding long delays
and performance problems in the Linux kernel. This tool has been used
extensively by the Bootup Time Working Group of CELF to find long delays
in kernel startup.

This talk give an introduction to KFI and give a tutorial on its basic
use. Also, I will present some new features of KFI that have just been
released, including support for dynamic traces (ability to configure and
start a trace from user space via a /proc interface), and a new tool for
showing threaded call graphs.

### Presentation materials

-   [Media:KFI-presentation.ppt](http://eLinux.org/images/a/a6/KFI-presentation.ppt "KFI-presentation.ppt")
-   [Media:omap-serial\_init.trace.txt](http://eLinux.org/images/1/1b/Omap-serial_init.trace.txt "Omap-serial init.trace.txt")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Events](http://eLinux.org/Category:Events "Category:Events")

