> From: [eLinux.org](http://eLinux.org/Runtime_Memory_Measurement "http://eLinux.org/Runtime_Memory_Measurement")


# Runtime Memory Measurement



This page has a collection of ideas and resources having to do with
measuring runtime memory of a Linux system.

Unfortunately, the existing memory measurement techniques do not give a
100% accurate accounting of memory pages (since some pages are counted
more than once by some measures). See [Accurate Memory
Measurement](../../.././dev_portals/Memory_Management/Accurate_Memory_Measurement/Accurate_Memory_Measurement.md "Accurate Memory Measurement")
- that page describes techniques (and patches) which can be used to
measure the runtime memory more accurately.

## Contents

-   [1 Measuring memory in Linux (the
    basics)](#measuring-memory-in-linux-the-basics)
    -   [1.1 'free' and /proc](#-free-and-proc)
-   [2 Measuring user process memory
    use](#measuring-user-process-memory-use)
    -   [2.1 'ps' fields for memory
        information](#-ps-fields-for-memory-information)
    -   [2.2 'top' fields for memory
        information](#-top-fields-for-memory-information)
    -   [2.3 /proc info](#-proc-info)
        -   [2.3.1 /proc/\<pid\>/statm](#-proc-3cpid-3e-statm)
        -   [2.3.2 /proc/\<pid\>/status](#-proc-3cpid-3e-status)
        -   [2.3.3 /proc/\<pid\>/maps](#-proc-3cpid-3e-maps)
            -   [2.3.3.1 mem\-usage command to consolidate
                data](#mem-usage-command-to-consolidate-data)
    -   [2.4 Inaccuracies of kernel reporting
        mechanisms](#inaccuracies-of-kernel-reporting-mechanisms)
    -   [2.5 Heap memory usage](#heap-memory-usage)
-   [3 Memory Debuggers](#memory-debuggers)
-   [4 Measuring kernel memory use](#measuring-kernel-memory-use)
    -   [4.1 Kernel Stack Usage](#kernel-stack-usage)
    -   [4.2 General kernel memory use](#general-kernel-memory-use)
    -   [4.3 Kernel memory analysis tools and
        project](#kernel-memory-analysis-tools-and-project)

## Measuring memory in Linux (the basics)

Here are some basic techniques for measuring memory usage in Linux.

### 'free' and /proc

The 'free' command shows the memory on a machine, in certain categories.

[need explanation of categories here...'man free' doesn't explain the
numbers]



    $ free
                 total       used       free     shared    buffers     cached
    Mem:        507564     481560      26004          0      68888     185220
    -/+ buffers/cache:     227452     280112
    Swap:      2136604     105168    2031436


 This information is obtained from /proc/meminfo, which has additional
details not shown by the 'free' command.

The following is on my machine with 512 Mb RAM, running Linux 2.6.3:

    $ cat /proc/meminfo
    MemTotal:       507564 kB
    MemFree:         26004 kB
    Buffers:         68888 kB
    Cached:         185220 kB
    SwapCached:      29348 kB
    Active:         342488 kB
    Inactive:        32092 kB
    HighTotal:           0 kB
    HighFree:            0 kB
    LowTotal:       507564 kB
    LowFree:         26004 kB
    SwapTotal:     2136604 kB
    SwapFree:      2031436 kB
    Dirty:              88 kB
    Writeback:           0 kB
    Mapped:         165648 kB
    Slab:            73212 kB
    Committed_AS:   343172 kB
    PageTables:       2644 kB
    VmallocTotal:   524212 kB
    VmallocUsed:      7692 kB
    VmallocChunk:   516328 kB

See [http://lwn.net/Articles/28345/](http://lwn.net/Articles/28345/) for
a description of these fields

## Measuring user process memory use

### 'ps' fields for memory information

The 'ps' command provides information about the memory usage of
processes on a Linux system. However, it is not well documented. Here
are some notes on using 'ps' and /proc to view memory usage information
on a running Linux system:

meaning of ps fields:

-    %Mem - percent of memory
-   VSZ - Virtual Size
-   RSS - Resident Set Size
-   SIZE - Equivalent to VSZ
-   others??

### 'top' fields for memory information

See 'man top':

-    %MEM -- Memory usage (RES)
    -   -   A task's currently used share of available physical memory.

-   VIRT -- Virtual Image (kb)
    -   -   The total amount of virtual memory used by the task. It
            includes all code, data and shared libraries plus pages that
            have been swapped out.
        -   VIRT = SWAP + RES

-   SWAP -- Swapped size (kb)
    -   -   The swapped out portion of a task's total virtual memory
            image.

-   RES -- Resident size (kb)
    -   -   -   The non-swapped physical memory a task has used.
            -   RES = CODE + DATA.

-   CODE -- Code size (kb)
    -   -   -   The amount of physical memory devoted to executable
                code, also known as the 'text resident set' size or TRS

-   DATA -- Data+Stack size (kb)
    -   -   -   The amount of physical memory devoted to other than
                executable code, also known as the 'data resident set'
                size or DRS.

-   SHR -- Shared Mem size (kb)
    -   -   -   The amount of shared memory used by a task. It simply
                reflects memory that could be potentially shared with
                other processes.

-   nDRT -- Dirty Pages count
    -   -   -   The number of pages that have been modified since they
                were last written to disk. Dirty pages must be written
                to disk before the corresponding physical memory
                location can be used for some other virtual page.

Are the following assertions true:??

-   virtual memory usage of a process, excluding shared libs = VIRT -
    SHR
-   physical memory usage of a process excluding shared libraries = RES
    - SHR

### /proc info

see 'man proc' for detailed information about the files and fields in
the /proc filesystem.

#### /proc/\<pid\>/statm

/proc/\<pid\>/statm fields: columns are (in pages):

<table>
<tbody>
<tr class="odd">
<td align="left">total program size|</td>
</tr>
<tr class="even">
<td align="left">resident set size|</td>
</tr>
<tr class="odd">
<td align="left">shared pages|</td>
</tr>
<tr class="even">
<td align="left">text (code) |</td>
</tr>
<tr class="odd">
<td align="left">data/stack |</td>
</tr>
<tr class="even">
<td align="left">library |</td>
</tr>
<tr class="odd">
<td align="left">dirty pages |</td>
</tr>
</tbody>
</table>

Here an example: 693 406 586 158 0 535 0

#### /proc/\<pid\>/status

/proc/\<pid\>/status fields:

-   Vm Size: 2772 kB
-   Vm Lck: 0 kB - ???
-   Vm RSS: 1624 kB
-   Vm Data: 404 kB
-   Vm Stk: 24 kB
-   Vm Exe: 608 kB
-   Vm Lib: 1440 kB

#### /proc/\<pid\>/maps

The process maps shows the actual memory areas that have been mapped
into a process' address space, and their permissions.

Example:

    $ cat /proc/25042/maps
    08048000-080e0000 r-xp 00000000 03:05 196610     /bin/bash
    080e0000-080e6000 rw-p 00097000 03:05 196610     /bin/bash
    080e6000-08148000 rwxp 00000000 00:00 0
    40000000-40016000 r-xp 00000000 03:05 147471     /lib/ld-2.3.3.so
    40016000-40017000 rw-p 00015000 03:05 147471     /lib/ld-2.3.3.so
    40017000-40018000 rw-p 00000000 00:00 0
    40018000-40019000 r--p 00000000 03:05 184090     /usr/share/locale/en_US/LC_IDENTIFICATION
    40019000-4001a000 r--p 00000000 03:05 184089     /usr/share/locale/en_US/LC_MEASUREMENT
    4001a000-4001b000 r--p 00000000 03:05 184083     /usr/share/locale/en_US/LC_TELEPHONE
    4001b000-4001c000 r--p 00000000 03:05 184091     /usr/share/locale/en_US/LC_ADDRESS
    4001c000-4001d000 r--p 00000000 03:05 184086     /usr/share/locale/en_US/LC_NAME
    4001d000-4001e000 r--p 00000000 03:05 184084     /usr/share/locale/en_US/LC_PAPER
    4001e000-4001f000 r--p 00000000 03:05 184088     /usr/share/locale/en_US/LC_MESSAGES/SYS_LC_MESSAGES
    4001f000-40020000 r--p 00000000 03:05 184087     /usr/share/locale/en_US/LC_MONETARY
    40020000-40026000 r--p 00000000 03:05 183689     /usr/share/locale/ISO-8859-1/LC_COLLATE
    40026000-40027000 r--p 00000000 03:05 184082     /usr/share/locale/en_US/LC_TIME
    40027000-4002a000 r-xp 00000000 03:05 147459     /lib/libtermcap.so.2.0.8
    4002a000-4002b000 rw-p 00002000 03:05 147459     /lib/libtermcap.so.2.0.8
    4002b000-4002c000 rw-p 00000000 00:00 0
    4002c000-4002e000 r-xp 00000000 03:05 147482     /lib/libdl-2.3.3.so
    4002e000-4002f000 rw-p 00001000 03:05 147482     /lib/libdl-2.3.3.so
    4002f000-40171000 r-xp 00000000 03:05 147511     /lib/tls/libc-2.3.3.so
    40171000-40174000 rw-p 00142000 03:05 147511     /lib/tls/libc-2.3.3.so
    40174000-40177000 rw-p 00000000 00:00 0
    40177000-40178000 r--p 00000000 03:05 184085     /usr/share/locale/en_US/LC_NUMERIC
    40178000-401a4000 r--p 00000000 03:05 183688     /usr/share/locale/ISO-8859-1/LC_CTYPE
    401a4000-401a5000 r-xp 00000000 03:05 180462     /usr/lib/gconv/ISO8859-1.so
    401a5000-401a6000 rw-p 00001000 03:05 180462     /usr/lib/gconv/ISO8859-1.so
    401b3000-401bd000 r-xp 00000000 03:05 147492     /lib/libnss_files-2.3.3.so
    401bd000-401be000 rw-p 00009000 03:05 147492     /lib/libnss_files-2.3.3.so
    bfffa000-c0000000 rwxp ffffb000 00:00 0
    ffffe000-fffff000 ---p 00000000 00:00 0



##### mem\_usage command to consolidate data

David Schleef wrote a program to consolidate the information from
/proc/\<pid\>/maps, and total up each kind of memory for a process.

Here it is: [Media:mem\_usage](http://eLinux.org/images/d/d3/Mem_usage "Mem usage") (It
was obtained from
[http://www.schleef.org/\~ds/mem\_usage](http://www.schleef.org/~ds/mem_usage))

Here is the result of running mem\_usage on the process used in the
previous example:

    $ ./mem_usage 25042
    Backed by file:
      Executable                r-x  2048
      Write/Exec (jump tables)  rwx  0
      RO data                   r--  240
      Data                      rw-  56
      Unreadable                ---  0
      Unknown                        0
    Anonymous:
      Writable code (stack)     rwx  416
      Data (malloc, mmap)       rw-  20
      RO data                   r--  0
      Unreadable                ---  4
      Unknown                        0



### Inaccuracies of kernel reporting mechanisms

Many of the memory reporting mechanisms for the kernel are inaccurate,
due to not recording sufficient information about the true state of the
system. Here are some random notes on these inaccuracies. To see
information on different methods of getting more accurate memory
information, see [Accurate Memory
Measurement](../../.././dev_portals/Memory_Management/Accurate_Memory_Measurement/Accurate_Memory_Measurement.md "Accurate Memory Measurement")

-   "copy-on-write" pages - an mmap'ed file may be very large in the
    process address space, but empty until written to.

From Ratboy on Slashdot:

    The mmap() call can map a file (backing store) and allow data to be shared. Memory does
    not need to be used until the data is read (or written). And this time, the backing
    store doesn't even need swap (because the file is the backing store).

    ...

    A page of code that is shared - may become a page of code that is private. A page of
    data that is unwritten doesn't have to exist. Even if it is read! A page of data that
    is written may STILL be shared.


 From others on Slashdot:

Top will show you the same as ps does, ps reads /proc/\<pid\>/statm and
asks what's going on. The problem on linux is the copy on write
principle which saves heaps of memory, but makes it virtually impossible
to figure out what belongs to what. The thing is, when you fork it maps
the memory and marks everything as copy on write, when something needs
to write to part of the memory, then it will make the copy for each
process.

However asking the process how much memory it has allocated will show
all memory including stuff that is marked copy on write - that is, I
could have 100 processes showing they each use 1.4MB of memory, because
they all share the same library, but in fact, its the same copy they are
all using so I'm only using 1.4 MB instead of 140MB (+PCB et. al)

* * * * *

Each thread in a process shows up as consuming the same amount of memory
(either this only happens under Linuxthreads or I don't have any
threaded applications running on my system).

Device mappings show up as consumed memory (which generates plenty of
complaints about the X server). If you want to find out how much memory
X is actually using (bytes in cached pixmaps on behalf of each process
and sans device mappings), try the program here:
[http://69.142.116.122/dist/pixmap\_mem-1.0.tgz](http://69.142.116.122/dist/pixmap_mem-1.0.tgz)

This contains a tiny program that lists how much memory X is using for
other programs by caching pixmaps and a perl script that lists how much
memory X is using sans device mappings. }}}

-   pmap is a utility which shows the memory usage of a process (it
    looks like it just reads and interprets /proc/\<pid\>/maps).

Someone on Slashdot said:

    pmap *also* overestimates memory usage, because some portion of the mapped address
    space isn't actually in use. RSS, on the other hand, only measures memory that is
    actually in use, but doesn't distinguish between memory that is shared and memory
    that is not. VSZ is the most pessimistic measure, since it includes all mapped
    memory, shared and unshared.

### [Heap memory](http://eLinux.org/Heap_memory "Heap memory") usage

Heap is the dynamically allocated memory inside each process' address
space that is managed by the application itself. The structure of this
memory is actually managed by the C library, with the application
calling malloc() and free().

glibc has the capability to collect statistics information of heap
functions like malloc() and other functions like memory leak checking or
double free.

## Memory Debuggers

Several tools are available to analyze memory allocations, watch for
reading and writing beyond the end of allocated memory, and do other
tasks which help with debugging and tuning memory operations of a
program. See [Memory Debuggers](../../../toolbox/dev_tools/Memory_Debuggers/Memory_Debuggers.md "Memory Debuggers")
for a list of different tools and their features.

## Measuring kernel memory use

### Kernel Stack Usage

-   Tim is adding a stack checking function to KFT (See [Kernel Function
    Trace](../../.././dev_portals/Boot_Time/Kernel_Function_Trace/Kernel_Function_Trace.md "Kernel Function Trace"))
    -   -   This new feature has not yet been published

-   Recent -mm tree added stack-corruption-detector.patch (8th March,
    2006)
-   The scripts/checkstack.pl script in the kernel tree will show the
    functions with the largest static stack footprint.
-   Enabling CONFIG\_DEBUG\_STACKOVERFLOW in the kernel will enable
    checking for low-stack situations in the irq handler.
-   Enabling CONFIG\_4KSTACKS will cause stack overflows to occur more
    frequently, particularly with certain kernel code such as XFS
    enabled.

### General kernel memory use

-   [http://www.halobates.de/memorywaste.pdf](http://www.halobates.de/memorywaste.pdf)
    - Great paper by Andi Kleen, of SUSE Labs, about dynamic memory
    usage of Linux systems
-   Check /proc/slabinfo to find how much memory is being used by the
    kernel SLAB allocator (or SLUB or SLOB, depending on what is
    enabled).

### Kernel memory analysis tools and project

The Linux Foundation CE Workgroup has a project to analyze the kernel's
dynamic memory utilization. See: [Kernel dynamic memory
analysis](http://eLinux.org/Kernel_dynamic_memory_analysis "Kernel dynamic memory analysis")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")

