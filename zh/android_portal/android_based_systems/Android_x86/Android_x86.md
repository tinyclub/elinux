> From: [eLinux.org](http://eLinux.org/Android_x86 "http://eLinux.org/Android_x86")


# Android x86



Android x86 是标准 **pc** 的一种软件接口。 [Android x86
主页](http://www.android-x86.org/)

目前的稳定版本是
[http://www.android-x86.org/releases/releasenote-3-2-rc2](http://www.android-x86.org/releases/releasenote-3-2-rc2)
Android-x86 3.2-r2], 基于 Honeycomb。



## 目录

-   [1 ICS 4.0.3](#ics-4-0-3)
    -   [1.1 在 ubuntu 11.10 上编译](#build-on-ubuntu-11-10)
    -   [1.2 硬件](#hardware)
-   [2 DONUT 1.6 r2](#donut-1-6-r2)
-   [3 获得运行系统的简明步骤](#short-steps-to-get-a-running-system)
    -   [3.1 从 CD 或 U 盘中运行系统](#running-the-system-from-boot-medium-cd-or-usb-stick)
    -   [3.2 从硬盘中运行系统](#run-the-system-from-harddisk)
-   [4 运行系统的详细说明](#details-for-a-running-system)
    -   [4.1 SD 卡](#sd-card)
    -   [4.2 导航](#navigation)
    -   [4.3 声音](#sound)
    -   [4.4 视频](#video)
    -   [4.5 应用错误](#application-errors)
-   [5 开发](#development)
    -   [5.1 改善/需求](#improvements-request-for-changes)
    -   [5.2 错误](#errors)
    -   [5.3 命令行](#shell)
    -   [5.4 导航/键盘](#navigation-keyboard)
    -   [5.5 文件信息](#file-infos)
    -   [5.6 手工制作一个 Android 1.6 r2 镜像的 U 盘](#hand-made-changes-on-an-usb-stick-android-1-6-r2)
    -   [5.7 声音](#sound-2)
    -   [5.8 yaffs2 文件系统](#yaffs2-filesystem)
    -   [5.9 链接](#links)

## ICS 4.0.3

### 在 ubuntu 11.10 上编译

详看 [在 Ubuntu
11.10 上编译Android 4.0](http://www.android-dev.ro/2011/12/13/building-android-4-0-on-ubuntu-11-10/)

安装4.4老版本 gcc 的命令 : sudo apt-get install gcc-4.4
g++-4.4 g++-4.4-multilib gcc-4.4-multilib

运行编译命令 : make CC=gcc-4.4 CXX=g++-4.4 -j4 iso\_img
TARGET\_PRODUCT=generic\_x86



### 硬件

Fritz!Wlan

AVM GmbH AVM Fritz!WLAN N [Atheros AR9001U]



## DONUT 1.6 r2

## 获得运行系统的简明步骤

### 从 CD 或 U 盘中运行系统

-   下载 CD 镜像
    [android-x86-1.6-r2.iso](http://www.android-x86.org/download) 或
    USB 镜像
    [android-x86-1.6-r2\_usb.img.gz](http://www.android-x86.org/download)
-   用下面的 linux "gunzip
    [http://www.android-x86.org/download](http://www.android-x86.org/download)" 命令烧录 cd 镜像或 U 盘镜像
    然后执行"dd if=android-x86-1.6-r2\_usb.img of=/dev/sda" (of=/dev/sda 取决于linux 加载 U 盘的位置)
-   从存储媒体中启动，选择第一个菜单项“正使用的 USB - 运行未安装的Android-x86”
-   进入 android 更改 设置/声音和显示/屏幕超时 为“永不”

### 从硬盘中运行系统

s. 也可看 [
android-x86.org 上的安装部分](http://www.android-x86.org/)

-   从 CD 或 U 盘中启动 android x86，启动菜单选择第四项“安装 - 安装 Android-x86 1.6-r2 到硬盘”
-   选择 “创建/修改分区” 并用 cfdisk 创建启动分区
-   选择创建分，例如 sda1，然后格式化，例如 ext3。
-   选择“是”安装 GRUB
-   重启系统，从硬盘启动，选择默认菜单项“Android-x86 1.6-r2”
-   进入 android 更改 设置/声音和显示/屏幕超时 为“永不”



## 运行系统的详细说明

### SD 卡

加载 sd 卡请看
[[1]](http://www.android-x86.org/documents/sdcardhowto)

### 导航

-   HOME \<- 保留的 windows 键
-   BACK \<- 退出键
-   MENU \<- 菜单键

触摸屏或鼠标

触摸状态栏的右端来激活或取消激活下面的功能

-   HOME \<- 触摸状态栏
-   MENU \<- 从左到右触摸状态栏
-   BACK \<- 从右到左触摸状态栏



### 声音

**ASUS EeePC 上的按键**

    Fn-F7, F8, F9,
    一些模型则是
    Fn-F10, F11, F12

**笔记本电脑**

    一些笔记本电脑也有声音调节热键。

**在命令行中提高声音**

    * 切换到控制台 1, 按 Alt+F1
    * 键入
      "alsa_amixer cset numid=1 31" 调节 'Front Playback Volume' 或键入
      "alsa_amixer cset numid=20 31" 调节 'Master Playback Volume'  或键入
      "alsa_amixer cset numid=3 31" 调节 'Speaker Playback Volume'
    * 返回图形屏幕界面，按 Alt+F7

**标准键盘的 x86 个人电脑**

rear panel audio jack 和 front panel audio jack 取决于 alsa\_amixer 声音设置的 'Front Playback Volume' 设置。

### 视频

### 应用错误

-   进入菜单 /设置/关于手机/系统教程 -\> 对不起！设置（ com.android.settings 进程）应用意外停止。 请重新尝试。

## 开发

### 改善/需求

-   在 x86 系统中设置“设置/声音和显示/屏幕超时”为“永不”，没必要设置超时，超时后新用户可能不知道是怎么回事。

### 错误

### 命令行

### 导航/键盘

键盘布局见 /system/usr/keylayout/

获得键盘事件的命令：getevent

[按键映射和键盘输入的详细描述](http://www.kandroid.org/android_pdk/keymaps_keyboard_input.html)

### 文件信息

1.  system.sfs - squash 文件系统（只读的压缩文件系统）
2.  system.img - ext2 文件镜像
3.  ramdisk.img - gzip cpio 文件 - 用命令 "gzip
    -d \< ramdisk.img |cpio -id" 解压到一个空文件夹
4.  initrd.img - gzip cpio 文件 - 用命令"gzip
    -d \< initrd.img |cpio -id"解压到一个空文件夹

### 手工制作一个 Android 1.6 r2 镜像的 U 盘

**U 盘中的文件目录**

    ├── android-system
    │   ├── initrd.img
    │   ├── install.img
    │   ├── kernel
    │   ├── ramdisk.img
    │   └── system.sfs
    ├── android-x86.xpm.gz
    ├── cmdline
    ├── grub4dos
    ├── kernel -> grub4dos
    ├── lost+found
    ├── menu.lst
    └── ramdisk
    .
    2 个目录, 11 个文件

修改 system.sfs (system.img) 中文件的步骤

    * Ubuntu 10.4 box
    * 切换到命令行, 按 strg+alt+F1
    * sudo -i
    * aptitude 和 install squashfs-tools
    * modprobe squashfs
    * cd /home/administrator
    * 把 system.sfs (squash 文件系统) 复制到硬盘的 /home/administrator 目录
    * mkdir systemsfs
    * mount ./system.sfs ./systemsfs -t squashfs -o loop
    * copy ./systemsfs/system.img /home/administrator/
    * mkdir systemimg
    * mount ./system.img ./systemimg -t ext2 -o loop

cd 命令切换到 systemimg 目录然后操作

例如改变 \*.kl 文件，更改声音键F7(scanncode=65) 为震动; 更改F8
(scanncode=66)为音量下键; 更改F9 (scanncode=67)为音量上键

    * cd usr/keylayout
    * vi *.kl
    * 修改的行
      key 113   VOLUME_MUTE
      key 114   VOLUME_DOWN
      key 115   VOLUME_UP

      key 65   VOLUME_MUTE
      key 66   VOLUME_DOWN
      key 67   VOLUME_UP

### 声音

s.

1.  [http://wiki.archlinux.org/index.php/Advanced\_Linux\_Sound\_Architecture](http://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture)
2.  [http://www.alsa-project.org/main/index.php/Main\_Page](http://www.alsa-project.org/main/index.php/Main_Page)

### yaffs2 文件系统

    * 下载 unyaffs2 http://code.google.com/p/yaffs2utils/downloads/list s. description http://code.google.com/p/yaffs2utils/ ; extract to yaffs2util
    * 从 http://yaffs.net/node/346 下载快照, 解压源文件到 yaffs2 目录
    * 用 vi 修改 ~/yaffs2util/Makefile 文件，然后设置 "KERNELDIR   = /usr/src/linux-headers-2.6.32-21" ; 基于头文件的位置
    * 执行 make 命令
    * 进入子文件夹 ~/yaffs2util/src ，然后复制 mkyaffs2 和 unyaffs2 到 /home/administrator/bin 目录
    * 执行： PATH=$PATH:/home/administrator/bin
    *

### 链接

[http://androidoniphone.blogspot.com/2010/04/install-android-on-iphone-guide.html](http://androidoniphone.blogspot.com/2010/04/install-android-on-iphone-guide.html)
[http://android-dls.com/wiki/index.php?title=Main\_Page](http://android-dls.com/wiki/index.php?title=Main_Page)


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

