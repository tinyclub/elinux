> From: [eLinux.org](http://eLinux.org/SELinux "http://eLinux.org/SELinux")


# SELinux



[SELinux -- Security Enhanced Linux](http://www.nsa.gov/selinux/)

## Contents

-   [1 Current works about embedded
    SELinux](#current-works-about-embedded-selinux)
    -   [1.1 Linux kernel](#linux-kernel)
        -   [1.1.1 2.6.18](#2-6-18)
        -   [1.1.2 2.6.24](#2-6-24)
        -   [1.1.3 2.6.25](#2-6-25)
    -   [1.2 SELinux userland](#selinux-userland)
    -   [1.3 BusyBox](#busybox)
    -   [1.4 Policy](#policy)
-   [2 Example of porting](#example-of-porting)
    -   [2.1 Openmoko port](#openmoko-port)
-   [3 Technical documents,
    presentations](#technical-documents-presentations)
-   [4 Remaining issues](#remaining-issues)
    -   [4.1 Policy](#policy-2)
    -   [4.2 xattr](#xattr)
    -   [4.3 Size](#size)

# Current works about embedded SELinux

Many codes are submitted to Linux and userland community.

## Linux kernel

### 2.6.18

Xattr support for jffs2

### 2.6.24

Reducing read/write overhead[[1]](http://lkml.org/lkml/2007/9/13/373)

Reducing memory usage:[[2]](http://marc.info/?t=118767097300001&r=1&w=2)

Improving performance in AVC
miss:[[3]](http://marc.info/?t=119078657600002&r=1&w=2)

### 2.6.25

Audit support for SH:[[4]](http://lkml.org/lkml/2007/11/7/3)

## SELinux userland

Reducing size of library: Merged to libselinux 2.0.35:
[[5]](http://marc.info/?l=selinux&m=118064545200576&w=2)

## BusyBox

Applets related to SELinux are merged to BusyBox in 1.8.0.

Support to assign domain to applets is merged to 1.8.0:
[[6]](http://www.busybox.net/lists/busybox/2007-August/028481.html)

## Policy

SELinux Policy Editor will be helpful. See
[[7]](http://seedit.sourceforge.net/).

If you prefer fine grained configuration, Reference
policy[[8]](http://oss.tresys.com/projects/refpolicy) is better.

# Example of porting

## Openmoko port

[http://code.google.com/p/selinux-openmoko/](http://code.google.com/p/selinux-openmoko/)

[http://www.cse.psu.edu/\~mhassan/openmoko\_se/](http://www.cse.psu.edu/~mhassan/openmoko_se/)

# Technical documents, presentations

-   SELinux for Consumer Electronics Devices, Paper for Ottawa Linux
    Symposium 2008,
    [paper](http://ols.fedoraproject.org/OLS/Reprints-2008/nakamura-reprint.pdf)
    and
    [video](http://free-electrons.com/pub/video/2008/ols/ols2008-yuichi-nakamura-selinux.ogg).
-   Example of porting to SH (Super H) was reported in CELF Jambolee
    \#18:
    [[9]](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree18).
-   Xattr port to jffs2 (Japanese),
    [[10]](http://www.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree11?action=AttachFile&do=get&target=CELF1027.pdf)

# Remaining issues

### Policy

### xattr

logfs, yaffs, cramfs do not support xattr yet.

### Size


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Security](http://eLinux.org/Category:Security "Category:Security")

