> From: [eLinux.org](http://eLinux.org/File_Systems "http://eLinux.org/File_Systems")


# File Systems



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 MTD](#mtd)
    -   [1.2 UBI](#ubi)
    -   [1.3 Partitioning](#partitioning)
    -   [1.4 eMMC and UFS](#emmc-and-ufs)
-   [2 Embedded Filesystems](#embedded-filesystems)
    -   [2.1 AXFS](#axfs)
    -   [2.2 Btrfs](#btrfs)
    -   [2.3 CramFS](#cramfs)
    -   [2.4 F2FS](#f2fs)
    -   [2.5 InitRAMFS](#initramfs)
    -   [2.6 JFFS2](#jffs2)
    -   [2.7 LogFS](#logfs)
    -   [2.8 NFS](#nfs)
    -   [2.9 PRAMFS](#pramfs)
    -   [2.10 Romfs](#romfs)
    -   [2.11 SquashFS](#squashfs)
    -   [2.12 UBIFS](#ubifs)
    -   [2.13 YAFFS2](#yaffs2)
-   [3 Mounting the root filesystem](#mounting-the-root-filesystem)
    -   [3.1 Mounting JFFS2 image on PC using
        mtdram](#mounting-jffs2-image-on-pc-using-mtdram)
    -   [3.2 Mounting UBI Image on PC using
        nandsim](#mounting-ubi-image-on-pc-using-nandsim)
-   [4 Issues with General Purpose filesystems used in
    embedded](#issues-with-general-purpose-filesystems-used-in-embedded)
    -   [4.1 MMC/sdcard card
        characteristics](#mmc-sdcard-card-characteristics)
-   [5 Special-purpose Filesystems](#special-purpose-filesystems)
    -   [5.1 ABISS](#abiss)
    -   [5.2 Layered Filesystems](#layered-filesystems)
        -   [5.2.1 UnionFS](#unionfs)
        -   [5.2.2 aufs](#aufs)
        -   [5.2.3 mini\-fo](#mini-fo)
-   [6 Performance and benchmarks](#performance-and-benchmarks)
    -   [6.1 Tools to measure
        performance](#tools-to-measure-performance)
    -   [6.2 Comparison of flash
        filesystems](#comparison-of-flash-filesystems)
        -   [6.2.1 Cogent Embedded tests
            (2013)](#cogent-embedded-tests-2013)
        -   [6.2.2 Free Electrons tests
            (2011)](#free-electrons-tests-2011)
-   [7 Other projects](#other-projects)
    -   [7.1 Multi-media file systems](#multi-media-file-systems)
    -   [7.2 WikipediaFS](#wikipediafs)
    -   [7.3 wikifs](#wikifs)

# Introduction

Most embedded devices use [flash
memory](http://en.wikipedia.org/wiki/Flash_memory) as storage media.
Also, size and bootup time are very important in many consumer
electronics products. Therefore, special file systems are often used
with differrent features, such as enhanced compression, or the ability
to execute files directly from flash.

## MTD

Note that flash memory may be managed by the Memory Technology Devices
(MTD) system of Linux. See the [MTD/Flash
FAQ](http://www.linux-mtd.infradead.org/faq/general.html) for more
information. Most of the filesystems mentioned here are built on top of
the MTD system.

## UBI

The [Unsorted Block
Images](http://www.linux-mtd.infradead.org/doc/ubi.html) (UBI) system in
the Linux kernel manages multiple logical volumes on a single flash
device. It provides a mapping from logical blocks to physical erase
blocks, via the MTD layer. UBI provides a flexible partitioning concept
which allows for wear-leveling across the whole flash device.

See the [UBI](http://www.linux-mtd.infradead.org/doc/ubi.html) page or
[UBI FAX and Howto](http://www.linux-mtd.infradead.org/faq/ubi.html) for
more information.

## Partitioning

The kernel requires at least one "root" file system, onto which other
file systems can be mounted. In non-embedded systems, often only a
single file system is used. However, in order to optimize limited
resources (flash, RAM, processor speed, boot up time), many embedded
systems break the file system into separate parts, and put each part on
its own partition (often in different kinds of storage.

For example, a developer may wish to take all the read-only files of the
system, and put them into a compressed, read-only file system in flash.
This will consume the least amount of space on flash, at the cost of
some read-time performance (for decompression).

Another configuration might have executable files stored uncompressed on
flash, so that they can be executed-in-place, which saves RAM and
boot-up time (with a potential small loss of performance).

For writable data, if the data does not need to be persistent, sometimes
a ramdisk is used. Depending on the performance needs and the RAM
limits, the file data may be compressed or not.

There is no single standard for interleaving the read-only and
read-write portions of the file system. This depends heavily on the set
of embedded applications used for the project.

## eMMC and UFS

As flash memories have gotten larger, a variety of factors has caused a
shift from use of raw NAND to packaged, block-addressable NAND flash
memory for embedded devices. These are chips which contain firmware on
board to accept block I/O requests, similar to rotating storage media
(old hard disk drives), and fullfill them. This involves mapping the
read and write requests to areas of the NAND flash in the chip, and
managing the NAND flash to try to optimize for correctness and longevity
of the flash memory. NAND flash must be re-written in large blocks
(erase blocks) that are many times the size of individual file system
blocks. Therefore, the method of mapping, re-arranging and garbage
collecting the allocation of blocks in the system is quite important.

These chips are run with a block-based, rather than flash-based
filesystem (e.g. ext4). As of 2012, optimizing the ext4 file system for
use with these systems is a hot topic area of file system research. See
[http://lwn.net/Articles/502472](http://lwn.net/Articles/502472)

# Embedded Filesystems

Here are some filesystems designed for and/or commonly used in embedded
devices, sorted in alphabetical order:

## AXFS

-   [AXFS](http://eLinux.org/AXFS "AXFS") - Advanced XIP File System
    -   Website:
        [http://axfs.sourceforge.net/](http://axfs.sourceforge.net/)
    -   This file system is designed specifically to support
        Execute-in-place operations. It uses a bi-phased approach. The
        first phase is to have the filesystem in flash and run it to
        collect profile data, stating what pages are used. In the second
        phase you build a filesystem using these profile data. This
        filesystem makes all pages metioned in the profile file as XIP
        data, which can then will be loaded to RAM upon mounting (and
        executed as XIP). It is also possible to put the XIP pages in
        NOR flash and run them from there.

## Btrfs

-   [btrfs](https://btrfs.wiki.kernel.org/index.php/Main_Page) is a new
    copy-on-write filesystem that first appeared in the kernel in
    2.6.29-rc1 and [was merged in
    2.6.30](http://lwn.net/Articles/342892/).
-   Btrfs is [not yet supported by many popular Linux filesystem tools
    such as gparted](http://gparted.sourceforge.net/features.php) as of
    April 2011.
-   Btrfs has been adopted as the [MeeGo platform's
    filesystem](http://lwn.net/Articles/387196/).
-   [Nice Introduction Video on btrfs by Chris
    Mason](http://training.linuxfoundation.org/linux-tutorials/introduction-to-btrfs)

## CramFS

-   [CRAMFS](http://en.wikipedia.org/wiki/Cramfs) - A compressed
    read-only file system for Linux. The maximum size of CRAMFS is
    256MB.
    -   "Linear Cramfs" is the name of a special feature to use
        uncompressed file, in a linear block layout with the Cramfs file
        system. This is useful for storing files which can be executed
        in-place. For more information on Linear Cramfs, see
        [Application XIP](http://eLinux.org/Application_XIP "Application XIP")

## F2FS

-   [F2FS](http://eLinux.org/F2FS "F2FS")[(wikipedia
    entry)](http://en.wikipedia.org/wiki/F2FS) is a flash-friendly file
    system for Linux, developed by Samsung.

## InitRAMFS

From March 2006 [Linux Devices](http://eLinux.org/Linux_Devices "Linux Devices"):

INTRODUCING INITRAMFS, A NEW MODEL FOR INITIAL RAM DISKS This clear,
technical article introduces initramfs, a Linux 2.6 feature that enables
an initial root filesystem and init program to reside in the kernel's
memory cache, rather than on a ramdisk (as with initrd filesystems).
Compared to initrd, intramfs can increase boot-time flexibility, memory
efficiency, and simplicity, the author says. One especially interesting
feature for embedded Linux developers is that relatively simple, deeply
embedded systems can use initramfs as their sole filesystem.

[http://www.linuxfordevices.com/c/a/Linux-For-Devices-Articles/Introducing-initramfs-a-new-model-for-initial-RAM-disks/](http://www.linuxfordevices.com/c/a/Linux-For-Devices-Articles/Introducing-initramfs-a-new-model-for-initial-RAM-disks/)

Here is a good article about how to build an initramfs:

-   [http://www.landley.net/writing/rootfs-howto.html](http://www.landley.net/writing/rootfs-howto.html)

For more information, look in: Documentation/early-userspace/README

## JFFS2

-   [JFFS2](http://sourceware.org/jffs2/) - The Journalling Flash File
    System, version 2. This is the most commonly used flash filesystem.
    -   The maximum size of JFFS2 is 128MB.
    -   [http://sourceforge.net/projects/mtd-mods](http://sourceforge.net/projects/mtd-mods)
        has some patches by Alexey Korolev for improvements to JFFS2
        -   See the presentation on Alexey's patches at:
    -   To improve mount time substantially verify that the erase block
        summary patch is in your image. This patch is part of the jffs2
        driver since 2005-09-07. A patch for an earlier version can be
        found at:
        [http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050211.patch](http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050211.patch)
        (or try your luck at
        [http://web.archive.org/web/\*/http://www.inf.u-szeged.hu/jffs2/mount.php](http://web.archive.org/web/*/http://www.inf.u-szeged.hu/jffs2/mount.php)).
    -   [JFFS2](http://eLinux.org/index.php?title=JFFS2&action=edit&redlink=1 "JFFS2 (page does not exist)")
        has undergone improvement since early versions (\~2.4.30).
        Modern versions of the driver in newer kernels have show
        stopping bugs fixed.

## LogFS

LogFS was a scalable flash filesystme aimed at replacing JFFS2 for most
uses.

Unfortunately, it seems to be abandoned at present.

See [LogFS](http://eLinux.org/LogFS "LogFS") for details.



## NFS

Due to space constraints on embedded devices, it is common during
development to use a network file system for the root filesystem for the
target. This allows the target to have a very large area where full-size
binaries and lots of development tools can be placed during development.
One drawback to this approach is that the system will need to be
re-configured with local file systems (and most likely re-tested) for
final product shipment, at some time during the development cycle.

An NFS client can be built into the Linux kernel, and the kernel can be
configured to use NFS as the root filesystem. This requires support for
networking, and mechanisms for specifying the IP address for the target,
and the path to the filesystem on the NFS host. Also, the host must be
configured to run an NFS server. Often, the host also provides the
required address and path information to the target board by running a
DHCP server.

See the the file Documentation/nfsroot.txt in the Linux kernel source
for more information about mounting an NFS root filesystem with the
kernel.

## PRAMFS

-   [PRAMFS](http://eLinux.org/Pram_Fs "Pram Fs") - Persistent and protected RAM File
    System

The Persistent/Protected RAM Special Filesystem (PRAMFS) is a
full-featured read/write filesystem that has been designed to work with
fast I/O memory, and if the memory is non-volatile, the filesystem will
be persistent. In addition, it has Execute-in-place support.

Info on the PRAMFS specification can be found at [Pram Fs
Specification](http://eLinux.org/Pram_Fs_Specification "Pram Fs Specification")

## Romfs

-   [RomFs](http://romfs.sourceforge.net) - A small space-efficient
    read-only filesystem. A description can be found in
    Documentation/filesystems/romfs.txt or
    [http://lxr.linux.no/linux/Documentation/filesystems/romfs.txt](http://lxr.linux.no/linux/Documentation/filesystems/romfs.txt)

## SquashFS

[Squash Fs](http://eLinux.org/Squash_Fs "Squash Fs") is a (more) compressed read-only
file system for Linux. This file system has better compression than
JFFS2 or CRAMFS. After spending a long time outside of the mainline
kernel, Squashfs have finally been merged and released with [kernel
2.6.29](http://kernelnewbies.org/LinuxChanges#head-5ca2504b2b4f4e6583f50dcdf23b2e75b383252f).

It is possible to tune the amount of compression when running
mksquashfs. The -b option allows you to specify the block size. A
smaller block size generally gives less compression and a larger -b
option gives more compression. However there is a downside to this. Data
is read from the flash using blocks. So if you use a block size of 128k,
and you need a page of 4k, still the compressed equivalent of 128k data
will be read from flash. As 128k comprises 32 pages, it will result in
32 pages being read into the buffer cache, even though at the moment of
reading you only need one. Often the other 31 pages will be needed as
well, but if not you wasted some tiem to read and decompress the unused
data. Also you got some unneeded data in the buffer cache (possibly the
system even had to kick used pages from the cache in order to make room
for these 31 pages).

If you care for the smallest filesystem you probably want to go with the
largest block size. However, if your primary concern is performance you
might want to experiment a little bit to see what works out best for you
(and that could even be applying no compression at all! Mksquashfs has
options: -noInodeCompression, -noDataCompression and
–noFragmentCompression to control this). If you also applied function
reordering (see [Boot Time\#User-space and application
speedups](http://eLinux.org/Boot_Time#User-space_and_application_speedups "Boot Time") a
large block size will probably work out well for you.

The table below gives an idea of the amount of compression that is
achieved by the various block sizes. Input was a root filesystem of an
embedded device.

<table>
<thead>
<tr class="header">
<th align="left"></th>
<th align="left">size</th>
<th align="left">compression</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Initial</td>
<td align="left">53128K</td>
<td align="left">100 %</td>
</tr>
<tr class="even">
<td align="left">4K</td>
<td align="left">17643K</td>
<td align="left">33.2 %</td>
</tr>
<tr class="odd">
<td align="left">8K</td>
<td align="left">16572K</td>
<td align="left">31.2 %</td>
</tr>
<tr class="even">
<td align="left">16K</td>
<td align="left">15780K</td>
<td align="left">29.7 %</td>
</tr>
<tr class="odd">
<td align="left">32K</td>
<td align="left">15204K</td>
<td align="left">28.6 %</td>
</tr>
<tr class="even">
<td align="left">64K</td>
<td align="left">14812K</td>
<td align="left">27.9 %</td>
</tr>
</tbody>
</table>

A presentation on Squash FS by Phillip Lougher at ELC Europe 2008:
[slides](http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2008Presentations?action=AttachFile&do=get&target=squashfs-elce.pdf)
and
[video](http://free-electrons.com/pub/video/2008/elce/elce2008-lougher-squashfs.ogv).

## UBIFS

[UBIFS](http://eLinux.org/UBIFS "UBIFS") is a flash-based filesystem, implemented on top
of the Unsorted Block Images ([UBI](http://eLinux.org/File_Systems#UBI "File Systems"))
interface.

It has good performance compared to Jffs2 and yaffs.

Please see the [UBIFS](http://eLinux.org/UBIFS "UBIFS") page for more details.

## YAFFS2

-   [YAFFS](http://www.yaffs.net/yaffs-overview) - Yet Another Flash
    File System - a file system designed specifically for NAND flash.

YAFFS2 is simple, portable, reliable and self-contained. It is widely
used in embedded OSes other than Linux, and can also be used stand-alone
without an OS, e.g. in bootloaders. When used with Linux it can use MTD
or its own flash driver. Similarly it can use the VFS or its own posix
layer. It is log-structured, and single-threaded. It does not do
compression itself - either compress the data itself or use squashfs on
top of YAFFS2.

YAFFS2 is designed to boot quickly (insofar as a log-structured FS that
has to scan the flash can). It uses checkpointing so that if a partition
was unmounted cleanly then there is no need to rescan the flash on
power-up. All the features of the FS are configuable so you can trade
off things like maximum file/partition size, flash block size, file
granulaity etc. Data is written straight through to the flash except for
caching to ensure efficienct use of blocks. YAFFS2 normally uses the OOB
are of the flash for its metadata, allowing faster booting as only the
OOB needs to be read for flash scan. It can keep its metadata inside the
main page area at the expense of some speed.

Despite having been in use on Linux in real products since 2004 it has
not yet made it to the mainline.

-   -   Presentation on YAFFS2 by Wookey at ELC Europe 2007:
        [yaffs.pdf](http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2007Presentations?action=AttachFile&do=get&target=yaffs.pdf)
    -   Presentation from CELF Jamboree 17 comparing YAFFS and JFFS2 on
        2.6.10:
        [celf\_flash.pdf](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree17?action=AttachFile&do=view&target=celf_flashfs.pdf)

YAFFS2 is GPLed, but is also available under dual-licensing terms for
use in non-free contexts from Aleph One Ltd.

# Mounting the root filesystem

The root filesystem is mounted by the kernel, using a kernel command
line option. Other file systems are mounted from user space, usually by
init scripts or an init program, using the 'mount' command.

The following are examples of command lines used for mounting a root
filesystem with Linux:

-   Use the first partition on the first IDE hard drive:
    -   root=/dev/hda1
-   or in later kernels:
    -   root=/dev/sda1

-   Use NFS root filesystem (kernel config must support this)
    -   root=/dev/nfs

(Usually you need to add some other arguments to make sure the kernel IP
address gets configured, or to specify the host NFS path.)

-   Use flash device partition 2:
    -   root=/dev/mtdblock2

<!-- -->

    [FIXTHIS - should probably mention initrd's here somewhere]

## Mounting JFFS2 image on PC using mtdram

Since it is not possible to use the loopback device to mount JFFS2
images, mtdram needs to be used instead. Usually three modules are
needed to get it working:

-   mtdram: Provides an MTD partition in RAM. The size can be defined
    with the total\_size parameter in kilobytes.

-   mtdblock: This will create a block device for access to the
    partition.

-   jffs2: Since JFFS2 is usually not used as a filesystem on a PC,
    support needs to be loaded manually.

<!-- -->

    modprobe mtdram total_size=16384
    modprobe mtdblock
    modprobe jffs2

Depending on the target's endianess the image file might need conversion
to PC endianess. jffs2dump from the MTD tools can be used to archive
this.

    jffs2dump -b -c -e <output-filename> <input-filename>

The final image can be copied to the block device using dd.

    dd if=<image-file> of=/dev/mtdblock0

Mounting is done in the usuall way.

    mount /dev/mtdblock0 /tmp/jffs2 -t jffs2



## Mounting UBI Image on PC using nandsim

First create a simulated NAND device (this one is 256MB, 2048 page
size). \<number\>\_id\_byte= corresponds to the ID bytes sent back from
the NAND.

    $ sudo modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa third_id_byte=0x00 fourth_id_byte=0x15

Check it was created.

    $ cat /proc/mtd
    dev:    size   erasesize  name
    mtd0: 10000000 00020000 "NAND simulator partition 0"

Next, attach it to a mtd device.

    $ sudo modprobe ubi mtd=0

I had to detach it prior to formatting it.

    $ sudo ubidetach /dev/ubi_ctrl -m 0

If that ubidetach step fails when you enter it, just proceed to the next
step to format the mtd device.

    $ sudo ubiformat /dev/mtd0 -f <image>.ubi
    ubiformat: mtd0 (nand), size 268435456 bytes (256.0 MiB), 2048 eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
    libscan: scanning eraseblock 2047 -- 100 % complete
    ubiformat: 2048 eraseblocks have valid erase counter, mean value is 1
    ubiformat: flashing eraseblock 455 -- 100 % complete
    ubiformat: formatting eraseblock 2047 -- 100 % complete

Then, attach it.

    $ sudo ubiattach /dev/ubi_ctrl -m 0
    UBI device number 0, total 2048 LEBs (264241152 bytes, 252.0 MiB), available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)

Make a target directory, and mount the device.

    $ mkdir temp
    $ sudo mount -t ubifs ubi0 temp

# Issues with General Purpose filesystems used in embedded

## MMC/sdcard card characteristics

MMCs and SDcards are flash devices which present a block-oriented
interface to their host computer. Often, these devices are used in
embedded devices and have characteristics that are tuned for block
access using a FAT filesystem. But they are presented at "black boxes",
with internal logic and algorithms that are not exposed to the host
computer.

Some work is in progress to survey characterize these attributes, and to
adapt Linux to be able to use these devices more efficiently.

See
[https://wiki.linaro.org/WorkingGroups/KernelConsolidation/Projects/FlashCardSurvey](https://wiki.linaro.org/WorkingGroups/KernelConsolidation/Projects/FlashCardSurvey)

and
[https://wiki.linaro.org/WorkingGroups/KernelConsolidation/Projects/FlashDeviceMapper](https://wiki.linaro.org/WorkingGroups/KernelConsolidation/Projects/FlashDeviceMapper)
(These projects appear to be the work of Arnd Bergmann)



# Special-purpose Filesystems

## ABISS

The Active Block I/O Scheduling System is a file system designed to be
able to provide real-time features for file system I/O activities.

See [ABISS](http://abiss.sourceforge.net/)

## Layered Filesystems

Layered filesystems enable you to mount read-only media and still have
the possibility to write to it. At least, the writing part will end up
somewhere else, which is transparantly handled by the layered
filesystem. It has been around for quite some time and below are some
examples of filesystems already usable on (embedded) Linux systems
out-of-the-box.

### UnionFS

Sometimes it is handy to be able to overlay file systems on top of each
other. For example, it can be useful in embedded products to use a
compressed read-only file system, mounted "underneath" a read/write file
system. This give the appearance of a full read-write file system, while
still retaining the space savings of the compressed file system, for
those files that won't change during the life of the product.

UnionFS is a project to provide such a system (providing a "union" of
multiple file systems).

See
[http://www.filesystems.org/project-unionfs.html](http://www.filesystems.org/project-unionfs.html)

See also union mounts, which are described at
[http://lkml.org/lkml/2007/6/20/18](http://lkml.org/lkml/2007/6/20/18)
(and also in Documentation/union-mounts.txt in the kernel source tree -
or will be, when this feature is merged.)

### aufs

Another UnionFS. Go to
[http://aufs.sourceforge.net](http://aufs.sourceforge.net) for more
details.

### mini\_fo

minifo = mini fanout overlay file system.

Go to
[http://www.denx.de/wiki/Know.MiniFOHome](http://www.denx.de/wiki/Know.MiniFOHome)
for more details.

Apparently this is not maintained any more. Last information is from
2005.

# Performance and benchmarks

## Tools to measure performance

For a very simple disk performance measurement, you can use 'dd'. The
following writes a 2G file of all zeros to a filesystem, then clears the
page cache, and reads the file back:

-   dd if=/dev/zero of=test bs=1048576 count=2048
-   sync
-   sudo echo 3 \>/proc/sys/vm/drop\_caches
-   dd if=test of=/dev/null bs=1048576

You can also use IOZone to measure the performance of a Linux
filesystem.

See [http://www.iozone.org/](http://www.iozone.org/)

Some benchmark systems that are commonly used with desktop linux are

-   [bonnie](http://www.coker.com.au/bonnie++/)
-   [dbench](http://samba.org/ftp/tridge/dbench/)
-   [Portable, fully-threaded I/O benchmark program
    (tiobench)](http://sourceforge.net/projects/tiobench/)
-   [Flexible File System Benchmark
    (ffsb)](http://sourceforge.net/projects/ffsb/)

## Comparison of flash filesystems

### Cogent Embedded tests (2013)

This section has links to benchmarks, testing and tuning information.

-   [eMMC/SSD Filesystem Tuning Methodology
    v1.0](http://eLinux.org/images/b/b6/EMMC-SSD_File_System_Tuning_Methodology_v1.0.pdf "EMMC-SSD File System Tuning Methodology v1.0.pdf")
    document
    -   Contains testing methodology, and results (performance and
        robustness) for tuning different filesystems (btrfs, ext3, and
        f2fs) on different flash media

### Free Electrons tests (2011)

In 2011, the CE Linux Forum contracted with Free Electrons to perform
systematic testing of multiple flash filesystems over multiple kernel
versions.

The results are here:
[Flash\_Filesystem\_Benchmarks](http://eLinux.org/Flash_Filesystem_Benchmarks "Flash Filesystem Benchmarks")

# Other projects

## Multi-media file systems

-   XPRESS file system - [See OLS 2006 proceedings, presentation by
    Joo-Young Hwang]
    -   I found out at ELC 2007 that this FS project was recently
        suspended internally at Samsung

## WikipediaFS

A mountable virtual filesystem that allows accessing mediawiki based
sites as regular files using a regular editor. Currently this filesystem
is unmaintained. See
[http://wikipediafs.sourceforge.net/](http://wikipediafs.sourceforge.net/)
for more info.

## wikifs

This one seems similar to WikipediaFS, but aimed at Plan9 and inferno.
See
[http://www.cs.bell-labs.com/magic/man2html/4/wikifs](http://www.cs.bell-labs.com/magic/man2html/4/wikifs)
for more info.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [File Systems](http://eLinux.org/Category:File_Systems "Category:File Systems")

