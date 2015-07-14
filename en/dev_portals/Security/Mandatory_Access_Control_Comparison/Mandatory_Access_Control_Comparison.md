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

<p>Kernel 2.6.16 (linux-openzaurus-2.6.16-r40, Static build)
</p>
<table border="1" cellspacing="0" cellpadding="5">

<tr bgcolor="#80c0d0">
<td>
</td>
<td>  Normal
</td>
<td>  LIDS
</td>
<td>  TOMOYO
</td>
<td>  RSBAC
</td>
<td>  <a href="../../.././dev_portals/Security/SELinux/SELinux.md" title="SELinux">SELinux</a>
</td></tr>
<tr>
<td>  Kernel size (Image)
</td>
<td>  2487744
</td>
<td>  2554880
</td>
<td>  2541808
</td>
<td>  2974224
</td>
<td> &#160;?
</td></tr>
<tr>
<td>  Kernel size (zImage)
</td>
<td>  1181660
</td>
<td>  1205324
</td>
<td>  1207288
</td>
<td>  1351432
</td>
<td> &#160;?
</td></tr>
<tr>
<td>  image size overhead
</td>
<td>  0
</td>
<td>  67136
</td>
<td>  54064
</td>
<td>  486480
</td>
<td> &#160;?
</td></tr>
<tr>
<td>  policy size
</td>
<td>  0
</td></tr>
<tr>
<td>  memory consumption
</td>
<td>  0
</td></tr></table>

### Lmbench

<p>Processor, Process, Local communication latencies
</p>
<table border="1" cellspacing="0" cellpadding="5">

<tr bgcolor="#80c0d0">
<td>
</td>
<td>  Normal
</td>
<td>  LIDS
</td>
<td>  TOMOYO
</td>
<td>  RSBAC
</td>
<td>  <a href="../../.././dev_portals/Security/SELinux/SELinux.md" title="SELinux">SELinux</a>
</td></tr>
<tr>
<td>  null call
</td>
<td>  0.46
</td>
<td>  0.46
</td>
<td>  0.46
</td></tr>
<tr>
<td>  null I/O
</td>
<td>  1.77
</td>
<td>  1.97 (11%)
</td>
<td>  1.77
</td></tr>
<tr>
<td>  stat
</td>
<td>  12.7
</td>
<td>  15.7 (24%)
</td>
<td>  12.8 (1%)
</td></tr>
<tr>
<td>  open/close
</td>
<td>  18.7
</td>
<td>  22.5 (20%)
</td>
<td>  59 (216%)
</td></tr>
<tr>
<td>  select TCP
</td>
<td>  91.3
</td>
<td>  91.6
</td>
<td>  91.3
</td></tr>
<tr>
<td>  sig inst
</td>
<td>  2.89
</td>
<td>  2.83 (-2%)
</td>
<td>  2.84 (-2%)
</td></tr>
<tr>
<td>  sig hndl
</td>
<td>  7.58
</td>
<td>  7.66  (1%)
</td>
<td>  9.25 (22%)
</td></tr>
<tr>
<td>  fork
</td>
<td>  3795
</td>
<td>  3808
</td>
<td>  3757 (-1%)
</td></tr>
<tr>
<td>  execve
</td>
<td>  13000
</td>
<td>  13000
</td>
<td>  15000 (15%)
</td></tr>
<tr>
<td>  sh
</td>
<td>  36000
</td>
<td>  37000  (3%)
</td>
<td>  41000 (14%)
</td></tr>
<tr>
<td>  ctxsw
</td>
<td>  175
</td>
<td>  186.3  (7%)
</td>
<td>  177.2
</td></tr>
<tr>
<td>  pipe
</td>
<td>  356.9
</td>
<td>  375.6  (5%)
</td>
<td>  358.1
</td></tr>
<tr>
<td>  AF_UNIX
</td>
<td>  674
</td>
<td>  718  (7%)
</td>
<td>  723 (7%)
</td></tr>
<tr>
<td>  UDP
</td>
<td>  747.5
</td>
<td>  776.3  (4%)
</td>
<td>  765.1 (2%)
</td></tr>
<tr>
<td>  RPC/UDP
</td>
<td>  969.1
</td>
<td>  1013  (5%)
</td>
<td>  1193 (23%)
</td></tr>
<tr>
<td>  TCP
</td>
<td>  957.3
</td>
<td>  1004  (5%)
</td>
<td>  964.6 (1%)
</td></tr>
<tr>
<td>  RPC/TCP
</td>
<td>  1332
</td>
<td>  1380  (4%)
</td>
<td>  1353 (2%)
</td></tr>
<tr>
<td>  TCP connect
</td>
<td>  2302
</td>
<td>  2379  (3%)
</td>
<td>  2357 (2%)
</td></tr>
<tr>
<td>  0KB create
</td>
<td>  461
</td>
<td>  605.7 (31%)
</td>
<td>  669.8 (45%)
</td></tr>
<tr>
<td>  0KB delete
</td>
<td>  232.5
</td>
<td>  267.1 (15%)
</td>
<td>  329.5 (42%)
</td></tr>
<tr>
<td>  10KB create
</td>
<td>  5128.2
</td>
<td>  5234.6  (2%)
</td>
<td>  5235.6 (2%)
</td></tr>
<tr>
<td>  10KB delete
</td>
<td>  298.8
</td>
<td>  349.8 (17%)
</td>
<td>  415.1 (39%)
</td></tr>
<tr>
<td>  Mmap latency
</td>
<td>  -
</td>
<td>  -
</td>
<td>  -
</td></tr>
<tr>
<td>  Prot Fault
</td>
<td>  1.72
</td>
<td>  1.71
</td>
<td>  0.61 (-64%)
</td></tr>
<tr>
<td>  Page Fault
</td>
<td>  92
</td>
<td>  92
</td>
<td>  86 (-7%)
</td></tr></table>

### Unixbench

<table border="1" cellspacing="0" cellpadding="5">

<tr bgcolor="#80c0d0">
<td>
</td>
<td>  Normal
</td>
<td>  LIDS
</td>
<td>  TOMOYO
</td>
<td>  RSBAC
</td>
<td>  <a href="../../.././dev_portals/Security/SELinux/SELinux.md" title="SELinux">SELinux</a>
</td></tr>
<tr>
<td>  execl
</td>
<td>  89.3 lps
</td>
<td>  84.6
</td>
<td>  59.5
</td></tr>
<tr>
<td>  file read 1KB
</td>
<td>  53974.0 KBps
</td>
<td>  52176
</td>
<td>  53505
</td></tr>
<tr>
<td>  file write 1KB
</td>
<td>  328.0 KBps
</td>
<td>  321
</td>
<td>  376
</td></tr>
<tr>
<td>  file copy 1KB
</td>
<td>  288.0 KBps
</td>
<td>  199
</td>
<td>  311
</td></tr>
<tr>
<td>  file read 256B
</td>
<td>  34766.0 KBps
</td>
<td>  33831
</td>
<td>  34742
</td></tr>
<tr>
<td>  file write 256B
</td>
<td>  133.0 KBps
</td>
<td>  121
</td>
<td>  138
</td></tr>
<tr>
<td>  file copy 256B
</td>
<td>  126.0 KBps
</td>
<td>  121
</td>
<td>  121
</td></tr>
<tr>
<td>  file read 4KB
</td>
<td>  69148.0 KBps
</td>
<td>  67961
</td>
<td>  68851
</td></tr>
<tr>
<td>  file write 4KB
</td>
<td>  1417.0 KBps
</td>
<td>  1417
</td>
<td>  1333
</td></tr>
<tr>
<td>  file copy 4KB
</td>
<td>  1268.0 KBps
</td>
<td>  1237
</td>
<td>  1249
</td></tr>
<tr>
<td>  pipe
</td>
<td>  112917.5 lps
</td>
<td>  108924
</td>
<td>  112137
</td></tr>
<tr>
<td>  pipe switching
</td>
<td>  2655.4 lps
</td>
<td>  2559.6
</td>
<td>  2700
</td></tr>
<tr>
<td>  process creation
</td>
<td>  272.9 lps
</td>
<td>  367.8
</td>
<td>  276.4
</td></tr>
<tr>
<td>  system call
</td>
<td>  269446.2 lps
</td>
<td>  267748
</td>
<td>  268823.9
</td></tr>
<tr>
<td>  shell scripts (1)
</td>
<td>  82.2 lpm
</td>
<td>  77.6
</td>
<td>  58.6
</td></tr>
<tr>
<td>  shell scripts (8)
</td>
<td>  5.3 lpm
</td>
<td>  5.6
</td>
<td>  5.4
</td></tr>
<tr>
<td>  shell scripts (16)
</td>
<td>  2.0 lpm
</td>
<td>  0
</td>
<td>  2
</td></tr></table>


## Summary

<table>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left">LIDS</td>
<td align="left">TOMOYO</td>
<td align="left">RSBAC</td>
<td align="left"><a href="../../.././dev_portals/Security/SELinux/SELinux.md" title="SELinux">SELinux</a></td>
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

