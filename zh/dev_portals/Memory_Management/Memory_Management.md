> From: [eLinux.org](http://eLinux.org/Memory_Management "http://eLinux.org/Memory_Management")


# Memory Management



This page has information about various memory management projects and
activities which are of interest to embedded Linux developers.

## Contents

-   [1 Areas of Interest](#areas-of-interest)
    -   [1.1 Memory Measurement and
        Analysis](#memory-measurement-and-analysis)
    -   [1.2 Huge/large/superpages](#huge-large-superpages)
    -   [1.3 Page cache compression](#page-cache-compression)
    -   [1.4 Reserving (and accessing) the top of memory on
        startup](#reserving-and-accessing-the-top-of-memory-on-startup)
    -   [1.5 Enhanced Out-Of-Memory
        handling](#enhanced-out-of-memory-handling)
        -   [1.5.1 OOM notification in
            cgroups](#oom-notification-in-cgroups)
        -   [1.5.2 mem\-notify patches](#mem-notify-patches)
        -   [1.5.3 Google cgroup OOM
            handler](#google-cgroup-oom-handler)
        -   [1.5.4 Nokia OOM enhancements](#nokia-oom-enhancements)
        -   [1.5.5 LSM-based low-memory
            notification](#lsm-based-low-memory-notification)
    -   [1.6 Type-based memory allocation
        (old)](#type-based-memory-allocation-old)
-   [2 Additional Resources/Mailing
    Lists](#additional-resources-mailing-lists)
    -   [2.1 Articles on caches](#articles-on-caches)

## Areas of Interest

Most of these areas have wider reaching implications, but are relatively
simpler in the embedded case, largely thanks to not having to contend
with swap and things of that nature. Simpler memory management as well
as vendors not afraid of deviation from mainline for product programs
makes for an excellent playground for experimenting with new things in
the memory management and virtual memory space.

### Memory Measurement and Analysis

Analyzing the amount of system memory in use and available is trickier
than it sounds.

-   See [Runtime Memory
    Measurement](http://eLinux.org/Runtime_Memory_Measurement "Runtime Memory Measurement")
    for different methods of measuring and analyzing system memory.

-   See [Accurate Memory
    Measurement](http://eLinux.org/Accurate_Memory_Measurement "Accurate Memory Measurement")
    for some different techniques for dealing with inadequacies in
    current memory measurement systems.

-   See [Tims Notes on ARM memory
    allocation](http://eLinux.org/Tims_Notes_on_ARM_memory_allocation "Tims Notes on ARM memory allocation")
    for some ARM-specific memory management information.

### Huge/large/superpages

-   This applies to both transparent large page usage as well as the
    more static usage models, primarily relating to work outside of the
    hugetlb interface/libhugetlbfs.
-   Embedded systems suffer from very small TLBs generally using
    PAGE\_SIZE'd pages (4kB) for coverage. In most cases this places the
    system under very heavy pressure for any kind of userspace work, and
    very visibly degrading performance, with most applications taking
    anywhere from 5-40% of their time on the CPU servicing page faults.
-   Preliminary discussion on this subject as well as links to
    additional information is happening through the wiki here: [Huge
    Pages](http://linux-mm.org/)

### Page cache compression

-   This relates to using various compression algorithms for performing
    run-time compression and decompression of page cache pages,
    specifically aimed at both reducing memory pressure as well as
    helping performance in certain workloads.
-   More information can be found on the wiki here
    [CompressedCaching](http://linux-mm.org/CompressedCaching) as well
    as at the [SF Compressed
    Caching](http://linuxcompressed.sourceforge.net) home page.

### Reserving (and accessing) the top of memory on startup

A quote from Todd's email on how to use the reserved physical memory in
"mem=".

* * * * *

Given that you have a fixed address for your memory, and is already
reserved, the easier way to use it is by calling mmap() over the /dev/
mem device, use 0 as the start address, and the physical address of the
reserved memory as the offset. The flags could be MAP\_WRITE| MAP\_READ.
That will return you a pointer on user space for your memory mapped by
the kernel. For example

If your SDRAM base address is 0x80000000 and your memory is of 64MB, but
you use the cmdline mem=60M to reserve 4MB at the end. Then your
reserved memory will be at 0x83c00000, so all you need to do is

    int fd;
    char *reserved_memory;
     
    fd = open("/dev/mem",O_RDWR);
    reserved_memory = (char *) mmap(0,4*1024*1024,PROT_READ|PROT_WRITE,MAP_SHARED,fd,0x83c00000);

* * * * *

### Enhanced Out-Of-Memory handling

Several technologies have been developed and suggested for improving the
handling Out-Of-Memory (OOM) conditions with Linux systems.

See [http://linux-mm.org/OOM\_Killer](http://linux-mm.org/OOM_Killer)
for information about the OOM killer in the Linux kernel.

Part of OOM avoidance is for the kernel to have an accurate measure of
memory utilization. See [Accurate Memory
Measurement](http://eLinux.org/Accurate_Memory_Measurement "Accurate Memory Measurement")
for information on technology in this area.

Here are some technologies that I know about (these need to be
researched and documented better):

#### OOM notification in cgroups

-   Memory usage limit notification (By Embedded Alley, sponsored by CE
    Linux Forum)
    -   This patch updates the Memory Controller cgroup to add a
        configurable memory usage limit notification. The feature was
        presented at the April 2009 Embedded Linux Conference.
    -   See [Memory - A Most Precious Resource
        (PDF)](http://tree.celinuxforum.org/CelfPubWiki/ELC2009Presentations?action=AttachFile&do=get&target=celf_mem_notify.pdf)
        - Dan Malek presentation at ELC 2009
    -   See
        [http://lwn.net/Articles/328403/](http://lwn.net/Articles/328403/)
        - article about first submission to LKML in April 2009
    -   [http://lkml.org/lkml/2009/7/7/410](http://lkml.org/lkml/2009/7/7/410)
        - thread about second submission to LKML in July 2009
        -   [http://lkml.org/lkml/2009/7/16/468](http://lkml.org/lkml/2009/7/16/468)
            - Balbir Singh wants to take time to evaluate the change....

#### mem\_notify patches

-   mem\_notify patches
    -   This set of patches provided a mechanism to notify user-space
        when memory is getting low, allowing for application-based
        handling of the condition. These patches were submitted in
        January 2008.
    -   This patch cannot be applied to versions beyond 2.6.28 because
        the memory management reclaiming sequence have changed.
    -   See
        [http://lwn.net/Articles/267013/](http://lwn.net/Articles/267013/)

#### Google cgroup OOM handler

-   Google per-cgroup OOM handler
    -   Google posted a Request For Comments (RFC) for OOM handling
        implemented in a per-cgroup fashion. See
        [http://article.gmane.org/gmane.linux.kernel.mm/28376](http://article.gmane.org/gmane.linux.kernel.mm/28376)

#### Nokia OOM enhancements

-   Nokia OOM enhancements
    -   Maemo application enhancements referenced at:
        [http://lwn.net/Articles/267013/](http://lwn.net/Articles/267013/)
        (search for "killable" in the comments)

<!-- -->

    User "oak" writes (commenting on the mem_notify patches):

    Posted Feb 3, 2008 14:02 UTC (Sun) by oak (guest, #2786) [Link]

    ...

    I thought the point of the patch is for user-space to be able to do the
    memory management in *manageable places* in code.   As mentioned earlier,
    a lot of user-space code[1] doesn't handle memory allocation failures. And
    even if it's supposed to be, it can be hard to verify (test) that the
    failures are handled in *all* cases properly.  If user-space can get a
    pre-notification of a low-memory situation, it can in suitable place in
    code free memory so that further allocations will succeed (with higher
    propability).

    That also allows doing somehing like what maemo does.  If system gets
    notified about kernel low memory shortage, it kills processes which have
    notified it that they are in "background-killable" state (saved their UI
    state, able to restore it and not currently visible to user). I think it
    also notifies applications (currently) through D-BUS about low memory
    condition. Applications visible to user or otherwise non-background
    killable are then supposed to free their caches and/or disable features
    that could take a lot of additional memory.  If the caches are from [[Heap_memory|heap]]
    instead of memory mapped, it's less likely to help because of [[Heap_memory|heap]]
    fragmentation and it requiring more work/time though.

#### LSM-based low-memory notification

-   Paul Mundt submitted a patch to CELF for the 2.6.12 kernel which
    provided low-memory notifications to user space. See
    [Accurate\_Memory\_Measurement\#Nokia\_out-of-memory\_notifier\_module](http://eLinux.org/Accurate_Memory_Measurement#Nokia_out-of-memory_notifier_module "Accurate Memory Measurement")
    for more information.
    -   This module was based on the Linux Security Module system, which
        has been removed from recent kernels.

### Type-based memory allocation (old)

This is a mechanism (prototyped in the 2.4 kernel by Sony and Panasonic)
to allow the kernel to allocate different types of memory for different
sections of a program, based on user policy.

See [Memory Type Based
Allocation](http://eLinux.org/Memory_Type_Based_Allocation "Memory Type Based Allocation")

## Additional Resources/Mailing Lists

-   [LinuxMM](http://linux-mm.org) - links to various sub-projects, and
    acts as a centralized point for discussion relating to memory
    management topics ([linux-mm](mailto:majordomo@kvack.org) mailing
    list and [archives](http://marc.theaimsgroup.com/?l=linux-mm)).

-   [Everything about memory that a programmer should
    know](http://lwn.net/Articles/250967/)

### Articles on caches

[Excellent paper (2010) by Paul McKenney on how CPU caches
operate](http://www2.rdrop.com/~paulmck/scalability/paper/whymb.2010.07.23a.pdf)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")

