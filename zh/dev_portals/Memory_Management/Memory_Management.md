> 原文：[eLinux.org](http://elinux.org/Memory_Management.md)<br/>
> 翻译：[@zipper1956](https://github.com/zipper)<br/>
> 校订：[@wengpingbo](https://github.com/wengpingbo)<br/>

#内存管理
本文包括许多嵌入式Linux开发者感兴趣的各种内存管理项目和活动。

###目录
#####1 感兴趣的区域

	1.1 内存检测和分析  
	1.2 巨大页面/大页面/超级页面  
	1.3 页缓存压缩  
	1.4 启动时预留和访问高地址内存  
	1.5 OOM处理机制的优化/改进   	
		1.5.1 cgroup(控制群组)中的OOM通知  
		1.5.2 mem_notify补丁  
		1.5.3 谷歌cgroup OOM处理方法  
		1.5.4 诺基亚对OOM的改进  
		1.5.5 基于LSM的内存不足通知
	1.6 基于类型的内存分配(废弃)  

#####2 附加的资料和邮件列表	  

	2.1 关于缓存的文章
	
##感兴趣的区域  
大部分内存管理技术牵扯的面很广，但对于嵌入式领域，相对容易一些，这主要得益于嵌入式领域天生不需要和内存交换之类的东西打交道（译者：这种说法太片面了）。更简单的内存管理机制，和对产品计划偏离主流设计的放纵，让供应商在内存管理和虚拟内存空间上，有着更广大的空间去试验新
技术。

####内存检测和分析
分析系统内存使用量和剩余量比听起来更棘手。

- 探测和分析系统内存的各种不同方法见链接:*[运行时内存检测](http://elinux.org/Runtime_Memory_Measurement)*
- 处理现有内存检测系统不足的一些技术见链接:*[准确的内存检测](http://elinux.org/Accurate_Memory_Measurement)*
- 一些针对ARM架构的内存管理信息见链接:*[Tims关于ARM架构内存分配的建议](http://elinux.org/Tims_Notes_on_ARM_memory_allocation)*

####巨大页面/大页面/超级页面 
- 这适用于透明的大页面的使用情况，以及大部分静态使用模型，主要涉及到hugetlb接口/ libhugetlbfs的之外工作
- 嵌入式系统普遍受到微小TLB的拖累，通常只使用一个页的大小（4KB）。在大多数情况下，用户空间的任务造成系统压力巨大和性能下降，并且任何时候大多数应用程序的5-40％CPU时间耗费在处理页面错误上。
- 关于这个问题初步讨论其他相关信息可以在维基链接上找到：*[巨大页面](http://linux-mm.org/)*
####页缓存压缩
- 页缓存压缩主要工作是使用多种压缩算法进行页缓存页的动态压缩和解压缩，此外更要的是达到降低内存压力和特定负载下的性能提升。
- 更多的信息可以在链接*[压缩缓存](http://linux-mm.org/CompressedCaching)*和*[SF压缩缓存](http://linuxcompressed.sourceforge.net/)*主页中找到。

####启动时预留和访问高地址内存
引用Todd关于怎么在“mem=”命令中使用保留的物理内存的邮件：

----------
假设内存拥有一个固定的地址并且该地址已经是预留的，那么更简单的方法是在dev/mem设备节点上调用mmap()函数，其中使用0作为起始地址，保留内存的物理地址作为偏移量。标志位可以是AP_WRITE| MAP_READ。这样的话函数就会返回一个指向内核在用户空间映射的内存指针。例如：  
如果如果你的SDRAM基地址为0x80000000，内存大小为64MB，但是你使用命令mem=60M保留了内存末端的4M内存。这样你保留的内存地址就是0x83c00000，所以你要做的就是  
`int fd;`  
`char *reserved_memory;`

`fd = open("/dev/mem",0_RDWR);`  
`reserved_memory = (char *) mmap(0,4*1024*1024,PROT_READ|PROT_WRITE,MAP_SHARED,fd,0x83c00000);`  

####OOM处理机制的优化/改进
多种改进OOM处理的技术已经被开发出来并被建议在Linux中使用。  
见链接:  *<http://linux-mm.org/OOM_Killer>*关于Linux内核中OOM克星的信息  
部分OOM避免机制要靠内核对内存使用情况的精确探测。点击链接：[*精确内存检测*](http://elinux.org/Accurate_Memory_Measurement)了解更多关于该领域的技术信息。  
下面是我了解的几种技术(这些需要进行更好的研究和文档化)：  

#####cgroup(控制群组)中的OOM通知  
- 内存使用限制通知(Embedded Alley开发, CE Linux Forum赞助)  
	- 这个补丁更新了内存控制器cgroup使其获得了可配置的内存使用限制通知功能。这个特性在2009年的嵌入式Linux大会上得到展示。
	- 点击链接：[*内存-最精确的资源*](http://tree.celinuxforum.org/CelfPubWiki/ELC2009Presentations?action=AttachFile&do=get&target=celf_mem_notify.pdf)，该文章由Dan Malek在ELC 2009上展示。
	- 点击链接*<http://lwn.net/Articles/328403/>*了解在2009年提第一次交到LKML的的信息
	- 链接*<http://lkml.org/lkml/2009/7/7/410>*为关于在2009年提第二次交到LKML的的信息
		- *<http://lkml.org/lkml/2009/7/16/468>* Balbir Singh需要一些时间评估这个改变  
	
#####mem_notify补丁
- mem_notify补丁
	- 这一些列的补丁在系统内存越来越少的时候提供一种通知用户空间的方法，让上层应用可以在这种情况下做一些处理。
	- 因为内存管理的回收顺序的改变，这些补丁无法应用在2.6.38之后版本的内核中。
	- 见链接：*<http://lwn.net/Articles/267013/>*
#####谷歌cgroup OOM处理方法
- 谷歌 per-cgroup OOM处理方法  
	- 谷歌提交了一个使用per-cgroup风格的OOM处理方法的RFC，见链接：*<http://article.gmane.org/gmane.linux.kernel.mm/28376>*
#####诺基亚对OOM的改进
- 诺基亚对OOM的改进
	- 操作应用增强参考链接：*<http://lwn.net/Articles/267013/>*（在内容中搜索“killable”）
>用户 "oak" 写到 (mem_notify补丁的评论):

>发表于2008.02.03 14:02 UTC (Sun),oak (guest, #2786) [Link]

>...

>我认为这个用户空间的补丁的目的是使让上层应用可以在代码容易管理的地方做内存管理操作。如前所述，许多用户空间的代码[1] 根本不处理内存分配失败的情况。就算做了，这也很难去验证所有失败的可能都被正确处理了。如果用户空间事先得到了内存不足的通知，那么用户空间可以在代码中适当的地方释放内存从而使接下来的内存分配能够成功(可能性更高)。

>这同样允许做类似于评论做的事。如果系统收到系统内存不足的通知，那么它可以杀死进入后台状态的进程(保存进程界面状态, 能够恢复进程，并且对用户不可见)。我认为它同样通过D-BUS通知当前应用系统内存不足的情况.对于用户可见或者非后台可杀死的应用应用释放它们的缓存或者关闭功能，从而可以得到更多的内存。如果内存来自于堆内存而不是映射的内存，那么可能没有什么帮助，因为堆内存碎片较多而且需要更多操作时间。
#####基于LSM的内存不足通知 
- Paul Mundt提交了一个提供通知用户空间内存的补丁到内核2.6.12。点击链接：[*精确内存检测和诺基亚内存不足通知模块*](http://elinux.org/Accurate_Memory_Measurement#Nokia_out-of-memory_notifier_module)了解更多信息。
	- 这个模块基于一个Linux中最近从内核中移除的安全模块系统
####基于类型的内存分配(废弃)
这是一个基于用户策略的方法(Sony and Panasonic在内核2.4种定义)，该方法允许内核给不同的代码段分配不同类型的内存。  
见链接：[*基于类型的内存分配*](http://elinux.org/Memory_Type_Based_Allocation)  
##附加资源/邮件列表	
- [*LinuxMM*](http://linux-mm.org/)：该链接指向各种子工程并且是讨论内存管理相关话题的中心点([邮件列表](mailto:majordomo@kvack.org)和[存档](http://marc.theaimsgroup.com/?l=linux-mm))
- [*程序员需要知道的所有关于内存的知识*](http://lwn.net/Articles/250967/)

####关于缓存的文章
[*Paul McKenney关于CPU缓存怎样工作的优秀论文*](http://www2.rdrop.com/~paulmck/scalability/paper/whymb.2010.07.23a.pdf)

>[分类](http://elinux.org/Special:Categories)：[Linux](http://elinux.org/Category:Linux)