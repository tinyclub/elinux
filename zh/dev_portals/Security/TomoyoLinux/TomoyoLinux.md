**关注译者公众号**：
<br/>
<img src='../../../../pic/tinylab-wechat.jpg' width='110px'/>
<br/>


> 原文：[eLinux.org](http://eLinux.org/TomoyoLinux)<br/>
> 翻译：[@lzz5235](https://github.com/lzz5235)<br/>
> 校订：[@ibrother](https://github.com/ibrother)


# TomoyoLinux



[![Tomoyo-color.png](http://eLinux.org/images/e/ed/Tomoyo-color.png)](http://eLinux.org/File:Tomoyo-color.png)

## 目录

-   [1 概述](#overview)
-   [2 从今天开始！](#start-today-21)
-   [3 安装](#install)
    -   [3.1 主线版本 (2.3)](#mainline-version-2-3)
    -   [3.2 原始 hook 版本 (版本 1.8)](#original-hook-version-version-1-8)
    -   [3.3 Arch Linux](#arch-linux)
    -   [3.4 MeeGo 1.1](#meego-1-1)
    -   [3.5 Android](#android)
    -   [3.6 TOMOYO Linux on LFS](#tomoyo-linux-on-lfs)
    -   [3.7 TOMOYO Linux on CAT760](#tomoyo-linux-on-cat760)
-   [4 浏览代码](#browse-the-code)
-   [5 演示文档](#presentations)
    -   [5.1 Highlights](#highlights)
    -   [5.2 2010-08-12 LinuxCon 2010](#2010-08-12-linuxcon-2010)
    -   [5.3 2009-10-27 Smartbook/Netbook/Mobile Application Conference
        Taipei
        2009](#2009-10-27-smartbook-netbook-mobile-application-conference-taipei-2009)
    -   [5.4 2009-10-23 Japan Linux Symposium
        2009](#2009-10-23-japan-linux-symposium-2009)
    -   [5.5 2009-9-23 LinuxCon2009](#2009-9-23-linuxcon2009)
    -   [5.6 2009-6-12 CE Linux Forum Japan Technical Jamboree
        28](#2009-6-12-ce-linux-forum-japan-technical-jamboree-28)
    -   [5.7 2009-5-22 CE Linux Forum Japan Technical Jamboree
        27](#2009-5-22-ce-linux-forum-japan-technical-jamboree-27)
    -   [5.8 2009-1-21 Linux Conf Au "Linux Security 2009
        (miniconf)"](#-2009-1-21-linux-conf-au-linux-security-2009-miniconf)
    -   [5.9 2008-11-21 FreedomHEC Taipei
        (Chinese)](#2008-11-21-freedomhec-taipei-chinese)
    -   [5.10 2008-11-13 PacSec 2008](#2008-11-13-pacsec-2008)
    -   [5.11 2008-7-25 Ottawa Linux Symposium 2008
        BoF](#2008-7-25-ottawa-linux-symposium-2008-bof)
    -   [5.12 2008-7-9 Linux Foundation Japan \#8
        Symposium](#2008-7-9-linux-foundation-japan-8-symposium)
    -   [5.13 2008-4-15 Embedded Linux Conference
        2008](#2008-4-15-embedded-linux-conference-2008)
    -   [5.14 2008-2-24 FOSDEM2008 (Embedded Developer
        Room)](#2008-2-24-fosdem2008-embedded-developer-room)
    -   [5.15 2007-11-29 PacSec 2007](#2007-11-29-pacsec-2007)
    -   [5.16 2007-06-29 Ottawa Linux Symposium
        2007](#2007-06-29-ottawa-linux-symposium-2007)
    -   [5.17 2007-04-18 CELF Worldwide Embedded Linux Conference
        2007](#2007-04-18-celf-worldwide-embedded-linux-conference-2007)
-   [6 For the memory of OLS2007](#for-the-memory-of-ols2007)
-   [7 文章](#articles)
-   [8 阅读](#readings)
-   [9 主线](#mainline)
    -   [9.1 活动](#activities)
    -   [9.2 预测](#forecast)
-   [10 邮件列表](#mailing-list)
-   [11 检查升级？](#check-for-updates-3f)
-   [12 匿名交流? ](#talk-annonymously-3f)
-   [13 联系我们](#contact)
<span id="overview"></span>

## 概述

TOMOYO Linux 是 Linux 上的一个强制访问控制(MAC)实现，可以用来增加系统的安全性，同时也可以纯粹的作为
系统分析工具使用。这个项目在 2003 年 3 月启动，由日本NTT DATA 公司资助。

想查看更多的信息，请查看我们的项目主页。

[http://tomoyo.sourceforge.jp/](http://tomoyo.sourceforge.jp/)
<span id="start-today-21"></span>

## 从今天开始！

-   [TOMOYO Linux LiveCD Tutorial for Ubuntu 10.04 (version
    1.8)](http://tomoyo.sourceforge.jp/1.8/ubuntu10.04-live.html.en)
-   [TOMOYO Linux LiveCD Tutorial for CentOS 5.5 (version
    1.8)](http://tomoyo.sourceforge.jp/1.8/centos5-live.html.en)
<span id="install"></span>

## 安装
<span id="mainline-version-2-3"></span>

### 主线版本 (2.3)

-   [如何使用 TOMOYO Linux](http://tomoyo.sourceforge.jp/2.3/)
<span id="original-hook-version-version-1-8"></span>

### 原始 hook 版本 (版本 1.8)

-   [http://tomoyo.sourceforge.jp/1.8/](http://tomoyo.sourceforge.jp/1.8/)
<span id="arch-linux"></span>

### Arch Linux

-   [TOMOYO Linux -
    ArchWiki](https://wiki.archlinux.org/index.php/TOMOYO_Linux)
-   [Perfect Hideout: TOMOYO Linux - 5 个技巧来优化您的体验
    experience](http://stolowski.blogspot.com/2010/12/tomoyo-linux-5-tips-to-streamline-your.html)
-   [Perfect Hideout: Arch Linux 上的 TOMOYO Linux 强制访问控制（MAC）
    ](http://stolowski.blogspot.com/2009/10/arch-linux-with-tomoyo-linux-mac.html)
<span id="meego-1-1"></span>

### MeeGo 1.1

-   [MeeGo 上的 TOMOYO Linux](http://tomoyo.sourceforge.jp/1.8/meego-x86.html.en)
-   [基于 MeeGo 1.1 的TOMOYO Linux 移动电话](http://www.youtube.com/watch?v=H9aZv49d2iw)
<span id="android"></span>

### [Android](http://elinux.org/Android_Security#TOMOYO_Linux_investigation)

-   [Android 上的 TOMOYO Linux ](http://tomoyo.sourceforge.jp/1.8/android-arm.html)
-   [Celf 演示文档](http://www.slideshare.net/haradats/tomoyo-linux-on-android)
-   [使用 TOMOYO Linux 学习，分析与保护 Android
    (JLS2009)](http://www.slideshare.net/haradats/learning-analyzing-and-protecting-android-with-tomoyo-linux-jls2009)
<span id="tomoyo-linux-on-lfs"></span>

### TOMOYO Linux on [LFS](http://www.linuxfromscratch.org/lfs/)

对于这些“顽固的家伙”，TOMOYO Linux 也可以顺利的运行在
[LFS](http://www.linuxfromscratch.org/lfs/) 上。查找您所使用的版本。

-   [TOMOYO CBLFS](http://cblfs.cross-lfs.org/index.php/TOMOYO)
<span id="tomoyo-linux-on-cat760"></span>

### TOMOYO Linux on CAT760

-   [TOMOYO Linux on
    CAT760](http://tomoyo.sourceforge.jp/1.8/cat760-sh.html.en)
<span id="browse-the-code"></span>

## 浏览代码

-   [kernel/security/tomoyo](http://tomoyo.sourceforge.jp/cgi-bin/lxr/source/security/tomoyo/)
<span id="presentations"></span>

## 演示文档
<span id="highlights"></span>

### Highlights

-   [Slideshare 上的 TOMOYO ](http://www.slideshare.net/haradats/presentations?order=popular)
<span id="2010-08-12-linuxcon-2010"></span>

### 2010-08-12 LinuxCon 2010

-   [您的第一个向导去设置 "安全的
    Linux"](http://www.slideshare.net/haradats/your-first-guide-to-secure-linux-4906031)
<span id="2009-10-27-smartbook-netbook-mobile-application-conference-taipei-2009"></span>

### 2009-10-27 [Smartbook/Netbook/Mobile Application Conference Taipei 2009](http://www.oss.org.tw/seminar/smartbook2009/index_en.php)

-   [Android 上面的 TOMOYO Linux](http://www.slideshare.net/haradats/taipei2009)
<span id="2009-10-23-japan-linux-symposium-2009"></span>

### 2009-10-23 Japan Linux Symposium 2009

-   [内核开发：来自于“错误”的借鉴](http://sourceforge.jp/projects/tomoyo/docs/20091023-drawing-lessons.pdf)
-   ["使用 TOMOYO Linux 学习，分析和保护 Android 系统"](http://sourceforge.jp/projects/tomoyo/docs/JLS_tomoyo_tutorial.pdf)
<span id="2009-9-23-linuxcon2009"></span>

### 2009-9-23 LinuxCon2009

-   [作为一个企业项目经理的意义 (企业版本)](http://sourceforge.jp/projects/tomoyo/docs/20090923linuxcon2009.pdf)
-   [作为一个企业项目经理的意义 （开源精神版本）](http://www.slideshare.net/haradats/what-does-it-mean-being-an-open-source-project-manager-in-enterprise-open-source-spirit-edition)
<span id="2009-6-12-ce-linux-forum-japan-technical-jamboree-28"></span>

### 2009-6-12 [CE Linux Forum Japan Technical Jamboree 28](http://elinux.org/Japan_Technical_Jamboree_28)

-   [第一部分: TOMOYO Linux 的介绍 与 Q&A
    (日语)](http://sourceforge.jp/projects/tomoyo/docs/Part1_CELF_Jamboree_28_TOMOYOLinuxOutline.pdf)
    - [视频](http://www.celinuxforum.org/VideoArchive/JJAM28_1b.html)

-   [第二部分: Android 上面的 TOMOYO Linux (英语)](http://sourceforge.jp/projects/tomoyo/docs/Part2_CELF_Jamboree_28_TOMOYO_on_Android.pdf)
    - [视频](http://www.celinuxforum.org/VideoArchive/JJAM28_1c.html)
<span id="2009-5-22-ce-linux-forum-japan-technical-jamboree-27"></span>

### 2009-5-22 [CE Linux Forum Japan Technical Jamboree 27](http://elinux.org/Japan_Technical_Jamboree_27)

-   [Android 上面的 TOMOYO Linux](http://sourceforge.jp/projects/tomoyo/docs/Part2_CELF_Android.pdf)
-   [视频](http://www.celinuxforum.org/VideoArchive/JJAM27_1b.html)
<span id="-2009-1-21-linux-conf-au-linux-security-2009-miniconf"></span>

### 2009-1-21 [Linux Conf Au](http://linux.conf.au/) ["Linux Security 2009 (miniconf)"](http://linux.conf.au/schedule/32/view_miniconf?day=tuesday)

-   [TOMOYO Linux 概述](http://sourceforge.jp/projects/tomoyo/docs/lca2009-takeda.pdf)
-   [深度剖析 TOMOYO
    Linux](http://sourceforge.jp/projects/tomoyo/docs/lca2009-kumaneko.pdf)
-   LWN.net 文章, ["LCA: 安全的面板"](http://lwn.net/Articles/315974/)
<span id="2008-11-21-freedomhec-taipei-chinese"></span>

### 2008-11-21 [FreedomHEC Taipei](http://freedomhectaipei.pbwiki.com/) ([Chinese](http://seminar.oss.org.tw/fhec/index.html))

-   ["Secure Linux" Primer](http://tomoyo.sourceforge.jp/taipei2008/)
-   [TOMOYO Linux: Linux 上务实可控的安全](http://sourceforge.jp/projects/tomoyo/docs/freedomhectaipei-tomoyo.pdf)

-   [照片](http://picasaweb.google.com/haradats/FreedomHECTaipei2008#)
<span id="2008-11-13-pacsec-2008"></span>

### 2008-11-13 PacSec 2008

-   [基于行为的应对 SSH 暴力攻击的对策](http://sourceforge.jp/projects/tomoyo/docs/PacSec2008-en.pdf)
<span id="2008-7-25-ottawa-linux-symposium-2008-bof"></span>

### 2008-7-25 Ottawa Linux Symposium 2008 BoF

-   ["MAC for Linux, Time to
    Glean"](http://sourceforge.jp/projects/tomoyo/document/ols2008-bof.pdf)
    (pdf)
-   [HTML](http://tomoyo.sourceforge.jp/wiki-e/?OLS2008-MAC-BOF) version
<span id="2008-7-9-linux-foundation-japan-8-symposium"></span>

### 2008-7-9 [Linux Foundation Japan](http://www.linux-foundation.jp/) \#8 Symposium

-   [Agenda](http://www.linux-foundation.jp/uploads/seminar20080709/sympo0807.pdf)
-   ["真实的主线 -  TOMOYO Linux 项目案例"](http://sourceforge.jp/projects/tomoyo/document/lfj2008.pdf)
    (pdf)
-   [视频](https://www.linuxfoundation.org/events/node/101/)
<span id="2008-4-15-embedded-linux-conference-2008"></span>

### 2008-4-15 [Embedded Linux Conference 2008](http://www.embeddedlinuxconference.com/elc2008/)

-   ["如何使用TOMOYO Linux 分析您的 Linux 行为"](http://sourceforge.jp/projects/tomoyo/document/elc2008.pdf)
    ([程序](http://www.embeddedlinuxconference.com/elc2008/elc2008_003.htm))
<span id="2008-2-24-fosdem2008-embedded-developer-room"></span>

### 2008-2-24 [FOSDEM2008](http://www.fosdem.org/2008/) ([Embedded Developer Room](http://www.fosdem.org/2008/schedule/devrooms/embedded))

-   [程序](http://www.fosdem.org/2008/schedule/events/embedded_tomoyo_secure)
-   ["面向安全嵌入式设备的 TOMOYO Linux"](http://sourceforge.jp/projects/tomoyo/document/fosdem2008.pdf)
-   [照片](http://picasaweb.google.com/haradats/FOSDEM08)

-   [http://www.thinkit.co.jp/article/87/3/](http://www.thinkit.co.jp/article/87/3/)
    (日语)
<span id="2007-11-29-pacsec-2007"></span>

### 2007-11-29 [PacSec 2007](http://www.pacsec.jp/speakers.html)

-   [PacSec2007 报道](http://www.thinkit.co.jp/free/article/0712/9/1/)
-   [TOMOYO Linux: 一种实用的方法来了解和保护你自己的 Linux 主机](http://sourceforge.jp/projects/tomoyo/document/PacSec2007-en-no-demo.pdf)
-   [TOMOYO Linux: 一种实用的方法来了解和保护你自己的 Linux 主机 (包含demo)](http://sourceforge.jp/projects/tomoyo/document/PacSec2007-en-demo.pdf)
-   [Handouts
    (双语)](http://sourceforge.jp/projects/tomoyo/document/PacSec2007-handout.pdf)
-   [照片](http://picasaweb.google.com/haradats/PacSec2007)
<span id="2007-06-29-ottawa-linux-symposium-2007"></span>

### 2007-06-29 [Ottawa Linux Symposium 2007](http://www.linuxsymposium.org/2007/index_2007.php)

-   [TOMOYO Linux
    BoF](http://sourceforge.jp/projects/tomoyo/document/ols2007-tomoyo-20070629.pdf)
-   [照片](http://picasaweb.google.com/haradats/OLS2007)
<span id="2007-04-18-celf-worldwide-embedded-linux-conference-2007"></span>

### 2007-04-18 CELF Worldwide [Embedded Linux Conference 2007](http://www.celinux.org/elc2007/index.html)

-   ["TOMOYO Linux - 面向 PC 和 嵌入式 Linux 的轻量级与可管理的安全系统"](http://sourceforge.jp/projects/tomoyo/document/elc2007-presentation-20070418.pdf)
-   [TOMOYO Linux 使用向导](http://sourceforge.jp/projects/tomoyo/document/elc2007-tutorial-20070418.pdf)
<span id="for-the-memory-of-ols2007"></span>

## For the memory of OLS2007

-   [Memorial of OLS2007
    BOF](http://tomoyo.sourceforge.jp/wiki-e/?OLS2007-BOF)
-   [OLS2007 照片](http://picasaweb.google.co.jp/haradats/OLS2007)
-   [「熱い言葉に背中を押されて」](http://www.thinkit.co.jp/free/article/0709/8/1/)
    (in Japanese)
-   [「海外での講演、そして新たなチャレンジへ」](http://www.thinkit.co.jp/free/article/0709/8/1/)
    (in Japanese)
<span id="articles"></span>

## 文章

-   [来自 JLS [LWN.net](http://lwn.net/Articles/358701/) 的报道]
-   [Perfect Hideout: Arch Linux 上的 TOMOYO Linux 强制访问控制（MAC）](http://stolowski.blogspot.com/2009/10/arch-linux-with-tomoyo-linux-mac.html)
-   [Mandriva Linux 2010 发布 \>\> IT - Chuiko | Information
    Technology
    News](http://it-chuiko.com/computers/1177-mandriva-linux-2010-released.html)
-   [Tomoyo GUI | Eugeni's
    blog](http://dodonov.net/blog/2009/07/06/tomoyo-gui/)
-   [Linux 2.6.30 下更快的启动 «
    PixelEstudios.com](http://english.pixelestudios.com/blog/?p=6)
-   [为什么说Linux 安全已经失败 (过去十年) - Subreption
    Blog](http://www.subreption.com/blog/2009/10/why-linux-security-has-failed-for-the-past-10-years.html)
-   [Kernel prepatch 2.6.30-rc1 |
    LWN.net](http://lwn.net/Articles/327610/)
-   [TOMOYO Linux 与基于路径名的安全 |
    LWN.net](http://lwn.net/Articles/277833/)
-   [TOMOYO Linux |
    KernelTrap](http://kerneltrap.org/Linux/TOMOYO_Linux)
<span id="readings"></span>

## Readings

-   [「初体験 TOMOYO
    Linux」](http://www.thinkit.co.jp/free/article/0706/21/1/) (日语)
-   [世界的TOMOYO Linux](http://tomoyo.sourceforge.jp/wiki/?WorldOfTomoyoLinux) (日语)
<span id="mainline"></span>

## 主线
<span id="activities"></span>

### 活动

-   [简略查看](http://tomoyo.sourceforge.jp/wiki-e/?JLS2009)

-   [1st posting (13 Jun, 2007)](http://lwn.net/Articles/238049/)
-   [2nd posting (24 Aug, 2007)](http://lwn.net/Articles/246930/)
-   [3rd posting (2 Oct, 2007)](http://lwn.net/Articles/252652/)
-   [4th posting (11 Oct, 2007)](http://lwn.net/Articles/254503/)
-   [5th posting (17 Nov, 2007)](http://lwn.net/Articles/258905/)
-   [TOMOYO Linux Security Goal (27 Dec,
    2007)](http://lwn.net/Articles/263179/)
    ([thread](http://thread.gmane.org/gmane.linux.kernel.lsm/5022))
-   [6th posting (8 Jan, 2008)](http://lwn.net/Articles/264187/)
-   [7th posting (4 Apr, 2008)](http://lwn.net/Articles/276603/)
-   [8th posting (1 May, 2008)](http://lwn.net/Articles/280979/)
-   [Introduce new LSM hooks where vfsmount is available (17, Sep,
    2008)](http://lwn.net/Articles/298823/)
-   [9th posting (24 Sep, 2008)](http://lwn.net/Articles/300190/)
-   [10th posting (9 Oct, 2008)](http://lwn.net/Articles/303042/)
-   [11th posting (20 Oct, 2008)](http://lwn.net/Articles/303973/)
-   [for -mm tree (4 Nov, 2008)](http://lwn.net/Articles/305824/)
-   [13th posting (21 Nov, 2008)](http://lwn.net/Articles/308109/)
-   [14th posting (1 Jan, 2009)](http://lkml.org/lkml/2009/1/1/27)
-   [15th posting (5 Feb, 2009)](http://lwn.net/Articles/318153/)
<span id="forecast"></span>

### 预测

-   [Linux 天气预报/安全 - Linux 基金会](http://www.linux-foundation.org/en/Linux_Weather_Forecast/security)
<span id="mailing-list"></span>

## 邮件列表

-   英语
    [tomoyo-users-en@lists.sourceforge.jp](http://lists.sourceforge.jp/mailman/listinfo/tomoyo-users-en)
    ([via GMANE](http://dir.gmane.org/gmane.linux.tomoyo.user.english))
-   英语
    [tomoyo-dev-en@lists.sourceforge.jp](http://lists.sourceforge.jp/mailman/listinfo/tomoyo-dev-en)
    ([via GMANE](http://dir.gmane.org/gmane.linux.tomoyo.dev.english))
-   日语
    [tomoyo-users@lists.sourceforge.jp](http://lists.sourceforge.jp/mailman/listinfo/tomoyo-users)
    ([via GMANE](http://dir.gmane.org/gmane.linux.tomoyo.user.japanese))
<span id="check-for-updates-3f"></span>

## 检查升级？

-   [freshmeat.net: TOMOYO Linux 项目详情](http://freshmeat.net/projects/tomoyo)
-   [tomoyo-announce@lists.sourceforge.net (只读)](http://lists.sourceforge.net/lists/listinfo/tomoyo-announce)
    (创建于 8 月 15 日 2008 年)
<span id="talk-annonymously-3f"></span>

## 匿名交流？

[TOMOYO: 论坛: TOMOYO :: 开放讨论 -
SourceForge.JP](http://sourceforge.jp/forum/forum.php?forum_id=11352&language_id=1)
<span id="contact"></span>

## 联系我们

项目经理: [Toshiharu Harada](http://www.linkedin.com/in/toshiharuharada) ([NTT DATA
CORPORATION](http://www.nttdata.co.jp/en/index.html))


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")

