> 原文：[eLinux.org](http://eLinux.org/Device_drivers "http://eLinux.org/Device_drivers")<br/>
> 翻译：[@EmbolismSoil](https://github.com/EmbolismSoil)


# OpenOCD



## 目录

-   [1 前言 ](#introduction)
-   [2 支持的处理器核](#supported-cores-types)
-   [3 技术支持 ](#technical-support)
-   [4 安装 OpenOCD ](#installing-openocd)
-   [5 运行 OpenOCD ](#running-openocd)
    -   [5.1 通用操作指南 ](#general-instructions)
    -   [5.2 OpenOCD 的配置文件 ](#openocd-configuration-files)
    -   [5.3 特定开发板操作指南 ](#board-specific-instructions)
-   [6 外部链接 ](#external-links)

<span id="introduction"></span>

<span id="introduction"></span>

## 前言


此页面内容来源于[OpenOCD](http://openocd.sourceforge.net/) 项目主页.

OpenOCD 是一款使用[ JTAG ](http://eLinux.org/JTAG "JTAG")硬件调试端口的开源调试器。OpenOCD支持对目标嵌入式设备进行调试和在系统编程(ISP, in-system programming)。OpenOCD 可以对目标处理器上所连接的NAND FLASH 和 NOR FLASH 储存设备进行编程。FLASH编程支持兼容CFI的外部FLASH(Intel and AMD/Spansion
command set)进行编程，也支持对数种内部FLASH进行编程(LPC2000, AT91SAM7, STR7x,
STR9x, LM3 and STM32x)。

OpenOCD最初由 Dominic Rath 在 University of
Applied Sciences Augsburg 大学开发。OpenOCD的源码现已通过GPL协议发布。

<span id="supported-cores-types"></span>

<span id="supported-cores-types"></span>

## 支持的处理器核

OpenOCD 支持下列处理器核：

<table>
<thead>
<tr class="header">
<th align="left">CORE TYPE</th>
<th align="left">EXAMPLE PROCESSORS</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">ARM7TDMI</td>
<td align="left">LPC2148, AT91SAM7</td>
</tr>
<tr class="even">
<td align="left">ARM720T</td>
<td align="left">LH79520, EP7312</td>
</tr>
<tr class="odd">
<td align="left">ARM9TDMI</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ARM920T</td>
<td align="left">S3C2410, S3C2440</td>
</tr>
<tr class="odd">
<td align="left">ARM922T</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ARM926EJS</td>
<td align="left">S3C2412, STN8811, STN8815</td>
</tr>
<tr class="odd">
<td align="left">ARM966E</td>
<td align="left">STR91XF</td>
</tr>
<tr class="even">
<td align="left">ARM11</td>
<td align="left">S3C6400, OMAP2420, MSM7200</td>
</tr>
<tr class="odd">
<td align="left">ARM1136</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ARM1156</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">ARM1176</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CORTEX-M3</td>
<td align="left">LM3S series, STM32 series</td>
</tr>
<tr class="odd">
<td align="left">CORTEX-A8</td>
<td align="left">OMAP3530 BeagleBoard</td>
</tr>
<tr class="even">
<td align="left">CORTEX-A8</td>
<td align="left">DM3730 BeagleBoard-xM</td>
</tr>
<tr class="odd">
<td align="left">CORTEX-A9</td>
<td align="left">OMAP4430 PandaBoard</td>
</tr>
<tr class="even">
<td align="left">XSCALE</td>
<td align="left">PXA255, PXA270, IXP42X</td>
</tr>
<tr class="odd">
<td align="left">MARVEL</td>
<td align="left">FEROCEON CPU CORE</td>
</tr>
<tr class="even">
<td align="left">MIPS</td>
<td align="left">M4K</td>
</tr>
</tbody>
</table>

<span id="technical-support"></span>

<span id="technical-support"></span>

## 技术支持

-   [OpenOCD 网站](http://openocd.org/)
-   [OpenOCD 用户支持邮件列表
    ](https://lists.sourceforge.net/lists/listinfo/openocd-user/)
-   [OpenOCD
     开发邮件列表](https://lists.sourceforge.net/lists/listinfo/openocd-devel)
-   [Sparkfun.com OpenOCD
    论坛](http://forum.sparkfun.com/viewforum.php?f=18)
-   [OpenOCD 用户指南](http://openocd.sourceforge.net/doc/html/index.html)
-   \#openocd channel on irc.freenode.net

<span id="installing-openocd"></span>

<span id="installing-openocd"></span>

## 安装 OpenOCD

-   [编译 OpenOCD](http://eLinux.org/Compiling_OpenOCD "Compiling OpenOCD")
-   [OpenOCD Ubuntu
    软件包](http://eLinux.org/OpenOCD_Ubuntu_Package "OpenOCD Ubuntu Package")
-   [OpenOCD 补丁](http://eLinux.org/OpenOCD_Patches "OpenOCD Patches")
-   [OpenOCD 配置文件](http://eLinux.org/OpenOCD_Config_Files "OpenOCD Config Files")
-   [libFDTI vs. libFTD2xx](http://eLinux.org/Libftdi_vs_FTD2XX "Libftdi vs FTD2XX")
    许可证和性能的比较
-   [The GNU ARM Eclipse
    OpenOCD](http://gnuarmeclipse.livius.net/blog/openocd/) - 具有更好Eclipse集成度的新 OpenOCD 发行版

<span id="running-openocd"></span>

<span id="running-openocd"></span>

## 运行 OpenOCD

<span id="general-instructions"></span>

<span id="general-instructions"></span>

#### 通用操作指南

-   [运行 OpenOCD ](http://eLinux.org/Running_OpenOCD "Running OpenOCD")
-   [在 Linux下运行 OpenOCD](http://eLinux.org/Running_OpenOCD_on_Linux "Running OpenOCD on Linux")
-   [在 Windows下运行 OpenOCD](http://eLinux.org/Running_OpenOCD_on_Windows   "Running OpenOCD on Windows")
-   [OpenOCD
    排障](http://eLinux.org/OpenOCD_Troubleshooting "OpenOCD Troubleshooting")

<span id="openocd-configuration-files"></span>

<span id="openocd-configuration-files"></span>

#### OpenOCD 配置文件

-   [OpenOCD 配置文件概述](http://eLinux.org/OpenOCD_Configuration_Files_Overview "OpenOCD Configuration Files Overview")
-   [如何编写接口配置脚本](http://eLinux.org/index.php?title=How_To_Write_an_Interface_Configuration_Script&action=edit&redlink=1 "How To Write an Interface Configuration Script (page does not exist)")
-   [如何编写开发板配置脚本](http://eLinux.org/How_To_Write_a_Board_Configuration_Script "How To Write a Board Configuration Script")
-   [如何编写目标配置脚本](http://eLinux.org/index.php?title=How_To_Write_a_Target_Configuration_Script&action=edit&redlink=1 "How To Write a Target Configuration Script (page does not exist)")

<span id="board-specific-instructions"></span>

<span id="board-specific-instructions"></span>

#### 特定开发板操作指南

-   [BeagleBoard](http://eLinux.org/Running_OpenOCD_on_Linux_with_the_Beagleboard "Running OpenOCD on Linux with the Beagleboard")
-   [Beagleboard
    xM](http://eLinux.org/Running_OpenOCD_on_Linux_with_the_Beagleboard_xM "Running OpenOCD on Linux with the Beagleboard xM")
-   [BeagleBone](http://eLinux.org/Running_OpenOCD_on_Linux_with_the_Beaglebone "Running OpenOCD on Linux with the Beaglebone")
-   [PandaBoard](http://eLinux.org/OpenOCD_PandaBoard "OpenOCD PandaBoard")
-   [Snowball](http://eLinux.org/OpenOCD_Snowball "OpenOCD Snowball")

<span id="external-links"></span>

<span id="external-links"></span>

## 外部链接

[OpenOCD](http://openocd.sourceforge.net/) 项目.

[OpenOCD
源码](http://openocd.git.sourceforge.net/git/gitweb.cgi?p=openocd/openocd;a=summary)


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")
-   [OpenOCD](http://eLinux.org/Category:OpenOCD "Category:OpenOCD")
