> From: [eLinux.org](http://eLinux.org/Devkit8000_FAQ "http://eLinux.org/Devkit8000_FAQ")


# Devkit8000 FAQ



This page mainly summarizes solutions to some main problems during the
development of [Embest](http://www.armkits.com)
[Devkit8000](http://eLinux.org/Devkit8000 "Devkit8000"). Hope it would give you some
help.

## Contents

-   [1 Hardware problem](#hardware-problem)
    -   [1.1 If you had erased NAND flash, how to boot the
        system?](#if-you-had-erased-nand-flash-how-to-boot-the-system-3f)
    -   [1.2 How to use USB OTG as Host or
        Device?](#how-to-use-usb-otg-as-host-or-device-3f)
    -   [1.3 How to boot from SD card?](#how-to-boot-from-sd-card-3f)
    -   [1.4 How to debug DSP and ARM on
        Devkit8000?](#how-to-debug-dsp-and-arm-on-devkit8000-3f)
    -   [1.5 What's the RTC battery model can be used for
        Devkit8000?](#what-s-the-rtc-battery-model-can-be-used-for-devkit8000-3f)
-   [2 Linux problem](#linux-problem)
    -   [2.1 If the Nand Flash has been erased, how to restore
        it?](#if-the-nand-flash-has-been-erased-how-to-restore-it-3f)
    -   [2.2 How to open low-lever debug information when developing
        drivers?](#how-to-open-low-lever-debug-information-when-developing-drivers-3f)
    -   [2.3 How to display switching between LCD and DVI
        output?](#how-to-display-switching-between-lcd-and-dvi-output-3f)
    -   [2.4 How to use tftp to update image booting from Nand
        flash?](#how-to-use-tftp-to-update-image-booting-from-nand-flash-3f)
    -   [2.5 How to install linux cross compile
        tool?](#how-to-install-linux-cross-compile-tool-3f)
    -   [2.6 USB OTG used as Host](#usb-otg-used-as-host)
    -   [2.7 Is there any solution to solve inaccurate touch screen
        problem?](#is-there-any-solution-to-solve-inaccurate-touch-screen-problem-3f)
    -   [2.8 How to set NFS server on Devkit8000
        board?](#how-to-set-nfs-server-on-devkit8000-board-3f)
    -   [2.9 How to settle VGA display for a while and then closed
        problem in
        Linux?](#how-to-settle-vga-display-for-a-while-and-then-closed-problem-in-linux-3f)
    -   [2.10 How to use S-Video output?](#how-to-use-s-video-output-3f)
    -   [2.11 How to set excuting command automatically after booting up
        system?](#how-to-set-excuting-command-automatically-after-booting-up-system-3f)
    -   [2.12 How to configurate for reusing
        GPIO?](#how-to-configurate-for-reusing-gpio-3f)
-   [3 Wince problem](#wince-problem)
    -   [3.1 How to update WinCE image to Nand
        Flash?](#how-to-update-wince-image-to-nand-flash-3f)
    -   [3.2 How to Shield touch screen print information after WinCE
        booted?](#how-to-shield-touch-screen-print-information-after-wince-booted-3f)
    -   [3.3 How to close printing from debug serial
        port?](#how-to-close-printing-from-debug-serial-port-3f)
    -   [3.4 How to close calibration of touch
        screen?](#how-to-close-calibration-of-touch-screen-3f)
    -   [3.5 Why sometimes touch screen could not be
        used?](#why-sometimes-touch-screen-could-not-be-used-3f)
    -   [3.6 Why could not save in
        WinCE?](#why-could-not-save-in-wince-3f)
    -   [3.7 How to correct the right RTC
        functions?](#how-to-correct-the-right-rtc-functions-3f)
    -   [3.8 How to modify MAC address on
        WinCE?](#how-to-modify-mac-address-on-wince-3f)
    -   [3.9 How to modify the registry of
        WinCE?](#how-to-modify-the-registry-of-wince-3f)
    -   [3.10 How to cancel Low-power/Sleep mode in
        WinCE?](#how-to-cancel-low-power-sleep-mode-in-wince-3f)
    -   [3.11 Why could not boot WinCE through SD
        card?](#why-could-not-boot-wince-through-sd-card-3f)
    -   [3.12 How to establish KITL
        connection?](#how-to-establish-kitl-connection-3f)
    -   [3.13 How to solve BP\-ReadData call failed in
        WinCE?](#how-to-solve-bp-readdata-call-failed-in-wince-3f)
    -   [3.14 How to configurate for reusing
        GPIO?](#how-to-configurate-for-reusing-gpio-3f-2)
    -   [3.15 How to get fixed-size of touch screen
        display?](#how-to-get-fixed-size-of-touch-screen-display-3f)
-   [4 Other problems](#other-problems)
    -   [4.1 Reference](#reference)
    -   [4.2 Download format tool](#download-format-tool)
    -   [4.3 Could not boot from SD card](#could-not-boot-from-sd-card)
    -   [4.4 How to modify parameters of u-boot.bin for provided
        demo?](#how-to-modify-parameters-of-u-boot-bin-for-provided-demo-3f)
    -   [4.5 Mouse is not working when running QT on
        Devkit8000](#mouse-is-not-working-when-running-qt-on-devkit8000)
    -   [4.6 How to distribute static IP in android demo
        system?](#how-to-distribute-static-ip-in-android-demo-system-3f)

# Hardware problem

## If you had erased NAND flash, how to boot the system?

Answer: If the Nand Flash has been erased, user can boot the system
through SD card. OMAP35x series chips can support booting x-loader from
SD card. User can refer to [Devkit8000](http://eLinux.org/Devkit8000 "Devkit8000") user
manual to update image from SD card.

## How to use USB OTG as Host or Device?

Answer: The USB OTG interface can be used as USB Host function with a
Mini-A to Standard-A cable, or used as USB Device function with a Mini-B
to Standard-A cable.

If using USB OTG interface as USB Host, please follow below steps: 1)
Connect Hub power to USB Hub; 2) Connect USB OTG cable to
[Devkit8000](http://eLinux.org/Devkit8000 "Devkit8000") board; 3) Power on and get into
system; 4) Plug in USB Hub to USB OTG through cable; 5) Insert USB mouse
or keypad to USB Hub.

## How to boot from SD card?

Answer:Press BOOT key and power on, the system will boot from SD card
first and then boot from Nand flash.

## How to debug DSP and ARM on [Devkit8000](http://eLinux.org/Devkit8000 "Devkit8000")?

Answer: We suggest two ways:
 1. Connect with JTAG Emulator
 [Embest](http://www.armkits.com) provide
[XDS100v2](http://www.armkits.com/Product/xds100.asp) and
[TDS560](http://www.armkits.com/Product/tds560.asp) emulators which can
be used for TI's C2000, C5000, C6000 chips and OMAP, DaVinci, ARM7 and
ARM9 microprocessors.

2. Dubug in software system
 User can refer to the DEMO-DVSDK in product CD. The DVSDK has provided
complete video encoding and decoding drivers, user only needs to dubug
the DSP algorithms. Please refer to TI's website for details:
[http://focus.ti.com/docs/toolsw/folders/print/linuxdvsdk-omap3530.html](http://focus.ti.com/docs/toolsw/folders/print/linuxdvsdk-omap3530.html)

## What's the RTC battery model can be used for [Devkit8000](http://eLinux.org/Devkit8000 "Devkit8000")?

Answer: The [DevKit8000](http://eLinux.org/DevKit8000 "DevKit8000") board is not
delivered with RTC battery, user needs to prepare it themselves. The
battery model is CR1220.



# Linux problem

## If the Nand Flash has been erased, how to restore it?

Answer: Please download the
[linux\_WriteToNandflash.rar](http://devkit8000.googlecode.com/files/linux_WriteToNandflash.rar),and
decompress the linux\_WriteToNandflash.rar, copy all files to the SD
card in the linux\_WriteToNandflash.rar, and then boot the image from
the SD card.

**Warnning:If your NandFlash has OS before, please erase it, enter to
the u-boot command mode and input the commands of "nand erase" to erase
the NandFlash.**

## How to open low-lever debug information when developing drivers?

Answer: Please follow below steps:
 1. make omap3\_devkit8000\_defconfig
 2. make menucofig
 Select “Kernel low-level debugging functions”

    Symbol: DEBUG_LL [=y]
    Prompt: Kernel low-level debugging functions
     Defined at arch/arm/Kconfig.debug:54
     Depends on: DEBUG_KERNEL
     Location:
        -> Kernel hacking

3. make uImage
 User can use the uImage directly after finishing compiling.

## How to display switching between LCD and DVI output?

Answer: You need to modify kernel parameter:
 4.3" LCD:
 OMAP3 DevKit8000 \# setenv bootargs console=ttyS2,115200n8 ubi.mtd=4
root=ubi0:rootfs rootfstype=ubifs video=omapfb:mode: 4.3inch\_LCD

5.6" LCD:
 OMAP3 DevKit8000 \# setenv bootargs console=ttyS2,115200n8 ubi.mtd=4
root=ubi0:rootfs rootfstype=ubifs video=omapfb:mode: 5.6inch\_LCD

7" LCD:
 OMAP3 DevKit8000 \# setenv bootargs console=ttyS2,115200n8 ubi.mtd=4
root=ubi0:rootfs rootfstype=ubifs video=omapfb:mode:7inch\_LCD

DVI monitor:
 OMAP3 DevKit8000 \# setenv bootargs console=ttyS2,115200n8 ubi.mtd=4
root=ubi0:rootfs rootfstype=ubifs video=omapfb:mode:720p60

VGA monitor:
 OMAP3 DevKit8000 \# setenv bootargs console=ttyS2,115200n8 ubi.mtd=4
root=ubi0:rootfs rootfstype=ubifs video=omapfb:mode:VGA

## How to use tftp to update image booting from Nand flash?

Answer: [Devkit8000](http://eLinux.org/Devkit8000 "Devkit8000") has 10/100M Ethernet
(DM9000) on board, user can update image booting from Nand flash through
tftp.
 1）x-loader booting image update
 OMAP3 DevKit8000 \# tftp 80000000 x-load.bin.ift\_for\_NAND
 dm9000 i/o: 0x2c000000, id: 0x90000a46
 MAC: aa:bb:cc:dd:ee:ff
 operating at 100M full duplex mode
 TFTP from server 192.192.192.90; our IP address is 192.192.192.200
 Filename 'x-load.bin.ift\_for\_NAND'.
 Load address: 0x80000000
 Loading: T \#
 done
 Bytes transferred = 9664 (25c0 hex)
 OMAP3 DevKit8000 \# nand unlock
 device 0 whole chip
 nand\_unlock: start: 00000000, length: 134217728!
 NAND flash successfully unlocked
 OMAP3 DevKit8000 \# nand ecc hw
 OMAP3 DevKit8000 \# nand erase 0 80000

NAND erase: device 0 offset 0x0, size 0x80000
 Erasing at 0x60000 -- 100% complete.
 OK
 OMAP3 DevKit8000 \# nand write.i 80000000 0 80000

NAND write: device 0 offset 0x0, size 0x80000

Writing data at 0x7f800 -- 100% complete.
 524288 bytes written: OK

2）u-boot booting image update
 OMAP3 DevKit8000 \# tftp 80000000 flash-uboot.bin
 dm9000 i/o: 0x2c000000, id: 0x90000a46
 MAC: aa:bb:cc:dd:ee:ff
 operating at 100M full duplex mode
 TFTP from server 192.192.192.90; our IP address is 192.192.192.200
 Filename 'flash-uboot.bin'.
 Load address: 0x80000000
 Loading: T
\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
 done
 Bytes transferred = 1085536 (109060 hex)
 OMAP3 DevKit8000 \# nand unlock
 device 0 whole chip
 nand\_unlock: start: 00000000, length: 134217728!
 NAND flash successfully unlocked
 OMAP3 DevKit8000 \# nand ecc sw
 OMAP3 DevKit8000 \# nand erase 80000 160000

NAND erase: device 0 offset 0x80000, size 0x160000
 Erasing at 0x1c0000 -- 100% complete.
 OK
 OMAP3 DevKit8000 \# nand write.i 80000000 80000 160000

NAND write: device 0 offset 0x80000, size 0x160000

Writing data at 0x1df800 -- 100% complete.
 1441792 bytes written: OK

3）Kernel image update
 OMAP3 DevKit8000 \# tftp 80000000 uImage
 dm9000 i/o: 0x2c000000, id: 0x90000a46
 MAC: aa:bb:cc:dd:ee:ff
 operating at 100M full duplex mode
 TFTP from server 192.192.192.90; our IP address is 192.192.192.200
 Filename 'uImage'.
 Load address: 0x80000000
 Loading: T
\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
 done
 Bytes transferred = 1991900 (1e64dc hex)
 OMAP3 DevKit8000 \# nand unlock
 device 0 whole chip
 nand\_unlock: start: 00000000, length: 268435456!
 NAND flash successfully unlocked
 OMAP3 DevKit8000 \# nand ecc sw
 OMAP3 DevKit8000 \# nand erase 280000 200000

NAND erase: device 0 offset 0x280000, size 0x200000
 Erasing at 0x460000 -- 100% complete.
 OK
 OMAP3 DevKit8000 \# nand write.i 80000000 280000 200000

NAND write: device 0 offset 0x280000, size 0x200000

Writing data at 0x47f800 -- 100% complete.
 2097152 bytes written: OK

4）File system image update
 OMAP3 DevKit8000 \# tftp 80000000 ubi.img
 dm9000 i/o: 0x2c000000, id: 0x90000a46
 MAC: aa:bb:cc:dd:ee:ff
 operating at 100M full duplex mode
 TFTP from server 192.192.192.90; our IP address is 192.192.192.200
 Filename 'ubi.img'.
 Load address: 0x80000000
 Loading: T
\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
 done
 Bytes transferred = 12845056 (c40000 hex)
 OMAP3 DevKit8000 \# nand unlock
 device 0 whole chip
 nand\_unlock: start: 00000000, length: 268435456!
 NAND flash successfully unlocked
 OMAP3 DevKit8000 \# nand ecc sw
 OMAP3 DevKit8000 \# nand erase 680000 7980000

NAND erase: device 0 offset 0x680000, size 0x7980000
 Erasing at 0x7fe0000 -- 100% complete.
 OK
 OMAP3 DevKit8000 \# nand write.i 80000000 680000 \$(filesize)

NAND write: device 0 offset 0x680000, size 0xc40000

Writing data at 0x12bf800 -- 100% complete.
 12845056 bytes written: OK

## How to install linux cross compile tool?

Please follow below steps:
 1.Download cross compile tool from website

[http://www.codesourcery.com/sgpp/lite/arm/portal/package1787/public/arm-none-linux-gnueabi/arm-2007q3-51-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2](http://www.codesourcery.com/sgpp/lite/arm/portal/package1787/public/arm-none-linux-gnueabi/arm-2007q3-51-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2)

 2.Decompress software
 sudo tar xvf
arm-2007q3-51-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 -C /home/


3.Tool installation
 mkdir /home/embest/tools
 cp /media/cdrom/linux/tools/mkimage /home/embest/tools
 cp /media/cdrom/linux/tools/signGP /home/embest/tools
 cp /media/cdrom/linux/tools/mkfs.ubifs /home/embest/tools
 cp /media/cdrom/linux/tools/ubinize /home/embest/tools
 cp /media/cdrom/linux/tools/ ubinize.cfg /home/embest/tools

4.Set environment variables
 export PATH=/home/arm-2007q3/bin/:/home/embest/tools:\$PATH

## USB OTG used as Host

Answer: If using USB OTG interface as USB Host, please follow below
steps:
 1. Connect Hub power to USB Hub;
 2. Connect USB OTG cable to Devkit8000 board;
 3. Power on and get into system;
 4. Plug in USB Hub to USB OTG through cable;
 5. Insert USB mouse or keypad to USB Hub.

If user uses your own USB cable, please pay attention to USB OTG
(Mini-AB) wire map:
 1: VB
 2: D-
 3: D+
 4: ID
 5: GND
 User needs only to short circuited 4 and 5.

## Is there any solution to solve inaccurate touch screen problem?

Answer: Please modify the file
arch/arm/mach-omap2/board-omap3devkit8000.c
 struct ads7846\_platform\_data ads7846\_conf = {

           .x_max                  = 0x0fff,
           .y_max                  = 0x0fff,
           //.x_plate_ohms           = 180,
           //.pressure_max           = 255,
           .debounce_max           = 10,
           .debounce_tol           = 5,
           .debounce_rep           = 1,
           .get_pendown_state      = ads7846_get_pendown_state,
           .keep_vref_on           = 1,
           .settle_delay_usecs     = 150,

};

## How to set NFS server on Devkit8000 board?

Answer: Please follow below steps:
 1. Please make sure your PC OS is set the NFS server. 2. Connect the
net cable between PC and Devkit8000 board. 3. Power on the Devkit8000
board, and enter to U-boot command line,input the following command:

     setenv bootargs console=ttyS2,115200n8 root=/dev/nfs nfsroot=192.192.192.117:/home/lijr/work/nfsroot/rootfs ip=192.192.192.200:192.192.192.117:192.192.192.101:255.255.255.0:devkit8000:eth0:off

Note:
 192.192.192.200 is IP of board;
 192.192.192.117 is IP of PC;
 192.192.192.117:/home/lijr/work/nfsroot/rootfs is the mounted rootfs on
PC;
 192.192.192.101 is IP of gateway;
 255.255.255.0 is subnet mask;
 devkit8000 is name (can be modified);

## How to settle VGA display for a while and then closed problem in Linux?

Answer: Please modify the file /etc/init.d/rcS in file system, adding
below contents:

1.  ---------------------------------------------
2.  Disable power management
3.  (Requires sysfs support in the kernel)
4.  ---------------------------------------------

echo -n " Disabling Power mgmt  : "
 echo -n "1" \> /sys/power/cpuidle\_deepest\_state
 status \$? 1

1.  ---------------------------------------------
2.  Turn off LCD after 1 hour of inactivity
3.  (Requires sysfs support in the kernel)
4.  ---------------------------------------------

echo -n " Turn off LCD after 1 hour  : "
 echo -n "0" \> /sys/power/fb\_timeout\_value
 status \$? 1

## How to use S-Video output?

Answer: Please select below in kernel configuration:
 Multimedia devices ---\>

         [*] Video capture adapters  --->
             VID1 Overlay manager (Use TV Managaer)  --->
                 (X) Use TV Manager

And then recompile and put the created uImage in SD card and boot
system.
 After recompiling, you need to download testing tool video\_test and
video example foreman\_vga\_422.yuv from
[http://code.google.com/p/devkit8000/downloads/list](http://code.google.com/p/devkit8000/downloads/list)

Input below after getting into kernel:
 Copy video\_test and foreman\_vga\_422.yuv files to board and run as
below:
 video\_test /foreman\_vga\_422.yuv

## How to set excuting command automatically after booting up system?

Answer: Modify /etc/init.d/rcS file of file system and add your
commands. Then you can execute command automatically after booting up
system. Add & after commands can implement backstage excecuting command
automatically after booting up.

## How to configurate for reusing GPIO?

Answer: Please configurate board/omap3devkit8000/omap3devkit8000.c in
MUX\_DEFAULT\_ES2, refer to the Seventh Chapter "System Control Module"
for detailed configuration way.

# Wince problem

## How to update WinCE image to Nand Flash?

Answer: Please follow below steps:
 1. Run the software of HP Disk Storage Format Tool and format the SD
card for FAT or FAT32 filesystem.
 2. Copy the image file(MLO, EBOOTNAND.nb0, NK.bin, ADevKit8000.exe)
from CD:\\wince\_6\\image\\ lcd480X272 to SD card, then change the name
from EBOOTNAND.nb0 to EBOOTSD.nb0 in the SD card.
 3. Insert the SD card to the board, press the BOOT button and then
power on the board again; HyperTerminal will start printing the output
information, at the same time press [SPACE] to enter the EBOOT menu.
 4. Press [5] to enter the Flash manage menu.
 5. Press [a], [b], [c] separately to write the image(XLDR, EBOOT, NK)
to flash.
 6. Press [0] to return to the main menu, and press [2], [4], [7], [7]
to change the boot device.
 7. Power on the system again, and then the board will boot from the
NAND flash.

## How to Shield touch screen print information after WinCE booted?

Answer: Please modify function
DevKit8000\\SRC\\DRIVERS\\TOUCH\\touchscreen.cpp: Shield RETAILMSG(1, (
TEXT( "Point: (%d,%d)\\r\\n" ), \*pUncalX, \*pUncalY ) ); in Row 564 and
then recompile. //RETAILMSG(1, ( TEXT( "Point: (%d,%d)\\r\\n" ),
\*pUncalX, \*pUncalY ) );

## How to close printing from debug serial port?

Answer: Please follow below steps:
 1. comment out the RETAILMSG call in TouchDriverCalibrationPointGet
function of touchscreen.cpp
 2. comment out the RETAILMSG call in DdsiTouchPanelGetPoint function of
touchscreen.cpp
 3. comment out the RETAILMSG call in TLED\_Backlight::SetPowerState
function of tled\_backlight.cpp
 4. comment out the RETAILMSG call in SetDutyCycle function of tled.cpp

 5. comment out the RETAILMSG call in LcdPdd\_LCD\_Initialize function
of lcd\_vga.c
 6. make sure that "set BSP\_NOCOM=" is not set in DevKit8000.bat
 7. make sure that "set BSP\_NOCOM3=" is not set in DevKit8000.bat
 8. delete the "IF BSP\_COM3" of \_FLATRELEASEDIR/platform.reg in line
1103
 9. delete the "ENDIF BSP\_COM3" of \_FLATRELEASEDIR/platform.reg in
line 1124
 10. rebuild the BSP

## How to close calibration of touch screen?

Answer: Please add below sentence in DevKit8000.bat file under Chdir of
BSP and then rebuild. Set IMGNOCALIBRATION=1

## Why sometimes touch screen could not be used?

Answer: It is because that user had used build and sysgen when
compiling. User would better not use build and sysgen for compiling in
WinCE or it will cause some problems and you must reinstall pb6.0.

## Why could not save in WinCE?

Answer: please do some modification in
SRC\\DRIVERS\\BLOCK\\NAND\\nand\_MT29F2G16.h
 Modify

1.  define NUMBER\_OF\_BLOCKS (2048) // 2048 blocks

to

1.  define NUMBER\_OF\_BLOCKS (1024) // 1024 blocks

## How to correct the right RTC functions?

Answer: Please follow below steps:
 1. Please replace the src/oal/oalrtc/rtc.c as the new rtc.c

([http://devkit8000.googlecode.com/files/rtc.c](http://devkit8000.googlecode.com/files/rtc.c))

 2. Add the \#define BSP\_OAL\_RTC\_USES\_TWL4030 TRUE
 on the src/inc/bsp\_cfg.h in BSP.
 3. Recompile the image again.

## How to modify MAC address on WinCE?

Answer: Please Modify the registry
 [HKEY\_LOCAL\_MACHINE\\Comm\\DM9CE1\\Parms]
 "BusNumber"=dword:0
 "BusType"=dword:1
 "XmitBuffer"=dword:20
 "RecvBuffer"=dword:20
 "IrqNumber"=dword:99
 "IoAddress"=dword:15000000
 "Mac"=hex:00,00,00,00,00,00

## How to modify the registry of WinCE?

Answer: Please modify in vs2005:
 Modify platform.reg in \_REL\_DIR folder and then -\>make runtime
image

## How to cancel Low-power/Sleep mode in WinCE?

Answer: Please select in controller board: -power-ACsuspend-never

## Why could not boot WinCE through SD card?

If your serial information appears below contents:
 HandleInsertion
 MMC Reset
 MMCIssueIdentify: SD card detected
 SD card relative address is 26803
 MMCIssueIdentify: CSD
 reported block size = 512
 Card size is = 972800 512 byte sectors
 max clock freq = 25000000
 identification complete
 SDCardIdentify: Identify device ...
 BL\_IMAGE\_TYPE\_BIN
 Download file information:

* * * * *



[0]: Address=0x84001000 Length=0x02065488 Save=0x80001000

* * * * *



Download file type: 1
 **ERROR: Checksum failure (expected=0x1768BE9 computed=0x170C19B)**
 **\*\*\*\*\*\* Checksum failure on record 5, ABORT!!! \*\*\*\*\*\***

Please input NK.bin file from the CD to SD card again, the problem will
be solved.

## How to establish KITL connection?

Answer: At present the Devkit8000 board can only support download NK.bin
through DM9000 Ethernet and could not support KITL transmitting. That's
because the bootloader and OAL public domain code have no address map in
WinCE system and access to DM9000 physical address directly.
 User can use USB RNDIS for downloading NK.bin and KITL transmitting.
 1. Please install RNDIS driver in PC;
 2. Set IP address for virtual network and Devkit8000, make sure they
are in the same segment, but different from PC IP segment;
 3. Set booting device USB RNDIS in Eboot and select dubuging device to
USB RNDIS.

## How to solve BP\_ReadData call failed in WinCE?

Answer: please follow below steps:
 1. Use software HP Disk Storage Format Tool to format SD card to FAT or
FAT32 file system;
 2. Copy the image file(MLO, EBOOTNAND.nb0, NK.bin, XLDRNAND.nb0,
ADevKit8000.exe) from CD:\\wince\_6\\image\\ dvi1280X720 or lcd480X272
to SD card, then change the name from EBOOTNAND.nb0 to EBOOTSD.nb0 in
the SD card.
 3. Press BOOT key, when the serial port shows below contents:
 INFO: Boot configuration found
 OALFlashStoreOpen: 2048 blocks, 64 sectors/block
 OALFlashStoreOpen: 2048 bytes/sector, 14 reserved blocks
 ERROR: OALFlashStoreRead: Failed read sector 384 (0 sector in block 6)

 Hit space to enter configuration menu 1...
 Please press SPACE key here;
 4. Press [5] to enter Flash manage menu.
 Note: if you press [8] to enter Flash menage menu, it is not correct.
It means your had not renamed EBOOTNAND.nb0 to EBOOTSD.nb0.
 5. Press [3] to enter Flash easer.
 6. Press [7] to enter Flash format.
 And then follow user manual 12.2.1 to update image in Nand flash.

## How to configurate for reusing GPIO?

Answer: DeviceIoControl(hFile, IOCTL\_GPIO\_SETBIT, &id, sizeof(DWORD),
0, 0, NULL, NULL);

1.You have to modify the ID to GPIO number
 2.You have to modify the file platform.c
(C:\\WINCE600\\DevKit8000\\BSP\\DevKit8000\\SRC\\BOOT\\XLDR). you have
to enable the PIN mux mode:

     /*MMC2*/
     // Implemented on expansion interface only - leave disabled
       //OUTREG16(&pConfig->CONTROL_PADCONF_MMC2_CLK, (INPUT_DISABLE | PULL_UP | MUX_MODE_0));           /*MMC2_CLK*/
       //OUTREG16(&pConfig->CONTROL_PADCONF_MMC2_CMD, (INPUT_ENABLE | PULL_UP | MUX_MODE_0));            /*MMC2_CMD*/
       //OUTREG16(&pConfig->CONTROL_PADCONF_MMC2_DAT0, (INPUT_ENABLE | PULL_UP | MUX_MODE_0));           /*MMC2_DAT0*/
       //OUTREG16(&pConfig->CONTROL_PADCONF_MMC2_DAT1, (INPUT_ENABLE | PULL_UP | MUX_MODE_0));           /*MMC2_DAT1*/
       //OUTREG16(&pConfig->CONTROL_PADCONF_MMC2_DAT2, (INPUT_ENABLE | PULL_UP | MUX_MODE_0));           /*MMC2_DAT2*/
       //OUTREG16(&pConfig->CONTROL_PADCONF_MMC2_DAT3, (INPUT_ENABLE | PULL_UP | MUX_MODE_0));           /*MMC2_DAT3*/



## How to get fixed-size of touch screen display?

1. you have to get the "CalibrationData", you can enter your wince via
calibration, use the "Regedit.exe" to open the regedit, open the
directory of [HKEY\_LOCAL\_MACHINE\\HARDWARE\\DEVICEMAP\\TOUCH] and
check the "CalibrationData"=" xxxxxxxx "

2.open the "\\BSP\\DevKit8000\\FILES\\platform.reg" with visual studio
2005:

       ;-- Touch Screen driver --------------------------------------------------------
       ; @CESYSGEN IF CE_MODULES_POINTER
       ; @CESYSGEN IF GWES_TCHUI
       ; @XIPREGION IF PACKAGE_OEMDRIVERS
       IF BSP_NOTOUCH !
       [HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\TOUCH]
           "DriverName"="touch.dll"
       IF IMGNOCALIBRATION
           "CalibrationData"="xxxxxxxx "
       ENDIF IMGNOCALIBRATION
           "MaxCalError"="6"
           "SPIAddr"=dword:0           ; McSPI1 channel 0
           "PenGPIO"=dword:1B           ; gpio27// gpio_175
           "PenUpDebounceMS"=dword:28  ; PenUp debounce time in MS, 0 to disable debounce process
            "InitialSamplesDropped"=dword:2     ; Number of samples to be dropped after pen down detection  ; Default is 1
           ;"SampleRate"=dword:64      ; samples per second, default is 100
       ENDIF BSP_NOTOUCH !
       ; @XIPREGION ENDIF PACKAGE_OEMDRIVERS
       ; @CESYSGEN ENDIF GWES_TCHUI
       ; @CESYSGEN ENDIF CE_MODULES_POINTER


Delete the "IF IMGNOCALIBRATION" and "ENDIF IMGNOCALIBRATION", compile
it again.

# Other problems

## Reference

-   Qt: [http://qt.nokia.com/](http://qt.nokia.com/)
-   Oxroid-android2.1:
    [http://code.google.com/p/0xdroid/wiki/UsingPreBuiltImages](http://code.google.com/p/0xdroid/wiki/UsingPreBuiltImages)
-   TI-android:
    [http://code.google.com/p/rowboat/wiki/Main?tm=6](http://code.google.com/p/rowboat/wiki/Main?tm=6)

## Download format tool

[http://www.embedinfo.com/english/download/SP27213.exe](http://www.embedinfo.com/english/download/SP27213.exe)

## Could not boot from SD card

Answer: we recommend user to use HP USB Disk Storage Format Tool 2.0.6
tool to format your SD card. Please download the tool from below link:

[http://www.embedinfo.com/english/download/SP27213.exe](http://www.embedinfo.com/english/download/SP27213.exe)

Then follow below steps:
 1. Insert your SD card to card reader in PC;
 2. Open HP USB Disk Storage Format Tool;
 3. Select "FAT32" system format;
 4. Click "Start";
 5. Click "OK" after finished formatting;
 6. Copy the image to SD card and try to boot again from SD card.

## How to modify parameters of u-boot.bin for provided demo?

Answer: please use u-boot source code of Devkit8000, modify MACH-ID and
then recompile.
 1. Modify board/omap3devkit8000/omap3devkit8000.c file in u-boot-1.3.3
source code.
 Please find board\_init function and modify:
 gd-\>bd-\>bi\_arch\_number = MACH\_TYPE\_DEVKIT8000;
 to be
 gd-\>bd-\>bi\_arch\_number = XXX;
 2. Recompile u-boot.
 Note: 1) For angstrom, XXX is MACH\_TYPE\_DEVKIT8000
 2) For android, XXX is MACH\_TYPE\_OMAP3\_BEAGLE
 3) For dvsdk, XXX is MACH\_TYPE\_OMAP3EVM



## Mouse is not working when running QT on Devkit8000

Answer: Input "make menuconfig" on path of kernel and add the below
commands:
 Device Drivers ---\>

Input device support ---\>
 \<\*\>Mouse interface
 [\*]Provide legacy /dev/psaux device
 (1024) Horizontal screen resolution
 (768) Vertical screen resolution
 [\*] Mice ---\>

## How to distribute static IP in android demo system?

Answer: after getting into system, input below command in serial
terminal:
 ifconfig eth0 192.192.192.90
 ifconfig eth0 up
 route add default gw 192.192.192.101 dev eth0
 setprop net.dns1 202.96.134.133
 Note: user can modify above ip address according to actual
conditions.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [Devkit8000](http://eLinux.org/Category:Devkit8000 "Category:Devkit8000")

