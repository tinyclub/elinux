> From: [eLinux.org](http://eLinux.org/Ramdisks_demasked "http://eLinux.org/Ramdisks_demasked")


# Ramdisks demasked



## Contents

-   [1 Ramdisks demasked](#ramdisks-demasked)
    -   [1.1 Introduction](#introduction)
    -   [1.2 How ram disks are used](#how-ram-disks-are-used)
    -   [1.3 Why is there no performance
        gain?](#why-is-there-no-performance-gain-3f)
    -   [1.4 But is there no situation when a ram disk will give a
        gain?](#but-is-there-no-situation-when-a-ram-disk-will-give-a-gain-3f)
    -   [1.5 But what about initramfs?](#but-what-about-initramfs-3f)
    -   [1.6 So ram disks are useless?](#so-ram-disks-are-useless-3f)

# Ramdisks demasked

## Introduction

When a system does not boot as quickly as expected, people sometimes
revert to using a populated ram disk. The idea is that a ram disk
resides in RAM, and hence is faster than a flash file system (which is
correct). However, in the end no performance gain occurs. This page
described why this happens and why in general a ram disk is not a good
idea.

## How ram disks are used

The standard way to use a populated ram disk is to make a ram disk
image, load it to memory using the boot loader (e.g. using a grub initrd
line in menu.lst) and tell the kernel to use the ram disk (by means of
the initrd= and root=/dev/ram0 kernel parameter).

## Why is there no performance gain?

This is simple. The ramdisk need to be loaded from flash memory. This
takes time. After that there is indeed a speedup because you do not need
to access the flash any more. However, the gain from this speedup hardly
ever recoups the time needed to load the flash disk in the first place.

Reason for this is that if there is no ram disk only those parts of an
executable that are really needed are read from the background memory.
Unit of transfer is a page (typically 4K or 8K). So if you were using
only a few functions from e.g. glibc only those pages are loaded, not
the full glibc (which might be around 1MB).
 However in case of a ram disk, the whole glibc needs to be loaded. It
is easy to see that loading a whole file (as done in the ram disk case)
takes more time than reading the pages that you need (as is the case in
the non ramk disk case).

Now you might reason that pages might be read multiple times, which
contribues to the gain. Technically you are right. Rereading the same
page several times will cause some saving (although it still can be
argued if this is enough to recover the ram disk load time). However
lets look a little bit deeper:
 If a page is reread it has been dropped from the buffer cache. This
means that the kernel is running out of buffer space. If that is the
problem then a ram disk is not going to be the solution! Better use no
ram disk and give that memory to the kernel, who will most likely be
able to use it in a more efficient manner.

## But is there no situation when a ram disk will give a gain?

Of course there are. I can think of the following situations:

-   If most or all pages of your ram disk are used, especially if your
    boot loader is faster reading the ram disk than the kernel is (this
    could be related to compression and/or to less read overhead).
-   If the source of the ram disk might disappear (e.g. if the ram file
    system resides on the network or on a removable disk that may be
    removed).
-   If execution start time is more important than boot time (then it
    helps if glibc and friends are in RAM). (this might also be the case
    if your ramfs is e.g. read over the network).

## But what about initramfs?

initramfs has the same inherent problems. It does a little bit better
job because it copies the data to the buffer cache. After that the
memory occupied by the initramfs image is released. However, still it
reads more than needed.

## So ram disks are useless?

No, not at all. Having populated ram disk and use them as root
filesystem is often not very meaningful. However a ram disk or ramfs
device which is used to store temporary data can be very useful. It is a
lot faster to write a 1MB temp file to RAM than it is to write it to
flash.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")

