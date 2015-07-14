> From: [eLinux.org](http://eLinux.org/ARM_Processor "http://eLinux.org/ARM_Processor")


# ARM Processor



The ARM architecture (previously, the Advanced RISC Machine, and prior
to that Acorn RISC Machine) is a 32-bit RISC processor architecture
developed by ARM Limited that is widely used in a number of embedded
designs. Because of their power saving features, ARM CPUs are dominant
in the mobile electronics market, where low power consumption is a
critical design goal.

Today, the ARM family accounts for approximately 75% of all embedded
32-bit RISC CPUs,making it one of the most prolific 32-bit architectures
in the world. ARM CPUs are found in all corners of consumer electronics,
from portable devices (PDAs, mobile phones, media players, handheld
gaming units, and calculators) to computer peripherals (hard drives,
desktop routers). Important branches in this family include:

-   [Marvell](http://eLinux.org/index.php?title=Marvell&action=edit&redlink=1 "Marvell (page does not exist)")'s
    [XScale](http://eLinux.org/XScale "XScale")
-   [Texas Instruments](../../.././dev_portals/Power_Management/Texas_Instruments/Texas_Instruments.md "Texas Instruments")
    [OMAP](http://eLinux.org/OMAP "OMAP") series
-   [Samsung](http://eLinux.org/index.php?title=Samsung&action=edit&redlink=1 "Samsung (page does not exist)")'s
    [S3C24xx](http://eLinux.org/S3C24xx "S3C24xx") series
-   [NXP](http://eLinux.org/index.php?title=NXP&action=edit&redlink=1 "NXP (page does not exist)")'s
    [Bluestreak](http://eLinux.org/Bluestreak "Bluestreak") series
-   [Freescale](http://eLinux.org/index.php?title=Freescale&action=edit&redlink=1 "Freescale (page does not exist)")'s
    [I.MX](http://eLinux.org/I.MX "I.MX") series
-   [Atmel](http://eLinux.org/Atmel "Atmel")
-   [Boardcom](http://eLinux.org/index.php?title=Boardcom&action=edit&redlink=1 "Boardcom (page does not exist)")
-   [Qualcomm](http://eLinux.org/index.php?title=Qualcomm&action=edit&redlink=1 "Qualcomm (page does not exist)")
-   [AllWinner](http://eLinux.org/index.php?title=AllWinner&action=edit&redlink=1 "AllWinner (page does not exist)")
-   [RockChip](http://eLinux.org/index.php?title=RockChip&action=edit&redlink=1 "RockChip (page does not exist)")



## **TECHNICAL INFORMATION**

<table>
<thead>
<tr class="header">
<th align="left">CPU Core</th>
<th align="left">MMU/MPU</th>
<th align="left">ISA</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">StrongArm</td>
<td align="left">MMU</td>
<td align="left">v4</td>
</tr>
<tr class="even">
<td align="left"><a href="http://elinux.org/ARM7TDMI" title="ARM7TDMI">ARM7TDMI</a></td>
<td align="left">none</td>
<td align="left">v4T</td>
</tr>
<tr class="odd">
<td align="left">ARM7EJ-S</td>
<td align="left">none</td>
<td align="left">v5TEJ</td>
</tr>
<tr class="even">
<td align="left"><a href="http://elinux.org/ARM720T" title="ARM720T">ARM720T</a></td>
<td align="left">MMU</td>
<td align="left">v4T</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://elinux.org/ARM920T" title="ARM920T">ARM920T</a></td>
<td align="left">MMU</td>
<td align="left">v4T</td>
</tr>
<tr class="even">
<td align="left"><a href="http://elinux.org/ARM922T" title="ARM922T">ARM922T</a></td>
<td align="left">MMU</td>
<td align="left">v4T</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://elinux.org/ARM926EJ-S" title="ARM926EJ-S">ARM926EJ-S</a></td>
<td align="left">MMU</td>
<td align="left">v5TEJ</td>
</tr>
<tr class="even">
<td align="left">ARM940T</td>
<td align="left">MPU</td>
<td align="left">v4T</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://elinux.org/XScale" title="XScale">XScale</a></td>
<td align="left">MPU</td>
<td align="left">v5TE</td>
</tr>
<tr class="even">
<td align="left">ARM946E-S</td>
<td align="left">MPU</td>
<td align="left">v5TE</td>
</tr>
<tr class="odd">
<td align="left">ARM966E-S</td>
<td align="left">none</td>
<td align="left">v5TE</td>
</tr>
<tr class="even">
<td align="left">ARM1020E</td>
<td align="left">MMU</td>
<td align="left">v5TE</td>
</tr>
<tr class="odd">
<td align="left">ARM1022E</td>
<td align="left">MMU</td>
<td align="left">v5TE</td>
</tr>
<tr class="even">
<td align="left">ARM1026EJ-S</td>
<td align="left">MMU+MPU</td>
<td align="left">v5TE</td>
</tr>
<tr class="odd">
<td align="left">ARM1136J-S</td>
<td align="left">MMU</td>
<td align="left">v6</td>
</tr>
<tr class="even">
<td align="left">ARM1136JF-S</td>
<td align="left">MMU</td>
<td align="left">v6</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://elinux.org/Cortex" title="Cortex">Cortex-M1</a></td>
<td align="left">none</td>
<td align="left">v6-M</td>
</tr>
<tr class="even">
<td align="left"><a href="http://elinux.org/Cortex" title="Cortex">Cortex-A8</a></td>
<td align="left">MMU</td>
<td align="left">v7-A</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://elinux.org/Cortex" title="Cortex">Cortex-R4</a></td>
<td align="left">MPU optional</td>
<td align="left">v7-R</td>
</tr>
<tr class="even">
<td align="left"><a href="http://elinux.org/Cortex" title="Cortex">Cortex-M3</a></td>
<td align="left">MPU</td>
<td align="left">v7-M</td>
</tr>
</tbody>
</table>



<table>
<thead>
<tr class="header">
<th align="left">CPU Core</th>
<th align="left">Pipeline Depth</th>
<th align="left">Typical MHz</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">ARM7</td>
<td align="left">3 stage</td>
<td align="left">80</td>
</tr>
<tr class="even">
<td align="left">StrongArm</td>
<td align="left">5 stage</td>
<td align="left">133</td>
</tr>
<tr class="odd">
<td align="left">ARM9</td>
<td align="left">5 stage</td>
<td align="left">150</td>
</tr>
<tr class="even">
<td align="left">ARM10</td>
<td align="left">6 stage</td>
<td align="left">260</td>
</tr>
<tr class="odd">
<td align="left">XScale</td>
<td align="left">8 stage</td>
<td align="left">400</td>
</tr>
<tr class="even">
<td align="left">ARM11</td>
<td align="left">8 stage</td>
<td align="left">335</td>
</tr>
</tbody>
</table>

NOTE: increased pipeline length reduces the amount of work done at each
stage in the pipeline, therefor enabling higher operating frequencies
and performance. however, as the pipeline length increases, system
latency also increases due to increased number of clock cycles needed to
fill the pipeline before an instruction can be executed. an example
would be an ARM920T running at 400MHz might have comparable performance
to an Xscale running at 600MHz


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [ARM processors](http://eLinux.org/Category:ARM_processors "Category:ARM processors")
-   [Processors](http://eLinux.org/Category:Processors "Category:Processors")

