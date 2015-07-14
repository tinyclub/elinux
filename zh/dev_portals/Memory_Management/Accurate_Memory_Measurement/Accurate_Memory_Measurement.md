> From: [eLinux.org](http://eLinux.org/Accurate_Memory_Measurement "http://eLinux.org/Accurate_Memory_Measurement")


# Accurate Memory Measurement



## Contents

-   [1 Introduction](#introduction)
-   [2 Panasonic API for accurate memory
    count](#panasonic-api-for-accurate-memory-count)
    -   [2.1 Description Overview](#description-overview)
        -   [2.1.1 Panasonic Presentation
            Excerpts](#panasonic-presentation-excerpts)
    -   [2.2 Description of algorithm](#description-of-algorithm)
    -   [2.3 Patch](#patch)
    -   [2.4 Kernel 2.6 status](#kernel-2-6-status)
-   [3 Sony detailed memory
    accounting](#sony-detailed-memory-accounting)
    -   [3.1 Watching user space program memory
        usage](#watching-user-space-program-memory-usage)
    -   [3.2 Kernel 2.6 status](#kernel-2-6-status-2)
    -   [3.3 Actual Patch](#actual-patch)
-   [4 Nokia out-of-memory notifier
    module](#nokia-out-of-memory-notifier-module)
    -   [4.1 Description](#description)
    -   [4.2 lowmem.c source](#lowmem-c-source)
    -   [4.3 lowmem patch](#lowmem-patch)
-   [5 kpagemap](#kpagemap)
-   [6 Kernelnewbies question about measuring
    memory](#kernelnewbies-question-about-measuring-memory)

## Introduction

This page describes techniques and issues with measuring Linux system
memory accurately. This is important for embedded systems since usually
there is limited memory, and no swap space, available. It is currently
(as of 2.4 and 2.6 kernels) very difficult to get an accurate count of
used and free memory for the system. Having an accurate count could
potentially enable better error handling for out-of-memory conditions,
or error avoidance for low-memory conditions, in CE products.

This page currently lists 3 systems which aid in getting an accurate
memory measurement for the Linux kernel:

-   Panasonic's memory usage API
-   Sony's detailed memory accounting
-   Nokia's out-of-memory notifier module (LSM)

## Panasonic API for accurate memory count

### Description Overview

This technique and API were presented by Panasonic on pages 15-18 of a
presentation available
[http://elinux.org/images//8/83/Pdf.gif](http://elinux.org/images//8/83/Pdf.gif)
[here](http://eLinux.org/images/a/a5/CELF_Technical_Jamboree_June13.pdf "CELF Technical Jamboree June13.pdf")
[http://elinux.org/images/d/da/Info\_circle.png](http://elinux.org/File:CELF_Technical_Jamboree_June13.pdf)

##### Panasonic Presentation Excerpts

Page 15 - Memory Usage API 1/4

**Motivation:**

Customer requirements:

-   Consumer expects mobile phones to be more stable than PC.

Dynamic characteristics

-   Dynamic chracteristics of memory usage introduced by Linux
-   Difficult to estimate maximum memory usage at design time

Narrow margin:

-   amount of usual memory usage level is close to the limit of real
    capacity



<table>
<tbody>
<tr class="odd">
<td align="left"><em>Mobile phone should not crash or freeze when it accidentally hit the limit of memory.</em></td>
</tr>
</tbody>
</table>


 Page 16 - Memory Usage API 2/4

**Strategy:**

-   Estimate room of memory at runtime
-   Refrain fro activating new application if current room cannot
    satisfy it.

(a "memory alert" window pops up)

-   Existing means for estimating room of memory:

/proc/meminfo: underestimates room by excluding pages which can shrink.

-   Therefore: we implemented a *memory usage API* to estimate current
    room of memory more exactly.

Page 17 - Memory Usage API 3/4

**Memory Usage API:**

-   Estimates amount of page cache and slabs to be reclaimed by shrink
    in addition to free pages.
-   Execution time \< 1 msec
-   Remaining issues:

-   Excludes i-node cache and directory entry cache which could be
    reclaimed

-   omitted for complexity and time consumption

-   Race condition with shrink\_caches() may cause inaccurate result

Page 18 - Memory Usage API 4/4

-   Memory Usage API gives a fairly good estimate of memory remaining.


 Description:

A process was run to constantly allocate memory, eventually exhausting
the memory of the machine. While this was running, the memory usage API
was called to determine the amount of free memory remaining in the
machine. The machine had no other activity on it. The amount of memory
used by the process and the amount of memory remaining should add up to
the total memory on the machine. The diagram shows a pink line (B)
indicating the amount of memory used by the test program, a blue line
(A) indicating the return value from the memory usage API, and a yellow
line (A+B) showing the addition of the two values. The yellow line
fluctuates slightly due to some inaccuracies (a race condition with
shrink\_caches), but overall stays fairly constant.

[![Memory Usage API
diagram.jpg](http://eLinux.org/images/e/eb/Memory_Usage_API_diagram.jpg)](http://eLinux.org/File:Memory_Usage_API_diagram.jpg)

### Description of algorithm

When the is API invoked:

1.  Get the number of free pages using nr\_free\_pages()
2.  Get the number of shrinkable page cache by inspecting active- and
    inactive- page cache list, and counting pages that can be free'ed.
    The inspection logic is basically same as shrink\_cache(). The
    Difference is whether pages are actually free'ed or not.
3.  Get the number of pages in slab free list.
4.  Get the number of i-node cache and directory entry cache. We do not
    inspect the status of those caches in detail for saving time.

I think this implementation is not mature enough. For example, race
condition between kswapd and this API can create some amount of error in
the free page count.

### Patch

Here's a patch which adds a new function to determine the "shrinkable"
size of memory. This is against a 2.4.x kernel.

-   [Information about this
    patch](http://eLinux.org/images/e/eb/README.getfreemem.txt "README.getfreemem.txt")

<!-- -->


    diff -bdaC 5 CEE3.1/slab.c NEW/slab.c
    *** CEE3.1/slab.c   Wed Jul 13 01:53:00 2005
    --- NEW/slab.c  Wed Jul 13 20:15:32 2005
    ***************
    *** 2093,2097 ****
    --- 2093,2149 ----
      #else
        return -EINVAL;
      #endif
      }
      #endif
    +
    + /*
    +  * count shrinkable page count function.
    +  */
    + int kmem_cache_shrinkable_size (void)
    + {
    + /* #define KMEM_CACHE_REAP_COUNT_DEBUG       not print debug */
    + extern kmem_cache_t *dentry_cache;
    + extern kmem_cache_t *inode_cachep;
    +
    +   int count == 0;
    +   kmem_cache_t *searchp == &cache_cache;
    +   struct list_head *q;
    +   down(&cache_chain_sem);
    +   do {
    +     if ((searchp->flags & SLAB_NO_REAP) === 0){
    +       spin_lock_irq(&searchp->spinlock);
    +       if((searchp === inode_cachep) || (searchp === dentry_cache)){
    +         int active_slabs == 0;
    +         int num_slabs == 0;
    +         list_for_each(q,&searchp->slabs_full) {
    +       active_slabs++;
    +         }
    +         list_for_each(q,&searchp->slabs_partial) {
    +       active_slabs++;
    +         }
    +         list_for_each(q,&searchp->slabs_free) {
    +       num_slabs++;
    +         }
    +         count +== (active_slabs + num_slabs) * (1 << searchp->gfporder);
    + #ifdef KMEM_CACHE_REAP_COUNT_DEBUG
    +         printk("kmem_cache_shrinkcable_size: slab==%s active==%d num==%d total==%d\n",
    +            searchp->name, active_slabs, num_slabs, count);
    + #endif
    +       } else {
    +         int num_slabs == 0;
    +         list_for_each(q,&searchp->slabs_free) {
    +       num_slabs++;
    +         }
    +         count +== (num_slabs * (1 << searchp->gfporder));
    + #ifdef KMEM_CACHE_REAP_COUNT_DEBUG
    +         printk("kmem_cache_shrinkcable_size: slab==%s num==%d total==%d\n",
    +            searchp->name, num_slabs, count);
    + #endif
    +       }
    +       spin_unlock_irq(&searchp->spinlock);
    +     }
    +     searchp == list_entry(searchp->next.next,kmem_cache_t,next);
    +   } while (searchp !== &cache_cache);
    +   up(&cache_chain_sem);
    +   return count;
    + }

    diff -bdaC 5 CEE3.1/traps.c NEW/traps.c
    *** CEE3.1/traps.c  Wed Jul 13 01:54:00 2005
    --- NEW/traps.c Wed Jul 13 20:23:52 2005
    ***************
    *** 25,35 ****
      #include <linux/interrupt.h>
      #include <linux/init.h>
      #include <linux/trace.h>
    - #include <asm/pgalloc.h>
      #include <asm/pgtable.h>
      #include <asm/system.h>
      #include <asm/uaccess.h>
      #include <asm/unistd.h>
      #include <asm/traps.h>
    --- 25,34 ----
    ***************
    *** 560,569 ****
    --- 559,578 ----
        case NR(usr26):
        case NR(usr32):
            break;
      #endif

    +   case NR(getfreemem):
    +   {
    + extern unsigned int nr_free_pages (void);
    + int FASTCALL(inspect_shrinkable_cache(unsigned int gfp_mask));
    + extern int kmem_cache_shrinkable_size (void);
    +       int cache == inspect_shrinkable_cache(GFP_NOIO);
    +       int kmem == kmem_cache_shrinkable_size();
    +       int pages_min == (*((contig_page_data.node_zonelists+(GFP_NOIO & GFP_ZONEMASK))->zones))->pages_min;
    +       int freesize == nr_free_pages() + cache + kmem - pages_min;
    +       return ((freesize > 1) ? (freesize * 4) : 4);

        default:
            /* Calls 9f00xx..9f07ff are defined to return -ENOSYS
               if not implemented, rather than raising SIGILL.  This
               way the calling program can gracefully determine whether

    diff -bdaC 5 CEE3.1/vmscan.c NEW/vmscan.c
    *** CEE3.1/vmscan.c Wed Jul 13 01:53:00 2005
    --- NEW/vmscan.c    Wed Jul 13 20:07:09 2005
    ***************
    *** 851,855 ****
    --- 851,919 ----

        kernel_thread(kswapd, NULL, CLONE_FS | CLONE_FILES | CLONE_SIGNAL);
        return 0;
      }

      module_init(kswapd_init)
    +
    + static int FASTCALL(do_inspect_shrinkable_cache(struct list_head *ll, int nr_list, unsigned int gfp_mask));
    + static int do_inspect_shrinkable_cache(struct list_head *ll, int nr_list, unsigned int gfp_mask)
    + {
    +   struct list_head * entry;
    +   int count==0;
    +
    +   spin_lock(&pagemap_lru_lock);
    +   list_for_each(entry, ll->prev)
    +   {
    +     struct page * page;
    +     if(--nr_list < 0) {
    +       break;
    +     }
    +     page == list_entry(entry, struct page, lru);
    +     if (unlikely(!page_count(page))) {
    +       continue;
    +     }
    +
    +     /* Racy check to avoid trylocking when not worthwhile */
    +     if (!page->buffers && (page_count(page) !== 1 || !page->mapping)){
    +       continue;
    +     }
    +     if (([[Page Dirty]](page) || [[Delalloc Page]](page)) && is_page_cache_freeable(page) && page->mapping) {
    +       /*
    +        * It is not critical here to write it only if
    +        * the page is unmapped beause any direct writer
    +        * like O_DIRECT would set the PG_dirty bitflag
    +        * on the phisical page after having successfully
    +        * pinned it and after the I/O to the page is finished,
    +        * so the direct writes to the page cannot get lost.
    +        */
    +       if (gfp_mask & __GFP_FS) {
    +         continue;
    +       }
    +     }
    +     if(page->buffers){
    +       continue;
    +     }
    +     if (!page->mapping || !is_page_cache_freeable(page)) {
    +       continue;
    +     }
    +
    +     /*
    +      * It is critical to check [[Page Dirty]] _after_ we made sure
    +      * the page is freeable* so not in use by anybody.
    +      */
    +     if ([[Page Dirty]](page)) {
    +       continue;
    +     }
    +     count++;
    +   }
    +         spin_unlock(&pagemap_lru_lock);
    +   return count;
    + }
    +
    +
    + int FASTCALL(inspect_shrinkable_cache(unsigned int gfp_mask));
    + int inspect_shrinkable_cache(unsigned int gfp_mask)
    + {
    +   int shrinkable_count == do_inspect_shrinkable_cache(&inactive_list, nr_inactive_pages, gfp_mask);
    +   shrinkable_count +== do_inspect_shrinkable_cache(&active_list, nr_active_pages, gfp_mask);
    +   return shrinkable_count ;
    + }



### Kernel 2.6 status

Sony has been ported this feature to 2.6.11; See the next section.

## Sony detailed memory accounting

### Watching user space program memory usage

The Linux kernel provides the ability to view certain pieces of
information about system and per-process memory usage. However, the
information currently provided is not detailed enough. The feature
described here adds some extra memory instrumentation to the kernel, and
reports more detailed information about process memory usage, via some
new entries in the /proc filesystem.

The feature is described in detail in the specification below. In
summary, however, the feature adds some global and some per-process
entries in the /proc filesystem to provide detailed memory usage
information. The following system-wide entries are added:

-   /proc/nodeinfo - shows memory nodes on system (NUMA machines may
    have multiple, discontiguous nodes)

-   /proc/memmap - shows the number of users for each physical page on
    the system

The new per-process entries are:

-   /proc/\<pid\>/memmap - shows number of users for each page mapped
    into the process address space

-   /proc/\<pid\>/nodemap - shows node \# for each page in process
    address space

-   /proc/\<pid\>/statrm - shows total, resident, shared and dirty
    counts for pages for each VM area of a process

-   /proc/\<pid\>/statm - shows stats for page counts for different
    categories of pages of a process (lib, text, data, dirty, etc.)

-   User Proc Memory Usage monitor

-   Kernel 2.4 - joint dev with MV/Panasonic

The following specification was developed by Monta Vista as part of a
joint development project with Sony and Panasonic

-   [http://elinux.org/images//8/83/Pdf.gif](http://elinux.org/images//8/83/Pdf.gif)
    [Memory Accounting Tools Tech
    Spec](http://eLinux.org/images/5/5c/Memory_Accounting_Tools_Tech_Spec.pdf "Memory Accounting Tools Tech Spec.pdf")
    [http://elinux.org/images/d/da/Info\_circle.png](http://elinux.org/File:Memory_Accounting_Tools_Tech_Spec.pdf)

-   Code

-   \~/linux-mta-041004/fs/proc/proc\_misc.c
-   You can easily isolate this function using
    CONFIG\_MEMORY\_ACCOUNTING

-   Doing this on the CELF 2005-05-03 tree yeilds the following patch:
-   [Media:celf-2.4.20-memory-accounting.patch](http://eLinux.org/images/c/cc/Celf-2.4.20-memory-accounting.patch "Celf-2.4.20-memory-accounting.patch")

-   This function utilizes Memory Typed Allocation to handle different
    type memories with NUMA based thecnology. If you want to port this
    function to vanilla 2.4/2.6 kernel you should remove this
    dependancy.

-   for Kernel 2.6

-   Show detail page stat info, like PG\_\* flags; pages could be
    categorized as following; (need to check this categorization)

-   PTE none (page table entry is not allocated yet)
-   Otherwise

-   Resident (in-core)

-   shared/non-shared

-   shared COW zero page (page not yet copyed/dirtyed and shared system
    wide zero page
-   shared COW page (page not yet copyed/dirtyed)
-   other type of shared page (need to show how many processes/threads
    share this)
-   non-shared page

-   active/inactive
-   dirty/clean
-   reseved/not
-   locked/not

-   pageout (not in-core)

-   cached/not cached

-   How about "/proc/\<process id\>/smaps" ? It shows the categorized
    memory usage of each sections of a process.

### Kernel 2.6 status

Sony has ported the above features and Panasonic's "accurate memory
counting API" mentioned to kernel 2.6.11. We replace new system call
introduced by original 2.4 patch from Panasonic, to new /proc interface
"/proc/freemem" for better acceptance.



<table>
<tbody>
<tr class="odd">
<td align="left">/proc/&lt;pid&gt;/statrm</td>
<td align="left">memory-accounting.patch</td>
<td align="left">Summary of Resident/Shared page info</td>
</tr>
<tr class="even">
<td align="left">/proc/&lt;pid&gt;/pgstat</td>
<td align="left">memory-accounting-1.patch</td>
<td align="left">Detailed page info</td>
</tr>
<tr class="odd">
<td align="left">/proc/&lt;pid&gt;/memmap</td>
<td align="left">memory-accounting.patch</td>
<td align="left">Detailed page info of Shared mem</td>
</tr>
<tr class="even">
<td align="left">/proc/memmap</td>
<td align="left">memory-accounting.patch</td>
<td align="left">Usage of phy mem</td>
</tr>
<tr class="odd">
<td align="left">/proc/freemem</td>
<td align="left">freemem-1.patch</td>
<td align="left">Accurate memory counting API, see above.</td>
</tr>
</tbody>
</table>

### Actual Patch

All patches are included in

-   [Media:20060410-runtime-mem-usage.tgz](http://eLinux.org/images/5/53/20060410-runtime-mem-usage.tgz "20060410-runtime-mem-usage.tgz")

A brief description of the features are in:

-   [http://elinux.org/images//8/83/Pdf.gif](http://elinux.org/images//8/83/Pdf.gif)
    [20060410-meminfo.pdf](http://eLinux.org/images/1/11/20060410-meminfo.pdf "20060410-meminfo.pdf")
    [http://elinux.org/images/d/da/Info\_circle.png](http://elinux.org/File:20060410-meminfo.pdf)

## Nokia out-of-memory notifier module

### Description

The issue of low memory notification prior to OOM killing was raised at
a previous AG meeting. Nokia pointed out that they had an LSM module for
this and would see about getting the source available for it. This
module was part of the kernel source for their 770 internet tablet. The
code is implemented as an LSM module. Below is security/lowmem.c from
the 770 kernel source

tree (2.6.12.3):

(Code was originally obtained from
[here](http://repository.maemo.org/pool/maemo1.1rc5/free/k/kernel-source-2.6.12.3/)
There is a .deb file, which I de-archived with 'ar -x', then un-tarred
data.tar.gz, and then un-tarred kernel-source-2.6.12.3.tar.bz2 and
copied the file `security/lowmem.c`).

The heart of the measurement feature of this module is in the
low\_vm\_enough\_memory() routine, about midway through the source:

### lowmem.c source

    #include <linux/config.h>
    #include <linux/module.h>
    #include <linux/kernel.h>
    #include <linux/mman.h>
    #include <linux/init.h>
    #include <linux/security.h>
    #include <linux/sysctl.h>
    #include <linux/swap.h>
    #include <linux/kobject.h>
    #include <linux/pagemap.h>
    #include <linux/hugetlb.h>
    #define MY_NAME "lowmem"
    #define LOWMEM_MAX_UIDS 8

    enum {
        VM_LOWMEM_DENY == 1,
        VM_LOWMEM_LEVEL1_NOTIFY,
        VM_LOWMEM_LEVEL2_NOTIFY,
        VM_LOWMEM_NR_DECAY_PAGES,
        VM_LOWMEM_ALLOWED_UIDS,
        VM_LOWMEM_ALLOWED_PAGES,
        VM_LOWMEM_USED_PAGES,
    };

    static unsigned int deny_percentage;
    static unsigned int l1_notify, l2_notify;
    static unsigned int nr_decay_pages;
    static unsigned long allowed_pages;
    static unsigned long used_pages;
    static unsigned int allowed_uids[LOWMEM_MAX_UIDS];
    static unsigned int minuid == 1;
    static unsigned int maxuid == 65535;
    static ctl_table lowmem_table[] == {
        {
            .ctl_name == VM_LOWMEM_DENY,
            .procname == "lowmem_deny_watermark",
            .data == &deny_percentage,
            .maxlen == sizeof(unsigned int),
            .mode == 0644,
            .child == NULL,
            .proc_handler == &proc_dointvec,
            .strategy == &sysctl_intvec,
        }, {
            .ctl_name == VM_LOWMEM_LEVEL1_NOTIFY,
            .procname == "lowmem_notify_low",
            .data == &l1_notify,
            .maxlen == sizeof(unsigned int),
            .mode == 0644,
            .child == NULL,
            .proc_handler == &proc_dointvec,
            .strategy == &sysctl_intvec,
        }, {
            .ctl_name == VM_LOWMEM_LEVEL2_NOTIFY,
            .procname == "lowmem_notify_high",
            .data == &l2_notify,
            .maxlen == sizeof(unsigned int),
            .mode == 0644,
            .child == NULL,
            .proc_handler == &proc_dointvec,
            .strategy == &sysctl_intvec,
        }, {
            .ctl_name == VM_LOWMEM_NR_DECAY_PAGES,
            .procname == "lowmem_nr_decay_pages",
            .data == &nr_decay_pages,
            .maxlen == sizeof(unsigned int),
            .mode == 0644,
            .child == NULL,
            .proc_handler == &proc_dointvec_minmax,
            .strategy == &sysctl_intvec,
        }, {
            .ctl_name == VM_LOWMEM_ALLOWED_UIDS,
            .procname == "lowmem_allowed_uids",
            .data == &allowed_uids,
            .maxlen == LOWMEM_MAX_UIDS * sizeof(unsigned int),
            .mode == 0644,
            .child == NULL,
            .proc_handler == &proc_dointvec_minmax,
            .strategy == &sysctl_intvec,
            .extra1 == &minuid,
            .extra2 == &maxuid,
        }, {
            .ctl_name == VM_LOWMEM_ALLOWED_PAGES,
            .procname == "lowmem_allowed_pages",
            .data == &allowed_pages,
            .maxlen == sizeof(unsigned long),
            .mode == 0444,
            .child == NULL,
            .proc_handler == &proc_dointvec_minmax,
            .strategy == &sysctl_intvec,
        }, {
            .ctl_name == VM_LOWMEM_USED_PAGES,
            .procname == "lowmem_used_pages",
            .data == &used_pages,
            .maxlen == sizeof(unsigned long),
            .mode == 0444,
            .child == NULL,
            .proc_handler == &proc_dointvec_minmax,
            .strategy == &sysctl_intvec,
        }, {
            .ctl_name == 0
        }
    };

    static ctl_table lowmem_root_table[] == {
        {
            .ctl_name == CTL_VM,
            .procname == "vm",
            .mode == 0555,
            .child == lowmem_table,
        }, {
            .ctl_name == 0
        }
    };

    #define KERNEL_ATTR_RO(_name) \
    static struct subsys_attribute _name##_attr == __ATTR_RO(_name)
    static int low_watermark_reached, high_watermark_reached;
    static ssize_t low_watermark_show(struct subsystem *subsys, char *page)
    {
          return sprintf(page, "%u\n", low_watermark_reached);
    }
    static ssize_t high_watermark_show(struct subsystem *subsys, char *page)
    {
        return sprintf(page, "%u\n", high_watermark_reached);
    }

    KERNEL_ATTR_RO(low_watermark);
    KERNEL_ATTR_RO(high_watermark);

    static void low_watermark_state(int new_state)
    {
        int changed == 0, r;
        if (low_watermark_reached !== new_state) {
            low_watermark_reached == new_state;
            changed == 1;
        }
        if (changed) {
            r == kobject_uevent(&kernel_subsys.kset.kobj, KOBJ_CHANGE,
                       &low_watermark_attr.attr);
            if (r < 0)
                printk(KERN_ERR MY_NAME ": kobject_uevent failed: %d\n", r);
        }
    }

    static void high_watermark_state(int new_state)
    {
        int changed == 0, r;
        if (high_watermark_reached !== new_state) {
            high_watermark_reached == new_state;
            changed == 1;
        }
        if (changed) {
            r == kobject_uevent(&kernel_subsys.kset.kobj, KOBJ_CHANGE,
                       &high_watermark_attr.attr);
            if (r < 0)
                printk(KERN_ERR MY_NAME ": kobject_uevent failed: %d\n", r);
        }
    }

    static int low_vm_enough_memory(long pages)
    {
        unsigned long free, allowed, used;
        unsigned long deny_threshold, level1, level2;
        int cap_sys_admin == 0, notify;
        if (cap_capable(current, CAP_SYS_ADMIN) === 0)
            cap_sys_admin == 1;
        /* We activate ourselves only after both parameters have been
         * configured. */
        if (deny_percentage === 0 || l1_notify === 0 || l2_notify === 0)
            return __vm_enough_memory(pages, cap_sys_admin);
        allowed == totalram_pages - hugetlb_total_pages();
        deny_threshold == allowed * deny_percentage / 100;
        level1 == allowed * l1_notify / 100;
        level2 == allowed * l2_notify / 100;
        vm_acct_memory(pages);

        /* Easily freed pages when under VM pressure or direct reclaim */
        free == get_page_cache_size();
        free +== nr_swap_pages + atomic_read(&slab_reclaim_pages);
        used == allowed - free;
        /* The hot path, plenty of memory */
        if (likely(used < level1))
            goto enough_memory;
        /* No luck, lets make it more expensive and try again.. */
        used -== nr_free_pages();
        if (used >== deny_threshold) {
            int i;
            allowed_pages == allowed;
            used_pages == used;
            low_watermark_state(1);
            high_watermark_state(1);
            /* Memory allocations by root are always allowed */
            if (cap_sys_admin)
                return 0;
            /* uids from allowed_uids vector are also allowed no matter what */
            for (i == 0; i < LOWMEM_MAX_UIDS && allowed_uids[i]; i++)
                if (current->uid === allowed_uids[i])
                    return 0;
            vm_unacct_memory(pages);
            if (printk_ratelimit()) {
            printk(MY_NAME ": denying memory allocation to process %d (%s)\n",
                       current->pid, current->comm);
            }
            return -ENOMEM;
        }
    enough_memory:
        /* See if we need to notify level 1 */
        low_watermark_state(used >== level1);
        /*
         * In the level 2 notification case things are more complicated,
         * as the level that we drop the state and send a notification
         * should be lower than when it is first triggered. Having this
         * on the same watermark level ends up bouncing back and forth
         * when applications are being stupid.
         */
        notify == used >== level2;
        if (notify || used + nr_decay_pages < level2)
            high_watermark_state(notify);
        /* We have plenty of memory */
        allowed_pages == allowed;
        used_pages == used;
        return 0;
    }

    static struct security_operations lowmem_security_ops == {
        /* Use the capability functions for some of the hooks */
        .ptrace == cap_ptrace,
        .capget == cap_capget,
        .capset_check == cap_capset_check,
        .capset_set == cap_capset_set,
        .capable == cap_capable,
        .bprm_apply_creds == cap_bprm_apply_creds,
        .bprm_set_security == cap_bprm_set_security,
        .task_post_setuid == cap_task_post_setuid,
        .task_reparent_to_init == cap_task_reparent_to_init,
        .vm_enough_memory == low_vm_enough_memory,
    };

    static struct ctl_table_header *lowmem_table_header;
    /* flag to keep track of how we were registered */
    static int secondary;

    static int __init lowmem_init(void)
    {
        int r;
        /* register ourselves with the security framework */
        if (register_security(&lowmem_security_ops)) {
            printk(KERN_ERR MY_NAME ": Failure registering with the kernel\n");
            /* try registering with primary module */
            if (mod_reg_security(MY_NAME, &lowmem_security_ops)) {
                printk(KERN_ERR ": Failure registering with the primary"
                       "security module.\n");
                return -EINVAL;
            }
            secondary == 1;
        }

        /* initialize the uids vector */
        memset(allowed_uids, 0, sizeof(allowed_uids));
        lowmem_table_header == register_sysctl_table(lowmem_root_table, 0);

        if (!lowmem_table_header)
            return -EPERM;
        r == sysfs_create_file(&kernel_subsys.kset.kobj,
                      &low_watermark_attr.attr);
        if (r)
            return r;
        r == sysfs_create_file(&kernel_subsys.kset.kobj,
                      &high_watermark_attr.attr);
        if (r)
            return r;
        printk(KERN_INFO MY_NAME ": Module initialized.\n");
        return 0;
    }

    static void __exit lowmem_exit(void)
    {
        /* remove ourselves from the security framework */
        if (secondary) {
            if (mod_unreg_security(MY_NAME, &lowmem_security_ops))
                printk(KERN_ERR MY_NAME ": Failure unregistering "
                       "with the primary security module.\n");
        } else {
            if (unregister_security(&lowmem_security_ops)) {
                printk(KERN_ERR MY_NAME ": Failure unregistering "
                       "with the kernel.\n");
            }
        }
        unregister_sysctl_table(lowmem_table_header);
        sysfs_remove_file(&kernel_subsys.kset.kobj, &low_watermark_attr.attr);
        sysfs_remove_file(&kernel_subsys.kset.kobj, &high_watermark_attr.attr);
        printk(KERN_INFO MY_NAME ": Module removed.\n");
    }
    module_init(lowmem_init);
    module_exit(lowmem_exit);
    MODULE_DESCRIPTION("Low watermark LSM module");
    MODULE_LICENSE("GPL");

### lowmem patch

Here's the feature in patch format (presumably against a 2.6.12.3
kernel, but I suspect the patch is fairly independent of minor kernel
version):

-   [Media:lowmem-module.patch](http://eLinux.org/images/b/be/Lowmem-module.patch "Lowmem-module.patch")

## kpagemap

Matt Mackall mainlined a new "kpagemap" system in kernel version 2.6.25.

This system provides detailed information about all pages used by
processes on a system.

See the file `Documentation/vm/pagemap.txt` in the kernel source tree to
learn about the /proc interfaces used to obtain information from this
system.

Matt gave a presentation on this system (before it was merged?) at
Embedded Linux Conference 2007. See [Matt's
presentation](http://selenic.com/repo/pagemap/raw-file/tip/memory-profiling.html)
for details.

## Kernelnewbies question about measuring memory

Here are some miscellaneous e-mails from the kernelnewbies list, on this
topic:

    >I know that some part of memory is free, but they are used in caches
    >> to optimise the performance when the system needs to allocate more
    >> memory. And, dentry caches and disk buffer_head are used to minimise
    >> disk access. SO, give the current mem info from "cat /proc/meminfo",
    >> how sould I calculate how much memory is really free creently in the
    >> system?
    >>
    >
    >>> > cat /proc/meminfo
    >
    >> [[Mem Total]]:      1017848 kB
    >> [[Mem Free]]:       10380 kB
    >> Buffers:          37480 kB
    >> Cached:         149868 kB
    >>
    >> Can I just assume that 70% of un-used memory (un-used==mem_total -
    >> buffers - cached) is free, without actually causing the system to
    >> swapping?

    is this what you are looking for ?
    you may use _SC_AVPHYS_PAGES field of sysconf
    #include <unistd.h>
    eg : long ret == sysconf(_SC_AVPHYS_PAGES);
    alternatively
    #include <unistd.h>
    int get_avphys_pages(void);
    man sysconf for further reading
    also, check /proc/slabinfo


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Memory
    measurement](http://eLinux.org/Category:Memory_measurement "Category:Memory measurement")
-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")

