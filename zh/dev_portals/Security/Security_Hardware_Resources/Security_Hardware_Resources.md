> 原文：[eLinux.org](http://eLinux.org/Security_Hardware_Resources.md)<br/> 
> 翻译：[@lzz5235](https://github.com/lzz5235)<br/>
> 校订：[@lzufalcon](https://github.com/lzufalcon)


# 硬件安全相关的资源


本文主要包含基于硬件的安全增强信息，这些信息是 CE Linux 论坛成员所感兴趣的。


## 目录

-   [1 技术/项目主页](#technology-project-pages)
-   [2 解决方案](#solutions)
-   [3 产品](#products)
    -   [3.1 安全芯片](#security-chips)
        -   [3.1.1 TPM (可信平台模块)](#tpm-trusted-platform-module)
    -   [3.2 安全增强的处理器](#security-enhanced-processors)
        -   [3.2.1 ARM(R) TrustZone(R)](#arm-r-trustzone-r)
        -   [3.2.2 OMAP M-Shied](#omap-m-shied)
        -   [3.2.3 Intel(R) 无线可信平台](#intel-r-wireless-trusted-platform)
        -   [3.2.4 CELL](#cell)
-   [ 4 开源项目与邮件列表 ](#open-source-projects-mailing-lists)
    -   [ 4.1 TCG/TPM ](#tcg-tpm)

## 技术/项目主页

-   [安全](http://eLinux.org/Security "Security")
-   [Bootloader 安全资源](http://eLinux.org/Bootloader_Security_Resources "Bootloader Security Resources")

## 解决方案

-   对于固件安全/启动的支持
-   存储安全
-   密码加速器
-   符合 FIPS 标准的硬件 RNG
-   安全 DMA 通道

## 产品

### 安全芯片

#### TPM (可信平台模块)

[TPM 技术指标](https://www.trustedcomputinggroup.org/groups/tpm/)

### 安全增强的处理器

#### ARM(R) TrustZone(R)

[ARM 可信域](http://www.arm.com/products/esd/trustzone_home.html)

#### OMAP M-Shied

[TI 白皮书](http://focus.ti.com/pdfs/wtbu/ti_mshield_whitepaper.pdf)

#### Intel(R) 无线可信平台

[IBM 白皮书](http://www.intel.com/design/pca/applicationsprocessors/whitepapers/300868.htm)

#### CELL

Cell 处理器拥有隔离的 SPU 运行时环境。[CBE 架构文档](http://cell.scei.co.jp/pdf/CBE_Architecture_v10.pdf)

## 开源项目与邮件列表

### TCG/TPM

-   [Linux TPM Device Driver](http://sourceforge.net/projects/tpmdd)：
    通过设备驱动使能 TPM 芯片，设备驱动的技术指标描述在[http://www.trustedcomputinggroup.org](http://www.trustedcomputinggroup.org)。TPM 芯片将使您能够使用硬件来安全地存储和保护您的密钥和个人数据。您也可以查看 TrouSerS 项目。

目前 TPM 驱动已经被包含进 kernel 主线，并且被分为两个部分：

-   -	通用的 tpm 驱动模块 tpm.ko，用于处理所有公共部分
    -   供应商特定部分的 `tmp_<vendor>.ko`

如果你有一个最近的 tpm 模块，那么它很有可能遵循供应商独立的 TIS 协议，而这个TIS 协议又是由TCG 制定，那么我们应该首选该供应商模块，这个模块被称为 `tpm_tis.ko` 。

-   [TrouSers](http://sourceforge.net/projects/trousers): 一个开源 TCG 软件栈的实现，它由 IBM 创建和发布。


[目录](http://eLinux.org/Special:Categories "Special:Categories"):

-   [硬件安全相关的资源](http://eLinux.org/Category:Security_Hardware_Resources "Category:Security Hardware Resources")
-   [安全](http://eLinux.org/Category:Security "Category:Security")

