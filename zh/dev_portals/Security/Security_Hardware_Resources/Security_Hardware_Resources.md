> 摘自: [eLinux.org](http://eLinux.org/Security_Hardware_Resources "http://eLinux.org/Security_Hardware_Resources")


# 与硬件安全相关的资源



这个页面主要包含与硬件安全加固相关的信息，其中一些信息与CE Linux 论坛成员相关。


## 目录

-   [1 技术/项目主页](#technology-project-pages)
-   [2 解决方案](#solutions)
-   [3 产品](#products)
    -   [3.1 安全芯片](#security-chips)
        -   [3.1.1 TPM (可信平台模块)](#tpm-trusted-platform-module)
    -   [3.2 安全加固的处理器](#security-enhanced-processors)
        -   [3.2.1 ARM(R) TrustZone(R)](#arm-r-trustzone-r)
        -   [3.2.2 OMAP M-Shied](#omap-m-shied)
        -   [3.2.3 Intel(R) 可信无线平台](#intel-r-wireless-trusted-platform)
        -   [3.2.4 CELL](#cell)
-   [4 开源项目与邮件列表](#open-source-projects-mailing-lists)
    -   [4.1 TCG/TPM](#tcg-tpm)

## 技术/项目主页

-   [安全](http://eLinux.org/Security "Security")
-   [与Bootloader相关的资源](http://eLinux.org/Bootloader_Security_Resources "Bootloader Security Resources")

## 解决方案

-	对于固件安全/启动的支持
-	存储安全
-   Cryptographic Accelerators
-   FIPS Compliant True Hardware RNG
-   安全的DMA通道

## 产品

### 安全芯片

#### TPM (可信平台模块)

[TPM 技术规格](https://www.trustedcomputinggroup.org/groups/tpm/)

### 安全加固的处理器

#### ARM(R) TrustZone(R)

[ARM 可信域](http://www.arm.com/products/esd/trustzone_home.html)

#### OMAP M-Shied

[TI 技术白皮书](http://focus.ti.com/pdfs/wtbu/ti_mshield_whitepaper.pdf)

#### Intel(R) 可信无线平台

[IBM 技术白皮书](http://www.intel.com/design/pca/applicationsprocessors/whitepapers/300868.htm)

#### CELL

Cell处理器拥有隔离的SPU运行环境。[CBE 架构文档](http://cell.scei.co.jp/pdf/CBE_Architecture_v10.pdf)

## 开源项目与邮件列表

### TCG/TPM

-   [Linux TPM Device Driver](http://sourceforge.net/projects/tpmdd):
    设备驱动使能TPM芯片，这个芯片的描述在
    [http://www.trustedcomputinggroup.org](http://www.trustedcomputinggroup.org)。
    TPM芯片可以使得我们安全存储，保护我们的密钥与隐私数据，你也可以查看TrouSerS 项目。

目前TPM 驱动已经被包含进kernel主线，并且被分为两个部分：

-   -	通用的 tpm 驱动模块 tpm.ko 处理所有类型的内容
    -   特定的部分使用 tpm\_\<vendor\>.ko 模块

如果你有最近的tpm模块，那么它遵循厂商独立的TIS协议，那么我们应该首选该模块，这个模块叫
tpm\_tis.ko

-   [TrouSers](http://sourceforge.net/projects/trousers): 一个开源的
    TCG Software Stack 实现, 由IBM设计发布。


[目录](http://eLinux.org/Special:Categories "Special:Categories"):

-   [安全的硬件资源](http://eLinux.org/Category:Security_Hardware_Resources "Category:Security Hardware Resources")
-   [安全](http://eLinux.org/Category:Security "Category:Security")

