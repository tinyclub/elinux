> From: [eLinux.org](http://eLinux.org/Kernel_Size_Reduction_Work "http://eLinux.org/Kernel_Size_Reduction_Work")


# Kernel Size Reduction Work



This page has a list of of recent (as of 2014) ideas and projects for
Linux kernel size reduction.

As of June, 2014, [Linux Tiny](http://eLinux.org/Linux_Tiny "Linux Tiny") was no longer
maintained. However, new efforts to support Linux as a viable option on
micro-controllers and deeply embedded systems have led to renewed
interest in extreme size reduction of the kernel. Some good projects
were described at ELC 2014.

## Contents

-   [1 Recent work](#recent-work)
-   [2 List of recently used
    techniques](#list-of-recently-used-techniques)
    -   [2.1 Vitaly Wool's project](#vitaly-wool-s-project)
    -   [2.2 micro-yocto project](#micro-yocto-project)
        -   [2.2.1 instrumentation](#instrumentation)
    -   [2.3 auto-reduce](#auto-reduce)
-   [3 Ideas for new reductions](#ideas-for-new-reductions)
-   [4 People or groups interested in size
    reductions](#people-or-groups-interested-in-size-reductions)
    -   [4.1 individuals](#individuals)
    -   [4.2 companies](#companies)
-   [5 Meetings and Discussions](#meetings-and-discussions)
    -   [5.1 Kernel Summit 2014](#kernel-summit-2014)
    -   [5.2 Size/IOT summit at ELC Europe
        2014](#size-iot-summit-at-elc-europe-2014)

## Recent work

-   Tom Zanussi and the Micro-yocto project (2014)
    -   Micro-Yocto is an effort in the Yocto Project to produce a
        minimal kernel for very small embedded systems
    -   [microYocto and the Internet of Tiny
        (PDF)](http://eLinux.org/images/5/54/Tom.zanussi-elc2014.pdf "Tom.zanussi-elc2014.pdf")
        - Presentation by Tom Zanussi at ELC 2014
    -   See
        [https://github.com/tzanussi/meta-galileo/raw/daisy/meta-galileo/README](https://github.com/tzanussi/meta-galileo/raw/daisy/meta-galileo/README)
        for more information
-   Vitaly Wool described running 2.6.33 on an ST microcontroler with
    2MB flash and 256K ram (2014)
    -   [Linux for Microcontrollers: Spreading the Disease
        (PDF)](http://eLinux.org/images/c/ca/Spreading.pdf "Spreading.pdf") - presented
        at ELC in April 2014

## List of recently used techniques

### Vitaly Wool's project

-   kernel XIP
-   dietnet
-   ARM thumb mode
-   application XIP on squashfs

### micro-yocto project

-   net-diet
-   LTO
-   SYSFS\_SYSCALL
-   USELIB
-   BUG\_ON
-   X86\_IOPORT
-   CONFIG\_PTRACE
-   CONFIG\_SIGNALS
-   no sys\_sendfile

-   network reductions:
    -   replace kernel stack with user-space stack (LWIP)
    -   TCP/UDP echo (requires app changes)

#### instrumentation

microYocto tracing hash triggers

### auto-reduce

-   LTO
-   syscall filtering
-   command line filtering
-   global constraints
-   kernel stack size

## Ideas for new reductions

-   trace-guided optimization
-   cold code compression
    -   use U of Gent code to re-try cold code compression

## People or groups interested in size reductions

### individuals

-   Josh Triplett - e-mail:josh at joshtriplett dot org
    -   new linux tiny patches
-   Tom Zanussi - e-mail: tom dot zanussi at linux dot intel dot com
    -   microYocto
-   Andi Kleen - e-mail: ak at linux dot intel dot com
    -   netdiet patches
-   Alan Cox - email: alan dot cox at linux dot intel dot com
-   Shinsuke Kato - e-mail: kato dot shinsuke at jp dot panasonic dot
    com
-   Tim Bird - e-mail: tim dot bird at sonymobile dot com
    -   auto-reduce stuff
-   Vitaly Wool - e-mail: vitaly dot wool at softprise dot net
    -   extreme microcontroller Linux (\<256K RAM)
-   Phil Blundell - e-mail:
    -   meta-micro (OE-based small distro - last work in 2012)

### companies

-   [Emcraft Systems](http://www.emcraft.com/) sells a variety of
    microcontroller-based boards and products

## Meetings and Discussions

### Kernel Summit 2014

Josh Triplett has proposed a session discussing size issues at the 2014
Kernel Summit. His draft list of proposed topics was the following:
Topics:

-   An overview of why the kernel's size still matters today ("but don't
    we all have tons of memory and storage?")
-   Tiny in RAM versus tiny on storage.
-   How much the kernel has grown over time.
-   How size regressions happen and how to avoid them
-   Size measurement, bloat-o-meter, allnoconfig, and other tools
-   Compression and the decompression stub
-   Kconfig, and avoiding excessive configurability in the pursuit of
    tiny
-   Optimizing a kernel for its exact target userspace.
-   Examples of shrinking the kernel
-   Discussion on proposed ways to make the kernel tiny, how much they
    might save, how much work they'd require, and how to implement them
    with minimal impact to the un-shrunken common case.

(see
[http://lists.linuxfoundation.org/pipermail/ksummit-discuss/2014-May/000001.html](http://lists.linuxfoundation.org/pipermail/ksummit-discuss/2014-May/000001.html)
for the discussion thread)

### Size/IOT summit at ELC Europe 2014

We are considering holding a Size/IOT meeting at ELC Europe. Details
will be placed here should this meeting end up being organized.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")

