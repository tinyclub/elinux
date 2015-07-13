> From: [eLinux.org](http://eLinux.org/Devkit8000_DVSDK "http://eLinux.org/Devkit8000_DVSDK")


# Devkit8000 DVSDK



This page gives some guide and suggestions on DVSDK on
[Embest](http://www.armkits.com)
[Devkit8000](http://www.armkits.com/Product/devkit8000.asp) board.

## Contents

-   [1 DVSDK Demonstration](#dvsdk-demonstration)
    -   [1.1 Introduction](#introduction)
    -   [1.2 Preparations](#preparations)
    -   [1.3 Demonstration](#demonstration)
-   [2 BSP Development](#bsp-development)
-   [3 DVSDK not working on
    Devkit8000](#dvsdk-not-working-on-devkit8000)

# DVSDK Demonstration

## Introduction

1. openGL drivers support openGL ES1.0, openGL ES2.0 and openGL VR;
 2. At present DVSDK supports H.264, MPEG-2 and MPEG-4 video decoding
formats, H.264, MPEG-4 video encoding formats, mp3, AAC and RCA audio
decoding formats, JPEG image decompressing format.

## Preparations

1. One [DevKit8000](http://www.armkits.com/Product/devkit8000.asp)
board;
 2. One SD card for demonstrating DVSDK;
 3. One U disk (above 256MB);
 4. One DVI monitor (with one HDMI to DVI-D cable);
 5. One USB HUB (with external power supply);
 6. One USB mini-A to USB A (female connector) cable;
 7. One serial convert cable;
 8. One 5V power adapter.

## Demonstration

1. Please input video and audio demonstration files (data folder) to U
disk;
 2. Connect [Devkit8000](http://www.armkits.com/Product/devkit8000.asp)
board to serial interface, USB OTG port(using USB mini-A to USB A female
connector cable), HDMI interface (using HDMI to DVI-D cable) and audio
interface of PC;
 3. Connect USB Hub and insert U Disk to USB Hub;
 4. Connect 5V/2A power adapter and insert SD card for demonstration,
power on the system;
 5. OPENGL Demonstration:
 After system booting up, 7 demonstration program will automatically
boot and display 7 different 3D cartoons, all examples are accelerated
through SGX graphics accelerator;
 Note:
 If OPENGL has unexpected halted during demonstration, please open the
serial terminal and input "ctrl+c", the OPENGL demonstration will go on;

 6. DVSDK Demonstration
 After OPENGL demonstration finished, please input following commands in
serial terminal:
 ./dvsdk\_demo
 You will see video display on monitor and hear invoice from earphone,
also some information from terminal during video and audio decompressing
process such as video resolution, frame rate, bit rate, unilization rate
of GPP and DSP, etc.

Remark:
 If user wants to play their own files, please input following commands
after getting into system:
 [root@OMAP3EVM /]\# cd opt/dvsdk/
 [root@OMAP3EVM dvsdk]\# ./loadmodules.sh
 [root@OMAP3EVM dvsdk]\# ./decode -v
**/opt/dvsdk/data/videos/davincieffect\_ntsc\_1.m4v** -a
**/opt/dvsdk/data/sounds/davincieffect\_HEv2.aac** -O dvi -y 2

# BSP Development

-   Relative to BSP development:
    [http://elinux.org/BeagleBoard/DSP\_Howto](http://elinux.org/BeagleBoard/DSP_Howto)
-   DSP development by TI:
    [http://wiki.omap.com/index.php?title=DM3xx\_Gstreamer\_Solution](http://wiki.omap.com/index.php?title=DM3xx_Gstreamer_Solution)
-   TI released Linux DVSDK on OMAP3:

[http://www.linuxforum.net/forum/showflat.php?Cat=&Board=TI&Number=727305&page=0&view=collapsed&sb=5&o=0&fpart=](http://www.linuxforum.net/forum/showflat.php?Cat=&Board=TI&Number=727305&page=0&view=collapsed&sb=5&o=0&fpart=)

# DVSDK not working on Devkit8000

TI has not provided any support for Devkit8000. So how to create uImage
for Devkit8000? As there is no configuration file for Devkit8000 in
kernel?


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [Devkit8000](http://eLinux.org/Category:Devkit8000 "Category:Devkit8000")

