> 原文： [eLinux.org](http://eLinux.org/Runtime_Memory_Measurement "http://eLinux.org/Runtime_Memory_Measurement")<br/>
> 翻译：[@zipper1956](https://github.com/zipper)<br/>
> 校订：[@lzufalcon](https://github.com/lzufalcon)<br/>


# 运行时内存检测



本文包括许多关于 Linux 系统下运行时内存检测的方法和资料。

不幸的是目前的内存检测技术不能百分之百准确地检测出内存页面的数量（因为一些内存页面会被一些检测方法重复计算）。[精确内存检测](../../.././dev_portals/Memory_Management/Accurate_Memory_Measurement/Accurate_Memory_Measurement.md "Accurate Memory Measurement") 一文介绍了一些可以更准确地检测运行时内存的技术和补丁。

## 目录

-   [1 Linux 中的内存检测（基础知识）](#measuring-memory-in-linux-the-basics)
    -   [1.1 'free' 和 /proc](#-free-and-proc)
-   [2 检测用户进程内存使用](#measuring-user-process-memory-use)
    -   [2.1 'ps' 命令输出的内存信息](#-ps-fields-for-memory-information)
    -   [2.2 'top' 命令输出的内存信息](#-top-fields-for-memory-information)
    -   [2.3 /proc 信息](#-proc-info)
        -   [2.3.1 /proc/\<pid\>/statm](#-proc-3cpid-3e-statm)
        -   [2.3.2 /proc/\<pid\>/status](#-proc-3cpid-3e-status)
        -   [2.3.3 /proc/\<pid\>/maps](#-proc-3cpid-3e-maps)
            -   [2.3.3.1 使用 mem\-usage 命令合并数据
                ](#mem-usage-command-to-consolidate-data)
    -   [2.4 内存报告机制的不准确性](#inaccuracies-of-kernel-reporting-mechanisms)
    -   [2.5 堆内存使用](#heap-memory-usage)
-   [3 内存调试工具](#memory-debuggers)
-   [4 检测内核内存使用](#measuring-kernel-memory-use)
    -   [4.1 内核栈使用](#kernel-stack-usage)
    -   [4.2 通用内核内存使用](#general-kernel-memory-use)
    -   [4.3 内核内存分析工具和项目](#kernel-memory-analysis-tools-and-project)

## Linux 中的内存检测（基础知识）

下面是在 Linux 系统中检测内存的一些基本技术。

### 'free' 和 /proc

'free' 命令以特定的分类方式显示机器的内存信息。

[这里需要对分类方式进行解释...'man free' 命令不会解释这些数字的含义]



    $ free
                 total       used       free     shared    buffers     cached
    Mem:        507564     481560      26004          0      68888     185220
    -/+ buffers/cache:     227452     280112
    Swap:      2136604     105168    2031436


这些信息是从 /proc/meminfo 获得的，其中包括了更多 'free' 命令所没有的细节信息。

下面是从我运行着 Linux 2.6.3 并拥有 512 Mb 内存的机器上获得的内存信息。

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

可通过 [http://lwn.net/Articles/28345/](http://lwn.net/Articles/28345/) 了解关于这方面的详细描述。

## 检测用户进程内存使用

### 'ps' 命令输出的存信息

在 Linux 系统中 'ps' 命令可以提供进程的内存使用信息。然而这些信息没有详细的文档话说明。下面是在运行着的Linux 系统中使用 'ps' 命令和 /proc 查看内存使用信息的一些建议：

'ps' 命令输出的各参数的含义：

-    %Mem - 内存百分比
-   VSZ - 虚拟内存大小
-   RSS - 驻留空间大小
-   SIZE - 与 VSZ 含义相同
-   其他？

### 'top' 命令输出的内存信息

见 'man top' 输出的帮助信息:

-    %MEM -- 内存使用 (RES)
    -   -   进程当前使用的可用物理内存百分比。

-   VIRT -- 虚拟镜像 (kb)
    -   -   进程使用的所有虚拟内存的总数量，包括所有代码，数据，共享库和交换出去的内存页。
        -   VIRT = SWAP + RES

-   SWAP -- 交换出去的内存大小 (kb)
    -   -   进程所有虚拟内存中被交换出去的部分。

-   RES -- 驻留空间大小 (kb)
    -   -   -   进程使用的非交换物理内存大小。
            -   RES = CODE + DATA.

-   CODE -- 代码大小 (kb)
    -   -   -   可执行代码占用的物理内存大小，也被称为TRS (text resident set)。

-   DATA -- 数据和堆栈总大小 (kb)
    -   -   -   除了可执行代码之外占用的物理内存大小，也被称为 DRS (数据驻留集)。

-   SHR -- 共享内存大小 (kb)
    -   -   -   进程使用的共享内存大小。该参数只是简单地反映了可能与其它进程共享的内存大小。

-   nDRT -- 脏页数量
    -   -   -   被写到磁盘之后又被修改过的内存页数量。在脏页对应的物理内存可以被用于其他虚拟页面之前，脏页必须被写到磁盘。

下面这些结论是否正确：？？

-   包括共享库在内，进程虚拟内存使用量 = VIRT - SHR
-   除了共享库之外，进程物理内存使用量 = RES - SHR

### /proc 信息

使用 'man proc' 查看 /proc 文件系统中文件和字段的详细信息。

#### /proc/\<pid\>/statm

命令 /proc/\<pid\>/statm 输出: 列含义如下 （以页面为单位）:  

<table>
<tbody>
<tr class="odd">
<td align="left">程序总大小|</td>
</tr>
<tr class="even">
<td align="left">驻留集大小|</td>
</tr>
<tr class="odd">
<td align="left">共享页面|</td>
</tr>
<tr class="even">
<td align="left">text (代码)|</td>
</tr>
<tr class="odd">
<td align="left">数据/堆栈 |</td>
</tr>
<tr class="even">
<td align="left">库 |</td>
</tr>
<tr class="odd">
<td align="left">脏页面 |</td>
</tr>
</tbody>
</table>

例如: 693 406 586 158 0 535 0

#### /proc/\<pid\>/status

命令 /proc/\<pid\>/status 输出:

-   Vm Size: 2772 kB
-   Vm Lck: 0 kB - ???
-   Vm RSS: 1624 kB
-   Vm Data: 404 kB
-   Vm Stk: 24 kB
-   Vm Exe: 608 kB
-   Vm Lib: 1440 kB

#### /proc/\<pid\>/maps

进程映射显示出映射到进程地址空间的实际内存区域和内存的访问权限。

例如:

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



##### 使用 mem\_usage 命令合并数据

David Schleef 编写了一个可以合并 /proc/\<pid\>/maps 输出信息的程序，并且可以统计进程的各种内存。

程序见链接: [Media:mem\_usage](http://eLinux.org/images/d/d3/Mem_usage "Mem usage") (该程序从此处获得
[http://www.schleef.org/\~ds/mem\_usage](http://www.schleef.org/~ds/mem_usage))

下面是在前一个例子上使用的进程上运行 mem\_usage 命令输出的结果：

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



### 内存报告机制的不准确性

由于记录系统真正状态的信息不够充分，内核的许多内存报告机制是不准确的。 这里有一些关于这些不准确性的随笔。 查看关于获得更准确内存信息的不同方法的信息见： [精确内存检测](../../.././dev_portals/Memory_Management/Accurate_Memory_Measurement/Accurate_Memory_Measurement.md "Accurate Memory Measurement")

-   "copy-on-write" 页面 - 在进程地址空间中一个 mmap 文件可能会非常大，但是直到被进行写操作之前一直是空白的。

Ratboy 在科技网站 Slashdot 上写到：

    mmap() 可以映射一个文件（备份存储），并且允许数据共享。直到数据被读或者写都不需要使用内存。此时，备份存储甚至不需要交换页面（因为文件就是备份存储）。

    ...

    被共享的一个页面的代码可能变成私有的。没有进行写操作的一页数据没有必要存在，即使这个页面是被读过的。进行写操作的的一页数据仍然可以被共享。


 其他人在 Slashdot 写到：

mmap() 可以映射一个文件（备份存储），并且允许数据共享。直到数据被读或者写都不需要使用内存。此时，备份存储甚至不需要交换页面（因为文件就是备份存储）。Top 命令会输出和 ps 命令同样的结果，ps 命令读取 /proc/\<pid\>/statm 当前信息之后就会结束等待输入下一条命令。但是在 Linux 系统上用来节省堆内存的写时复制策略使得 ps 命令基本不可能分辨出哪些内存属于哪个进程。也就是说，当你调用 fork 时，系统会映射内存并按照写时复制策略标记所有内存，当一些数据需要写入到部分内存时，系统才会给每个进程分配对应的内存拷贝。

然而询问进程已经分配多少内存会得到包括标记为写时复制内存在内的所有内存－就是说，我有 100 个进程，每个进程都拥有 1.4MB 内存，因为这些进程都共享同一个库，但是实际上进程使用的内存是同一份，所以我只用了 1.4MB 的内存而不是 140MB。

* * * * *

进程的每个线程看起来消耗的内存一样多（要么是这种情况只在发生在 Linux 系统上，要么是我的系统上没有多线程的应用程序）。

设备映射会消耗内存（这导致了很多对 X server 的抱怨）。如果你想要知道 X 实际上使用的内存数量（代表每个进程的缓存像素映射字节数和扫描设备映射），那么尝试使用以下程序：[http://69.142.116.122/dist/pixmap\_mem-1.0.tgz](http://69.142.116.122/dist/pixmap_mem-1.0.tgz)

这个链接包含一个很小的程序和一个脚本，程序能通过缓存像素映射列出 X 为其他程序使用的内存，脚本能够通过扫描设备映射得出 X 使用的内存大小。

-   pmap 是一个能够输出一个进程内存使用量的工具（看起来像只是读取和解释了 /proc/\<pid\>/mapsd 的数据）。

一些人在 Slashdot 上这样说到：

    pmap “同样”会高估内存使用，因为部分映射的地址空间并没有使用。另一方面，RSS 值检测在使用的内存，但是并不区分共享内存和非共享内存。VSZ 是最不精确的检测方法，因为它包含了所有的映射内存，共享内存和非共享内存。

### [堆内存](http://eLinux.org/Heap_memory "Heap memory") 使用

堆是在每个进程地址空间中动态分配的，进程地址空间由应用自身管理。这种内存的结构实际由 C 库管理，而应用程序调用 malloc() 和 free() 函数。   

glibc 能够收集像 malloc() 这样堆操作函数和其他内存泄漏或者双重释放函数的统计信息。  

## 内存调试工具

有多种工具可以用来分析内存分配，监视已分配内存之外的读写操作和完成其他帮助调试和协调程序内存操作的任务。可通过 [内存调试工具](../../../toolbox/dev_tools/Memory_Debuggers/Memory_Debuggers.md "Memory Debuggers") 一文了解一系列不同的工具和它们的特性。

## 检测内核内存使用

### 内核栈使用

-   Tim 正在向 KFT 添加一个栈检查函数(见链接 [内核函数跟踪](../../.././dev_portals/Boot_Time/Kernel_Function_Trace/Kernel_Function_Trace.md "Kernel Function Trace"))。
    -   -   这个新特性没有被发布。
-   最近 -mm 树添加了 stack-corruption-detector.patch 补丁(2006.3.8)
-   内核代码树中的 scripts/checkstack.pl 脚本能够给出占用最大静态栈空间的函数。
-   使能内核中的 CONFIG\_DEBUG\_STACKOVERFLOW 能够使能 irp 处理中的栈空间不足检查。 
-   使能 CONFIG\_4KSTACKS 会导致栈溢出更频繁发生，特别是某系特定内核代码比如开启了 XFS 的。

### 通用内核内存使用

-   [http://www.halobates.de/memorywaste.pdf](http://www.halobates.de/memorywaste.pdf)
    - SUSE Labs 实验室的 Andi Kleen 写的关于 Linux 系统动态内存使用的优秀文章
-   查看 /proc/slabinfo 可以知道内核 SLAB (或者是SLUB及SLOB，取决于哪个被使能) 分配器正在使用的内存量。

### 内核内存分析工具和项目

Linux 基金会 CE 工作小组有一个分析内核动态内存使用的项目，见链接： [Kernel dynamic memory analysis](http://eLinux.org/Kernel_dynamic_memory_analysis "Kernel dynamic memory analysis")


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [系统剪裁](http://eLinux.org/Category:System_Size "Category:System Size")

