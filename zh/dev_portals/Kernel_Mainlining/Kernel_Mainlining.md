> 原文：[eLinux.org](http://elinux.org/Power_Management)<br/>
> 翻译：[@DecJude](https://github.com/DecJude)<br/>
> 校订：[@lzufalcon](https://github.com/lzufalcon)<br/>


# Kernel Mainlining



本文为嵌入式开发者介绍了如何向Linux内核主分支合入patch的过程

## 目录

-   [1 通用资源](#general-resources)
    -   [1.1 相关演讲](#presentations)
        -   [1.1.1 演讲列表](#talk-list)
    -   [1.2 训练，指导和挑战](#training-tutorials-and-challenges)
-   [2 具体项目](#specific-projects)
-   [3 最佳行动说明](#notes-for-best-practices)
    -   [3.1 来自 Andrew Morton](#from-andrew-morton)
    -   [3.2 来自 Deepak Saxena](#from-deepak-saxena)
    -   [3.3 来自 Jonathan Corbet](#from-jonathan-corbet)
    -   [3.4 来自 Arnd Bergmann](#from-arnd-bergmann)
    -   [3.5 来自 David Arlie](#from-david-arlie)
-   [4 克服mainlining遇到的障碍](#overcoming-obstacles-to-mainlining)

## 通用资源

-   [Documentation/HOWTO](https://www.kernel.org/doc/Documentation/HOWTO)
    - 说明如何为Linux内核编写代码并贡献的文档
-   [Documentation/development-process](https://www.kernel.org/doc/Documentation/development-process/)
    - 讲述内核开发流程的文档

### 相关演讲

Greg KH 曾做过一次伟大的演讲，主体是关于Linux社区如何工作的，下面是演讲内容的链接，可以参考用以入门:

-   [Linux Kernel Development
    (pdf)](https://github.com/gregkh/kernel-development/blob/master/kernel-development.pdf?raw=true)

更早的时候(2008年)Andrew Morton在一次演讲中谈到了往Linux内核贡献的原因，以及往内核社区贡献代码的最佳方法

-   [Session:kernel.org development and the embedded
    world](../.././dev_portals/Kernel_Mainlining/Session:kernel.org_development_and_the_embedded_world/Session:kernel.org_development_and_the_embedded_world.md "Session:kernel.org development and the embedded world")
    -   在2008年的这次开创性的演讲中，Andrew勾勒出嵌入式企业参与内核开发的情景。他讲解了整个开发流程，更为重要的是，他他讲到了开发者们很期待的内容，即在一步步mainlining的过程中，要做什么，不要做什么，以及如何组织构建可以和内核社区高效协同工作的团队。

#### 演讲列表

下面是之前提到的Linux会议中的关于mainlining和社区参与的一系列演讲:

-   [How to Participate in the Kernel Development Process
    (PDF)](http://eLinux.org/images/0/00/Corbet-dev-process.pdf "Corbet-dev-process.pdf")
    - ELC-2007, April 2007, Jonathan Corbet
    -   这次演讲旨在厘清那些(内核开发过程中中)取得成功和导致失败的因素，这将在某种程度上帮助到哪些意图将代码合入内核的人.
-   ELC-2008 morton (noted above)
-   Appropriate Community Practices: Social and Technical Advice -
    ELC-2008, April 2008 Deepak Saxena
    -   摘要：随着Linux在嵌入式领域愈加受到欢迎，硬件厂商们都在跃跃欲试，想要为他们的设备/芯片/SoC添加对Linux内核的支持。我们社区内不断看到同样的错误在重演(包括技术和交流方面)。参与内核社区我们可以得到一些益处，并且可以借鉴一些Linux开发生态系统中失败的例子，来适当加以练习，从而提高代码被收录到kernel.org的几率;
    -   (presentation not available)
-   [Embedded maintainers: Community and Embedded
    Linux](http://eLinux.org/images/c/c5/Dwmw2-community_and_embedded_linux.pdf "Dwmw2-community and embedded linux.pdf")
    ELCE-2008, David Woodhouse
    -   这次演讲介绍并讨论了关于"嵌入式内核维护者" 的新的社区规则，和David主席的一些构想，并且在寻求大家的意见。即"嵌入式内核维护者"这个工作实际上应该是什么意思。
    -   内核社区迫切需要更加凝聚 - 不仅仅是因为大公司和我们关系融洽，也是因为到目前为止我们还没有建立起一个围绕嵌入式Linux的社区。他们本应该协同工作，但即使在少数的项目中也没有做到。"嵌入式内核维护者"的角色和其他内核模块的维护者不一样 - 我们甚至没有自己的特定的整块代码，只是扮演了看门人和仲裁者的角色来尝试它。所以更多的是需要把开发者聚在一起，让大家更好的合作。
-   [Embedded Linux and Mainline
    Kernel](http://eLinux.org/images/c/c5/Dwmw2-ELC-2009-04.pdf "Dwmw2-ELC-2009-04.pdf")
    - ELC-2009, April 2009, David Woodhouse
    -   在技术层面，很多嵌入式开发者意识到，和其他的Linux应用领域相比，嵌入式Linux系统具有更多的共性。在这次演讲中，David将会阐述嵌入式开发者们所关心的那些区块在企业和桌面级系统领域的需求情况。那些关于嵌入式开发者不需要和更大Linux社区进行互动交流的陈辞滥调是站不住脚的。David不但从讲解了应对不断增加的社区内协同工作的技术原理，也为嵌入式开发者更好的参与进来提供了一些建议。
    -   Notes: 从嵌入式领域外找寻其他有相同需求的第三方。 虚拟化系统是一个很值得去了解的地方，因为他们经常会有资源方面的约束。
-   [Cooperative Development Inside
    Communities](http://eLinux.org/images/5/50/CommunityDevelopment.pdf "CommunityDevelopment.pdf")
    ELC-2009 Jeff Osier-Mixon
    -   这次演讲介绍了MELD(MontaVista主办的嵌入式Linux社区);
-   [Becoming Part of the Linux Kernel
    Community](http://eLinux.org/images/6/63/Elc2011_bergmann_keynote.pdf "Elc2011 bergmann keynote.pdf")
    ELC-2011, April, 2011, Arnd Bergmann
    -   这次演讲介绍了被整合进Linux社区的好处(嬉皮士风格的演讲)。
-   [Developer's Diary: Helping the
    Process](http://eLinux.org/images/f/fe/Elc2011_sang.pdf "Elc2011 sang.pdf") ELC-2011,
    April 2011, Wolfram Sang
    -   包括了往内核主分支贡献代码的最佳做法的记录。
-   Contributing to the Community? Does your manager support you? -
    ELCE-2011 Satoru Ueda
    -   这是一场关于"如何说服你的上司"的演讲。
-   ELC-2013 rose
-   ELC-2013 chalmers
-   ELC-2014 maupin
-   [Two years of ARM SoC support Mainlining: Lessons
    Learned](http://eLinux.org/images/d/dc/Petazzoni-soc-mainlining-lessons-learned.pdf "Petazzoni-soc-mainlining-lessons-learned.pdf")
    ELC-2014, April 2014, Thomas Petazzoni
    -   给出了很多好的技巧，包括社群方面的。

### 训练，指导和挑战

-   [KernelNewbies web site](http://kernelnewbies.org/) 是一个专注于帮助开发者学习如何往Linux内核贡献的网站
    -   该网站有一个"To Do" list，上面是一些小的开发任务，地址是
        [http://kernelnewbies.org/KernelJanitors/Todo](http://kernelnewbies.org/KernelJanitors/Todo)
    -   他们有个非常好的 [Guide to Upstream
        Merging](http://kernelnewbies.org/UpstreamMerge) 板块(编者按: 现在叫 Upstream Merge Guide)，那里有很多技术以及社群方面的技巧。

-   The Outreach Program For Women(女性推广项目) 有一个非常好的指导步骤，是关于贡献你的第一个patch到内核  
    -   [OPFW First Patch
        tutorial](http://kernelnewbies.org/OPWfirstpatch)

-   [Eudyptula Challenge](http://eudyptula-challenge.org/)
    -   这是一个通过邮件来管理的一系列 "20 tasks"， 用以帮助开发者学习如何开发内核并提交patch。
    -   LWN.net article
        [http://lwn.net/Articles/599231/](http://lwn.net/Articles/599231/)

-   [http://www.tuxradar.com/content/newbies-guide-hacking-linux-kernel](http://www.tuxradar.com/content/newbies-guide-hacking-linux-kernel)

## 具体项目

-   [CE Workgroup Device Mainlining
    Project](../.././dev_portals/Kernel_Mainlining/CE_Workgroup_Device_Mainlining_Project/CE_Workgroup_Device_Mainlining_Project.md "CE Workgroup Device Mainlining Project")
-   [Qualcomm SOC Mainlining
    Project](../.././dev_portals/Kernel_Mainlining/Qualcomm_SOC_Mainlining_Project/Qualcomm_SOC_Mainlining_Project.md "Qualcomm SOC Mainlining Project")
-   [Allwinner mainlining
    effort](http://linux-sunxi.org/Linux_mainlining_effort)
    -   这是一个相当好的网站，上面更新了已经合入各内核分支的patch的状态，以及那些任务仍在进行中。

## 最佳行动说明

### 来自 Andrew Morton

-   工业界应当有一个嵌入式内核维护者
-   向内核社区上报问题和需求
-   参与社区论坛
-   企业应该贡献出几位工程师，独立于产品开发团队
-   基于最新的内核主分支开发产品，产品开发结束时冻结它(编者按：不再和主分支保持同步)。
    -   从我所了解的看： 目前Android相关模块和板级的特性不再此列(编者按，主流Android设备都会不定时获得系统更新，包括了Linux内核)。
-   向社区(Andrew)寻求帮助

### 来自 Deepak Saxena

-   不要傲慢 - 不要试图把你在特定领域开发的经验照搬到开源领域
    -   保持谦逊并听取其他人的想法
-   早一点release，多点release
    -   不这样做的话，以后会浪费很多时间在实现的推翻和重写上面
-   个人练习
    -   看看那些Linux内核已经实现了的部分，看它是否可以扩展来支持你的案子。
    -   把实现加入到现有的抽象层，而不是用你自己的新潮的方案 (愿意去舍弃你自己的部分代码，只要最终你的相关模块可以得到社区支持)
-   不要添加OS层面的抽象实现(或者是来自其他操作系统的HAL层)
    - 驱动程序必须是位于Linux内核层面 - 位于其他层和复杂的驱动程序没有办法被Linux内核开发者所维护
-   添加抽象实现 - 不要仅仅只解决你眼前的问题
    -   实现支持多个相关硬件的系统方案
    -   有意愿去推广普及
-   个人练习
    -   使用主分支的资源
    -   提出有见解的问题
-   和社区协同工作，把他们看作是你自己的团队
    -   把来自外部的开发者当作你的团队成员
    -   尊重他们

### 来自 Jonathan Corbet

-   原因 <查看演讲稿>
-   专有软件和开源软件的差异
    -   专有软件 = 产品驱动，自上而下的需求，短期，内部品控，层层决策，私有代码库，完全控制
    -   开源软件 = 流程驱动，自下而上的需求，长期，外部品控，一致决策，公共代码库，轻度控制
-   理解patch的生命周期
    -   尽早发出来，通过社区解决问题
    -   进入流程
    -   内核主分支接受
-   早一点发布代码，经常改进发布
-   提交patch
    -   发送变更，即使不被接受也可以影响相关方向
    -   不要有一对多的patch， 把每个patch做的简单和独立
    -   做出一分为二的patch系列
    -   遵循提交规则
        -   use diff -u, no MIME, correct format, Signed-off-by line,
            watch word-wrapping
    -   发送到正确的地方: MAINTAINERS, get-maintainer.pl
    -   听取审核人的意见，要有礼貌，不要忽略他们的反馈
-   看开点
    -   你的代码或许要重写或者被替换
-   写代码
    -   遵循代码风格规范
        -   不要太多 (HAL层，没有用到的参数，只有一行代码的函数)
            -   不要有多个OS的代码
        -   不要太少 - 如果相关实现已经有了，应当推广之
    -   不要破坏API
        -   (只有在具有非常好的理由的时候)可以破坏内核的API，但是你也必须把整个内核的相关部分都修复
        -   永远不要破坏用户空间的API
    -   不要引发衰退

### 来自 Arnd Bergmann

-   朋友，支持者和不速之客
-   不要骚扰你的内核维护者
    -   公开你所有的代码，包括设备驱动
    -   他们会很喜欢开源的3D嵌入式图形驱动
-   成为社区的一份子
-   付出和回报
    -   分步解决
        -   使用公开的源代码
        -   修改源代码 - 给每个功能做一个git 分支
        -   每个分支都应该有机会向社区提交
    -   跨越浪潮
        -   尽可能的多去re-base
    -   把产品和开发的代码树分开
        -   把开发一直放在单独的分支进行
    -   审核
        -   提供学习经验
        -   新来的人也可以review，并且在这个过程中学习
    -   尊重
        -   审核人 - 要认可开发者的努力工作，即使你不得不打回他们的提交
        -   提交人 - 应当尊重审核人的经验和知识，按他们的建议来做，即使你可能并不认同
    -   拒绝
        -   维护者 - 拒绝差的代码比接受好的代码更为重要
    -   责任
        -   不要仅仅只复制这些基础的部分，还要扩展它，推广它

### 来自 David Arlie

[http://airlied.livejournal.com/80112.html](http://airlied.livejournal.com/80112.html)

* * * * *

你有很长的一段路要走，但首先你要从家里离开

或是为什么公开代码才是STEP ZERO.

如果你已经在以内核开发的形式贡献内核，你也许有很多原因不能一开始就默认选择开源，你也许不是在像Red Hat这样的默认支持开源政策的公司工作，或者是你可能害怕恐怖的内核社区，想自己成为一块闪亮的宝石。

如果你的公司正在遭受代码合法性检查等等之类的痛苦，可能你已经花费/浪费了好几个月的项目时间在内部检查和材料上，所以你还有什么理由不去考虑这些问题呢？你都已经浪费了这么多的时间在这些事上了，这绝对是个问题

所以如果你都有了优雅的代码库，那么内核维护者们有什么理由不喜欢去合入它们呢

然后，你就公开了你的代码

看吧，你才离开你的屋子。而合入你的代码还有数英里远的距离，你才刚刚踏上路途，是从现在开始算起，不是在你开始写代码的时候，不是在你开始做代码合法性检查的时候，也不是当你私底下第四次重写代码的时候。 你只是从现在开始。

也许你不得不公开重写的你代码多大6次， 也许你从来没有让它被合入进去过，也许你的竞争对手也在进行这方面的工作，内核维护者更希望你去他人合作，"操纵民意"的做法只会让他们大发雷霆，这就是内核开发的过程

step zero: 公开的你代码。离开屋子。

(最近我看到这样的问题越来越多，所以我决定把它写出来，这真的不是针对任何特定的目标，因为我想大部分的厂商都会犯这样的问题).

* * * * *

\< 文章是关于为何你应该立即公开你的代码\>

-  这引发了这些问题:
    -   为何要尽早开源？ 因为如果不这样的话，后续的工作量可能会加倍
    -   立即开源代码的障碍是什么:
        -   依赖关系!!! (大部分是版本之间的差异)

## 克服mainlining遇到的障碍

Tim Bird 为ELCE 2014准备了一篇关于 [Overcoming Obstacles to
Mainlining](../.././dev_portals/Kernel_Mainlining/Overcoming_Obstacles_to_Mainlining/Overcoming_Obstacles_to_Mainlining.md "Overcoming Obstacles to Mainlining") 的演讲。可以在这个页面看到关于本次演讲的信息以及幻灯片的链接。


[类别](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

