> From: [eLinux.org](http://eLinux.org/About_Compression "http://eLinux.org/About_Compression")


# About Compression



## Contents

-   [1 About Compression](#about-compression)
    -   [1.1 Introduction](#introduction)
    -   [1.2 Effects of compression (general
        discussion)](#effects-of-compression-general-discussion)
        -   [1.2.1 Space impact](#space-impact)
        -   [1.2.2 Performance impact](#performance-impact)
    -   [1.3 Where compression may be
        applied](#where-compression-may-be-applied)
    -   [1.4 Initramfs compression](#initramfs-compression)
    -   [1.5 Kernel compression](#kernel-compression)
    -   [1.6 Filesystem compression](#filesystem-compression)
    -   [1.7 Concluding remarks](#concluding-remarks)

# About Compression

## Introduction

This page discussed compression in relation to boot and load time.
 First we explain the effects of compression on the system in general.
 Next we discuss where compression may be applied.
 After that we will discuss the alternatives and go into detail whether
they are worthwhile or not.

## Effects of compression (general discussion)

### Space impact

Generally compression will cause that less space is needed. Typically a
piece of data that is compressed becomes smaller. Note though that this
is not always the case. If you compress something which is already
compressed there is probably nothing to gain, and in most cases you'll
lose a little bit, because the compressor itself adds info for
decompression. Compressing audio or video files (like mp3, DivX or jpeg
files) also will yield little space reduction as these data files are
internally already highly compressed.

The amount of compression also depends on the compression algorithm and
the options that are applied.

### Performance impact

Of course compression also has a performance impact. At first sight it
may seem that the impact is negative, as additional time is needed to
compress/decompress the data. However experiments may yield otherwise.

 Consider the following situation. You have a 2 MB linux kernel.
Compression will reduce that kernel to 1 MB. Now suppose you store the
kernel in flash which has a read speed of 20 MB/s. In case of an
uncompressed kernel, 100 ms will be needed to read the kernel from flash
to RAM. However if the kernel is compressed, the actual I/O activity
will only take 50 ms. So if decompressing 1MB takes less than 50 ms
(decompression speed \> 40 MB/s) you gain some time.

So whether or not compression affects your performance positive or
negative depends on factors like read speed and decompression speed.

Of course it is not as simple as this. If reading is done through DMA
and your system is CPU constrained compression will cause performance
degradation. This is because reading using DMA is almost free as far as
the CPU is concerned, and the decompression additionally loads the CPU
(which was already the bottleneck).

## Where compression may be applied

There are a number of places where compression can be applied in Linux:

-   If you use an initramfs in the kernel by default this initramfs is
    compressed.
-   The kernel itself often is also compressed. (hint: if your kernel
    name is vmlinuz or bzImage it is most likely a compressed kernel, if
    your kernel name is vmlinux it is probably not compressed; if you
    want to make sure: **file** is your friend here.
-   The filesystem itself can also apply compression. This is often the
    case with flash file systems. Notably SquashFS, CRAMFS and JFFS2 use
    filesystem compression.
-   Compression of executables, application data and the like. This is
    outside the scope of this page and not covered.

## Initramfs compression

Initramfs in most cases is compressed. If you specify an initramfs file
system while building the kernel, the initramfs image will be compressed
and embedded into the kernel image. It is not required to compress the
image, but there is no CONFIG option to disable this. The build scripts
always perform the compression, and only if you tweak the script you can
avoid the compression.

Another way to specify an initramfs is through the initrd= boot line
parameter. In that case it is totally up to you whether or not you use a
compressed or uncompressed cpio archive.

Now is initramfs compression useful? Well the first answer depends on
load time versus decompress time as explained before. However, if you
are using a compressed kernel and an embedded initramfs image,
compression is useless as you compress the data twice. First as
initramfs image and later a second time when the kernel is compressed.
This is not giving additional benefit and only wastes CPU time.

Despite the arguments above though, there is one case where a compressed
initramfs image in a compressed kernel is meaningful. That is if you are
low on RAM. A compressed initramfs requires less RAM so it might well be
that a compressed image fits whereas an uncompressed image does not fit.
Note though that this only applies to RAM usage during boot. When the
bootstrapping is completed and the kernel is started the space taken up
by the initramfs image is released.

## Kernel compression

For kernel compression the general arguments hold. However note that
kernel decompression is done by the boot loader. This means that factors
like read speed and decompression performance depend on the
implementation of the boot loader and not on the implementation in the
kernel. As these normally differ decompression speed here might differ
from the decompression done in the kernel for initramfs.

## Filesystem compression

The underlying filesystem can also provide compression. So you could in
theory have a compressed initramfs in a compressed kernel which reside
in a compressed filesystem. Not desirable at all. If your filesystem
uses compression you probably do not want to compress kernel or
initramfs.
 Then again this is probably not likely. Most boot loaders seem to load
the kernel directly from flash or from an uncompressed filesystem.

## Concluding remarks

-   Take care to avoid nested compression
-   When deciding whether to apply compression or not, make sure to
    benchmark both alternatives


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")

