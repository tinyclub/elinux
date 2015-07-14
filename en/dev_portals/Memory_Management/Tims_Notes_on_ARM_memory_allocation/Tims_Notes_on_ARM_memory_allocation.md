> From: [eLinux.org](http://eLinux.org/Tims_Notes_on_ARM_memory_allocation "http://eLinux.org/Tims_Notes_on_ARM_memory_allocation")


# Tims Notes on ARM memory allocation



This page has a collection of notes that I made while working on the
stack limit patches for Sony. This was a set of patches that tried to
map kernel memory areas as 4K pages, so that an individual page of the
stack could be unmapped, and a page fault generated, when stack space
was running low. (This was related to testing an implementation of 4K
stacks on ARM).

These notes are placed here in the hopes that they will be useful for
someone working on ARM memory management.



## Contents

-   [1 startup memory](#startup-memory)
-   [2 page tables](#page-tables)
    -   [2.1 paging\-init()](#paging-init)
-   [3 Nomenclature](#nomenclature)

## startup memory

At start up the kernel (usually) automatically determines the physical
memory areas. However, the user can manually specify one or more
physical memory areas using "mem=..." kernel command line options. When
used, these override any automatically determined values. These are
parsed by early\_mem().

The initial description of physical memory regions are stored in the
global 'meminfo' structure, and each region is described as a 'bank'.
Some initial physical memory is utilized by the bootmem allocator. It is
from this pool of physical memory, that the page tables are built, which
allows the MMU to be turned on, and the kernel switched over to virtual
memory. Once this process is done, the bootmem pool is freed and all
system pages are turned over to the various page and slab allocators of
the system. A good reference for this is Mel Gorman's excellent book on
the topic: [Understanding the Linux Virtual Memory
Manager](http://www.kernel.org/doc/gorman/pdf/understand.pdf) The prior
link is to the PDF, here's a link to html:
[http://www.kernel.org/doc/gorman/html/understand/](http://www.kernel.org/doc/gorman/html/understand/)
Chapter 5 talks about the bootmem allocator.

## page tables

The page tables are, unsurprisingly, initialized by paging\_init(). ARM
uses a somewhat weird way of mapping the Linux page tables onto the ARM
hardware tables. This method is described in comments in the file
arch/arm/include/asm/pgtable.h, with additional macros defined in
pgtable-hwdef.h and page.h. Basically, Linux supports 4 levels (pgd,
pud, pmd, and pte), and ARM maps this onto 2 levels (pgd/pmd and pte).
The nomenclature in the code is hard to follow, because Linux generic
code thinks that pgd is the top level of page tables, but internally the
ARM code uses pmd macros to refer to the top hardware page table.

Originally, Linux used 4KB mappings for ARM, but they have converted
over to mostly 1MB mappings (at least for the Linux kernel). According
to my colleague, Frank Rowand, bad things happen if a physical page is
represented in the page table by more than one entry (for example, if a
physical page has both an entry as a small page in a second-level page
table, and is inside a region covered by a large "section" page entry in
a first-level page table.

At the hardware level, ARM supports two page table trees simultaneously,
using the hardware registers TTBR0 and TTBR1. A virtual address is
mapped to a physical address by the CPU depending on settings in TTBRC.
This control register has a field which sets a split point in the
address space. Addresses below the cutoff value are mapped through the
page tables pointed to by TTBR0, and addresses above the cutoff value
are mapped through TTBR1. TTBR0 is unique per-process, and is in
current-\>mm.pgd (That is, current-\>mm.pgd == TTBR0 for that process).
That is, when a context switch occurs, the kernel sets TTBR0 to the
current-\>mm.pgd for new process. TTBR1 is global for the whole system,
and represents the page tables for the kernel. It is referenced in the
global kernel variable swapper\_pg\_dir. Note that both of these
addresses are virtual addresses. You can find the physical address of
the first-level page table by using virt\_to\_phys() functions on these
addresses.

I found the following ARM reference material helpful in trying to
understand the page table layout:
[http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0333h/Babbhigi.html](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0333h/Babbhigi.html)
- this is the chapter on the MMU in the ARM1176JZ-S Technical Reference
Manual. In particular, diagram 6.9 showing ARMv6 section, supersection
and page translation, in section 6.11.2 of the manual is very useful. It
is
[here.](http://infocenter.arm.com/help/topic/com.arm.doc.ddi0333h/ch06s11s02.html)

Note that in particular, the second-level page table (PTE) layout is
weird. The ARM hardware supports 1K tables at this level (256 entries of
4bytes each). However, the Linux kernel needs some bits that are not
provided on some hardware (like DIRTY and YOUNG). These are synthesized
by the ARM MMU code via permissions and faulting, effectively making
them software-managed. They have to be stored outside the hardware
tables, but still in a place where the kernel can get to them easily. In
order to keep things aligned into units of 4K, the kernel therefore
keeps 2 hardware second-level page tables and 2 parallel arrays
(totalling 512 entries) on a single page. When a new second-level page
table is created, it is created 512 entries at a time, with the hardware
entries at the top of the table, and Linux software entries (synthesized
flags and values) at the bottom.

The kernel has a mixture of 1MB mappings and 4KB mappings. This relieves
some pressure on the TLB, which is used by the CPU to cache
virtual-to-physical address translations.

### paging\_init()

The page tables and paging infrastructure are initialized as follows:

-   paging\_init() is called by setup\_arch() after the meminfo
    structure has been initialized and the bootmem allocator is ready.
    It calls the following routines:
    -   memblock\_set\_current\_limit()
    -   build\_mem\_type\_table() - builds a table of memory types. This
        has the page protection flags that are available for different
        memory types, for the current ARM processor. Different ARM
        processors have changed what flags they use, and where they are
        located in the page table entries, over the years. the
        'mem\_types' table encapsulates the settings for the running
        processor.
    -   prepare\_page\_table() - this zeros out certain areas of the
        first-level page table (called pmd in this routine). For
        example, it zeros out the areas of the page table that will be
        covered by user-space (areas below the start of the kernel
        address space).
    -   map\_lowmem() - create the memory mappings (page table entries)
        for the lower portions of kernel memory. This is the "normal"
        memory that will be used by the kernel for static code and data,
        stack, and regular dynamic allocations.
    -   devicemaps\_init() - create the memory mappings for special CPU
        areas (e.g. cache flushing regions, and interrupt vectors) and
        reserved IO areas in the memory map.
    -   kmap\_init() - create the memory mapping for highmen ('pkmap')

A call tree for a regular page table setup is:

     start_kernel()
       setup_arch()
         paging_init()
           map_lowmem()
             create_mapping()
               alloc_init_pud() - for a range of pgd entries
                 alloc_init_section() - for a range of "pud" entries
                   *pmd = __pmd(<stuff>) - actually set the pmd/pgd entries for a SECTION mapping
                   or
                   alloc_init_pte()
                     early_pte_alloc() - to get a page for the pte table
                       pte_offset_kernel() - get address of 'linux' portion of pte table page
                     set_pte_ext(<stuff>) - create the individual PTE entries, for a range of entries
                   =>  cpu_set_pte_ext() - macro to wrapper calling through a cpu-specific routine
                   =>  processor.set_pte_ext() - function pointer to cpu-specific routine
                   =>  cpu_armXXX_set_pte_ext() or cpu_procvX_set_pte_ext - cpu-specific-routine

set\_pte\_ext ('set page table entry extended') takes the following
arguments:

-   pte - pointer to pte entry to change (the address of the linux entry
    - not the 'hardware' entry)
-   value - the value to place in the entry - this is usually created
    with the macro pfn\_pte(x,y), where x has the page frame number
    (physical address of the page for this mapping), and y represents
    the protection flags for the page. This should be the 'linux' flags
    for the page.
-   value2 - the value to place in the "extended" or "extra" entry

Note that the assembly routine for this, which is cpu-specific, will
take the Linux PTE values and derive appropriate hardware mappings for
the hardware PTE entry.

## Nomenclature

-   pgd = page global directory
-   pud = page upper directory
-   pmd = page middle directory
-   pte = page table entry (this is confusion, 'pte' can refer to both
    the table and an entry in the table)
    -   ptep = pointer to pte entry
-   pfn = page frame number = the base address (no bottom bits) of a
    physical page address


