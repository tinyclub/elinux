> From: [eLinux.org](http://eLinux.org/Application_XIP "http://eLinux.org/Application_XIP")


# Application XIP



## Contents

-   [1 Introduction](#introduction)
-   [2 Rationale](#rationale)
-   [3 Downloads](#downloads)
    -   [3.1 Patch](#patch)
-   [4 Utility programs](#utility-programs)
-   [5 How To Use](#how-to-use)
-   [6 General](#general)
-   [7 Linear CRAMFS Usage](#linear-cramfs-usage)
-   [8 References](#references)
-   [9 Cramfs](#cramfs)
-   [10 xip2fs](#xip2fs)
-   [11 Sample Results](#sample-results)
-   [12 Future Work](#future-work)
-   [13 Sample images](#sample-images)

## Introduction

This page describes the feature Application XIP. This is a method of
storing and executing applications directly from the file system,
instead of first loading them into RAM. With Application XIP, the text
(or code) pages of the application are never loaded into RAM. Instead,
the (?? incomplete text)

## Rationale

This feature is important for these reasons:

-   reduction in RAM footprint
-   faster first invocation
-   reduction in RAM fragmentation (for non-MMU systems)
-   reduced power consumption of flash vs. SDRAM

Greg Ungerer said this on the ksummit-discuss list (July 2004):
"Application XIP provides a win of keeping the application code in flash
even when that is shared. Can make a difference on small memory systems.

It also helps alleviate the contiguous memory problem (or memory
fragmentation if you prefer) when you don't have an MMU. We need to be
able to allocate a big enough contigous memory region to load the text
into. Can be a problem on systems that have been running for a while and
free memory is fragmented. If the application can be run XIP from flash
then you at least don't need to worry about that. (This is a very real
problem on small RAM systems).

The argument isn't so much RAM is cheaper than flash either. Small
embedded systems will have flash and it comes in discrete sizes (1, 2,
4, 8 MB, etc). Sometimes it just makes sense to use what flash you have
more effectively."



## Downloads

### Patch

-   Code for Linear CramFS and XIP for 2.4.20 is in the base patch
    (base-2.4.20-8.patch) in the CELF 1.0 release. The code is not
    isolated into its own patch, but can be found pretty easily by
    grepping for CRAMFS\_LINEAR. See the
    [CELinux\_040503\_Release](http://eLinux.org/CELinux_040503_Release "CELinux 040503 Release")
    page for the source.
-   Patches for Linear Cramfs feature for 2.6.9, 2.6.10, 2.6.12 and
    2.6.14 are in the [Patch Archive](http://eLinux.org/Patch_Archive "Patch Archive")

## Utility programs

## How To Use

## General

To use application XIP, you have to use a file system which supports it.
One file system known to support it is Cramfs, described below.

Note that on an MMU-less system, the flash pages cannot be remapped to
arbitrary locations in the memory space. Therefore, the text pages must
be stored in flash contiguously and in order. Thus, only a file system
which stores meta-data (directory nodes and index tables) separate from
file data, and which allows a file to be saved as a single linear image,
can support XIP under these conditions.

## Linear CRAMFS Usage

The "cramfs-linear-xip" patch for kernel.org linux-2.6.9 enables a
kernel to perform XIP of applications from CramFS filesystems. The code
is derived from the source base of
[Montavista](http://en.wikipedia.org/wiki/Montavista) Software's
products and has copyrights by Shane Nay and Robert Leslie. I'm not sure
if these are actively maintained anywhere, nor whether the
[Montavista](http://en.wikipedia.org/wiki/Montavista) versions have
deviated from other versions.

To use this feature...

You'll need a version of mkcramfs that does not compress files with
sticky bit (chmod t) set (some versions require option -x to enable this
behavior). I believe various versions are floating about, or I can look
into sending a version of this as well.

Copy the resulting image to a flash partition on your board.

Build a kernel with:

    CONFIG_CRAMFS_LINEAR=y
    CONFIG_CRAMFS_LINEAR_XIP=y

and if it is the root filesystem:

    CONFIG_ROOT_CRAMFS_LINEAR=y

When mounting the filesystem specify flags physaddr=0xNNNNNNNN, where
NNNNNNNN is the physical address at which the flash partition appears.
The dmesg output of the mtd probe and map drivers will show this.

For example, on my OMAP1510 Innovator mtd partition \#3 is at 0x240000,
as shown in the boot log:

    Creating 5 MTD partitions on "omap_nor_cs0":

    0x00000000-0x00020000 : "bootloader"
    0x00020000-0x00040000 : "params"
    0x00040000-0x00240000 : "kernel"
    0x00240000-0x01000000 : "rootfs"
    0x01000000-0x02000000 : "filesystem"

To mount that as root I set U-Boot bootargs as:

`setenv bootargs console=ttyS0,115200n8 noinitrd root=/dev/null rootflags=physaddr=0x240000 rootfstype=cramfs`

Or can mount non-root with:

`mount -t cramfs -o physaddr=0x240000 none /mnt/mtd`

Note that this patch bypasses the MTD subsystem and generally assumes
all flash chips backing the XIP partition are wholly dedicated to
serving XIP images, and that the flash chips are never in any state
other than read mode (for example, no writeable partitions that are
backed by the same chip). You'll need to understand the flash chip
topology of your board to correctly partition the mtd devices. Also note
that certain flash chips are able to independently read and write
different areas and the MTD layer may support this, so the restriction
might not apply to your board.

This hasn't been tested very much at this point (Nov 8th 2004) so please
let us all know if any problems or suggestions.

What I will guess is that the MTD\_XIP stuff (which is in linux-mtd but
only for certain flash types and platforms) will eventually supplant
Linear CramFS and only the XIP portions of the patch will then be
needed, which might be more palatable to the kernel maintainers. I'll
talk to some folks about this. CELF might then be interested in
contributing to (or advocacy of) support for more flash types and
platforms for MTD\_XIP.

-   -   Todd Poynor,
        [Montavista](http://en.wikipedia.org/wiki/Montavista)

## References

-   [Configure Linux for
    XIP](http://www.denx.de/twiki/bin/view/DULG/ConfigureLinuxForXIP) -
    Describes experience with using both Kernel XIP and application XIP.

## Cramfs

[CRAMFS](http://sourceforge.net/projects/cramfs/)

## xip2fs

Arnd Bergman, on LKML Sep 9, 2004 with subject " " wrote: On
[linuxvm.org/patches](http://linuxvm.org/Patches/), you can find a file
system called xip2fs, that uses an ext2 read-only fs for XIP. The code
there works only if the backing memory is a zSeries DCSS memory segment,
but it should be fairly easy to port to some other low-level memory
provider.

## Sample Results

Here are some rough numbers: Time to run shell script which starts TinyX
X server and "xsetroot -solid red", then shuts down:

<table>
<thead>
<tr class="header">
<th align="left">Invocation</th>
<th align="left">Non-XIP</th>
<th align="left">XIP</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">First time</td>
<td align="left">3.195 seconds</td>
<td align="left">2.035 seconds</td>
</tr>
<tr class="even">
<td align="left">Second time</td>
<td align="left">1.744 seconds</td>
<td align="left">1.765 seconds</td>
</tr>
</tbody>
</table>

It was measured on a 168MHz ARM 925T TI OMAP 1510. In both cases the
filesystem was in flash. Note that once the Non-XIP application pages
are in RAM in the page cache, the Non-XIP case beats the XIP case
(probably due to the penalty to access flash memory).

So the only performance win is on the first invocation of the
application. The biggest benefit from Application XIP is from saving the
RAM required for the text section of the program.

\<\<Need some data on that.\>\>

## Future Work

Here is a list of things that could be worked on for this feature:

-   Cooperate with MTD to allow XIP from partitions managed by the usual
    MTD interfaces.
-   Or at least not require the physical address to be supplied
    (filesystem can look it up).
-   Cooperate with writeable MTD partitions on the same flash chip:
    suspend write/erase in progress to allow XIP reads.
-   Support additional filesystems.

## Sample images

[Tim Riker](http://eLinux.org/User:TimRiker "User:TimRiker") built some sample images for
a TI OMAP 1510 Innovator that use XIP kernel with XIP user space. The
kernel is a [Montavista](http://en.wikipedia.org/wiki/Montavista) kernel
with XIP enabled. The filesystem uses [uClibc](http://uClibc.org/) and
busybox and does a dhcp request on boot. inetd and telnetd are enabled
on boot up. He uses rrload to boot with the following as kernel
arguments:

`noinitrd console=ttyS0,115200n8 root=/dev/null rootflags=physaddr=0x00260000 ip=none init=/linuxrc`

-   (1457.9 KB) [XIP
    kernel](http://eLinux.org/images/5/51/Linux-2.4.20-xip.rr "Linux-2.4.20-xip.rr")
-   (1076 KB) [XIP
    filesystem](http://eLinux.org/images/9/9f/Xip.cramfs.rr "Xip.cramfs.rr")
-   (556 KB) [non-xip
    filesystem](http://eLinux.org/images/c/ce/Non-xip.cramfs.rr "Non-xip.cramfs.rr") (for
    comparison)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")

