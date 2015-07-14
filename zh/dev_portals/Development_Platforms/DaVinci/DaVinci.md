> From: [eLinux.org](http://eLinux.org/DaVinci "http://eLinux.org/DaVinci")


# DaVinci



[![Davincilogo.gif](http://eLinux.org/images/c/c9/Davincilogo.gif)](http://eLinux.org/File:Davincilogo.gif)

**Texas Instruments DaVinci™ is a family of multimedia system on chip
processors for embedded application.** Most of DaVinci processors based
of of ARM and DSP microprocessor cores.

DaVinci SDK uses [U-Boot](../../.././dev_portals/Development_Platforms/Tegra/Mainline_SW/U-Boot/Tegra/Mainline_SW/U-Boot.md "U-Boot"),
[MontaVista](http://eLinux.org/MontaVista "MontaVista") Linux,
[Open\_Embedded](http://eLinux.org/Open_Embedded "Open Embedded")

## Contents

-   [1 Important resources](#important-resources)
-   [2 Programming](#programming)
-   [3 Hardware Hacks](#hardware-hacks)
-   [4 Mailing Lists and Useful Links](#mailing-lists-and-useful-links)
-   [5 Misc Info](#misc-info)

## Important resources

-   [DaVinci™ Digital Media
    Processors](http://focus.ti.com/paramsearch/docs/parametricsearch.tsp?family=dsp&sectionId=2&tabId=1852&familyId=1300)
-   [http://wiki.davincidsp.com/](http://wiki.davincidsp.com/)
-   [Forums](http://community.ti.com/forums/default.aspx?GroupID=10)
-   [http://feeds.feedburner.com/tidavincitechnology](http://feeds.feedburner.com/tidavincitechnology)
    - news feed
-   [http://www.linux-davinci.info/](http://www.linux-davinci.info/)
-   [Old DaVinci Pages](http://eLinux.org/DaVinci_Old_Pages "DaVinci Old Pages") Obsolete
    and/or Out of Date

## Programming

[![Example
Program.gif](http://eLinux.org/images/3/33/Example_Program.gif)](http://eLinux.org/File:Example_Program.gif)
- Blinking LEDS on the EVM over I2c -
[EVM\_LED\_Blinking.c](http://eLinux.org/EVM_LED_Blinking.c "EVM LED Blinking.c")

[![Example
Program.gif](http://eLinux.org/images/3/33/Example_Program.gif)](http://eLinux.org/File:Example_Program.gif)
- Simple TTY host program to access serial port -
[EVM\_comz.c](http://eLinux.org/EVM_comz.c "EVM comz.c")

[![Example
Program.gif](http://eLinux.org/images/3/33/Example_Program.gif)](http://eLinux.org/File:Example_Program.gif)
- PWM kernel driver (char driver) - [PWM.c](http://eLinux.org/PWM.c "PWM.c") *Good
example for your own device drivers*

[![Example
Program.gif](http://eLinux.org/images/3/33/Example_Program.gif)](http://eLinux.org/File:Example_Program.gif)
- Accessing an I2C temperature sensor -
[temp\_sens.c](http://eLinux.org/Temp_sens.c "Temp sens.c")

[![Example
Program.gif](http://eLinux.org/images/3/33/Example_Program.gif)](http://eLinux.org/File:Example_Program.gif)
- Useful I2C routines - [I2Croutines.c](http://eLinux.org/I2Croutines.c "I2Croutines.c")

[![Guide.jpeg](http://eLinux.org/images/e/e3/Guide.jpeg)](http://eLinux.org/File:Guide.jpeg) -
Overclocking the EVM [EVMoc](http://eLinux.org/EVMoc "EVMoc")

## Hardware Hacks

[![Hack.jpg](http://eLinux.org/images/6/6f/Hack.jpg)](http://eLinux.org/File:Hack.jpg) - Adding a second
MMC / SD slot - [Second MMC / SD](http://eLinux.org/Second_MMC_/_SD "Second MMC / SD")

[![Hack.jpg](http://eLinux.org/images/6/6f/Hack.jpg)](http://eLinux.org/File:Hack.jpg) - Installing some
input buttons - [Input buttonz](http://eLinux.org/Input_buttonz "Input buttonz")

[![Hack.jpg](http://eLinux.org/images/6/6f/Hack.jpg)](http://eLinux.org/File:Hack.jpg) - Adding I2C
devices (e.g. Temp Sensor) - [I2C Mods](http://eLinux.org/I2C_Mods "I2C Mods")

## Mailing Lists and Useful Links

-   [http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source](http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source)
    or the [Searchable
    archive](http://www.mail-archive.com/davinci-linux-open-source@linux.davincidsp.com/)

-   [http://source.mvista.com/git/](http://source.mvista.com/git/) - The
    montavista GIT repository

-   [http://www.applieddata.net/forums/topic.asp?TOPIC\_ID=2024](http://www.applieddata.net/forums/topic.asp?TOPIC_ID=2024)
    - U-Boot configuration scripts for flash filesystems

## Misc Info

-   [DaVinci\_Initrd\_1.0](http://eLinux.org/DaVinci_Initrd_1.0 "DaVinci Initrd 1.0")
-   [DaVinci\_U-boot\_1.0](http://eLinux.org/DaVinci_U-boot_1.0 "DaVinci U-boot 1.0")
-   [DaVinci\_USBHost\_1.0](http://eLinux.org/DaVinci_USBHost_1.0 "DaVinci USBHost 1.0")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [DaVinci](http://eLinux.org/Category:DaVinci "Category:DaVinci")

