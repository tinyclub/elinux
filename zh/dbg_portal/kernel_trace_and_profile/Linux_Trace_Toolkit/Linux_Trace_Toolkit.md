> From: [eLinux.org](http://eLinux.org/Linux_Trace_Toolkit "http://eLinux.org/Linux_Trace_Toolkit")


# Linux Trace Toolkit



@) ***Preliminary Draft*** @) under construction

## Contents

-   [1 Introduction](#introduction)
    -   [1.1 Rationale](#rationale)
-   [2 Downloads](#downloads)
    -   [2.1 LTTng](#lttng)
    -   [2.2 Sample i386 trace for LTTng](#sample-i386-trace-for-lttng)
    -   [2.3 0.9.6 Release (Nov 21,
        2004)](#0-9-6-release-nov-21-2004)
    -   [2.4 Older stuff](#older-stuff)
    -   [2.5 getting attachments from ltt-dev
        archive](#getting-attachments-from-ltt-dev-archive)
    -   [2.6 Patch](#patch)
    -   [2.7 Utility programs](#utility-programs)
-   [3 How To Use](#how-to-use)
    -   [3.1 Building the software](#building-the-software)
    -   [3.2 Using the software](#using-the-software)
-   [4 References](#references)
-   [5 Sample Results](#sample-results)
-   [6 Future Work](#future-work)
-   [7 LKML Reaction to tracing](#lkml-reaction-to-tracing)

## Introduction

The Linux Trace Toolkit is used to examine the flow of execution
(between processes, kernel threads, and interrupts) in a Linux system.
This is useful for analyzing where delays occur in the system, and to
see how processes interact (especially with regard to scheduling,
interrupts, synchronization primitives, etc.)

[![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif) \* Note that as
of 2.6.14, LTT is being replaced with LTTng. See
[LTTng](http://ltt.polymtl.ca/)

See also the announcement here: [Patch: Linux Trace Toolkit Viewer/Next
Generation announcement (LTTV/LTTng)](http://lwn.net/Articles/170198/)

### Rationale

Tracing is useful for analyzing stuff.

## Downloads

### LTTng

See the QUICKSTART guide at:
[Quickstart](http://ltt.polymtl.ca/svn/ltt/branches/poly/QUICKSTART)

### Sample i386 trace for LTTng

Here is a zip file containing a sample trace on an i386 machine:
i386-ltt-trace.zip

### 0.9.6 Release (Nov 21, 2004)

I found it a bit difficult to get the appropriate set of patches for
LTT. After a bit of frustration, I built my own release for Nov. 23,
2004. The release is 0.9.6 (no 'pre') and it works with the Linux kernel
2.6.9. The tar file for the release is in the PatchArchive.

### Older stuff

The latest stable release is 0.9.5a, but this release is over 2 years
old.

Here is the patch set I finally used, for kernel 2.6.8.1:

-   [message with ltt-2.6.8.1-relayfs.patch.bz2 by Mathieu
    Desnoyers](http://www.listserv.shafik.org/pipermail/ltt-dev/2004-August/000638.html)
-   [message with ltt-2.6.8.1-ltt.patch.bz2 by Mathieu
    Desnoyers](http://www.listserv.shafik.org/pipermail/ltt-dev/2004-August/000637.html)

### getting attachments from ltt-dev archive

I had to use 'munpack' to extract the compressed patches from the mail
messages in the archive. 'munpack' is part of the package 'mpack', which
is available at: [munpack](ftp://ftp.andrew.cmu.edu/pub/mpack/)

### Patch

Here are some patches used by Tim Bird at Sony, targeted at MIPS, but
known to also work on other platforms. This tarball contains both an
all-in-one patch and a series file with discreet sub-patches.

-   -   [media:Ltt-2.6.11-from-TimBird.tgz](http://eLinux.org/images/b/b5/Ltt-2.6.11-from-TimBird.tgz "Ltt-2.6.11-from-TimBird.tgz")

-   Patches for Linux kernel version 2.6.8.1, and !TraceToolkit tarfile
    are here:
    -   ltt-2.6.8.1.tar.gz
    -   TraceToolkit-0.9.6pre3-plus.tar.gz

These are bundles with multiple sub-patches and sub-tars. To install
them, do the following:

-   untar kernel patches:
    -   `tar -xzvf ltt-2.6.8.1.tar.gz`
-   apply patches:
    -   `./tpm -t linux-2.6.8.1.tar.bz2 -f ltt-2.6.8.1.pl -o linux-2.6.8.1-ltt`
    -   untar !TraceToolkit stuff
    -   `tar -xzvf TraceToolkit-0.9.6pre3-plus.tar.gz`
-   unpack and apply patch:
    -   `./tpm -f TraceToolkit-0.9.6pre3-plus.pl -o TraceToolkit`

Now, follow the build and usage instructions for the software in the
include docs (!TraceToolkit/Help/index.html). For cross-compiling, use
the instructions on this wiki page.

### Utility programs

## How To Use

### Building the software

Apply the ltt and relayfs patches to your kernel:

-   configure kernel with LTT
-   turn on RelayFS and LTT

make menuconfig `File systems ---> Pseudo filesystems ---> `

-   Relayfs file system support

(exit, exit) General Setup ---\>

-   Linux Trace Toolkit support

You can leave klog debugging support turned off.

Compile the user-space tracedaemon program:

I couldn't figure out if the tracevisualizer tools handle
cross-compilation correctly (by which I mean that you can natively
compile the tracevisualizer but cross-compile the tracedaemon). Instead
of blindly trying configure tricks, I instead used the instructions from
Karim's book "Building Embedded Linux Systems". In a nutshell, the
instructions go something like this:

Overview:

    * install source for user-space stuff
    * configure for native build
    * hand-build tracedaemon specifying a cross-compiler
    * build rest of user-space suite using native compiler
    * install programs as appropriate

Detail (in my case):

    * install !TraceToolkit-0.9.6pre3, apply "plus" patch
      ** tpm -f user-space.pl -o !TraceToolkit-0.9.6pre3
    * cd !TraceToolkit-0.9.6pre3
    * configure --prefix=/home/tbird/work/ltt/tools
    * make -C !LibUserTrace CC=<cross-compiler-gcc> !UserTrace.o
    * make -C !LibUserTrace CC=<cross-compiler-gcc> LDFLAGS="-static"
    * make -C Daemon CC=<cross-compiler-gcc> LDFLAGS="-static"
    * cp Daemon/tracedaemon Daemon/Scripts/trace Daemon/Scripts/tracecore

Daemon/Scripts/traceu \<target file syste\>/usr/sbin

    * make
    * make install

### Using the software

In April, 2004, Karim wrote: [lkml
thread](http://lkml.org/lkml/2004/4/3/100))
` The documentation is out of date. Basically, the createdev.sh script isn't needed anymore because of relayfs. You need to mount relayfs to use LTT. See the classic dox on filesystem mounting for this kind of thing. It's going to be something like: # mount -t relayfs nodev /mnt/relay`

There's no insmod for LTT. It isn't a device driver module, following
LKML recommendations.

## References

-   LTT home page is at: [LTT](http://www.opersys.com/LTT/)
-   Presentation from OLS 2006:
    -   [LTTng Tracer : A low impact performance and behavior monitor
        for
        GNU/Linux](http://ltt.polymtl.ca/slides/desnoyers-talk-ols2006.pdf)
-   Online documentation is at: [LTT
    Documentation](http://www.opersys.com/LTT/dox/ltt-online-help/index.html)
    -   This documentation is a bit old (2002), and has parts that are
        out of date.

## Sample Results

## Future Work

Here is a list of things that could be worked on for this feature:

-   online reference needs to be updated
    -   e.g. no mention of relayfs
-   project seems fairly quiet, and unmaintained
-   see if LTT patch should be refactored to take into account new
    kprobe support in the kernel

## LKML Reaction to tracing

In Sep 2002, there was a thread about tracing, where some major kernel
developers expressed their concerns about tracing infrastructure in the
kernel.

-   [Ingo
    Molnar](http://seclists.org/lists/linux-kernel/2002/Sep/5094.html)

`my problem with this stuff is conceptual: it introduces a constant drag on the kernel sourcecode, while 99% of development will not want to trace, ever. When i do need tracing occasionally, then i take those 30 minutes to write up a tracer from pre-existing tracing patches, tailored to specific problems.</source> ... so use the power of the GPL-ed kernel and keep your patches separate, releasing them for specific stable kernel  ranches (or even development kernels).`

-   [Linus
    Torvalds](http://seclists.org/lists/linux-kernel/2002/Sep/5140.html)

` > To summarize: You find tracing useful, but software tracing is only of limited value in areas you're working at. What about other developers, which only want to develop a simple driver, without having to understand the whole kernel? Traces still work where printk() or kgdb don't work. I think it's reasonable to ask an user to enable tracing and reproduce the problem, which you can't reproduce yourself.`

That makes adding source bloat ok? I've debugged some drivers with
dprintk() style tracing, and it often makes the code harder to follow,
even if it ends up being compiled away.

From what I've seen from the LTT thing, it's too heavy-weight to be good
for many things (taking SMP-global locks for trace events is \_not\_ a
good idea if the trace is for doing things like doing performance
tracing, where a tracer that adds synchronization fundamentally
\_changes\_ what is going on in ways that have nothing to do with
timing).

I suspect we'll want to have some form of event tracing eventually, but
I'm personally pretty convinced that it needs to be a per-CPU thing, and
the core mechanism would need to be very lightweight. It's easier to
build up complexity on top of a lightweight interface than it is to make
a lightweight interface out of a heavy one.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Tracing](http://eLinux.org/index.php?title=Category:Tracing&action=edit&redlink=1 "Category:Tracing (page does not exist)")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

