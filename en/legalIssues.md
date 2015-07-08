法律问题
==================

目录
========

1 嵌入式中使用linux的法律问题
===============================

1.1 内核只被GPL V2许可
-----------------------------   

1.2 署名行和原始开发者证书(DCO)
------------------------------------

1.3 有关法律分析和合规的资源
---------------------------------

2 EXPORT_SYMBOL_GPL
===============================

2.1 针对内核USB API的EXPORT_SYMBOL_GPL
--------------------------------------

3 二进制专有的内核模块
==================================

4 用户空间中内核头文件的使用
====================================

5 其它链接
======================================





#嵌入式中使用linux的法律问题

使用GPL许可证的复杂性已经在很多其他论坛中被多次的讨论过了。

以下是几个偶尔会提出的特定问题的一些突出特点：

##内核只被GPL V2许可

Linux内核只在GNU通用公共许可协议2.0版本下被许可！

这是不同于其它一些在协议中使用默认用词允许GPL。

V2或者后期版本的一些项目。这意味着内核不会切换到GPL V3版本。

2006年9月，一个linux内核开发者组织签署了一个财务状况表，表明他们反对GPL 
V3版本

（接着起草了声明）。这更加表明了内核不可能采用GPL V3协议了。

##署名行和原始开发者证书

当开发者为内核贡献代码的时候，他们必须提供一个署名行，表明他们承认那份开源协议和声

明他们所做的工作（他们所掌握知识的最好部分）为原始版或者受GPL V2许可下的一定程度

上兼容的衍生品。

查看[原始开发者证书][1]，包含在内核的[Documentation/SubmittingPatches][2]文件中。 

[1]: "http://elinux.org/Developer_Certificate_Of_Origin" "原始开发者证书"

[2]: "http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches" "SubmittingPatches"


##有关法律分析和合规的资源

* 自由软件法律中心针对GPL有一份有用合规指南：
  + http://www.softwarefreedom.org/resources/2014/SFLC-Guide_to_GPL_Compliance_2d_ed.pdf -2014年10月
  
  + 注意不所有人都同意这份文件中的所有法律解释，但总体而言，这是一份很的资源
  
* 有关copyleft和GNU的通用公共许可协议的一份全教程和指南：
   * http://www.copyleft.org/guide/comprehensive-gpl-guide.html#comprehensive-gpl-guidepa1.html

#EXPORT_SYMBOL_GPL

##针对内核USB API的EXPORT_SYMBOL_GPL

在2008年的1月，Greg Kroah Hartman提交了一个补丁将核心USB API改变为

EXPORT_SYMBOL_GPL。这里是一些关于这个补丁的信息：

* [USB：将USB驱动标记为只被GPL许可(LWN.net)][1]
 [1]: "http://lwn.net/Articles/266724/" "USB"
* [Linux 2.6.25版本没有USB闭源驱动(Linux杂志)][2]
 [2]:http://www.linux-magazine.com/Online/News/Linux-2.6.25-without-Closed-Source-USB-Drivers "Linux magazine"
* [在内核版本2.6.25中的USB驱动只受GPL许可(Linux世界)][3]
 [3]:http://www.networkworld.com/category/opensource-subnet/?q=taxonomy/term/24 "Linux world"
* [实际的git commit][4]
[4]:http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=782e70c6fc2290a0395850e8e02583b8b62264d8 "actual commit"

#二进制专有的内核模块

在嵌入式Linux领域中一个很重要的，也是比较显著的一个法律问题就是二进制（非GPL）内

核模块是否违反Linux内核GPL协议。关于这个话题有不同的观点。

下面是一篇有一些有趣信息的文章：

* [支持闭源模块之第一部分：版权软件][1]
  [1]:http://www.networkworld.com/article/2301697/smb/encouraging-closed-source-modules-part-1--copyright-and-software.html "part 1"
* [支持闭源模块之第二部分:法律和模块接口][2]
   [2]:http://www.networkworld.com/article/2301698/smb/encouraging-closed-source-modules-part-2--law-and-the-module-interface.html "part 2"
* [支持闭源模块之第三部分:消除API更新税][3]
  [3]:http://www.networkworld.com/article/2301701/smb/encouraging-closed-source-modules-part-3--elimating-the--api-update-tax-.html "part 3"









