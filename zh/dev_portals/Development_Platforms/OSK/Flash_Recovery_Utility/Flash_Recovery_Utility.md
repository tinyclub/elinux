> From: [eLinux.org](http://eLinux.org/Flash_Recovery_Utility "http://eLinux.org/Flash_Recovery_Utility")


# Flash Recovery Utility



[Texas Instruments](http://eLinux.org/Texas_Instruments "Texas Instruments") (through
[Tim Riker](http://eLinux.org/User:TimRiker "User:TimRiker")) has made the
[OSK](http://eLinux.org/OSK "OSK") **Flash Recovery Utility** available. This is an
**unsupported** utility. [Tim Riker](http://eLinux.org/User:TimRiker "User:TimRiker") is
happy to answer email questions about it, but [Texas
Instruments](http://eLinux.org/Texas_Instruments "Texas Instruments") does not support it
at present. Add comments here.

1.  you need to have an older OSK. **Rev D1 and later have been reported
    to not work** Please contact [Spectrum
    Digital](http://eLinux.org/Spectrum_Digital "Spectrum Digital") and/or [Texas
    Instruments](http://eLinux.org/Texas_Instruments "Texas Instruments") and request an
    updated **Flash Recovery Utility** if you have a newer board.
    Unfortunately, [Tim Riker](http://eLinux.org/User:TimRiker "User:TimRiker") no longer
    works at [Texas
    Instruments](http://eLinux.org/Texas_Instruments "Texas Instruments"), so it's not
    likely that he will be able to provide an updated version. :(
2.  you need a USB-A-male to USB-A-male cable. This can be done with a
    common USB-A-male to USB-B-male cable and a USB-B-female to
    USB-A-male adapter.
3.  get the untility:
    [Media:OSK5912FlashRecoveryUtility.zip](http://eLinux.org/images/a/aa/OSK5912FlashRecoveryUtility.zip "OSK5912FlashRecoveryUtility.zip")
4.  unpack it on a windows XP host (other windows hosts might work)
5.  set JP3 to the left (pins 1-2)
6.  disconnect any serial or jtag cables from the OSK (thanx dave)
7.  connect the USB cables to the XP host
8.  power up the OSK
9.  windows should prompt for a driver
10. install it from the "`USB Windows Driver`" folder in extracted from
    the zip file.

To recover a dead OSK:

1.  run the **Flash Recovery Utility** from which is
    "`FlashRecoveryUtility\OSK Flash Recovery.exe`" 1, choose
    "`Connect and Download`"
2.  reset the OSK
3.  is should connect, download the reflash code, and bootloader:
    "`u-bootbinOSK`" and run the reflash code when unprotects the NOR
    flash and does the writes the bootloader to flash.

Note that you can replace the file "`u-bootbinOSK`" with a different
copy of uboot or any other loader if you like.

There have been some failures reported. This might be a useful comment:
[http://linux.omap.com/pipermail/linux-omap-open-source/2005-April/003491.html](http://linux.omap.com/pipermail/linux-omap-open-source/2005-April/003491.html)

    -------- Original Message --------
    Subject: Re: Flash Recovery Utilityfor OSK
    Date: Sun, 3 Apr 2005 16:16:35 -0700
    From: David Brownell
    To: linux-omap-open-source@linux.omap.com

    I just used this FRU to load U-Boot 1.1.3, and the essential
    undocumented trick seems to be disconnecting the serial line.

    With a serial line connected, nothing works.  Contrary to
    the documentation, you _must_ do more than change JP3.

    If it's disconnected, the USB enumeration behaves (on either
    Windows or Linux) and Windows will see the IDs listed in that
    INF file.  Then the driver install can work.  (Needs some
    hand-holding to find the driver file in same directory as
    that INF file, but it can work.)  And then you can follow
    the other instructions.

    - Dave

## Software Design Solutions licenses FRU

The OMAP Flash Recovery Utility was licensed to Software Design
Solutions, Inc. [Software Design
Solutions](http://www.softwaredesignsolutions.com). SDS Inc. now sells a
Flash Recovery Utility that supports the OSK5912 revision C and revision
D hardware.

[Software Design Solutions Customer
Support](http://www.softwaredesignsolutions.com/login.aspx?link=/regcode.aspx)

## How Does it Work?

Many OMAP chips support a "full boot" mode. There is an internal ROM in
the chip that the ARM CPU boots from. The ROM tries to talk over the
serial port to an external application. It can also support the USB port
in client mode. When you set JP3 on the OSK you are telling the OMAP to
boot in "full boot" mode. The ROM code is started and the device
enumerates on the SCSI bus. The FRU looks for this enumeration, and
sends a small app over USB which then runs. In this case the small app
will have u-boot attached to it as data, and the small app just contains
code to flash the data payload into NOR flash. Other applets can be
developed, but this FRU is just the basic feature. This FRU does not
support flashing over serial, though the hardware could do that too.

As an FYI: this internal ROM is also what is used to support "secure
boot". In "secure boot" the OMAP verifies a signed binary in some
external flash/ROM before running the code. If an OMAP is setup for
"secure boot" it will only run signed code. Contact TI for more
information on "full boot" or "secure boot" modes of the various OMAP
chips.

## OMAP Flash Loader

Luis Recuerda has made a new program, called OMAP Flash Loader
([Media:omapfl-1.0.tar.gz](http://eLinux.org/images/9/9c/Omapfl-1.0.tar.gz "Omapfl-1.0.tar.gz")),
that runs under Linux or other Unixes with libusb support. It is a GPL
program (with sources) that can be expanded easily to use diferent flash
chips (for new boards) and, perhaps, other OMAP processors.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")

