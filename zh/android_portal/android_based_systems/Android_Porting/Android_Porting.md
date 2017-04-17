> From: [eLinux.org](http://eLinux.org/Android_Porting "http://eLinux.org/Android_Porting")


# Android 移植



本页面讲述移植 Android 到新的开发板和新处理器上。



## 目录

-   [1 移植概述](#porting-overview)
-   [2 移植教程](#porting-tutorials)
-   [3 移植问题](#porting-issues)
    -   [3.1 Android 硬件抽象层](#android-hardware-abstraction-layer)
-   [4 移植到新处理器](#porting-to-new-processors)
-   [5 虚拟化环境](#virtualization-environments)

## 移植概述

移植步骤的概述可以在 android-porting 列表中看到：
 详看
[http://www.mail-archive.com/android-porting@googlegroups.com/msg06721.html](http://www.mail-archive.com/android-porting@googlegroups.com/msg06721.html)

下面这段注释涵盖了新开发板上要做的所有内核工作以及 android 内核补丁，也有一些关于存储分区和文件系统生成过程的很好讨论。

    如果 Linux 内核启动并且所有的驱动都已运行（特别是触摸屏和显示驱动），那么情况就不会糟到哪里去。

    以我愚见，运行起来最简单的方式就是把通过 Android 编译编译进内核的初始的 ramfs、Android 根文件系统和用户数据部分（以 /data 分区加载）聚合成一个根文件系统。

    可以把这个根文件系统看做一个 tarball。

    修改内核的 NAND分区来为 Android 根文件系统留出空间，然后重新编译内核（确保内核支持 yaffs）。此时也不需要 ramfs，只是内核向 mtd2 分区找根文件系统，就是jffs2。

    创建自己的 busybox 根文件系统。编译进 jffs2 镜像中。

    现在分区看起来和下面的很相似（分区大小由你决定）：
    mtd0: bootloader
    mtd1: kernel
    mtd2: rootfs (jffs2)
    mtd3: Android rootfs.

    擦除 NAND 存储上的任何东西。
    把 Chumby bootloader 烧到 mtd0 分区上。
    把新内核烧到 mtd1 分区上。
    把 jffs2 根文件系统镜像烧到 mtd2 分区上。

    启动设备。希望这时能得到提示。

    一旦得到以 yaffs2 分区形式加载 mtd3 到 /mnt/android 的提示。
    解压 Android 根文件系统到 /mnt/android。
    通过 chown 和 chgrp 命令更改 /mnt/android 下的权限为 "root"。
    通过 chroot 命令更改加载点 "chroot /mnt/android /init"。

    此时就可以看到 Android 正在尝试运行。


    我知道可能会对这些工作有点不齿，但其实要做的还远远不够。当然，这是假设在你能够擦除掉整个 NAND 并在此之上将镜像成功烧入的前提下，这会让你更清楚 Android 在设备上运行的需求。

    关于 bootloader 问题，只提这一点。只能在和恢复系统相兼容的情况下去修改。当然这完全又是另一个不同的讨论问题。

## 移植教程

-   [移植 Android 到新设备](http://www.linuxfordevices.com/c/a/Linux-For-Devices-Articles/Porting-Android-to-a-new-device/)
    - 完美且深入的论文，描述了将 Android 移植到 Nokia N810。
    -   有详细的内核改动列表和 diffs 的注解。
-   [http://wiki.kldp.org/wiki.php/AndroidPortingOnRealTarget](http://wiki.kldp.org/wiki.php/AndroidPortingOnRealTarget)
-   [基于 OMAP 平台的 Android](http://eLinux.org/Android_on_OMAP "Android on OMAP") - 一份极好的教程，覆盖了在移植 Android 到基于 TI OMAP (ARM) 处理器平台遇到的很多不同问题
-   移植到 PXA 板上的一些粗略注释：
    [http://letsgoustc.spaces.live.com/blog/cns!89AD27DFB5E249BA!320.entry](http://letsgoustc.spaces.live.com/blog/cns!89AD27DFB5E249BA!320.entry)
-   增加新设备或改变已有设备的配置 [Android 设备](http://eLinux.org/Android_Device "Android Device")

## 移植问题

-   Matt Porter (明导国际)在 [ELC Europe
    2009](http://www.embeddedlinuxconference.com/elc_europe09/index.html) 上的演讲稿，展示了他们在移植 Android
到 MIPS 和 PPC 处理器时遇到的困难。他的演讲叫做《Mythbusters: Android》，有很多值得一看的东西。
    -   详看
        [Mythbusters\_Android.pdf](http://eLinux.org/images/2/2d/Mythbusters_Android.pdf "Mythbusters Android.pdf")

-   [Dalvik 移植指南](http://android.git.kernel.org/?p=platform/dalvik.git;a=blob_plain;f=docs/porting-guide.html;hb=HEAD)

-   Matthias Brugger 在 ELC Europe 2012 上的演讲，讲述了他在移植 Android 上的那些事。他在 slideshare 上的
    [幻灯片](http://www.slideshare.net/MatthiasBrugger/porting-android-40toacustomboard)。

### Android 硬件抽象层

Android 通过硬件抽象层与标准设备会话，硬件抽象层覆盖了与设备间的内核接口（例如设备节点、Linux系统调用等等）。要实现支持新硬件，特别是支持 Android
新类型的硬件，需要理解硬件抽象层。

Karim Yaghmour 的博客很条理的描述了 Android 硬件抽象层：
[http://www.opersys.com/blog/extending-android-hal](http://www.opersys.com/blog/extending-android-hal)

## 移植到新处理器

-   明导国际已经将 Android 移植到 MIPS 和 PPC
-   Power.Org 负责将 Android 移植到 PPC
    -   Nina Wilner 在 ELC
        Europe 2009 上谈起过这项工作，并给出一个演示
    -   详看
        [Android\_On\_Power.pdf](http://eLinux.org/images/0/07/Android_On_Power.pdf "Android On Power.pdf")

## 虚拟化环境

其它一些可用的虚拟化环境，允许 Android 应用或系统在其它基于 Linux 的系统上运行，例如 MeeGo 和 Ubuntu。

下面是一些已知的不同系统的一些信息：

-   OpenMobile ACL (应用兼容层)
    -   LinuxDevices 文章：
        [http://www.linuxfordevices.com/c/a/News/OpenMobile-ACL-for-MeeGo/?kc=LNXDEVNL092811](http://www.linuxfordevices.com/c/a/News/OpenMobile-ACL-for-MeeGo/?kc=LNXDEVNL092811)
    -   OpenMobile 产品页：[http://openmobile.co/products.php](http://openmobile.co/products.php)
-   Myriad Alien Dalvik
    -   LinuxDevices 文章：
        [http://www.linuxfordevices.com/c/a/News/Myriad-Group-Myriad-Alien-Dalvik/](http://www.linuxfordevices.com/c/a/News/Myriad-Group-Myriad-Alien-Dalvik/)
    -   Myried Group 页面：
        [http://www.myriadgroup.com/Device-Manufacturers/Android-solutions/\~/media/D42B513FB5114FF2B4CA13A2D8CE313E.ashx](http://www.myriadgroup.com/Device-Manufacturers/Android-solutions/~/media/D42B513FB5114FF2B4CA13A2D8CE313E.ashx)
-   [待完善 - 在这应该添加 tetsuyuki 关于在 Ubuntu 上运行 Android 的演讲]


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

