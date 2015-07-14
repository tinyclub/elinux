> From: [eLinux.org](http://eLinux.org/Application_Init_Optimizations "http://eLinux.org/Application_Init_Optimizations")


# Application Init Optimizations



## Contents

-   [1 Description](#description)
-   [2 Rationale](#rationale)
-   [3 Application Tuning](#application-tuning)
    -   [3.1 Using mmap() instead of read() for initial application data
        load](#using-mmap-instead-of-read-for-initial-application-data-load)
    -   [3.2 Customizing file cache control in the
        Kernel](#customizing-file-cache-control-in-the-kernel)
    -   [3.3 Eliminating redundant page
        copies](#eliminating-redundant-page-copies)
    -   [3.4 Reducing page faults](#reducing-page-faults)
    -   [3.5 Controlling API](#controlling-api)
-   [4 Resources](#resources)
    -   [4.1 Projects](#projects)
-   [5 Specifications](#specifications)
-   [6 Downloads](#downloads)
    -   [6.1 Patch](#patch)
-   [7 Sample Results](#sample-results)
    -   [7.1 Case Study 1](#case-study-1)
    -   [7.2 Case Study 2](#case-study-2)
-   [8 Future Work/Action Items](#future-work-action-items)
-   [9 Other resource](#other-resource)

## Description

This page describes optimizations to a large application and to the
kernel, to shorten the time required to load and execute an application.

Two main techniques are described here: 1) use of mmap vs. read and 2)
control over page mapping characteristics. These techniques are
discussed below.

## Rationale

Kernel bootup time is drastically improved with recent efforts including
CELF activities. As a next step, application bootup time should be
considered to cut down the system total bootup time. The techniques
described here are applicable to a large number of embedded systems,
which consist of large, single-application programs.

## Application Tuning

### Using mmap() instead of read() for initial application data load

An application may load a large amount of data when it is first
initialized. This can result in a long delay as the file data is read
into memory. It is possible to avoid the initial cost of this read, by
using mmap() instead of read().

Instead of loading all of the data into memory with the read system
call, the file can be mapped into memory with the mmap system call. Once
the data file is mapped, individual pages will be demand loaded during
execution, when the application reads them. Depending on the initial
working set size of the data in the file, this can result in significant
time savings. (For example, if an application only initially uses 50% of
the data from the file, then only 50% of the data will be read into
memory from persistent storage. There is extra overhead due to the cost
of page-faults incurred in loading the pages on demand. However, this
page fault overhead is offset by the savings in the number of page reads
(compared to the read() case).

### Customizing file cache control in the Kernel

To further improve this method, the kernel can be modified to reduce
page copying and page faults.

### Eliminating redundant page copies

When pages are demand loaded to a memory-mapped file, the pages are kept
in memory as part of the kernel “file cache” and mapped into the
requesting process's address space. If the page is accessed via a write
operation, then the page in the file system cache is copied to a newly
allocated memory page. (This is referred to as "copy-on-write"). The
copied page can be then be freely modified by the process which maps it.

Suppose, however, that a file is mapped or accessed by only one process.
Then, copying the page is redundant. In this case, we can convert the
page in the file cache to a private page immediately. By utilizing this
assumption (only one user for the page), the cost of the copy can be
eliminated. This has the side benefit of reducing memory consumption as
well.

### Reducing page faults

In some cases, an individual page in the process address space is
accessed first with a read operation, then with a write operation. This
results in two page faults for the same page (one to load the page and
move it "through" the file cache, and the other to get a local copy of
the page.) By eliminating the page copy, and making the page private on
the first access (whether read or write), the second page fault can be
reduced.

### Controlling API

The current system is experimental, in the way it manages the files
affected by this caching/virtual memory customization. It would be
better to control this mechanism per file or virtual memory area. The
fcntl system call or mmap system call are candidates where this control
could be introduced.

## Resources

### Projects

None.

## Specifications

[Boot Time](http://eLinux.org/Boot_Time "Boot Time")

## Downloads

### Patch

Sorry but there is no available patch at this time.

## Sample Results

### Case Study 1

**Hardware'**

-   [Towa Meccs
    TMM1000](http://www.towanet.com/seihin/sh_board/index.html)

-   SH3(7709) 133MHz
-   32MB RAM
-   64MB CF memory

**Software** **Kernel**

-   2.4.27 kernel.

**Target application**

-   [intent](http://tao-group.com/)
-   Loading data size: 8MB

**Methods explanation**

1.  read(CF/ext3) The data file is loaded using read system call from a
    ext3 file system on a CompactFlash memory.
2.  mmap(CF/ext3) The data file is mapped to the process virtual space
    using mmap system call.
3.  takeover(CF/ext3) The data file is mapped and the page in the file
    system cache (which is created during page fault handling) is
    converted to private page immediately.
4.  takeover(CF/squash) Same as No.3 except using the SquashFS file
    system.
5.  takeover(RD/squash) Same as No.3 except the file system is on read
    from a RAM Disk instead of Compact Flash.

**Results**

<table>
<thead>
<tr class="header">
<th align="left"><strong>No.</strong></th>
<th align="left"><strong>Method</strong></th>
<th align="left"><strong>Media</strong></th>
<th align="left"><strong>FS</strong></th>
<th align="left"><strong>Ave.</strong></th>
<th align="left"><strong>1st</strong></th>
<th align="left"><strong>2nd</strong></th>
<th align="left"><strong>3rd</strong></th>
<th align="left"><strong>Diff.</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left">read</td>
<td align="left">CF</td>
<td align="left">ext3</td>
<td align="left"><strong>4.420</strong></td>
<td align="left">4.418</td>
<td align="left">4.420</td>
<td align="left">4.421</td>
<td align="left">-</td>
</tr>
<tr class="even">
<td align="left">2</td>
<td align="left">mmap</td>
<td align="left">CF</td>
<td align="left">ext3</td>
<td align="left"><strong>3.995</strong></td>
<td align="left">3.995</td>
<td align="left">3.995</td>
<td align="left">3.996</td>
<td align="left">-0.424</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left">takeover</td>
<td align="left">CF</td>
<td align="left">ext3</td>
<td align="left"><strong>3.959</strong></td>
<td align="left">3.959</td>
<td align="left">3.958</td>
<td align="left">3.966</td>
<td align="left">-0.461</td>
</tr>
<tr class="even">
<td align="left">4</td>
<td align="left">takeover</td>
<td align="left">CF</td>
<td align="left">squash</td>
<td align="left"><strong>4.002</strong></td>
<td align="left">4.000</td>
<td align="left">4.000</td>
<td align="left">4.007</td>
<td align="left">-0.417</td>
</tr>
<tr class="odd">
<td align="left">5</td>
<td align="left">takeover(total)</td>
<td align="left">RD</td>
<td align="left">squash</td>
<td align="left"><strong>4.588</strong></td>
<td align="left">4.579</td>
<td align="left">4.590</td>
<td align="left">4.595</td>
<td align="left">0.168</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">dd(CF -&gt; RD)</td>
<td align="left">RD</td>
<td align="left">squash</td>
<td align="left">1.212</td>
<td align="left">1.209</td>
<td align="left">1.209</td>
<td align="left">1.217</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">mount</td>
<td align="left">RD</td>
<td align="left">squash</td>
<td align="left">0.041</td>
<td align="left">0.040</td>
<td align="left">0.041</td>
<td align="left">0.041</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">takeover</td>
<td align="left">RD</td>
<td align="left">squash</td>
<td align="left">3.336</td>
<td align="left">3.330</td>
<td align="left">3.340</td>
<td align="left">3.337</td>
<td align="left"></td>
</tr>
</tbody>
</table>



-   UNIT: sec
-   CF: CompactFlash / RD: RAM Disk



[![Chart1.png](http://eLinux.org/images/b/b7/Chart1.png)](http://eLinux.org/File:Chart1.png)

1.  As the result of using mmap system call, bootup time is reduced by
    about 400msec (10% of total init time).
2.  By using the takeover method, page faults are reduced to 317 times,
    versus 496 under the mmap method. Also, redundant page copies are
    eliminated. As the result, about 40msec is eliminated.
3.  Squashfs is compressed ROM file system and there are some extra cost
    to access data, decompression and so on… But the performance is not
    so bad against ext3fs. Using squashfs is a good choice to reduce
    consumption of storage spaces.
4.  Using a file system on a RAM disk is the most efficient way to
    increase file access performance. If the storage

device which stores the file system image is enough fast and extra RAM
usage is affordable, it might be a good choice to reduce bootup time.

### Case Study 2

-   Status: measured
-   Architecture Support:

-   i386: unknown
-   ARM: unknown
-   PPC: unknown
-   MIPS: unknown
-   SH: works on SH3

## Future Work/Action Items

Here is a list of things that could be worked on for this feature:

-   I'm considering to implement similar file cache control using
    fadvise system call under 2.6 kernel.

## Other resource

This project was demo-ed at the 2005 CELF Technical Conference. The
picture of the poster is here:

[![Celf-demo-poster-fujitsu.jpg](http://eLinux.org/images/f/fc/Celf-demo-poster-fujitsu.jpg)](http://eLinux.org/File:Celf-demo-poster-fujitsu.jpg)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")

