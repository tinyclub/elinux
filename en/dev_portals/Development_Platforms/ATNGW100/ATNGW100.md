> From: [eLinux.org](http://eLinux.org/ATNGW100 "http://eLinux.org/ATNGW100")


# ATNGW100



The NGW100 is a quite cheap (\~100USD, 50 for students) development kit
for the [AVR32](http://eLinux.org/Processors#AVR32 "Processors") processor.

Features:

-   AT32AP700x CPU, 140Mhz
-   Input Voltage 9-15V
-   SD/MMC Cardreader
-   2x Ethernet
-   1x RS232
-   3x Expansion Headers
-   Device USB (offers access to the sdcard)
-   32MB Ram

Through the expansion headers it is possible to attach an lcd display to
it, as well as ps/2 keyboard.

It uses [U-Boot](../../.././dev_portals/Development_Platforms/Tegra/Mainline_SW/U-Boot/Tegra/Mainline_SW/U-Boot.md "U-Boot") as a bootloader.

[Buildroot](http://eLinux.org/Toolchains#Buildroot "Toolchains") offers out-of-the box
support for this board. AVR32 support was removed in 02.2015.
[OpenADK](http://eLinux.org/Toolchains#OpenADK "Toolchains") can be used instead.



## Some /proc files

    ~ # cat /proc/mtd
    dev:    size   erasesize  name
    mtd0: 00020000 00010000 "u-boot"
    mtd1: 007d0000 00010000 "root"
    mtd2: 00010000 00010000 "env"
    mtd3: 00840000 00000420 "spi0.0-AT45DB642x"



    ~ # cat /proc/cpuinfo
    processor       : 0
    chip type       : AT32AP700x revision C
    cpu arch        : AVR32B revision 1
    cpu core        : AP7 revision 0
    cpu MHz         : 140.000
    i-cache         : 16K (4 ways x 128 sets x 32)
    d-cache         : 16K (4 ways x 128 sets x 32)
    features        : dsp simd ocd perfctr java
    bogomips        : 281.93

## Projects

[NGW100-RTC](http://eLinux.org/NGW100-RTC "NGW100-RTC") - Add an external RTC to the
NGW100



# = Further reading

[http://www.avrfreaks.net/wiki/index.php/Documentation:NGW](http://www.avrfreaks.net/wiki/index.php/Documentation:NGW)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")

