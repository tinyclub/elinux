> 原文：[eLinux.org](http://eLinux.org/Bootloader "http://eLinux.org/Bootloader")<br/>
> 翻译：[@lzufalcon](https://github.com/lzufalcon)


# 引导程序

简单讲，引导程序是计算机开机后运行的第一个软件程序。它负责装载并移交控制权给操作系统内核（例如 Hurd 或者 Linux）。而内核转而初始化接下来的操作系统部分（例如 GNU）。

## 引导程序清单

<table class="wikitable" border="1" cellspacing="0" cellpadding="4">
<caption align="bottom"> 图例: <b>?</b>: 未知 <b>-</b>: 不支持
</caption>
<tr>
<th> 引导程序  </th>
<th> ARM </th>
<th> BFIN </th>
<th> MIPS </th>
<th> PPC </th>
<th> SH </th>
<th> x86 </th>
<th> 备注
</th></tr>
<tr>
<td> <a href="http://elinux.org/APEX" title="APEX" class="mw-redirect">APEX</a>
</td>
<td>                 y  </td>
<td>   -  </td>
<td> &#160;?   </td>
<td> &#160;?  </td>
<td> &#160;?  </td>
<td> &#160;?  </td>
<td>
</td></tr>
<tr>
<td> <a href="http://elinux.org/Barebox" title="Barebox">Barebox (U-Boot-v2)</a>
</td>
<td>                 y  </td>
<td>   y  </td>
<td>   y  </td>
<td>  y  </td>
<td>  (进行中) </td>
<td>  y  </td>
<td> 支持网络安装（系统），集成编辑器和脚本环境
</td></tr>
<tr>
<td> <a href="http://elinux.org/Blob" title="Blob">Blob</a>
</td>
<td>                 y  </td>
<td>  -  </td>
<td>  -   </td>
<td>  -  </td>
<td>  -  </td>
<td>  -  </td>
<td>
</td></tr>
<tr>
<td> <a rel="nofollow" class="external text" href="http://www.linux-mips.org/wiki/Common_Firmware_Environment">CFE</a>
</td>
<td>                 -  </td>
<td>  -  </td>
<td>  y   </td>
<td>  -  </td>
<td>  -  </td>
<td>  -  </td>
<td> 只支持特定的博通芯片
</td></tr>
<tr>
<td> <a href="http://elinux.org/Coreboot" title="Coreboot"> coreboot (<i>LinuxBIOS</i>)</a> <a rel="nofollow" class="external autonumber" href="http://www.coreboot.org/Welcome_to_coreboot">[1]</a>
</td>
<td>                 y  </td>
<td>   -  </td>
<td>  -   </td>
<td>  -  </td>
<td>  -  </td>
<td>  y  </td>
<td> Peter Stuge 在 2008 年度 嵌入式 Linux 欧洲研讨会上的谈话，<a rel="nofollow" class="external text" href="http://free-electrons.com/pub/video/2008/elce/nluug-fall2008-stuge-coreboot.ogv">视频</a>
</td></tr>
<tr>
<td> <a href="http://elinux.org/Kexecboot" title="Kexecboot">Kexecboot</a>
</td>
<td>                 y  </td>
<td>   -  </td>
<td>  -   </td>
<td>  -  </td>
<td>  -  </td>
<td> &#160;?  </td>
<td> 是一个二阶段引导程序，包含 Linux 内核和一个小型 GUI
</td></tr>
<tr>
<td> <a href="../../.././dev_portals/Development_Platforms/Tegra/Mainline_SW/U-Boot/Tegra/Mainline_SW/U-Boot.md" title="U-Boot">U-Boot</a>
</td>
<td>                 y  </td>
<td>   y  </td>
<td>   y  </td>
<td>  y  </td>
<td>  y </td>
<td>  y  </td>
<td> 支持网络安装
</td></tr>
<tr>
<td> <a href="http://elinux.org/Grub" title="Grub">Grub</a>
</td>
<td>                &#160;?  </td>
<td>   -  </td>
<td>  &#160;?  </td>
<td>  y  </td>
<td>  -  </td>
<td>  y  </td>
<td>
</td></tr>
<tr>
<td> <a href="http://elinux.org/Lilo" title="Lilo">Lilo</a>
</td>
<td>                 -  </td>
<td>   -  </td>
<td>   -  </td>
<td>  -  </td>
<td>  - </td>
<td>  y  </td>
<td> 仅支持 x86，需要用 nasm 编译
</td></tr>
<tr>
<td> <a rel="nofollow" class="external text" href="http://www.microcross.com/html/micromonitor.html">MicroMonitor</a>
</td>
<td>                 y  </td>
<td>   y  </td>
<td>  &#160;?  </td>
<td>  y  </td>
<td>  y  </td>
<td> &#160;?  </td>
<td>
</td></tr>
<tr>
<td> <a rel="nofollow" class="external text" href="http://www.linux-mips.org/wiki/PMON_2000">PMON 2000</a>
</td>
<td>                 -  </td>
<td>   -  </td>
<td>  y   </td>
<td>  -  </td>
<td>  -  </td>
<td>  -  </td>
<td>
</td></tr>
<tr>
<td> <a href="http://elinux.org/index.php?title=Qi&amp;action=edit&amp;redlink=1" class="new" title="Qi (page does not exist)">Qi</a>
</td>
<td>                 y  </td>
<td>   -  </td>
<td>  -   </td>
<td>  -  </td>
<td>  - </td>
<td>  -  </td>
<td> 非常快，可简单直接地引导进 Linux
</td></tr>

<tr>
<td> <a href="http://elinux.org/index.php?title=RedBoot&amp;action=edit&amp;redlink=1" class="new" title="RedBoot (page does not exist)">RedBoot</a>
</td>
<td>                 y  </td>
<td>  &#160;?  </td>
<td>   y  </td>
<td>  y  </td>
<td>  y </td>
<td>  y  </td>
<td> 支持网络安装
</td></tr>
<tr>
<td> <a href="http://elinux.org/Syslinux" title="Syslinux">Syslinux</a>
</td>
<td>                 -  </td>
<td>   -  </td>
<td>  -   </td>
<td>  -  </td>
<td>  -  </td>
<td>  y  </td>
<td> 变体有 isolinux，可非常灵活地引导启动 x86 机器
</td></tr>
<tr>
<td> <a rel="nofollow" class="external text" href="http://yaboot.ozlabs.org/">Yaboot</a>
</td>
<td>                 -  </td>
<td>   -  </td>
<td>  -   </td>
<td>  y  </td>
<td>  -  </td>
<td>  -  </td>
<td>
</td></tr>
<tr>
<td> <a rel="nofollow" class="external text" href="http://www.linux-mips.org/wiki/YAMON">YAMON</a>
</td>
<td>                 -  </td>
<td>   -  </td>
<td>  y   </td>
<td>  -  </td>
<td>  -  </td>
<td>  -  </td>
<td>
</td></tr></table>

更多详尽的列表可以从[维基百科](http://en.wikipedia.org/wiki/Comparison_of_boot_loaders)上找到。

## 一些传统的引导程序

下述内容较旧，请不要用于新设计中！

-   rrload (RidgeRun, 曾用于以前的 TI OMAP 开发板)
-   [pmon](http://www.linux-mips.org/wiki/PMON) （曾用 MIPS Linux，包括博通 Wifi 路由器，譬如 Linksys）

## 看过来

-   [引导程序安全相关资源](../../.././dev_portals/Security/Bootloader_Security_Resources/Bootloader_Security_Resources.md "引导程序安全相关资源")


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [引导程序](http://eLinux.org/Category:Bootloaders "Category:Bootloaders")

