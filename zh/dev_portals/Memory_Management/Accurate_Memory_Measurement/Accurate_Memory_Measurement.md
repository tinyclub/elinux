> 原文： [eLinux.org](http://eLinux.org/Accurate_Memory_Measurement "http://eLinux.org/Accurate_Memory_Measurement")<br/>
> 翻译：[@zipper1956](https://github.com/zipper1956)<br/>
> 校订：[@lzufalcon](https://github.com/lzufalcon)<br/>  


# 精确内存检测



## 目录

-   [1 简介](#introduction)
-   [2 松下精确内存计数 API](#panasonic-api-for-accurate-memory-count)
    -   [2.1 描述概览](#description-overview)
        -   [2.1.1 松下的报告摘要](#panasonic-presentation-excerpts)
    -   [2.2 算法描述](#description-of-algorithm)
    -   [2.3 补丁](#patch)
    -   [2.4 内核 2.6 状态](#kernel-2-6-status)
-   [3 索尼详细内存统计](#sony-detailed-memory-accounting)
    -   [3.1 监视用户空间程序内存使用](#watching-user-space-program-memory-usage)
    -   [3.2 内核 2.6 状态](#kernel-2-6-status-2)
    -   [3.3 实际的补丁](#actual-patch)
-   [4 诺基亚内存不足通知模块](#nokia-out-of-memory-notifier-module)
    -   [4.1 概述](#description)
    -   [4.2 lowmem.c 源代码](#lowmem-c-source)
    -   [4.3 lowmem 补丁](#lowmem-patch)
-   [5 kpagemap](#kpagemap)
-   [6 内核新手关于内存检测的问题](#kernelnewbies-question-about-measuring-memory)

## 简介

本文介绍了将却检测 Linux 系统内存相关的技术和问题。这对嵌入式系统很重要，因为其有限的内存并且没有可用交换空间。目前（２.4 和 2.6 内核）很难获取系统中已使用和未使用内存的精确统计。在通过 CE 认证的产品中，能够精确统计内存使用可以潜在地改善内存耗尽的错误处理或者内存不足时的错误避免。

本文目前列举了三个有助于获取 Linux 内核精确内存检测的系统：

-   松下的内存使用 API
-   索尼的详细内存统计
-   诺基亚的内存不足通知模块 (LSM)

## 松下精确内存计数 API

### 描述概览

这项技术和 API 由松下展示在一份可获得的报告中 15-18 页中 
[http://elinux.org/images//8/83/Pdf.gif](http://elinux.org/images//8/83/Pdf.gif)
[here](http://eLinux.org/images/a/a5/CELF_Technical_Jamboree_June13.pdf "CELF Technical Jamboree June13.pdf")
[http://elinux.org/images/d/da/Info\_circle.png](http://elinux.org/File:CELF_Technical_Jamboree_June13.pdf)

##### 松下的报告摘要

第 15 页- 内存使用 API 1/4

**目的：**

客户需求：

-   客户希望移动电话比 PC 更加稳定。

动态特性：

-   Linux 系统中介绍的内存使用动态特性
-   设计阶段难以估计最大内存使用量

苛刻的限制:

-   通常的内存使用量是接近实际容量的限制



<table>
<tbody>
<tr class="odd">
<td align="left"><em>当移动电话使用内存偶然到达极限时不应该崩溃或死机</em></td>
</tr>
</tbody>
</table>


 第 16 页- 内存使用量 API 2/4

**策略：**

-   在运行时估计内存空间
-   Refrain fro activating new application if current room cannot
    satisfy it.

（一个 “内存警告” 窗口弹出）

-   现有估计内存空间的方法：

/proc/meminfo: underestimates room by excluding pages which can shrink.

-   因此：我们实现了一种“内存使用量 API ”来更准确地估计当前内存空间。

第 17 页 - 内存使用 API 3/4

**内存使用量 API ：**

-   估算除了空闲内存页之外页缓存和因页面回收机制被回收的 slab 数量.
-   执行时间 < 1 毫秒
-   遗留问题：

-   不包括可能被回收的 i-node 和目录入口的缓存

-   忽略该项是出于复杂度和时间消耗考虑

-   shrink\_caches() 伴随的竞态可能导致不准确的结果

第 18 页 - 内存使用 API 4/4

-   内存使用量 API 给出了一个非常好的剩余内存量估算.


 描述:

一个进程被启动用于不断分配内存，直到机器的内存用尽。当该进程在运行时，内存使用量 API 被调用确定机器上剩余的空闲内存数量。该机器上没有其他进程运行。进程使用的内存量和剩余的内存量总和要与机器上的总内存相同。图表中的粉色线条 (B) 表示测试程序使用的内存量，蓝色线 (A) 表示内存使用量 API 返回的数值，黄色线条 (A+B) 表示两者数值相加。因为一些不准确因素 ( shrink\_caches 引起的竞态)黄色线条有轻微的波动，但是总体来说保持得很稳定。

[![内存使用 API 图标.jpg](http://eLinux.org/images/e/eb/Memory_Usage_API_diagram.jpg)](http://eLinux.org/File:Memory_Usage_API_diagram.jpg)

### 算法描述

当 API 被调用时：

1.  使用　nr\_free\_pages()　获取可用内存页面数量。
2.  Get the number of shrinkable page cache by inspecting active- and
    inactive- page cache list, and counting pages that can be free'ed.
    The inspection logic is basically same as shrink\_cache().区别是页面是否实际上被释放了。
3.  获取在 slab 中空闲链表的页面数量。
4.  获取 i-node 和目录入口的缓存的数量。为了节省时间我们不详细检查这些 cache 的状态。

我认为这种实现方法还不够成熟。比如， kswapd 和 该 API 之间的竞态可能会产生空闲页面统计错误。

### 补丁

这个补丁添加了一个用来决策内存可以“压缩”大小的函数。这个补丁针2.对 2.4.x 内核.

-   [关于补丁的信息](http://eLinux.org/images/e/eb/README.getfreemem.txt "README.getfreemem.txt")

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



### 内核 2.6 状态

索尼已经将这个特性移植到内核 2.6.11 中；详细信息见下一节。

## 索尼详细内存统计

### 监视用户空间程序内存使用

Linux 内核提供查看关于系统的特定部分信息和每个进程的内存使用情况。然而目前所提供的关于系统的信息还不够详细。此处描述的特性就是通过 /proc 文件系统的一些新入口在内核中加入一些额外的内存测量，并且呈现更多关于进程内存使用的详细信息。

该特性在一下规范中进行详细描述。总之，该特性在 /proc 文件系统中添加了一些全局和每个进程的独有的入口来提供内存使用的详细信息。下面这些系统级的入口是新增的：

-   /proc/nodeinfo - 展示系统内存节点 (NUMA 的机器可能会有多样和不连续的节点)

-   /proc/memmap - 展示系统中每个物理内存页面的使用者数量

新增的每个进行的入口如下：

-   /proc/\<pid\>/memmap - 展示每个映射到进程地址空间的页面的使用者数

-   /proc/\<pid\>/nodemap - 展示在进程地址空间的每个页面的节点 \#

-   /proc/\<pid\>/statrm - 展示每个进程虚拟内存区域的总页面、驻留页面和脏页的数量统计

-   /proc/\<pid\>/statm - 展示一个进程不同种类页面的数量统计 (lib, text, data, dirty, etc.)

-   用户进程内存使用量监测

-   内核 2.4 - 与松下联合开发

下面的规范是作为索尼和松下联合开发项目的一部分，由 Monta Vista 开发。

-   [http://elinux.org/images//8/83/Pdf.gif](http://elinux.org/images//8/83/Pdf.gif)
    [Memory Accounting Tools Tech
    Spec](http://eLinux.org/images/5/5c/Memory_Accounting_Tools_Tech_Spec.pdf "Memory Accounting Tools Tech Spec.pdf")
    [http://elinux.org/images/d/da/Info\_circle.png](http://elinux.org/File:Memory_Accounting_Tools_Tech_Spec.pdf)

-   代码

-   \~/linux-mta-041004/fs/proc/proc\_misc.c
-   你可以很容易地使用 CONFIG\_MEMORY\_ACCOUNTING 分割这个函数Y

-   在 CELF 2005-05-03 树上使用该方法得到以下的补丁：
-   [Media:celf-2.4.20-memory-accounting.patch](http://eLinux.org/images/c/cc/Celf-2.4.20-memory-accounting.patch "Celf-2.4.20-memory-accounting.patch")

-   基于　NUMA　技术，这个函数使用内存类型分配法处理不同类型的内存。如果你想移至这个函数到　２.4/2.6 内核，那么你需要移除这个依赖关系。

-   针对内核 2.6

-   展示详细的页面状态信息，比如 PG\_\* flags ；页面可以按照以下进行分类；(需要验证这种分类方法)

-   PTE none (页表入口还没有分配)
-   其他

-   常驻 (在内核中)

-   共享/非共享

-   共享的 COW zero 页面 (没有复制的/脏的页面和共享的系统级的 zero 页面)
-   共享的 COW 页面 (没有复制的/脏的页面)
-   其他类型的共享页面 (需要查看有多少进程/线程共享这个页面)
-   非共享页面

-   活动/非活动的
-   脏的/干净的
-   保留的/非保留的
-   锁住的/没有锁住的

-   换出的页 (不在内核中)

-   缓存的/非缓存的

-   那么 "/proc/\<process id\>/smaps" 是怎样的? 它展示了进程每个段的分类化内存使用情况。

### 内核 2.6 状态

索尼已经把以上的特性和上文提到松下的 “精确内存计数 API ”移植到内核 2.6.11 中。为了有更好的接受度，我们把来自松下的原始 2.4 补丁介绍的新的系统调用替换为新的 /proc 接口 /proc/freemem. 



<table>
<tbody>
<tr class="odd">
<td align="left">/proc/&lt;pid&gt;/statrm</td>
<td align="left">memory-accounting.patch</td>
<td align="left">常驻/共享内存页面信息的简要统计</td>
</tr>
<tr class="even">
<td align="left">/proc/&lt;pid&gt;/pgstat</td>
<td align="left">memory-accounting-1.patch</td>
<td align="left">详细的页面信息</td>
</tr>
<tr class="odd">
<td align="left">/proc/&lt;pid&gt;/memmap</td>
<td align="left">memory-accounting.patch</td>
<td align="left">共享内存的详细页面信息</td>
</tr>
<tr class="even">
<td align="left">/proc/memmap</td>
<td align="left">memory-accounting.patch</td>
<td align="left">物理内存使用量</td>
</tr>
<tr class="odd">
<td align="left">/proc/freemem</td>
<td align="left">freemem-1.patch</td>
<td align="left">精确内存统计 API， 见上文。</td>
</tr>
</tbody>
</table>

### 实际的补丁

所有的补丁都包含在

-   [Media:20060410-runtime-mem-usage.tgz](http://eLinux.org/images/5/53/20060410-runtime-mem-usage.tgz "20060410-runtime-mem-usage.tgz")

对这些特性的一个简单介绍见链接：

-   [http://elinux.org/images//8/83/Pdf.gif](http://elinux.org/images//8/83/Pdf.gif)
    [20060410-meminfo.pdf](http://eLinux.org/images/1/11/20060410-meminfo.pdf "20060410-meminfo.pdf")
    [http://elinux.org/images/d/da/Info\_circle.png](http://elinux.org/File:20060410-meminfo.pdf)

## 诺基亚内存不足通知模块

### 概述

在 OOM killing 之前的内存不足通知的问题在一次以前的 AG 会议上提出。诺基亚指出对此他们拥有一个 LSM 模块并且将会留意获取到有关可用的源。这个模块是诺基亚 770 平板电脑内核源代码的一部分。

内核代码树 (2.6.12.3):

(代码最初有此处获得
[here](http://repository.maemo.org/pool/maemo1.1rc5/free/k/kernel-source-2.6.12.3/)
这是一个 .deb 文件，我用 'ar -x' 命令解压后用 tar 工具解压了 data.tar.gz 文件，然后使用 tar 解压了 kernel-source-2.6.12.3.tar.bz2 并且复制了文件 `security/lowmem.c`).

这个模块的核心检测特性在函数 low\_vm\_enough\_memory() 中, 大概在源文件的中间位置：

### lowmem.c 源代码

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

### lowmem 补丁

Here's the feature in patch format (presumably against a 2.6.12.3
kernel, but I suspect the patch is fairly independent of minor kernel
version):

-   [Media:lowmem-module.patch](http://eLinux.org/images/b/be/Lowmem-module.patch "Lowmem-module.patch")

## kpagemap

Matt Mackall 将一种新的 “kpagemap”  系统加入到了 2.6.25 版本内核的主线中。

该系统提供了关于系统中所有进程所用内存页面的详细信息。

查看内核中 `Documentation/vm/pagemap.txt` 文件可以了解用来从该系统中获取信息的 /proc 接口。

在 2007 年嵌入式 Linux 大会上，Matt针对该系统做了一次介绍 (在该系统被合并之前？)。 查看链接 [Matt's presentation](http://selenic.com/repo/pagemap/raw-file/tip/memory-profiling.html) 可以获取详细的内容.

## 内核新手关于内存检测的问题

下面一些是来自内核新手们关于该话题的各种邮件：:

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


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [内存检测](http://eLinux.org/Category:Memory_measurement "Category:Memory measurement")
-   [系统剪裁](http://eLinux.org/Category:System_Size "Category:System Size")




