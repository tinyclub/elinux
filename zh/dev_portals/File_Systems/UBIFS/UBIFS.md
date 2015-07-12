> From: [eLinux.org](http://eLinux.org/UBIFS "http://eLinux.org/UBIFS")


# UBIFS



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 History](#history)
    -   [1.2 Features](#features)
    -   [1.3 Fastmap support](#fastmap-support)
-   [2 UBIFS vs. YAFFS2 comparisons for
    2.6.31.1](#ubifs-vs-yaffs2-comparisons-for-2.6.31-1)
-   [3 Creating UBI Image](#creating-ubi-image)
-   [4 Mounting UBI Image on PC using
    nandsim](#mounting-ubi-image-on-pc-using-nandsim)

## Introduction

UBIFS is a filesystem that works on top of
[UBI](http://elinux.org/File_Systems#UBI) volumes

-   the UBIFS home page is at:
    [http://www.linux-mtd.infradead.org/doc/ubifs.html](http://www.linux-mtd.infradead.org/doc/ubifs.html)
-   UBIFS presentation slides:
    [ubifs.odp](http://www.linux-mtd.infradead.org/doc/ubifs.odp)

It represents a next-generation flash filesystem, compared to JFFS2, and
(via UBI) operates on raw flash rather than on block-based media (such
as eMMC or traditional hard drives).

### History

UBIFS was written by developers at Nokia with help from the University
of Szeged. Included in these developers was the current (as of 2012)
maintainer of UBIFS, Artem Bityuski. The filesystem was mainlined in the
Linux kernel in July, 2008, in kernel version 2.6.27.

### Features

The [UBIFS home page](http://www.linux-mtd.infradead.org/doc/ubifs.html)
has more detailed information, but in summary, UBI has the following
features relative to other flash filesystems:

-   UBI/UBIFS scales to large flash sizes better than JFFS2
-   Good fault tolerance, via a number of features
-   Built-in on-the-fly compression
-   Good runtime performance

### Fastmap support

As of kernel version 3.7, UBI fastmap support was added to the kernel,
to overcome a scalability issue with the time required to mount UBIFS on
large flash media.

I specifically deals with the scalability issue described here:
[http://www.linux-mtd.infradead.org/doc/ubifs.html\#L\_scalability](http://www.linux-mtd.infradead.org/doc/ubifs.html#L_scalability)


 A description of the feature is at:
[http://lwn.net/Articles/517422/](http://lwn.net/Articles/517422/)

    "UBI Fastmap is an optional feature which stores the physical to
    logical eraseblock relations in a checkpoint (called fastmap) to reduce
    the initialization time of UBI. The current init time of UBI is
    proportional to the number of physical erase blocks on the FLASH
    device. With fastmap enabled the scan time is limited to a fixed
    number of blocks."

## UBIFS vs. YAFFS2 comparisons for 2.6.31.1

Note: see our
[Flash\_Filesystem\_Benchmarks](http://eLinux.org/Flash_Filesystem_Benchmarks "Flash Filesystem Benchmarks")
for more recent benchmarks.

Hardware: MIPS, 403MHz CPU, 1GB Nand Flash

IOZone results: 4M, 8M & 16M file sizes in 980MB partition.

-   mount time
    -   "1st mount" : time for mounting just after "flash\_eraseall".
    -   "Empty" : time for mounting after "1st mount".(there's no files
        in partition)
    -   "Full" : time for mounting after creating files util the
        partition is full.(file size is random.)
    -   "Ubiattach" time for attaching 980MB partition into the ubi
        layer using ubiattach util.

<table>
<thead>
<tr class="header">
<th align="left"></th>
<th align="left">Ubiattach</th>
<th align="left">Ubifs</th>
<th align="left">Yaffs2</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1st mount</td>
<td align="left">2.59 sec</td>
<td align="left">0.17 sec</td>
<td align="left">2.25 sec</td>
</tr>
<tr class="even">
<td align="left">Empty</td>
<td align="left">2.57 sec</td>
<td align="left">0.11 sec</td>
<td align="left">0.03 sec</td>
</tr>
<tr class="odd">
<td align="left">Full</td>
<td align="left">2.63 sec</td>
<td align="left">0.16 sec</td>
<td align="left">0.80 sec</td>
</tr>
</tbody>
</table>



-   IOZone results

<table>
<caption> UBIFS compared to YAFFS2 (file size = 4MB) </caption>
<thead>
<tr class="header">
<th align="left">4M</th>
<th align="left">write</th>
<th align="left">rewrite</th>
<th align="left">read</th>
<th align="left">reread</th>
<th align="left">r.read</th>
<th align="left">r.write</th>
<th align="left">b.read</th>
<th align="left">r.rewrite</th>
<th align="left">s.read</th>
<th align="left">fwrite</th>
<th align="left">frewrite</th>
<th align="left">fread</th>
<th align="left">freread</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">yaffs2</td>
<td align="left">1538</td>
<td align="left">1527</td>
<td align="left">296962</td>
<td align="left">297696</td>
<td align="left">297825</td>
<td align="left">1521</td>
<td align="left">296876</td>
<td align="left">1526</td>
<td align="left">295164</td>
<td align="left">1536</td>
<td align="left">1524</td>
<td align="left">297436</td>
<td align="left">299021</td>
</tr>
<tr class="even">
<td align="left">ubifs</td>
<td align="left">19913</td>
<td align="left">20989</td>
<td align="left">298346</td>
<td align="left">297631</td>
<td align="left">299809</td>
<td align="left">20968</td>
<td align="left">298368</td>
<td align="left">20181</td>
<td align="left">299458</td>
<td align="left">20471</td>
<td align="left">20962</td>
<td align="left">297371</td>
<td align="left">297760</td>
</tr>
<tr class="odd">
<td align="left">ubifs/yaffs2</td>
<td align="left">12.95</td>
<td align="left">13.75</td>
<td align="left">1.00</td>
<td align="left">1.00</td>
<td align="left">1.01</td>
<td align="left">13.79</td>
<td align="left">1.01</td>
<td align="left">13.22</td>
<td align="left">1.01</td>
<td align="left">13.33</td>
<td align="left">13.75</td>
<td align="left">1.00</td>
<td align="left">1.00</td>
</tr>
</tbody>
</table>

<table>
<caption> UBIFS compared to YAFFS2 (file size = 16MB) </caption>
<thead>
<tr class="header">
<th align="left">16M</th>
<th align="left">write</th>
<th align="left">rewrite</th>
<th align="left">read</th>
<th align="left">reread</th>
<th align="left">r.read</th>
<th align="left">r.write</th>
<th align="left">b.read</th>
<th align="left">r.rewrite</th>
<th align="left">s.read</th>
<th align="left">fwrite</th>
<th align="left">frewrite</th>
<th align="left">fread</th>
<th align="left">freread</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">yaffs2</td>
<td align="left">1538</td>
<td align="left">1523</td>
<td align="left">297199</td>
<td align="left">298525</td>
<td align="left">298896</td>
<td align="left">1528</td>
<td align="left">298433</td>
<td align="left">1525</td>
<td align="left">298847</td>
<td align="left">1538</td>
<td align="left">1525</td>
<td align="left">299661</td>
<td align="left">300656</td>
</tr>
<tr class="even">
<td align="left">ubifs</td>
<td align="left">20501</td>
<td align="left">20656</td>
<td align="left">298272</td>
<td align="left">299109</td>
<td align="left">299032</td>
<td align="left">20521</td>
<td align="left">298417</td>
<td align="left">20710</td>
<td align="left">298923</td>
<td align="left">20448</td>
<td align="left">20521</td>
<td align="left">298259</td>
<td align="left">299267</td>
</tr>
<tr class="odd">
<td align="left">ubifs/yaffs2</td>
<td align="left">13.33</td>
<td align="left">13.56</td>
<td align="left">1.00</td>
<td align="left">1.00</td>
<td align="left">1.00</td>
<td align="left">13.43</td>
<td align="left">1.00</td>
<td align="left">13.58</td>
<td align="left">1.00</td>
<td align="left">13.30</td>
<td align="left">13.46</td>
<td align="left">1.00</td>
<td align="left">1.00</td>
</tr>
</tbody>
</table>

<table>
<caption> UBIFS compared to YAFFS2 (file size = 32MB) </caption>
<thead>
<tr class="header">
<th align="left">32M</th>
<th align="left">write</th>
<th align="left">rewrite</th>
<th align="left">read</th>
<th align="left">reread</th>
<th align="left">r.read</th>
<th align="left">r.write</th>
<th align="left">b.read</th>
<th align="left">r.rewrite</th>
<th align="left">s.read</th>
<th align="left">fwrite</th>
<th align="left">frewrite</th>
<th align="left">fread</th>
<th align="left">freread</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">yaffs2</td>
<td align="left">1539</td>
<td align="left">1525</td>
<td align="left">296537</td>
<td align="left">297204</td>
<td align="left">297253</td>
<td align="left">1527</td>
<td align="left">297177</td>
<td align="left">1527</td>
<td align="left">296583</td>
<td align="left">1531</td>
<td align="left">1523</td>
<td align="left">296537</td>
<td align="left">297463</td>
</tr>
<tr class="even">
<td align="left">ubifs</td>
<td align="left">20474</td>
<td align="left">20611</td>
<td align="left">296765</td>
<td align="left">297490</td>
<td align="left">297334</td>
<td align="left">20659</td>
<td align="left">296972</td>
<td align="left">38416</td>
<td align="left">297371</td>
<td align="left">19068</td>
<td align="left">20059</td>
<td align="left">296618</td>
<td align="left">296658</td>
</tr>
<tr class="odd">
<td align="left">ubifs/yaffs2</td>
<td align="left">13.30</td>
<td align="left">13.52</td>
<td align="left">1.00</td>
<td align="left">1.00</td>
<td align="left">1.00</td>
<td align="left">13.53</td>
<td align="left">1.00</td>
<td align="left">25.16</td>
<td align="left">1.00</td>
<td align="left">12.45</td>
<td align="left">13.17</td>
<td align="left">1.00</td>
<td align="left">1.00</td>
</tr>
</tbody>
</table>

## Creating UBI Image

This is easiest to do, if you have access to the device and can run
ubinfo and dmesg, otherwise you'll need to determine the volume size,
Logical Erase Block size, etc by other means. UBI has some block
overhead, which I found documentation inconsistent with my particular
application, so your results may very. If your device is one UBI image
for the entire NAND, this should be easier, and could probably be
determined by just mounting a copy of the UBI image from the device if
available.

To create the image from a rootfs you've built first you need to create
the ubi.ini file, that describes your ubi image. Create a regular text
file, ubi.ini, example contents, for more info run ubinize -h:

    [ubi_rfs]
    mode=ubi
    image=ubifs.img
    vol_id=0
    vol_size=87349248
    vol_type=dynamic
    vol_name=ubi_rfs
    vol_alignment=1
    vol_flags=autoresize

Next you'll run the commands that actually build it. Here ubi.ini is the
file you just created, ubifs.img is a temp file you can delete once you
are done, and your\_erootfs.ubi is the name of the rootfs image that
will be created.

    sudo /usr/sbin/mkfs.ubifs -m 2048 -e 129024 -c 677 -r /path/to/rootfs ubifs.img
    sudo /usr/sbin/ubinize -o your_erootfs.ubi -p 131072 -m 2048 -s 512 -O 512 ubi.ini

To determine these and the ubi.ini file settings, use ubinfo -a and
dmesg on the device if possible, which both give plenty of information
about the values needed. The size and vol\_name are listed under
"Present volumes" when you run ubinfo -a on the device. The second half
of that particular ubi device's description. While the NAND
description's PEB, LEB etc are in dmesg.

mkfs.ubifs

-   -m - Minimum I/O unit size.
-   -e - Logical Erase Block (LEB) size.
-   -c - Max LEB count. (vol\_size/LEB)
-   -x - Compression type: lzo (default), favor\_lzo, zlib, none
-   -r - Path to root filesystem.
-   ubifs.img - Temporary image file.

ubinize

-   -o - Output file.
-   -p - Physical Erase Block (PEB) size.
-   -m - Minimum I/O unit size.
-   -s - Minimum I/O size for UBI headers, eg. sub-page size.
-   -O - VID header offset from start of PEB.
-   ubi.ini - UBI image configuration file.

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


