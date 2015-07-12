> From: [eLinux.org](http://eLinux.org/Boot_Time "http://eLinux.org/Boot_Time")


# Boot Time



## Contents

-   [1 Introduction](#introduction)
-   [2 Technology/Project Pages](#technology-project-pages)
    -   [2.1 Measuring Boot-up Time](#measuring-boot-up-time)
    -   [2.2 Technologies and Techniques for Reducing Boot
        Time](#technologies-and-techniques-for-reducing-boot-time)
        -   [2.2.1 Bootloader speedups](#bootloader-speedups)
        -   [2.2.2 Kernel speedups](#kernel-speedups)
            -   [2.2.2.1 File System issues](#file-system-issues)
        -   [2.2.3 User-space and application
            speedups](#user-space-and-application-speedups)
        -   [2.2.4 Suspend related
            improvements](#suspend-related-improvements)
        -   [2.2.5 Miscellaneous topics](#miscellaneous-topics)
        -   [2.2.6 Uninvestigated speedups](#uninvestigated-speedups)
-   [3 Articles and Presentations](#articles-and-presentations)
    -   [3.1 Case Studies](#case-studies)
-   [4 Additional Projects/Mailing
    Lists/Resources](#additional-projects-mailing-lists-resources)
    -   [4.1 Replacements for SysV
        'init'](#replacements-for-sysv-init)
        -   [4.1.1 busybox init](#busybox-init)
        -   [4.1.2 upstart](#upstart)
        -   [4.1.3 Android init](#android-init)
        -   [4.1.4 systemd](#systemd)
    -   [4.2 Kexec](#kexec)
    -   [4.3 Splash Screen projects](#splash-screen-projects)
    -   [4.4 Others](#others)
        -   [4.4.1 Apparently obsolete or abandoned
            material](#apparently-obsolete-or-abandoned-material)
-   [5 Companies, individuals or projects working on fast
    booting](#companies-individuals-or-projects-working-on-fast-booting)
-   [6 Boot time check list](#boot-time-check-list)

## Introduction

Boot Time includes topics such as measurement, analysis, human factors,
initialization techniques, and reduction techniques. The time that a
product takes to boot directly impacts the first perception an end user
has of the product. Regardless of how attractive or well designed a
consumer electronic device is, the time required to move the device from
off to an interactive, usable state is critical to obtaining a positive
end user experience. Turning on a device is Use Case \#1.

Booting up a device involves numerous steps and sequences of events. In
order to use consistent terminology, the [Bootup Time Working
Group](../.././dev_portals/Boot_Time/Bootup_Time_Working_Group/Bootup_Time_Working_Group.md "Bootup Time Working Group") of the CE
Linux Forum came up with a list of terms and their widely accepted
definitions for this functionality area. See the following page for
these terms:

-   [Boot-up Time Definition Of
    Terms](../.././dev_portals/Boot_Time/Boot-up_Time_Definition_Of_Terms/Boot-up_Time_Definition_Of_Terms.md "Boot-up Time Definition Of Terms")

## Technology/Project Pages

The following are individual pages with information about various
technologies relevant to improving Boot Time for Linux. Some of these
describe local patches available on this site. Others point to projects
or patches maintained elsewhere.

### Measuring Boot-up Time

-   [Printk Times](../.././dev_portals/Boot_Time/Printk_Times/Printk_Times.md "Printk Times") - simple system for
    showing timing information for each printk.
-   [Kernel Function
    Trace](../.././dev_portals/Boot_Time/Kernel_Function_Trace/Kernel_Function_Trace.md "Kernel Function Trace") - system for
    reporting function timings in the kernel.
-   [Linux Trace Toolkit](../../dbg_portal/kernel_trace_and_profile/Linux_Trace_Toolkit/Linux_Trace_Toolkit.md "Linux Trace Toolkit") -
    system for reporting timing data for certain kernel and process
    events.
-   [Oprofile](http://oprofile.sourceforge.net/news/) - system-wide
    profiler for Linux.
-   [Bootchart](../.././dev_portals/Boot_Time/Bootchart/Bootchart.md "Bootchart") - a tool for performance
    analysis and visualization of the Linux boot process. Resource
    utilization and process information are collected during the
    user-space portion of the boot process and are later rendered in a
    PNG, SVG or EPS encoded chart.
-   [Bootprobe](http://people.redhat.com/berrange/systemtap/bootprobe/)
    - a set of [System Tap](../../dbg_portal/kernel_trace_and_profile/System_Tap/System_Tap.md "System Tap") scripts for
    analyzing system bootup.
-   and, let us not forget: "cat /proc/uptime"
-   [grabserial](../.././dev_portals/Boot_Time/Tims_Fastboot_Tools/Tims_Fastboot_Tools.md#grabserial "Tims Fastboot Tools")
    - a nice utility from Tim Bird to log and timestamp console output
-   [process
    trace](../.././dev_portals/Boot_Time/Tims_Fastboot_Tools/Tims_Fastboot_Tools.md#Tim.27s_quick_and_dirty_process_trace "Tims Fastboot Tools")
    - a simple patch from Tim Bird to log exec, fork and exit system
    calls.
-   [ptx\_ts](http://pengutronix.de/software/ptx_ts/index_en.html) -
    Pengutronix' TimeStamper: A small filter prepending timestamps to
    STDOUT; a bit similar to grabserial but not limited to serial ports
-   [Initcall Debug](../.././dev_portals/Boot_Time/Initcall_Debug/Initcall_Debug.md "Initcall Debug") - a kernel
    command line option to show time taken for initcalls.
-   See also: [Kernel
    Instrumentation](../.././dev_portals/Boot_Time/Kernel_Instrumentation/Kernel_Instrumentation.md "Kernel Instrumentation")
    which lists some known kernel instrumentation tools. These are of
    interest for measuring kernel startup time.

### Technologies and Techniques for Reducing Boot Time

#### Bootloader speedups

-   [Kernel XIP](../.././dev_portals/Boot_Time/Kernel_XIP/Kernel_XIP.md "Kernel XIP") - Allow kernel to be executed
    in-place in ROM or FLASH.
-   [DMA Copy Of Kernel On
    Startup](../.././dev_portals/Boot_Time/DMA_Copy_Of_Kernel_On_Startup/DMA_Copy_Of_Kernel_On_Startup.md "DMA Copy Of Kernel On Startup")
    - Copy kernel from Flash to RAM using DMA
-   [Uncompressed kernel](../.././dev_portals/Boot_Time/Uncompressed_kernel/Uncompressed_kernel.md "Uncompressed kernel") -
    An uncompressed kernel might boot faster
-   [Fast Kernel
    Decompression](../.././dev_portals/Boot_Time/Fast_Kernel_Decompression/Fast_Kernel_Decompression.md "Fast Kernel Decompression")

#### Kernel speedups

-   [Disable Console](../.././dev_portals/Boot_Time/Disable_Console/Disable_Console.md "Disable Console") - Avoid
    overhead of console output during system startup.
-   Disable bug and printk - Avoid the overhead of bug and printk.
    Disadvantage is that you lose a lot of info.
-   [RTC No Sync](../.././dev_portals/Boot_Time/RTC_No_Sync/RTC_No_Sync.md "RTC No Sync") - Avoid delay to
    synchronize system time with RTC clock edge on startup.
-   [Short IDE Delays](../.././dev_portals/Boot_Time/Short_IDE_Delays/Short_IDE_Delays.md "Short IDE Delays") - Reduce
    duration of IDE startup delays (this is effective but possibly
    dangerous).
-   [Hardcode kernel module
    info](../.././dev_portals/Boot_Time/Hardcode_kernel_module_info/Hardcode_kernel_module_info.md "Hardcode kernel module info") -
    Reduce the overhead of loading a module, by hardcoding some
    information used for loading the relocation information
-   [IDE No Probe](../.././dev_portals/Boot_Time/IDE_No_Probe/IDE_No_Probe.md "IDE No Probe") - Force kernel to
    observe the ide\<x\>=noprobe option.
-   [Preset LPJ](../.././dev_portals/Boot_Time/Preset_LPJ/Preset_LPJ.md "Preset LPJ") - Allow the use of a preset
    loops\_per\_jiffy value.
-   [Asynchronous function
    calls](../.././dev_portals/Boot_Time/Asynchronous_function_calls/Asynchronous_function_calls.md "Asynchronous function calls") -
    Allow probing or other functions to proceed in parallel, to overlap
    time-consuming boot-up activities.
    -   [Threaded Device
        Probing](../.././dev_portals/Boot_Time/Threaded_Device_Probing/Threaded_Device_Probing.md "Threaded Device Probing") -
        Allow drivers to probe devices in parallel. (not mainlined, now
        deprecated?)
-   [Reordering of driver
    initialization](../.././dev_portals/Boot_Time/Reordering_of_driver_initialization/Reordering_of_driver_initialization.md "Reordering of driver initialization")
    - Allow driver bus probing to start as soon as possible.
-   [Deferred Initcalls](../.././dev_portals/Boot_Time/Deferred_Initcalls/Deferred_Initcalls.md "Deferred Initcalls") -
    defer non-essential module initialization routines to after primary
    boot
-   NAND ECC improvement - The pre 2.6.28 nand\_ecc.c has room for
    improvement. You can find an improved version in the mtd git at
    [http://git.infradead.org/mtd-2.6.git?a=blob\_plain;f=drivers/mtd/nand/nand\_ecc.c;hb=HEAD](http://git.infradead.org/mtd-2.6.git?a=blob_plain;f=drivers/mtd/nand/nand_ecc.c;hb=HEAD).
    Documentation for this is in
    [http://git.infradead.org/mtd-2.6.git?a=blob\_plain;f=Documentation/mtd/nand\_ecc.txt;hb=HEAD](http://git.infradead.org/mtd-2.6.git?a=blob_plain;f=Documentation/mtd/nand_ecc.txt;hb=HEAD).
    This is only interesting if your system uses software ECC
    correction.
-   Check what kernel memory allocator you use. Slob or slub might be
    better than slab (which is the default in older kernels)
-   If your system does not need it, you can remove SYSFS and even
    PROCFS from the kernel. In one test removing sysfs saved 20 ms.
-   Carefully investigate all kernel configuration options on whether
    they are applicable or not. Even if you select an option that is not
    used in the end, it contributes to the kernel size and therefore to
    the kernel load time (assuming you are not doing kernel XIP). Often
    this will require some trial and measure! E.g. selecting
    CONFIG\_CC\_OPTIMIZE\_FOR\_SIZE (found under general setup) gave in
    one case a boot improvement of 20 ms. Not dramatic, but when
    reducing boot time every penny counts!
-   Moving to a different compiler version might lead to shorter and/or
    faster code. Most often newer compilers produce better code. You
    might also want to play with compiler options to see what works
    best.
-   If you use initramfs in your kernel and a compressed kernel it is
    better to have an uncompressed initramfs image. This is to avoid
    having to uncompress data twice. A patch for this has been submitted
    to LKML. See
    [http://lkml.org/lkml/2008/11/22/112](http://lkml.org/lkml/2008/11/22/112)

##### File System issues

Different file systems have different initialization (mounting) times,
for the same data sets. This is a function of whether meta-data must be
read from storage into RAM or not, and what algorithms are used during
the mount procedure.

-   [Filesystem
    Information](../.././dev_portals/Boot_Time/Filesystem_Information/Filesystem_Information.md "Filesystem Information") - has
    information about boot-up times of various file systems
-   [File Systems](../../dev_portals/File_Systems/File_Systems.md "File Systems") - has information on
    various file systems that are interesting for embedded systems. Also
    includes some improvement suggestions.
-   [Avoid Initramfs](../.././dev_portals/Boot_Time/Avoid_Initramfs/Avoid_Initramfs.md "Avoid Initramfs") - explains on
    why initramfs should be avoided if you want to minimize boot time
-   Split partitions. If mounting a file system takes long, you can
    consider splitting that filesystem in two parts, one with the info
    that is needed during or immediately after boot, and one which can
    be mounted later on.
-   [Ramdisks demasked](../.././dev_portals/Boot_Time/Ramdisks_demasked/Ramdisks_demasked.md "Ramdisks demasked") -
    explains why using a ram disk generally results in a longer boot
    time, not a shorter one.

#### User-space and application speedups

-   [Optimize RC Scripts](../.././dev_portals/Boot_Time/Optimize_RC_Scripts/Optimize_RC_Scripts.md "Optimize RC Scripts") -
    Reduce overhead of running RC scripts
-   [Parallel RC Scripts](../.././dev_portals/Boot_Time/Parallel_RC_Scripts/Parallel_RC_Scripts.md "Parallel RC Scripts") -
    Run RC scripts in parallel instead of sequentially
-   [Application XIP](../.././dev_portals/Boot_Time/Application_XIP/Application_XIP.md "Application XIP") - Allow
    programs and libraries to be executed in-place in ROM or FLASH
-   [Pre Linking](../.././dev_portals/Boot_Time/Pre_Linking/Pre_Linking.md "Pre Linking") - Avoid cost of runtime
    linking on first program load
-   Statically link applications. This avoids the costs of runtime
    linking. Useful if you have only a few applications. In that case it
    could also reduce the size of your image as no dynamic libraries are
    needed
-   GNU\_HASH: \~ 50% speed improvement in dynamic linking
    -   See
        [http://sourceware.org/ml/binutils/2006-06/msg00418.html](http://sourceware.org/ml/binutils/2006-06/msg00418.html)
-   [Application Init
    Optimizations](../.././dev_portals/Boot_Time/Application_Init_Optimizations/Application_Init_Optimizations.md "Application Init Optimizations")
    - Improvements in program load and init time via:
    -   use of mmap vs. read
    -   control over page mapping characteristics.
-   [Include modules in kernel
    image](../.././dev_portals/Boot_Time/Include_modules_in_kernel_image/Include_modules_in_kernel_image.md "Include modules in kernel image")
    - Avoid extra overhead of module loading by adding the modules to
    the kernel image
-   Speed up module loading - Use Alessio Igor Bogani's kernel patches
    to improve module loading time by "[Speed up the symbols' resolution
    process](http://marc.info/?l=linux-embedded&m=130296040620175&w=2%7C)"
    ([Patch
    1](http://marc.info/?l=linux-kernel&m=130296044420203&w=2%7C),
    [Patch
    2](http://marc.info/?l=linux-embedded&m=130296044420197&w=2%7C),
    [Patch
    3](http://marc.info/?l=linux-embedded&m=130296044420200&w=2%7C),
    [Patch
    4](http://marc.info/?l=linux-kernel&m=130296062420328&w=2%7C),
    [Patch
    5](http://marc.info/?l=linux-embedded&m=130445535913197&w=2%7C)).
-   Avoid udev, it takes quite some time to populate the /dev directory.
    In an embedded system it is often known what devices are present and
    in any case you know what drivers are available, so you know what
    device entries might be needed in /dev. These should be created
    statically, not dynamically. mknod is your friend, udev is your
    enemy.
-   If you still like udev and also like fast boot-up's, you might go
    this way: start your system with udev enabled and make kind of a
    backup of the created device nodes. Now, modify your init script
    like this: instead running udev, copy the device nodes that you just
    made a backup of into the device tree. Now, install the
    hotplug-daemon like you always do. That trick avoids the device node
    creation at startup but stills lets your system create device nodes
    later on.
-   If your device has a network connection, preferably use static IP
    addresses. Getting an address from a DHCP server takes additional
    time and has extra overhead associated with it.
-   Moving to a different compiler version might lead to shorter and/or
    faster code. Most often newer compilers produce better code. You
    might also want to play with compiler options to see what works
    best.
-   If possible move from glibc to uClibc. This leads to smaller
    executables and hence to faster load times.
-   library optimiser tool:
    [http://libraryopt.sourceforge.net/](http://libraryopt.sourceforge.net/)

     This will allow you to create an optimised library. As unneeded
    functions are removed this should lead to a performance gain.
    Normally there will be library pages which contain unused code
    (adjacent to code that is used). After optimizing the library this
    does not occur any more, so less pages are needed and hence less
    page loads, so some time can be saved.
-   Function reordering:
    [http://www.celinux.org/elc08\_presentations/DDLink%20FunctionReorder%2008%2004.pdf](http://www.celinux.org/elc08_presentations/DDLink%20FunctionReorder%2008%2004.pdf)

     This is a technique to rearrange the functions within an executable
    so they appear in the order they are needed. This improves the load
    time of the application as all initialization code is grouped into a
    set of pages, instead of being scattered over a number of pages.

#### Suspend related improvements

Another approach to improve boot time is to use a suspend related
mechanism. Two approaches are known.

-   Using the standard hibernate/resume approach. This is what has been
    demonstrated by Chan Ju, Park, from Samsung. See sheet 23 and
    onwards from this
    [PPT](http://eLinux.org/images/9/98/LinuxBootupTimeReduction4DSC.ppt "LinuxBootupTimeReduction4DSC.ppt")
    and section 2.7 of this
    [paper](http://www.kernel.org/doc/ols/2006/ols2006v2-pages-239-248.pdf).

     Issue with this approach is that flash write is much slower than
    flash read, so the actual creation of the hibernate image might take
    quite a while.
-   Implementing snapshot boot. This is done by Hiroki Kaminaga from
    Sony and is described at [snapshot boot for
    ARM](../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/Suspend_To_Disk_For_ARM.md "Suspend To Disk For ARM") and
    [http://elinux.org/upload/3/37/Snapshot-boot-final.pdf](http://elinux.org/upload/3/37/Snapshot-boot-final.pdf)
    This is similar to hibernate and resume, but the hibernate file is
    retained and used upon every boot. Disadvantage is that no writable
    partitions should be mounted at the time of making the snapshot.
    Otherwise inconsistencies will occur if a partition is modified,
    while applications in the hibernate file might have information in
    the snapshot related to the unmodified partition.

#### Miscellaneous topics

[About Compression](../.././dev_portals/Boot_Time/About_Compression/About_Compression.md "About Compression") discusses
the effects of compression on boot time. This can affect both the kernel
boot time as well as user-space startup.

#### Uninvestigated speedups

This section is a holding pen for ideas for improvement that are not
implemented yet but that could result in a boot time gain. Please leave
a note here if you are working on one of these items to avoid duplicate
work.

-   **Prepopulated buffer cache** - As initramfs performs an additional
    copy of the data the idea is to have a prepopulated buffer cache. A
    simplistic scenario would allow dumping the buffer cache when the
    booting is completed and the user applications have initialised.
    This data then could be used in a subsequent boot to initialize the
    buffer cache (of course without copying). A possible approach would
    be to have those data to reside into the kernel image and use them
    directly. Alternately they could be loaded separately.
     Unfortunately my knowledge of the internals in this section is not
    yet good enough to do a trial implementation.
     Caveats:
    -   is it possible to have the buffer cache split into two different
        parts, one which is statically allocated, one which is
        dynamically allocated?
    -   the pages in the prepopulated buffer cache probably cannot be
        discarded, so they should be pinned
    -   apart from the buffer cache data itself also some other
        variables might need restoring
    -   a similar approach could also be used for the cached file data.
-   **Dedicated fs** - currently a lot of abstraction is done in fs to
    make a nice abstraction allowing easy addition of new filesystems
    and creating a unified view of those filesystem. While this is
    pretty neat, the abstraction layers also introduce some overhead. A
    solution could be to create a dedicated fs system, which supports
    only one (or maybe 2) filesystems, and eliminates the abstraction
    overhead. This will give some benefit, but the chance of getting
    this into the mainline is zero.

## Articles and Presentations

-   [Embedded Linux boot time reduction workshop
    materials](http://free-electrons.com/doc/training/boot-time/)
    -   By Free Electrons
    -   Presentation on boot time reduction techniques - Practical labs
        on Atmel SAMA5 hardware.
-   "Boot Time Optimizations" -
    ([Slides](http://elinux.org/images/d/d1/Alexandre_Belloni_boottime_optimizations.pdf)
    |
    [Video](http://free-electrons.com/pub/video/2012/elce/elce-2012-belloni-boot-time-optimizations.webm))
    -   Alexandre Belloni has presented at ELC Europe on Nov 6, 2012
    -   [Main link at
        Free-Electrons](http://free-electrons.com/blog/elce-2012-videos/)
-   "The Right Approach to Boot Time Reduction" -
    ([Slides](http://elinux.org/images/f/f7/RightApproachMinimalBootTimes.pdf)
    | [YouTube Video](http://www.youtube.com/watch?v=ULa4TPy7z0c))
    -   Andrew Murray has presented at ELC Europe on October 28, 2010
        (Free Electrons video
        [here](http://free-electrons.com/pub/video/2010/elce/elce2010-murray-boot-time.webm))
    -   This included a \< 1 second QT cold Linux boot case study for an
        SH7724 with some additional information about 'function
        re-ordering' in user-space
    -   Similar slides with \< 1 second case study for OMAP3530EVM can
        be found
        [here](http://www.slideshare.net/andrewmurraympc/t-iswift-boot)
-   "One Second Linux Boot Demonstration (new version)" ([Youtube video
    by MontaVista](http://www.youtube.com/watch?v=-l_DSZe8_F8))
-   "Tools and Techniques for Reducing Bootup Time"
    ([PPT](http://eLinux.org/images/9/98/Tools-and-technique-for-reducing-bootup-time.ppt "Tools-and-technique-for-reducing-bootup-time.ppt")
    |
    [ODP](http://eLinux.org/images/4/40/Tools-and-technique-for-reducing-bootup-time.odp "Tools-and-technique-for-reducing-bootup-time.odp")
    |
    [PDF](http://eLinux.org/images/d/d2/Tools-and-technique-for-reducing-bootup-time.pdf "Tools-and-technique-for-reducing-bootup-time.pdf")
    |
    [video](http://free-electrons.com/pub/video/2008/elce/elce2008-bird-reducing-bootup-time.ogv))
    -   Tim Bird has presented at ELC Europe, on November 7, 2008, his
        latest collection of tips and tricks for reducing bootup time
    -   [Tims Fastboot
        Tools](../.././dev_portals/Boot_Time/Tims_Fastboot_Tools/Tims_Fastboot_Tools.md "Tims Fastboot Tools") has online
        materials in support of this presentation
-   [Christopher
    Hallinan](http://www.mvista.com/download/author.php?a=37) has done a
    presentation at the MontaVista Vision conference 2008 on the topic
    of reducing boot time. Slides available
    [here](http://www.mvista.com/download/power/Reducing-boot-time-techniques-for-fast-booting.pdf)
-   [Optimizing Linker Load Times](http://lwn.net/Articles/192082/)
    -   (introducing various kinds of bootuptime reduction, prelinking,
        etc.)
-   [Benchmarking boot latency on
    x86](http://www.linuxfordevices.com/c/a/Linux-For-Devices-Articles/Benchmarking-boot-latency-on-x86/)
    -   By Gilad Ben-Yossef, July 2008
    -   A tutorial on using TSC register and the kernel PRINTK\_TIMES
        feature to measure x86 system boot time, including BIOS,
        bootloader, kernel and time to first user program.
-   [Fast Booting of Embedded
    Linux](http://tree.celinuxforum.org/CelfPubWiki/KoreaTechJamboree3?action=AttachFile&do=get&target=The_Fast_Booting_of_Embedded_Linux.pdf)
    -   By HoJoon Park, Electrons and Telecommunications Research
        Institute (ETRI), Korea, Presented at the CELF [3rd Korean
        Technical
        Jamboree](http://tree.celinuxforum.org/CelfPubWiki/KoreaTechJamboree3),
        July 2008
    -   Explains several different reduction techniques used for
        different phases of bootup time
-   Tim Bird's (Sony) survey of boot-up time reduction techniques:
    -   [Methods to Improve Boot-up Time in
        Linux](http://kernel.org/doc/ols/2004/ols2004v1-pages-79-88.pdf)
        - Paper prepared for 2004 Ottawa Linux Symposium
    -   [http://elinux.org/images//8/83/Pdf.gif](http://elinux.org/images//8/83/Pdf.gif)
        [Reducing Startup Time in Embedded Linux
        Systems](http://eLinux.org/images/7/78/ReducingStartupTime_v0.8.pdf "ReducingStartupTime v0.8.pdf")
        [http://elinux.org/images/d/da/Info\_circle.png](http://elinux.org/File:ReducingStartupTime_v0.8.pdf)
        - December 2003 Presentation describing some existing boot-up
        time reduction techniques and strategies.
-   Parallelizing Linux Boot on CE Devices
    -   [PDF of
        Presentation](http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2007Presentations?action=AttachFile&do=view&target=par.pdf)
    -   [Video of
        Presentation](http://free-electrons.com/pub/video/2007/elce/elce-2007-vitaly-wool-parallel-boot.ogg)
-   [Parallelize Applications for Faster Linux
    Boot](http://www.ibm.com/developerworks/linux/library/l-boot-faster/)
    -   Authored by M. Tim Jones for IBM Developer Works
    -   This article shows you options to increase the speed with which
        Linux boots, including two options for parallelizing the
        initialization process. It also shows you how to visualize
        graphically the performance of the boot process.
-   [Android Boot Time
    Optimization](http://www.slideshare.net/kanru/android-boot-time-optimization)
    -   Authored by Kan-Ru Chen, [0xlab](http://0xlab.org/)
    -   This presentation covers Android boot time measurement and
        analysis, the proposed reduction approaches, hibernation-based
        technologies, and potential Android user-space optimizations.
-   Texas Instruments Embedded Processors Wiki provides the procedure to
    optimize Linux/Android boot time:
    -   [Optimize Linux Boot
        Time](http://processors.wiki.ti.com/index.php/Optimize_Linux_Boot_Time)
    -   [Android Boot Time
        Optimization](http://processors.wiki.ti.com/index.php/Android_Boot_Time_Optimization)
-   [Implement Checkpointing for
    Android](http://www.slideshare.net/jserv/implement-checkpointing-for-android-elce2012)
    -   Authored by Kito Cheng and Jim Huang, [0xlab](http://0xlab.org/)
    -   Reasons to Implement Checkpointing for Android
        -   Resume to stored state for faster Android boot time
        -   Better product field trial experience due to regular
            checkpointing

### Case Studies

-   [300 milliseconds from boot loader to shell on ARM with
    NAND](http://www.makelinux.com/emb/fastboot/omap)
-   Samsung proof-of-acceptability study for digital still camera: see
    [Boot Up Time Reduction
    PPT](http://eLinux.org/images/9/98/LinuxBootupTimeReduction4DSC.ppt "LinuxBootupTimeReduction4DSC.ppt")
    and the
    [paper](http://www.kernel.org/doc/ols/2006/ols2006v2-pages-239-248.pdf)
    describing this.
-   [Boot Linux from Processor Reset into user space in less than 1
    Second](https://docs.blackfin.uclinux.org/doku.php?id=fast_boot_example)
    -   In this white paper, Robin Getz describes the techniques used to
        fast-boot a blackfin development board.
-   [Booting Linux dm365 Network Camera in 3.2
    seconds](http://e2e.ti.com/support/embedded/f/354/t/51158.aspx)
-   [Boot of kernel and shell in 0.5 sec (not including u-boot and
    decompression)](http://e2e.ti.com/support/dsp/davinci_digital_media_processors/f/100/p/7616/30088.aspx)

-   [Warp2, Lineo Solutions, 2008. 2.97 sec boot, ARM11,
    400MHz](http://www.linuxfordevices.com/c/a/News/Linux-boots-in-297-seconds/)

## Additional Projects/Mailing Lists/Resources

### Replacements for SysV 'init'

The traditional method of starting a Linux system is to use /sbin/init,
which processes the file /etc/inittab. This is an init program which
processes a series of actions for different run-levels and system events
(key-combinations and power events).

See [the init(8) man page](http://linux.die.net/man/8/init) and the [the
inittab(5) man page](http://linux.die.net/man/5/inittab).

#### busybox init

An 'init' applet is often included in [BusyBox](../.././dev_portals/Boot_Time/BusyBox/BusyBox.md "BusyBox")

There used to be (as of 2000) some slight differences in the supported
features of the 'inittab' file between busybox init and full-blown init.
However, I don't know (as of 2010) if that's still the case. (See
[http://spblinux.de/2.0/doc/init.html](http://spblinux.de/2.0/doc/init.html)
for some details)

Denys Vlasenko, one of the maintainers of busybox has suggested a
replacement for traditional init for that tool called runsv. See
[http://busybox.net/\~vda/init\_vs\_runsv.html](http://busybox.net/~vda/init_vs_runsv.html)

#### upstart

upstart is the name of a newer Linux desktop systems that provides the
program /sbin/init, but with different operational semantics.

-   Home page: [http://upstart.ubuntu.com/](http://upstart.ubuntu.com/)
-   Wikipedia page:
    [http://en.wikipedia.org/wiki/Upstart](http://en.wikipedia.org/wiki/Upstart)

#### Android init

Android 'init' is a custom program for booting the Android system.

See [Android 'init'](http://eLinux.org/Android_Booting#.27init.27 "Android Booting")

#### systemd

systemd is a new project (as of May 2010) for starting daemons and
services on a Linux desktop system

See
[http://0pointer.de/blog/projects/systemd.html](http://0pointer.de/blog/projects/systemd.html)

### Kexec

-   Kexec is a system which allows a system to be **rebooted** without
    going through BIOS. That is, a Linux kernel can directly boot into
    another Linux kernel, without going through firmware. See the white
    paper at:
    [kexec.pdf](http://developer.osdl.org/andyp/kexec/whitepaper/kexec.pdf)
    -   2004 Kernel Summit presentation:
        [fastboot.pdf](http://www.xenotime.net/linux/fastboot/fastboot-ks-2004.pdf)
    -   here's another Kexec white paper:[Reboot
        Fast](http://www-106.ibm.com/developerworks/linux/library/l-kexec.html?ca=dgr-lnxw04)

### Splash Screen projects

-   [Splashy](http://splashy.alioth.debian.org/wiki/) - Technology to
    put up a splash screen early in the boot sequence. This is
    user-space code.
    -   This seems to be the most current splash screen technology, for
        major distributions. A framebuffer driver for the kernel is
        required.
-   [Gentoo
    Splashscreen](http://dev.gentoo.org/~spock/projects/gensplash/) -
    newer technology to put a splash screen early in the boot sequence
    -   See the HOWTO at: [HOWTO
        FBSplash](http://gentoo-wiki.com/HOWTO_fbsplash)
-   [PSplash](http://butterfeet.org/?p=8) - PSplash is a userspace
    graphical boot splash screen for mainly embedded Linux devices
    supporting a 16bpp or 32bpp framebuffer.
-   [bootsplash.org](http://www.bootsplash.org/) - put up a splash
    screen early in boot sequence
    -   This project requires kernel patches
    -   This project is now abandoned, and work is being done on
        Splashy.

### Others

-   [FSMLabs
    Fastboot](http://www.linuxdevices.com/news/NS5907201615.html) -
    press release by FSMLabs about fast booting of their product. Is any
    of this published?

-   [snapshot boot](http://tree.celinuxforum.org/CelfPubWiki/) - a
    technology uses software resume to boot up the system quickly.

#### Apparently obsolete or abandoned material

-   [![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif) *in
    progress* - [Boot-up Time Reduction
    Howto](../.././dev_portals/Boot_Time/Boot-up_Time_Reduction_Howto/Boot-up_Time_Reduction_Howto.md "Boot-up Time Reduction Howto")
    - this is a project to catalog existing boot-up time reduction
    techniques.
    -   Was originally intended to be the authoritative source for
        bootup time reduction information.
    -   No one maintains it any more (as of Aug, 2008)
-   [![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif)*no content
    yet* - [Boot-up Time Delay
    Taxonomy](../.././dev_portals/Boot_Time/Boot-up_Time_Delay_Taxonomy/Boot-up_Time_Delay_Taxonomy.md "Boot-up Time Delay Taxonomy")
    - list of delays categorized by boot phase, type and magnitude
    -   Was to be a survey of common bootup delays found in embedded
        devices.
    -   Was never really written.

???

-   [Bootup Time Spec](../.././dev_portals/Boot_Time/Bootup_Time_Spec/Bootup_Time_Spec.md "Bootup Time Spec")
-   [Bootup Time Things To
    Investigate](../.././dev_portals/Boot_Time/Bootup_Time_Things_To_Investigate/Bootup_Time_Things_To_Investigate.md "Bootup Time Things To Investigate")
-   [Bootup Time Working
    Group](../.././dev_portals/Boot_Time/Bootup_Time_Working_Group/Bootup_Time_Working_Group.md "Bootup Time Working Group")
-   [Bootup Time Task
    List](../.././dev_portals/Boot_Time/Bootup_Time_Task_List/Bootup_Time_Task_List.md "Bootup Time Task List")
-   [Bootup Time Howto Task
    List](../.././dev_portals/Boot_Time/Bootup_Time_Howto_Task_List/Bootup_Time_Howto_Task_List.md "Bootup Time Howto Task List")
-   [Fast Booting
    Translation](../.././dev_portals/Boot_Time/Fast_Booting_Translation/Fast_Booting_Translation.md "Fast Booting Translation")

## Companies, individuals or projects working on fast booting

-   Intel - Arjan van de Ven - see
    [http://lwn.net/Articles/299483/](http://lwn.net/Articles/299483/)
-   Tripeaks - see
    [http://www.linuxdevices.com/news/NS8282586707.html](http://www.linuxdevices.com/news/NS8282586707.html)
-   Lineo Solutions - see
    [http://www.linuxdevices.com/news/NS5185504436.html](http://www.linuxdevices.com/news/NS5185504436.html)
-   Monta Vista - see
    [http://www.linuxdevices.com/news/NS2560585344.html](http://www.linuxdevices.com/news/NS2560585344.html)
-   fastboot git tree - see
    [http://lwn.net/Articles/299591/](http://lwn.net/Articles/299591/)
-   MPC Data SwiftBoot services -
    [http://www.swiftboot.com/](http://www.swiftboot.com/)
-   Free Electrons -
    [http://free-electrons.com/services/boot-time/](http://free-electrons.com/services/boot-time/)

## Boot time check list

From an [August 2009 discussion about boot time on ARM
devices](http://www.mail-archive.com/linux-embedded@vger.kernel.org/msg02139.html),
several hints and advice regarding boot time optimization are available.
While it may repeat a lot of above, below is a check list extracted from
this discussion:

-   Is CPU's clock switched to maximum? If the kernel, bootloader or
    hardware is in charge of setting CPU power and speed scaling, then
    you should check that it boots with the CPU set at maximum speed
    instead of slowest.

-   Is your hardware (register) timing configuration of your SoC's
    memory interfaces (e.g. RAM and NOR/NAND timing) optimized? A lot of
    vendors ship their hardware with "well, it works, optimize later"
    settings. What you want is "as fast as possible, but sill stable and
    reliable" configuration. This might need some hardware knowledge and
    has to be customized to the individual memory devices used.

-   Does your boot loader uses I- and D-Cache? E.g. U-Boot doesn't
    enable D-Cache by default on ARM devices, as it needs customized MMU
    tables to do so.

-   Does kernel copy from permanent storage (e.g. NOR or NAND) to RAM
    use optimized functions? E.g. DMA, or on ARM at least load/store
    multiple commands (ldm/stm)?

-   If you use U-Boot's uImage, set "verify=no" in U-Boot to avoid
    checksum verification.

-   Optimize size of your kernel.
    -   You might even try some of the embedded system kernel config
        options that, for example, eliminate all the printk strings,
        reduce data structures, or eliminate unneeded functionality.

-   How often is kernel (image) data copied? First by boot loader from
    storage to RAM, then by kernel's uncompressor to it's final
    destination? Once more? If you use compressed kernel and NOR flash,
    consider running the uncompressor XIP in NOR flash.

-   If you use compressed kernel, check compression algorithm. zlib is
    slow on decompression, and lzo is much faster. So if you implement
    lzo compression, you'll probably speed things up a little as well
    (check LKML for this). Having no compression at all may also be a
    good thing to try (see next topic).

-   Check to use uncompressed kernel (depends on your system
    configuration). Using an uncompressed kernel on a flash-based system
    may improve boot time. The reason is that compressed kernels are
    faster only when the throughput to the persistent storage is lower
    than the decompression throughput, and on typical embedded systems
    with DMA the throughput to memory outperforms the CPU-based
    decompression. Of course it depends on a lot of stuff like
    performance of flash controller, kernel storage filesystem
    performance, DMA controller performance, cache architecture etc. So
    it's individual per-system. Example: With using an uncompressed
    kernel (\~2.8MB) uncompressing (running the uncompressor XIP in NOR
    flash) took \~0.5s longer than copying 2.8MB from flash to RAM.

-   Enable precalculated loops-per-jiffy

-   Enable kernel quiet option

-   If you use UBI: UBI is rather slow in attaching MTD devices.
    Everything is explained at MTD's [UBI
    scalability](http://www.linux-mtd.infradead.org/doc/ubi.html#L_scalability)
    and [UBI fs
    scalability](http://www.linux-mtd.infradead.org/doc/ubifs.html#L_scalability)
    sections. There is not very much you can do to speed it up but
    implement UBI2. UBIFS would stay intact. There were discussions
    about this and it does not seem to be impossibly difficult to do
    UBI2 ([few
    ideas](http://www.linux-mtd.infradead.org/faq/ubi.html#L_attach_faster)).
    -   In a follow-up e-mail, Sascha Hauer wrote:

> "What's interesting about this is that the kernel NAND driver is much
> slower
>
> than the one in U-Boot. Looking at it it turned out that the kernel
> driver uses interrupts to wait for the controller to get ready.
> Switching this to polling nearly doubles the NAND performance. UBI
> mounts much faster now and this cuts off another few seconds from the
> boot process  :) "

-   Use static device nodes during boot, and later setup busybox mdev
    for hotplug.

-   If you have network enabled, there might be some very long timeouts
    in the network code paths, which appear to be used whether you
    specify a static address or not. See the definitions of
    CONF\_PRE\_OPEN and CON\_POST\_OPEN in *net/ipv4/ipconfig.c*. Check
    [ipdelay configuration
    patch](http://patchwork.kernel.org/patch/31678/).

-   Parallelize boot process.

-   Disable the option "Set system time from RTC on startup and resume",
    you can use the command hwclock -s at the of the init instead of
    slowing down the kernel.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Bootloader](http://eLinux.org/Category:Bootloader "Category:Bootloader")
-   [CE Linux Working
    Groups](http://eLinux.org/Category:CE_Linux_Working_Groups "Category:CE Linux Working Groups")

