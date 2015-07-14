> From: [eLinux.org](http://eLinux.org/Fast_Kernel_Decompression "http://eLinux.org/Fast_Kernel_Decompression")


# Fast Kernel Decompression



This page has notes about faster kernel decompression.

## Contents

-   [1 Description](#description)
-   [2 How to implement or use](#how-to-implement-or-use)
-   [3 Expected Improvement](#expected-improvement)
-   [4 Resources](#resources)
    -   [4.1 Projects](#projects)
-   [5 Case Studies](#case-studies)
    -   [5.1 Case 1](#case-1)
    -   [5.2 Case 2](#case-2)
    -   [5.3 Case 3](#case-3)

## Description

Currently, the method used to compress the kernel is gzip. However,
other compression and decompression methods exist which may allow
improvements in kernel decompression (and hence startup) performance.

This page documents Sony's investigation of UCL
compression/decompression performance, for possible use in speeding up
bootup time on an embedded device. In our testing UCL decompressed a
sample file system image 43% faster than gunzip, and a sample kernel
image 28% faster than gunzip.

From the UCL web page, it states:

-   UCL is written in ANSI C. Both the source code and the compressed
    data format are designed to be portable across platforms.

-   UCL implements a number of algorithms with the following features:
    -   Decompression is simple and \*very\* fast.
    -   Requires no memory for decompression.
    -   The decompressors can be squeezed into less than 200 bytes of
        code.
    -   Focuses on compression levels for generating pre-compressed data
        which achieve a quite competitive compression ratio.
    -   Allows you to dial up extra compression at a speed cost in the
        compressor. The speed of the decompressor is not reduced.
    -   Algorithm is thread safe.
    -   Algorithm is lossless.

-   UCL supports in-place decompression.
-   UCL and the UCL algorithms and implementations are distributed under
    the terms of the GNU General Public License (GPL) { auf Deutsch }.
    Special licenses for commercial and other applications are available
    by contacting the author.

Another method of speeding up the kernel load phase of bootup is to use
[DMA Copy Of Kernel On
Startup](../../.././dev_portals/Boot_Time/DMA_Copy_Of_Kernel_On_Startup/DMA_Copy_Of_Kernel_On_Startup.md "DMA Copy Of Kernel On Startup")

## How to implement or use

Get UCL from following URL and use sample command "uclpack"

       http://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz

untar the file, build , and use the sample command "uclpack", located
at: ucl-1.03/examples/uclpack in the untar'ed source tree.

## Expected Improvement

The case study below is intended to show a performance improvement in
decompressing a sample file system and sample kernel.

## Resources

-   UCL can be obtained at:
    [http://www.oberhumer.com/opensource/ucl/](http://www.oberhumer.com/opensource/ucl/)



### Projects

-   lzop ( [http://www.lzop.org/](http://www.lzop.org/) [Wikipedia:
    lzop](http://en.wikipedia.org/wiki/lzop) ) uses the miniLZO
    Lempel-Ziv-Oberhumer ( [Wikipedia:
    LZO](http://en.wikipedia.org/wiki/Lempel-Ziv-Oberhumer) ) algorithm.
    It has the reputation of extremely fast decompression and a tiny
    decompressor, but larger compressed files -- apparently faster
    decompression and better compressed file size than Lempel-Ziv Ross
    Williams ( [Wikipedia: LZRW](http://en.wikipedia.org/wiki/LZRW) ) --
    faster than memcopy() on some machines.
-   UPX: the the Ultimate Packer for eXecutables ( [Wikipedia:
    UPX](http://en.wikipedia.org/wiki/UPX) ;
    [http://upx.sf.net/](http://upx.sf.net/) ) uses the UCL algorithm
-   gzip ( [Wikipedia: gzip](http://en.wikipedia.org/wiki/gzip) )
-   bzip2 ( [Wikipedia: bzip2](http://en.wikipedia.org/wiki/bzip2) ;
    [http://www.bzip.org/](http://www.bzip.org/) ) has the reputation of
    giving smaller compressed files and about the same decompression
    time as gzip (but longer compression times)

[Are there other compressors with better decompression performance than
gzip??

## Case Studies

### Case 1

For this use case, we compiled both uclpack and gzip for the
[PowerPC](http://eLinux.org/PowerPC "PowerPC") platform. Then we ran the programs on the
target platform, compressing and decompressing two different file images
- an initrd filesystem image, and a linux kernel image (originally
uncompressed).

The size and performance results from running these commands are in the
tables below.

<table border="1" cellspacing="0">

<tr>
<td>  Image file:
</td>
<td>  initrd-2.6.5-1.358
</td></tr>
<tr>
<td>  method
</td>
<td>  UCL
</td>
<td>  GZIP
</td>
<td>  improved&#160;%
</td></tr>
<tr>
<td>  parameter
</td>
<td>  -b4194304
</td>
<td>  -8
</td>
<td>  .
</td></tr>
<tr>
<td>  source file size
</td>
<td>  819200
</td>
<td>  819200
</td>
<td>  .
</td></tr>
<tr>
<td>  compressed size
</td>
<td>  187853
</td>
<td>  189447
</td>
<td>  .
</td></tr>
<tr>
<td>  compression rate
</td>
<td>  77.1%
</td>
<td>  76.9%
</td>
<td>  0.3%
</td></tr>
<tr>
<td>  compression time: user (sec)
</td>
<td>  5.13
</td>
<td>  2.03
</td>
<td>  -152.5%
</td></tr>
<tr>
<td>  sys (sec)
</td>
<td>  0.09
</td>
<td>  0.06
</td>
<td>  -36.5%
</td></tr>
<tr>
<td>  total (sec)
</td>
<td>  5.22
</td>
<td>  2.09
</td>
<td>  -149.0%
</td></tr>
<tr>
<td>  decompression    time: user (sec)
</td>
<td>  0.12
</td>
<td>  0.3
</td>
<td>  59.7%
</td></tr>
<tr>
<td>  sys (sec)
</td>
<td>  0.1
</td>
<td>  0.08
</td>
<td>  -16.9%
</td></tr>
<tr>
<td>  total (sec)
</td>
<td>  0.22
</td>
<td>  0.39
</td>
<td bgcolor="#ffc0c0"> 43.0%
</td></tr>
<tr>
<td>.</td>
<td>.</td>
<td>.</td>
<td>.
</td></tr>
<tr>
<td>  Image file:
</td>
<td>  vmlinux-2.4.20 for ibm-440gp
</td></tr>
<tr>
<td>  method
</td>
<td>  UCL
</td>
<td>  GZIP
</td>
<td>  improved&#160;%
</td></tr>
<tr>
<td>  parameter
</td>
<td>  -b4194304
</td>
<td>  -8
</td>
<td>  .
</td></tr>
<tr>
<td>  source file size
</td>
<td>  1810351
</td>
<td>  1810351
</td>
<td>  .
</td></tr>
<tr>
<td>  compressed size
</td>
<td>  790250
</td>
<td>  776807
</td>
<td>  .
</td></tr>
<tr>
<td>  compression rate
</td>
<td>  56.3%
</td>
<td>  57.1%
</td>
<td>  -1.3%
</td></tr>
<tr>
<td>  compression time: user (sec)
</td>
<td>  17.29
</td>
<td>  6.07
</td>
<td>  -185.0%
</td></tr>
<tr>
<td>  sys (sec)
</td>
<td>  0.04
</td>
<td>  0.02
</td>
<td>  -92.4%
</td></tr>
<tr>
<td>  total (sec)
</td>
<td>  17.33
</td>
<td>  6.09
</td>
<td>  -184.6%
</td></tr>
<tr>
<td>  decompression    time: user (sec)
</td>
<td>  0.12
</td>
<td>  0.16
</td>
<td>  26.1%
</td></tr>
<tr>
<td>  sys (sec)
</td>
<td>  0.03
</td>
<td>  0.04
</td>
<td>  35.8%
</td></tr>
<tr>
<td>  total (sec)
</td>
<td>  0.15
</td>
<td>  0.2
</td>
<td bgcolor="#ffc0c0"> 28.2%
</td></tr></table>

<dl><dt>  Hardware&#160;</dt>
<dd> PPC440GP - 300 MHZ</dd></dl>
<dl><dt>  Kernel Version&#160;</dt>
<dd> Linux kernel running on target was 2.6.11, kernel which was compressed with Linux 2.4.20</dd></dl>
<dl><dt>  Configuration&#160;</dt>
<dd> See above tables for parameters to gzip and ucl</dd></dl>
<dl><dt>  Time without change&#160;</dt>
<dd> [put that here]</dd></dl>
<dl><dt>  Time with change&#160;</dt>
<dd> [put that here]</dd></dl>

### Case 2

### Case 3


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

