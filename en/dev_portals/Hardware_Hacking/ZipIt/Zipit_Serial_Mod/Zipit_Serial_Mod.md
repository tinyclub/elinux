> From: [eLinux.org](http://eLinux.org/Zipit_Serial_Mod "http://eLinux.org/Zipit_Serial_Mod")


# Zipit Serial Mod



Perform this mod to allow uploading new firmware to your Zipit.



How to reflash firmware once you have done this mod: [ZipIt Serial
Flash](http://eLinux.org/ZipIt_Serial_Flash "ZipIt Serial Flash")

(The software-only [WiFi](http://eLinux.org/WiFi "WiFi") reflashing trick is easier see
[ZipIt WiFi Flash](http://eLinux.org/ZipIt_WiFi_Flash "ZipIt WiFi Flash") and
[BURN3](http://eLinux.org/BURN3 "BURN3"), but will only work on Zipits with factory
firmware before version 2.01.)

If if you have ver 2.01 or later on your Zipit, you will need to perform
either the "3 wire" or "5 wire" mod described below. This lets you
upload new firmware or fix corrupted (non-booting) ROM contents by
uploading a working ROM image. For more advanced users, especially those
that want to tweek the kernel build, the "5 wire" mod is recommended.
This lets you upload ROM images for testing, and gives you a serial port
you can connect to.

The "5 wire" mod is more powerful than the "3 wire" mod, but it requires
more soldering skill. Email me if interested in more detail. Email:
aibopet@aibohack.com

* * * * *

## 5 Wire - Developer Configuration

-   PROCEED AT YOUR OWN RISK
-   Take apart your Zipit device
-   You will be soldering 5 small wires to the main PCB. Two solder
    points are easy to get to, two are a little tricky, and one is very
    very difficult to solder to.
-   Run the wires to a [RS-232 level
    shifter](http://eLinux.org/RS232_Level_Shifter "RS232 Level Shifter"). A MAX233A chip
    is used in the examples, but others can be used. see the RS-232
    Level Shifter Page for recommendations. The MAX233A is a **5 volt**
    chip but does appear to work at 57.6kbaud using the 3.3 volts.
-   You connect this to a free serial port of your PC.
-   Current version of PC upload software runs under Windows
    [http://www.aibohack.com/zipit/zipit\_reflash\_kit03.zip](http://www.aibohack.com/zipit/zipit_reflash_kit03.zip)
-   Linux version is here
    [http://www.cs.toronto.edu/\~cvs/zipit/](http://www.cs.toronto.edu/~cvs/zipit/)

[![Zipit5
schematic.gif](http://eLinux.org/images/7/7e/Zipit5_schematic.gif)](http://eLinux.org/File:Zipit5_schematic.gif)

Wiring points (original scan thanks to Andrew Hakman of Yahoo BBS):

[![Zipit
wiring1.jpg](http://eLinux.org/images/4/48/Zipit_wiring1.jpg)](http://eLinux.org/File:Zipit_wiring1.jpg)

Closeup:

[![Zipit
wiring2.jpg](http://eLinux.org/images/4/4b/Zipit_wiring2.jpg)](http://eLinux.org/File:Zipit_wiring2.jpg)

## 3 Wire - Repair Configuration

This is an easier version of the 5 wire Developer Configuration hardware
mod. Very tricky soldering is not required (only mildly difficult
soldering for one contact point).

(See above photos for contact points, but ignore the RxD2 and TxD2
signals)

[![Zipit3
schematic.gif](http://eLinux.org/images/e/ef/Zipit3_schematic.gif)](http://eLinux.org/File:Zipit3_schematic.gif)

-   A Windows PC program performs a "blind upload" of the firmware.
    [http://www.aibohack.com/zipit/zipit\_reflash\_kit03.zip](http://www.aibohack.com/zipit/zipit_reflash_kit03.zip)
-   Linux version is here
    [http://www.cs.toronto.edu/\~cvs/zipit/](http://www.cs.toronto.edu/~cvs/zipit/)
    )

## Troubleshooting

    I recently got a ZipIt from a friend who didn't use it anymore. Unfortunately it had been updated to the latest firmware and after reading around I realized I needed to do the serial mod. I've soldered before, though never anything on this small a scale.
    Surprisingly (to me), everything went pretty well. Checked all the connections with my multimeter and it all checked out. I verified the ZipIt software still functioned correctly and got to work on uploading new firmware.
    Anyways, I hooked up the DB9 to my laptop and started up the flashing program. Loaded up the bootstrap program with no problem, and I got the instructions along with "ZPM .02 - 57.6Kbps new cmds" and so on.
    Uploading new firmware appeared to go fine, as did writing to flash.
    Unfortunately, when I rebooted the device without the debug pin grounded, I get nothing but a blank screen and it won't respond to anything but cutting the power.
    So far I've tried uploading both burn3 and OpenZipIt firmwares, and with both I'm simply getting a blank screen on the ZipIt.
    Any idea what's causing the problem? I've looked around the forums and the wiki but haven't seen anything on this problem yet.

Inspect all possible problems before trying them one at a time. Done
dispair if you're getting good feedback from the serial program -- it is
doing something.

First things first, what is your setup? Which serial converter chip are
you using. As well what is your layout? are you powering the serial chip
with an external power supply or off of the zipits internal 3.3v supply?
for programing with dbug you MUST use an external supply voltage to
drive the serial chip.

What is the voltage your driving the the serial chip with? it should be
no more then 3.5v or you'll be over driving the TTL/cmos connections. An
LM317T or any dedicated 3.3v regulator will work just fine. Or you can
use two 1.5v cells in series for 3v. Even a 2032 button battery would
work.

You said you uploaded the the bootloader etc... what else did you
upload? did you upload the loader.bin, zimage.dat ramdisk.gz files? If
that is what you have tryed and nothing else I suggest you try an
ALLROM.BIN file which will be a 2meg image. The working bin image you
should try is found in zipit\_reflash\_kit03.zip 2MB in size. This file
is the burn3 image.
[http://www.aibohack.com/zipit/zipit\_reflash\_kit03.zip](http://www.aibohack.com/zipit/zipit_reflash_kit03.zip)
use only the BIN file

If you run it in Windows it would be advisable to go to your well OS
depending but go to your device manager. Then find ports, locate the
port you are programming with which should be port com1. Set your
settings as follows:



    bits per second: 57600
    data bits:       8
    parity:          none
    stop bits:       1
    Flow control:    none

The program is supposed to set the ports by itself but couldn't hurt,
You also don't have any thing in the background trying to access that
com port do you?

You may want to try doing the 3 wire serial update.
[http://aibohack.com/zipit/serial.htm](http://aibohack.com/zipit/serial.htm)
the program can be found here on the
[http://www.elinux.org/wiki/ZipIt](http://www.elinux.org/wiki/ZipIt)
page go to the how to's and click on "How to zipit tools" In there there
is a linux 3 wire flashing tool. doing this method I do not know what
type of medium it is supose to transfer either the bin,dat,gz or one big
BIN file? One of these possible answers may help you. If all else fails
it may even be advisable to use a different computer just for haha.

You should have this as well:
[http://www.aibohack.com/zipit/zipit\_parts\_burn3.zip](http://www.aibohack.com/zipit/zipit_parts_burn3.zip)
Because the upl program will ask for a loader.bin still and that loader
bin is part of the burn3 so just to be safe.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

