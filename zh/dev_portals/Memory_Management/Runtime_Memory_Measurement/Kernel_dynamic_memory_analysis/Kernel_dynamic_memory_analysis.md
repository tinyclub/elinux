> From: [eLinux.org](http://eLinux.org/Kernel_dynamic_memory_analysis "http://eLinux.org/Kernel_dynamic_memory_analysis")


# Kernel dynamic memory analysis



This page has notes and results from the project [Kernel dynamic memory
allocation tracking and
reduction](http://eLinux.org/Kernel_dynamic_memory_allocation_tracking_and_reduction "Kernel dynamic memory allocation tracking and reduction")

[This page is fairly random at the moment...]

## Contents

-   [1 Instrumentation overview](#instrumentation-overview)
-   [2 Using debugfs and ftrace](#using-debugfs-and-ftrace)
    -   [2.1 Debugfs](#debugfs)
    -   [2.2 Tracing](#tracing)
-   [3 Obtaining accurate call sites (or The painstaking task of
    wrestling against
    gcc)](#obtaining-accurate-call-sites-or-the-painstaking-task-of-wrestling-against-gcc)
-   [4 Memory accounting](#memory-accounting)
    -   [4.1 Types of memory](#types-of-memory)
    -   [4.2 Static memory](#static-memory)
        -   [4.2.1 The size command](#the-size-command)
        -   [4.2.2 readelf](#readelf)
        -   [4.2.3 objdump](#objdump)
    -   [4.3 Dynamic](#dynamic)
        -   [4.3.1 Internal fragmentation](#internal-fragmentation)
        -   [4.3.2 Accounting with kmem events
            trace](#accounting-with-kmem-events-trace)
        -   [4.3.3 Enabling and reading kmem
            trace](#enabling-and-reading-kmem-trace)
        -   [4.3.4 About kmem trace events](#about-kmem-trace-events)
        -   [4.3.5 Pitfall: ringbuffer
            overrun](#pitfall-ringbuffer-overrun)
-   [5 Using the trace\-analyze.py post-processing
    script](#using-the-trace-analyze-py-post-processing-script)
    -   [5.1 Getting the script](#getting-the-script)
    -   [5.2 Using trace\-analyze.py for static
        analysis](#using-trace-analyze-py-for-static-analysis)
        -   [5.2.1 Using it](#using-it)
        -   [5.2.2 Under the hood](#under-the-hood)
        -   [5.2.3 TODO](#todo)
    -   [5.3 Using trace\-analyze.py for dynamic
        analysis](#using-trace-analyze-py-for-dynamic-analysis)
        -   [5.3.1 Producing a kmem trace log
            file](#producing-a-kmem-trace-log-file)
        -   [5.3.2 Slab accounting file
            output](#slab-accounting-file-output)
        -   [5.3.3 Producing a pretty ringchart for dynamic
            allocations](#producing-a-pretty-ringchart-for-dynamic-allocations)
        -   [5.3.4 Pitfall: wrongly reported allocation (and how to fix
            it)](#pitfall-wrongly-reported-allocation-and-how-to-fix-it)
-   [6 Internal fragmentation in SLAB allocators: a simple
    comparison](#internal-fragmentation-in-slab-allocators-a-simple-comparison)
    -   [6.1 Kmalloc objects](#kmalloc-objects)
        -   [6.1.1 SLOB](#slob)
        -   [6.1.2 SLUB](#slub)
        -   [6.1.3 SLAB](#slab)
    -   [6.2 Cache objects](#cache-objects)
        -   [6.2.1 SLOB](#slob-2)
        -   [6.2.2 SLAB](#slab-2)
        -   [6.2.3 SLUB](#slub-2)
-   [7 Reporting](#reporting)
-   [8 Visualization](#visualization)
    -   [8.1 Current dynamic footprint](#current-dynamic-footprint)
    -   [8.2 Static footprint](#static-footprint)
-   [9 Mainline status](#mainline-status)
    -   [9.1 Accepted](#accepted)
    -   [9.2 Nacked](#nacked)
-   [10 Recommendations for reductions](#recommendations-for-reductions)
    -   [10.1 Move to a section of its
        own?](#move-to-a-section-of-its-own-3f)
-   [11 Slab account](#slab-account)
-   [12 Testing feedback](#testing-feedback)

## Instrumentation overview

-   Slab\_accounting patches
    -   uses \_\_builtin\_return\_address(0) to record the address of
        the caller, the same mechanism used by kmem events
    -   starts from very first allocation
    -   does not use kernel allocators (instead it uses fixed-size
        static buffers)
        -   This increases overhead, but avoids interspersing tracing
            allocations in the rest of the system allocations

-   Ftrace kmem events
    -   does not start until ftrace system is initialized, after some
        allocations are already performed
    -   supported in mainline - no need to add our own instrumentation

These two instrumentation methods are basically the same: trap each
kmalloc, kfree, etc. event and produce relevant information with them.
The difference between them is that the first post-processes the events
in-kernel and create a /proc/slab\_account file to access the results.
This output is more or less like this:

    total bytes allocated:  1256052
    total bytes requested:  1077112
    slack bytes allocated:   178940
    number of allocs:          7414
    number of frees:           5022
    number of callers:          234

      total    slack      req alloc/free  caller
       2436      232     2204    29/0     bio_kmalloc+0x33
        268        8      260     1/0     pci_alloc_host_bridge+0x1f
         32        8       24     1/0     tracepoint_entry_add_probe.isra.2+0x86
         44        8       36     1/0     cpuid4_cache_sysfs_init+0x30
          0        0        0     0/3     platform_device_add_data+0x33
    [...]

On the other hand, analysing ftrace kmem events will defer
post-processing to be done at user space, thus achieving much more
flexibility.

The disadvantage of the ftrace method is that it needs to be initialized
before capturing events. Currently, this initialization is done at
*fs\_initcall* and we're working on enabling them earlier. For more
information, checkout this upstreamed patch:

**trace: Move trace event enable from fs\_initcall to core\_initcall**

This patch allows to enable events at core\_initcall. It's also possible
to enable it at early\_initcall. Another posibility is to create a
static ring buffer and then copy the captured events into the real ring
buffer.

Also, we must find out if early allocations account for significant
memory usage. If not, it may not be that important to capture them. Yet
another possibility is to use a printk brute-force approach for very
early allocations, and somehow coalesce the data into the final report.

## Using debugfs and ftrace

For more information, please refer to the canonical trace documentation
at the linux tree:

-   Documentation/trace/ftrace.txt
-   Documentation/trace/tracepoint-analysis.txt
-   and everything else inside Documentation/trace/

(Actually, some of this information has been copied from there.)

#### Debugfs

The debug filesystem it's a ram-based filesystem that can be used to
output a lot of different debugging information. This filesystem is
called debugfs and can be enabled with CONFIG\_DEBUG\_FS:

    Kernel hacking
         [*] Debug filesystem

After you enable this option and boot the built kernel, it creates the
directory /sys/kernel/debug as a location for the user to mount the
debugfs filesystem. Do this manually:

    $  mount -t debugfs none /sys/kernel/debug

You can add a link to type less and get less tired:

    $ ln -s /debug /sys/kernel/debug

#### Tracing

Once we have enabled debugfs, you need to enable tracing support,
selecting CONFIG\_TRACING, CONFIG\_FUNCTION\_TRACER and
CONFIG\_DYNAMIC\_FTRACE options.

    Kernel hacking
         Tracers
              [*] Kernel Function Tracer
              [*] enable/disable ftrace tracepoints dynamically

This option will add a /sys/kernel/debug/tracing directory on your
mounted debugfs filesystem. Traced events can be read through
/sys/kernel/debug/tracing/trace. You can list available events by
listing file /sys/kernel/debug/tracing/available\_events.

To enable events on bootup you can add them to kernel parameters, for
instance to enable kmem events:

    trace_event=kmem:kmalloc,kmem:kmem_cache_alloc,kmem:kfree,kmem:kmem_cache_free

**Warning**: if you use SLOB on non-NUMA systems, where you might expect
kmalloc\_node not get called, actually it is the only one called. This
is due to SLOB implementing only kmalloc\_node and having kmalloc call
it without a node. Same goes to kem\_cache\_alloc\_node.

## Obtaining accurate call sites (or The painstaking task of wrestling against gcc)

The compiler inlines **a lot** automatically and without warning. In
this scenario, it's impossible to get the **real** call site name based
on just calling address.

When some function is inlined, it gets *collapsed* and it won't get
listed as a symbol if you use tools like readelf, objdump, etc.

Does this matter? Well, it matters if you want to obtain an accurate
call site report when tracing kernel memory events (which will see
later).

However, there is one solution! You can turn off gcc inlining using some
gcc options on kernel Makefile. You need to add these to your CFLAGS:

    KBUILD_CFLAGS   += -fno-default-inline \
                      -fno-inline \
                      -fno-inline-small-functions \
                      -fno-indirect-inlining \
                      -fno-inline-functions-called-once

It's not yet clear if all of these are needed, or just some of them.

Using ./scripts/bloat-o-meter it's possible to determine the effect of
using this gcc flags:

\$ ./scripts/bloat-o-meter vmlinux-def vmlinux-no-inline

    add/remove: 1574/33 grow/shrink: 154/1099 up/down: 218552/-199352 (19200)
    function                                     old     new   delta
    hidinput_configure_usage                       -    8672   +8672
    do_con_trol                                    -    2955   +2955
    do_con_write                                   -    2223   +2223
    copy_process                                   -    2078   +2078
    [...]

The effect of disable inlining is now very clear:

-   There are 1574 new functions, and 33 less functions.
-   Some functions have grown, but many more have shrunk.
-   Overall, the kernel symbols's size is 19k bigger.

We must keep in mind that no matter what internal mechanisms we use to
record call\_site, if they're based on \_\_builtin\_address, then their
accuracy will depend entirely on gcc \*not\* inlining automatically.

The emphasis is in the *automatic* part. There will be lots of functions
we will need to get inlined in order to determine the caller correctly.
These will be marked as \_\_always\_inline.

See upstreamed patch:

**Makefile: Add option CONFIG\_DISABLE\_GCC\_AUTOMATIC\_INLINING)**

See
[https://patchwork.kernel.org/patch/1427211/](https://patchwork.kernel.org/patch/1427211/)
for some patch feedback details

## Memory accounting

### Types of memory

The kernel, being a computer program, can consume memory in two
different ways: statically and dynamically.

Static memory can be measured offline, therefore accounted before
actually running the kernel using standard binary inspection utilites
(readelf, objdump, size, etc). We will explore this utilities in detail.

Dynamic memory cannot be measured offline, and it's not only necessary
to probe a running kernel but also to enable aditional probe code to
trace each allocation. Fortunately for us, the linux kernel has ftrace
which is a tracing framework that allows to trace general events, and in
particular memory allocation events. We will explore this framework in
detail.

### Static memory

A compiled kernel will allocate static memory to store two kinds of
symbols: code symbols (a.k.a text) and data symbols (a.k.a data).

For instance, let's look at this piece of C code:

    long curr;
    int max = 10;

    int foo(int var)
    {
        int i = var + max;
        if (i < max)
            curr = i;
    }

We have three different symbols:

-   curr : a variable (data zero initialized)
-   max  : an initialized variable (data non-zero initialized)
-   foo  : a function (text)

Once this code is running each of these symbols will need memory for its
own storage. However, the zero initialized variable will not use space
in the compiled binary. This is due to a special section inside the
binary (called *bss* for no good reason) where all the zero initialized
variables are placed. Since they carry no information, they need no
space. Static variables have the same life as the executing program.

On the other side, *var* and *i* variables are dynamically allocated,
since they live in the stack. They are called automatic variables,
meaning that they have a life cycle that's not under our control.

Note that when we talk about *static* memory, the word static has
nothing to do with the C-language keyword. This keyword references a
visibility class, where static means local, as opposed to global.

#### The size command

The most simple command to get a binary static size, is the wonderfully
called *size* command. Let's start by seeing it in action:

    $ size ./fs/ext2/ext2.o
      text     data     bss     dec     hex filename
     51273       68       8   51349    c895 ./fs/ext2/ext2.o

According to this output, this object file has roughly 50k bytes of text
and 68 bytes of data. Now, *size* comes in two flavors: berkeley and
sysv. Each of this shows a different output. The default is berkeley, so
the previous example was a berkeley output.

However, if we use the same command with sysv output format, we'll find
very different results:

    $ size --format=sysv ./fs/ext2/ext2.o
    ./fs/ext2/ext2.o  :
    section             size   addr
    .text              43005      0
    .init.text           138      0
    .exit.text            25      0
    .rodata             2304      0
    .rodata.str1.1      1656      0
    .rodata.str1.4      3485      0
    .data                 60      0
    .exitcall.exit         4      0
    .initcall6.init        4      0
    .bss                   8      0
    .note.GNU-stack        0      0
    .comment             675      0
    [...]

Here we see a more detailed description about each section size. Note
the appearence of a .rodata (read-only data) section, of 2k byte large.
This section is composed of read-only variables (e.g. marked const) that
are not accounted under the data column, but rather as text by the
standard *size* format.

To add even more confusion to this picture, gcc can decide (at his own
will) to put inside .rodata section symbols not marked as const. These
symbols are not written by anyone, and gcc considers them as read-only
(pretty smart, uh?). This means you can have a .rodata section bigger
than what you expected to have.

This happens since gcc v4.7 (???)

#### readelf

This two commands can give us any information we need about a binary. In
particular, they can output the complete list of symbols with detailed
information about each one. Let's see an example of readelf on the same
file we used for *size*. The output is stripped for clarity.

    $ readelf -s fs/ext2/ext2.o

    Symbol table '.symtab' contains 413 entries:
      Num:    Value  Size Type    Bind   Vis      Ndx Name
        0: 00000000     0 NOTYPE  LOCAL  DEFAULT  UND
        1: 00000000     0 SECTION LOCAL  DEFAULT    1
    [...]
      339: 00004da0   286 FUNC    GLOBAL DEFAULT    1 ext2_evict_inode
      340: 000003e0    76 OBJECT  GLOBAL DEFAULT    7 ext2_nobh_aops
      341: 00000780   128 OBJECT  GLOBAL DEFAULT    7 ext2_symlink_inode_operat
      342: 000008d8    20 OBJECT  GLOBAL DEFAULT    7 ext2_xattr_acl_default_ha
      343: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND generic_file_aio_write
      344: 00000280   128 OBJECT  GLOBAL DEFAULT    7 ext2_file_inode_operation
      345: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __dquot_alloc_space
      346: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND generic_setxattr
      347: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND unlock_buffer
      348: 000014c0    36 FUNC    GLOBAL DEFAULT    1 ext2_bg_num_gdb
      349: 00005240   684 FUNC    GLOBAL DEFAULT    1 ext2_setattr
    [...]

For instance, ext2\_nobh\_aops is an OBJECT symbol (data) of 76 bytes
and ext2\_evict\_inode is a FUNC symbol (text) of 286 bytes. Notice
there are some UND symbols. They are undefined symbols for this file,
that are defined elsewhere and therefore not of interest for us when
inspecting a file size.

Of course, this output can be combined with grep to get fantastic
results. Let's count the numbers of defined functions:

    $ readelf -s fs/ext2/ext2.o | grep -v UND | grep FUNC

With a little awk magic we could even sum these sizes and get the size
of the .text section. TODO!

#### objdump

    TODO

### Dynamic

Dynamic memory in kernel land is a little different from user land.

In user land, all one needs to do to get a chunk of memory is call
malloc(). In kernel land, we have a similar function: kmalloc(). But we
also have lots of other functions to alloc memory, and we must have some
special considerations.

The first thing it's important to understand is that kernel obtains
memory (well, in most architectures) on a fixed-size chunk, that we call
a 'page' of memory. This page of memory tipically is 4096 bytes large,
but this depends on the architecture.

In order to delivery smaller pieces of memory, the kernel have a few
couple of layers that ultimately lets you do kmalloc(100) and get 100
bytes. These layers are called: buddy allocator and slab allocator.

We will focus on the latter. Slab allocator comes in three different
flavors: SLAB, SLOB and SLUB. These funny names are historically, but
the meaning is:

-   SLAB is the traditional (or default in some platforms ?)
-   SLOB is aimed at tiny embedded systesm (e.g. without mmu)
-   SLUB is the default (on desktop?)

Each of these implement the allocation in a different way, but they all
share a common property: internal fragmentation.

#### Internal fragmentation

For different reasons (alignment, overhead, etc) when we request 100
bytes with kmalloc(100) the slab allocator may really allocate 128 bytes
(or 140 bytes, we can't really know). These extra 28 bytes can't be
used, and therefore you are wasting them. This is called internal
fragmentation, and one of the main goals of the slab allocator is to
minimize it. In other words, trying to match as nearly as possible the
requested size with the truly allocated size.

#### Accounting with kmem events trace

Ftrace kmem events are a great source of information. By using them you
can trace each kmalloc, getting the requested bytes, the allocated
bytes, the caller address and the returned pointer. You can also trace
kfree, getting the caller address and the freed pointer.

Once you have the caller address you can use System.map file to get the
caller function name. Also, by using the returned pointer and
correlating with kfree traces you can keep track of currently used
dynamic memory by each kernel function / subsystem.

Let's see this in detail.

#### Enabling and reading kmem trace

We can activate this on boot up with kernel parameter *trace\_event*.
For instance,

    trace_event=kmem:kmalloc,kmem:kmem_cache_alloc,kmem:kfree,kmem:kmem_cache_free

or you can activate on-the-fly with:

    TODO

Once you have enabled events, you can run your favourite program (in
order to trigger some allocations). When you're done you may disable
events (or not) and read them:

    $ cat /sys/kernel/debug/tracing/trace > kmem.log

Let's see a piece of this log:

    # tracer: nop
    #
    # entries-in-buffer/entries-written: 10500/10500   #P:1
    #
    #                              _-----=> irqs-off
    #                             / _----=> need-resched
    #                            | / _---=> hardirq/softirq
    #                            || / _--=> preempt-depth
    #                            ||| /     delay
    #           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
    #              | |       |   ||||       |         |
               init-1     [000] .N..     0.170000: kmalloc: call_site=c104deff ptr=c147dd20 bytes_req=29 bytes_alloc=32 gfp_flags=GFP_KERNEL
               init-1     [000] .N..     0.170000: kmalloc: call_site=c104e2ac ptr=c147dd00 bytes_req=24 bytes_alloc=32 gfp_flags=GFP_KERNEL
               init-1     [000] .N..     0.170000: kmalloc: call_site=c104deff ptr=c147dce0 bytes_req=22 bytes_alloc=32 gfp_flags=GFP_KERNEL
               init-1     [000] .N..     0.170000: kmalloc: call_site=c104e2ac ptr=c147dcc0 bytes_req=24 bytes_alloc=32 gfp_flags=GFP_KERNEL
               init-1     [000] .N..     0.170000: kmalloc: call_site=c10c0185 ptr=c14a4ba0 bytes_req=36 bytes_alloc=64 gfp_flags=GFP_KERNEL|GFP_ZERO
               init-1     [000] .N..     0.170000: kmalloc: call_site=c10bfa28 ptr=c147dca0 bytes_req=6 bytes_alloc=32 gfp_flags=GFP_KERNEL
               init-1     [000] .N..     0.170000: kfree: call_site=c10bfa4a ptr=  (null)
               init-1     [000] .N..     0.170000: kmalloc: call_site=c10b9619 ptr=c147dc80 bytes_req=6 bytes_alloc=32 gfp_flags=GFP_KERNEL
               init-1     [000] .N..     0.180000: kmem_cache_alloc: call_site=c10b963e ptr=c1610c08 bytes_req=64 bytes_alloc=64 gfp_flags=GFP_KERNEL|GFP_ZERO

This log can be post-processed. For your convenience we have a script
trace\_analyze.py that does exactly this (see below).

#### About kmem trace events

As we have seen there are a few more events than kmalloc and kfree.
Let's see them all:

-   kmalloc
-   kfree
-   kmalloc\_node
-   kmem\_cache\_alloc
-   kmem\_cache\_alloc\_node
-   kmem\_cache\_free

#### Pitfall: ringbuffer overrun

Ftrace events (in particular kmem trace events) are stored internally in
a ringbuffer. If the kernel keeps writing events to it, eventually it
will overrun, replacing the oldest events with the most recent.

If you're doing a bootup analysis, an overrun will trash your test.

There are few ways to avoid this.

-   Increase ringbuffer size

By using *trace\_buf\_size* kernel parameter it's possible to control
the buffer size. Keep in mind that a larger buffer will take longer to
get allocated and will need more memory.

-   Use a minimal setup and try to stop tracing as soon as possible

When doing bootup analysis, it may make sense to try to minimize the
scenario setup, in order to reduce events. Also, you probably want to
disable events as soon as possible.

-   Perform smaller tests

Besides doing a bootup analysis, it's possible to run small tests,
focused on some specific workload. Something like this:

     $ echo "1" > tracing_on # enable events
     $ modprobe ext2
     $ mount ...
     $ fsck
     $ umount ...
     $ rmmod ext2
     $ echo "0" > tracing_on # disable_events

You can test if the buffer is overrunning by looking at per-cpu tracing
stat:

    $ cat /sys/kernel/debug/tracing/per_cpu/cpu0/stats

    entries: 0
    overrun: 0
    commit overrun: 0
    bytes: 0
    oldest event ts:     0.000000
    now ts:   997.471882

## Using the trace\_analyze.py post-processing script

### Getting the script

You can get script last version from this project's github repository

     git clone https://github.com/ezequielgarcia/kmem-probe-framework
     cd kmem-probe-framework
     ./post-process/trace_analyze.py -h

### Using trace\_analyze.py for static analysis

trace\_analyze.py typically needs access to: a built kernel tree and an
ftrace kmem log.

However, if one lacks the latter but can provide a built kernel tree,
the script will fallback to 'static' analysis.

#### Using it

Usage is fairly simple

     $ ./trace_analyze.py -k /usr/src/linux -r rings.png
     $ ./trace_analyze.py --kernel /usr/src/linux -r rings.png

This should produce a ringchart png file in the current directory.

Of course, you can use absolute and relative paths in that parameter

     $ ./trace_analyze.py -k ./torvalds -r rings.png

If you're interested in a specific subsystem you can use a parameter to
specify the directory tree branch to take as root

     $ ./trace_analyze -k ./torvalds -b fs -r fs.png
     $ ./trace_analyze -k ./torvalds -b drivers/base -r base.png
     $ ./trace_analyze -k ./torvalds -b mm -r mm.png

Each of this commands will produce a ringchart png file in the curent
directory, named as specified.

#### Under the hood

The script will perform a directory walk, internally creating a tree
matching the provided kernel tree. On each object file found (like
fs/inode.o) it will perform a 'readelf --syms' to get a list of symbols
contained in it.

Nothing fancy.

#### TODO

-   Account for minor differences between running 'size' and using this
    script

### Using trace\_analyze.py for dynamic analysis

#### Producing a kmem trace log file

The purpose of trace\_analyze script is to perform dynamic memory
analysis. For this to work you need feed it with a kmem trace log file;
of course, you also need to give hime a built kernel tree.

Such log must be produced on the running target kernel, but you can
post-process it off-box. For instance, you boot your kernel with kmem
parameters to enable ftrace kmem events: (it's recommended to enable all
events, despite not running a NUMA machine).

    kmem="kmem:kmalloc,kmem:kmalloc_node,kmem:kfree,kmem:kmem_cache_alloc,kmem:kmem_cache_alloc_node,kmem:kmem_cache_free"

This parameter will have linux to start tracing as soon as possible. Of
course some early traces will be lost, see below.

(on your target kernel)

    # To stop tracing
    $ echo "0" > /sys/kernel/debug/tracing/tracing_on

    # Dump
    $ cat /sys/kernel/debug/tracing/trace > kmem.log

Now you need to get this file so you can post-process it using
trace\_analyze.py. In my case, I use qemu with a file backing serial
device, so I simply do:

(on your target kernel)

    $ cat /sys/kernel/debug/tracing/trace > /dev/ttyS0

And I get the log on qemu's backing file.

Now you have everything you need to start the analysis. The script will
post-process the logfile and will produce two kinds of output:

-   an account file
-   a ringchart png

Let's see how to obtain each of these.

#### Slab accounting file output

To obtain the account file you need to use --acount-file (-c) parameter,
like this:

     ./trace_analyze.py -k ../torvalds -f kmem.log --account-file kmem_account.txt

This will produce an account file like this:

    current bytes allocated:     669696
    current bytes requested:     618823
    current wasted bytes:         50873
    number of allocs:              7649
    number of frees:               2563
    number of callers:              115

      total    waste      net alloc/free  caller
    ---------------------------------------------
     299200        0   298928  1100/1     alloc_inode+0x4fL
     189824        0   140544  1483/385   __d_alloc+0x22L
      51904        0    47552   811/68    sysfs_new_dirent+0x4eL
      16384     8088    16384     1/0     __seq_open_private+0x24L
      15936     1328    15936    83/0     device_create_vargs+0x42L
      14720    10898    14016   460/22    sysfs_new_dirent+0x29L

You can tell the script to read only kmalloc events (notice the option
name is \*--malloc\*):

    ./trace_analyze.py -k ../torvalds -f kmem.log -c kmem_account.txt --malloc

Or you can tell the script to read only kmem\_cache events:

    ./trace_analyze.py -k ../torvalds -f kmem.log -c kmem_account.txt --cache


If you want to order the account file you can use --order-by (-o):

    ./trace_analyze.py -k ../torvalds -f kmem.log -c kmem_account.txt --order-by=waste

The possible options for order-by parameter are:

-   total\_dynamic: Added allocations size
-   current\_dynamic: Currently allocated size
-   alloc\_count: Number of allocations
-   free\_count: Number of frees
-   waste: Currently wasted size

You can pick a directory to get an account file only for the allocations
from that directory. This is done with the --branch (-b) option, just
like we've done for the static analysis:

\$ ./trace\_analyze.py -k ../torvalds -f kmem.log -c kmem\_account.txt
-b drivers

All of these options can be combined. For instance, if you want to get
kmalloc events only, coming from fs/ directory and ordered by current
size:

\$ ./trace\_analyze.py -k ../torvalds -f kmem.log -b fs -c
kmem\_account.txt -o current\_dynamic --malloc

#### Producing a pretty ringchart for dynamic allocations

As already explained in the static analysis section, it's possible to
produce a ringchart to get 'the big picture' of dynamic allocations. You
will need to have matplotlib installed, which should be as easy as:

    $ {your_pkg_manager} install matplotlib

The script usage is very simple, just pass the parameter --rings-file
(-r)

    $ ./trace_analyze.py -k ../torvalds -f kmem.log --rings-file=foo.png

This command will produce a png file named as specified. The plot will
show current dynamic allocations by default. You can control the used
attrbute used for the ringchar plot using --rings-attr (-a) parameter.
The available options are:

-   current: static + current dynamic size
-   static: static size
-   waste: wasted size
-   current\_dynamic: current dynamic size
-   total\_dyamic: added dynamic size

<!-- -->

    $ ./trace_analyze.py -k ../torvalds -f kmem.log -r foo.png -a waste

You can use --branch (-b) parameter to plot allocations made from just
one directory. For instance, if you want to get wasted bytes for ext4
filesystem:

    $ ./trace_analyze.py -k ../torvalds -f kmem.log -r ext4_waste.png -a waste -b fs/ext4

Or, if you want to see static footprint of arch-dependent mm code:

    $ ./trace_analyze.py -k ../torvalds -f kmem.log -r foo.png -a static -b arch/x86/mm

Also, you can filter kmalloc or kmem\_cache traces using either
--malloc, or --cache:

    $ ./trace_analyze.py -k linux/ -f boot_kmem.log -r malloc.png --malloc

#### Pitfall: wrongly reported allocation (and how to fix it)

There are a number of functions (kstrdup, kmemdup, krealloc, etc) that
do some kind of allocation on behalf of its caller.

Of course, we don't want to get trace reports from these functions, but
rather from its caller. To acomplish this, we must use a variant of
kmalloc, called kmalloc\_track\_caller, which does exactly that.

Let's see an example. As of today kvasprintf() implementation looks like
this

    (see lib/kasprintf.c:14)
    char *kvasprintf(gfp_t gfp, const char *fmt, va_list ap)
    {
           /* code removed */
           p = kmalloc(len+1, gfp);

And trace\_analyze produces the account file

    total    waste      net alloc/free  caller
    ---------------------------------------------
    2161     1184     2161   148/0     kvasprintf

The source of this 148 allocations may be a single caller, or it may be
multiple callers. We just can't know. However, if we replace kmalloc
with kmalloc\_track\_caller, we're going to find that out.

    char *kvasprintf(gfp_t gfp, const char *fmt, va_list ap)
    {
           /* code removed */
           p = kmalloc_track_caller(len+1, gfp);

After running the re-built kernel, and comparing both current and
previous account files, we find this is the real caller:

    total    waste      net alloc/free  caller
    ---------------------------------------------
    2161     1184     2161   148/0     kobject_set_name_vargs

So, we've accurately tracked this allocation down to the kobject code.

## Internal fragmentation in SLAB allocators: a simple comparison

Using trace\_analyze tool and a very minimal kernel + rootfs setup it's
possible to evaluate allocators wastage.

This analysis is not complete, as it lacks a comparison of memory
overhead imposed by the allocator itself.

### Kmalloc objects

Strings, when dynamically allocated, are one of the greatest source of
fragmentation. This is intrinsic to the 'string' nature: Strings never
have a regular size. String are frequently small, with typical sizes
between 4 and 16 (?) bytes. This kind of small and irregular allocations
can help evaluate each allocator.

The (primary?) source of strings is directory entries: file names,
directory names, and such.

Let's compare each allocator and see how they perform.

#### SLOB

SLOB prepends a fixed-size header to every kmalloc allocation. On x86
this header is 8 bytes long (how about other arches?).

So, if requested string size is between 4 and 16 bytes, the
fragmentation ratio is between 200% and 50%.

SLOB allocator is different from SLAB and SLUB: it doesn't really
implement a 'slab cache' concept. For this reason there is no real
difference between kmallocing 5 bytes or 100 bytes. The allocator won't
search for a cache of a proper size, but instead just allocate a chunk
prepended with a fixed-size header.

Since wastage is independent of requested size, small allocations may
waste a lot, but the wastage falls with increasing allocations.

#### SLUB

When allocating strings SLUB allocator uses its 8, 16 and 32 byte
caches. For requested size between 4 and 16 bytes, the fragmentation
ratio is between 100 and 0%, the worst cases being 4 and 9 bytes, with
fragmentation of 100% and 78% respectively.

SLUB being a cache-based allocator, the fragmentation will depend on how
aligned the requested size is to the available size. For instance,
requesting 32 bytes allocates 32 bytes, resulting in zero fragmentation.
Requesting 33 bytes allocates 64 bytes, resulting in 94% fragmentation.

#### SLAB

SLAB operates in a similar way to SLUB, in the sense that allocations
are cache-based and fragmentation depends on fitness between requested
size and cache size. However, since the smallest SLAB cache is 32 bytes,
and strings are typically much smaller, SLAB is the less efficient of
the three.

Just to compare, for requested size between 4 and 16 bytes, the
fragmentation ratio is between 700% and 100%.

### Cache objects

Cache objects fragmentation occurs when each allocated object needs some
extra bytes for alignment, debug or other metadata. Let's analyze each
case.

#### SLOB

Being a very simple allocator, SLOB only needs to reserve extra bytes
for rcu-destroyed objects. Currently, each of these objects wastes 12
bytes to store an rcu related struct.

For regular objects the wastage is nil.

It's important to keep in mind that SLOB can leave 'holes' inside slob
pages. These holes are unallocated space that is not lost, because it
can be used if it fits for some requested allocation.

However this means that, on low memory situations, it's possible to run
out of memory for a specific allocation, but still have free space left
on these holes.

#### SLAB

If compiled without any debug mechanism (poison, redzone, ...) SLAB
allocator will only reserve extra bytes to return aligned objects. Of
course, the wastage depends on each architecture.

If compiled with debug enabled SLAB will add 24 bytes to each allocated
object for red zoning and user store (see comments in mm/slab.c).

#### SLUB

If compiled without any debug mechanism (poison, redzone, ...) SLUB
allocator will reserve extra bytes for alignment and to store a freelist
pointer.

The latter is true only for objects with a defined constructor. In this
case, the wastage is fairly small: only 4/8 bytes (depending on the
architecture) are needed to store a pointer. However, if many objects
are allocated, the wastage can become noticeable.

An example of this is the allocation of inodes. Even on a very minimal
system, more than 1k inodes can get allocated, resulting in a total
wastage of 8k bytes.

As with SLAB, if compiled with debug enabled, the allocator adds some
extra bytes to each object for red zoning and user store.

## Reporting

-   extracting data to host
    -   tool for extraction (perf?, cat /debugfs/tracing/\<something\>?)
-   post-processing the data
    -   grouping allocations (assigning to different subsystems,
        processes, or functional areas)
        -   idea to post-process kmem events and correlate with
            \*/built-in.o
    -   reporting on wasted bytes
    -   reporting on memory fragmentation

## Visualization

Matplotlib [[[1]](http://matplotlib.sourceforge.net/)]

We will use matplotlib with its Wedge api to create a ring chart
(similar to gnome baobab).

We'll get something like this:

### Current dynamic footprint

This ring chart shows current dynamic usage, start branch is 'drivers'.
Script command line is:

       $ trace_analyze.py -f kmem.log -k ../linux-mtd/ -a current_dynamic -b drivers/ -r drivers.png

[![Drivers
dynamic.png](http://eLinux.org/images/thumb/7/7e/Drivers_dynamic.png/800px-Drivers_dynamic.png)](http://eLinux.org/File:Drivers_dynamic.png)

### Static footprint

This ring chart shows static usage, start branch is 'fs' and the kernel
is configured with ext2, ubifs, jffs2. Script command line is:

       $ trace_analyze.py -f kmem.log -k ../linux-mtd/ -a static -b fs -r fs-static.png

[![Fs
static.png](http://eLinux.org/images/thumb/c/cf/Fs_static.png/800px-Fs_static.png)](http://eLinux.org/File:Fs_static.png)

## Mainline status

### Accepted

Here's the list of the mainlined (or waiting at linux-next) patches that
were produced for this project.

Patches focuses on:

-   Improving tracing by enabling ftrace earlier in kernel init sequence
-   Improving kmem tracing accuracy by tracking caller correctly
-   Improve or fix slob kmem tracing support
-   Minor slob cleanups

<!-- -->

     mm/slob: Use free_page instead of put_page for page-size kmalloc allocations
     commit 8cf9864b1382851d90c7c505f8441c8928f1469e

     mm/sl[aou]b: Move common kmem_cache_size() to slab.h
     commit 242860a47a75b933a79a30f6a40bf4858f4a3ecc

     mm/slob: Use object_size field in kmem_cache_size()
     commit fe74fe2bf293d061826f0d7afc2ca8456bdbb40e

     mm/slob: Drop usage of page->private for storing page-sized allocations
     commit 999d8795d438d396936811b185428d70b7b7de6d

     lib/kasprintf.c: use kmalloc_track_caller() to get accurate traces for kvasprintf
     commit 3e1aa66bd423950aa69c3d50d91818af1d16e0a7

     mm/slab: Fix kmem_cache_alloc_node_trace() declaration
     commit dffa3f985047979ace185e253da89cabda3f7b31

     mm/slab: Fix kmem_cache_alloc_node_trace() declaration
     commit 1e5965bf1f018cc30a4659fa3f1a40146e4276f6

     mm/slab: Fix typo _RET_IP -> _RET_IP_
     commit 592f41450d03f74747edd81779ae206a0647152f

     mm, slub: Rename slab_alloc() -> slab_alloc_node() to match SLAB
     commit 2b847c3cb4f8565911bd8ce59b8428e635c90594

     mm, slab: Rename __cache_alloc() -> slab_alloc()
     commit 48356303ff8cce7036f13a23df9119d3f47461ce

     mm, slab: Match SLAB and SLUB kmem_cache_alloc_xxx_trace() prototype
     commit 4052147c0afa1cf05780ed846f37e87cdde9f628

     mm, slab: Replace 'caller' type, void* -> unsigned long
     commit 7c0cb9c64f83dd9bf18b139ac0de00daba6087c2

     mm, slob: Add support for kmalloc_track_caller()
     commit f3f741019595f1e73564d985f5fe8abcbb98c769

     mm, slab: Remove silly function slab_buffer_size()
     commit ff4fcd01ec86d98d15d2fd96f22f19bb1d341b88

     mm, slob: Use NUMA_NO_NODE instead of -1
     commit 90f2cbbc49a8fe5a49cea1d362d90e377b949d49

     trace: Move trace event enable from fs_initcall to core_initcall
     commit 8781915ad2716adcd8cd5cc52cee791fc8b00fdf

     mm: Use __do_krealloc to do the krealloc job
     commit e21827aadd77e33833eeb393de2e8675e9b399e2

### Nacked

A few patches already sent have been nacked and work is needed in order
to submit them again:

     [PATCH 05/10] mm, util: Use dup_user to duplicate user memory
     http://www.spinics.net/lists/linux-mm/msg42351.html

     [PATCH v2] Makefile: Add option to disable gcc automatic inlining
     https://lkml.org/lkml/2012/10/7/209

Latter's usefulness is still to prove.

The truth is if compiler folds some static, once-called, small function
we will report a wrong callsite but we will correlate it with the
correct subsystem/file.

Moreover, some parts of the kernel implicitly relies on gcc automatic
inlining behavior, and turning this off have shown to break compilation.

We paste the patch here, in case someone wants to use it. It should
apply on any recent kernel.

-   [File:0001-Makefile-Add-option-to-disable-gcc-automatic-inlinin.patch](http://eLinux.org/File:0001-Makefile-Add-option-to-disable-gcc-automatic-inlinin.patch "File:0001-Makefile-Add-option-to-disable-gcc-automatic-inlinin.patch")

## Recommendations for reductions

-   Avoid the use of constructors

-   Avoid to kmalloc / kstrdup small strings

-   Remember to use kmalloc\_track\_caller on sub-system allocator
    functions. (see mtdcore.c: mtd\_kmalloc\_up\_to)

### Move to a section of its own?

We want to answer thes question: **When to replace a kmalloc with a
kmem\_cache?**

We can use trace\_analyze on kmalloc events, ordered by alloc\_count to
find frequent allocers. It may be advantageous to replace this
allocations with kmem\_cache's.

Do it yourself:

    $ trace_analyze -k linux/ -f kmem.log -c kmem_acc.txt -o alloc_count --malloc

And the produced account file looks like this:

    current bytes allocated:     113128
    current bytes requested:      93232
    current wasted bytes:         19896
    number of allocs:              2217
    number of frees:                145
    number of callers:               83

      total    waste      net alloc/free  caller
    ---------------------------------------------
       5936     1782     5616   523/22    sysfs_new_dirent+0x29L
       4104     1173     4104   326/0     __trace_define_field+0x5dL
      10432        0    10432   326/0     __trace_define_field+0x34L
       3800     1177     3800   326/0     __trace_define_field+0x4aL
       1816      513     1816   177/0     kobject_set_name_vargs+0x18L
       9216     1536     9216    96/0     device_private_init+0x23L         <----------- This one ?
      15936     1328    15936    83/0     device_create_vargs+0x46L         <----------- This one ?
       3040      416     1376    24/16    add_sysfs_param.isra.2+0x46L
       3072        0     3072    24/0     con_insert_unipair+0xb5L
       1408        0        0    22/22    create_unique_id.isra.50+0x2eL
        336       68      200    19/11    add_sysfs_param.isra.2+0x6fL
        512      192      512    16/0     event_subsystem_dir+0xddL
        152       44      152    16/0     event_subsystem_dir+0x9cL
        512       64      512    16/0     event_subsystem_dir+0x64L
        120        0        0    13/13    dir_add+0x48L
        208        0        0    13/13    dir_add+0x20L
        640      160      640    10/0     kset_create+0x31L                 <----------- This one ?


 Being a very minimal setup, the allocations that appear frequently are
related to sysfs. Before asserting that it's better use kmem\_cache in
these call sites, it's necessary to estimate to overhead impose by this,
considering a new kmem\_cache would be created for each case.

## Slab account

Slab accounting is another method of obtaining allocation-related
information about the kernel. It is an out-of-tree (as of November 2012)
patch that uses static buffers to hold information about allocations and
frees.

This is the version of the patch for 3.6:

-   [File:0001-mm-sl-aou-b-Add-slab-accounting-debugging-feature-v3.6.patch](http://eLinux.org/File:0001-mm-sl-aou-b-Add-slab-accounting-debugging-feature-v3.6.patch "File:0001-mm-sl-aou-b-Add-slab-accounting-debugging-feature-v3.6.patch")

## Testing feedback

There is some testing feedback from Tim on the
[Talk:Kernel\_dynamic\_memory\_analysis](http://eLinux.org/Talk:Kernel_dynamic_memory_analysis "Talk:Kernel dynamic memory analysis")
page.


