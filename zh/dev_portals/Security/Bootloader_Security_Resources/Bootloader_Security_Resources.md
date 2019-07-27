**关注译者公众号**：
<br/>
<img src='../../../../pic/tinylab-wechat.jpg' width='110px'/>
<br/>


> 原文：[eLinux.org](http://elinux.org/Bootloader_Security_Resources.md)<br/>
> 翻译：[@lzz5235](https://github.com/lzz5235)<br/>
> 校订：[@lzufalcon](https://github.com/lzufalcon)<br/>


# Bootloader 安全相关的资源



## 目录

-   [1 概述](#overview)
-   [2 相关技术/项目主页](#technology-project-pages)
-   [3 安全措施的提高](#security-enhancements)
    -   [3.1 可信计算集群 (TCG) ](#trusted-computing-group-tcg)
-   [4 开源项目/邮件列表](#open-source-projects-mailing-lists)
    -   [4.1 RedBoot/eCos](#redboot-ecos)
    -   [4.2 U-Boot](#u-boot)
    -   [4.3 GRUB](#grub)
    -   [4.4 EtherBoot](#etherboot)
-   [5 其他资源](#other-resources)
<span id="overview"></span>

## 概述

本文主要包括 bootloaders 安全相关的信息。
<span id="technology-project-pages"></span>

## 相关技术/项目主页

-   [安全](http://eLinux.org/Security "Security")
-   [硬件安全相关的资源](http://eLinux.org/Security_Hardware_Resources "Security Hardware Resources")
<span id="security-enhancements"></span>

## 安全措施的提高

目前系统由两种方式启动：

-   可信/认证下的启动: 仅仅是报告
-   安全启动: 系统启动期间可以被挂起
<span id="trusted-computing-group-tcg"></span>

### 可信计算集群 (TCG)

TCG 是一套基于硬件的安全解决方案，不仅为 PC 平台打造，而且适用于嵌入式设备。为了理解 TCG，
[ TCG 架构规格概述](https://www.trustedcomputinggroup.org/groups/TCG_1_0_Architecture_Overview.pdf)
这份文档不错，推荐看下。

使用可信平台模块（TPM ）安全芯片和写保护的启动代码，我们可以有效的实现可信启动。不幸的是，现有的 TPM 主要为 PC 平台设计，而且 TPM 需要 LPC 总线。 因此我们必须通过胶合逻辑（glue logic，连接复杂逻辑电路的简单逻辑电路的统称）来部署 TPM 到我们的系统中。
目前 Atmel(R) 平台已经发布了 TPM 芯片, AT97SC3201S 提供了 I2C/SMBus 接口。
<span id="open-source-projects-mailing-lists"></span>

## 开源项目/邮件列表
<span id="redboot-ecos"></span>

### RedBoot/eCos

-   [RedBoot](http://sources.redhat.com/redboot/) 是为嵌入式系统打造的一个完整引导程序环境，它基于 eCos 设计。在 RedBoot 之上做了很多安全增强。
-   [ x86 平台下高健壮性的 Bootloader ](http://www.ece.uvic.ca/~ece499/2003a/group05/High%20Reliability%20Bootloader%20for%20x86%20-%20Final%20Report.htm)
    提供具有二进制代码签名的功能。
<span id="u-boot"></span>

### U-Boot

项目站点：[u-boot](http://sourceforge.net/projects/u-boot/)
<span id="grub"></span>

### GRUB

[GRUB](http://www.gnu.org/software/grub/) 是基于 PC 平台的 bootloader。下面有两个补丁可以使得 GRUB 具有可信启动的功能。

(这种情形，BIOS 必须支持 TCG 可信启动)

-   [University Bochum, Trusted
    Grub](http://www.prosec.rub.de/trusted_grub.html)
-   [TrouSerS, GRUB TCG
    补丁](http://trousers.sourceforge.net/grub.html)

GRUB 提供了密码特性，只有系统管理员才可以启动与系统的交互操作。
<span id="etherboot"></span>

### EtherBoot

[EtherBoot](http://www.etherboot.org/) 是一个软件包，用于创建 ROM 镜像，这些镜像能够通过以太网下载代码到 X86 机器上执行。
[SafeBootMode](http://wiki.etherboot.org/pmwiki.php/Main/SafeBootMode)
意味着任何 下载的 NBI 镜像都会被检查是否包含安全的数字签名，如果没有的话，用户
会收到警告。
<span id="other-resources"></span>

# 其他资源

-   W. A. Arbaugh , D. J. Farber , J. M. Smith, A secure and reliable
    bootstrap architecture, Proceedings of the 1997 IEEE Symposium on
    Security and Privacy, p.65, May 04-07, 1997
-   [面向操作系统安全的 Bootloader ](http://www.missl.cs.umd.edu/sebos.html)
-   [Windows Vista 技术预览 - 安全启动](http://www.microsoft.com/whdc/system/platform/pcdesign/secure-start_tech.mspx)


[目录](http://eLinux.org/Special:Categories "Special:Categories"):

-   [安全](http://eLinux.org/Category:Security "Category:Security")
-   [Bootloader](http://eLinux.org/Category:Bootloader "Category:Bootloader")

