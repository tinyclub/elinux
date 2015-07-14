> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_Emerald_Boot "http://eLinux.org/Leapster_Explorer:_Emerald_Boot")


# Leapster Explorer: Emerald Boot



## Contents

-   [1 Summary](#summary)
-   [2 Versions](#versions)
    -   [2.1 Version 1.1.0](#version-1-1-0)
    -   [2.2 Version 1.1.46](#version-1-1-46)
    -   [2.3 Version 2.0.2](#version-2-0-2)
    -   [2.4 Version 2.2.2](#version-2-2-2)
-   [3 UART Booting](#uart-booting)

## Summary

Emerald Boot is the name of the boot loader that comes installed on the
Leapster Explorer. This is the software that takes care of getting the
CPU up and running, and loads the kernel for execution.

## Versions

LeapFrog have made no provisions to upgrade Emerald Boot on the Leapster
Explorer. The only way to install a different version, is to flash it to
the NOR storage yourself. The Emerald Boot source code is included in
the LeapFrog releases. To get the source, download the LF-Linux-\*
archive of the release you desire to use.

#### Version 1.1.0

[Explorer
Sources](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#Explorer "LeapFrog Pollux Platform: Source Code")
(LF-Linux-6905-20100610-0915.tar.gz)



#### Version 1.1.46

[Explorer
Sources](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#Explorer "LeapFrog Pollux Platform: Source Code")
(LF-Linux-8291-20101026-1425.tar.gz)

[UART Boot Patch
V1.1.46](http://files.poxlib.org/LeapFrog/elinux_downloads/emerald-boot-supplement_v1.1.46.tar.gz)

#### Version 2.0.2

[LeapPad Explorer
Sources](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#LeapPad_Explorer "LeapFrog Pollux Platform: Source Code")
(LF-Linux-2503-20110602-1237.tar.gz)

[UART/AutoSD0 Boot Patch
V2.0.2](http://files.poxlib.org/LeapFrog/elinux_downloads/emerald-boot-supplement_v2.0.2.tar.gz)

[Format SD Card for AutoSD0
Boot](http://eLinux.org/Leapster_Explorer:_Emerald_Boot_SD0_Autoboot "Leapster Explorer: Emerald Boot SD0 Autoboot")

#### Version 2.2.2

[LeapPad Explorer
Sources](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#LeapPad_Explorer "LeapFrog Pollux Platform: Source Code")
(LF-Linux-2826-20111215-1417.tar.gz)

[NAND, Didj, UART Patch
V2.2.2](http://files.poxlib.org/LeapFrog/elinux_downloads/emerald-boot-supplement_v2.2.2.tar.gz)

## UART Booting

While strictly speaking UART booting of Emerald Boot is not possible on
the Pollux because of the file size, and hardware restrictions. But if
you are handy with a soldering iron, the hardware restrictions can be
dealt with, and through the use of a helper program, the boot loader can
be uploaded and ran, in a very similar fashion as UART booting. Making
testing non-destructive and a lot easier.

[UART Booting How
To](http://eLinux.org/Leapster_Explorer:_UART_Boot "Leapster Explorer: UART Boot")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")

