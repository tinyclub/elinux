> From: [eLinux.org](http://eLinux.org/TPM "http://eLinux.org/TPM")


# Security Hardware Resources


(Redirected from [TPM](http://eLinux.org/index.php?title=TPM&redirect=no "TPM"))


This page has information about hardware based security enhancement,
which is of interest to CE Linux Forum members

## Contents

-   [1 Technology/Project pages](#technology-project-pages)
-   [2 Solutions](#solutions)
-   [3 Products](#products)
    -   [3.1 Security chips](#security-chips)
        -   [3.1.1 TPM (Trusted Platform
            Module)](#tpm-trusted-platform-module)
    -   [3.2 Security enhanced
        processors](#security-enhanced-processors)
        -   [3.2.1 ARM(R) TrustZone(R)](#arm-r-trustzone-r)
        -   [3.2.2 OMAP M-Shied](#omap-m-shied)
        -   [3.2.3 Intel(R) Wireless Trusted
            Platform](#intel-r-wireless-trusted-platform)
        -   [3.2.4 CELL](#cell)
-   [4 Open Source Projects/Mailing
    Lists](#open-source-projects-mailing-lists)
    -   [4.1 TCG/TPM](#tcg-tpm)

## Technology/Project pages

-   [Security](http://eLinux.org/Security "Security")
-   [Bootloader Security
    Resources](http://eLinux.org/Bootloader_Security_Resources "Bootloader Security Resources")

## Solutions

-   Secure Flashing/Booting Support
-   Secure Storage
-   Cryptographic Accelerators
-   FIPS Compliant True Hardware RNG
-   Secure DMA Channels

## Products

### Security chips

#### TPM (Trusted Platform Module)

[TPM Specifications](https://www.trustedcomputinggroup.org/groups/tpm/)

### Security enhanced processors

#### ARM(R) TrustZone(R)

[ARM Trustzone](http://www.arm.com/products/esd/trustzone_home.html)

#### OMAP M-Shied

[TI White
Paper](http://focus.ti.com/pdfs/wtbu/ti_mshield_whitepaper.pdf)

#### Intel(R) Wireless Trusted Platform

[IBM White
Paper](http://www.intel.com/design/pca/applicationsprocessors/whitepapers/300868.htm)

#### CELL

The Cell processor has an 'isolated' SPU runtime environment. [CBE
Architecture
document](http://cell.scei.co.jp/pdf/CBE_Architecture_v10.pdf)

## Open Source Projects/Mailing Lists

### TCG/TPM

-   [Linux TPM Device Driver](http://sourceforge.net/projects/tpmdd):
    Device driver to enable the TPM chip as described by specifications
    at
    [http://www.trustedcomputinggroup.org](http://www.trustedcomputinggroup.org).
    The TPM chip will enable you to use hardware to securely store and
    protect your keys and personal data. See also the TrouSerS project.

The TPM device drivers are already included in the mainline kernel and
is split up into two parts:

-   -   the generic tpm driver module tpm.ko which handles all the
        common stuff
    -   a vendor specific part tpm\_\<vendor\>.ko

If you have a recent tpm module, it is quite likely that it follows the
vendor independent TIS Protocol specified by the TCG, which should be
preferred over the vendor modules. This module is called tpm\_tis.ko

-   [TrouSers](http://sourceforge.net/projects/trousers): An open-source
    TCG Software Stack implementation, created and released by IBM.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Security Hardware
    Resources](http://eLinux.org/Category:Security_Hardware_Resources "Category:Security Hardware Resources")
-   [Security](http://eLinux.org/Category:Security "Category:Security")

