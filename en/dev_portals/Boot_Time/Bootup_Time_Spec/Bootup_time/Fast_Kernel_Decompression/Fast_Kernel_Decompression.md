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
Startup](http://eLinux.org/DMA_Copy_Of_Kernel_On_Startup "DMA Copy Of Kernel On Startup")

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

Image file:

initrd-2.6.5-1.358

method

UCL

GZIP

improved %

parameter

-b4194304

-8

.

source file size

819200

819200

.

compressed size

187853

189447

.

compression rate

77.1%

76.9%

0.3%

compression time: user (sec)

5.13

2.03

-152.5%

sys (sec)

0.09

0.06

-36.5%

total (sec)

5.22

2.09

-149.0%

decompression time: user (sec)

0.12

0.3

59.7%

sys (sec)

0.1

0.08

-16.9%

total (sec)

0.22

0.39

43.0%

.

.

.

.

Image file:

vmlinux-2.4.20 for ibm-440gp

method

UCL

GZIP

improved %

parameter

-b4194304

-8

.

source file size

1810351

1810351

.

compressed size

790250

776807

.

compression rate

56.3%

57.1%

-1.3%

compression time: user (sec)

17.29

6.07

-185.0%

sys (sec)

0.04

0.02

-92.4%

total (sec)

17.33

6.09

-184.6%

decompression time: user (sec)

0.12

0.16

26.1%

sys (sec)

0.03

0.04

35.8%

total (sec)

0.15

0.2

28.2%

 Hardware 
PPC440GP - 300 MHZ

 Kernel Version 
Linux kernel running on target was 2.6.11, kernel which was compressed
with Linux 2.4.20

 Configuration 
See above tables for parameters to gzip and ucl

 Time without change 
[put that here]

 Time with change 
[put that here]

### Case 2

### Case 3


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

