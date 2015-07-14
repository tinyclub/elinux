> From: [eLinux.org](http://eLinux.org/R-Car "http://eLinux.org/R-Car")


# R-Car



**Jump to R-Car boards pages**
<sub>[![Arrow\\ Right-Down.svg](http://eLinux.org/images/thumb/8/83/Arrow_Right-Down.svg/19px-Arrow_Right-Down.svg.png)](http://eLinux.org/File:Arrow_Right-Down.svg)</sub>

[![65px-Stout
top.png](http://eLinux.org/images/6/60/65px-Stout_top.png)](http://eLinux.org/R-Car/Boards/Stout "R-Car/Boards/Stout")
[Start.Now (Stout)](http://eLinux.org/R-Car/Boards/Stout "R-Car/Boards/Stout")

[![65px-Porter
top.png](http://eLinux.org/images/thumb/a/a1/65px-Porter_top.png/65px-65px-Porter_top.png)](http://eLinux.org/R-Car/Boards/Porter "R-Car/Boards/Porter")
[Porter](http://eLinux.org/R-Car/Boards/Porter "R-Car/Boards/Porter")

[![65px-Silk
top.png](http://eLinux.org/images/b/b5/65px-Silk_top.png)](http://eLinux.org/R-Car/Boards/SILK "R-Car/Boards/SILK")
[SILK](http://eLinux.org/R-Car/Boards/SILK "R-Car/Boards/SILK")

## Contents

-   [1 Introduction](#introduction)
-   [2 R-Car SoCs](#r-car-socs)
-   [3 R-Car Boards](#r-car-boards)
    -   [3.1 Generation 1](#generation-1)
    -   [3.2 Generation 2](#generation-2)
-   [4 R-Car Linux](#r-car-linux)
    -   [4.1 Upstream](#upstream)
    -   [4.2 R-Car Community](#r-car-community)
    -   [4.3 LTSI (Long Term Support
        Initiative)](#ltsi-long-term-support-initiative)
    -   [4.4 Renesas Stable R-Car BSP
        Tree](#renesas-stable-r-car-bsp-tree)
-   [5 R-Car U-Boot](#r-car-u-boot)
-   [6 R-Car Yocto](#r-car-yocto)
-   [7 R-Car Tizen](#r-car-tizen)
-   [8 R-Car Android](#r-car-android)

# Introduction

This is starting page for Embedded Linux on Renesas R-Car family of
automotive embedded SoCs. Main goal is to make information on R-Car SoCs
friendly, easy to access for embedded developers, enthusiasts. It does
not aim to replace official Renesas support.

Links below could be used to get familiar with Renesas Automotive SoCs
and R-Car Concortia:

-   [Renesas Automotive Products /
    Solutions](http://am.renesas.com/applications/automotive/index.jsp)
-   [Renesas Car Information Terminal
    Applications](http://am.renesas.com/applications/automotive/cis/cis_highend/index.jsp)
-   [R-Car
    Consortium](http://r-car-consortium.renesas.com/jpn/index.html)

Detailed information regarding R-Car SoCs (including roadmap, technical
and marketing documents, BSPs and middleware) can be obtained directly
from Renesas representative.

# R-Car SoCs

<table>
<caption> Renesas R-Car SoC variants (Generations) </caption>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left"><strong>Generation 1</strong></td>
<td align="left"><strong>Generation 2</strong></td>
<td align="left"><strong>Generation 3</strong></td>
</tr>
<tr class="even">
<td align="left"><strong>&quot;H&quot;</strong> - Premium/High end</td>
<td align="left"><strong>H1</strong> - R8A7779</td>
<td align="left"><strong>H2</strong> - R8A7790</td>
<td align="left"><strong>H3</strong> - R8A7795</td>
</tr>
<tr class="odd">
<td align="left"><strong>&quot;M&quot;</strong> - Mid range</td>
<td align="left"><strong>M1A</strong> - R8A7778</td>
<td align="left"><ul>
<li><strong>M2-W</strong> - R8A7791</li>
<li><strong>M2-N</strong> - R8A7793</li>
</ul></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><strong>&quot;E&quot;</strong> - Entry class</td>
<td align="left"><strong>E1</strong></td>
<td align="left"><strong>E2</strong> - R8A7794</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left"><strong>&quot;V&quot;</strong> - ADAS</td>
<td align="left"></td>
<td align="left"><strong>V2H</strong> - R8A7792</td>
<td align="left"></td>
</tr>
</tbody>
</table>

# R-Car Boards

## Generation 1

<table>
<caption> Renesas R-Car Gen1 evaluation boards </caption>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left"><strong>Standard</strong></td>
<td align="left"><strong>Low Cost Boards (LCB)</strong></td>
</tr>
<tr class="even">
<td align="left"><strong>R-Car H1</strong></td>
<td align="left">Marzen</td>
<td align="left">Geuze</td>
</tr>
<tr class="odd">
<td align="left"><strong>R-Car M1A</strong></td>
<td align="left">BOCK-W</td>
<td align="left">Milan</td>
</tr>
<tr class="even">
<td align="left"><strong>R-Car E1</strong></td>
<td align="left">Silverstone</td>
<td align="left"></td>
</tr>
</tbody>
</table>

## Generation 2

<table>
<caption> Renesas R-Car Gen2 evaluation boards </caption>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left"><strong>Standard</strong></td>
<td align="left"><strong>Low Cost Boards (LCB)</strong></td>
</tr>
<tr class="even">
<td align="left"><strong>R-Car H2</strong></td>
<td align="left">Lager</td>
<td align="left"><a href="http://elinux.org/R-Car/Boards/Stout" title="R-Car/Boards/Stout"><img src="http://elinux.org/images/6/60/65px-Stout_top.png" alt="65px-Stout top.png" /></a><br /><a href="http://elinux.org/R-Car/Boards/Stout" title="R-Car/Boards/Stout">Start.Now (Stout)</a></td>
</tr>
<tr class="odd">
<td align="left"><strong>R-Car M2-W</strong></td>
<td align="left">Koelsch</td>
<td align="left"><a href="http://elinux.org/R-Car/Boards/Porter" title="R-Car/Boards/Porter"><img src="http://elinux.org/images/thumb/a/a1/65px-Porter_top.png/65px-65px-Porter_top.png" alt="65px-Porter top.png" /></a><br /><a href="http://elinux.org/R-Car/Boards/Porter" title="R-Car/Boards/Porter">Porter</a></td>
</tr>
<tr class="even">
<td align="left"><strong>R-Car M2-N</strong></td>
<td align="left">Gose</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left"><strong>R-Car E2</strong></td>
<td align="left">Alt</td>
<td align="left"><a href="http://elinux.org/R-Car/Boards/SILK" title="R-Car/Boards/SILK"><img src="http://elinux.org/images/b/b5/65px-Silk_top.png" alt="65px-Silk top.png" /></a><br /><a href="http://elinux.org/R-Car/Boards/SILK" title="R-Car/Boards/SILK">SILK</a></td>
</tr>
<tr class="even">
<td align="left"><strong>R-Car V2H</strong></td>
<td align="left">Blanche</td>
<td align="left"></td>
</tr>
</tbody>
</table>

# R-Car Linux

## Upstream

Renesas mainline R-Car Linux tree is maintained by [Simon
Horman](http://horms.org/about_me.shtml)

Start here to get latest/closest upstream kernel:
[git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git](git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git)

    e.g. pull development branch: git clone -b devel git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git

*TBD - add page regarding R-Car upstream development process (including
branches/tags meaning)*

## R-Car Community

-   Mailing list - via kernel.org [linux-sh
    Majordomo](mailto:majordomo@vger.kernel.org?body=subscribe).

Archives available here:
[http://marc.info/?l=linux-sh](http://marc.info/?l=linux-sh) ,
[http://dir.gmane.org/gmane.linux.ports.sh.devel](http://dir.gmane.org/gmane.linux.ports.sh.devel)
,
[http://www.spinics.net/lists/linux-sh/](http://www.spinics.net/lists/linux-sh/)

## LTSI (Long Term Support Initiative)

Renesas SoCs and boards are supported as part of LTSI project -
[http://ltsi.linuxfoundation.org/](http://ltsi.linuxfoundation.org/) .
Refer to
[3.10](http://ltsi.linuxfoundation.org/releases/ltsi-tree/3.10.31-ltsi/stable-release)
and
[3.14](http://ltsi.linuxfoundation.org/releases/ltsi-tree/3.14.24-rc1-ltsi/release-candidate)
baselines

## Renesas Stable R-Car BSP Tree

Stable Renesas R-Car BSP Tree located here:
[git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git](git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git).
Pull latest stable branch.

    for example: bsp/v3.10.31-ltsi/rcar-gen2-1.8.0

# R-Car U-Boot

R-Car U-Boot mainline development is done using
[git://git.denx.de/u-boot-sh.git](git://git.denx.de/u-boot-sh.git) tree.
It is maintained by Nobuhiro Iwamatsu.

    e.g. pull renesas/bsp/rcar-gen2-1.8.0 branch and build U-Boot for Lager/Koelsch/Alt boards
    git clone -b renesas/bsp/rcar-gen2-1.8.0  git://git.denx.de/u-boot-sh.git

build example

    make O=/tmp/build clean
    make O=/tmp/build mrproper
    make O=/tmp/build gose_config
    make O=/tmp/build all

# R-Car Yocto

Renesas Yocto/Poky distribution is maintained by Nobuhiro Iwamatsu.

To get started with Yocto on R-Car Gen2 platform - pull
[git://git.yoctoproject.org/meta-renesas](git://git.yoctoproject.org/meta-renesas)
tree

If you pulled complete Yocto/poky trees, you should be able to kick-off
a build using the 'oe-init-build-env' script in Poky. Update
bblayers.conf by adding the meta-renesas and meta-rcar-gen2 layer. e.g.:

           BBLAYERS ?= " \
                   <path to layer>/poky/meta \
                   <path to layer>/poky/meta-yocto \
                   <path to layer>/poky/meta-yocto-bsp \
                   <path to layer>/meta-renesas \
                   <path to layer>/meta-renesas/meta-rcar-gen2 \
           "

To build a specific target BSP configure the associated machine in
local.conf:

           MACHINE ?= "<supported board name>" (lager, koelsch, gose, alt)

Build the target file system image using bitbake:

           $ bitbake core-image-minimal

# R-Car Tizen

TBD *Renesas R-Car Tizen is already available via tizen.org trees. Add
detailed instructions how to get started with Tizen for R-Car*

# R-Car Android

TBD *This section will be added later*


