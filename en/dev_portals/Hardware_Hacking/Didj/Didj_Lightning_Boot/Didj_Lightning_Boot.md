> From: [eLinux.org](http://eLinux.org/Didj_Lightning_Boot "http://eLinux.org/Didj_Lightning_Boot")


# Didj Lightning Boot





## Contents

-   [1 Summary](#summary)
-   [2 Lightning Boot Versions](#lightning-boot-versions)
    -   [2.1 Version 1.4](#version-1-4)
    -   [2.2 Version 1.6](#version-1-6)
    -   [2.3 Version 2.0](#version-2-0)
    -   [2.4 Version 2.1](#version-2-1)
-   [3 UART Booting](#uart-booting)

## Summary

Lightning Boot is the boot loader used by the Didj. Several
modifications have been made to the stock Lightning Boot (Version 1.0)
to enhance its abilities. A menu screen has been added, with several
options. These options have been expanded on each version, to include
such things as booting off SD card, loading U-Boot or zImage off of SD,
etc.

[Lightning Boot
Options](http://eLinux.org/Didj_Lightning_Boot_Options "Didj Lightning Boot Options") for
a more detailed explanation of what each option does.

## Lightning Boot Versions

#### Version 1.4

-   [Lightning Boot 1.4
    Binaries](http://files.poxlib.org/LeapFrog/elinux_downloads/lightning-boot-1.4.tar.bz2)
-   [Lightning Boot 1.4
    Sources](http://files.poxlib.org/LeapFrog/elinux_downloads/lightning-boot_1.4_source.tar.bz2)
    -   Menu Screen
    -   Boot Options
        -   Normal boot from NAND
        -   Download via Xmodem
        -   Load U-Boot from SD
        -   Load zImage from SD

#### Version 1.6

-   [Lightning Boot 1.6
    Binary](http://dl.dropbox.com/u/12747635/Didj_LX/lightning%20boot/lightning-boot-1.6NAND.tar.gz)
    -   Boot Options
        -   Includes 1.4 Options
        -   Boot Kernel and Rootfs from SD
        -   Boot from NAND with custom cmdline

#### Version 2.0

-   [Lightning-boot 2.0 Git Repo, Binary
    included](https://github.com/Reggi3/lightning-boot-2.0)
    -   Boot Options
        -   Includes 1.6 Options
        -   Autoboot zimage from SD
        -   Load Lightning-Boot from SD

#### Version 2.1

-   [Lightning Boot 2.1 Git
    Repo](https://github.com/Julspower/lightning-boot-2.1)
    -   Boot Options
        -   Includes 2.0 Boot Options
        -   Set default boot option

## UART Booting

-   [Didj UART Boot](http://eLinux.org/Didj_UART_Boot "Didj UART Boot")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

