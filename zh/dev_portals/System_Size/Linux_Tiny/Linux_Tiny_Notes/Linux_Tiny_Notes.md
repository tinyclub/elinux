> From: [eLinux.org](http://eLinux.org/Linux_Tiny_Notes "http://eLinux.org/Linux_Tiny_Notes")


# Linux Tiny Notes



Here are some miscellaneous notes on using Linux tiny. I wrote this up
really quickly while I was integrating Linux-tiny into a 2.6.11 kernel
and doing some size testing.

I'm providing these raw notes so that others might benefit from my
experience.

## Contents

-   [1 Patch Notes](#patch-notes)
-   [2 devlist.patch](#devlist-patch)
-   [3 core-small.patch -
    CONFIG\-CORE\-SMALL](#core-small-patch-config-core-small)
    -   [3.1 CONFIG\-CORE\-SMALL patches](#config-core-small-patches)
-   [4 config-net-small.patch](#config-net-small-patch)
    -   [4.1 CONFIG\-NET\-SMALL patches](#config-net-small-patches)
-   [5 Miscellanoues patches](#miscellanoues-patches)
-   [6 \*inline patches](#-2ainline-patches)
-   [7 06-crypto-sleep.patch](#06-crypto-sleep-patch)
-   [8 \# measurement bits](#-measurement-bits)
-   [9 kill-printk.patch](#kill-printk-patch)
-   [10 nobug.patch](#nobug-patch)
-   [11 nopanic.patch](#nopanic-patch)
-   [12 no-elf-core.patch](#no-elf-core-patch)
-   [13 no-kcore.patch](#no-kcore-patch)
-   [14 no-aio.patch](#no-aio-patch)
-   [15 no-xattr.patch](#no-xattr-patch)
-   [16 fslock.patch](#fslock-patch)
-   [17 direct-io-core.patch](#direct-io-core-patch)
-   [18 Changes in number of in-kernel
    items](#changes-in-number-of-in-kernel-items)
    -   [18.1 max-swapfiles.patch](#max-swapfiles-patch)
    -   [18.2 ldiscs.patch](#ldiscs-patch)
    -   [18.3 max\-user\-rt\-prio.patch](#max-user-rt-prio-patch)
-   [19 change-hz.patch](#change-hz-patch)
-   [20 Notes on building and size reductions from various
    configs](#notes-on-building-and-size-reductions-from-various-configs)
    -   [20.1 Table of Config options](#table-of-config-options)
    -   [20.2 Some results](#some-results)
    -   [20.3 Program for producing
        report](#program-for-producing-report)
    -   [20.4 Miscellaneous test notes](#miscellaneous-test-notes)
    -   [20.5 Config changes](#config-changes)
    -   [20.6 Series file](#series-file)

## Patch Notes

Here are some notes on individual linux-tiny sub-patches:

## devlist.patch

-   replaces device allocation code, don't know size impact, is NOT
    conditional
    -   maybe should add, but don't know - looks dangerous

## core-small.patch - CONFIG\_CORE\_SMALL

Add CONFIG\_CORE\_SMALL Kconfig option

### CONFIG\_CORE\_SMALL patches

These are hash table and data structure static size adjustments

-   pid-max.patch
-   user-hash.patch
-   futex-queues.patch
-   tvec\_bases.patch
-   con\_buf.patch

## config-net-small.patch

Add CONFIG\_NET\_SMALL Kconfig option

### CONFIG\_NET\_SMALL patches

These tune some net-related data sizes

-   cache\_defer\_hash.patch
-   unix\_socket\_table.patch
-   inet\_protos.patch
-   flow-cache-small.patch

## Miscellanoues patches

-   small-8023.patch - what does this do?
-   tg3-oops.patch - what does this do?

## \*inline patches

-   just make big routines not inline (unconditionally)
    -   Seems pretty safe to me.

## 06-crypto-sleep.patch

-   looks scary - not immediately obvious from patch how it saves size.

## \# measurement bits

Looks like very harmless stuff to instrument kernel for mem debugging,
and give tools for parsing stuff.

-   kmalloc-accounting.patch - keep track of kmallocs
-   audit-bootmem - print out all bootmem allocations
-   bloat-o-meter.patch - provides bloat-o-meter program to compare two
    kernel binary images
    -   This script shows the size difference on a symbol-by-symbol
        basis between two binaries (sorted by the amount of difference)

-   deprecate-inline.patch - mark inlines as deprecated so compiler
    emits warnings
    -   Note that it provides count-inlines program to parse compiler
        output and report size of inlines.
-   func-size.patch - use information about inlines to calculate
    function sizes (script is very similar to count-inlines program)

## kill-printk.patch

-   is single biggest reducer of kernel size, doesn't seem to work with
    serial console!!
    -   CONFIG\_PRINTK

## nobug.patch

Allow elimination of BUG code, which expands with file and line strings.
There are 1776 BUG() references in the 2.6.11 kernel. There are 1930
BUG\_ON(xxx) references in the kernel.

-   uses CONFIG\_BUG

## nopanic.patch

too dangerous to turn off panic, not used.

## no-elf-core.patch

Allow disabling of ELF core dumps

-   CONFIG\_ELF\_CORE

## no-kcore.patch

Allow disabling of /proc/kcore, is x86-specific

-   uses CONFIG\_PROC\_KCORE

## no-aio.patch

Allow disabling of Posix async IO

-   uses CONFIG\_AIO

## no-xattr.patch

Allow disabling of xattr syscalls

-   uses CONFIG\_XATTR

## fslock.patch

Allow disabling of file locking syscalls

-   uses CONFIG\_FILE\_LOCKING

## direct-io-core.patch

Allow disabling of direct IO support

-   uses CONFIG\_DIRECTIO

## Changes in number of in-kernel items

### max-swapfiles.patch

Make number of swapfiles configurable (default=32) (shift=5 =\> 32
files, shift=0 =\> 1 file)

-   uses CONFIG\_MAX\_SWAPFILES\_SHIFT

### ldiscs.patch

Make number of tty line disciplines configurable (default=16)

-   uses CONFIG\_NR\_LDISCS

### max\_user\_rt\_prio.patch

Make number of schedule slots configurable (default=100)

-   uses CONFIG\_MAX\_USER\_RT\_PRIO

## change-hz.patch

It's not obvious how this changes the size of the kernel, and it appears
to be x86 only

# Notes on building and size reductions from various configs

Notes on OSK builds:

-   first, did 'quilt pop pm/deferred-resume-test.patch', then built to
    get vmlinux.baseline

<!-- -->

          text    data     bss     dec  filename
        2107356  333344  113680 2554380  vmlinux.baseline

-   did 'quilt push -a', then built to get vmlinux.patched

<!-- -->

       bloat-o-meter vmlinux.baseline vmlinux.patched = +2920/-8884
           text    data     bss     dec  filename
        2101372  333888  113648 2548908  vmlinux.patched

-   configured all parameters at minimums, then built
    -   couldn't finish linking, and got the following errors:
        -   undefined reference to add\_preferred\_console
        -   undefined reference to generic\_setxattr and
            generic\_getxattr
        -   undefined reference to printk
-   configured printk and xattrs back on, then built to get vmlinux.try1

<!-- -->

       bloat-o-meter vmlinux.patches vmlinux.try1 = +4520/-350490
           text    data     bss     dec  filename
        1734504   90616   89036 1914156  vmlinux.try1

Panic trying to mount rootfs via nfs

-   tried to isolate nfs problem:
    -   configured with AIO, file locks and direct IO on - same problem
    -   configured with 5 swap files, 8 tty line disciplines, and 100
        mat rt levels - same problem
    -   went back to working config - diffed and noticed NFS\_FS was off
        -   NFS\_FS requires FILE\_LOCKING

## Table of Config options

Here is a table showing default value and value recommended for size
savings.

Note that I couldn't use CONFIG\_PRINTK, CONFIG\_XATTR or
CONFIG\_FILE\_LOCKING in my setup.

<table>
<thead>
<tr class="header">
<th align="left"><strong>CONFIG option</strong></th>
<th align="left"><strong>description</strong></th>
<th align="left"><strong>default</strong></th>
<th align="left"><strong>small</strong></th>
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
<td align="left">Y - for measurement</td>
</tr>
<tr class="even">
<td align="left">CONFIG_AUDIT_BOOTMEM</td>
<td align="left">print out all bootmem allocations</td>
<td align="left">N</td>
<td align="left">Y - for measurement</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_DEPRECATE_INLINES</td>
<td align="left">cause compiler to emit info about inlines</td>
<td align="left">N</td>
<td align="left">Y - for measurement</td>
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
<td align="left">2?</td>
</tr>
<tr class="even">
<td align="left">CONFIG_MAX_USER_RT_PRIO</td>
<td align="left">number of RT priority levels (schedule slots)</td>
<td align="left">100</td>
<td align="left">5?</td>
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
<td align="left">allow use of shmem filesystem</td>
<td align="left">Y</td>
<td align="left">N</td>
</tr>
</tbody>
</table>



## Some results

This was for a quick check of Linux-tiny on an OSK board.

<table>
<thead>
<tr class="header">
<th align="left"><strong>section</strong></th>
<th align="left"><strong>vmlinux.baseline</strong></th>
<th align="left"><strong>vmlinux.try3</strong></th>
<th align="left"><strong>delta</strong></th>
<th align="left"><strong>percent</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">text</td>
<td align="left">2107356</td>
<td align="left">2057276</td>
<td align="left">-50080</td>
<td align="left">-2%</td>
</tr>
<tr class="even">
<td align="left">data</td>
<td align="left">333344</td>
<td align="left">100988</td>
<td align="left">-232356</td>
<td align="left">-69%</td>
</tr>
<tr class="odd">
<td align="left">bss</td>
<td align="left">113680</td>
<td align="left">92784</td>
<td align="left">-20896</td>
<td align="left">-18%</td>
</tr>
<tr class="even">
<td align="left">total</td>
<td align="left">2554380</td>
<td align="left">2251048</td>
<td align="left">-303332</td>
<td align="left">-11%</td>
</tr>
</tbody>
</table>



## Program for producing report

    #!/usr/bin/python
    #
    # size-delta - a tool for showing size difference between two files
    # also supports output in MoinMoin wiki table format!!

    import os, sys

    if len(sys.argv)<3:
        sys.stderr.write("Usage: %s size-delta [-w] file1 file2\n\n" % os.path.basename(sys.argv[0]))
        sys.stderr.write("  -w   Show data in wiki-table format\n")
        sys.exit(1)

    wiki_format = 0
    print sys.argv
    if "-w" in sys.argv:
        wiki_format = 1
        sys.argv.remove("-w")
        print sys.argv

    size1 = os.popen("size "+sys.argv[1]).readlines()[1]
    size2 = os.popen("size "+sys.argv[2]).readlines()[1]

    (text1, data1, bss1, total1, hex1, filename1) = size1.split()
    (text2, data2, bss2, total2, hex2, filename2) = size2.split()

    def print_line(title, d1, d2):
        delta = int(d2)-int(d1)
        if wiki_format:
            print "||%5s||%8s||%8s||%8s||%2d%%||" % (title, d1, d2, delta, int((float(delta)/float(d1))*100))
        else:
            print "%5s: %8s %8s %8s %2d%%" % (title, d1, d2, delta, int((float(delta)/float(d1))*100))

    if wiki_format:
        print "||section||",os.path.basename(sys.argv[1]),"||",os.path.basename(sys.argv[2]),"||delta||percent||"
    else:
        print os.path.basename(sys.argv[1])," => ",os.path.basename(sys.argv[2])

    print_line("text", text1, text2)
    print_line("data", data1, data2)
    print_line("bss", bss1, bss2)
    print_line("total", total1, total2)

## Miscellaneous test notes

-   kernel would not link with CONFIG\_PRINTK=n
    -   undefined reference to add\_preferred\_console
    -   undefined reference to printk
-   kernel would not link with CONFIG\_XATTR=n
    -   undefined reference to generic\_setxattr and generic\_getxattr
-   kernel would not mount root fs (NFS) with CONFIG\_FILE\_LOCKING=n

## Config changes

    [tbird@crest osk]$ diff config.baseline config.try3
    --- config.baseline     2005-05-23 17:31:57.000000000 -0700
    +++ config.try3 2005-05-23 17:31:40.000000000 -0700
    @@ -1,7 +1,7 @@
     #
     # Automatically generated make config: don't edit
     # Linux kernel version: 2.6.11.10-alp
    -# Mon May 23 16:49:43 2005
    +# Mon May 23 17:27:14 2005
     #
     CONFIG_ARM=y
     CONFIG_MMU=y
    @@ -34,34 +34,33 @@
     CONFIG_FASTBOOT=y
     # CONFIG_RTC_NO_SYNC is not set
     CONFIG_PRESET_LPJ=0
    -# CONFIG_EMBEDDED is not set
    -CONFIG_KALLSYMS=y
    -CONFIG_KALLSYMS_ALL=y
    -CONFIG_KALLSYMS_EXTRA_PASS=y
    +CONFIG_EMBEDDED=y
    +# CONFIG_KALLSYMS is not set
     # CONFIG_KMALLOC_ACCOUNTING is not set
     # CONFIG_AUDIT_BOOTMEM is not set
     CONFIG_PRINTK=y
    -CONFIG_ELF_CORE=y
    -# CONFIG_CORE_SMALL is not set
    -# CONFIG_NET_SMALL is not set
    -CONFIG_FUTEX=y
    -CONFIG_EPOLL=y
    -CONFIG_AIO=y
    +# CONFIG_ELF_CORE is not set
    +CONFIG_CORE_SMALL=y
    +CONFIG_NET_SMALL=y
    +# CONFIG_FUTEX is not set
    +# CONFIG_EPOLL is not set
    +# CONFIG_AIO is not set
     CONFIG_XATTR=y
     CONFIG_FILE_LOCKING=y
    -CONFIG_DIRECTIO=y
    +# CONFIG_DIRECTIO is not set
    +# CONFIG_UID16 is not set
     # CONFIG_MEASURE_INLINES is not set
     CONFIG_CC_OPTIMIZE_FOR_SIZE=y
    -CONFIG_SHMEM=y
    +# CONFIG_SHMEM is not set
     CONFIG_CC_ALIGN_FUNCTIONS=0
     CONFIG_CC_ALIGN_LABELS=0
     CONFIG_CC_ALIGN_LOOPS=0
     CONFIG_CC_ALIGN_JUMPS=0
     # CONFIG_TINY_CFLAGS is not set
    -CONFIG_MAX_SWAPFILES_SHIFT=5
    -CONFIG_NR_LDISCS=16
    -CONFIG_MAX_USER_RT_PRIO=100
    -# CONFIG_TINY_SHMEM is not set
    +CONFIG_MAX_SWAPFILES_SHIFT=0
    +CONFIG_NR_LDISCS=2
    +CONFIG_MAX_USER_RT_PRIO=5
    +CONFIG_TINY_SHMEM=y

     #
     # Loadable module support
    @@ -435,6 +434,7 @@
     CONFIG_SERIO=y
     CONFIG_SERIO_SERPORT=y
     # CONFIG_SERIO_CT82C710 is not set
    +# CONFIG_SERIO_LIBPS2 is not set
     # CONFIG_SERIO_RAW is not set

     #
    @@ -912,7 +912,7 @@
     # CONFIG_DEBUG_SPINLOCK is not set
     # CONFIG_DEBUG_KOBJECT is not set
     CONFIG_BUG=y
    -CONFIG_DEBUG_BUGVERBOSE=y
    +# CONFIG_DEBUG_BUGVERBOSE is not set
     CONFIG_DEBUG_INFO=y
     # CONFIG_DEBUG_FS is not set
     CONFIG_FRAME_POINTER=y

## Series file

Please note that I didn't try all the patches. I only integrated and
used 37 of the broken-out patches. You can see this from the series file
I used, which follows:

    ####################################
    # start of linux tiny patches
    # key:
    # ## = patches Tim commented out
    # # = patches commented out in original 2.6.11-tiny broken out series file

    ##tiny/tiny-extraversion.patch
    #
    # stuff already in -mm
    #
    ##tiny/kgdb-ga.patch
    ##tiny/kgdboe-netpoll.patch
    tiny/use-funit-at-a-time.patch
    ##tiny/devlist.patch
    #
    # tiny stuff
    #
    # core
    tiny/core-small.patch
    tiny/pid-max.patch
    tiny/user-hash.patch
    tiny/futex-queues.patch
    tiny/tvec_bases.patch
    tiny/con_buf.patch
    # net
    tiny/config-net-small.patch
    tiny/cache_defer_hash.patch
    tiny/unix_socket_table.patch
    tiny/inet_protos.patch
    tiny/flow-cache-small.patch
    #
    # Unconditional bits
    #
    ##tiny/small-8023.patch
    ##tiny/tg3-oops.patch
    tiny/namei-inlines.patch
    tiny/buffer-inlines.patch
    tiny/fs_open-inlines.patch
    tiny/inode-inlines.patch
    tiny/ext2namei-inlines.patch
    tiny/fslocks-inline.patch
    ##tiny/06-crypto-sleep.patch
    #
    # build options
    #
    tiny/tiny-cflags.patch
    #
    # measurement bits
    #
    tiny/kmalloc-accounting.patch
    tiny/audit-bootmem.patch
    tiny/bloat-o-meter.patch
    tiny/deprecate-inline.patch
    tiny/func-size.patch
    #
    # trimmed debugging support
    #
    ##tiny/no-doublefault.patch
    tiny/kill-printk.patch
    ##tiny/tiny-panic.patch
    tiny/nobug.patch
    ##tiny/nopanic.patch
    tiny/no-elf-core.patch
    tiny/no-kcore.patch
    #
    # trimmed code
    #
    # TRB - 5/19 - haven't looked at these yet
    ##tiny/tiny-crc.patch
    ##tiny/threadinfo-ool.patch
    ##tiny/semaphore-inline.patch
    ##tiny/slob.patch
    ##tiny/slob-accounting.patch
    ##tiny/mempool-shrink.patch
    #tiny/sysfs-backingstore.patch
    ##tiny/no-translations.patch
    #tiny/tinyvt.patch
    #
    # trimmed apis
    #
    # TRB - 5/19 - haven't looked at ## ones yet
    ##tiny/ptrace.patch
    ##tiny/remove-vm86.patch
    ##tiny/sysenter.patch
    tiny/no-aio.patch
    tiny/no-xattr.patch
    tiny/fslock.patch
    tiny/direct-io-core.patch
    tiny/uid16.patch
    #tiny/posix-timers.patch
    ##tiny/ethtool.patch
    ##tiny/inetpeer.patch
    ##tiny/net-filter.patch
    ##tiny/dev_mcast.patch
    #tiny/rtnetlink.patch
    ##tiny/igmp.patch
    ##tiny/binfmt-script.patch
    ##tiny/elf-no-aout.patch
    #
    # trimmed constants
    #
    tiny/max-swapfiles.patch
    tiny/ldiscs.patch
    tiny/max_user_rt_prio.patch
    ##tiny/change-hz.patch
    #
    # trimmed hw support
    #
    # TRB - 5/19 - haven't looked at ## ones yet
    #tiny/small-nomodedb.patch
    ##tiny/ide-hwif.patch
    ##tiny/sbf.patch
    ##tiny/serial-pci.patch
    ##tiny/dmi_blacklist.patch
    ##tiny/pci-quirks.patch
    ##tiny/tsc.patch
    ##tiny/cpu-support.patch
    ##tiny/mtrr.patch
    #
    # inflate cleanups
    #
    # TRB - 5/19 - haven't looked at ## ones yet
    ##tiny/inflate-noinline.patch
    ##tiny/inflate-formatting.patch
    ##tiny/inflate-legacy.patch
    ##tiny/inflate-input.patch
    ##tiny/inflate-iostate.patch
    ##tiny/inflate-huft.patch
    ##tiny/inflate-crc.patch
    ##tiny/inflate-killglobals.patch
    ##tiny/inflate-initramfs.patch
    ##tiny/inflate-initrd.patch
    ##tiny/inflate-i386.patch
    ##tiny/inflate-arm.patch
    ##tiny/inflate-x86_64.patch
    #
    # unsorted
    #
    # TRB - 5/19 - haven't looked at ## ones yet
    ##tiny/inflate-roll-crc.patch
    ##tiny/netpoll-timeout.patch
    ##tiny/movsl-mask.patch
    #tiny/rolled-md4.patch
    #tiny/kill-ext3-md4.patch

    # end of linux tiny patches
    ####################################


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux Tiny](http://eLinux.org/Category:Linux_Tiny "Category:Linux Tiny")

