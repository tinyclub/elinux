> From: [eLinux.org](http://eLinux.org/System_Size_Auto-Reduction "http://eLinux.org/System_Size_Auto-Reduction")


# System Size Auto-Reduction



This page has notes and an outline for Tim Bird's Linux Auto-Reduction
research.

## Contents

-   [1 Talk info](#talk-info)
    -   [1.1 Title](#title)
    -   [1.2 Abstract](#abstract)
    -   [1.3 Final slides from talk](#final-slides-from-talk)
-   [2 Research Areas](#research-areas)
    -   [2.1 LTO](#lto)
    -   [2.2 global constraints](#global-constraints)
    -   [2.3 syscall elimination](#syscall-elimination)
    -   [2.4 ARM stack reduction](#arm-stack-reduction)
    -   [2.5 link-time rewriting](#link-time-rewriting)
    -   [2.6 cold code compression](#cold-code-compression)
    -   [2.7 cold code compression](#cold-code-compression-2)
-   [3 Talk outline](#talk-outline)
    -   [3.1 Title](#title-2)
    -   [3.2 Self-Introduction](#self-introduction)
    -   [3.3 The problem of Bloat](#the-problem-of-bloat)
    -   [3.4 Bloat (cont)](#bloat-cont)
    -   [3.5 Bloat (cont- 2)](#bloat-cont-2)
    -   [3.6 Automatic reduction
        (intro)](#automatic-reduction-intro)
    -   [3.7 auto-reduce - story of 8 bytes of
        bloat](#auto-reduce-story-of-8-bytes-of-bloat)
    -   [3.8 generalizing the problem of
        bloat](#generalizing-the-problem-of-bloat)
    -   [3.9 An example of fixed input (uid in
        kernel)](#an-example-of-fixed-input-uid-in-kernel)
    -   [3.10 types of constraints](#types-of-constraints)
    -   [3.11 also goes back up to
        user-space](#also-goes-back-up-to-user-space)
    -   [3.12 kernel command line args](#kernel-command-line-args)
    -   [3.13 /proc values](#-proc-values)
    -   [3.14 Tiny Distribution](#tiny-distribution)
-   [4 References](#references)
-   [5 Related Projects](#related-projects)
-   [6 Materials](#materials)

## Talk info

Tim gave a talk on this research at LinuxCon Japan 2013 (May 29 in
Tokyo, Japan)

### Title

Advanced size optimization of the Linux kernel

### Abstract

This presentation will cover recent research by Tim on aggressive size
reduction of the Linux kernel. This will include results from using gcc
link-time optimization (LTO) with the ARM architecture (using Andi
Kleen's out-of-tree patches), as well as results and discussion of other
optimization techniques (including whole-system optimization for
embedded devices).

This talk is directed at kernel developers interested in reducing the
size of their Linux systems (and possible improving their performance in
the process). The talk will be highly technical.

### Final slides from talk

[Media:Bird-Kernel-Size-Optimization-LCJ-2013.pdf](http://eLinux.org/images/9/9e/Bird-Kernel-Size-Optimization-LCJ-2013.pdf "Bird-Kernel-Size-Optimization-LCJ-2013.pdf")

## Research Areas

### LTO

-   What is it?
-   what was required to get it to work?
-   Andi Kleen's patch set
    -   what do they do?
    -   how big are they?
    -   mainline status?
-   what is the size gain (see ELC poster)
-   what can be done with it?
-   long-term possibilities for LTO

### global constraints

-   overall idea: create constraints external to code, and use for
    optimization
-   rationale: can't maintain in-tree - too many config items
-   make the application of constraints automatic
-   use existing constraints to generate new constraints
-   constraints can flow between user-space and kernel

-   example: uid=0
-   constraint language
-   application by commenting out references (replace with 0 constant)
    -   use compiler to find code references (via error messages)
        -   eliminates problem with duplicate names (uid in different
            structure)
-   constant propagation (by, e.g. LTO) reduces code

### syscall elimination

-   scan file system
-   create report of used and unused system calls
-   mark syscalls unused in kernel
    -   arch/arm/kernel/calls.S (and arch/arm/kernel/entry-common.S
-   make sure unused syscalls are not
    \_\_attribute\_\_(externally\_visible)
    -   technique of asmlinkage\_\<syscall\>
-   use LTO to eliminate calls
-   results: 50K-90K

### ARM stack reduction

-   4k stacks
-   stack extensions

### link-time rewriting

### cold code compression

-   D. Chanet did cold code compression
-   consists of:
    -   profiling the kernel
    -   marking code regions as cold or frozen
    -   replacing them with stubs
    -   compressing them
-   At execution time:
    -   if a stub is called, it decompresses the code and calls it
    -   stub is fixed up to directly call decompressed code in future
    -   code is left decompressed forever

### cold code compression

Results:

-   -   MUST see paper for details (it's quite complicated)
-   on 2.4.25 kernel
    -   cold code compression resulted in 7% reduction for i386 kernel
        and
    -   11.7% reduction for ARM kernel



## Talk outline

This talk will be presented at LinuxCon Japan 2013:

### Title

-   Advanced size optimization of the Linux kernel
    -   by Tim Bird, Sony Mobile Communication

### Self-Introduction

-   I am Tim Bird
-   Now working at Sony Mobile
-   Researching system size for many years
-   Long background in extremely small systems
    -   pre-professional: first program on TRS-80, in basic, 8K ram
    -   NetWare Lite - file and print server in 50K (in 1991)

### The problem of Bloat

-   Software bloat occurs because systems are built with more software
    than is really needed for a given task
-   Open Source software meets the needs of thousands of different
    systems
    -   Linux scales from tiny sensors to supercomputers (extreme SMP
        and high-end clusters)
    -   Linux supports many, many features, only some of which are
        configurable
-   Software must be generalized for many use cases
-   bloat problem is:
    -   How to re-specialize the software, eliminating unused features
        and dead code?

### Bloat (cont.)

-   Software gets more generalized over time
-   Can't use strategy of manual tuning (config options)
    -   It gets harder and harder to remove things over time
    -   About 13,000 config items now (2.6.12 had 4700)
    -   You have to be an expert in too many things to reduce the kernel
-   Must rely on automated methods of reduction
-   Should use an additive, rather than subtractive method of building a
    system
    -   ultimate vision: indicate what you want/need, and build up
        system to support it

### Bloat (cont. 2)

-   In desktop or server, virtual memory makes bloat issue less
    important for user-space programs
    -   Only working set of program is loaded - pages are loaded on
        demand
    -   For kernel, all pages are always loaded

### Automatic reduction (intro)

The problem with automatic reduction is that "the system" doesn't know
what software is needed and what is not. there needs to be a way to tell
it about things that are not going to be used.

### auto-reduce - story of 8 bytes of bloat

Story of the conditional check in kdb:

-   I found a bug in kdb, when a particular option was using in the
    configuration file
-   not everyone uses the configuration file
-   not everyone uses the particular option
-   bug only triggered in those circumstances
-   I wrote a small patch, to guard against use of a variable
    prematurely
-   problem: all users of KDB now have this check, and suffer this
    overhead
    -   it wasn't much, just a single compare
    -   but this is how bloat builds up over time
    -   It bothered me because I knew most people didn't need the check
-   "correct" solution would be to parse the config file, and make the
    code compile-time configurable
    -   this adds more complexity than it is worth.

### generalizing the problem of bloat

System doesn't know inputs:

-   It's very easy to configure the kernel to omit the driver for
    missing hardware.
-   It's very difficult to configure the kernel to omit error handling
    for bugs that

will never occur due to fixed use cases.

### An example of fixed input (uid in kernel)

-   throughout the kernel, there are references to uid
    -   comparisons, storing, referencing
-   it turns out this is set by setuid(), by the 'login' program.
    -   login does a lookup and validates user account name in
        /etc/passwd
-   what if /etc/passwd only has 'root' and no others?
-   setuid() could only be called with a value of 0
-   can I encode this constraint on the system.



### types of constraints

There are numerous other examples of constraints:

-   kernel command line arguments never used
-   syscalls never called by any program
-   parameters that are never used, or parameter values that are never
    passed in
    -   e.g. ioctl value that is not possible
    -   this only works in a fixed
-   /proc values never referenced
-   /sys values never referenced

### also goes back up to user-space

-   return values that are not possible

### kernel command line args

-   Documented in Documentation/kernel-parameters.txt
-   defined with \_\_setup() and early\_param from include/linux/init.h
    -   approximately 480 \_\_setup routines in kernel
    -   about 200 \_\_setup\_\* in System.map on ARM kernel build (98
        \_\_setup\_str\_\*)
    -   about 230 early\_param routines in kernel
-   points to function
-   almost always sets a variable, which would default to 0

-   on ARM, with only console\_setup and early\_mem marked as 'used',
    there was a 19K difference in size:

(non-LTO kernel)

    vmlinux.baseline-setup-used  =>  vmlinux-param-used
           baseline   other   change  percent
     text:  7680084  7663472   -16612   0%
     data:   362868   360516    -2352   0%
      bss:   745312   745184     -128   0%
    total:  8788264  8769172   -19092   0%

-   on ARM, with only console\_setup and early\_mem marked as 'used',
    there was a 19K difference in size:

(LTO kernel)

    vmlinux.lto-param  =>  vmlinux.param-used
           baseline   other   change  percent
     text:  1653672  1648920    -4752   0%
     data:   131636   130244    -1392  -1%
      bss:    50688    50528     -160   0%
    total:  1835996  1829692    -6304   0%


 System.map from kernel with console\_setup and early\_mem as only
routines marked 'used':

    $ grep __setup System.map
    c00ea4bc T __setup_irq.153323
    c00f1adc t __setup_per_zone_wmarks.172539.15755
    c019d570 t __setup_str_early_mem.21664.160821
    c019d884 t __setup_str_console_setup.61958.160201
    c019ef00 t __setup_early_mem.21659.160819
    c019ef00 T __setup_start
    c019ef0c t __setup_console_setup.61953.160195
    c019ef18 T __setup_end

### /proc values

-   Includes sysctl values
-   there are approximately 1200, NOT related specifically to a process
-   about 120 per process
    -   about 80 related to networking (on my desktop box)
-   40 others



### Tiny Distribution

-   poky-tiny distribution (yocto project)
-   see
    [https://wiki.yoctoproject.org/wiki/Poky-Tiny](https://wiki.yoctoproject.org/wiki/Poky-Tiny)
-   Good for testing and further research

## References

-   Chanet D. ... "Automated reduction of the memory footprint of the
    linux kernel"
-   Haifen He. ..."Code Compaction of an Operating System Kernel"

## Related Projects

-   AnyKernel and Rumpkernel - see thesis by Antti Kantee - pooka (at)
    iki (dot) fi
    -   [https://github.com/rumpkernel/wiki/wiki](https://github.com/rumpkernel/wiki/wiki)
    -   provides a system based on NetBSD to isolate sub-systems and
        drivers and allow their use in micro-kernels and user-space
    -   haven't read enough of it to determine if it could be applied to
        Linux, but sounds like just API wrapping
    -   I'm not sure how robust it would be in the context of rapid
        mainline churn

## Materials

-   [File:0001-ARM-LTO-avoid-errors-on-unified-assembly-macros.patch](http://eLinux.org/File:0001-ARM-LTO-avoid-errors-on-unified-assembly-macros.patch "File:0001-ARM-LTO-avoid-errors-on-unified-assembly-macros.patch")
-   [File:0001-Support-elimination-of-unused-kernel-parameters.patch](http://eLinux.org/File:0001-Support-elimination-of-unused-kernel-parameters.patch "File:0001-Support-elimination-of-unused-kernel-parameters.patch")
-   [File:0001-Add-option-to-omit-unused-syscalls.patch](http://eLinux.org/File:0001-Add-option-to-omit-unused-syscalls.patch "File:0001-Add-option-to-omit-unused-syscalls.patch")
-   Tools and notes from the project are at:
    [https://github.com/tbird20d/auto-reduce](https://github.com/tbird20d/auto-reduce)


