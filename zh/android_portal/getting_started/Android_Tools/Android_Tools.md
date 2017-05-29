> 原文：[eLinux.org](http://eLinux.org/Android_Tools "http://eLinux.org/Android_Tools") </br>
> 翻译：[@willis](https://github.com/lovelers) </br>
> 校订：[@lzufalcon](https://github.com/lzufalcon) </br>

# Android 工具集



本文介绍了一些在 Android 上使用的实用开发工具

## 目录

-   [1 Android SDK](#android-sdk)
    -   [1.1 host-side tools](#host-side-tools)
        -   [1.1.1 adb](#adb)
            -   [1.1.1.1 Running adbd on non-Android
                systems](#running-adbd-on-non-android-systems)
        -   [1.1.2 aapt](#aapt)
        -   [1.1.3 ddms](#ddms)
        -   [1.1.4 Fastboot](#fastboot)
        -   [1.1.5 Toolchains](#toolchains)
        -   [1.1.6 Emulator](#emulator)
        -   [1.1.7 traceview](#traceview)
    -   [1.2 target-side tools](#target-side-tools)
        -   [1.2.1 am](#am)
        -   [1.2.2 dumpstate](#dumpstate)
        -   [1.2.3 logcat](#logcat)
        -   [1.2.4 monkey](#monkey)
        -   [1.2.5 procrank](#procrank)
        -   [1.2.6 service](#service)
        -   [1.2.7 sqlite3](#sqlite3)
        -   [1.2.8 toolbox](#toolbox)
-   [2 other tools](#other-tools)
    -   [2.1 agcc](#agcc)
    -   [2.2 bootchart](#bootchart)
    -   [2.3 busybox](#busybox)
    -   [2.4 smem](#smem)
    -   [2.5 strace](#strace)
-   [3 Eclipse](#eclipse)
-   [4 Hardware](#hardware)
    -   [4.1 Serial Cable for G1](#serial-cable-for-g1)

## Android SDK

### host-side tools

#### adb

adb 是 Android 调试器 - 同时也可以用于双向文件传输。
它的组成部分包含了目标调试机 `/sbin`目录下的`adbd`。
在主机上有两个程序运行：adb 应用程序（在 SDK 的 `tools` 目录下) 和 adb 服务器，adb 服务器由 adb 应用程序启动。

相对模拟器而言，adb 通常会自动运行。

在实体开发板上 - 通过 USB 调试，你可能要处理如下的事情，见：
[http://developer.android.com/guide/developing/device.html\#setting-up](http://developer.android.com/guide/developing/device.html#setting-up)。

在实体开发板上没有 USB 连接器但是有网卡的话，你需要注意一些小技巧。

-   确保开发板的 adbd 工作正常。如果它没有工作，你可能需要检查 `init.rc` 文件。
-   确保主机与开发板的网络连接正常工作 - 双向测试 ping 连接。
-   在主机上，输入如下的指令(你需要在主机上指定开发板的 IP 地址)

<!-- -->

      ADBHOST=<target-ip> tools/adb kill-server
      ADBHOST=<target-ip> tools/adb shell

-   现在你应该会在开发板上得到一个提示框，如有需要，你可以退出提示。
-   `tools/adb devices` 应该就显示了该设备。

##### 在非 Android 系统上运行 adbd

有时候，在非 Android 嵌入式 Linux 系统中使用 adb 是很有用的。有一个用于 adb(源于2104-04-05)　的 patch 补丁来规避 "Android-isms"。说明文档在 README.NONANDROID.TXT 文件中。

[File:0001-Add-support-for-non-Android-use-of-adbd.patch](http://eLinux.org/File:0001-Add-support-for-non-Android-use-of-adbd.patch "File:0001-Add-support-for-non-Android-use-of-adbd.patch")

'cd' 命令进入 /system/core/adb 目录，打补丁到你的 adb 目录下:

    $ git am 0001-Add-support-for-non-Android-use-of-adbd.patch

#### aapt

一个 Android 资源打包工具，用于创建，检查和管理 Android 资源包。

你可以使用这个工具查看资源包的细节，它的资源，xml 文件信息。

[Android 开发网站的aapt] (http://developer.android.com/guide/developing/tools/aapt.html)　信息不够充分 

查阅 [Android aapt](http://eLinux.org/Android_aapt "Android aapt") 可以获取更多实质性的信息。

#### ddms

Dalvik 调试监控服务是一个基于主机运行的工具，用于和 Android 目标系统进行交互，并可以显示大量的信息，包括 log, cpu 和内存占用，以及许多独立进程的信息。

见[DDMS 开发者指南](http://developer.android.com/guide/developing/tools/ddms.html)



#### Fastboot

[Android Fastboot](http://eLinux.org/Android_Fastboot "Android Fastboot") 是一个用于 Android 工程机引导和修改分区的工具。

#### Toolchains

Android 提供了预先构建的工具链（C/C++ 编译器和连接器），但是要求安装外部源的一个 java 编译器（JDK）。

从 NDK r5 版本起（2010 年 12 月)，toolchains 可以用于独立交叉编译模式。见 NDK 里面 dos/STANDALONE-TOOLCHAIN.html 了解详情。之前，toolchains 可以用于系统编译，但是它比较麻烦，并且在编译 Android 系统之外的本地层程序时容易出错。

#### Emulator

-   Emulator - 见 
    [http://developer.android.com/guide/developing/tools/emulator.html](http://developer.android.com/guide/developing/tools/emulator.html)

emulator 是 QEMU 的版本之一，模仿手机上能够找到的 ARM 处理器的指令集和硬件。emulator 运行在 x86 系统上，但是运行的是 ARM Linux 内核和程序。控制流程如下：

-       应用程序 -\>
    -   dalvik 虚拟机 -\>
    -   C/C++ 库 -\>
    -   ARM linux 内核 -\>
    -   仿真指令集和硬件 (QEMU)-\>
    -   C 库-\>
    -   x86 内核 -\>
    -   真正硬件

#### traceview

-   Google 主页如下描述 traceview:
    [http://developer.android.com/guide/developing/tools/traceview.html](http://developer.android.com/guide/developing/tools/traceview.html)
-   [http://www.bottomlesspit.org/file\_download/2/Android\_SDK\_Traceview\_tool.pdf](http://www.bottomlesspit.org/file_download/2/Android_SDK_Traceview_tool.pdf)
    - Olivier Bilodeau 提供了很好的概要介绍
    -   发言者摘要报告：
        [http://www.bottomlesspit.org/file\_download/3/Android\_SDK\_Traceview\_tool\_w\_speakernotes.pdf](http://www.bottomlesspit.org/file_download/3/Android_SDK_Traceview_tool_w_speakernotes.pdf)
-   [Android 应用的性能调试](http://newfoo.net/2009/04/18/performance-tuning-android-applications.html)
    - 该文章直截了当的讨论了如何利用 traceview 工具找到应用程序瓶颈。发表于 2009 年 4 月。

### target-side tools

#### am

Activity 管理器 - 可以用于通过命令行启动应用程序，或者发送 intends 来运行应用程序。

#### dumpstate

打印出系统状态信息。扫描 /proc 文件系统，收集各种系统属性，存放到单一报告中，并能容易的发送该报告给需要的人或者开发帮助。

#### logcat

一个用于访问 Android 系统 log 的用户工具。它的实现基于 adb 内部的一个特殊的选项（我不太确定 "adb logcat" 和 "adb shell logcat" 之间的区别）。

你可以找到更多有关 logcat 的信息, 在 [Android logger](http://eLinux.org/Android_logger "Android logger") 和 [http://developer.android.com/guide/developing/tools/adb.html\#logcat](http://developer.android.com/guide/developing/tools/adb.html#logcat)

#### monkey

#### procrank

procrank 显示系统上的进程列表，并通过内存利用率的其中某一个选项进行排序(如： -v 通过VSS排序）。见 [Android Memory Usage\#procrank](http://eLinux.org/Android_Memory_Usage#procrank "Android Memory Usage")

#### service

可以用来发送私有服务信息。

    用法： service [-h|-?]
           service list
           service check SERVICE
           service call SERVICE CODE [i32 INT | s16 STR] ...
    参数:
       i32: 发送包里面写一个整数 INT。
       s16: 发送包里面写一个 UTF-16 的字符串 STR


在某个论坛里，我发现可以切换 portrait 和 landscape 模式：

    $ service call window 18 i32 1 # 模拟器上设置 landscape
    $ service call window 18 i32 0 # 模拟器上设置 portait

"service list"　将展示各种可以通讯的service 列表。

#### sqlite3

sqlite3 是一个命令行数据库的客户端程序，用于管理 sqlite 数据库。

见 [http://www.higherpass.com/Android/Tutorials/Accessing-Data-With-Android-Cursors/](http://www.higherpass.com/Android/Tutorials/Accessing-Data-With-Android-Cursors/)，获取教程和一些使用sqlite 的例子。

#### toolbox

在 Android 系统上，toolbox 是一个类似与 busybox 的工具。它是一个多功能的程序，单一的二进制文件中提供了许多不同的命令。包括了：ps， ls，top，stop，start（在 Android 系统上停止和启动服务）

见 [Android toolbox](http://eLinux.org/Android_toolbox "Android toolbox"), 了解各个命令的细节。

## other tools

### agcc

-   [agcc](http://plausible.org/andy/agcc) - 一个用户编译本地层 Android 应用的打包工具（直接链接到 bionic）
    -   见 http://android-tricks.blogspot.com/2009/02/hello-world-c-program-on-using-android.html](http://android-tricks.blogspot.com/2009/02/hello-world-c-program-on-using-android.html)

### bootchart

-   见 [Using Bootchart on Android](http://eLinux.org/Using_Bootchart_on_Android "Using Bootchart on Android")

### busybox

Android 集成了一个程序套件 （叫做 'toolbox')，但不是 busybox。

你可以获取一个二进制的 Android busybox [这里](http://benno.id.au/blog/2007/11/14/android-busybox) 包括了如何在你的设备上快速安装的说明文档。

如果你有兴趣集成 busybox 工具到平台编译环境：

-   编译的二进制文件[点击这里](https://github.com/Gnurou/busybox-android)
-   [视频资料](https://video.linux.com/videos/busybox-integration-on-android) 展示了如何编译和集成 busybox 到平台编译环境（幻灯片介绍[点击这里](https://events.linuxfoundation.org/images/stories/pdf/lf_abs12_sun.pdf)).

### smem

-   seme - seme 是一个分析系统内存使用的工具
    -   见 [在 Android 上使用 seme](http://eLinux.org/Using_smem_on_Android "Using smem on Android") 获取更多信息。

### strace

-   strace
    -   静态链接的二进制文件：[http://benno.id.au/blog/2007/11/18/android-runtime-strace](http://benno.id.au/blog/2007/11/18/android-runtime-strace)
    -   编译 Android strace 的说明 - [http://discuz-android.blogspot.com/2008/01/create-google-android-strace-tool.html](http://discuz-android.blogspot.com/2008/01/create-google-android-strace-tool.html)

## Eclipse

[Eclipse](http://www.eclipse.org/) (当前版本 3.4 或者 3.5) 是官方支持的集成化开发环境(IDE)，使用了 Android 开发者工具(ADT)插件，通过它，开发人员可以使用任意的文本编辑器编写 Java 和 XML 文件，然后使用命令行工具（要求有 JDK 和 Apache Ant）来创建，编译和调试 Android 应用程序，同时控制连接的 Android 设备（比如，远程触发重启，安装软件包等）。

## Hardware

### Serial Cable for G1

你可以在 G1 上用串口线串接，通过串口终端进行有效分析内核启动信息。

见 [http://www.instructables.com/id/Android\_G1\_Serial\_Cable](http://www.instructables.com/id/Android_G1_Serial_Cable)

回到 [Android Portal](http://eLinux.org/Android_Portal "Android Portal")


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

