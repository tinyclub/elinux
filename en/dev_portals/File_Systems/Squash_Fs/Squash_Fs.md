> From: [eLinux.org](http://eLinux.org/Squash_Fs "http://eLinux.org/Squash_Fs")


# Squash Fs



## Contents

-   [1 Description](#description)
-   [2 Rationale](#rationale)
-   [3 Resources](#resources)
    -   [3.1 Projects](#projects)
-   [4 Status/News](#status-news)
-   [5 Downloads](#downloads)
    -   [5.1 Patch](#patch)
    -   [5.2 Utility programs](#utility-programs)
-   [6 How To Use](#how-to-use)
-   [7 Sample Results](#sample-results)
    -   [7.1 Ubuntu liveCD compression
        results](#ubuntu-livecd-compression-results)
    -   [7.2 Damn Small Linux liveCD compression
        results](#damn-small-linux-livecd-compression-results)
    -   [7.3 File System Performance](#file-system-performance)
-   [8 LZMA](#lzma)
    -   [8.1 Availability](#availability)
    -   [8.2 mksquashfs instructions](#mksquashfs-instructions)
    -   [8.3 lzma data comparison](#lzma-data-comparison)
    -   [8.4 Notes on compression](#notes-on-compression)

## Description

"Squash FS" is the name of a compressed read-only filesystem for Linux.
There are a number of such file systems available for Linux, including
ROMFS, [CramFS](http://eLinux.org/File_Systems#CramFS "File Systems") and SquashFS.

## Rationale

A compressed file system is interesting in embedded systems for reducing
the overall size (in flash) of the Linux system. Squash FS is reported
to have better compression capabilities than CramFS, which is a very
popular.

## Resources

### Projects

The SquashFS home page is at: [Squash
FS](http://squashfs.sourceforge.net/)

## Status/News

SquashFS version 4.0 was accepted into the mainline kernel in January
2009. See
[http://lwn.net/Articles/314326/](http://lwn.net/Articles/314326/) and
the kernel change log at:
[http://kernel.org/pub/linux/kernel/v2.6/testing/ChangeLog-2.6.29-rc1](http://kernel.org/pub/linux/kernel/v2.6/testing/ChangeLog-2.6.29-rc1)

As of November 2009, Phillip Lougher was working on adding LZMA support
to the file system. See
[http://old.nabble.com/Re%3A-squashfs-4.0-lzma-support-td25132198.html\#a26028786](http://old.nabble.com/Re%3A-squashfs-4.0-lzma-support-td25132198.html#a26028786)

## Downloads

### Patch

-   See the Squash fs [download
    page](http://sourceforge.net/project/showfiles.php?group_id=63835)
    for patches

-   if you want LZMA support, read below



### Utility programs

The squashfs file release contains a README, the squashfs patch files,
and the squashfs-tools directory (mksquashfs). Please see the INSTALL
file for install instructions.

## How To Use

See the Squash FS Howto:

-   [online version](http://artemio.net/projects/linuxdoc/squashfs)
-   [Squash FS Howto](http://eLinux.org/Squash_FS_Howto "Squash FS Howto") page (copy of
    document in this wiki - may be out of date)

## Sample Results

Here are brief summaries for 2 large file systems, saved using a variety
of file system types.

This information was provided by Phillip Lougher.

### Ubuntu liveCD compression results

       ext3 uncompressed size      1.4 GB
       ISO9660 uncompressed size   1.3 GB
       Zisofs compressed size      589.81 MB
       Cloop compressed size       471.89 MB
       Squashfs2.0 compressed size 448.58 MB
       Squashfs2.1 compressed size 448.58 MB

### Damn Small Linux liveCD compression results

       ext3 uncompressed size      126 MB
       CRAMFS compressed size      52.19 MB
       Squashfs2.0 compressed size 46.52 MB
       Squashfs2.1 compressed size 46.52 MB

### File System Performance

There is performance data for these file systems on the page [Squash Fs
Comparisons](http://eLinux.org/Squash_Fs_Comparisons "Squash Fs Comparisons")

## LZMA

LZMA is the name of a compression algorithm that can be used to achieve
better compression with SquashFS.

Benefits of LZMA:

-   Better compression - easily saving 5% on a file system

Disadvantages:

-   Decompression is slower than zlib

### Availability

Up until Fall of 2009, support for the LZMA compression algorithm in
SquashFS was available via a set of external patches. See
[http://www.squashfs-lzma.org/](http://www.squashfs-lzma.org/)

In December of 2009, Phillip Lougher submitted some patches to LKML for
LZMA support in SquashFS. See
[http://lkml.org/lkml/2009/12/7/84](http://lkml.org/lkml/2009/12/7/84)



### mksquashfs instructions

(As of December, 2009...)

To obtain a mksquashfs that supports LZMA, see the Squashfs CVS
([http://sourceforge.net/projects/squashfs/develop](http://sourceforge.net/projects/squashfs/develop)).

You'll need to edit the squashfs-tools Makefile to enable LZMA support.
The comments in the Makefile should, hopefully, explain how to build
LZMA support into Mksquashfs/Unsquashfs.

Once built-in, LZMA support can be specified using the -comp lzma
option, i.e.

    mksquashfs dir dir.img -comp lzma

Unsquashfs doesn't need any extra options, it automatically detects
which compression has been used.

You can tell which compression algorithms Mksquashfs/Unsquashfs support
by just typing the command on its own (i.e. mksquashfs, or unsquashfs).
The (de-)compressors available are displayed at the end of the output.



### lzma data comparison

Here is some information that was posted recently (?) on the squashfs
mailing list by Oleg Vdovikin:

    > # du -s target
    > 7836    target
    > # ls -l target.*
    > -rw-r--r--  1 root     root 2842788 Aug 27 17:54 target.cramfs
    > -rwx------  1 root     root 2449408 Jan 26 13:19 target.sqshfs
    > -rwx------  1 root     root 2060288 Jan 26 13:21 target.lzmafs
    >
    >     So, lzma for this filesystem gives 84% of original size. For bigger
    > filesystem I've got 82%.



### Notes on compression

    From: John Richard Moser <nigele...@comcast.net>
    Date: Wed, 29 Sep 2004 18:20:11 +0200
    Subject: Re: Compressed filesystems: Better compression?

    Matti Aarnio wrote:
    | Compression algorithms are a bit tough to be used in a random access
    | smallish blocks environments. In long streams where you can use megabytes
    | worth of buffer spaces there is no problem is achieving good performance.
    | But do try to do that in an environment where your maximum block size
    | is, say: 4 kB, and you have to start afresh at every block boundary.

    Yes of course. I've seen the compressed page cache patch do this and
    get fair peformance (10-20%), though on double size blocks (8KiB) it
    manages almost twice as good (20-50%, averaged around 30% IIRC). Not
    great, but not bad.

    On compressed filesystems you can work with 64k or 128k blocks.
    Somewhere around 32-64k is usually optimal; you're not going to see
    great improvements using 1M blocks instead of 512k blocks.

    | Whatever algorithms you use, there will always be data sequences that
    | are of maximum entropy, and won't compress. Rather they will be
    | presented in streams as is with a few bytes long wrappers around
    | them.

    Yes, an intelligent algorithm decides that if the underlying compression
    algorithm used produces no results, it just marks the block as
    uncompressed and stores it as such. ZLIB does this if the block gets
    bigger. LZMA might not; but higher level intrinsics (block headers)
    could handle that easy (as you said).


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [File Systems](http://eLinux.org/Category:File_Systems "Category:File Systems")

