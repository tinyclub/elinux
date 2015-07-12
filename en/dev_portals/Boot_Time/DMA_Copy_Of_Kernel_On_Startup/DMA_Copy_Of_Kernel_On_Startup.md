> From: [eLinux.org](http://eLinux.org/DMA_Copy_Of_Kernel_On_Startup "http://eLinux.org/DMA_Copy_Of_Kernel_On_Startup")


# DMA Copy Of Kernel On Startup



## Contents

-   [1 Description](#description)
-   [2 Rationale](#rationale)
-   [3 Resources](#resources)
    -   [3.1 Projects](#projects)
-   [4 Specifications](#specifications)
-   [5 Downloads](#downloads)
    -   [5.1 Patch](#patch)
    -   [5.2 Utility programs](#utility-programs)
-   [6 How To Use](#how-to-use)
-   [7 Sample Results](#sample-results)
    -   [7.1 Case Study 1](#case-study-1)
    -   [7.2 Case Study 2](#case-study-2)
-   [8 Status](#status)
-   [9 Future Work/Action Items](#future-work-action-items)

## Description

This section describes the technology of DMA copy of kernel on startup.
It's necessary to copy binary images, such as a kernel image, file
system images, and so on, from ROM to RAM on bootup if XIP isn't used.
In this case, using DMA transfer is very efficient to save the time and
CPU resources.

## Rationale

This feature is important to CELF because it reduces bootup time
significantly.

## Resources

### Projects

None.

## Specifications

None.

## Downloads

### Patch

Sorry but there is no available patch at this time.

### Utility programs

None

## How To Use

## Sample Results

### Case Study 1

Jyunji Kondo (of Fujitsu Prime Software Technologies) measured the
result of using DMA kernel copy on FR-V processor.

<table>
<tbody>
<tr class="odd">
<td align="left">Hardware</td>
<td align="left">Fujitsu FR-V Design Kit for FR450 core</td>
</tr>
<tr class="even">
<td align="left">Kernel Version</td>
<td align="left">2.6.6</td>
</tr>
<tr class="odd">
<td align="left">Configuration</td>
<td align="left">- DMA kernel copy enabled/disabled<br />- <a href="http://elinux.org/Preset_LPJ" title="Preset LPJ">Preset LPJ</a> enabled/disabled<br />- Avoiding printk messages enabled/disabled</td>
</tr>
</tbody>
</table>

Here is the graphic chart which illustrates the elapse time of each
startup stage.

[![Normal Vs Fast
Boot.png](http://eLinux.org/images/1/15/Normal_Vs_Fast_Boot.png)](http://eLinux.org/File:Normal_Vs_Fast_Boot.png)

Figure 1: Comparison of normal and fast boot

[![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif) Hardware
initialization consumes about 200 milliseconds before firmware init.

And here is the table which shows the actual performance number.



<table>
<caption> Table 1: Elapse time of each stage (in milliseconds) </caption>
<thead>
<tr class="header">
<th align="left"><strong>-</strong></th>
<th align="left"><strong>firm init</strong></th>
<th align="left"><strong>kernel init</strong></th>
<th align="left"><strong>user init</strong></th>
<th align="left"><strong>user splash</strong></th>
<th align="left"><strong>total</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">normal boot</td>
<td align="left">229</td>
<td align="left">660</td>
<td align="left">290</td>
<td align="left">112</td>
<td align="left">1,291</td>
</tr>
<tr class="even">
<td align="left">fast boot</td>
<td align="left">49</td>
<td align="left">88</td>
<td align="left">287</td>
<td align="left">113</td>
<td align="left">537</td>
</tr>
</tbody>
</table>

In the normal boot case, the kernel image whose size is 1.7MB around is
copied from ROM to RAM by CPU at firmware init. On the other hand, DMA
copy is used in the fast boot case and it reduces about 180
milliseconds.

It owes much to the potentiality of FR-V processor, but it's worthy of
consideration to use such a hardware assist feature for reducing bootup
time.

### Case Study 2

## Status

Status - measured
not started, researched, implemented, measured, documented, accepted

-   Architecture Support:

(for each arch, one of: unknown, patches apply, compiles, runs, works,
accepted)

-   -   i386: unknown
    -   ARM: unknown
    -   PPC: unknown
    -   MIPS: unknown
    -   SH: unknown
    -   FR-V: works

## Future Work/Action Items


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Bootloader](http://eLinux.org/Category:Bootloader "Category:Bootloader")

