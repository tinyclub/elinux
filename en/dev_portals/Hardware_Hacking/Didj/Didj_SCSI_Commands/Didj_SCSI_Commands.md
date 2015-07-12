> From: [eLinux.org](http://eLinux.org/Didj_SCSI_Commands "http://eLinux.org/Didj_SCSI_Commands")


# Didj SCSI Commands



This is a list and a couple methods of how to send SCSI Commands to the
Didj. Which can be used for various tasks, such as unlocking, locking,
and ejecting the Didj's USB storage.

## Contents

-   [1 Programs Needed](#programs-needed)
-   [2 List of Commands](#list-of-commands)
-   [3 Sending the commands](#sending-the-commands)
    -   [3.1 In Windows](#in-windows)
    -   [3.2 In Linux](#in-linux)
-   [4 Caution](#caution)

## Programs Needed

**In windows**

SCSI Utility v 0.1 or equivalent, note SCSI Utility is kind of buggy.

**In Linux**

sg3\_util

## List of Commands

-   0x12 = Inquiry
    -   returns product id, vendor id, device revision information.
        (Requires return Buffer Size be set to 96 bytes 0xFF seems to
        work in most cases, this is also a 6 byte command, where the
        others are 10).

-   0xC1 = Lock Device
    -   Locks Didj usb storage so it can't be accessed (Return Buffer
        Size 0).

-   0xC2 = Unlock Device
    -   Unlocks Didj usb storage so it can be accessed (Return Buffer
        Size 0).

-   0xC3 = Get Setting
    -   Returns 1 byte for Battery Level, 4 bytes for RTC, and 1 byte
        bool for needs\_repair)
    -   The second byte of the command is the setting value
        -   RTC Counter 1
        -   Battery Level 2
        -   Serial Number 3 (Listed in usb driver, but returns nothing.)
        -   Needs Repair 6

-   0xC4 = Set Setting
    -   Not actually Implemented

-   0xC5 = Clear Upload Data
    -   Not Implemented

-   0xC6 = Disconnect Ok
    -   Used for ejecting the Didj, will also cause it to check for new
        lighting boot or firmware file versions, and install them if
        present (Return Buffer Size 0).

-   0xC7 = Num Device Commands
    -   Not Implemented

-   0xFF = Device Cmd Undefined
    -   Not Implemented

## Sending the commands

All the custom commands are 10 byte, some of the standard SCSI Commands
are 6 byte, and may require extra values than 00 for certain bytes. For
the Get/Set commands, you'll need to have Byte 1 the second byte, be the
number of the setting you want, and for get you'll need to provide a
buffer size.



#### In Windows

Turn on Didj with USB connected. Then open SCSI Utility, under devices
look for "LeapFrogDidj" and right click on it, choose 'Execute Custom
CDB' which will bring up the Custom CDB dialog.

In BYTE 0 put the Command value, C1,C2,C3...Cn

For BYTE 1 thru BYTE 9 put the value 0 in

For BYTE 10 thru BYTE 15 leave them blank.

CDB Size should equal 10.

For Buffer Size value put 0.

Then click Execute, there will be a warning dialog box, as the wrong
command to the wrong drive, could cause serious issues, make sure
LeapFrogDidj is the drive selected, and click Yes.

In the Output windows you should get something like "Custom CDB: Custom
CDB executed successfuly".

If ejecting, the Didj should change screen images to the Ok to
disconnect screen, if unlocking in WinXP Autoplay searches, before
coming up with the dialog asking what you want to do.

#### In Linux

Turn on Didj with USB connected.


 Tail your messages with

    $ sudo tail -f /var/log/messages


 Plug in your Didj to the USB

Look in your messages for something like this

kernel: sd 5:0:0:0: Attached scsi generic sg2 type 0

Your looking for the sg with a number sg0, sg1, sg2 etc.


 Make sure you got sg3\_utils installed, it came stock with Ubuntu 9.10
for me. The command you'll be using is sg\_raw.


 To unlock the Didj

    $ sg_raw /dev/sg2 C2 00 00 00 00 00 00 00 00 00


 To eject the Didj

First unmount the Didj

    $ sg_raw /dev/sg2 C6 00 00 00 00 00 00 00 00 00


 To lock the Didj

    $ sg_raw /dev/sg2 C1 00 00 00 00 00 00 00 00 00

## Caution

Double check you got the right device, as the wrong command to the wrong
device, can be catastrophic.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

