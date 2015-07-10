> From: [eLinux.org](http://eLinux.org/Android_Kernel_Versions "http://eLinux.org/Android_Kernel_Versions")


# Android Kernel Versions



## Contents

-   [1 Kernel versions known to run
    Android](#kernel-versions-known-to-run-android)
    -   [1.1 2.6.23](#2-6-23)
    -   [1.2 2.6.25](#2-6-25)
    -   [1.3 2.6.26](#2-6-26)
    -   [1.4 2.6.29](#2-6-29)
    -   [1.5 2.6.32](#2-6-32)
    -   [1.6 2.6.35](#2-6-35)
-   [2 Selecting a kernel tree for a new
    port](#selecting-a-kernel-tree-for-a-new-port)
-   [3 Android git kernel trees](#android-git-kernel-trees)

## Kernel versions known to run Android

### 2.6.23

The first-generation Google-TV products (released about November, 2010)
used kernel version 2.6.23. It is speculated that this is due to
existing binary driver support for the Intel chipsets used in those
products.

### 2.6.25

The original (version 1.0) of Android for the G1/ADP1 used Linux version
2.6.25

### 2.6.27

The 1.5 release of Android (cupcake) for the G1/ADP1 used Linux version
2.6.27

### 2.6.29

As of September, 2009, the kernel/common.git tree for Android has a
2.6.29 kernel. Donut uses this kernel.

### 2.6.32

As of July 2010, the kernel/common.git tree for Android has a 2.6.32
kernel. This kernel is used by Froyo.

### 2.6.35

Gingerbread used kernel version 2.6.35.

## Selecting a kernel tree for a new port

This article has good information on porting Android to a new device.
Note that it debates which kernel tree is appropriate to start with, for
porting to a new device:

-   [http://www.linuxfordevices.com/c/a/Linux-For-Devices-Articles/Porting-Android-to-a-new-device/](http://www.linuxfordevices.com/c/a/Linux-For-Devices-Articles/Porting-Android-to-a-new-device/)

## Android git kernel trees

As of July 2010, the [android repository on
kernel.org](http://android.git.kernel.org/) had the following kernel
trees:

 kernel/common.git 
This is the kernel tree that matches what is put into official Android
products by Google or its partners

 kernel/experimental.git 
some experimental stuff

 kernel/linux-2.6.git 
mirror of Linus' kernel tree. This is a reference for the kernel tree
used in Android

 kernel/lk.git 
not a kernel tree, but a bootloader

 kernel/msm.git 
kernel for MSM (Qualcomm chip used in many HTC products)

 kernel/omap.git 
mirror of kernel tree maintained by texas instruments., supporting OMAP
chips. usually based on kernel.org latest version, android products w
OMAP chip can use this kernel port.

 kernel/tegra.git 
nvidia kernel tree


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

