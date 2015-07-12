> From: [eLinux.org](http://eLinux.org/Printk_Times "http://eLinux.org/Printk_Times")


# Printk Times



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 Rationale](#rationale)
-   [2 Downloads](#downloads)
    -   [2.1 Patches](#patches)
    -   [2.2 Utility program](#utility-program)
-   [3 How To Use (2-6 version of
    kernel)](#how-to-use-2-6-version-of-kernel)
    -   [3.1 runtime control of printk
        times](#runtime-control-of-printk-times)
        -   [3.1.1 History](#history)
    -   [3.2 Trouble-shooting](#trouble-shooting)
    -   [3.3 Customizing the printk times
        clock](#customizing-the-printk-times-clock)
-   [4 How To Use (2-4 version of
    kernel)](#how-to-use-2-4-version-of-kernel)
-   [5 Sample Results](#sample-results)
    -   [5.1 show\-delta results](#show-delta-results)
-   [6 Related Work](#related-work)
    -   [6.1 Standardized boot instrumentation
        points](#standardized-boot-instrumentation-points)
    -   [6.2 initcall\-debug](#initcall-debug)

## Introduction

"Printk-times" is a simple technology which adds some code to the
standard kernel printk routine, to output timing data with each message.
While crude, this can be used to get an overview of the areas of kernel
initialization which take a relatively long time. This feature is used
by the Bootup Time Working Group to identify areas of the Linux kernel
requiring work to improve bootup time, and to measure the improvements
of changes made by the working group.

The technology for this feature consists of a patch and a utility
program. The patch alters the printk code in the kernel to emit the
timing data.

**UPDATE:** The patch was incorporated into the mainline kernel as of
version 2.6.11! Both the feature, and the utility program are now part
of mainline Linux!!

With printk-times turned on, the system emits the timing data as a
floating point number of seconds (to microsecond resolution) for the
time at which the printk started. The utility program shows the time
between calls, or it can show the times relative to a specific message.
This makes it easier to see the timing for specific segments of kernel
code.

### Rationale

There are other instrumentation systems for the kernel that have more
advanced features than this. However, this system is very simple and
robust. It does not require extra programs, interfaces in proc of sysfs,
or even a root filesystem, in order to obtain measurements of bootup
time. Its weakness is that you can only see timing information for areas
of the kernel which have printks. In order to get more detail for an
area of interest, you have to add additional printks to the kernel, and
re-compile it. Also, printks themselves may add too much timing overhead
to the kernel, particularly when the output is over a serial line (which
is very common in embedded configurations).

For a system that provides much more detailed timing information, you
may want to use [Kernel Function
Instrumentation](http://eLinux.org/Kernel_Function_Instrumentation "Kernel Function Instrumentation")
instead.

## Downloads

### Patches

-   Patch for x86 for 2.4.20 kernel:
    [instrumented\_printk.patch](http://eLinux.org/images/d/d0/Instrumented_printk.patch "Instrumented printk.patch")
-   Patches (arch-neutral) for 2.6.x kernels are on the [Patch
    Archive](http://eLinux.org/Patch_Archive "Patch Archive") page.
-   Patch for 2.6.11-rc4:
    [printk-times-3.patch](http://eLinux.org/images/e/e6/Printk-times-3.patch "Printk-times-3.patch")

[Image:Alert.gif] - patch is no longer needed. Printk-times was
incorporated into the mainline Linux kernel as of version 2.6.11.

### Utility program

The program `show_delta` reads the information from printk output, and
displays time values as delta's between printks. This helps to more
easily find periods of long time between printks. (This is easier than
"eye-balling" the dump, looking for jumps in the time.)

The `show_delta` is in the `/scripts` directory of the kernel source,
for kernel versions 2.6.12 and above.

## How To Use (2.6 version of kernel)

-   If using a kernel version prior to 2.6.11, apply the appropriate
    patch to your kernel
-   When booting the kernel, add the option "printk.time=1" (or "time"
    for older kernels) on the kernel command line
-   You should see extra data at the beginning of each printk line
-   Examine the data while it is displayed, or after booting use the
    "dmesg" command line.
-   (See the "trouble-shooting" section below if you only see some, not
    all, of the bootup messages)
-   Collect the kernel printk data with `dmesg`
-   save the results to a file, like so: ` dmesg >/tmp/bootup_printks `
-   alternatively, if you are using a serial console, you can capture
    the kernel printk output to the capture buffer of your terminal
    program and save it to a file for use later.

-   (Optionally) To see the time spent between successive printks, use
    the `show_delta` command.
    -   ` scripts/show_delta /tmp/bootup_printks`
-   (Optionally) To avoid the overhead of writing out the kernel
    messages during bootup, try booting the kernel with the "quiet"
    kernel command line option.
-   If you use a serial console, it is possible for the speed of the
    serial connection to interfere with the accuracy of the timing data.
    In this case you may wish to boot the kernel with the "quiet"
    option, which suppresses printk output during boot. When this option
    is used, the kernel messages are not printed during bootup, but are
    still available after booting with the `dmesg` command.

-   (Optionally) If you want to configure the kernel to always boot with
    timing information turned on, and/or you want to see timing
    information for the kernel BEFORE it parses the kernel command line:
    -   Configure your kernel with "Show timing information on printks"
        turned on.
    -   This option is on the the "Kernel hacking" menu of the kernel
        configuration program.
    -   Compile and boot your kernel

### runtime control of printk times

You can enable and disable printk timestamps at runtime, by writing to
/sys/module/printk/parameters/time.

    # cat /sys/module/printk/parameters/time
    N
    # echo 1 >/sys/module/printk/parameters/time
    # cat /sys/module/printk/parameters/time
    Y
    # echo "sample log message" >/dev/kmsg
    # dmesg | tail
    ....
    [3814526.197336] sample log message

#### History

Jan Engelhardt supplied a patch against 2.6.17 which allows for runtime
control of the printk-times control flag. Here is what he wrote:

> Currently, enabling/disabling printk timestamps is only possible
> through reboot (bootparam) or recompile. I normally do not run with
> timestamps (since syslog handles that in a good manner), but for
> measuring small kernel delays (e.g. irq probing - see parport thread)
> I needed subsecond precision, but then again, just for some minutes
> rather than all kernel messages to come. The following patch adds a
> module\_param() with which the timestamps can be en-/disabled in a
> live system through /sys/module/printk/parameters/printk\_time.

The patch was applied in 2.6.18.

### Trouble-shooting

-   Not all kernel messages are displayed by dmesg
    -   The printk-times feature adds a number of bytes at the beginning
        of each printk message. The default kernel message buffer size
        may not be sufficient to hold all the messages with this
        additional overhead. You can increase the kernel message buffer
        size when compiling the kernel, by adjusting the "Kernel Log
        buffer size" (found on the "General Setup" menu). Notethat you
        must also specify a larger buffer read size with "dmesg", with
        the '-s' option.
        -   ex: `dmesg -s 128000 >/tmp/bootup_printks`
-   Resolution of timings is very bad.
    -   Printk-time uses the routine sched\_clock() in the kernel. On
        some platforms, sched\_clock() only has a resolution of 1 jiffy
        (which may be 10 milliseconds or longer). This means that you
        will only see the time increment at this resolution, giving
        imprecise results for printk-times. To correct this problem, the
        best solution is to implement a good sched\_clock() routine for
        your platform. Sched\_clock() returns a 64-bit value which is
        nanoseconds since some event (usually either since machine
        power-on, or since time\_init() was called.) Many embedded
        processors have a clock or timer on the System-On-Chip which can
        provide a good resolution clock source for sched\_clock(). It is
        best if the clock can provide resolution better than 1
        microsecond. Note that this only requires a clock running at 1
        MHz to achieve this resolution.
-   Machine hangs when printk-times is compiled ON.
    -   You may experience a panic, hang-up, or some other problem with
        printk-times turned on. I have seen problems caused by calls to
        sched\_clock() too early in boot sequence. Some platforms don't
        support calling sched\_clock() before memory, interrupts or
        other architecture-specific items are initialized. (The 'i386'
        arch is OK, since it's sched\_clock() by default uses the TSC,
        which does not need any prior setup.) In case you have problems
        on your platform, you may need to adjust the sched\_clock()
        function to return 0 until it is safe to begin operation
        (usually until after time\_init() completes.)

### Customizing the printk times clock

Somewhere between 2.6.11 and 2.6.14, the printk routine was modified to
use printk\_clock() instead of sched\_clock() directly. This means that
you can override printk\_clock() on your platform to use a custom
timestamp source different from the one used by sched\_clock() (Or, you
can avoid calling sched\_clock() until it is ready - say, after
time\_init()).

## How To Use (2.4 version of kernel)

-   Apply the 2.4-based patch to your kernel
-   You MUST set the value for fixed\_cpu\_khz, in the file
    `include/asm-386/timex.h` (in the inline macro
    highres\_timer\_ticks\_to\_timeval) to the correct value for your
    machine.
-   to find out the correct value for this, run your system (without the
    patch or with the option turned off), and 'cat /proc/cpuinfo' Use
    the value from the "cpu MHZ" line, multiplied by 1000 (that is, with
    the decimal point removed.)
-   Configure your kernel with "Configure timing instrumentation in
    printk" turned on.
-   (This should appear at the bottom of the "General Setup menu of the
    kernel configuration program.)
-   Compile and boot your kernel
-   You should see extra data at the beginning of each printk line
-   Collect the kernel printk data with `dmesg` save the results to a
    file, like so: ` dmesg >bootup_printks `
-   alternatively, if you are using a serial console, you can capture
    the kernel printk output to the capture buffer of your terminal
    program and save it to a file for use later.
-   (Optionally) Use show\_delta to display the time spent between
    successive printks
-   (Optionally) Boot with the "quiet" kernel command line option.
-   If you are using a serial console, it is possible that the speed of
    the serial connection will interfere with the accuracy of the timing
    data. In this case you may wish to boot the kernel with the "quiet"
    option, which will suppress printk output during boot. When this
    option is used, the kernel messages are still be available after
    booting with the dmesg command.

## Sample Results

Below is a sample of kernel messages produced by a 2.6.11 kernel, with
"time" specified on the kernel command line. Note that the messages
don't start having the time prefix until the kernel command line is
processed. Then, the timestamps don't have real values until the timer
code in the kernel is initialized. This is fairly typical for non-x86
kernels.

    Linux version 2.6.11 (tbird@timdesk.am.sony.com) (gcc version 3.4.3) #35 Wed Oct 8 12:09:15 PDT 2008
    memsize environment variable not set: assuming 32MB
    splash screen environment variable not set: assuming not enabled
    CPU revision is: 0001906c
    Start xilleon_setup...
    Enable memory access in PCI space for DMA
    Xilleon GPIO4_SEL: 0x00000200
    Xilleon GPIO5_SEL: 0x00000080
    Determined physical RAM map:
     memory: 00080000 @ 00000000 (ROM data)
     memory: 00180000 @ 00080000 (reserved)
     memory: 02000000 @ 00200000 (usable)
    On node 0 totalpages: 8704
      DMA zone: 8704 pages, LIFO batch:2
      Normal zone: 0 pages, LIFO batch:1
      HighMem zone: 0 pages, LIFO batch:1
    Built 1 zonelists
    Kernel command line: root=/dev/nfs nfsroot=192.168.2.1:/nfsroot_gtx rw ip=192.168.2.93 time
    [    0.000000] Primary instruction cache 32kB, physically tagged, 4-way, linesize 16 bytes.
    [    0.000000] Primary data cache 32kB, 4-way, linesize 16 bytes.
    [    0.000000] Synthesized TLB refill handler (20 instructions).
    [    0.000000] Synthesized TLB load handler fastpath (32 instructions).
    [    0.000000] Synthesized TLB store handler fastpath (32 instructions).
    [    0.000000] Synthesized TLB modify handler fastpath (31 instructions).
    [    0.000000] PID hash table entries: 256 (order: 8, 4096 bytes)
    [    0.000000] calculating r4koff... #### mips_hpt_frequency: 246095550
    [    0.000000] 00258d1b(2460955) with HZ(100)
    [    0.000000] CPU frequency 492.19 MHz
    [    0.098499] Using 246.096 MHz high precision timer.
    [    0.128948] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
    [    0.136327] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
    [    0.145717] Memory: 29608k/32768k available (2147k kernel code, 3120k reserved, 400k data, 124k init, 0k highmem)
    [    0. 156719] Calibrating delay loop... 491.52 BogoMIPS (lpj=2457600)
    [    0.384932] Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
    [    0.392079] Checking for 'wait' instruction...  available.
    [    0.399982] NET: Registered protocol family 16
    [    0.406901] SCSI subsystem initialized
    [    0.411487] usbcore: registered new driver usbfs
    [    0.416508] usbcore: registered new driver hub
    [    0.422558] HBIU Device 0000:00:14.0 0 MEM 20000000:27ffffff -> 08000000:0fffffff
    [    0.430497] PCU  Device 0000:00:14.0 3 MEM 1c000000:1fffffff -> 1c000000:1fffffff
    [    0.438416] PCI  Device 0000:00:14.0 2 MEM 19000000:191fffff -> 10000000:101fffff
    [    0.446330] PCI  Device 0000:00:14.2 0 MEM 19200000:19200fff -> 10200000:10200fff
    [    0.454241] PCI  Device 0000:00:14.0 1 I/O 00002000:000020ff -> 00002000:000020ff
    [    0.466247] uirt: Xilleon IR TV Remote Driver [fmt:12-bit Sony nuirt:1 demod=n nscan=3 debug=n]
    [    0.475923] Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
    [    0.484350] ttyS0 at MMIO 0x0 (irq = 100) is a 16550A
    [    0.489832] ttyS1 at MMIO 0x0 (irq = 99) is a 16550A
    [    0.495228] ttyS2 at MMIO 0x0 (irq = 122) is a 16550A
    [    0.500699] ttyS3 at MMIO 0x0 (irq = 127) is a 16550A
    [    0.506385] io scheduler noop registered
    [    0.510541] io scheduler deadline registered
    [    0.516049] loop: loaded (max 8 devices)
    [    0.523834] GMAC_ETH: Init completed-GMAC
    [    0.528498] MUSB Core: Initializing MUSB Driver [npci=1][gadget=no][otg=no][dma=no]
    [    0.536585] Probing direct bus [direct=1]
    [    0.541245] MGC_LinuxInitController: MUSBxDRC at 0xbe001400, IRQ 130
    [    0.547971] MGC_LinuxInitController: Driver instance data at 0x810d2000
    [    0.702474] MGC_O_HDRC_CONFIGDATA register contents: 0xde
    [    0.708164] MGC_HdrcInit: ConfigData=de (UTMI-8, dyn FIFOs, bulk combine, bulk split, HB-ISO Rx, HB-ISO  Tx, SoftConn )
    [    0.719350] MGC_LinuxInitController: End 00: FIFO TxSize=0040/RxSize=0040
    [    0.726504] MGC_LinuxInitController: End 01: Shared FIFO TxSize=0400/RxSize=0400
    [    0.734302] MGC_LinuxInitController: End 02: Shared FIFO TxSize=0400/RxSize=0400
    [    0.742096] MGC_LinuxInitController: End 03: FIFO TxSize=0800/RxSize=0000
    [    0.749247] MGC_LinuxInitController: End 04: FIFO TxSize=0000/RxSize=0800
    [    0.756394] MGC_LinuxInitController: End 05: Shared FIFO TxSize=0100/RxSize=0100
    [    0.764188] MGC_LinuxInitController: End 06: Shared FIFO TxSize=0100/RxSize=0100
    [    0.771985] MGC_LinuxInitController: End 07: Shared FIFO TxSize=0100/RxSize=0100
    [    0.779783] MGC_LinuxInitController: End 08: Shared FIFO TxSize=0100/RxSize=0100
    [    0.787576] MGC_LinuxInitController: End 09: Shared FIFO TxSize=0100/RxSize=0100
    [    0.795386] MGC_LinuxInitController: New bus @0x804d2e80
    [    0.801568] musb-hcd usb0: new USB bus registered, assigned bus number 1
    [    0.809014] hub 1-0:1.0: USB hub found
    [    0.812976] hub 1-0:1.0: 1 port detected
    [    0.916507] ohci_hcd: 2004 Nov 08 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
    [    0.916679] ohci_hcd 0000:00:14.2: OHCI Host Controller
    [    0.922216] ohci_hcd 0000:00:14.2: irq 2, pci mem 0x10200000
    [    0.928346] ohci_hcd 0000:00:14.2: new USB bus registered, assigned bus number 2
    [    0.948236] hub 2-0:1.0: USB hub found
    [    0.952246] hub 2-0:1.0: 2 ports detected
    [    0.975448] USB Universal Host Controller Interface driver v2.2
    [    0.981849] Initializing USB Mass Storage driver...
    [    0.987126] usbcore: registered new driver usb-storage
    [    0.992536] USB Mass Storage support registered.
    [    0.997407] i2c /dev entries driver
    [    1.001451] Misc PCA16 driver minor=62
    [    1.005490] NET: Registered protocol family 2
    [    1.010225] IP: routing cache hash table of 512 buckets, 4Kbytes
    [    1.016822] TCP established hash table entries: 2048 (order: 2, 16384 bytes)
    [    1.024317] TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
    [    1.031076] TCP: Hash tables configured (established 2048 bind 2048)
    [    1.037833] NET: Registered protocol family 1
    [    1.536645] GMAC_ETH: Reset called
    [    1.540426] GMAC_ETH: Half duplex
    [    2.530746] IP-Config: Guessing netmask 255.255.255.0
    [    2.536368] IP-Config: Complete:
    [    2.539580]       device=eth0, addr=192.168.2.93, mask=255.255.255.0, gw=255.255.255.255,
    [    2.548143]      host=192.168.2.93, domain=, nis-domain=(none),
    [    2.554384]      bootserver=255.255.255.255, rootserver=192.168.2.1, rootpath=
    [    2.562567] Looking up port of RPC 100003/2 on 192.168.2.1
    [    2.570535] Looking up port of RPC 100005/1 on 192.168.2.1
    [    2.632542] VFS: Mounted root (nfs filesystem).
    [    2.637464] Freeing unused kernel memory: 124k freed

### show\_delta results

Sample Results for `show_delta`:

-   [Printk Times Sample1](http://eLinux.org/Printk_Times_Sample1 "Printk Times Sample1")
    - basic output from show\_delta with every line relative to the line
    previous
-   [Printk Times Sample2](http://eLinux.org/Printk_Times_Sample2 "Printk Times Sample2")
    - shows output with all lines relative to first line (good for
    getting the total kernel bootup time)
-   [Printk Times Sample3](http://eLinux.org/Printk_Times_Sample3 "Printk Times Sample3")
    - shows output relative to a single line in the middle (good for
    measuring the total time for multi-line items)

* * * * *

Sample Results for dmesg output for 2.6.11-rc4:

-   [Printk Times Sample4](http://eLinux.org/Printk_Times_Sample4 "Printk Times Sample4")
    - showing truncation of dmesg output

## Related Work

### Standardized boot instrumentation points

Here are some ideas for additional work needed on this system:

-   should add printks to key areas of the kernel (e.g. before each
    sub-system init), to establish reference timings for various
    sub-systems
    -   this would be useful to find boot time regressions

### initcall\_debug

A system already exists for finding the amount of time it takes to load
all the individual non-core drivers in the kernel. It is called
initcall\_debug.

See [Initcall\_Debug](http://eLinux.org/Initcall_Debug "Initcall Debug")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Measuring](http://eLinux.org/Category:Measuring "Category:Measuring")
-   [Printk](http://eLinux.org/Category:Printk "Category:Printk")

