> From: [eLinux.org](http://eLinux.org/System_Tap "http://eLinux.org/System_Tap")


# System Tap



This page has information about **System Tap**, which is of interest to
embedded developers, because tracers are a useful tool for diagnosing
problems during product development.

## Contents

-   [1 Introduction](#introduction)
-   [2 Open Source Projects/Mailing
    Lists](#open-source-projects-mailing-lists)
-   [3 Miscellaneous notes](#miscellaneous-notes)
    -   [3.1 Probe types](#probe-types)
-   [4 See Also](#see-also)
    -   [4.1 ARM Support](#arm-support)
-   [5 Some Performance measurements](#some-performance-measurements)
-   [6 Links](#links)

## Introduction

SystemTap is a flexible and extensible system for adding trace
collection and analysis to a running Linux kernel.

SystemTap is designed to be very flexible (allowing for the insertion of
arbitrary C code), yet also easy-to-use (most trace statements are
written in a simple scripting language, with useful data collection and
aggregation routines available in (essentially) library form).

A key aspect of SystemTap is that it is intended to allow you to create
a trace set (a "tapset"), and run it on a running Linux system, with no
modification or re-compilation of the system required. To do this, it
uses the kernel
[KProbes](http://www-users.cs.umn.edu/~boutcher/kprobes/) interface and
loadable kernel modules to dynamically add probe points and newly
generated code to the running kernel.

## Open Source Projects/Mailing Lists

The main SystemTap site is at:
[http://sourceware.org/systemtap/](http://sourceware.org/systemtap/)

The SystemTap mail list archives are at:
[http://sourceware.org/ml/systemtap/](http://sourceware.org/ml/systemtap/)

The tutorial, which gives a good overview of the system, is at:
[http://sourceware.org/systemtap/tutorial/](http://sourceware.org/systemtap/tutorial/)

## Miscellaneous notes

### Probe types

There are several types of probes:

-   kprobe & kretprobe, for dynamically insterted probes
-   timers
-   static instrumentation markers
-   performance counter events

In the future, there may be:

-   user-space probes,
-   user-space return probes, and
-   watchpoint probes (kernel & user)
-   and more

## See Also

Note that SystemTap is one of the major tracing systems for the Linux
kernel.

There is work afoot (as of spring 2006) to try to collaborate on
different parts of the tracing problem, between some of the major
tracing projects. See the [Tracing Collaboration
Project](http://eLinux.org/Tracing_Collaboration_Project "Tracing Collaboration Project")
page for more information.

### ARM Support

System Tap works on ARM & OMAP platforms instructions are available
[here](http://omappedia.org/wiki/Systemtap)

## Some Performance measurements

Jian Gui writes (in July 2006 on the **System Tap** mailing list):

    Hi, we've tested the overhead of systemtap/LKET with some benchmarks
    on a ppc64 machine.

    It shows the overhead of systemtap/LKET is acceptable generally.
    But it will also cause significant overhead for some benchmark of
    special behavior, e.g. dbench. Dbench calls kill() in a very high
    frequency to check whether a task is complete, thus leads to a high
    overhead.

    We categorized the event hooks into five groups in the testing:
    grp1 - syscall.entry, process
    grp2 - syscall.return, process
    grp3 - iosyscall, ioscheduler, scsi, aio, process
    grp4 - tskdispatch, pagefault, netdev, process
    grp5 - syscall.entry, syscall.return, process

    All the results are
       (score1 - score2)/score2 * 100%,  where:
    score1: the benchmark score when probed by systemtap
    score2: the benchmark score without probing

    dbench (<3% is noise)
    --------------------
    grp1            -14.4%
    grp2            -33.1%
    grp3            -7.92%
    grp4            -13.6%
    grp5            -43.3%

    specjbb (<3% is noise)
    ---------------------
    grp 1           -0.87%
    grp 2           -0.67%
    grp 4           +0.47%
    grp 5           +0.05%

    tiobench (<3% is noise)
    ----------------------
    grp1       sequential reads      +1.45%
               sequential writes     -6.98%
               random reads          +0.57%
               random writes         -2.11%
    grp2       sequential reads      +0.11%
               sequential writes     -5.81%
               random reads          +0.03%
               random writes         -2.11%
    grp3       sequential reads      +1.42%
               sequential writes     -6.98%
               random reads          +0.51%
               random writes         -2.11%
    grp4       sequential reads      +1.38%
               sequential writes     -5.81%
               random reads          +0.60%
               random writes         -2.11%
    grp5       sequential reads      +0.22%
               sequential writes     -8.14%
               random reads          -0.10%
               random writes         -1.05%

    Rawiobench (<3% is noise)
    ------------------------
    grp1       sequential aioread()     0%
               sequential aiowrite()    0%
               random aioread()         0%
               random aiowrite()        0%
    grp2       sequential aioread()     0%
               sequential aiowrite()    0%
               random aioread()         0%
               random aiowrite()        -0.82%
    grp3       sequential aioread()     0%
               sequential aiowrite()    0%
               random aioread()         0%
               random aiowrite()        0%
    grp4       sequential aioread()     0%
               sequential aiowrite()    0%
               random aioread()         +0.79%
               random aiowrite()        -0.82%
    grp5       sequential aioread()     0%
               sequential aiowrite()    -6.41%
               random aioread()         +0.79%
               random aiowrite()        0%

    Test environment:
    Machine:  Open Power 720/ 8 cpus/ 2 cores/ 6GB RAM (tiobench use 1G)
    Software: RHEL4-U3GA/ 2.6.17.2/ systemtap-20060718/ elfutils-0.122-0.4

## Links

-   [SystemTap Sans Kernel: A Pure Userspace
    Backend](https://events.linuxfoundation.org/events/collaboration-summit/stone)
    [Slides](https://events.linuxfoundation.org/images/stories/pdf/lfcs2012_jstone.pdf)
    [Video](http://video.linux.com/videos/systemtap-sans-kernel-a-pure-userspace-backend)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

