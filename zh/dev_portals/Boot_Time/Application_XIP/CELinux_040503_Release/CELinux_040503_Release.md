> From: [eLinux.org](../../../.././dev_portals/Boot_Time/Application_XIP/CELinux_040503_Release/CELinux/CELinux.md_040503_Release "../../../.././dev_portals/Boot_Time/Application_XIP/CELinux_040503_Release/CELinux/CELinux.md_040503_Release")


# CELinux 040503 Release




 This page describes the [CELinux](../../../.././dev_portals/Boot_Time/Application_XIP/CELinux_040503_Release/CELinux/CELinux.md "CELinux") source tree
currently under construction.

## Contents

-   [1 Integrated Tree](#integrated-tree)
-   [2 Patchset File](#patchset-file)
-   [3 Base Kernel](#base-kernel)
-   [4 Sources List](#sources-list)

## Integrated Tree

See
[http://tree.celinuxforum.org/source/celinux-040503.tar.bz2](http://tree.celinuxforum.org/source/celinux-040503.tar.bz2)

Supported Platforms:

<table>
<tbody>
<tr class="odd">
<td align="left">Supported Platforms</td>
</tr>
<tr class="even">
<td align="left">i386 generic</td>
</tr>
<tr class="odd">
<td align="left">VIA Eden board</td>
</tr>
<tr class="even">
<td align="left">ARM Integrator board</td>
</tr>
<tr class="odd">
<td align="left">TI OMAP Innovator</td>
</tr>
<tr class="even">
<td align="left">Renesas SH7751 board</td>
</tr>
<tr class="odd">
<td align="left">Toshiba RBXTX4927 board</td>
</tr>
<tr class="even">
<td align="left">Kyoto Microcomputer KZP SH board</td>
</tr>
<tr class="odd">
<td align="left">Renesas Solution Engine (SH7600) board</td>
</tr>
<tr class="even">
<td align="left">Samsung S3C2440 board</td>
</tr>
<tr class="odd">
<td align="left">Toshiba JMR3927 board</td>
</tr>
</tbody>
</table>

## Patchset File

[CELinux](../../../.././dev_portals/Boot_Time/Application_XIP/CELinux_040503_Release/CELinux/CELinux.md "CELinux") is also provided in patchset form so that
individual technology patches may be examined, modified and used
independently from the base source tree.

See
[http://tree.celinuxforum.org/source/celinux-040503.patchset.tar.bz2](http://tree.celinuxforum.org/source/celinux-040503.patchset.tar.bz2)

To apply the patches, follow these instructions:

    - download the base kernel (see the link in the table below)
    - download the patchset tarfile (see the link above)
    - unzip and untar the patchset tarfile (tar -xjvf celinux-040503.patchset.tar.bz2)
    - run the "tpm" command from the release directory, using the release patchlist:

    patches-040503.release/tpm -t linux-2.4.20.tar.bz2 -f patches-040503.release/patchlist -o celinux-040503



## Base Kernel

The base kernel is Linux version 2.4.20 from kernel.org.

See [http://www.kernel.org/](http://www.kernel.org/) for details.

## Sources List

<table>
<tbody>
<tr class="odd">
<td align="left"><strong>Kernel</strong></td>
<td align="left"><strong>Version</strong></td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left"><a href="http://tree.celinuxforum.org/source/linux-2.4.20.tar.bz2">http://tree.celinuxforum.org/source/linux-2.4.20.tar.bz2</a></td>
<td align="left">2.4.20</td>
<td align="left">see <a href="http://www.kernel.org/">http://www.kernel.org/</a></td>
</tr>
<tr class="odd">
<td align="left"><strong>Patch</strong></td>
<td align="left"><strong>Donor</strong></td>
<td align="left"><strong>Patch Status</strong></td>
</tr>
<tr class="even">
<td align="left">base-2.4.20-8.patch</td>
<td align="left">Sony/Panasonic</td>
<td align="left">baseline patch (see <a href="http://elinux.org/CELinux_031030_Release" title="CELinux 031030 Release">CELinux_031030_Release</a>)</td>
</tr>
<tr class="odd">
<td align="left">ulinux-i386-refactored-01.patch</td>
<td align="left">Lineo Solutions</td>
<td align="left">platform patch</td>
</tr>
<tr class="even">
<td align="left">ulinux-kgdb-i386-refactored-01.patch</td>
<td align="left">Lineo Solutions</td>
<td align="left">bugfixes for kgdb for i386</td>
</tr>
<tr class="odd">
<td align="left">ulinux-kgdb_031219.patch</td>
<td align="left">Lineo Solutions</td>
<td align="left">introduce kgdb support - OK</td>
</tr>
<tr class="even">
<td align="left">ulinux-sh-refactored-1.patch</td>
<td align="left">Lineo Solutions</td>
<td align="left">Add Renesas SH support</td>
</tr>
<tr class="odd">
<td align="left">toshiba-rbtx4927.celf20031030-1.patch</td>
<td align="left">Toshiba</td>
<td align="left">Add RBTX4927 support</td>
</tr>
<tr class="even">
<td align="left">arm-celf-integrator-040301.patch</td>
<td align="left">ARM</td>
<td align="left">Fix some integrator structure defs - OK</td>
</tr>
<tr class="odd">
<td align="left">mips-lasat-clean-fix.patch</td>
<td align="left">Sony</td>
<td align="left">Fix a problem with 'make distclean' for mips</td>
</tr>
<tr class="even">
<td align="left">embedded-menu-1.patch</td>
<td align="left">Sony</td>
<td align="left">Added &quot;embedded options&quot; menu</td>
</tr>
<tr class="odd">
<td align="left">preset-lpj-2.patch</td>
<td align="left">Sony</td>
<td align="left">Isolated preset LPJ patch - result of BTWG activity</td>
</tr>
<tr class="even">
<td align="left">intel-i386-preempt-HRT_040224.patch</td>
<td align="left">Intel</td>
<td align="left">Fix problems with HRT and preempt technologies on i386 architecture</td>
</tr>
<tr class="odd">
<td align="left">toshiba-mips-preempt-fix_040224.patch</td>
<td align="left">Toshiba</td>
<td align="left">Fix problem with preemption on Mips architecture</td>
</tr>
<tr class="even">
<td align="left">mitsubishi-omap-vst-fix.patch</td>
<td align="left">Mitsubishi</td>
<td align="left">Fix problem with VST on OMAP board</td>
</tr>
<tr class="odd">
<td align="left">KFI_SH_040308-1.patch</td>
<td align="left">Mitsubishi</td>
<td align="left">Add KFI support for SH processors</td>
</tr>
<tr class="even">
<td align="left">mips-xip-1.patch</td>
<td align="left">Toshiba</td>
<td align="left">Add XIP support for RBTX4927 board</td>
</tr>
<tr class="odd">
<td align="left">mitsubishi_KZP_040323-5.patch</td>
<td align="left">Mitsubishi</td>
<td align="left">Add support for KZIP (KMC SH-based) board</td>
</tr>
<tr class="even">
<td align="left">KZP_pcnet32.patch</td>
<td align="left">Mitsubishi</td>
<td align="left">Additional support for KZIP board</td>
</tr>
<tr class="odd">
<td align="left">KZP_usbfix.patch</td>
<td align="left">Mitsubishi</td>
<td align="left">Fix bug with USB drivers</td>
</tr>
<tr class="even">
<td align="left">KZP_vlink.patch</td>
<td align="left">Mitsubishi</td>
<td align="left">Add support for use of KMC jtag debuffer with KZIP board</td>
</tr>
<tr class="odd">
<td align="left">KZP_pci.patch</td>
<td align="left">Mitsubishi</td>
<td align="left">Additional support for KZIP board</td>
</tr>
<tr class="even">
<td align="left">lineo-tcube-040408-1.patch</td>
<td align="left">Lineo Solutions</td>
<td align="left">Add support for NEC tcube (MIPS-based board)</td>
</tr>
<tr class="odd">
<td align="left">lineo-sh-7300-7760-040430.patch</td>
<td align="left">Lineo Solutions</td>
<td align="left">Add support for Renesas Solution Engine board with SH 7300/7760 processors</td>
</tr>
<tr class="even">
<td align="left">lineo-sh-ms7760cp01-040430.patch</td>
<td align="left">Lineo Solutions</td>
<td align="left">Add support for network board and sound dma buffering for Renesas Solution Engine board</td>
</tr>
<tr class="odd">
<td align="left">lineo-sh-kgdb-040430.patch</td>
<td align="left">Lineo Solutions</td>
<td align="left">Add KGDB support for SH7760 board</td>
</tr>
<tr class="even">
<td align="left">metrowerks-mtd-configfix.patch</td>
<td align="left">Metrowerks</td>
<td align="left">Fix broken lines in mtd config.in file</td>
</tr>
<tr class="odd">
<td align="left">toshiba-celf-jmr-fix-1.patch</td>
<td align="left">Toshiba</td>
<td align="left">Fix MIPS support for JMR board</td>
</tr>
<tr class="even">
<td align="left">samsung-s3c2440-mtd-pm_040503.patch</td>
<td align="left">Samsung</td>
<td align="left">Add support for Samsung S32440 board</td>
</tr>
<tr class="odd">
<td align="left">extraversion-celf3.patch</td>
<td align="left">Sony</td>
<td align="left">change EXTRAVERSION to celf3</td>
</tr>
</tbody>
</table>


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CELF](http://eLinux.org/Category:CELF "Category:CELF")
-   [CELinux](http://eLinux.org/Category:CELinux "Category:CELinux")

