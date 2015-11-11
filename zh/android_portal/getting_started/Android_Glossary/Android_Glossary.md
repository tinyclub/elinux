> 原文：[eLinux.org](http://eLinux.org/Android_Glossary "http://eLinux.org/Android_Glossary") </br>
> 翻译：[@willis](htpps:/github.com/lovelers) </br>
> 校订：[@lzufalcon](https://github.com/lzufalcon) </br>


# Android 词汇表



本文讲述了一些 Android 的术语（还包括一些定义！！）

开发者相关的术语，见：
[http://developer.android.com/guide/appendix/glossary.html](http://developer.android.com/guide/appendix/glossary.html)

回到本书的 [Android Portal](http://eLinux.org/Android_Portal "Android Portal")

## 目录

-   [1 A](#a)
-   [2 B](#b)
-   [3 C](#c)
-   [4 D](#d)
-   [5 E](#e)
-   [6 F](#f)
-   [7 G](#g)
-   [8 H](#h)
-   [9 I](#i)
-   [10 J](#j)
-   [11 K](#k)
-   [12 L](#l)
-   [13 M](#m)
-   [14 N](#n)
-   [15 O](#o)
-   [16 R](#r)
-   [17 S](#s)
-   [18 T](#t)
-   [19 V](#v)
-   [20 W](#w)
-   [21 Z](#z)

## A

*[aapt](http://eLinux.org/Android_aapt "Android aapt") 
Android 资源打包工具 - 用于 Android 应用程序包的创建，查看和修改的工具。

*Activity 
是指运行的 Android 设备上的任务，用户可以进行特定的事件操作。同时也是 Android 代码框架中的一个 java 类，是 Activity 实现的父类。见：
[http://developer.android.com/reference/android/app/Activity.html](http://developer.android.com/reference/android/app/Activity.html).
"一个 Activity 呈现给用户的是一个可视化用户窗口，用户可以在这个窗口上处理特定的事件。见：
[http://developer.android.com/guide/topics/fundamentals.html](http://developer.android.com/guide/topics/fundamentals.html)

*adb 
Android 调试器 - 用于主机和目标 Android 系统进行通信的工具（包括在主机上运行的模拟器）。见：
[http://developer.android.com/guide/developing/tools/adb.html](http://developer.android.com/guide/developing/tools/adb.html)

*ADP1 
Android 第一款开发机器

*ANR 
应用程序无响应 - 这是一种 Android Bug, 系统会认为某一个进程挂掉。系统可能会杀死该进程，同时在 /data/anr 下面记录用于事后分析的信息。

*Android 
一个类似人类的机器人 - 它是 Google 开发的手机操作系统的命名。很显然，安迪·鲁宾，是一个热爱机器人的 Android 最初创始人。

*AndroidManifest.xml 
一个描述上下文，权限和其他属性的 Android 应用程序包的文件。见：
[http://developer.android.com/guide/topics/manifest/manifest-intro.html](http://developer.android.com/guide/topics/manifest/manifest-intro.html)

*Android, Inc. 
安迪·鲁宾和其他人一起创建的一个手机操作系统公司。Android 公司在 2005 年被 Google 收购。

*ASE
Android 脚本环境 - Android 脚本语言层的曾用名。见：
[Android 脚本](../../../android_portal/software_dev/Android_Scripting/Android_Scripting.md "Android Scripting")

## B

*Binder 
一种进程间通讯（IPC）机制。见：
[http://cs736-android.pbworks.com/IPC-Binder](http://cs736-android.pbworks.com/IPC-Binder)
和
[http://groups.google.com/group/android-developers/msg/dc0e0e872de9b0d2](http://groups.google.com/group/android-developers/msg/dc0e0e872de9b0d2)

*Bionic 
在 Android 设备上使用的微型 C 库

*Bootchart 
 一种创建 Linux 引导程序的可视化图表的机制，包括进程启动和执行的时序。见 [在 Android 上使用 Bootchart](http://eLinux.org/Using_Bootchart_on_Android "Using Bootchart on Android")

## C

*Cliq 
摩托罗拉 Android 手机的美国名称

*Content Provider 
存在于 Android 系统中一个软件功能模块，用于向其他应用软件提供（上下文）信息。见：
[http://developer.android.com/guide/topics/providers/content-providers.html](http://developer.android.com/guide/topics/providers/content-providers.html).
同时，它是一段充当内容提供者的父类的代码。见 [ContentProvider 类文档](http://developer.android.com/reference/android/content/ContentProvider.html)

*Cupcake 
Android 1.5 版本的代号

## D

*Dalvik 
用于 Android 应用程序运行的虚拟机。虚拟机执行 Dalvik 字节码，该字节码由 Java 编码并编译而来。值得注意的是，Dalvik 虚拟机不是 Java 虚拟机(JVM)。

每一个 Android 应用程序都运行在它自己的进程空间，并有独立的 Dalvik 虚拟机。Dalvik 被设计成一个设备可以有效的运行多个 Dalvik 虚拟机。Dalvik 虚拟机执行 Dalvik 可执行(.dex)格式的文件，经过优化，它只占用非常低的内存空间。Dalvik 是基于寄存器的虚拟机，运行的类由 Java 编译器编译，并被内置的 "dx" 工具转换为 .dex 格式。

见 [Android Dalvik 虚拟机](../../../android_portal/android_sys_info/Android_Dalvik_VM/Android_Dalvik_VM.md "Android Dalvik VM") 获取更多的信息。

*Donut 
Android 1.6 版本的代号

*Dream 
由 t-Mobile 在美国发布的硬件公开的手机代号。

*Droid 
摩托罗拉生产的，即将上市的 Android 手机的代号（我相信这是一款高端手机，所以， Cliq 应该是一款低端手机？）

## E

*Eclair 
Android 2.1 版本的代号

## F

*fastboot 
一个和开发固件通讯的程序，它能用于在调试机器上加载新软件（包括对设备进行重新分区）。见 [[Android Fastboot](http://eLinux.org/Android_Fastboot "Android Fastboot")

*FreeType 
一个开源的字体集和字体系统

 Froyo 
*冻酸奶* - Android 2.2 版本的代号

## G

*G1 
第一款基于 Android 的手机名称，出自于 t-Mobile。

*Galaxy 
第一款三星 Android 手机的名称

*Gingerbread 
Android 2.3 版本的代号

*Goldfish
一个由仿真器提供的虚拟 ARM 平台的名称。

Goldfish 执行 ARM926T 指令，并带有输入和输出 -- 比如通过在仿真器中的视频输出读取按键。"goldfish" 配置文件是由 Linux 内核编译，运行于该仿真器平台。

*Google 
一个大型网页搜索公司，并是 Android 的主要开发者

## H

*Honeycomb 
Android 3.0 版本的代号 - 主要针对平板电脑

## I

*Ice Cream Sandwhich 
Android 版本 2.4 或 3.1 - Gingerbread 和／或 Honecomb 的下一代（可能表示了一个发展分叉口）见 [http://techcrunch.com/2011/01/11/android-ice-cream-sandwich/](http://techcrunch.com/2011/01/11/android-ice-cream-sandwich/)

*init 
第一个运行于 Android 系统用户空间的程序。它不是标准 Linux 风格的 '初始化' 程序（其调度在 /etc/inittab 文件中）。并且，它处理的是一个位于文件系统的 root 目录下的脚本文件 init.rc。见 [Android
Booting\#'init'](http://eLinux.org/Android_Booting#.27init.27 "Android Booting")

*Intent 
能在不同的 Android 组件中传递消息的一个方法。通过一个 Intent 结构体表达的消息，它是一个包含了能被执行的操作描述，或者已经发生，或着正进行的事件的数据结构体。

## J

*Java 
Jave 是最初由 Sun 公司开发的一套编程语言，用于 Android 应用程序的开发。

着重说明的是，当 Java 语言用于 Android 应用程序的开发的时候，Java 字节码和 Java 虚拟机却并未被使用。想要获取更多资讯，见 Dalvik 章节。

*JDK 
Java 开发工具包

*Jellybean 
Android 版本 4.1, 4.2 和 4.3 代号

*JNI 
Java 本地接口 ([wikipedia entry](http://wikipedia.org/wiki/Java_Native_Interface)) 是允许 Java 代码调用或者被 "本地"（是指，其他的语言所编译的，例如C, C++ 或者 汇编) 代码调用的程序框架。

## K

*KitKat
Android 版本 4.4 的发布名称

## L

*Linux 
一个开源的操作系统内核，最初被 Linus Torvalds 开发，但是随着时间的推移，来自世界各地的上千开发者加入了该行列。

*Live-android 
一个创建 [Android live-CD](http://code.google.com/p/live-android/)的项目，为的是能在通用 x86 平台上运行 Android。

*logcat
查看系统 log 的命令之一。见 [Android 记录](http://eLinux.org/Android_logger "Android logger")

## M

*manifest file
见 AndroidManifest.xml

*mahimahi
用于 Nexus One 手机的开发板内核的机器名称

*MSM 
移动站调制解调器。该芯片组由高通生产。在包含骁龙芯片组的手机内可以发现（HTC Desire 手机／Nexus One 手机）。

## N

*NDK 
[原生开发套件](http://developer.android.com/sdk/ndk/index.html)。一个用于 Android 系统上编译打包文件和“说明”生成‘本地’代码（通常是库的形式）的工具集。原生库绝大多数使用在 JNI 部分（用来允许 Java 代码调用 C 代码，或者 C 代码调用 Java 代码）。

## O

*OpenGL ES 
Android 应用的 3 维图像系统和 API 接口。

## R

*repo 
Andorid 代码仓库管理器。这个是一个基于 git 工具之上的一个包装程序（Python 编写），用于管理多个 git 仓库，构成了对整个 Android 代码库的管理。见 [http://source.android.com/download/using-repo](http://source.android.com/download/using-repo)

*rild 
无线电接口守护进程。它是一个处理 Android 系统其他部分与“无线接口”（除此之外，也称为基于 Android 移动电话系统的的电话部分）通讯的一个守护进程。在仿真器中，由于手机硬件是不存在的，所以有一个运行模拟无线接口的程序。

## S

*Saphire

*SL4A 
Android 脚本层 - 一个让用户使用脚本语言的运行环境（比如 Python 或者 Ruby），而不是用 Java 来写 Android 程序。见 [Android 脚本](../../../android_portal/software_dev/Android_Scripting/Android_Scripting.md "Android Scripting")

*SGL 
Android 应用的 2 维图层

*SQLite 
一个功能强大，轻量级的关系型数据库引擎，用于 Android 系统的各个组件中，并且能被所有的 Android 应用程序使用。

## T

*TARGET\_PRODUCT 
一个用于编译系统的环境变量，用来表示应该编译什么样的软件版本。这个变量以及其他的 TARGET\_\*　变量是在 build/envsetup.sh 文件中用 choosecombo() 函数来设置。如果没设置，当你在 shell 环境进行下 source-ing build/envsetup.sh　文件后，执行 'm' 的别名，TARGET\_\* 变量会使用默认值。反之，用 choosecombo() 函数设置它们。

例如: \$ cd mydroid ; source build/envsetup.sh ; choosecombo

TARGET\_PRODUCT 的选项取决于 AndroidProducts.mk 的项。AndroidProducts.mk 位于你的代码仓库的 build/target/products 和 vendor/\*/\*/AndroidProducts.mk 里面。

*toolbox 
一个 Android 系统中的多功能程序的名称。这个程序包含的单一程序代码表现的像多个不同的程序和工具。'toolbox' 通常存储在 /system/bin 下面，同时被链接到其他的名字。它利用 argv[0] 参数决定了运行的时候像哪个程序工作。它非常像 'busybox' 工具，'busybox'　是另一个在许多其他嵌入式 Linux 系统中使用的多功能程序。

*Trout 
是宏达 Dream 硬件的 ARM linux 内核的机器 ID (用于 t-Mobile G1 和 APD1 手机）

见 [http://www.arm.linux.org.uk/developer/machines/list.php?id=1440](http://www.arm.linux.org.uk/developer/machines/list.php?id=1440)

## V

*vold 
存储守护进程 - 一个在 Android 系统上负责管理加载或卸载文件系统的进程（volumes)

## W

*wakelocks 
一个 Android 电源管理的内核机制。当一个线程获取了一个 wakelock, 内核将会避免进入低功耗状态。

回到 [Android Portal](http://eLinux.org/Android_Portal "Android Portal")

## Z

*zygote 
第一个 Dalvik 虚拟机的实例。所有系统中启动的其他 Java 应用程序都是被 zygote 孵化。


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

