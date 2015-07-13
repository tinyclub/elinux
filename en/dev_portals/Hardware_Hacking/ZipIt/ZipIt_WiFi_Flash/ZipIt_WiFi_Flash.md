> From: [eLinux.org](http://eLinux.org/ZipIt_WiFi_Flash "http://eLinux.org/ZipIt_WiFi_Flash")


# ZipIt WiFi Flash



This page contains information on how to modify a
[ZipIt](http://eLinux.org/ZipIt "ZipIt")'s firmware (in its flash memory) to allow a user
to add additional applications and features.

## Contents

-   [1 Before you Start](#before-you-start)
-   [2 Overview](#overview)
    -   [2.1 User comments](#user-comments)
    -   [2.2 Reinstalling BURN3](#reinstalling-burn3)

## Before you Start

Please note that flashing the firmware on a [ZipIt](http://eLinux.org/ZipIt "ZipIt") is
considered a dangerous operation, and is not officially supported in any
way. (If a firmware installation fails, it may still be possible to
salvage the device using the [3 wire repair
configuration](http://aibohack.com/zipit/serial.htm).)

Please note that this method (using ZRS) of flashing does not work if
you've upgraded to firmware 2.01. If you've allowed your
[ZipIt](http://eLinux.org/ZipIt "ZipIt") to upgrade to 2.01 from zipitwireless.com, then
your only alternative to flashing is using the 3-wire or 5-wire serial
mod.

## Overview

Please read the [original
instructions](http://aibohack.com/zipit/reflash.htm) for performing a
software firmware flash over [WiFi](http://eLinux.org/WiFi "WiFi") first. Please review
these instructions thoroughly, as this document is only meant to
supplement these instructions.

The first step involves configuring your PC to be an "ad-hoc"
[WiFi](http://eLinux.org/WiFi "WiFi") node, as required for uploading new firmware. Both
Windows XP and Linux can be set up with a [WiFi](http://eLinux.org/WiFi "WiFi") card this
way.

Instructions for setting up Windows XP as an ad-hoc node are available
here: [ZipIt WinXP Setup](http://eLinux.org/ZipIt_WinXP_Setup "ZipIt WinXP Setup")
Instructions for setting up Linux as an ad-hoc node are available here:
[Zipit Linux Setup](http://eLinux.org/Zipit_Linux_Setup "Zipit Linux Setup")

The original firmware flashing instructions available above install the
[BURN3](http://eLinux.org/BURN3 "BURN3") firmware by [Zipit
Pet](http://eLinux.org/index.php?title=Zipit_Pet&action=edit&redlink=1 "Zipit Pet (page does not exist)")
using the *ZRS* tool he also created. (Both of which are included in the
[zipit\_reflash\_03.zip](http://aibohack.com/zipit/zipit_reflash_kit03.zip)
package - See [[1]](http://aibohack.com/zipit/reflash.htm)) Please note
that flashing your device with *ZRS* is only required once. The
["BURN3"] firmware is fairly minimal, but allows you to mount a NFS
server. If you download and extract the
[zipit\_tool\_extras.zip](http://www.aibohack.com/zipit/zipit_tool_extras.zip)
package to a NFS drive, you can use the tool *zflash* to upload another
new firmware to the [ZipIt](http://eLinux.org/ZipIt "ZipIt"). The *zflash* tool is
included in this package. The advantage to using *zflash* is that it is
run by the [ZipIt](http://eLinux.org/ZipIt "ZipIt"), allowing the device to update its
own firmware. As well, *zflash* allows unencrypted firmwares to be
uploaded to the device (all of the stock firmwares supplied by
K-Byte/Aeronix are encrypted.)

If there is any confusion about *zflash* at this point, please take note
that while *zflash* needs to be housed on the NFS server, it is run on
your [ZipIt](http://eLinux.org/ZipIt "ZipIt") device (made possible by mounting the NFS
share through your wifi connection.)

Here comes the fun part. Now that your [ZipIt](http://eLinux.org/ZipIt "ZipIt") is able
to install a new unencrypted firmware onto itself off an NFS server, you
can download the [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") firmware, extract
it to the NFS server, and use *zflash* from the [ZipIt](http://eLinux.org/ZipIt "ZipIt")
to install the new firmware.

At this point, [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") provides you with
several useful (and cool) programs, but you also have the option of
compiling your own software for it. See [ZipIt
Compile](http://eLinux.org/ZipIt_Compile "ZipIt Compile").

### User comments

Instead of loading an all-in-one bin file, I ran the serial batch and
told it to upload the loader, ramdisk, and zimage each separately and
everything went smooth from there. Each time I tried to run the
allrom.bin file, it returned loader addresses that were very high. When
I did just the loader.bin file separately, it returned (if I remember
right) 002000 and 009000 which sounded closer to right.

So, I would try loading each file separately. It worked for me.



### Reinstalling BURN3

To reinstall BURN3 from a zipit with NFS access, use 'zflash' like you
did before, with the 3 files from
[http://www.aibohack.com/zipit/zipit\_parts\_burn3.zip](http://www.aibohack.com/zipit/zipit_parts_burn3.zip)

ie. `./zflash loader.bin zmage.dat ramdisk.gz`

No need for the "ZRS" step, but the result is the same.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

