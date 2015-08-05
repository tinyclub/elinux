> From: [eLinux.org](http://eLinux.org/Legal_Issues "http://eLinux.org/Legal_Issues")

原文：eLinux.org

翻译：@zxqhbd

校订：@lzulfacon

#法律问题




#目录


-   [1 嵌入式中使用 linux 的法律问题](#legal-issues-using-linux-in-embedded-projects)
    -   [1.1 内核只被 GPL V2 许可](#kernel-is-licensed-gpl-v2-only)
    -   [1.2 署名行和原始开发者证书](#signed-off-by-lines-and-the-dco)
    -   [1.3 有关法律分析和合规的资源](#resources-for-legal-analysis-and-compliance)
-   [2 EXPORT\-SYMBOL\-GPL](#export-symbol-gpl)
    -   [2.1 针对内核 USB API 的 EXPORT\-SYMBOL\-GPL ](#export-symbol-gpl-for-kernel-usb-api)
-   [3 二进制专有的内核模块](#binary-proprietary-kernel-modules)
-   [4 用户空间中内核头文件的使用](#use-of-kernel-header-files-in-user-space)
-   [5 其它链接](#other-links)


##嵌入式中使用 linux 的法律问题


使用 GPL 许可证的复杂性已经在很多其他论坛中被多次的讨论过了。
以下是几个突出问题：

###内核只被 GPL V2 许可

Linux 内核只在 GNU 通用公共许可协议 2.0 版本下被许可！

这是不同于其它一些项目，在协议中使用默认用词允许 GPL V2  或者后期版本。这意味着linux 内核不会切换到 GPL V3 版本。

2006 年 9 月，一个 linux  内核开发者组织签署了一个立场声明，表明他们反对 GPL V3 版本（接着起草了声明）。这更加表明了内核不可能采用 GPL V3 协议了。

###署名行和原始开发者证书

当开发者为内核贡献代码的时候，他们必须提供一个署名行，表明他们承认那份开源协议和声明他们所做的工作（他们所掌握知识的最好部分）为原始版或者受 GPL V2 许可下的一定程度上兼容的衍生品。

查看[原始开发者证书][1]，包含在内核的 [Documentation/SubmittingPatches][2] 文件中。

[1]: "http://elinux.org/Developer_Certificate_Of_Origin" "原始开发者证书"

[2]: "http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches" "SubmittingPatches"

### 有关法律分析和合规的资源

* 自由软件法律中心针对 GPL 有一份有用合规指南：
  + http://www.softwarefreedom.org/resources/2014/SFLC-Guide_to_GPL_Compliance_2d_ed.pdf -2014 年 10 月
  
  + 注意不是所有人都同意这份文件中的所有法律解释，但总体而言，这是一份很好的资源
  
* 有关 copyleft 和 GNU 的通用公共许可协议的一份全面教程和指南：
   * http://www.copyleft.org/guide/comprehensive-gpl-guide.html#comprehensive-gpl-guidepa1.html

## EXPORT\_SYMBOL\_GPL

###针对内核 USB API 的 EXPORT_SYMBOL_GPL

在 2008 年的 1 月，Greg Kroah Hartman 提交了一个补丁将核心 USB API 改变为EXPORT_SYMBOL_GPL。这里是一些关于这个补丁的信息：

* [USB：将 USB 驱动标记为只被 GPL 许可 (LWN.net)][1]
 [1]: "http://lwn.net/Articles/266724/" "USB"
* [Linux 2.6.25 版本没有 USB 闭源驱动 (Linux 杂志)][2]
 [2]:http://www.linux-magazine.com/Online/News/Linux-2.6.25-without-Closed-Source-USB-Drivers "Linux magazine"
* [在内核版本 2.6.25 中的 USB 驱动只受 GPL 许可 (Linux 世界)][3]
 [3]:http://www.networkworld.com/category/opensource-subnet/?q=taxonomy/term/24 "Linux world"
* [实际的 git commit][4]
[4]:http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=782e70c6fc2290a0395850e8e02583b8b62264d8 "actual commit"

## 二进制专有的内核模块

在嵌入式 Linux 领域中一个很重要的，也是比较显著的一个法律问题就是二进制（非 GPL）内核模块是否违反 Linux 内核 GPL 协议。关于这个话题有不同的观点。
下面是一篇有一些有趣信息的文章：

* [支持闭源模块之第一部分：版权软件][1]
  [1]:http://www.networkworld.com/article/2301697/smb/encouraging-closed-source-modules-part-1--copyright-and-software.html "part 1"
* [支持闭源模块之第二部分：法律和模块接口][2]
   [2]:http://www.networkworld.com/article/2301698/smb/encouraging-closed-source-modules-part-2--law-and-the-module-interface.html "part 2"
* [支持闭源模块之第三部分：消除 API 更新税][3]
  [3]:http://www.networkworld.com/article/2301701/smb/encouraging-closed-source-modules-part-3--elimating-the--api-update-tax-.html "part 3"


##用户空间中内核头文件的使用

在用户空间是允许使用内核头文件的，它是为了方便用户空间程序通过普通的系统调用与内核进行交互的。用户空间程序不可能会成为内核的衍生品并受限于 GPL 协议。

一般情况下，头文件的使用不会产生衍生品，尽管也会有例外。过去很多都是支付包含头文件在内的代码的数量（例如行数），但是近段时间似乎没有人关注这个问题，这也好像不再是一个问题了。理查德．斯托曼曾表示，针对数据结构，常量还有枚举类型(甚至小内联)的头文件的使用都不会产生衍生品。请看：
http://lkml.indiana.edu/hypermail/linux/kernel/0301.1/0362.html

用户空间中内核头文件的使用是预料中的也是常见的。它明确的说明了非 GPL 软件使用这些文件，不会受       GPL 协议的影响。为了安抚直接使用头文件的担心，还有防止内核内部信息泄露给用户空间(可能会被滥用)，主线内核开发者给内核构建系统增加了一个选项，专门提供了一个“审查”标题，这被用户空间使用是安全的，也不会产生许可问题。

这些是在内核构建系统中 “make headers_check” 和 “make headers_install”   的目标。

总的来说，使用这样的审查标题(也即那些被专门去除了大内联宏或用户空间不再需要的头文件)是合法安全的。

这篇文章解释了怎样使用内核构建系统创建审查标题：
 http://darmawan-salihun.blogspot.jp/2008/03/sanitizing-linux-kernel-headers-strange.html
 
需要注意的是安卓系统开发者是使用不同的过程来为他们的系统的仿生来审查标题的。他们的过程跟主线标题审查同时开发。

## 其它链接

 * http://gpl-violations.org/  —这个 gpl-violations.org 项目试图解决 GPL  违规和增强 GPL 合规性的公共意识

* http://www.softwarefreedom.org/ —自由软件法律中心为开源项目提供法律代表和围绕开源的法律问题出版信息

* http://www.linuxfoundation.org/programs/legal/compliance —Linux   基金会的开放式合规计划
  
* http://www.binaryanalysis.org/ —一个针对 GPL 合规调查的二元分析工具

* http://lwn.net/Articles/386280/ —关于二元分析工具的 lwn.net 的文章 (2010/05/06 出版)
* 
http://fossology.org/ —fossology 是一个框架用来扫描开源代码：它目前扫描版权和许可证信息，并能够很容易的进行扩展