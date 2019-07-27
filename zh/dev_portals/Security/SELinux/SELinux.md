**关注译者公众号**：
<br/>
<img src='../../../../pic/tinylab-wechat.jpg' width='110px'/>
<br/>


> 原文：[eLinux.org](http://eLinux.org/SELinux/SELinux.md)<br/>
> 翻译：[@lzz5235](https://github.com/lzz5235)<br/>
> 校订：[@lzufalcon](https://github.com/lzufalcon)

# SELinux



[SELinux -- Security Enhanced Linux](http://www.nsa.gov/selinux/)

## Contents

-   [1 当前嵌入式 Linux 中的 SELinux 工作进展](#current-works-about-embedded-selinux)
    -   [1.1 Linux kernel](#linux-kernel)
        -   [1.1.1 2.6.18](#2-6-18)
        -   [1.1.2 2.6.24](#2-6-24)
        -   [1.1.3 2.6.25](#2-6-25)
    -   [1.2 SELinux 用户空间](#selinux-userland)
    -   [1.3 BusyBox](#busybox)
    -   [1.4 策略](#policy)
-   [2 相关移植的实例](#example-of-porting)
    -   [2.1 Openmoko 的移植](#openmoko-port)
-   [3 技术文档与技术演示](#technical-documents-presentations)
-   [4 遗留的问题](#remaining-issues)
    -   [4.1 策略](#policy-2)
    -   [4.2 xattr](#xattr)
		[4.3 大小](#size)
<span id="current-works-about-embedded-selinux"></span>

# 当前嵌入式 Linux 中的 SELinux 工作进展

目前许多代码已经提交到 Linux 和用户空间社区。
<span id="linux-kernel"></span>

## Linux Kernel
<span id="2-6-18"></span>

### 2.6.18

Xattr 对 jffs2 文件系统的支持
<span id="2-6-24"></span>

### 2.6.24

减轻读写开销：[[1]](http://lkml.org/lkml/2007/9/13/373)

减轻内存使用量：[[2]](http://marc.info/?t=118767097300001&r=1&w=2)

改善 AVC miss 性能：[[3]](http://marc.info/?t=119078657600002&r=1&w=2)
<span id="2-6-25"></span>

### 2.6.25

Super H 上对审计功能（Audit）的支持：[[4]](http://lkml.org/lkml/2007/11/7/3)
<span id="selinux-userland"></span>

## SELinux 用户空间

减少 SELinux 库的大小：在 libselinux 2.0.35 时合并：
[[5]](http://marc.info/?l=selinux&m=118064545200576&w=2)
<span id="busybox"></span>

## BusyBox

与 SELinux 相关的代码被合并到 BusyBox 1.8.0 中。

Support to assign domain to applets is merged to 1.8.0：
[[6]](http://www.busybox.net/lists/busybox/2007-August/028481.html)
<span id="policy"></span>

## 策略

SELinux 策略编辑器非常有用。 请看：[[7]](http://seedit.sourceforge.net/)。

如果我们需要更细粒度的配置，请参考以下策略：[[8]](http://oss.tresys.com/projects/refpolicy) 。
<span id="example-of-porting"></span>

# 相关移植的实例
<span id="openmoko-port"></span>

## Openmoko 移植

[http://code.google.com/p/selinux-openmoko/](http://code.google.com/p/selinux-openmoko/)

[http://www.cse.psu.edu/\~mhassan/openmoko\_se/](http://www.cse.psu.edu/~mhassan/openmoko_se/)
<span id="technical-documents-presentations"></span>

# 技术文档与技术演示

-   面向消费者电子设备的 SELinux, Ottawa Linux
    Symposium 2008 论文,
    [论文](http://ols.fedoraproject.org/OLS/Reprints-2008/nakamura-reprint.pdf)
    and
    [录像](http://free-electrons.com/pub/video/2008/ols/ols2008-yuichi-nakamura-selinux.ogg)。
-   移植到 SH 的例子 (Super H) ，这个例子被 CELF Jambolee 所报道。
    \#18：
    [[9]](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree18)。
-   将 Xattr 移植到 jffs2 文件系统上 (日语)。
    [[10]](http://www.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree11?action=AttachFile&do=get&target=CELF1027.pdf)
<span id="remaining-issues"></span>

# 遗留的问题
<span id="policy-2"></span>

### 策略
<span id="xattr"></span>

### xattr

logfs, yaffs, cramfs 三种文件系统还没有支持 xattr。
<span id="size"></span>

### 大小


[目录](http://eLinux.org/Special:Categories "Special:Categories")：

-   [安全](http://eLinux.org/Category:Security "Category:Security")

