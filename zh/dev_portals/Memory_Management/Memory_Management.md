> 原文：[eLinux.org](http://eLinux.org/Memory_Management "http://eLinux.org/Memory_Management")<br/>
> 翻译：[@zipper1956](https://github.com/zipper)<br/>
> 校订：[@wengpingbo](https://github.com/wengpingbo), [@lzufalcon](https://github.com/lzufalcon)<br/>

#内存管理
本文包括许多嵌入式 Linux 开发者感兴趣的各种内存管理相关项目和活动。

##目录
-   [1 感兴趣的领域](#areas-of-interest)
    -   [1.1 内存检测和分析](#memory-measurement-and-analysis)
    -   [1.2 巨页/大页/超级页](#huge-large-superpages)
    -   [1.3 页缓存压缩](##page-cache-compression)
    -   [1.4 启动时预留和访问高地址内存](#reserving-and-accessing-the-top-of-memory-on-startup)
    -   [1.5 OOM 处理机制的优化/改进](#enhanced-out-of-memory-handling)
        -   [1.5.1 cgroup (控制组)中的 OOM 通知](#oom-notification-in-cgroups)
        -   [1.5.2 mem_notify 补丁](#mem-notify-patches)
        -   [1.5.3 谷歌 cgroup (控制组) OOM 处理方法](#google-cgroup-oom-handler)
        -   [1.5.4 诺基亚对 OOM 的改进](#nokia-oom-enhancements)
        -   [1.5.5 基于 LSM 的低内存通知](#lsm-based-low-memory-notification)
    -   [1.6 基于类型的内存分配(老旧的方法)](#type-based-memory-allocation-old)
-   [2 附加资源/邮件列表](#additional-resources-mailing-lists)
    -   [2.1 关于缓存的文章](#articles-on-caches)
	
##感兴趣的领域  
大部分内存管理技术牵扯的面很广，但对于嵌入式领域，相对容易一些，这主要得益于嵌入式领域天生不需要和内存交换之类的东西打交道（译者：这种说法太片面了）。更简单的内存管理机制和对产品计划偏离主流设计的放纵，让供应商在内存管理和虚拟内存空间上，有着更广大的空间去试验新技术。

###内存检测和分析
分析系统内存使用量和剩余量比听起来更棘手。

- 检测和分析系统内存的各种不同方法见链接：*[运行时内存检测](../.././dev_portals/Memory_Management/Runtime_Memory_Measurement/Runtime_Memory_Measurement.md "Runtime Memory Measurement")*。
- 处理现有内存检测系统不足的一些技术见链接：*[精确内存检测](../.././dev_portals/Memory_Management/Accurate_Memory_Measurement/Accurate_Memory_Measurement.md "Accurate Memory Measurement")*。
- 一些针对 ARM 架构的内存管理的信息见链接：*[Tims 关于 ARM 架构内存分配的建议](../.././dev_portals/Memory_Management/Tims_Notes_on_ARM_memory_allocation/Tims_Notes_on_ARM_memory_allocation.md "Tims Notes on ARM memory allocation")*。

###巨页/大页/超级页 
- 这适用于使用透明的大页面以及大部分静态使用模型情况，主要涉及到 hugetlb 接口 /libhugetlbfs 的之外工作。
- 嵌入式系统普遍受到微小 TLB 的拖累，通常只使用一个页的大小(4KB)。在大多数情况下，用户空间的任务造成系统压力巨大和性能下降，并且任何时候大多数应用程序的 5-40％ CPU 时间耗费在处理页面错误上。
- 关于这个问题初步讨论和其他相关信息可以在维基链接上找到：*[巨页](http://linux-mm.org/)*　　

###页缓存压缩
- 页缓存压缩主要工作是使用多种压缩算法进行页缓存页的动态压缩和解压缩，此外更要的是达到降低内存压力和特定负载下的性能提升。
- 更多的信息可以在链接 *[缓存压缩](http://linux-mm.org/CompressedCaching)* 和 *[SF 缓存压缩](http://linuxcompressed.sourceforge.net/)* 主页中找到。

###启动时预留和访问高地址内存
引用 Todd 关于怎么在 “mem=” 命令中使用保留的物理内存的邮件：

----------
假设内存拥有一个固定的地址并且该地址已经是预留的，那么更简单的方法是在 dev/mem 设备节点上调用 mmap() 函数，其中使用 0 作为起始地址，保留内存的物理地址作为偏移量。标志位可以是 AP_WRITE| MAP_READ 。这样的话函数就会返回一个指向内核在用户空间映射的内存指针。例如：  
如果你的 SDRAM 基地址为 0x80000000 ，内存大小为 64MB ，但是你使用命令 mem=60M 保留了内存末端的 4M 内存。这样你保留的内存地址就是 0x83c00000 ，所以你要做的就是  

`int fd;`  
`char *reserved_memory;`

`fd = open("/dev/mem",0_RDWR);`  
`reserved_memory = (char *) mmap(0,4*1024*1024,PROT_READ|PROT_WRITE,MAP_SHARED,fd,0x83c00000);`    

* * * * *

###OOM 处理机制的优化/改进
多种改进 OOM 处理的技术已经被开发出来并被建议在 Linux 中使用。  
见链接：*<http://linux-mm.org/OOM_Killer>* 关于 Linux 内核中 OOM 克星的信息。  
部分 OOM 避免机制要靠内核对内存使用情况的精确检测。点击链接：[*精确内存检测*](../.././dev_portals/Memory_Management/Accurate_Memory_Measurement/Accurate_Memory_Measurement.md "Accurate Memory Measurement") 了解更多关于该领域的技术信息。  
下面是我了解的几种技术(这些需要进行更好的研究和文档化)：  

####cgroup （控制组）中的 OOM 通知  
- 内存使用限制通知（Embedded Alley 开发, CE Linux Forum 赞助）  
	- 这个补丁更新了内存控制器 cgroup ，使其获得了可配置的内存使用限制通知功能。这个特性在 2009 年的嵌入式 Linux 大会上得到展示。
	- 点击链接：[*内存-最精确的资源*](http://tree.celinuxforum.org/CelfPubWiki/ELC2009Presentations?action=AttachFile&do=get&target=celf_mem_notify.pdf)，该文章由 Dan Malek 在 ELC 2009 上展示。
	- 点击链接：*<http://lwn.net/Articles/328403/>*　了解在 2009 年提第一次交到 LKML 的的信息。
	- 链接：*<http://lkml.org/lkml/2009/7/7/410>*　为关于在 2009 年提第二次交到 LKML 的的信息。
		- *<http://lkml.org/lkml/2009/7/16/468>*　Balbir Singh 需要一些时间评估这个改变 。 
	
####mem_notify 补丁
- mem_notify 补丁
	- 这一些列的补丁在系统内存越来越少的时候提供一种通知用户空间的方法，让上层应用可以在这种情况下做一些处理。这些补丁提交于2008年1月份。
	- 因为内存管理的回收顺序的改变，这些补丁无法应用在 2.6.38 之后版本的内核中。
	- 见链接：[*http://lwn.net/Articles/267013/*](<http://lwn.net/Articles/267013/>)　　
	
####谷歌 cgroup (控制组) OOM 处理方法
- 谷歌 per-cgroup OOM 处理方法  
	- 谷歌提交了一个使用 per-cgroup 风格的 OOM 处理方法的 RFC ，见链接：*<http://article.gmane.org/gmane.linux.kernel.mm/28376>*　　
	
####诺基亚对 OOM 的改进
- 诺基亚对 OOM 的改进
	- 操作应用增强参考链接：*<http://lwn.net/Articles/267013/>*（在评论中搜索 “killable” ）
>用户 "oak" 写到 （对 mem_notify 补丁的评论）：

>发表于 2008.02.03 14:02 UTC (Sun),oak (guest, #2786) [Link]

>...

>我认为这个用户空间的补丁的目的是使让上层应用可以在代码容易管理的地方做内存管理操作。如前所述，许多用户空间的代码[1] 根本不处理内存分配失败的情况。就算做了，这也很难去验证所有失败的可能都被正确处理了。如果用户空间事先得到了内存不足的通知，那么用户空间可以在代码中适当的地方释放内存从而使接下来的内存分配能够成功(可能性更高)。

>这同样允许做类似于评论做的事。如果系统收到内核内存不足的通知，那么它可以杀死进入后台状态的进程（保存进程界面状态, 能够恢复进程，并且对用户不可见），我认为它同样通过 D-BUS 通知当前应用系统内存不足的情况。对于用户可见或者非后台可杀死的应用应用释放它们的缓存或者关闭高内存消耗的特性，从而可以得到更多的内存。如果内存来自于堆内存而不是映射的内存，那么可能没有什么帮助，因为堆内存碎片较多而且需要更多操作时间。　　

####基于 LSM 的低内存通知 
- Paul Mundt 提交了一个提供通知用户空间内存的补丁到内核 2.6.12 。点击链接：[*精确内存检测和诺基亚内存不足通知模块*](../.././dev_portals/Memory_Management/Accurate_Memory_Measurement/Accurate_Memory_Measurement.md#Nokia_out-of-memory_notifier_module "Accurate Memory Measurement") 了解更多信息。
	- 这个模块基于一个 Linux 中最近从内核中移除的安全模块系统　　
	
###基于类型的内存分配（老旧的方法）
这是一个基于用户策略的方法(Sony and Panasonic 在内核 2.4 种定义)，该方法允许内核给不同的代码段分配不同类型的内存。  
见链接：[*基于类型的内存分配*](../.././dev_portals/Memory_Management/Memory_Type_Based_Allocation/Memory_Type_Based_Allocation.md "Memory Type Based Allocation")　　
 
##附加资源/邮件列表	
- [*LinuxMM*](http://linux-mm.org/)：该链接指向各种子项目并且是讨论内存管理相关话题的集中点([linux-mm](mailto:majordomo@kvack.org) 邮件列表和[存档](http://marc.theaimsgroup.com/?l=linux-mm))
- [*程序员需要知道的所有关于内存的知识*](<http://lwn.net/Articles/250967/>)　　


###关于缓存的文章
[*Paul McKenney 关于 CPU 缓存怎样工作的优秀论文*](<http://www2.rdrop.com/~paulmck/scalability/paper/whymb.2010.07.23a.pdf>)

[分类](http://eLinux.org/Special:Categories "Special:Categories")：

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
