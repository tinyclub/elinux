> From: [eLinux.org](http://eLinux.org/Bootloader "http://eLinux.org/Bootloader")


# Bootloader



Briefly, a bootloader is the first software program that runs when a
computer starts. It is responsible for loading and transferring control
to the operating system kernel software (such as the Hurd or the Linux).
The kernel, in turn, initializes the rest of the operating system (e.g.
GNU).

## List of bootloaders

<table class="wikitable" border="1" cellspacing="0" cellpadding="4">
<caption align="bottom"> Legend: <b>?</b>:Unknown <b>-</b>:Not supported
</caption>
<tr>
<th> Bootloader  </th>
<th> ARM </th>
<th> BFIN </th>
<th> MIPS </th>
<th> PPC </th>
<th> SH </th>
<th> x86 </th>
<th> remarks
</th></tr>
<tr>
<th> <a href="http://elinux.org/APEX" title="APEX" class="mw-redirect">APEX</a>
</th>
<td>                 y  </td>
<td>   -  </td>
<td> &#160;?   </td>
<td> &#160;?  </td>
<td> &#160;?  </td>
<td> &#160;?  </td>
<td>
</td></tr>
<tr>
<th> <a href="http://elinux.org/Barebox" title="Barebox">Barebox (U-Boot-v2)</a>
</th>
<td>                 y  </td>
<td>   y  </td>
<td>   y  </td>
<td>  y  </td>
<td>  (in progress) </td>
<td>  y  </td>
<td> allows networked setup, integrated editor and scripting
</td></tr>
<tr>
<th> <a href="http://elinux.org/Blob" title="Blob">Blob</a>
</th>
<td>                 y  </td>
<td>   -  </td>
<td>  -   </td>
<td>  -  </td>
<td>  -  </td>
<td>  -  </td>
<td>
</td></tr>
<tr>
<th> <a rel="nofollow" class="external text" href="http://www.linux-mips.org/wiki/Common_Firmware_Environment">CFE</a>
</th>
<td>                 -  </td>
<td>   -  </td>
<td>  y   </td>
<td>  -  </td>
<td>  -  </td>
<td>  -  </td>
<td> for specific BroadCom chipsets
</td></tr>
<tr>
<th> <a href="http://elinux.org/Coreboot" title="Coreboot"> coreboot (<i>LinuxBIOS</i>)</a> <a rel="nofollow" class="external autonumber" href="http://www.coreboot.org/Welcome_to_coreboot">[1]</a>
</th>
<td>                 y  </td>
<td>   -  </td>
<td>  -   </td>
<td>  -  </td>
<td>  -  </td>
<td>  y  </td>
<td> Conference talk by Peter Stuge at Embedded Linux Conference Europe 2008, <a rel="nofollow" class="external text" href="http://free-electrons.com/pub/video/2008/elce/nluug-fall2008-stuge-coreboot.ogv">video</a>
</td></tr>
<tr>
<th> <a href="http://elinux.org/Kexecboot" title="Kexecboot">Kexecboot</a>
</th>
<td>                 y  </td>
<td>   -  </td>
<td>  -   </td>
<td>  -  </td>
<td>  -  </td>
<td> &#160;?  </td>
<td>  is a second-stage bootloader, consisting of the Linux kernel and a small gui
</td></tr>
<tr>
<th> <a href="../../.././dev_portals/Development_Platforms/Tegra/Mainline_SW/U-Boot/Tegra/Mainline_SW/U-Boot.md" title="U-Boot">U-Boot</a>
</th>
<td>                 y  </td>
<td>   y  </td>
<td>   y  </td>
<td>  y  </td>
<td>  y </td>
<td>  y  </td>
<td> allows networked setup
</td></tr>
<tr>
<th> <a href="http://elinux.org/Grub" title="Grub">Grub</a>
</th>
<td>                &#160;?  </td>
<td>   -  </td>
<td>  &#160;?  </td>
<td>  y  </td>
<td>  -  </td>
<td>  y  </td>
<td>
</td></tr>
<tr>
<th> <a href="http://elinux.org/Lilo" title="Lilo">Lilo</a>
</th>
<td>                 -  </td>
<td>   -  </td>
<td>   -  </td>
<td>  -  </td>
<td>  - </td>
<td>  y  </td>
<td> x86 only, requires nasm to build
</td></tr>
<tr>
<th> <a rel="nofollow" class="external text" href="http://www.microcross.com/html/micromonitor.html">MicroMonitor</a>
</th>
<td>                 y  </td>
<td>   y  </td>
<td>  &#160;?  </td>
<td>  y  </td>
<td>  y  </td>
<td> &#160;?  </td>
<td>
</td></tr>
<tr>
<th> <a rel="nofollow" class="external text" href="http://www.linux-mips.org/wiki/PMON_2000">PMON 2000</a>
</th>
<td>                 -  </td>
<td>   -  </td>
<td>  y   </td>
<td>  -  </td>
<td>  -  </td>
<td>  -  </td>
<td>
</td></tr>
<tr>
<th> <a href="http://elinux.org/index.php?title=Qi&amp;action=edit&amp;redlink=1" class="new" title="Qi (page does not exist)">Qi</a>
</th>
<td>                 y  </td>
<td>   -  </td>
<td>  -   </td>
<td>  -  </td>
<td>  - </td>
<td>  -  </td>
<td> Very fast, simple boot direct to Linux
</td></tr>

<tr>
<th> <a href="http://elinux.org/index.php?title=RedBoot&amp;action=edit&amp;redlink=1" class="new" title="RedBoot (page does not exist)">RedBoot</a>
</th>
<td>                 y  </td>
<td>  &#160;?  </td>
<td>   y  </td>
<td>  y  </td>
<td>  y </td>
<td>  y  </td>
<td> allows networked setup
</td></tr>
<tr>
<th> <a href="http://elinux.org/Syslinux" title="Syslinux">Syslinux</a>
</th>
<td>                 -  </td>
<td>   -  </td>
<td>  -   </td>
<td>  -  </td>
<td>  -  </td>
<td>  y  </td>
<td> variants (including) isolinux are very flexible for booting x86
</td></tr>
<tr>
<th> <a rel="nofollow" class="external text" href="http://yaboot.ozlabs.org/">Yaboot</a>
</th>
<td>                 -  </td>
<td>   -  </td>
<td>  -   </td>
<td>  y  </td>
<td>  -  </td>
<td>  -  </td>
<td>
</td></tr>
<tr>
<th> <a rel="nofollow" class="external text" href="http://www.linux-mips.org/wiki/YAMON">YAMON</a>
</th>
<td>                 -  </td>
<td>   -  </td>
<td>  y   </td>
<td>  -  </td>
<td>  -  </td>
<td>  -  </td>
<td>
</td></tr></table>

A lot more exhaustive list is available at
[Wikipedia](http://en.wikipedia.org/wiki/Comparison_of_boot_loaders)

## List of legacy boot loaders

Please don't pick any of these for new designs!

-   rrload (RidgeRun, used for older TI OMAP boards)
-   [pmon](http://www.linux-mips.org/wiki/PMON) (used for Linux MIPS,
    including BroadCom wifi router boards like Linksys)

## See also

-   [Bootloader\_Security\_Resources](../../.././dev_portals/Security/Bootloader_Security_Resources/Bootloader_Security_Resources.md "Bootloader Security Resources")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Bootloaders](http://eLinux.org/Category:Bootloaders "Category:Bootloaders")

