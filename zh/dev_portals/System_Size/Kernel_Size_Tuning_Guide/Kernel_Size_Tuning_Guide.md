> From: [eLinux.org](http://eLinux.org/Kernel_Size_Tuning_Guide "http://eLinux.org/Kernel_Size_Tuning_Guide")


# Kernel Size Tuning Guide



This document describes how to configure the Linux kernel to use a small
amount of memory and flash.

[![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif) *Note: This
document is a work in progress. Please feel free to add material
anywhere you have additional information or data. Sections of this
document which need additional work are denoted with [FIXTHIS] markers.*

## Contents

-   [1 Introduction](#introduction)
-   [2 Measuring the kernel](#measuring-the-kernel)
    -   [2.1 Measuring the kernel image
        size](#measuring-the-kernel-image-size)
    -   [2.2 Measuring the kernel text, data and bss
        segments](#measuring-the-kernel-text-data-and-bss-segments)
    -   [2.3 Measuring and comparing sub-parts of the
        kernel](#measuring-and-comparing-sub-parts-of-the-kernel)
        -   [2.3.1 Measuring major kernel
            subsystems](#measuring-major-kernel-subsystems)
        -   [2.3.2 Measuring individual kernel
            symbols](#measuring-individual-kernel-symbols)
        -   [2.3.3 Comparing kernel symbols between two kernel
            images](#comparing-kernel-symbols-between-two-kernel-images)
-   [3 Kernel Size Tuning features](#kernel-size-tuning-features)
    -   [3.1 Linux-tiny patches](#linux-tiny-patches)
    -   [3.2 How to configure the kernel](#how-to-configure-the-kernel)
    -   [3.3 Kernel Configuration
        Options](#kernel-configuration-options)
    -   [3.4 Special Instructions for some kernel
        options](#special-instructions-for-some-kernel-options)
        -   [3.4.1 How to use CONFIG\-PRINTK](#how-to-use-config-printk)
    -   [3.5 Booting without SysFS](#booting-without-sysfs)
    -   [3.6 Booting without /proc fs](#booting-without-proc-fs)
    -   [3.7 Using kernel memory measurement
        features](#using-kernel-memory-measurement-features)
        -   [3.7.1 Kmalloc Accounting](#kmalloc-accounting)
        -   [3.7.2 Bootmem Auditing](#bootmem-auditing)
        -   [3.7.3 Counting Inlines](#counting-inlines)
-   [4 Outline](#outline)
-   [5 References](#references)
-   [6 Appendices](#appendices)
    -   [6.1 Appendix A - Sample minimum configuration for
        ARM](#appendix-a-sample-minimum-configuration-for-arm)
    -   [6.2 Appendix B - Configuration Option
        Details](#appendix-b-configuration-option-details)
    -   [6.3 Appendix C - Things to
        research](#appendix-c-things-to-research)

## Introduction

One big problem area when using Linux in an embedded project is the size
of the Linux kernel.

## Measuring the kernel

There are 3 aspects of kernel size which are important:

the size of the kernel image stored in flash (or other persistent
storage)

the static size of kernel image in RAM (usually, this will be the size
of the uncompressed image)

-   This includes the text, data, and BSS segments of the kernel at the
    time it is loaded. The text and BSS segments will stay the same size
    for the kernel throughout it execution. However, the data and stack
    segments may grow according to the needs of the system.

the amount of dynamic RAM used by the kernel.

-   This will fluctuate during system execution. However, there is a
    baseline amount of memory which is allocated at system startup.
    Application-specific RAM can be calculated to be above this minimal
    amount of required RAM.

For now, this document ignores Execute-In-Place (XIP) and
Data-Read-In-Place (DRIP) techniques, the use of which have an impact on
the amount of flash and RAM used by the kernel. See the following online
resources for more information about these techniques: [Kernel
XIP](../../.././dev_portals/Boot_Time/Kernel_XIP/Kernel_XIP.md "Kernel XIP") and [Data Read In
Place](../../.././dev_portals/System_Size/Data_Read_In_Place/Data_Read_In_Place.md "Data Read In Place")

#### Measuring the kernel image size

The compressed kernel image is what is stored in the flash or ROM of the
target device. The size of this image can be obtained by examining the
size of the image file in the host filesystem with the '`ls -l`'
command:

-   for example: '`ls -l vmlinuz`' or '`ls -l bzImage`' (or whatever the
    compressed image name is for your platform.)

#### Measuring the kernel text, data and bss segments

Use the `size` command to determine the size of the text, data, and BSS
segments of a kernel image.

**Note** that the BSS segment is not stored in the kernel image because
it can be synthesized at boot time by filling a block of memory with
zeros. Note also that portions of the kernel text and data are set aside
in special initialization segments, which are discarded when the kernel
finishes booting. Because of these factors, the size command does not
give you an exactly correct value for the static kernel RAM size.
However, it can be used as a reasonable estimate.

To use the size command, run it with the filename of the uncompressed
kernel image (which is usually `vmlinux`).

-   for example: '`size vmlinux`'

Example output:

       text    data     bss     dec     hex filename
    2921377  369712  132996 3424085  343f55 vmlinux

#### Measuring and comparing sub-parts of the kernel

In order to find areas where the kernel size can be reduced, it is often
useful to break down the static size of the kernel by sub-system or by
kernel symbol. The following sections describe how to see the size of
each kernel sub-system, how to see the size of individual kernel
symbols, and how to compare the size of symbols between two kernel
versions. This is useful because as you make changes to the kernel
configuration you can determine what part of the kernel is affected by
the change. From this information you may be able to predict what the
affect of the change will be, and decide whether the change is
acceptable.

##### Measuring major kernel subsystems

The major sub-systems of the kernel are put into library object files
named `built-in.o` in the corresponding sub-directory for that
sub-system within the kernel build directory. The major sub-directories,
at the time of this writing (for kernel 2.6.17) are:
`init, user, kernel, mm, fs, ipc, security, crypto, block, ltt, drivers, sound, net, lib`

To see the size of the major kernel sections (code, data, and BSS), use
the `size` command, with a wildcard for the first level of
sub-directory:

-   `size */built-in.o`

You can pipe this output through `sort` to sort by the largest
libraries:

-   `size */built-in.o | sort -n -r -k 4`

Example output:

     731596   53144   33588  818328   c7c98 drivers/built-in.o
     687960   24972    2648  715580   aeb3c fs/built-in.o
     547844   19508   28052  595404   915cc net/built-in.o
     184072    6256   32440  222768   36630 kernel/built-in.o
     141956    3300    2852  148108   2428c mm/built-in.o
      68048    1804    1096   70948   11524 block/built-in.o
      26216     768       0   26984    6968 crypto/built-in.o
      17744    2412    2124   22280    5708 init/built-in.o
      20780     292     124   21196    52cc ipc/built-in.o
      18768      68       0   18836    4994 lib/built-in.o
       2116       0       0    2116     844 security/built-in.o
        134       0       0     134      86 usr/built-in.o
       text    data     bss     dec     hex filename

To see even greater detail, you can examine the size of `built-in.o`
files even deeper in the kernel build hierarchy, using the `find`
command:

-   `find . -name "built-in.o" | xargs size | sort -n -r -k 4 `

Example output:

     731596   53144   33588  818328   c7c98 ./drivers/built-in.o
     687960   24972    2648  715580   aeb3c ./fs/built-in.o
     547844   19508   28052  595404   915cc ./net/built-in.o
     260019    9824    4944  274787   43163 ./net/ipv4/built-in.o
     184072    6256   32440  222768   36630 ./kernel/built-in.o
    ...

<table>
<tbody>
<tr class="odd">
<td align="left"><a href="http://elinux.org/File:Alert.gif"><img src="http://elinux.org/images/e/e7/Alert.gif" alt="Alert.gif" /></a> <strong>Note: Please be careful interpreting the results from the size of the <code>built-in.o</code> files in sub-directories. In general, the object files are aggregated into the libraries of parent directories, meaning that many object files will have their size counted twice. You cannot simply add the columns for an indication of the total kernel size</strong></td>
</tr>
</tbody>
</table>

##### Measuring individual kernel symbols

You can measure the size of individual kernel symbols using the 'nm'
command. Using the `nm --size -r vmlinux`

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

Legend: The columns of this output are:

1.  size in bytes (in hexadecimal)
2.  symbol type
3.  symbol name.

The symbol type is usually one of:

-   'b' or 'B' for a symbol in the BSS segment (uninitialized data),
-   't' or 'T' for a symbol in the text segment (code), or
-   'd' or 'D' for a symbol in the data segment.

Use '`man nm`' for additional information on the '`nm`' command.

##### Comparing kernel symbols between two kernel images

Use the bloat-o-meter command, found in the kernel source `scripts`
directory, to compare the symbol sizes between two kernel images.

-   *\<kernel-src\>*`/scripts/bloat-o-meter vmlinux.default vmlinux.altconfig`

If you get an error: 'chmod a+x \<kernel-src\>/scripts/bloat-o-meter'

Example output, comparing a baseline kernel to one configured with
CONFIG\_PRINTK=n:

    [] $ ../../linux/scripts/bloat-o-meter vmlinux.baseline vmlinux.no-printk
    add/remove: 5/23 grow/shrink: 8/1541 up/down: 1141/-199824 (-198683)
    function                                     old     new   delta
    proc_ioctl_default                             -     610    +610
    proc_reapurb                                   -     296    +296
    proc_disconnectsignal                          -      88     +88
    proc_releaseinterface                          -      72     +72
    proc_claiminterface                            -      36     +36
    xprt_adjust_cwnd                             169     182     +13
    do_timer                                    1052    1063     +11
    i8042_controller_reset                        78      84      +6
    serio_init                                   167     172      +5
    usb_exit                                      80      81      +1
    early_uart_console_init                       45      46      +1
    console_unblank                              103     104      +1
    console_conditional_schedule                  21      22      +1
    parse_early_param                            102     101      -1
    machine_emergency_restart                    249     248      -1
    console_callback                             239     238      -1
    arch_align_stack                              45      44      -1
    quirk_p64h2_1k_io                            183     181      -2
    printk_time                                    4       -      -4
    printk_cpu                                     4       -      -4
    oops_timestamp.7                               4       -      -4
    neigh_resolve_output                         733     729      -4
    msg_level.4                                    4       -      -4
    ...
    de_dump_status                             1586     313    -1273
    decode_getfattr                             3156    1748   -1408
    ext3_fill_super                             5980    4545   -1435
    usbdev_ioctl                                6476    4846   -1630
    usb_get_configuration                       4001    1878   -2123
    proc_submiturb                              2294       -   -2294
    __log_buf                                 131072       - -131072

## Kernel Size Tuning features

The Linux kernel includes a number of options for to control the
features and options it supports. The kernel, over time, has accumulated
a large set of features and capabilities. But many features are not
needed in Consumer Electronics products. By carefully tuning the kernel
options, you can omit many parts of the kernel and save memory in your
product.

#### Linux-tiny patches

The Linux-tiny patch set is a set of patches maintained by Matt Mackall
developed with the intent to help a developer reduce the size of the
Linux kernel.

These patches are described at: [Linux Tiny](../../.././dev_portals/System_Size/Linux_Tiny/Linux_Tiny.md "Linux Tiny")

The Linux-tiny patch set includes a number of different patches to allow
the kernel to be reduced in size. Sometimes, the size reductions are
accomplished by reducing the number of objects for a particular features
(like the number of possible swap areas, or the number of tty discipline
structures). Sometimes, the size reductions are achieved by removing
features or functions from the kernel.

Here is a list of the individual Linux-tiny patches that are available
for the 2.6.22 kernel at [Linux Tiny Patch
Details](../../.././dev_portals/System_Size/Linux_Tiny/Linux_Tiny.md_Patch_Details "Linux Tiny Patch Details")



Please note that the last patch in this list ("do-printk") is available
separately from the main Linux-tiny patch set. Please find this patch
at: [Do Printk](http://eLinux.org/Do_Printk "Do Printk")

The patches listed in this table represent patches that can be applied
to a 2.6.16 Linux kernel. However, as of version 2.6.16, many options
for reducing the kernel were already available in Linux. A list of
options, both from these patches and from existing code, which are
interesting for tuning the kernel size is provided in the section:
"Kernel configuration Options"

#### How to configure the kernel

[FIXTHIS - need detailed kernel configuration instructions]

-   use 'make menuconfig'
-   perform thorough testing of your library and applications with the
    smaller config
-   development vs. deployment configurations
-   describe all\_no config - most times it won't boot.

#### Kernel Configuration Options

Here is a table of kernel configuration options, including a
description, the default value for a kernel, and the recommended value
for a smaller configuration of the kernel:



<table>
<thead>
<tr class="header">
<th align="left"><strong>CONFIG option</strong></th>
<th align="left"><strong>Description</strong></th>
<th align="left"><strong>Default</strong></th>
<th align="left"><strong>Small</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">CONFIG_CORE_SMALL</td>
<td align="left">tune some kernel data sizes</td>
<td align="left">N</td>
<td align="left">Y</td>
</tr>
<tr class="even">
<td align="left">CONFIG_NET_SMALL</td>
<td align="left">tune some net-related data sizes</td>
<td align="left">N</td>
<td align="left">Y</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_KMALLOC_ACCOUNTING</td>
<td align="left">turn on kmalloc accounting</td>
<td align="left">N</td>
<td align="left">Y *</td>
</tr>
<tr class="even">
<td align="left">CONFIG_AUDIT_BOOTMEM</td>
<td align="left">print out all bootmem allocations</td>
<td align="left">N</td>
<td align="left">Y *</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_DEPRECATE_INLINES</td>
<td align="left">cause compiler to emit info about inlines</td>
<td align="left">N</td>
<td align="left">Y *</td>
</tr>
<tr class="even">
<td align="left">CONFIG_PRINTK</td>
<td align="left">allow disable of printk code and message data</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_BUG</td>
<td align="left">allow elimination of BUG (and BUG_ON??) code</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="even">
<td align="left">CONFIG_ELF_CORE</td>
<td align="left">allow disabling of ELF core dumps</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_PROC_KCORE</td>
<td align="left">allow disabling of /proc/kcore</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="even">
<td align="left">CONFIG_AIO</td>
<td align="left">allow disabling of async IO syscalls</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_XATTR</td>
<td align="left">allow disabling of xattr syscalls</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="even">
<td align="left">CONFIG_FILE_LOCKING</td>
<td align="left">allow disabling of file locking syscalls</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_DIRECTIO</td>
<td align="left">allow disabling of direct IO support</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="even">
<td align="left">CONFIG_MAX_SWAPFILES_SHIFT</td>
<td align="left">number of swapfiles</td>
<td align="left">5</td>
<td align="left">0</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_NR_LDISCS</td>
<td align="left">number of tty line disciplines</td>
<td align="left">16</td>
<td align="left">2</td>
</tr>
<tr class="even">
<td align="left">CONFIG_MAX_USER_RT_PRIO</td>
<td align="left">number of RT priority levels (schedule slots)</td>
<td align="left">100</td>
<td align="left">5</td>
</tr>
<tr class="odd">
<td align="left">Other config options</td>
<td align="left">These are not in Linux-tiny, but help with size</td>
<td align="left">default</td>
<td align="left">small</td>
</tr>
<tr class="even">
<td align="left">CONFIG_KALLSYMS</td>
<td align="left">load all symbols for debugging/kksymoops</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_SHMEM</td>
<td align="left">allow disabling of shmem filesystem</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
<tr class="even">
<td align="left">CONFIG_SWAP</td>
<td align="left">allow disabling of support for a swap segment (virtual memory)</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_SYSV_IPC</td>
<td align="left">allow disabling of support for System V IPC</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
<tr class="even">
<td align="left">CONFIG_POSIX_MQUEUE</td>
<td align="left">allow disabling of POSIX message queue support</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_SYSCTL</td>
<td align="left">allow disabling of sysctl support</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
<tr class="even">
<td align="left">CONFIG_LOG_BUF_SHIFT</td>
<td align="left">control size of kernel printk buffer</td>
<td align="left">14</td>
<td align="left">11</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_UID16</td>
<td align="left">allow support for 16-bit uids</td>
<td align="left">Y</td>
<td align="left">??</td>
</tr>
<tr class="even">
<td align="left">CONFIG_CC_OPTIMIZE_FOR_SIZE</td>
<td align="left">Use gcc -os to optimize for size</td>
<td align="left">Y</td>
<td align="left">Y</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_MODULES</td>
<td align="left">allow support for kernel loadable modules</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
<tr class="even">
<td align="left">CONFIG_KMOD</td>
<td align="left">allow support for automatic kernel module loading</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_PCI</td>
<td align="left">allow support for PCI bus and devices</td>
<td align="left">Y</td>
<td align="left">Y -</td>
</tr>
<tr class="even">
<td align="left">CONFIG_XIP_KERNEL</td>
<td align="left">allow support for kernel Execute-in-Place</td>
<td align="left">N</td>
<td align="left">N</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_MAX_RESERVE_AREA</td>
<td align="left">??</td>
<td align="left">??</td>
<td align="left">??</td>
</tr>
<tr class="even">
<td align="left">CONFIG_BLK_DEV_LOOP</td>
<td align="left">support for loopback block device</td>
<td align="left">Y</td>
<td align="left">Y -</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_BLK_DEV_RAM</td>
<td align="left">support for block devices for RAM filesystems</td>
<td align="left">Y</td>
<td align="left">Y -</td>
</tr>
<tr class="even">
<td align="left">CONFIG_BLK_DEV_RAM_COUNT</td>
<td align="left">Number of block devices for RAM filesystems</td>
<td align="left">16</td>
<td align="left">2?</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_BLK_DEV_RAM_SIZE</td>
<td align="left">Size of block device struct for RAM filesystems</td>
<td align="left">4096</td>
<td align="left">??</td>
</tr>
<tr class="even">
<td align="left">CONFIG_IOSCHED_AS</td>
<td align="left">Include Anticipatory IO scheduler</td>
<td align="left">Y</td>
<td align="left">Y</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_IOSCHED_DEADLINE</td>
<td align="left">Include Deadline IO scheduler</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
<tr class="even">
<td align="left">CONFIG_IOSCHED_CFQ</td>
<td align="left">Include CFQ IO scheduler</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_IP_PNP</td>
<td align="left">support for IP autoconfiguration</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
<tr class="even">
<td align="left">CONFIG_IP_PNP_DHCP</td>
<td align="left">support for IP autoconfiguration via DHCP</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_IDE</td>
<td align="left">support for IDE devices</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
<tr class="even">
<td align="left">CONFIG_SCSI</td>
<td align="left">support for SCSI devices</td>
<td align="left">Y</td>
<td align="left">N +</td>
</tr>
</tbody>
</table>


 Legend:

-   "Y \*" - Set to 'Y' for measurement during development, and set to
    'N' for deployment.
-   "N +" - Whether you can set this to 'N' depends on whether this
    feaure is needed by your applications.
-   "Y -" - You probably need this, but it might we worth checking to
    see if you don't.

#### Special Instructions for some kernel options

##### How to use CONFIG\_PRINTK

If the "do-printk" patch is applied, there are two options which control
the compilation of printk elements in the kernel: CONFIG\_PRINTK\_FUNC
and CONFIG\_PRINTK. You can use these options to control how much printk
support the kernel provides, and to control on a global basis whether
any printk messages at all are compiled into the kernel. Another special
preprocessor variable is also available, called DO\_PRINTK, which
provides the ability to enable printk messages inside a single C
compilation unit, even if printk messages are disabled globally.

This section explains how to use these features to reduce the kernel
size, while still enabling sufficient printk messages to be useful
during development and deployment.

The CONFIG\_PRINTK option disables all of the kernel printk calls. By
setting this option to 'N' in your kernel configuration, all uses of
"printk" throughout the kernel source are turned into empty statements,
and omitted when the program is compiled. This provides a substantial
size savings, since the kernel messages often account for more than 100
kilobytes of space in the kernel image. Setting this option to 'N' will
not, however, remove the actual

    printk

code itself (just the calls to

    printk

). The CONFIG\_PRINTK\_FUNC option controls whether the

    printk

function and various helper functions are compiled into the Linux
kernel. When this is set to 'N', CONFIG\_PRINTK is automatically set to
'N', and no printk messages are compiled into the kernel. This usually
saves about another 4K of size in the kernel image.

By using both CONFIG\_PRINTK and CONFIG\_PRINTK\_FUNC, you can reduce
the size of the kernel image (and that flash and RAM it requires).
However, there is a drawback to eliminating all the messages. Obviously,
it is then not possible to get any status, diagnostic or debug messages
from the kernel! Another mechanism is available, which allows you to
control on a per-file basis which printk calls are compiled into the
kernel. This is the pre-processor variable DO\_PRINTK.

To use DO\_PRINTK, set CONFIG\_PRINTK to 'N' and CONFIG\_PRINTK\_FUNC to
'Y' in your kernel configuration. This will globally disable all printk
calls in the kernel. Now, determine the C files where you wish to enable
printk messages, and add the line:

    #define DO_PRINTK 1

at the top of each file. Now, the printk calls in those files will be
compiled normally. Printk calls in other modules will be omitted.

[![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif) - **Important
Note:** The DO\_PRINTK variable controls how the preprocessor will treat
printk statements in the code. For this reason, this statement **MUST**
appear at the top of the file, before any

    #include

lines. In order to change the set of printk messages preserved in the
code, you will need to modify the

    DO_PRINTK

lines, and recompile the kernel. (There is no runtime control of the
printk calls.) This is a simple mechanism, but it does provide a way to
omit **most** of the printk messages from the kernel while still
preserving some messages that may be useful during

development or on a deployed product.

In review, there are basically 3 different settings combinations for
CONFIG\_PRINTK\_FUNC and CONFIG\_PRINTK that make sense:

<table border="1" cellpadding="5" cellspacing="0" align="center">
<tr>
<th style="background:#ffffcc;" colspan="2"><b>Settings</b>
</th>
<th style="background:#ffffcc;" rowspan="2"><b>Explanation</b>
</th></tr>
<tr>
<th style="background:#ffffcc;"><b>CONFIG_PRINTK_FUNC</b>
</th>
<th style="background:#ffffcc;"><b>CONFIG_PRINTK</b>
</th></tr>
<tr>
<td>Y</td>
<td>Y</td>
<td>This is the default setting for the kernel configuration.  In this setting the <code>printk</code> code is compiled into the kernel, and all printk calls throughout the entire source code are also compiled as part of the kernel.
</td></tr>
<tr>
<td>Y</td>
<td>N</td>
<td>This leaves the actual printk() routine in the kernel, but disables all calls to printk throughout the entire source code.  However, you can use DO_PRINTK in individual modules to enable the printk calls from those modules.
</td></tr>
<tr>
<td>N</td>
<td>N</td>
<td>This removes the printk() routine from the kernel, and disables all kernel printk messages, and gives the smallest kernel code and data size.  DO_PRINTK will NOT enable any module-specific printk calls.
</td></tr></table>

#### Booting without SysFS

(copied from linux-tiny wiki)

Turning off sysfs support can save a substantial amount of memory in
some setups. One big downside is that it breaks the normal boot process
because the kernel can no longer mapa symbolic device name to the
internal device numbers.

Thus, you will need to pass a numeric device number in hex. For example,
to boot off /dev/hda1, which has major number 3 and minor 1, you'll need
to append a root== option like this:

    /boot/vmlinuz root==0x0301 ro

#### Booting without /proc fs

It is also possible to boot with

    /proc

fs, but many programs expect this psuedo-filesystem to be present and
mounted. For example,

    free

and

    ps

are two commands which retrieve information from

    /proc

in order to run.

**list some workarounds here**

#### Using kernel memory measurement features

[![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif) FIXTHIS - need
instruction on bootmem auditing and counting inlines - need more detail
for kmalloc accounting

##### Kmalloc Accounting

This is a features of Linux-tiny, which tracks callers of kmalloc and
kfree, and produces summary statistics for kernel memory allocations, as
well as detailed information about specific kmalloc callers.

This was first published by Matt Mackall in February of 2005, but was
not mainlined at that time.

To see results for kernel allocations, follow these steps:

-   turn on the CONFIG\_KMALLOC option. This will show up on the kernel
    configuration menus as "Enabled accounting of kmalloc/kfree
    allocations?"
-   recompile your kernel
-   boot the kernel
-   periodically, examine the accounting stats
    -   cat /proc/kmalloc

See [http://lwn.net/Articles/124374/](http://lwn.net/Articles/124374/)

##### Bootmem Auditing

##### Counting Inlines

## Outline

[![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif) FIXTHIS - need
to review outline and fill in missing material

-   Tuning the kernel

-   how to measure kernel size

-   in-kernel size reporting - kmalloc accounting
-   bloat-o-meter

-   kernel configuration options

-   mainline options
-   optional features
-   minimal config
-   sufficient API?

-   POSIX compliance
-   LSB compliance
-   LTP compliance

-   file systems

-   comparison of file system sizes

-   compiler options for reducing size

-   gcc -os
-   gcc -whole-program

-   online resources:

-   bloatwatch
-   kconfigsize

## References

-   Linux-tiny project web site:
    [[linux-tiny](http://www.selenic.com/linux-tiny/)]
-   eLinux wiki Linux-tiny page: [Linux Tiny](../../.././dev_portals/System_Size/Linux_Tiny/Linux_Tiny.md "Linux Tiny")
-   Matt Mackall's
    [http://elinux.org/images//8/83/Pdf.gif](http://elinux.org/images//8/83/Pdf.gif)
    [Linux-tiny
    presentation](http://eLinux.org/images/7/72/Linux_tiny.pdf "Linux tiny.pdf")
    [http://elinux.org/images/d/da/Info\_circle.png](http://elinux.org/File:Linux_tiny.pdf)
-   CE Linux Forum resources for reducing system size: [System
    Size](../../../dev_portals/System_Size/System_Size.md "System Size")

## Appendices

#### Appendix A - Sample minimum configuration for ARM

[FIXTHIS - need ARM minimum config.]

#### Appendix B - Configuration Option Details

[![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif)Want to fill in
this section with details about configuration options.

For each option, would like to document:

-   what is size affect for different option values

-   This page & [Kernel Size Tuning Guide Config Option
    Impact](http://eLinux.org/Kernel_Size_Tuning_Guide_Config_Option_Impact "Kernel Size Tuning Guide Config Option Impact")
    describe kernel size and RAM usage impact affected by each
    configuration option listed in "Kernel Configuration Options" above,
    on i386.

-   what is affect of performance, functionality, etc.
-   what programs (if any) will stop working if option is turned off (or
    reduced)

#### Appendix C - Things to research

-   miniconfigs
-   how to use an initramfs (to avoid using NFS-mounted rootfs)
-   how to use a local fs (to avoid using NFS-mounted rootfs)
-   Eric Biederman's turning off CONFIG\_BLOCK - will any FS work after
    this??

-   he got a 2.6.1 kernel (presumably all\_no) to: "191K bzImage and a
    323K text segment". See
    [here](http://groups.google.com/group/linux.kernel/browse_frm/thread/d688fe97611dcc7e/7e685339b152b7f3?hl==en&lr==&ie==UTF-8&rnum==1&prev==/groups%3Fhl%3Den%26lr%3D%26ie%3DUTF-8%26selm%3D19Kuz-872-3%2540gated-at.bofh.it#7e685339b152b7f3).

-   why is networking so big??
-   why are file systems so big??
-   capture serial output from kernel for size measurement (see
    grabserial program)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel Size Tuning
    Guide](http://eLinux.org/Category:Kernel_Size_Tuning_Guide "Category:Kernel Size Tuning Guide")
-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")

