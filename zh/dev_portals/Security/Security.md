> 摘自: [eLinux.org]("http://eLinux.org/Security")


# 安全



## 目录

-   [2 简介](#Introduction)
-   [3 技术/项目主页](#Technology/Project pages)
-   [4 Linux Kernel中的安全子系统](#security-systems-in-linux-kernel)
    -   [4.1 SELinux](#selinux)
    -   [4.2 Tomoyo](#tomoyo)
    -   [4.3 SMACK](#smack)
-   [5 比较老的信息 (2005年前来自于 CELF 调查信息)](#older-information-from-celf-investigations-prior-to-2005)
    -   [5.1 文档](#documents)
    -   [5.2 关键需求与相关技术点](#key-requirements-and-the-related-technologies)
    -   [5.3 资源](#resources)
        -   [5.3.1 安全框架](#security-frameworks)
        -   [5.3.2 安全组件](#security-components)
        -   [5.3.3 安全特性](#security-features)
        -   [5.3.4 其他资源](#other-resources)
            -   [5.3.4.1 安全活动](#security-activities)
            -   [5.3.4.2 邮件列表](#mailing-lists)
            -   [5.3.4.3 会议](#conferences)
            -   [5.3.4.4 与安全相关的文章](#security-articles)
            -   [5.3.4.5 论文](#papers)
            -   [5.3.4.6 简单的开源代码](#sample-and-opensource-code)

## 简介

这个页面主要包含与嵌入式Linux有关的安全方面的技术。

## 技术/项目主页

-   [与硬件安全相关的资源](../.././dev_portals/Security/Security_Hardware_Resources/Security_Hardware_Resources.md "Security Hardware Resources")
-   [与Bootloader 安全相关的资源](../.././dev_portals/Security/Bootloader_Security_Resources/Bootloader_Security_Resources.md "Bootloader Security Resources"))
-   [强制访问控制技术的比较](../.././dev_portals/Security/Mandatory_Access_Control_Comparison/Mandatory_Access_Control_Comparison.md "Mandatory Access Control Comparison")

## Linux Kernel中的安全子系统

### SELinux

-   [SELinux](../.././dev_portals/Security/SELinux/SELinux.md "SELinux") - 这个功能主要用来实现对Linux Kernel的高级安全瓶通量。
    SELinux 主要起始于NSA在2001给kernel 提交的补丁，在LSM 项目对这个补丁进行了讨论，目前SELinux已经
	定义了大量的LSM接口。
    -   OLS 2008 paper: [消费者电子设备下的SELinux](http://eLinux.org/images/8/88/Nakamura-reprint.pdf "Nakamura-reprint.pdf")
        Nakamura & Sameshima, 日立软件工程师.
    -   ELC 2008 presentation: [嵌入式SELinux](http://eLinux.org/images/a/a3/ELC2008_nakamura.pdf "ELC2008 nakamura.pdf")

### Tomoyo

-   [TOMOYO Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") 
	主要用来提高Linux自身的安全性，这个特性是由[NTT DATA
    CORPORATION, Japan](http://www.nttdata.co.jp/en/index.html)开发。 [TOMOYO
    Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") 是在2005年11月11日，以GPL许可证的形式开源的。 [TOMOYO
    Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") 是一个机制，可以被称为安全操作系统，
	这个机制可以通过打破现有的访问控制，从而做到更好粒度的访问控制，与SELinux非常类似。
    -   [ELC2007
        presentation](http://eLinux.org/images/b/b5/Elc2007-presentation-20070418-for_linux.pdf "Elc2007-presentation-20070418-for linux.pdf")
    -   [OLS2007 BoF
        slides](http://eLinux.org/images/e/eb/Ols2007-tomoyo-20070629.pdf "Ols2007-tomoyo-20070629.pdf")

Tomoyo在kernel 2.6.28时被合并到kernel主线中。

### SMACK

-   SMACK - 一个简单的强制访问控制的Kernel子系统，这个的实现非常轻量级。
    -   官方主页 (非常简单):
        [http://schaufler-ca.com/](http://schaufler-ca.com/)
    -   LWN.net 文章:
        [http://lwn.net/Articles/244531/](http://lwn.net/Articles/244531/)
    -   CELF-commissioned 白皮书: [SMACK for Digital
        TV](http://www.embeddedalley.com/pdfs/Smack_for_DigitalTV.pdf)
        by Embedded Alley (now Mentor Graphics)

SMACK 在kernel 2.6.25 时被合并到kernel 主线中。

# 比较老的信息 (2005年前来自于 CELF 调查信息)

## 文档

-   CELF 1.0 安全规范: [安全规范\_R2](http://www.celinuxforum.org/CelfPubWiki/SecuritySpec_R2)

## 关键需求与相关技术点

与安全相关的技术点，这个会在表格中被引用。

1.  Umbrella
2.  Linux Security Module (LSM) framework
3.  PAX patch – x86架构独有)
4.  LOMAC
5.  LIDS
6.  Netfilter
7.  digsig/bsign/elfsig
8.  Trusted Computing Group (TCG)
9.  TPE (包括LIDS)
10. PRAMFS
11. ACL 文件系统拓展
12. Posix 中与文件相关的功能

<table>
<thead>
<tr class="header">
<th align="left">需求</th>
<th align="left">相关技术</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">可靠性</td>
<td align="left">10</td>
</tr>
<tr class="even">
<td align="left">安全/信任的引导</td>
<td align="left">8</td>
</tr>
<tr class="odd">
<td align="left">访问控制</td>
<td align="left">1, 4, 5, 11, 12</td>
</tr>
<tr class="even">
<td align="left">缓冲区/栈的保护</td>
<td align="left">3</td>
</tr>
<tr class="odd">
<td align="left">入侵检测</td>
<td align="left">5, 8</td>
</tr>
<tr class="even">
<td align="left">是否可以配置安全选项</td>
<td align="left">1, 2, 4, 5, 7, 9(?), 11, 12</td>
</tr>
<tr class="odd">
<td align="left">用户认证</td>
<td align="left">1, 7</td>
</tr>
<tr class="even">
<td align="left">Signed binaries</td>
<td align="left">1, 7</td>
</tr>
<tr class="odd">
<td align="left">可靠的连接</td>
<td align="left">IPSec, SSL already supported</td>
</tr>
<tr class="even">
<td align="left">可靠的服务</td>
<td align="left">1, 4, 5, 7, 8</td>
</tr>
<tr class="odd">
<td align="left">防火墙</td>
<td align="left">6</td>
</tr>
<tr class="even">
<td align="left">安全硬件提供的API支持</td>
<td align="left">8</td>
</tr>
<tr class="odd">
<td align="left">安全固件的可升级性</td>
<td align="left">9</td>
</tr>
<tr class="even">
<td align="left">认证</td>
<td align="left">8</td>
</tr>
</tbody>
</table>

对于清单中的相关技术，CELF 安全组正在研究或者已经支持以下的技术：

-   Umbrella
-   PAX - 目前仅仅是镜像
-   LIDS
-   Signed Binaries
    -   Dig Sig (DSI 项目一部分
        [http://disec.sourceforge.net/](http://disec.sourceforge.net/))
    -   Bsign (Debian 项目
        [http://packages.debian.org/squeeze/bsign](http://packages.debian.org/squeeze/bsign))
    -   [ELFSign](http://www.hick.org/code/skape/papers/elfsign.txt)
-   Linux API for TCG - 仍然处在 NPO 状态，并进行讨论
-   TPE - LIDS 一部分
-   ACL 文件拓展 - CELF 需要 (PRAMFS,JFFS2). 也需要关注 LKLM 讨论，然后进行实现
-   POSIX 中与文件相关的功能

## 资源

### 安全框架

-   [The Linux Security Modules (LSM)](http://lsm.immunix.org) 项目提供
	一个轻量级的，多种用途的访问权限控制。如今计算机的恶意软件增长迅速，通过增加权限访问控制模块
	可以提高内核的安全性，使得服务器在大量的攻击中幸存。安全研究已经为多种操作系统环境提供许不同类型的权限访问控制
	而LSM框架允许权限访问控制被实现为可加载的内核模块。

-   [Medusa DS9 Security Project](http://medusa.terminus.sk/) 是另外一个提高Linux kernel安全性的项目，它是由ZP安全框架实现
	。这个项目的目标就是实现一个安全框架从而实现任何的安全框架模型（不同于其他的Linux kernel项目）。

Medusa DS9 主要用来提高Linux的安全性，它由两部分组成：Linux kernel的改变和用户空间守护进程的改变。
Kernel的改变主要来模拟系统调用，文件系统动作和进程，他们被实现为通信协议。安全守护进程使用字符设备收发
数据包来与kernel进行通讯。守护进程包含了整个业务逻辑与加固的安全策略，这就意味着Medusa可以实现任何类型的
数据保护；而它仅仅取决于配置文件；实际上他是一个存在于程序内部的编程语言，非常类似与C。

-   [Rule Set Based Access Control (RSBAC)](http://www.rsbac.org) 是一个灵活的
	，强大与快速的权限控制访问框架，目前被运用到Linux kernel中，在2000年1月后，该项目已经可以稳定
	的使用。所有政府与公司的开发是相互独立的，不存在访问控制代码被重用的现象。

标准的安装包包括一系列的访问控制模块，比如MAC，RC，ACL等，而且运行注册的方式使得我们更加容易
的实现自己的访问控制内核模块，并且将他在运行时注册就可以了。

RSBAC框架是建立在通用的权限访问控制框架之上的，该框架是由Abrams与La Padula设计。
所有与系统相关的安全代码都可以被成为系统安全的拓展代码。这种代码被认为是一种中央决策组件，可以
称这些中央决策组件为决策模块或者产生组合决策，这些决策可以用来加固系统调用拓展。

决策建立在多种访问类型之上，例如访问目标，对目标的属性类型访问。另外独立属性被运用
在独立的模块中，比如：the privacy module (PM) 所有的属性被存储在受保护的文件夹内，一个文件夹
对应一个挂载设备，因此改变这些属性需要提供特殊的系统调用。

-   [TrustedBSD MAC 框架](http://www.trustedbsd.org/mac.html) -
	该项目拓展了系统原有的权限访问控制框架，允许系统管理员对系统中不同类型文件(e.g. processes or sockets)
	和对象(e.g. sockets, filesystem objects, sysctl nodes)进行额外的安全加固。开发这个新的访问控制模型
	主要是用来促进内核开发更加灵活的权限访问框架，而TrustedBSD MAC 框架允许模型使用内核模块的形式实现。

-   [可信计算集群(TCG)](https://www.trustedcomputinggroup.org/) - TCG 定义了一种基于硬件的安全架构
	，这是一种非常有效的方式建立在多种平台上的可信计算。更多的介绍请查看Seiji
    Munetoh 与 Nicholas Szeto的演示, TCGOverviewPDF, 这个演示是在
    [Tech Conference
    2005Docs](../.././dev_portals/Security/Tech_Conference_2005Docs/Tech_Conference_2005Docs.md "Tech Conference 2005Docs")
    页面上. 可信平台模块([TPM](../.././dev_portals/Security/TPM/TPM.md "TPM")) 是一个安全的芯片绑定平台级别的关键架构组件。
	TCG 拥有移动电话WG，通过WG发布了用户用例文档，这个文档可以满足大量通用的CE设备（包括移动电话）-- [MPWG User
    Cases](https://www.trustedcomputinggroup.org/groups/mobile/MPWG_Use_Cases.pdf)

### 安全组件

-   [SELinux](../.././dev_portals/Security/SELinux/SELinux.md "SELinux") - 这个功能主要用来实现对Linux Kernel的高级安全瓶通量。
    SELinux 主要起始于NSA在2001给kernel 提交的补丁，在LSM 项目中这个补丁进行了讨论，目前SELinux已经
    定义了大量的LSM接口。

-   [Apparmor](http://en.opensuse.org/Apparmor) - Apparmor 是一个安全工具用来针对应用程序提供简单易用的安全框架。

-   [Linux 入侵防护系统(LIDS)](http://www.lids.org/) 是由一个 kernel补丁和一套管理工具组成，用来实现Linux的
	权限访问控制，当该系统生效时，被选中的文件访问，所有类型的文件访问，所有系统网络的管理员操作，系统功能
	的使用，原始设备，内存，I/O访问可以被配置成无法访问，即使是root用户。我们可以配置特定的应用程序可以
	访问某些特定文件。从而拓展整个系统的能力，并将网络与文件系统的安全性加入到kernel中。我们可以调整线上系统安全防护措施
	，隐藏敏感进程，获取最近通过网络或者其他发送的安全警报。LIDS有两个版本树，1.2与2.2。LIDS 2.2支持kernel 2.6。
	LIDS 1.2支持kernel 2.4 与新的功能，Trusted Path Execution(TPE)与Trusted Domain Enforcement(TDE) 。这些可以有效的
	创建沙盒环境，目前LIDS以GPL许可证开源。

-   [TOMOYO Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") 主要用来提高Linux自身的安全性，这个特性是由[NTT DATA
    CORPORATION, Japan](http://www.nttdata.co.jp/en/index.html)开发。 [TOMOYO
    Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") 是在2005年11月11日，以GPL许可证的形式开源的。 [TOMOYO
    Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") 是一个机制，可以被称为安全操作系统，
    这个机制可以通过打破现有的访问控制，从而做到更好粒度的访问控制，与SELinux非常类似。
    -   [ELC2007
        presentation](http://sourceforge.jp/projects/tomoyo/document/elc2007-presentation-20070418-for_linux.pdf/en/4/elc2007-presentation-20070418-for_linux.pdf)
    -   [OLS2007 BoF
        slides](http://sourceforge.jp/projects/tomoyo/document/ols2007-tomoyo-20070629.pdf/en/4/ols2007-tomoyo-20070629.pdf)
    -   [CELF
        Wiki](http://tree.celinuxforum.org/CelfPubWiki/TomoyoLinux)

Tomoyo在kernel 2.6.28时被合并到kernel主线中。

-   SMACK - 一个简单的强制访问控制的Kernel子系统，这个的实现非常轻量级。
    -   官方主页 (非常简单):
        [http://schaufler-ca.com/](http://schaufler-ca.com/)
    -   LWN.net 文章:
        [http://lwn.net/Articles/244531/](http://lwn.net/Articles/244531/)
    -   CELF-commissioned 白皮书: [SMACK for Digital
        TV](http://www.embeddedalley.com/pdfs/Smack_for_DigitalTV.pdf)
        by Embedded Alley (now Mentor Graphics)

SMACK 在kernel 2.6.25 时被合并到kernel 主线中。

-   [Umbrella](http://sourceforge.net/projects/umbrella) 
	基于Linux 安全模块框架，实现了权限访问控制与文件认证的功能。权限访问控制
	方案增强了每个进程的访问控制。
    -   限制资源
    -   限制访问网络接口
    -   限制进程的创建与信号处理
    -   标示文件

-   [LOMAC](http://opensource.nailabs.com/lomac/) 
	是面向UNIX kernel的动态加载安全模块，其中它使用了低水印的权限访问控制，用来
	保护进程的二进制文件与数据不受恶意程序的影响。这里恶意程序包括病毒，特洛伊木马
	，远程恶意用户，破解的网络服务器。LOMAC设计的目标就是兼容性与易用。


LOMAC 的目标是创建权限访问控制用来保护特定的用户。LOMAC实现了一种简单的MAC集成保护形式，
这个技术基于可加载内核模块（LKM）中的低水印的权限访问控制技术，从而有效的保护系统不受
病毒，特洛伊木马，远程恶意用户，被入侵的网络服务器的损害，这个技术不会修改kernel源码，源程序
或则其他的存在的配置。LOMAC设计的目标就是兼容性，它默认的配置文件主要用来提供有效的保护，
而不用配置特定的用户，服务器，其他系统中的软件。LOMAC可以通过加载内核模块来加固当前部署的系统。

-   [The Enforcer](http://sourceforge.net/projects/enforcer/) 是一个Linux 安全模块
	，通过保证文件系统不被恶意篡改，提高运行中计算机的Linux完整性。它与TCPA硬件进行交互
	来提供更高层级的软件与敏感数据的防护。

-   [Janus](http://www.cs.berkeley.edu/~daw/janus) 是一个安全工具，用来给不信任的进程提供一个
	沙盒环境，用来限制不信任程序的执行环境。这个工具可以限制破解软件对软件造成的损害。
	我们成功的使用Janus 破解了Apache，bind，和其他程序。并将其限制在沙盒中，没有打断进程运行。
	我们还将此方法应用在生产环境中。

-   [Domain and Type Enforcement
    (DTE)](http://www.cs.wm.edu/~hallyn/dte/) 是一个权限访问控制系统，可以赋予不同文件的类型与域给特定进程。
	如果从其他域访问该进程，那么必须通过DTE策略来访问。这个项目首次实现在一篇论文中，这篇论文的名字叫《
    A Domain and Type Enforcement Prototype and
    Confining Root Programs with Domain and Type Enforcement》。

-   [The Realtime Linux Security Module
    (LSM)](http://sourceforge.net/projects/realtime-lsm/) 是Linux 2.6内核中可加载模块的拓展
    它可以赋予实时的权限给特殊的用户组和进程。

-   [ACL support for Linux
    kernel](http://sourceforge.net/projects/linux-acl/) - 这个代码包括两部分：Kernel补丁与用户代码。
	支持了Linux kernel中全部的访问控制列表(ACLs)。

-   [http://www.hu.grsecurity.net/
    grsecurity](http://grsecurity.urc.bl.ac.yu/) (镜像原始站点是
    [here](http://www.grsecurity.net/)) - 通过使用创新的方式来实现进行多层安全检测，防护，容错模型。
    该项目以GPL许可证开源。

此外提供了大量其他的特性：

-   -   一种智能的，健壮的角色权限控制系统（RBAC），它可以根据你整个系统产生一系列的权限策略
		无需进行配置。
	-   加固chroot机制
	-   避免/tmp竞争条件
	-   广泛审核
	-   阻止对于整个地址空间的漏洞利用（来自于 Pax 项目）
	-   针对TCP/IP 栈位置额外的随即性
	-   限制当前用户只能查看自身的进程
	-   每个安全警报或者是安全审计包含每个引起该错误事件用户的IP地址

### 安全特性

-   NX 补丁 - 用于kernel阻止执行栈段的恶意代码 [LKML 上关于NX 补丁的讨论](http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&threadm=232Xj-3bC-13%40gated-at.bofh.it&rnum=1&prev=/groups%3Fq%3DNX%2Bsecurity%2Blkml%26hl%3Den%26lr%3D%26ie%3DUTF-8%26selm%3D232Xj-3bC-13%2540gated-at.bofh.it%26rnum%3D1)

### 其他资源

-   启动设备的安全性
    -   安全硬件资源 -- [安全硬件资源](../.././dev_portals/Security/Security_Hardware_Resources/Security_Hardware_Resources.md "Security Hardware Resources")
    -   与Bootloader安全相关的资源 -- [与Bootloader安全相关的资源](../.././dev_portals/Security/Bootloader_Security_Resources/Bootloader_Security_Resources.md "Bootloader Security Resources")

#### 安全活动

-   [可信计算小组](https://www.trustedcomputinggroup.org/)
-   [Linux Security Modules](http://lsm.immunix.org)

#### 邮件列表

-   [Linux Security Modules mailing
    list](http://vger.kernel.org/vger-lists.html#linux-security-module)

#### 会议

-   Linux Conf Au [Linux Security 2009
    (miniconf)](http://linux.conf.au/schedule/32/view_miniconf?day=tuesday)
    - January 21, 2009
-   Usenix Security Symposium July 31 - August 4, 2006
    -   [proceedings](http://www.usenix.org/events/sec06/tech/)
-   Ottawa Linux Symposium (OLS) July 19 - 22, 2006
    [http://www.linuxsymposium.org/2006](http://www.linuxsymposium.org/2006)
    -   [OLS
        Proceedings](http://www.linuxsymposium.org/2006/proceedings.php)

#### 与安全相关的文章

-   [TOMOYO Linux and pathname-based
    security](http://lwn.net/Articles/277833/) [LWN.net] Apr 2008
-   [The Linux Journal Aug
    2003](http://www.linuxjournal.com/article.php?sid=6633)
-   [ARM's Trust Zone for
    Security](http://www.arm.com/miscPDFs/4136.pdf)
-   [TPM-based Linux Run-time
    Attestation](http://www.research.ibm.com/secure_systems_department/projects/tcglinux/)

移动到:

-   [TPM-based Linux Run-time Attestation
    correct](http://domino.research.ibm.com/comm/research_projects.nsf/pages/ssd_ima.index.html)

#### 论文

-   [对TCPA/TCG硬件的测试](http://www.cs.dartmouth.edu/~sws/pubs/TR2003-476.pdf)
-   [用来阻止动态缓冲区溢出工具对比](http://www.ida.liu.se/~johwi/research_publications/paper_ndss2003_john_wilander.pdf)
-   [SMACK for Digital
    TV](http://www.embeddedalley.com/pdfs/Smack_for_DigitalTV.pdf)

#### 简单的开源代码

-   [A sample GPL TCPA Linux
    driver](http://www.research.ibm.com/gsal/tcpa/) for Red Hat 8
-   [Linux TPM Device Driver](http://sourceforge.net/projects/tpmdd)
-   [TCG Software Stack (TSS) for
    Linux](http://sourceforge.net/projects/trousers)
-   A NetBSD driver and some useful links can be found at Rick Wash's
    [可信计算](http://www.citi.umich.edu/u/rwash/projects/trusted)主页


[目录](http://eLinux.org/Special:Categories "Special:Categories"):

-   [安全](http://eLinux.org/Category:Security "Category:Security")

