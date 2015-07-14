> From: [eLinux.org](http://eLinux.org/Linux_Tiny "http://eLinux.org/Linux_Tiny")


# Linux Tiny



## Contents

-   [1 Introduction](#introduction)
-   [2 Resources](#resources)
    -   [2.1 Patches](#patches)
    -   [2.2 Mailing Lists](#mailing-lists)
    -   [2.3 Presentations](#presentations)
-   [3 News](#news)
-   [4 Old patch releases](#old-patch-releases)
    -   [4.1 Old release downloads](#old-release-downloads)
    -   [4.2 Installation Instructions](#installation-instructions)
    -   [4.3 Auxiliary tools (for Linux-tiny
        developers)](#auxiliary-tools-for-linux-tiny-developers)
-   [5 How to use](#how-to-use)
-   [6 Test Project and Results](#test-project-and-results)
-   [7 Old usage notes](#old-usage-notes)
-   [8 Ideas and patch candidates](#ideas-and-patch-candidates)
-   [9 Original Announcements and
    e-mail](#original-announcements-and-e-mail)

## Introduction

The goal of the linux-tiny project is to reduce the memory and disk
footprint of the mainstream Linux kernel, as well as to add features to
aid working on small systems. Target users are developers of embedded
system and users of small or legacy machines such as 386s and handheld
devices.

Patch releases against the mainstream Linux kernel have been
discontinued. Instead of spending a valuable amount of time carrying
patches forward from one kernel version to the next, we chose to focus
on a few patches and spend our time trying to get them merged into the
mainline kernel.

Visit the [FAQ](http://eLinux.org/Tiny-FAQ "Tiny-FAQ") for more information.

## Resources

### Patches

-   Available on Gitorious
    ([HTTP](https://gitorious.org/tinylab/tinylinux),
    [GIT](git://gitorious.org/tinylab/tinylinux.git)). This repository
    is currently not maintained.

### Mailing Lists

-   [Archive of linux-tiny](http://selenic.com/pipermail/linux-tiny/)

### Presentations

-   Kernel Size Report presentation by Matt Mackall at Embedded Linux
    Conference in April 2008.
    [Video](http://free-electrons.com/pub/video/2008/elc/elc2008-matt-mackall-kernel-size.ogg)
    is available.
-   [Linux-tiny
    presentation](http://free-electrons.com/pub/conferences/2008/elc/linux-tiny.pdf)
    by Thomas Petazzoni ([Free Electrons](http://free-electrons.com)) at
    Embedded Linux Conference in April 2008.
    [Video](http://free-electrons.com/pub/video/2008/elc/elc2008-thomas-petazzoni-linux-tiny.ogg)
    is available.
-   [Linux-tiny
    presentation](http://free-electrons.com/articles/linux-tiny/) by
    Michael Opdenacker ([Free Electrons](http://free-electrons.com)) at
    Embedded Linux Conference Europe in November 2007.
-   [http://elinux.org/images//8/83/Pdf.gif](http://elinux.org/images//8/83/Pdf.gif)
    [Linux-tiny
    revival](http://eLinux.org/images/5/5c/Linux-tiny-revival-jamboree16.pdf "Linux-tiny-revival-jamboree16.pdf")
    [http://elinux.org/images/d/da/Info\_circle.png](http://elinux.org/File:Linux-tiny-revival-jamboree16.pdf)
    presentation given by Tim Bird at the Japan Technical Jamboree \#16
    in August 2007
-   [Linux-tiny
    Presentation](http://tree.celinuxforum.org/CelfPubWiki/TechConference2005Docs?action=AttachFile&do=get&target=linux-tiny.pdf)
    by Matt Mackall, delivered at CELF's Technical Conference in April
    2005.

## News

-   A LWN.net article is at: [LWN Article (Sep 2007), By Jake
    Edge](http://lwn.net/Articles/251573/)
-   Michael Opdenacker was announced as the new maintainer.
    -   See the [project revival message to the kernel mailing
        list](http://lkml.org/lkml/2007/9/19/342)
-   A Linux Weekly News article (2003) about the project is at: [LWN
    Article](http://lwn.net/Articles/63516/)

## Old patch releases

### Old release downloads

-   Linux 2.6.23.0:
    -   [Media:Tiny-quilt-2.6.23-0.tar.bz2](http://eLinux.org/images/3/3c/Tiny-quilt-2.6.23-0.tar.bz2 "Tiny-quilt-2.6.23-0.tar.bz2")
-   Linux 2.6.22.5:
    -   [Media:Tiny-quilt-2.6.22.5-1.tar.gz](http://eLinux.org/images/7/79/Tiny-quilt-2.6.22.5-1.tar.gz "Tiny-quilt-2.6.22.5-1.tar.gz")
-   Linux 2.6.22.1:
    -   [Media:Tiny-quilt-2.6.22.1-1.tar.gz](http://eLinux.org/images/0/0e/Tiny-quilt-2.6.22.1-1.tar.gz "Tiny-quilt-2.6.22.1-1.tar.gz")
-   Linux 2.6.16.19
    -   broken-out patchset:
        [2.6.16.19-tiny1-broken-out](http://eLinux.org/images/8/82/2.6.16.19-tiny1-broken-out.tar.bz2 "2.6.16.19-tiny1-broken-out.tar.bz2")
    -   Porting notes:
        [notes](http://eLinux.org/images/b/b9/LinuxtinyNOTES.txt "LinuxtinyNOTES.txt")
-   Linux 2.6.0 to 2.6.14:
    -   Older Linux-tiny patchsets can be downloaded from: [Linux Tiny
        Patchset](http://selenic.com/tiny/)

### Installation Instructions

These instructions were for the Linux-tiny release for 2.6.23. Adjust
accordingly for a different kernel version.

To apply the above patches, you need the referenced kernel (2.6.23) and
[quilt](http://savannah.nongnu.org/projects/quilt)
([overview](http://www.suse.de/~agruen/quilt.pdf)). Follow these steps:

     $ wget http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.23.tar.bz2
     $ tar -xjf linux-2.6.23.tar.bz2
     $ wget http://elinux.org/images/3/3c/Tiny-quilt-2.6.23-0.tar.bz2
     $ cd linux-2.6.23
     $ tar -xjf ../Tiny-quilt-2.6.23-0.tar.bz2
     $ quilt push -a
     $ cd ..
     $ mv linux-2.6.23 linux-2.6.23-tiny1

### Auxiliary tools (for Linux-tiny developers)

Here is a short shell script for making a tiny-quilt release:
[Media:release-tiny](http://eLinux.org/images/1/12/Release-tiny "Release-tiny")

## How to use

In the [Kernel Size Tuning
Guide](../../.././dev_portals/System_Size/Kernel_Size_Tuning_Guide/Kernel_Size_Tuning_Guide.md "Kernel Size Tuning Guide"), there is a
lot of information about how to measure kernel size, and how to use the
kernel patches and configuration items provided by Linux-tiny.



## Test Project and Results

There is a test for Linux-tiny (and kernel configuration option results,
in general). Some test results from this test were previously available
from the CE Linux Forum test lab, at:
[http://testlab.celinuxforum.org/otlwiki/ConfigSizeTestResults](http://testlab.celinuxforum.org/otlwiki/ConfigSizeTestResults)
(link is now broken).

The CELF System Size working group has worked extensively with the
Linux-tiny patch set. There is a script to produce a report of size
reductions for the individual patches in the patchset, and results from
various vendors about their use of Linux-tiny. See [Linux Tiny Test
Project](http://eLinux.org/Linux_Tiny_Test_Project "Linux Tiny Test Project")

## Old usage notes

There are some miscellaneous usage notes at: [Linux Tiny
Notes](http://eLinux.org/Linux_Tiny_Notes "Linux Tiny Notes")

## Ideas and patch candidates

See [Linux Tiny Patch
Ideas](http://eLinux.org/Linux_Tiny_Patch_Ideas "Linux Tiny Patch Ideas")



## Original Announcements and e-mail

The original (Dec 11, 2003) announcement about the patchset, to the
kernel mailing list, is available here:

-   [Announcement](http://lwn.net/Articles/62858/)

Here are some other announcements from Matt Mackall to LKML:

-   [2.6.0-tiny1 Dec 27,
    2003](http://www.ussg.iu.edu/hypermail/linux/kernel/0312.3/0454.html)
-   [2.6.1-rc1-tin1 Jan 2,
    2004](http://www.ussg.iu.edu/hypermail/linux/kernel/0401.0/0403.html)
-   [2.6.1-rc1-tiny2 Jan 6,
    2004](http://www.ussg.iu.edu/hypermail/linux/kernel/0401.0/1256.html)

Recent discussion thread on lkml is summarized at: [LKML Thread
Summary](http://kt.zork.net/kernel-traffic/latest.html#6). The thread is
available at
[here](http://www.google.com/groups?hl=en&lr=&ie=UTF-8&threadm=19Kuz-872-3%40gated-at.bofh.it&rnum=1&prev=/groups%3Fhl%3Den%26lr%3D%26ie%3DUTF-8%26selm%3D19Kuz-872-3%2540gated-at.bofh.it).

Note that currently, the smallest kernel that is reported in this thread
is 197K compressed.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux Tiny](http://eLinux.org/Category:Linux_Tiny "Category:Linux Tiny")

