> From: [eLinux.org](http://eLinux.org/Mandatory_Access_Control_Comparison "http://eLinux.org/Mandatory_Access_Control_Comparison")


# Mandatory Access Control Comparison



Table Of Contents:


 This page has information about Mandatory Access Control (MAC)
solutions, which is of interest to CE Linux Forum members, because MAC
provide strong access control for CE device which has rich resources to
be managed.

## Contents

-   [1 Comparison of MAC solution](#comparison-of-mac-solution)
-   [2 Benchmark](#benchmark)
    -   [2.1 Sizing](#sizing)
    -   [2.2 Lmbench](#lmbench)
    -   [2.3 Unixbench](#unixbench)
-   [3 Summary](#summary)
-   [4 Other resources](#other-resources)

## Comparison of MAC solution

<table>
<thead>
<tr class="header">
<th align="left">_</th>
<th align="left"><a href="http://www.lids.org/">LIDS</a></th>
<th align="left"><a href="http://tomoyo.sourceforge.jp/">TOMOYO</a></th>
<th align="left"><a href="http://rsbac.org/">RSBAC</a></th>
<th align="left"><a href="http://selinux.sourceforge.net/">SELinux</a></th>
<th align="left"><a href="http://en.opensuse.org/AppArmor">App Armor</a></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Security Model</td>
<td align="left">MAC(inode), TPE(1.2),TDE(1.2)</td>
<td align="left">MAC(path)</td>
<td align="left">MAC, RC, ACL, FF, UM, PM, DAZ, JAIL</td>
<td align="left">MAC(label), TE,RBAC,MLC,MCS</td>
<td align="left">MAC(path)</td>
</tr>
<tr class="even">
<td align="left">Type</td>
<td align="left">LSM (2.6), patch (2.4)</td>
<td align="left">patch</td>
<td align="left">patch</td>
<td align="left">LSM</td>
<td align="left">LSM</td>
</tr>
<tr class="odd">
<td align="left">Current version (2.6)</td>
<td align="left">2.2.2 for 2.6.14 (LSM)</td>
<td align="left">1.1.3 for 2.6.11-17</td>
<td align="left">1.2.7 for 2.6.16</td>
<td align="left">in mainline</td>
<td align="left">2.6.X (LSM)</td>
</tr>
<tr class="even">
<td align="left">Current version (2.4)</td>
<td align="left">1.2.2 for 2.4.30</td>
<td align="left">1.1.3 for 2.4.20 - 32</td>
<td align="left">1.2.7 for 2.4.32</td>
<td align="left">obsolete</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">Policy learn mode</td>
<td align="left">/lids/lids.ini</td>
<td align="left">CCS=0 /root/security/profile0.txt</td>
<td align="left">/etc/selinux/config</td>
<td align="left">rsbac_softmode</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">disable option</td>
<td align="left">lids=0</td>
<td align="left"></td>
<td align="left"></td>
<td align="left">selinux=0</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">Policy location</td>
<td align="left">/etc/lids/</td>
<td align="left">/root/security/</td>
<td align="left"> ?</td>
<td align="left">/etc/selinux</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">Distributions</td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Hardened Gentoo</td>
<td align="left">Redhat, Fedora Core, Hardened Gentoo</td>
<td align="left">Open Suse</td>
</tr>
<tr class="odd">
<td align="left">(by 3rd party)</td>
<td align="left">Fedora core, Debian</td>
<td align="left">Fedora core, Debian</td>
<td align="left">Debian</td>
<td align="left">Suse, Ubuntu</td>
<td align="left">Slackware</td>
</tr>
</tbody>
</table>

## Benchmark

MEN WORKING

Hardware : Sharp Zaurus C860, CPU :[XScale](http://eLinux.org/XScale "XScale") 400MHz,
Memory : --MB, OS : Openzaurus 3.5.4.1 + OPIE 1.2

### Sizing

Kernel 2.6.16 (linux-openzaurus-2.6.16-r40, Static build)

Normal

LIDS

TOMOYO

RSBAC

[SELinux](http://eLinux.org/SELinux "SELinux")

Kernel size (Image)

2487744

2554880

2541808

2974224

 ?

Kernel size (zImage)

1181660

1205324

1207288

1351432

 ?

image size overhead

0

67136

54064

486480

 ?

policy size

0

memory consumption

0

### Lmbench

Processor, Process, Local communication latencies

Normal

LIDS

TOMOYO

RSBAC

[SELinux](http://eLinux.org/SELinux "SELinux")

null call

0.46

0.46

0.46

null I/O

1.77

1.97 (11%)

1.77

stat

12.7

15.7 (24%)

12.8 (1%)

open/close

18.7

22.5 (20%)

59 (216%)

select TCP

91.3

91.6

91.3

sig inst

2.89

2.83 (-2%)

2.84 (-2%)

sig hndl

7.58

7.66 (1%)

9.25 (22%)

fork

3795

3808

3757 (-1%)

execve

13000

13000

15000 (15%)

sh

36000

37000 (3%)

41000 (14%)

ctxsw

175

186.3 (7%)

177.2

pipe

356.9

375.6 (5%)

358.1

AF\_UNIX

674

718 (7%)

723 (7%)

UDP

747.5

776.3 (4%)

765.1 (2%)

RPC/UDP

969.1

1013 (5%)

1193 (23%)

TCP

957.3

1004 (5%)

964.6 (1%)

RPC/TCP

1332

1380 (4%)

1353 (2%)

TCP connect

2302

2379 (3%)

2357 (2%)

0KB create

461

605.7 (31%)

669.8 (45%)

0KB delete

232.5

267.1 (15%)

329.5 (42%)

10KB create

5128.2

5234.6 (2%)

5235.6 (2%)

10KB delete

298.8

349.8 (17%)

415.1 (39%)

Mmap latency

-

-

-

Prot Fault

1.72

1.71

0.61 (-64%)

Page Fault

92

92

86 (-7%)

### Unixbench

Normal

LIDS

TOMOYO

RSBAC

[SELinux](http://eLinux.org/SELinux "SELinux")

execl

89.3 lps

84.6

59.5

file read 1KB

53974.0 KBps

52176

53505

file write 1KB

328.0 KBps

321

376

file copy 1KB

288.0 KBps

199

311

file read 256B

34766.0 KBps

33831

34742

file write 256B

133.0 KBps

121

138

file copy 256B

126.0 KBps

121

121

file read 4KB

69148.0 KBps

67961

68851

file write 4KB

1417.0 KBps

1417

1333

file copy 4KB

1268.0 KBps

1237

1249

pipe

112917.5 lps

108924

112137

pipe switching

2655.4 lps

2559.6

2700

process creation

272.9 lps

367.8

276.4

system call

269446.2 lps

267748

268823.9

shell scripts (1)

82.2 lpm

77.6

58.6

shell scripts (8)

5.3 lpm

5.6

5.4

shell scripts (16)

2.0 lpm

0

2

## Summary

<table>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left">LIDS</td>
<td align="left">TOMOYO</td>
<td align="left">RSBAC</td>
<td align="left"><a href="http://elinux.org/SELinux" title="SELinux">SELinux</a></td>
<td align="left">App Armor</td>
</tr>
<tr class="even">
<td align="left">build (kenrel) (easy:5 - 1:hard)</td>
<td align="left">4</td>
<td align="left">4</td>
<td align="left">3</td>
<td align="left">5</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">build (userland) (easy:5 - 1:hard)</td>
<td align="left">4</td>
<td align="left">4</td>
<td align="left">3</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">image size</td>
<td align="left">2%</td>
<td align="left">2%</td>
<td align="left">15%</td>
<td align="left">3%</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">performance</td>
<td align="left"></td>
<td align="left"></td>
<td align="left"></td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">policy lean mode (good:5 - 1:poor)</td>
<td align="left">4</td>
<td align="left">5</td>
<td align="left"> ?</td>
<td align="left">3</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">symlink</td>
<td align="left">by wrapper</td>
<td align="left">support(alias)</td>
<td align="left"></td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">filesystem JFFS2</td>
<td align="left">ok</td>
<td align="left">ok</td>
<td align="left"></td>
<td align="left"></td>
<td align="left">ok?</td>
</tr>
</tbody>
</table>

## Other resources

Access Control Comparison Table
[http://gentoo-wiki.com/Access\_Control\_Comparison\_Table](http://gentoo-wiki.com/Access_Control_Comparison_Table)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Security](http://eLinux.org/Category:Security "Category:Security")

