> From: [eLinux.org](http://eLinux.org/U-Boot "http://eLinux.org/U-Boot")


# Tegra/Mainline SW/U-Boot


\< [Tegra](http://eLinux.org/Tegra "Tegra")‎ | [Mainline
SW](http://eLinux.org/Tegra/Mainline_SW "Tegra/Mainline SW")


NVIDIA Tegra SoCs are well supported by mainline U-Boot.

U-Boot releases may be obtained from:

-   [ftp://ftp.denx.de/pub/u-boot/](ftp://ftp.denx.de/pub/u-boot/)
    releases, via download.
-   [http://git.denx.de/?p=u-boot.git;a=summary](http://git.denx.de/?p=u-boot.git;a=summary)
    releases and overall development code, via git.
-   [http://git.denx.de/?p=u-boot/u-boot-tegra.git;a=summary](http://git.denx.de/?p=u-boot/u-boot-tegra.git;a=summary)
    Tegra-specific latest development code, via git.

Features that already work are:

-   It boots!
-   Serial console.
-   SD/eMMC.
-   USB2 Host:
    -   USB networking for network booting.
    -   USB keyboard enabled on some boards.
-   Display controller, for some SoCs and boards - mainly Tegra20/30.
-   `bootz`, `sysboot`, `pxe` commands, shell, and scripting available
    for easy distro booting support.
-   Extremely basic PMIC support necessary to boot the main CPUs.
-   I2C master.
-   SPI master (e.g. for boot flash programming).
-   NAND (Tegra20 only, for boot flash programming).
-   I2C slave (Toshiba AC100 specific NVEC keyboard support).

A probably-incomplete list of features that are not yet implemented is:

-   Advanced (high-speed) transfer modes for SD and eMMC. IO voltage
    scaling.
-   PCIe (e.g. for PCIe-based network devices on some boards).
-   USB2 device mode and OTG. (device mode support is work-in-progress,
    and nearly complete).
-   USB3 controller.
-   SATA.
-   SKU awareness (SKU-specific clock and thermal limits).
-   POR (Plan Of Record) clocks.
-   HDMI display.
-   LCD panel support on many boards (especially Tegra114 and later).


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [NVIDIA](http://eLinux.org/index.php?title=Category:NVIDIA&action=edit&redlink=1 "Category:NVIDIA (page does not exist)")
-   [Tegra](http://eLinux.org/index.php?title=Category:Tegra&action=edit&redlink=1 "Category:Tegra (page does not exist)")
-   [U-Boot](http://eLinux.org/Category:U-Boot "Category:U-Boot")

