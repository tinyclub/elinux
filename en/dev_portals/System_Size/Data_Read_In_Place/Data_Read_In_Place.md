> From: [eLinux.org](http://eLinux.org/Data_Read_In_Place "http://eLinux.org/Data_Read_In_Place")


# Data Read In Place



This page has information about "Data Read-In-Place", which is of
interest to CE Linux Forum members, because it allows data pages to
reside on ROM or flash, until they are written to. This is essentially a
form of XIP, or copy-on-write, for data pages. XIP is used to keep text
segment pages in flash permanently. This technique ("DRIP") is used to
keep data pages in flash until they are written to. Since many
application data pages are never written to, the net effect is a
substantial reduction in RAM usage for application data segments. This
feature was also called "Data Allocate On Write" previously, but the
name "Data Read In Place" is closer to the already-existing term for
text (Execute In Place), and is now preferred.

The total effect for one system measured by Panasonic was a reduction of
26% of the page cache allocated to processes, when the product was in
the stand-by state.

The technique was described by Masashige Mizuyama, Chief Architect in
the System Architecture Develompent Group, Base System Development
Center, Panasonic Mobile Communications Co., Ltd.

## Description

There is no need to change kernel code for this feature. We changed the
dynamic linker (in glibc of MVL CEE3.1) only. This was used with a 2.4.x
Linux kernel.

Usually, the dynamic linker maps each ELF segment to the virtual address
space of the process, using mmap.

We change it as follows:



         if(segment includes a .data section){
            Do mmap(), forcing PROT_WRITE bit off. ------(1)
            Set PROT_WRITE bit on, with mprotect(). ------(2)
         } else {
           Do mmap() as usual.
         }


 This is very simple.

Below is the description of how it works.

When the XIP ELF shared library is dynamically linked at runtime,
because the PROT\_WRITE bit is off ((1) above) when the section is
mmap'ed, the kernel assumes the linker is mapping an XIP text segment.
So the kernel builds a page directory table to map every physical ROM
page of the segment to the process virtual address space. Each page
table entry (PTE) is write-proctected.

Then, becaused of the mprotect call setting PROT\_WRITE on the mapped
area, the virtual memory area for the segment has write permission (in
the kernel vm\_area\_struct). The write permission combination of PTE
and vm\_area\_struct is identical with a page which is enabled "copy on
write".

So, the the pages in the segment are mapped to ROM pages directly until
they are written.

This is a kind of "fake" approach to support the feature with minimal
changes. So there are some pitfalls to this approach. One problem we
already notice is that get\_user\_pages() does not work a segment mapped
like this.

The get\_user\_pages() function is used for mlock, ptrace and core dump
by kernel. So they don't work for the segment correctly with the current
implementation.

However, the advantage was much enough for us, we decided to use it. I
think the implementation needs to be cleaned up by adding direct kernel
support for this type of page mapping. }}}

## Documents

-   Information about this technology is included in the Panasoinc
    presentation made at the CELF [International Technical
    Jamboree](http://eLinux.org/International_Technical_Jamboree "International Technical Jamboree").
    -   [Making Mobile Phone with CE
        Linux](http://eLinux.org/images/a/a5/CELF_Technical_Jamboree_June13.pdf "CELF Technical Jamboree June13.pdf")
        by Masashige Mizuyama (Panasonic Mobile Communications), June
        2005
        -   see pages 6 - 12 of the presentation

## draft patch

This patch can be applied to the runtime linker [what program is this?
ld-linux.so??]



    *** dl-load7.c    Mon Jul 11 21:26:47 2005
    --- dl-load.c    Sat Jan  8 11:37:38 2005
    ***************
    *** 801,819 ****
    --- 801,849 ----
        if (! (locked_load_mode & (RTLD_LOCK_DEPENDENT_LIB_PAGES
                       | RTLD_LOCK_LIB_PAGES)))
          {
    +      if((prot & PROT_WRITE) != 0 ){
    +     prot = (prot & ~PROT_WRITE);
    +       mapat = __mmap ((caddr_t) mapstart, len, prot,
    +               fixed|MAP_COPY|MAP_FILE,
    +               fd, offset);
    +         if (mapat != MAP_FAILED){
    +       prot = (prot | PROT_WRITE);
    +       if( __mprotect(mapat,len,prot)==-1){
    +         return N_("failed to map segment from shared object");
    +       }
    +     } else {
    +       return N_("failed to map segment from shared object");
    +     }
    +      } else {
            mapat = __mmap ((caddr_t) mapstart, len, prot,
                    fixed|MAP_COPY|MAP_FILE,
                    fd, offset);
            if (mapat == MAP_FAILED)
          return N_("failed to map segment from shared object");
    +      }
          }
        else if (locked_load_mode & RTLD_LOCK_MLOCK)
          {
    +      if((prot & PROT_WRITE) != 0 ){
    +     prot = (prot & ~PROT_WRITE);
    +       mapat = __mmap ((caddr_t) mapstart, len, prot,
    +               fixed|MAP_COPY|MAP_FILE,
    +               fd, offset);
    +         if (mapat != MAP_FAILED){
    +       prot = (prot | PROT_WRITE);
    +       if( __mprotect(mapat,len,prot)==-1){
    +         return N_("failed to map segment from shared object");
    +       }
    +     } else {
    +       return N_("failed to map segment from shared object");
    +     }
    +       } else {
            mapat = __mmap ((caddr_t) mapstart, len, prot,
                    fixed|MAP_COPY|MAP_FILE,
                    fd, offset);
            if (mapat == MAP_FAILED)
          return N_("failed to map segment from shared object");
    +       }
            if (mlock((caddr_t) mapat, len) != 0)
          {
            return N_("failed to memory lock segment from shared object");


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")

