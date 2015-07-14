> From: [eLinux.org](http://eLinux.org/Devkit8000_Android "http://eLinux.org/Devkit8000_Android")


# Devkit8000 Android



This page offers some guide and suggestions on Android Development on
[Embest](http://www.armkits.com)
[Devkit8000](http://www.armkits.com/Product/devkit8000.asp) board.

## Contents

-   [1 Development environment](#development-environment)
-   [2 Android Display](#android-display)
-   [3 Android Demonstration](#android-demonstration)
    -   [3.1 SD card format](#sd-card-format)
    -   [3.2 Preparations](#preparations)
-   [4 Android Development](#android-development)

# Development environment

-   Hardware: [Embest](http://www.armkits.com)
    [Devkit8000](http://www.armkits.com/Product/devkit8000.asp) based on
    TI
    [OMAP3530](http://focus.ti.com/docs/prod/folders/print/omap3530.html)
    ARM Cortex-A8 processor
-   Software: [Android](http://eLinux.org/Android "Android") based on Linux2.6.27
    kernel

# Android Display

Below pictures shows some current Android porting solution on
[Devkit8000](http://www.armkits.com/Product/devkit8000.asp):

<table>
<tbody>
<tr class="odd">
<td align="left"><a href="http://elinux.org/File:Devkit8000_android.jpg"><img src="http://elinux.org/images/b/b8/Devkit8000_android.jpg" alt="Devkit8000 android.jpg" /></a></td>
<td align="left"><a href="http://elinux.org/File:Devkit8000.jpg"><img src="http://elinux.org/images/5/57/Devkit8000.jpg" alt="Devkit8000.jpg" /></a></td>
</tr>
</tbody>
</table>

Captured Android image from Frambuffer:

<table>
<tbody>
<tr class="odd">
<td align="left">System desktop</td>
<td align="left"><a href="http://elinux.org/File:Devkit8000_a3.jpg"><img src="http://elinux.org/images/7/7d/Devkit8000_a3.jpg" alt="Devkit8000 a3.jpg" /></a></td>
</tr>
<tr class="even">
<td align="left">Clock</td>
<td align="left"><a href="http://elinux.org/File:Devkit8000_a4.jpg"><img src="http://elinux.org/images/6/69/Devkit8000_a4.jpg" alt="Devkit8000 a4.jpg" /></a></td>
</tr>
<tr class="odd">
<td align="left">Boot</td>
<td align="left"><a href="http://elinux.org/File:Devkit8000_a5.jpg"><img src="http://elinux.org/images/c/c8/Devkit8000_a5.jpg" alt="Devkit8000 a5.jpg" /></a></td>
</tr>
<tr class="even">
<td align="left">GOOGLE search</td>
<td align="left"><a href="http://elinux.org/File:Devkit8000_a7.jpg"><img src="http://elinux.org/images/7/76/Devkit8000_a7.jpg" alt="Devkit8000 a7.jpg" /></a></td>
</tr>
</tbody>
</table>

# Android Demonstration

## SD card format

Please refer to

[LinuxBootDiskFormat](http://code.google.com/p/beagleboard/wiki/LinuxBootDiskFormat)

## Preparations

After you have mounted SD card successfully, please do following
operations (note: LABEL1 and LABEL2 are two partitions of SD card)
 cp /media/cdrom/linux/demo/android/MLO /media/LABEL1
 cp /media/cdrom/linux/demo/android/u-boot.bin /media/LABEL1
 cp /media/cdrom/linux/demo/android/uImage /media/LABEL1
 rm –rf /media/LABEL2/\*
 sudo tar jxvf linux/demo/ android/RFS.tar.bz2 –C /media/LABEL2
 sync
 umount /media/LABEL1
 umount /media/LABEL2

# Android Development

beagleboard has made a very good porting solution, you can also refer to
it for Devkit8000:

[http://labs.embinux.org/index.php/Android\_Porting\_Guide\_to\_Beagle\_Board](http://labs.embinux.org/index.php/Android_Porting_Guide_to_Beagle_Board)


Support on Oxdroid
 [http://code.google.com/p/0xdroid/](http://code.google.com/p/0xdroid/)

 [http://gitorious.org/0xlab-kernel](http://gitorious.org/0xlab-kernel)



[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")
-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [Devkit8000](http://eLinux.org/Category:Devkit8000 "Category:Devkit8000")

