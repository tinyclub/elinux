> From: [eLinux.org](http://eLinux.org/AXFS "http://eLinux.org/AXFS")


# AXFS



## Contents

-   [1 Description](#description)
-   [2 Rationale](#rationale)
-   [3 Resources](#resources)
    -   [3.1 Project site and contacts](#project-site-and-contacts)
    -   [3.2 Documents](#documents)
-   [4 Specifications](#specifications)
-   [5 Downloads](#downloads)
    -   [5.1 Patch](#patch)
-   [6 Utility programs](#utility-programs)
-   [7 How To Use](#how-to-use)
-   [8 How to validate](#how-to-validate)
-   [9 Sample Results](#sample-results)
-   [10 Case Study 1](#case-study-1)
-   [11 Case Study 2](#case-study-2)
-   [12 Status](#status)
-   [13 Future Work/Action Items](#future-work-action-items)

## Description

The Advanced XIP File System is a Linux kernel filesystem driver that
enables files to be executed directly from flash or ROM memory rather
than being copied into RAM.

This project was started by engineers working at Intel. Since that the
key developers have moved over to [Numonyx](http://www.numonyx.com).
AXFS is intended to be a replacement for Linear XIP CRAMFS, and combines
features from CRAMFS and SquashFS. The advantage over existing solutions
is that it can provide reduced RAM with less flash because it is
possible to compress only those pages that contribute to RAM savings. It
includes tools to identify pages that should be uncompressed. It is Beta
quality as of July 2006.

## Rationale

This feature is important because XIP is a very common method of
conserving RAM on an embedded system.

Furthermore some boot time reduction can be achieved.

## Resources

### Project site and contacts

The main project site is at: [axfs](http://axfs.sourceforge.net)


 Those interested can send an email using the interface at [axfs
contact](http://axfs.sourceforge.net/wordpress/?page_id=3) and they will
be informed when the final version is released.

### Documents

-   [Poster (in powerpoint) describing
    AXFS](http://tree.celinuxforum.org/CelfPubWiki/ELC2007TechnicalShowcase?action=AttachFile&do=get&target=AXFS_Poster2.ppt)

-   [ELC 2006 Presentation on
    XIP](http://tree.celinuxforum.org/CelfPubWiki/ELC2006Presentations?action=AttachFile&do=get&target=CELF-XIP_Linux.pdf)
    by Jared Hulbert

-   [Demystifying Embedded Code Storage: Optimizing for Lower Cost and
    Higher Performance through Balanced
    XIP](http://www.intel.com/design/flcomp/papers/315482.pdf) - White
    paper by Intel comparing different XIP approaches

-   [Numonyx™ AXFS Technical
    Documents](http://www.numonyx.com/en-US/MemoryProducts/Software/Pages/AXFSTechnicalDocuments.aspx)
    - contains the users guide and the image builder guide

-   Talk *Advanced XIP filesystem* by Jared Hulbert at the Ottawa Linux
    Symposium 2008.
    [Paper](http://ols.fedoraproject.org/OLS/Reprints-2008/hulbert-reprint.pdf)
    and
    [video](http://free-electrons.com/pub/video/2008/ols/ols2008-jared-hulbert-xip-filesystem.ogg)

## Specifications

See [Kernel XIP Specification
R2](http://eLinux.org/Kernel_XIP_Specification_R2 "Kernel XIP Specification R2")

## Downloads

### Patch

See [http://axfs.sourceforge.net/](http://axfs.sourceforge.net/).

## Utility programs

There are two utility programs:

-   mkfs.axfs described
    [here](http://www.numonyx.com/Documents/User%20Guides/319097_AXFS_Main-UG.pdf)
    is a simple filesystem builder. It compresses using 4K blocks and
    accepts profile data in .csv format (and perhaps also in xml
    format). This differs from what is described in the document.
     The program generates a single image file with both the compressed
    and uncompressed data. Upon mounting the image the uncompressed XIP
    data are copied to RAM. This program is GPL.
-   A Numonyx proprietary image builder described
    [here](http://www.numonyx.com/Documents/User%20Guides/319096_SW_AXFS-ImageBuilder.pdf).
    Judging from the documentation (-c option) this builder provides
    larger pages (and hence better compression) similar to the larger
    pages that are used by SquashFS. Apparently it can also generate two
    output files (-b and -o options). I assume that way you get two
    images. One with the compressed data, one with the XIP data. That
    would allow e.g. putting the compressed data in NAND flash and the
    XIP data in NOR flash or RAM.

## How To Use

-   Download the patches from the svn archive as described on [this
    project page](http://axfs.sourceforge.net/wordpress/?page_id=5).
-   Apply the patches as described
    [here](http://axfs.sourceforge.net/wordpress/?page_id=19).
-   In the config file two new configuration options will show up. One
    is called CONFIG\_AXFS and includes the AXFS filesytem. The second
    one is called CONFIG\_AXFS\_PROFILING and enables the profiling. You
    need to enable both at first.
-   Make an axfs filesystem (using mkfs.axfs) and write that image to
    flash. (e.g. using nandwrite).
-   Boot your new kernel.
-   Run whatever applications (from the AFXS partition) you want to have
    in XIP. If you are interested in boot improvement these are
    typically the things run from init.
-   Internally AXFS records the page accesses. Once you ran all programs
    you want to have in XIP, you can copy /proc/axfs/volumeX to a file
    (where X is typically 0).
-   If desired you can remove things from the file. Note that the file
    consists of lines with a filename, an offset and a counter. This
    describes the page that is put in XIP. You'll notice that not all of
    the file is put in XIP. Only those pages that are actually called
    are put in the XIP section.
-   Use the file from the previous version as input for mkfs.axfs. This
    will generate a file with both XIP and non-XIP data (the former
    uncompressed, the latter compressed).
-   Write this file to flash, and use it. You'll see an increase in
    mount time, as the XIP data is copied to RAM at mount time. However
    the executables should start faster as no data need to be read from
    flash or copied in RAM. B.t.w. it is possible to have your root
    filesystem as axfs filesytem by using the kernel boot parameter
    "rootfstype=axfs".
-   To reduce size and increase performance rebuild the kernel with
    profiling (CONFIG\_AXFS\_PROFILING) turned off.

## How to validate

[put references to test plans, scripts, methods, etc. here]

## Sample Results

No sample results are available yet.

However from studying the documentation and knowing how XIP works, a
boot peformance gain can be expected when running from NOR flash. The
amount of gain cannot really be qualified because it depends on how
often the code is executed. E.g. consider an often executed loop in NOR.
The advantage with NOR flash and XIP is that you do not need to load the
page (so you save some time). However as NOR is slower there will be a
small penalty during every instruction executed from NOR. So if you have
a loop that is executed very often the cumulative penalty will exceed
the gain from not having to load the page. Of course if you know that
this is the case you can exclude this page from XIP.

mkfs.axfs does not support generating two separate images. Therefore in
the open source scenario the only way to test this is by putting both
the XIP and non-XIP data in NOR.

Alternatively it is possible to put the generated image in NAND. In that
case the XIP data is loaded during mounting. Effectively this does not
gain much. You only shift the reading from program execution to
mounting. Of course there can be a small saving since no in-memory
copying is needed. Benchmarks need to be performed to actually quantify
the gain.

With the proprietary image builder it seems possible to create two
images, one with XIP and one without XIP. This allows for situations
where the XIP data is in NOR and the non-XIP data is in NAND.
Alternately the XIP data could be in RAM and loaded by the boot loader.
It might be possible that this gives some gain (as the boot loader might
have less overhead reading a file than linux has). Again this need to be
benchmarked.

## Case Study 1

## Case Study 2

## Status

Jared Hulbert of Intel writes (in July 2006):

The filesystem is working well. We optimized an Opie Linux build using
cramfs and axfs. The resulting images where 49MB XIP cramfs, XIP axfs
used only 39MB, and 34MB for a fully compressed cramfs. We're polishing
it up for release hopefully in the next couple weeks. We are also
debugging a 2.4 port which we will make available as well.

In august 2008, the project submitted to LKML for the second time.
 On mid nov 2008, the project svn archive contained patches for 2.4.21
and 2.6.10 to 2.6.27.

-   Status: [not started??]
    -   (one of: not started, researched, implemented, measured,
        documented, accepted)
-   Architecture Support:
    -   (for each arch, one of: unknown, patches apply, compiles, runs,
        works, accepted)
        -   i386: unknown
        -   ARM: unknown
        -   PPC: unknown
        -   MIPS: mostly works (some open issues and more testing
            needed)
        -   SH: unknown

## Future Work/Action Items

Here is a list of things that could be worked on for this feature:

-   More testing/maturing
-   An improved open source mkfs.axfs that provides separate images and
    compression using larger blocks than 4K.
-   Benchmarking


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [File Systems](http://eLinux.org/Category:File_Systems "Category:File Systems")

