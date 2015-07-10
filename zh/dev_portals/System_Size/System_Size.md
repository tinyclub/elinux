> From: [eLinux.org](http://eLinux.org/System_Size "http://eLinux.org/System_Size")


# System Size



## Contents

-   [1 Introduction](#introduction)
-   [2 Technologies for decreasing system
    size](#technologies-for-decreasing-system-size)
    -   [2.1 Kernel size reduction](#kernel-size-reduction)
        -   [2.1.1 Configuration Options](#configuration-options)
        -   [2.1.2 The Linux-tiny patchset](#the-linux-tiny-patchset)
        -   [2.1.3 "dietnet"](#-dietnet)
        -   [2.1.4 Compiler options for reducing kernel
            size](#compiler-options-for-reducing-kernel-size)
        -   [2.1.5 Section garbage collection
            patchset](#section-garbage-collection-patchset)
        -   [2.1.6 Runtime size of kernel](#runtime-size-of-kernel)
            -   [2.1.6.1 kernel stack size](#kernel-stack-size)
        -   [2.1.7 Auto-reduction](#auto-reduction)
        -   [2.1.8 Compressed printk
            messages](#compressed-printk-messages)
        -   [2.1.9 Reduction Ideas and recent
            work](#reduction-ideas-and-recent-work)
    -   [2.2 File system compression](#file-system-compression)
    -   [2.3 Shrinking your application](#shrinking-your-application)
        -   [2.3.1 Compiler options for program
            size](#compiler-options-for-program-size)
        -   [2.3.2 Stripping your program](#stripping-your-program)
        -   [2.3.3 Hand-optimizing programs, for
            size](#hand-optimizing-programs-for-size)
    -   [2.4 Library savings](#library-savings)
        -   [2.4.1 Use of a smaller libc](#use-of-a-smaller-libc)
        -   [2.4.2 Static Linking](#static-linking)
        -   [2.4.3 Library reduction](#library-reduction)
        -   [2.4.4 Deferred Library Loading](#deferred-library-loading)
    -   [2.5 Execute-in-place](#execute-in-place)
        -   [2.5.1 Kernel XIP](#kernel-xip)
        -   [2.5.2 Application XIP](#application-xip)
        -   [2.5.3 Data Read In Place
            (DRIP)](#data-read-in-place-drip)
-   [3 Size measurement tools and
    techniques](#size-measurement-tools-and-techniques)
    -   [3.1 Kernel size measurement
        data](#kernel-size-measurement-data)
    -   [3.2 How to measure the kernel image
        size](#how-to-measure-the-kernel-image-size)
    -   [3.3 How to measure the memory usage at
        runtime](#how-to-measure-the-memory-usage-at-runtime)
    -   [3.4 Linux size increase from 2.4 to
        2.6](#linux-size-increase-from-2-4-to-2-6)
    -   [3.5 GCC Code-Size Benchmarking](#gcc-code-size-benchmarking)
-   [4 Case Studies](#case-studies)
    -   [4.1 uClinux](#uclinux)
    -   [4.2 Linux on MicroControllers (M3 in this
        case)](#linux-on-microcontrollers-m3-in-this-case)
-   [5 Reduced-size distribution
    efforts](#reduced-size-distribution-efforts)
-   [6 Other Tidbits on System Size](#other-tidbits-on-system-size)
    -   [6.1 Memory leak detection for the
        kernel](#memory-leak-detection-for-the-kernel)
    -   [6.2 How System Size may affect
        performance](#how-system-size-may-affect-performance)
    -   [6.3 Stripping down the filesystem of a desktop
        distribution](#stripping-down-the-filesystem-of-a-desktop-distribution)
    -   [6.4 Extremely-minimal systems](#extremely-minimal-systems)

## Introduction

Here are some links to information and projects related to Linux system
size.

## Technologies for decreasing system size

### Kernel size reduction

Another wiki at
[https://tiny.wiki.kernel.org/](https://tiny.wiki.kernel.org/) has
information about renewed efforts (as of August 2014) to reduce the
kernel size.

#### Configuration Options

-   [Kernel Size Tuning
    Guide](http://eLinux.org/Kernel_Size_Tuning_Guide "Kernel Size Tuning Guide") -
    document about measuring kernel size and configuring the kernel for
    smallest size

#### The Linux-tiny patchset

-   The [Linux Tiny](http://eLinux.org/Linux_Tiny "Linux Tiny") patch set is a collection
    of patches which can be used to make the Linux kernel consume less
    space. The long-term goal of the Linux-tiny project is to mainline
    these patches. Several patches have been mainlined over the last few
    years, and work continues in this area.

#### "dietnet"

Andi Kleen submitted a set of patches (May 2014) to reduce the size of
the Linux kernel networking stack. See the submission thread here:
[https://lkml.org/lkml/2014/5/5/686](https://lkml.org/lkml/2014/5/5/686)

Andi states that the patches support 3 use cases:

-   full-featured network stack (default Linux network stack)
-   client-only stack - with reduced features but still compatible with
    normal user-space programs, and suitable for some uses
-   minimal subset for deeply embedded, which would require specialized
    user-space software

In order to get full size reductions, it is best to use these patches
with LTO. Doing so results in network stack that requires about 170K to
run (versus 400K for the default stack).

#### Compiler options for reducing kernel size

An LWN article talks about three gcc options to shrink the kernel.

[Shrinking the Kernel with GCC](http://lwn.net/Articles/67175/)

The first option is -Os which is already in the tiny kernel patch.

Since version 3.4, gcc offered a -funit-at-a-time option. This
apparently made gcc do a much better job of inlining and dead code
removal, reducing the size of both text and data. It depended on another
inlining patch. According to gcc's manual, this option no longer does
anything.

The -fwhole-program --combine option set is equivalent to grouping all
source files and making all variables static. These options are still
supported by gcc, but not longer offered in BusyBox configuration
options. What happened?

Another option, -mregparm=3, seems to be x86 specific, it instructs the
compiler to use registers for the first three function arguments. by
John Rigby

See [[1]](http://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html) for
all available optimization switches. See
[Compiler\_Optimization](http://eLinux.org/Compiler_Optimization "Compiler Optimization")
for more details on effects of optimization options.

#### Section garbage collection patchset

These [patches](http://busybox.net/~vda/k-sections/) can shrink kernel
size by \~10% by improving dead code/data elimination at link time. They
are being pushed to mainline. Due to a linker
[bug](https://bugzilla.redhat.com/show_bug.cgi?id=621742), their
acceptance depends on a newer, fixed linker (will be in binutils-2.21).
Good news are that the bug affects only certain architectures (parisc),
so the patches are usable even with "old" linker.

#### Runtime size of kernel

Often, the focus of memory size reduction for the kernel is on the size
of the statically compiled image for the kernel. However, the kernel
also allocates memory dynamically when it runs. On loading, the kernel
creates several tables for things like network and file system
structures.

Here is a table showing different kernel hash tables, and their
approximate size for a 2.6 kernel. (Table taken from page 25 of
[http://logfs.org/\~joern/data\_structures.pdf](http://logfs.org/~joern/data_structures.pdf)
)

Hash Table

memory \< 512MiB RAM

memory \>=512MiB RAM

32b/64b

32b/64b

TCP established

96k/192k

384k/768k

TCP bind

64k/128k

256k/512k

IP route cache

128k/256k

512k/1M

Inode-cache

64k/128k

64k/128k

Dentry cache

32k/64k

32k/64k

Total

384k/768k

1248k/2496k

##### kernel stack size

There used to be a configuration option for reducing the size of the
kernel stack for each process to 4K. By default (as of 2011), the
default kernel stack size is 8K. If you have a lot of processes, then
using 4K stacks can reduce the kernel stack usage.

Some notes about this are at: [Kernel Small
Stacks](http://eLinux.org/Kernel_Small_Stacks "Kernel Small Stacks")

#### Auto-reduction

In 2012, Tim Bird studied a few different techniques related to
automatic size reduction and whole-system optimization. Specifically, he
studied the following items:

-   link-time optimization of the kernel
-   syscall elimination
-   global constraints
-   kernel stack reduction

Tim also found some very interesting academic research on link-time
re-writing and cold-code compression. Tim's work was presented at
LinuxCon Japan in May, 2013.

A draft outline and completed slides for the talk are at [System Size
Auto-Reduction](http://eLinux.org/System_Size_Auto-Reduction "System Size Auto-Reduction")

#### Compressed printk messages

The open project proposal [Compressed printk
messages](http://eLinux.org/Compressed_printk_messages "Compressed printk messages")
evaluated this technique in 2014. The results can be found on the
[Compressed printk messages -
Results](http://eLinux.org/Compressed_printk_messages_-_Results "Compressed printk messages - Results")
page.

#### Reduction Ideas and recent work

A group of developers is (as of 2014) doing continued size reduction
work on the Linux kernel. A page has been set up to categorize recent
work and ideas for future kernel size reductions. The page is: [Kernel
Size Reduction
Work](http://eLinux.org/Kernel_Size_Reduction_Work "Kernel Size Reduction Work")

### File system compression

For read-only data, it is useful to utilize a compressed file system.
The following are used heavily in embedded systems:

-   Cramfs and SquashFS, for block storage.
-   JFFS2 and its successor UBIFS, for flash (MTD) storage.

Note that Cramfs and Squashfs, due to their "write-only-once" nature,
can also be used on MTD storage.

See the [File Systems](http://eLinux.org/File_Systems "File Systems") page for more
information.



### Shrinking your application

#### Compiler options for program size

You can use "gcc -Os" to optimize for size.

#### Stripping your program

You can use the 'strip' command to eliminate unneeded symbols from your
application. The 'strip' command should be included with your toolchain,
and may be architecture-specific. (I.e. you may need to run it with a
toolchain prefix, like "arm-linux-strip")

Note that this makes debugging your application more difficult, because
the debug symbols are no longer available.

By default, strip just removes debug symbols. You can remove everything
but the essential symbols used for dynamic linking. To get the highest
savings, use "strip --strip-unneeded \<app\>"

This can save a lot of space, especially if debug symbols were included
in the build.

    $ gcc -g hello.c -o hello
    $ ls -l hello
    -rwxrwxr-x 1 tbird tbird 6143 2009-02-10 09:43 hello
    $ strip hello
    $ ls -l hello
    -rwxrwxr-x 1 tbird tbird 3228 2009-02-10 09:43 hello
    $ strip --strip-unneeded hello
    $ ls -l hello
    -rwxrwxr-x 1 tbird tbird 3228 2009-02-10 09:43 hello

Now, compiles without debug symbols to start with:

    $ gcc hello.c -o hello
    $ ls -l hello
    -rwxrwxr-x 1 tbird tbird 4903 2009-02-10 09:45 hello
    $ strip hello
    $ ls -l hello
    -rwxrwxr-x 1 tbird tbird 3228 2009-02-10 09:45 hello

You can strip both executables as well as shared libraries.

There is a "super-strip" utility, which removes additional material from
an ELF executable program (which 'strip' usually misses). It is
available at:
[http://muppetlabs.com/\~breadbox/software/elfkickers.html](http://muppetlabs.com/~breadbox/software/elfkickers.html)
*This program appears to be obsolete now. I couldn't get it to compile
on Fedora 8*.

Some information about stripping individual sections by hand, using the
-R command is available at:
[http://reverse.lostrealm.com/protect/strip.html](http://reverse.lostrealm.com/protect/strip.html)

#### Hand-optimizing programs, for size

If you are very intent on creating small binaries, you can use some
techniques to manually create the smallest Linux executables possible.

See [A Whirlwind Tutorial on Creating Really Teensy ELF Executables for
Linux](http://muppetlabs.com/~breadbox/software/tiny/teensy.html)

### Library savings

#### Use of a smaller libc

Glibc is the default C library used for Linux systems. Glibc is about 2
meg. in size. Other C libraries are also available for Linux, and they
offer varying degrees of compatibility and size savings. In general,
uClibc is considered a very good alternative to glibc, for systems where
size is an issue.

-   [uClibc](http://uclibc.org/) - small footprint but complete C
    library
-   [dietlibc](http://www.fefe.de/dietlibc/) - another library to
    produce very small statically compiled executables.
-   [klibc](http://www.kernel.org/pub/linux/libs/klibc/) - very small
    library for use in init ram filesystems
-   [eglibc](http://www.eglibc.org/home) - a version of glibc designed
    for embedded systems. Reduced footprint is one of the design goals.
-   [musl libc](http://www.musl-libc.org/) - a lightweight, fast,
    simple, and standards-compliant C library
-   [olibc](http://olibc.github.com/) - another C library optimized for
    size and performance, derived from Android bionic libc
-   Subset Libc Specification - CELF once considered the possibility of
    creating a subset libc specification. Some companies have also
    examined the possibility of modularizing glibc, so that parts of it
    can be made configurable. Preliminary research indicates that this
    could be a very difficult thing, since glibc has very messy function
    interdependencies.

#### Static Linking

If your set of applications is small, sometimes it makes more sense to
statically link your applications than to use shared libraries. Shared
libraries by default include all symbols (functions and data structures)
for the features a library provides. However, when you static link a
program to a library, only the symbols that are actually referenced are
linked in and included in the program.

#### Library reduction

It is possible to reduce the size of shared libraries, by eliminating
unused symbols.

MontaVista released a tool for library optimization. This tool scans the
entire file system, and can rebuild the shared libraries for the system,
including only the symbols needed for the set of applications in the
indicated file system.

Care needs to be taken with this approach, since it may make it
difficult to use add-on programs or or do in-field upgrades (since
symbols required by the new software may not be present in the optimized
libraries). But for some fixed-function devices, this can reduce your
library footprint dramatically.

See
[http://libraryopt.sourceforge.net/](http://libraryopt.sourceforge.net/)

#### Deferred Library Loading

It is possible to reduce the RAM runtime footprint for a product, by
lazily loading shared libraries, and by breaking up library
dependencies. Panasonic did some research into a process called Deferred
Library Loading, which they presented at ELC 2007.

See the [Deferred Dynamic Loading
(pdf)](http://eLinux.org/images/1/19/DeferredDynamicLoading_20070417.pdf "DeferredDynamicLoading 20070417.pdf")
presentation.

### Execute-in-place

You can save RAM memory by using some text or data directly from flash.

#### Kernel XIP

By executing the kernel in-place from flash, it is possible to save RAM
space.

-   see [Kernel XIP](http://eLinux.org/Kernel_XIP "Kernel XIP")

#### Application XIP

By executing applications in-place from flash, it is possible to save
RAM space.

-   see [Application XIP](http://eLinux.org/Application_XIP "Application XIP")

#### Data Read In Place (DRIP)

This is a technique for keeping data in flash, until it is written to,
and then making a RAM page for it.

-   see [Data Read In Place](http://eLinux.org/Data_Read_In_Place "Data Read In Place")

## Size measurement tools and techniques

### Kernel size measurement data

-   [Bloatwatch](http://www.selenic.com/bloatwatch/) - a kernel size
    regression analysis tool.
    -   Bloatwatch provides a great amount of detail, and the ability to
        compare the size of kernel versions over time.

### How to measure the kernel image size

-   to see the size of the major kernel sections (code and data):

`size vmlinux */built-in.o`

    [tbird@crest ebony]$ size vmlinux */built-in.o
       text    data     bss     dec     hex filename
    2921377  369712  132996 3424085  343f55 vmlinux
     764472   35692   22768  822932   c8e94 drivers/built-in.o
     918344   22364   36824  977532   eea7c fs/built-in.o
      18260    1868    1604   21732    54e4 init/built-in.o
      39960     864     224   41048    a058 ipc/built-in.o
     257292   14656   34516  306464   4ad20 kernel/built-in.o
      34728     156    2280   37164    912c lib/built-in.o
     182312    2704     736  185752   2d598 mm/built-in.o
     620864   20820   26676  668360   a32c8 net/built-in.o
       1912       0       0    1912     778 security/built-in.o
        133       0       0     133      85 usr/built-in.o

-   to see the size of the largest kernel symbols:
    -   `nm --size -r vmlinux`

<!-- -->

    [tbird@crest ebony]$ nm --size -r vmlinux | head -10
    00008000 b read_buffers
    00004000 b __log_buf
    00003100 B ide_hwifs
    000024f8 T jffs2_garbage_collect_pass
    00002418 T journal_commit_transaction
    00002400 b futex_queues
    000021a8 t jedec_probe_chip
    00002000 b write_buf
    00002000 D init_thread_union
    00001e6c t tcp_ack

### How to measure the memory usage at runtime

See [Runtime Memory
Measurement](http://eLinux.org/Runtime_Memory_Measurement "Runtime Memory Measurement")
for a description of ways to measure runtime memory usage in Linux.

Also, see [Accurate Memory
Measurement](http://eLinux.org/Accurate_Memory_Measurement "Accurate Memory Measurement")
for a description of techniques (and patches) which can be used to
measure the runtime memory more accurately.

### Linux size increase from 2.4 to 2.6

Linux increased in size by between 10% and 30% from version 2.4 to 2.6.
This incremental growth in kernel size has been a big concern by forum
members.

Please see the [Szwg Linux
26Data](http://eLinux.org/Szwg_Linux_26Data "Szwg Linux 26Data") page for supporting
data.

-   [Size Tunables](http://eLinux.org/Size_Tunables "Size Tunables")

### GCC Code-Size Benchmarking

CSiBE is a code size benchmark for the GCC compiler. The primary purpose
of CSiBE is to monitor the size of the code generated by GCC. In
addition, compilation time and code performance measurements are also
provided.

[CSiBE](http://www.inf.u-szeged.hu/csibe/)

## Case Studies

"Motorola reduction of system size (presumably for cell phones) using
2.4 Linux"

-   -   MotSizeReduction.ppt - this is a placeholder for this Powerpoint
        as it was too big to upload to the wiki. (why is this even here?
        TRB)

### uClinux

-   Here's an article on uClinux running on cortex-M3s. It has lots of
    good material on the kernel
    -   [http://electronicdesign.com/embedded/practical-advice-running-uclinux-cortex-m3m4](http://electronicdesign.com/embedded/practical-advice-running-uclinux-cortex-m3m4)

### Linux on MicroControllers (M3 in this case)

-   At ELC 2014, Vitaly Wool described running 2.6.33 Linux on a STMicro
    STM32F4XX
    -   Vitaly's presentation: [Spreading the disease: Linux on
        microcontrollers](http://elinux.org/images/c/ca/Spreading.pdf)
    -   Device has 256K RAM and 2M flash
    -   Kernel and apps were XIP

## Reduced-size distribution efforts

Here are some projects aimed at building small-sized systems:

-   micro-Yocto (2014)
    -   Tom Zanussi has lead an effort in the Yocto Project to produce a
        minimal kernel for very small embedded systems
    -   Here's a presentation by Tom at ELC 2014: [microYocto and the
        Internet of
        Tiny](http://elinux.org/images/5/54/Tom.zanussi-elc2014.pdf)
    -   See
        [https://github.com/tzanussi/meta-galileo/raw/daisy/meta-galileo/README](https://github.com/tzanussi/meta-galileo/raw/daisy/meta-galileo/README)
        for more information
-   [http://cgit.openembedded.org/meta-micro/](http://cgit.openembedded.org/meta-micro/)
    -   It's maintained by Phil Blundell. It appears pretty successful
        in reducing size of the resulting image whilst keeping the
        system fairly functional. It uses uClibc
    -   [Meta-tiny git
        repository](http://git.infradead.org/users/dvhart/meta-tiny.git)
-   There is a project called Poky-tiny, to produce an extremely
    stripped-down distribution of embedded Linux using the Yocto
    project.
    -   See
        [https://wiki.yoctoproject.org/wiki/Poky-Tiny](https://wiki.yoctoproject.org/wiki/Poky-Tiny)
    -   Poky-tiny is an effort to build a small-footprint system using
        Yocto, by Darren Hart

<!-- -->

    meta-tiny is my experimental layer where I'm looking at what we can
    build with our existing sources and infrastructure. I've found that we
    can cut the image size to about 10% of core-image-minimal without
    changes to source code, but dropping a lot of functionality. We can get
    to something like 20% while still maintaining ipv4 networking.

-   -   Presentation: [Tuning Linux For Embedded Systems: When Less Is
        More](http://elinux.org/images/2/2b/Elce11_hart.pdf)

## Other Tidbits on System Size

### Memory leak detection for the kernel

Catalin Marinas of ARM has been recently (as of 2.6.17?) been posting a
memory leak detector for the Linux kernel. It may get mainlined in the
future. Here's a link to the LKML discussions around it:
[http://lkml.org/lkml/2006/6/11/39](http://lkml.org/lkml/2006/6/11/39)

### How System Size may affect performance

It has long been theorized that reducing system size could provide a
performance benefit because it could reduce cache misses. There does not
appear to be hard data to support this theory on Linux, but this has
been discussed on the kernel mailing list.

See [this post by Linus
Torvalds](http://groups.google.com/group/linux.kernel/msg/e1f9f579a946333e?hl=en&)

### Stripping down the filesystem of a desktop distribution

Here is a good document with tips on how to strip out unneeded files
from a desktop distribution. The example distribution used here is Linux
From Scratch, but the tips should work with many distributions.

[http://www.linuxfromscratch.org/hints/downloads/files/OLD/stripped-down.txt](http://www.linuxfromscratch.org/hints/downloads/files/OLD/stripped-down.txt)

### Extremely-minimal systems

This section lists various efforts to produce the absolute smallest
system possible.

-   Vitaly Wool describes running 2.6.33 on an ST microcontroler with
    2MB flash and 256K ram
    -   [Linux for Microcontrollers: Spreading the Disease
        (PDF)](http://eLinux.org/images/c/ca/Spreading.pdf "Spreading.pdf") (presented at
        ELC in April 2014)
-   Someone is running an old version of BSD on a small processor with
    only 128K (that's right 'K'!!) of RAM.
    -   [http://olimex.wordpress.com/2012/04/04/unix-on-pic32-meet-retrobsd-for-duinomite/](http://olimex.wordpress.com/2012/04/04/unix-on-pic32-meet-retrobsd-for-duinomite/)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")

