> From: [eLinux.org](http://eLinux.org/Memory_Type_Based_Allocation "http://eLinux.org/Memory_Type_Based_Allocation")


# Memory Type Based Allocation



## Contents

-   [1 Introduction](#introduction)
-   [2 Purpose of Feature](#purpose-of-feature)
-   [3 Feature Requirements](#feature-requirements)
-   [4 High Level Design](#high-level-design)
    -   [4.1 Memory Type Information in ELF Binaries and the Elfmemtypes
        Utility](#memory-type-information-in-elf-binaries-and-the-elfmemtypes-utility)
-   [5 The MTA Config File and the Mtaconfig
    Script](#the-mta-config-file-and-the-mtaconfig-script)
    -   [5.1 define\-node keyword](#define-node-keyword)
    -   [5.2 tag\-elf keyword](#tag-elf-keyword)
    -   [5.3 Load\-elf\-binary()](#load-elf-binary)
    -   [5.4 load\-elf\-interp()](#load-elf-interp)
    -   [5.5 The Program Interpreter
        (ld-so)](#the-program-interpreter-ld-so)
    -   [5.6 memtypes\-to\-nodelist()](#memtypes-to-nodelist)
    -   [5.7 The node\-list Object](#the-node-list-object)
    -   [5.8 do\-mmap\-nodelist() and
        do\-brk\-nodelist()](#do-mmap-nodelist-and-do-brk-nodelist)
    -   [5.9 setup\-arg\-pages()](#setup-arg-pages)
-   [6 Page Fault Exception Handler](#page-fault-exception-handler)
-   [7 Allocating Pages](#allocating-pages)
-   [8 Default Page Allocator](#default-page-allocator)
-   [9 Allocating Pages With a Node
    List](#allocating-pages-with-a-node-list)
-   [10 Kernel API’s](#kernel-api-e2.80-99s)
    -   [10.1 Allocating Whole Pages,
        alloc\-pages\-nodelist()](#allocating-whole-pages-alloc-pages-nodelist)
    -   [10.2 Slab Allocator,
        kmalloc\-nodelist()](#slab-allocator-kmalloc-nodelist)
    -   [10.3 do\-mmap\-nodelist() and
        do\-brk\-nodelist()](#do-mmap-nodelist-and-do-brk-nodelist-2)
-   [11 User API’s](#user-api-e2.80-99s)
    -   [11.1 Mmap\-memtypes() and
        brk\-memtypes()](#mmap-memtypes-and-brk-memtypes)
    -   [11.2 /proc Interface](#-proc-interface)
        -   [11.2.1 /proc/nodeinfo](#-proc-nodeinfo)
        -   [11.2.2 /proc/[pid]/nodemap](#-proc-pid-nodemap)
-   [12 Tracing MTA with Linux Trace
    Toolkit](#tracing-mta-with-linux-trace-toolkit)
-   [13 Additional Information](#additional-information)
    -   [13.1 Porting MTA to other
        Architectures](#porting-mta-to-other-architectures)
    -   [13.2 Limitations](#limitations)
    -   [13.3 Future Enhancements](#future-enhancements)
    -   [13.4 Notes](#notes)
    -   [13.5 Source Code](#source-code)

## Introduction

This specification describes the design for a Linux kernel memory
manager that can locate a program’s executable code and data in
different physical memory devices.

## Purpose of Feature

Embedded systems can use this feature to locate a program’s text and
data segments in specific memory devices. Shared library text and data
segments can also be targeted to specific memory devices. For instance,
frequently executed code, such as glibc or "ls", could be located
entirely in a single specified memory device or a set of memory devices.
Glibc text/data could be targeted to a fast static RAM bank for
instance, while other less frequently referenced libraries and programs
could be located in slower DRAM.



## Feature Requirements

1.  All of a program’s segments must be locatable in specified memory
    devices: text, initialized data (data), unitialized data (bss),
    [heap](http://eLinux.org/Heap_memory "Heap memory") (brk), and stack.
2.  The loadable segments of shared libraries (text and initialized
    data) must be locatable in specified memory devices.
3.  The ELF binaries of programs and shared libraries must contain
    memory device information for each of the binaries’ loadable
    segments (text and initialized data). This must be in the form of
    mnemonic strings. For instance: "SRAM", "SDRAM", etc.
4.  A tool will be provided to mark the ELF binaries with memory device
    information for each of the loadable segments.
5.  A kernel API must be provided for kernel code (such as device
    drivers) to allocate whole page frames from specified memory
    devices.
6.  A kernel API must be provided for kernel code to allocate memory
    using the slab allocator (kmalloc()) from specified memory devices.
7.  A user-level API must be provided for User program’s to create
    mappings, using the mmap() system call, that will allocate page
    frames for the mapping in specified memory devices.
8.  A /proc filesystem interface must be provided that prints the
    kernel’s node configuration.

## High Level Design

Memory devices in Memory Type Based Allocation (MTA) are based on
discontiguous memory support. Traditionally, discontiguous memory is
meant for platforms whose system memory is not contiguous in the
physical memory map. Discontiguous memory in Linux in turn is based on
Non-Uniform Memory Access (NUMA) nodes. Each discontiguous memory bank
is represented by a NUMA node. Therefore in MTA memory devices are also
synonymous with NUMA nodes. Note: to execute a user program directly out
of ROM, such as flash, requires a totally different approach from that
described here.

To understand MTA, it’s best to first describe the memory device type
information contained in the ELF binary of programs and shared
libraries. Then we describe how memory nodes are configured in the
kernel. We then follow the path and morphing of the memorytype data from
its source (the ELF binary) until it reaches the lowest level: when its
used to allocate a page frame for the process during a page fault
exception.

### Memory Type Information in ELF Binaries and the Elfmemtypes Utility

In MTA, memory device type information is added to the ELF binaries of
programs and shared libraries using the elfmemtypes utility. This
information is then passed down to the mmap() and brk() calls to create
new memory regions for the process. The elfmemtypes tool adds memory
type information by adding a new NOTE section with the name ".memtypes"
to the ELF binary. It does this by forking and running objcopy as
follows:

    objcopy --add-section .memtypes=[temp binary file] [ELF file]

The memory type mnemonic strings specified to the tool are copied to a
temporary file, and that file is passed to objcopy, which copies the
temporary file’s contents to the new .memtypes section. Currently, the
elfmemtypes tool allows specifying memory types for the text segment and
data segment. The text segment includes code and read-only data
sections, and therefore all these sections will be allocated to the
memory types specified for text. Likewise, the data segment includes
initialized data (data) and uninitialized data (bss), so all these
sections will be allocated to the memory types specified for data. Also,
although there are no [heap](http://eLinux.org/Heap_memory "Heap memory") (brk) and stack
sections defined for ELF binaries, [heap](http://eLinux.org/Heap_memory "Heap memory")
and stack regions for the new process currently use the memory types
specified for data. A future enhancement will be to allow data, bss,
brk, and stack regions to have their own memory types. The command line
arguments to the tool are as follows to mark an ELF binary:

    elfmemtypes [ELF file] [{text|data} [space-seperated list of mnemonics]]

An example command line might be:

    elfmemtypes /bin/bash text SRAM SDRAM0 ANY data SDRAM1

In the example, /bin/bash is marked so that its text segment will have
physical memory allocated to it from the memory node named SRAM. If
allocation from SRAM fails, allocate from SDRAM0. If allocation from
SDRAM0 fails, allocate from any available node. Finally, /bin/bash is
marked so that its data segment only allows allocation of physical
memory from the memory node named SDRAM1. A more detailed description of
the algorithm for allocating physical pages using the above memory node
lists is discussed later. Note that the mnemonics ANY, any, text, and
data are reserved names, i.e. they cannot be used for memory type
mnemonic names. If a .memtypes NOTE section already exists in the ELF
file, the memory types specified in the section will be left undisturbed
unless they are overriden on the command line. For example, if the
existing .memtypes NOTE section lists memory types for both text and
data, but the command line specifies only data memory types, the
existing text memtypes will be left unchanged, but the data memtypes
will be modified. The elfmemtypes tool can also be used to display the
current memory type information in an ELF file, or clear out all memory
types information from the file. The command line forsuch cases is as
follows:

    elfmemtypes [ELF file] [{show|clear}]

(or just elfmemtypes [ELF file] to display the current memory type
information). When clearing an ELF file, elfmemtypes simply removes the
.memtypes NOTE section by forking and running objcopy like so:

    objcopy --remove-section=.memtypes [ELF file]

Note that a non-MTA configured kernel or non-MTA aware ld.so can still
load ELF executables and shared libraries that contain a .memtypes NOTE
section, since this section will just be ignored. Note also that
elfmemtypes does not check whether a memory type name corresponds to any
kernel node names. This is because the tool is meant to be a cross tool
as well as a native tool. As a cross tool, elfmemtypes has no way of
knowing the node names of the target kernel. See the
"load\_elf\_binary()" section below to see how the kernel handles
unknown memory mnemonics in the .memtypes NOTE section. As a native
tool, it is possible for elfmemtypes to compare memory mnemonic names
with kernel node names by reading /proc/nodeinfo (described later), and
this could be a future enhancement. The structure of the new .memtypes
NOTE section in the ELF file added by the tool is shown below:

    typedef struct elf32_memtypes_note {
        Elf32_Nhdr nh;
        char note_name[16];
        Elf32_Word num_text_strings;
        Elf32_Word text_string_size;
        Elf32_Word num_data_strings;
        Elf32_Word data_string_size;
        char memtype_strings[0];
    } Elf32_MemTypesNote;

The nh member contains the NOTE header, note\_name is the name of the
NOTE ("memtypes"), and the rest specify the number and total size of the
text and data mnemonic strings. The member memtype\_strings then marks
the start of the null-terminated mnemonic strings, beginning with text.
The data strings immediately follow the text strings, so the data
strings begin at
&memtype\_strings[text\_string\_size](http://eLinux.org/index.php?title=Text_string_size&action=edit&redlink=1 "Text string size (page does not exist)").

## The MTA Config File and the Mtaconfig Script

The MTA config file (and its associated parsing script mtaconfig) is
used for two purposes: defining nodes for building an MTA-enabled
kernel, and marking ELF binaries with memory types for text/data. The
MTA config file syntax defines two keywords for these purposes.

### define\_node keyword

To define nodes for configuring a kernel, use the following MTA config
file line:

    define_node [name] [start physaddr] [end physaddr] [0|1]

-   name is the mnemonic name for the node.
-   start physaddr is the starting physical address for the node, in
    hex.
-   end physaddr is the end physical address for the node, in hex.
-   0|1 is a flag, 1 means allow allocation from this node when no list
    of nodes to allocate from is provided to the kernel page allocator.
    This flag is described in more detail later.

An example line in the config file might be:

    define_node SRAM 20000000 2002E000 0

which defines a node with the name SRAM to be located between 0x20000000
and 0x2002E000 physical, and do not allow default page allocation from
this node.

Node ID numbers are assigned in the order the define\_node keywords
appear in the config file. So if the above line was the first
define\_node line in the file, SRAM would be assigned node ID 0.

The mtaconfig script will output a C header file that can be used when
compiling the kernel. For this purpose it is called as follows:

    mtaconfig [MTA config file] makehdr

This command is used by the kernel Makefile’s when confuring an MTA
kernel. If the makehdr argument is not specified, define\_node keywords
in the config file are ignored and no header file is produced.

The content of the C header file produced by mtaconfig is an array of
structures containing the same information as the define\_node lines in
the MTA config file. Each entry in the array is of type struct
mta\_node, and is defined as follows:

    struct mta_node {
        char * name;
        unsigned long start;
        unsigned long end;
        int allow_def_page_alloc;
    };

A macro in the generated header file called INSTANTIATE\_MTA\_NODES will
instantiate the mta\_nodes[] array. This is done in mm/numa.c in the
kernel source.

### tag\_elf keyword

The second use for the MTA config file is to mark ELF binaries in a
target file system with memory type information. This is simply a
convenience, it allows a file system’s memtypes configuration to be
described in a single location, instead of having to invoke the
elfmemtypes tool many times to configure the file system.

Use the following line to mark an ELF binary with memory type info:

    tag_elf [ELF file path] [{text|data} [comma-seperated list of mnemonics]]

Notice that the command line is almost identical to the elfmemtypes tool
command line, except that the memtypes list is comma-seperated rather
than space-seperated. Also, text and data lists can be seperated on
different lines. An example config file entry might be:

    tag_elf /target_root/bin/bash
     text SRAM,SDRAM0,any
     data SDRAM1

The command line to the mtaconfig script to process the tag\_elf lines
is as follows:

    mtaconfig [MTA config file] tag

The script will call the elfmemtypes tool once for every tag\_elf line
found in the config file. Unlike the elfmemtypes tool, mtaconfig can
check if the memory type names correspond to any kernel node names,
because the node names are listed in the MTA config file itself. If any
memory names listed on the tag\_elf line have not been defined in a
define\_node line up to this point in the config file, mtaconfig prints
an error message and skips tagging the ELF file. Finally, a file
system’s memtype information can be completely cleared out with the
following command line:

    mtaconfig [MTA config file] clear

The script will call the elfmemtypes tool with the clear argument once
for every tag\_elf line found in the config file.

### Load\_elf\_binary()

The function load\_elf\_binary() is an implementation of the
load\_binary() method of the linux\_binfmt object, for ELF binaries. It
is called by do\_execve() when loading a new program for execution.

The job of load\_elf\_binary() is to read the executable file’s program
segments, and pass that segment info to do\_mmap() for every loadable
segment program header found, which then actually creates the file
mapped regions. Loadable program headers are of type PT\_LOAD.

For MTA, load\_elf\_binary() also locates and reads the .memtypes NOTE
section containing the memory types list. It then converts the mnemonic
names to node ID’s and passes that information to new functions
do\_mmap\_nodelist() and do\_brk\_nodelist(). The node ID’s are inserted
into a structure of type struct node\_list and a pointer to the
structure is passed to do\_mmap\_nodelist() and do\_brk\_nodelist(), and
is described later.

If any of the mnemonic names listed in the .memtypes NOTE section do not
match any of the kernel’s node names, the node list is disabled for that
segment (text or data). That is, the text/data memory region will not
have node preferences, and will have pages allocated for that region
from any available node.

### load\_elf\_interp()

Load\_elf\_interp() is called by load\_elf\_binary() when the latter
function discovers a program header of type PT\_INTERP. This header
describes the interpreter program that is to be used to dynamically load
the shared libraries that the program requires.

It’s the job of load\_elf\_interp() to load the segments of the
interpreter itself, so that when the program begins executing, the
interpreter is actually the first code to execute.

For MTA, load\_elf\_interp() locates and reads the NOTE section
containing the memory types list from the interpreter binary, converts
the list to node ID’s, and passes that information to
do\_mmap\_nodelist() and do\_brk\_nodelist(). Just like
load\_elf\_binary(), the node info is inserted into a structure of type
struct node\_list (described later).

### The Program Interpreter (ld.so)

Ld.so is actually the first piece of code to execute when a new program
runs. Ld.so runs in user space, and it’s job is similar to
load\_elf\_interp(). It loads (maps) the text, data, and bss segments of
every shared object listed in the main program.

For MTA, ld.so reads the NOTE section containing the memory types list
of every shared object binary, and passes that information to a new
mmap\_memtypes() system call. The memory types list passed to
mmap\_memtypes() is a buffer holding the null-terminated memory type
mnemonic strings. The mmap\_memtypes() system call is described in more
detail later.

Because ld.so is part of glibc, a new version of glibc is required to
load shared objects in the correct nodes.

### memtypes\_to\_nodelist()

The method that converts memory type mnemonics to a node list is
memtypes\_to\_nodelist(), and it has the following interface: void
memtypes\_to\_nodelist(struct node\_list \* nl, char \* names, int
size);

The names argument is a pointer to a buffer holding a packed list of
null-terminated mnemonic strings. That is, each null-terminated string
starts immediately after the previous string’s null-termination
character in the buffer. The size argument is the total size of the
buffer in bytes, including the null characters. The buffer must be a
kernel buffer, it cannot be a user-space buffer. If any of the names in
the buffer do not match any of the kernel’s node names, the node list is
disabled by setting nl-\>depth to zero (see next).

### The node\_list Object

The struct node\_list object is defined as follows:

    struct node_list {
        unsigned int nid[MAX_NR_NODES]; /* ID of nodes to alloc pages from,
        in order of preference */
        unsigned int depth; /* number of entries in above list */
    };

The number of entries in the node list is limited to MAX\_NR\_NODES,
which is the maximum number of nodes a system could contain, currently
set at 16. Therefore depth must be less than MAX\_NR\_NODES. A depth of
zero is valid, meaning the node list is empty or disabled.

In addition, each entry in nid[] must be a valid node ID, i.e. it must
be in the range 0 to numnodes-1, where numnodes is the number of nodes
in the system.

The following method checks these conditions, and returns -EINVAL if any
are false:

check\_nodelist(struct node\_list \* nl);

All of the kernel methods that take a node list as input (such as
do\_mmap\_nodelist() and do\_brk\_nodelist()) call check\_nodelist() to
verify that the node list is valid. The section "Kernel API’s" below
describes how each method behaves when given an invalid node list.

### do\_mmap\_nodelist() and do\_brk\_nodelist()

Load\_elf\_binary(), load\_elf\_interp(), and ld.so convert the
.memtypes NOTE section from the ELF binary into a node list via
memtypes\_to\_nodelist(), and pass the resultant struct node\_list
object to the new methods do\_mmap\_nodelist() and do\_brk\_nodelist().
From this point on in the data flow of memory type information, the
memory types are in the form of node ID’s rather than mnemonic strings.

do\_mmap\_nodelist() and do\_brk\_nodelist() have the same arguments as
the original do\_mmap() and do\_brk(), with the addition of the struct
node\_list pointer.

The primary job of do\_mmap\_nodelist() and do\_brk\_nodelist() is to
instantiate a new memory region descriptor for the requested range of
program adddresses. In Linux the memory region descriptor is an object
of type struct vm\_area\_struct, and is commonly referred to as a "VMA"
(Virtual Memory Area).

In MTA, the node list information is added to the VMA with a struct
vm\_node\_list vm\_nodes member. The struct vm\_node\_list object
contains a node list as well as information important to the VMA, and is
defined as follows:

    struct vm_node_list {
        struct node_list nl; /* the node list */
        unsigned long pgstart; /* if this node info belongs to a file mapping,
                    the start page offset in the file */
        unsigned long pgend;    /* and end page offset */
        unsigned long flags;    /* unused */
    };

Two struct node\_list object’s are also added to a process’ memory map
descriptor (struct mm\_struct), one each for the process’ text and data
regions (member names text\_nodes and data\_nodes in struct mm\_struct).

After the new VMA is instantiated, do\_mmap\_nodelist() and
do\_brk\_nodelist() copy the passed struct node\_list object to the VMA,
but only if the node list is valid as indicated by check\_nodelist()
(see Kernel API’s below).

If the passed struct node\_list pointer is null, or the list is empty
(depth is zero), do\_mmap\_nodelist() and do\_brk\_nodelist() check to
see if text\_nodes or data\_nodes in the calling process’ struct
mm\_struct are enabled (depth is non-zero). If so, do\_mmap\_nodelist()
and do\_brk\_nodelist() copy to the VMA either text\_nodes or
data\_nodes depending on whether the region being mapped is text or
data. This ensures that, even if the mapping doesn’t pass a node list,
the new region will still use any node preferences listed by the
executable.

With the creation of the VMA, the program is now allowed to reference
addresses within the memory region described by the VMA. However, no
actual page frames for the region are available yet. The job of
allocating page frames for the program’s memory region goes to the Page
Fault Exception Handler. This is part of Linux’s demand paging
mechanism: memory pages are allocated to the program only as they are
needed (referenced) by the program.

The important point here however, is that the memory regions contain the
node ID’s needed by the page fault handler, so that it can allocate
pages in the correct nodes for the region. This is described later.

### setup\_arg\_pages()

Setup\_arg\_pages() is called by load\_elf\_binary() to create the
memory region for the program’s stack, which includes the program stack
and also the argument strings to the program and environment variables
that the program inherited. When setup\_arg\_pages() instantiates the
new VMA for the stack region, it simply copies the struct node\_list
data\_nodes from the memory descriptor to the new VMA.

However, there is one small glitch. Before load\_elf\_binary() was even
called, in do\_execve(), pages were already allocated for the argument
and environment strings. These pages were allocated using the default
node round-robin approach (because no node info was known at that time),
so the pages almost certainly were not allocated from the correct node
for the stack region. Therefore setup\_arg\_pages() needs to allocate a
new page in the correct node for every page already allocated, copy the
page contents from the old to new page, and then release the old page.

## Page Fault Exception Handler

When the program references a valid address within one of the program’s
memory regions, a page fault exception occurs if the address is not yet
listed in any of the process’ page tables. The page fault exception
handler goes about allocating pages for the faulting region, and creates
the page tables that point to the new page.

For MTA, the exception handler will allocate the page from the correct
node as described in the faulting region’s vm\_node\_list object. This
includes allocating pages in all of the following situations: anonymous
mappings, private and shared file mappings, and copy-on-write pages for
private mappings.

## Allocating Pages

At the lowest level of page allocation, the buddy system page allocator
\_ \_alloc\_pages(), is passed a node descriptor pointer of type
pg\_data\_t. This descriptor contains information related to the NUMA
node, such as the number of "memory zones" contained in the node, the
pointer to the start of the struct page \* list of pages contained in
the node, the start physical address of the node memory, and the node
ID.

\_ \_alloc\_pages() is used by both the standard/default page allocator
\_alloc\_pages(), and by the MTA page allocator
alloc\_pages\_nodelist(). Internally, \_ \_alloc\_pages() attempts to
allocate pages atomically (without blocking the calling process). If
that fails and the \_ \_GFP\_WAIT bit is set in gfp\_mask, it
"rebalances" the memoru zone within the node, and attempts the
allocation again. If that fails, it blocks the calling process and
yields to the kswapd daemon. When \_ \_alloc\_pages() returns from
kswapd, it returns NULL to allow either \_alloc\_pages() or
alloc\_pages\_nodelist() to try again with a different node (the default
non-MTA behavior is to again attempt to allocate pages from the same
node in an endless alloc-kswapd loop until it succeeds).

## Default Page Allocator

The default page allocator is \_alloc\_pages(). It attempts to allocate
from any available node in a round-robin manner. This method has been
slightly modified for MTA. Each configured node in MTA includes a flag
specifying whether \_alloc\_pages() is allowed to allocate pages from
that node. This flag can thus be used to reserve an entire node only for
MTA allocation. An example use might be a node containing a very small
number of physical pages. By reserving the node only for MTA allocation,
it guarantees that it will only be used to allocate pages for process
memory region’s that specify node lists, or for any caller of
alloc\_pages\_nodelist() (described next).

## Allocating Pages With a Node List

A wrapper function is provided to \_ \_alloc\_pages() called
alloc\_pages\_node(), which takes as arguments the node ID of the memory
node to allocate the pages from. It’s interface is:

    struct page * alloc_pages_node(int nid, unsigned int gfp_mask,
            unsigned int order);

Alloc\_pages\_node() in turn is used by the MTA allocator,
alloc\_pages\_nodelist(). It is this latter method that the page fault
exception handler uses to allocate pages using the node information
described by the struct vm\_node\_list object in the faulting VMA. It’s
prototype is:

    struct page * alloc_pages_nodelist(struct node_list * nl, int gfp_mask,
             unsigned int order);

The function is written so that plenty of opportunity is given for
allocation from the first choice node (nl-\>nid[0]) to succeed if the
gfp\_mask includes the \_ \_GFP\_WAIT flag. Note that if \_
\_alloc\_pages() returns NULL when the \_ \_GFP\_WAIT flag is set, it
means kswapd was allowed to run, and therefore pages may have become
free in the first choice node, so we should try again.

Alloc\_pages\_nodelist() accomplishes this behavior with an outer and
inner loop (see the flow chart below for an illustration of the
algorithm). The outer loop increments from zero to nl-\>depth, and the
inner loop increments from zero to the current outer loop index. The
inner loop attempts to allocate a page from nl-\>nid[j], where j is the
inner loop index. The function returns on the first successfull page
allocation. As described above, the underlying buddy system allocator,
\_ \_alloc\_pages(), will first attempt atomic allocation from the node,
and if that fails, will yield to kswapd to free up pages, and then
return NULL back to alloc\_pages\_nodelist().

As an example, suppose we have a node ID list containing {3,1}
(nl-\>depth is 2), and the \_ \_GFP\_WAIT flag is set in gfp\_mask.
Assuming alloc\_pages\_nodelist() ultimately fails, it will attempt
allocation from the nodes in the following order: 3 3 1 3 1. In other
words:

1.  kswapd runs after allocation from 1st choice node 3 fails.
2.  retry node 3 - fails again (kswapd runs again).
3.  try alloc from node 1 (2nd choice node) - fails (kswapd runs).
4.  retry first choice node 3 - fails again (kswapd runs).
5.  retry node 1 - fails again and giveup (return NULL).

It is also possible to attempt allocation from the first choice node
many times by repeating the node in the node list. For example, with a
node ID list containing {3,3,1}, alloc\_pages\_nodelist() attempts
allocation from the nodes in the following order before finally failing:
3 3 3 3 3 1 3 3 1.

Note that if the \_ \_GFP\_WAIT flag is not set, the inner loop is
collapsed, and each node in the list is tried in sequence with no
retries. So given the node list {3,3,1} from the example above,
alloc\_pages\_nodelist() attempts allocation from the nodes in the
following order before finally failing: 3 3 1.

## Kernel API’s

### Allocating Whole Pages, alloc\_pages\_nodelist()

Device drivers or other kernel code that wish to allocate whole memory
pages from a specific node can call alloc\_pages\_nodelist() directly.
If the caller has a list of mnemonic strings, it must first convert the
strings to a node list with memtypes\_to\_nodelist() before calling
alloc\_pages\_nodelist().

For sake of speed in allocating pages during page faults,
alloc\_pages\_nodelist() does not call check\_nodelist() to check the
validity of the passed node list. Instead, it does the following (refer
to the flow chart above):

-   if depth is greater than MAX\_NR\_NODES, fail immediately (return
    NULL).
-   in the inner loop, if the current node ID in the list is invalid,
    skip this entry and move on to the next ID in the list.

Note that the passed node list will never be invalid if
alloc\_pages\_nodelist() was called as a result of a page fault or a
slab allocation, because kmalloc\_nodelist(), do\_mmap\_nodelist(), and
do\_brk\_nodelist() all check the validity of the list beforehand.

### Slab Allocator, kmalloc\_nodelist()

Device drivers or other kernel code that wish to allocate memory of
arbitrary size from a specific node can make use of a new interface to
the slab allocator, kmalloc\_nodelist(), which takes as an extra
argument a pointer to a struct node\_list object. It’s prototype is as
follows:

    void * kmalloc_nodelist (struct node_list * nl, size_t size, int flags);

There is also a new slab interface that allows creation of a new cache
that includes a node list:

    kmem_cache_t *  kmem_cache_create_nodelist (struct node_list * nl,
            const char *name, size_t size, size_t offset, unsigned long flags,
                void (*ctor)(void*, kmem_cache_t *, unsigned long),
                void (*dtor)(void*, kmem_cache_t *, unsigned long));

The new cache can then be used when allocating objects by passing it to
kmem\_cache\_alloc(). The new objects will be allocated from the nodes
listed in the cache objects node list.

Both of these new methods perform the following checks on the passed
node list:

-   if the node list pointer is NULL, or the list is empty, the new slab
    object or cache will not have any node preference.
-   if the node list is invalid as indicated by check\_nodelist(), both
    methods fail, returning NULL.

### do\_mmap\_nodelist() and do\_brk\_nodelist()

Kernel code that wishes to create new mappings for a process can call
do\_mmap\_nodelist() or do\_brk\_nodelist() directly. The current
prototypes are identical to the original do\_mmap() and do\_brk(), with
the addition of a node\_list pointer as the last argument.

If the passed node\_list pointer is non-NULL and enabled (depth is
non-zero), but the list is invalid as indicated by check\_nodelist(),
the mapping fails, and both methods return -EINVAL.

## User API’s

### Mmap\_memtypes() and brk\_memtypes()

These new system calls are implemented to allow creating memory maps
from user space with node information. They essentially provides
user-level access to the kernel methods do\_mmap\_nodelist() and
do\_brk\_nodelist(). The prototypes are the same as the current system
calls, with two additional arguments:

    void * mmap_memtypes(void *start, size_t length, int prot,
        int flags, int fd,  off_t offset, char * memtypes,
        int memtypes_len);

    int brk_memtypes(void *end_data_segment, char * memtypes,
        int memtypes_len);

The memtypes argument is a pointer to a user buffer holding a packed
list of null-terminated strings. The strings represent the memory type
mnemonics, and their order in the buffer is the order of node preference
for the region. The memtypes\_len argument is the total size of the user
buffer in bytes.

Note that these new libc functions are not reserved by the POSIX
standard. Applications that use them have to be compiled with
-D\_GNU\_SOURCE.

The new syscalls are also used by the dynamic linker (ld.so) in
MTA-aware glibc, to create the maps for a program’s shared libraries.
The following checks are made on the arguments passed to
mmap\_memtypes() and brk\_memtypes():

-   If the memtypes buffer pointer is NULL, or if memtypes\_len is zero,
    the new mapping created will not have any node list preference, i.e.
    it will be as if the regular mmap() and brk() syscalls were used.
-   If the copy of the user buffer to kernel space fails (for instance
    the memtypes pointer is invalid), the mapping fails.
-   There is an upper limit of one page (4096 bytes) on the user buffer
    size. If memtypes\_len is greater than PAGE\_SIZE, the mapping
    fails.
-   If any of the memory type mnemonic names in the memtypes buffer do
    not match any of the kernel’s node names, the new mapping created
    will not have any node list preference.
-   The usual conditions exist on the remaining arguments (for instance,
    for a file mapping the file descriptor must refer to a valid open
    file).

### /proc Interface

There are two new entries in the /proc file system.

#### /proc/nodeinfo

The first is /proc/nodeinfo, which lists the node configuration of the
kernel, including the name, physical address range, and whether default
page allocation is allowed, of each configured node.

#### /proc/[pid]/nodemap

The second is an extension of the Memory Accounting tool. If the kernel
config option CONFIG\_MEMORY\_ACCOUNTING is enabled along with
CONFIG\_MEMTYPE\_ALLOC, a new proc entry, /proc/[pid]/nodemap will be
available. The information is similar to the Memory Accounting Tool’ s
/proc/[pid]/memmap, except that instead of displaying the page usage
counter for every resident page in each region, the node ID of resident
pages are displayed. Pages for a region that are not yet resident are
shown with a dash character "-".

In other words, for every line (region) printed by /proc/[pid]/maps,
/proc/[pid]/nodemap also prints a line, showing the node ID of resident
pages for that region.

## Tracing MTA with Linux Trace Toolkit

Important MTA events are captured by the run-time creation of Linux
Trace Toolkit (LTT) custom events for MTA. The following events are
defined in include/linux/vmnode.h, and are called at the appropriate
locations in the kernel where the corresponding events occur:

-   TRACE\_MTA\_ELF\_MEMTYPES

An ELF executable or ld.so was loaded containing a .memtypes NOTE
section.

-   TRACE\_MTA\_MMAP\_MEMTYPES

Entry to mmap\_memtypes system call with a non-empty memtypes buffer.

-   TRACE\_MTA\_BRK\_MEMTYPES

Entry to brk\_memtypes system call with a non-empty memtypes buffer.

-   TRACE\_MTA\_MMAP\_NODELIST do\_mmap\_nodelist() was called with a
    valid node list.
-   TRACE\_MTA\_BRK\_NODELIST do\_brk\_nodelist() was called with a
    valid node list.
-   TRACE\_MTA\_KMALLOC\_NODELIST kmalloc\_nodelist() was called with a
    valid node list.
-   TRACE\_MTA\_KMEM\_CACHE\_CREATE\_NODELIST
    kmem\_cache\_create\_nodelist() was called with a valid node list.

-   TRACE\_MTA\_SLAB\_ALLOC

A group of contiguous pages were allocated for a slab cache object
containing a node list.

-   TRACE\_MTA\_VMA\_ALLOC

A page was allocated for a copy-on-write, for an anonymous or file
mapping containing a node list.

-   TRACE\_MTA\_PAGE\_CACHE\_ALLOC

A page was allocated and placed in the page cache, for a file mapping
containing a node list.

With these events, it’s possible to trace MTA-related activity from the
time a program was loaded, to the creation of its memory map, down to
the allocation of memory pages for the program. The events can also
trace the creation of new slab caches containing node lists, down to
allocation of pages for the cache objects.

# Additional Information

## Porting MTA to other Architectures

At this time, only the ARM OMAP1510 Innovator platform has MTA support.
To port MTA to other architectures:

-   First of all, the architecture must support discontiguous memory.
-   Add the CONFIG\_MEMTYPE\_ALLOC option to arch/[arch]/config.in if
    CONFIG\_DISCONTIGMEM is defined. See arch/arm/config.in for example.

-   Add system call entry points for sys\_brk\_memtypes() and
    old\_mmap\_memtypes() and define their syscall numbers. See
    arch/arm/kernel/calls.S and include/asm-arm/unistd.h for example.

-   Implement old\_mmap\_memtypes() (sys\_brk\_memtypes() is implemented
    in generic kernel code in mm/mmap.c). See arch/arm/kernel/sys\_arm.c
    for example implementation.

-   Configure the system’s memory nodes using the start and end physical
    addresses of each node in the mta\_nodes[] array. How discontiguous
    memory nodes are initially configured is very architecture specific.
    See include/asm-arm/arch-omap1510/memory.h,
    arch/arm/mach-omap1510/innovator.c, and arch/arm/mm/init.c for an
    example of how this is done for ARM and the Innovator platform.

## Limitations

-   In ELF binaries, the first file page offset of the initialized data
    segment is usually the same file page offset as the last page of
    text (the end of text and start of data share the same page).
    Because of this, the same allocated page frame in the kernel’s page
    cache is shared between the last page of text and the first page of
    initialized data. Therefore, if the program references the last page
    of text after it references the first page of data (which is usually
    the case), the last page of the text region will be located in the
    node of the data region, not in the text’s node.

-   The Innovator’s SRAM is very small, and page allocations from SRAM
    will begin to fail very quickly. The text segment of ld.so happens
    to just barely fit in SRAM. Even then, the kernel will attempt to
    allocate a cluster of pages for a region instead of only one during
    a file mapping page fault, and if that many pages are not free in
    SRAM, the cluster allocation will fail.

## Future Enhancements

-   Expand maximum allowable nodes beyond 16.
-   Allow separation of data/bss/brk/stack segments into different
    nodes.
-   For native elfmemtypes tool, check mnemonic names against
    /proc/nodeinfo.

## Notes

-   Copyright 2002, 2003, 2004 Sony Corporation
-   Copyright 2002, 2003, 2004 Matsushita Electric Industrial Co., Ltd.
-   Copyright © 2002?2004 by MontaVista Software.

## Source Code

[linux-mta-041004.tar.bz2](http://eLinux.org/index.php?title=Special:Upload&wpDestFile=Linux-mta-041004.tar.bz2 "Linux-mta-041004.tar.bz2")
is a kernel soruce archive including MTA. Please someone isolate MTA
funtion from the tarball. [MTA
util](http://eLinux.org/index.php?title=Special:Upload&wpDestFile=Mta-utils.tar.gz "Mta-utils.tar.gz")
and
[mta-glibc-2.2.5.patch](http://eLinux.org/images/1/14/Mta-glibc-2.2.5.patch "Mta-glibc-2.2.5.patch")
are also available.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Memory Type Based
    Allocation](http://eLinux.org/Category:Memory_Type_Based_Allocation "Category:Memory Type Based Allocation")

