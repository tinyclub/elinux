> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_USB_Boot "http://eLinux.org/Leapster_Explorer:_USB_Boot")


# Leapster Explorer: USB Boot



## Contents

-   [1 Summary](#summary)
-   [2 Programs Needed](#programs-needed)
-   [3 Software Needed](#software-needed)
-   [4 Hardware Needed](#hardware-needed)
-   [5 Getting Started](#getting-started)
-   [6 Scripting for USB Boot Mode](#scripting-for-usb-boot-mode)
-   [7 Using Surgeon](#using-surgeon)

## Summary

The [LeapPad Explorer](http://eLinux.org/LeapPad_Explorer "LeapPad Explorer") and [|
Leapster Explorer](http://eLinux.org/Leapster_Explorer "Leapster Explorer") respective
bootloaders contain a feature that allows for a recovery mode, called
Surgeon. When put into this mode and connected to LFConnect, it will
upload and install a new firmware to your device. There are a few ways
to do this yourself also.



## Programs Needed

sg3\_utils used in a script shell/python etc

-   Available here [[1]](http://sg.danny.cz/sg/sg3_utils.html)
-   Probably included in Linux.
-   Windows port available at link.

[OpenLFConnect](http://eLinux.org/LeapFrog_Pollux_Platform:_OpenLFConnect "LeapFrog Pollux Platform: OpenLFConnect")

-   Python program that includes Windows sg3\_utils or uses your Linux's
    built in version.



## Software Needed

surgeon.cbf (found in the package)

-   LPAD-0x001E0011-000000.lfp
-   LST3-0x00170028-000000.lfp
-   Or you can [Modify a Kernel for USB
    Boot](http://eLinux.org/Leapster_Explorer:_Testing_Kernels_via_USB_Boot "Leapster Explorer: Testing Kernels via USB Boot")

## Hardware Needed

For using Surgeon once booted.

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")



## Getting Started

If you choose to use OpenLFConnect refer to it's section [OpenLFConnect
USB
Booting](http://eLinux.org/LeapFrog_Pollux_Platform:_OpenLFConnect#USB_Booting "LeapFrog Pollux Platform: OpenLFConnect")

You will need to connect your device through a USB cable to your host
PC. Also have your Surgeon.cbf or custom file ready. Note any file you
send will need to conform to the [CBF File
Format](http://eLinux.org/LeapFrog_Pollux_Platform:_File_Format_CBF "LeapFrog Pollux Platform: File Format CBF").

**Starting USB Boot Mode**

**Explorer** Hold down both shoulder buttons, and the ? button, before
turning the device on.

**LeapPad** Unknown how to start with button presses at this time.

Once in USB Boot mode the device is ready to accept your file. You'll
need a script or program of some sort, please refer to the next section
on the mechanics of the process.

## Scripting for USB Boot Mode

You'll need sg\_raw and sg\_verify from the sg3\_utils package. You will
also need to find the device id, this is done by running the sg\_scan
program in terminal, on windows with no options or for Linux run
sg\_scan -i.

This will give you a list of generic scsi devices on the system, if your
device is connected correctly and in USB Boot Mode, you should see a
line that includes LeapFrog in it. This listing will contain the device
name.

**Windows**

We want the Physical Drive number here, you should see something on the
LeapFrog line such as PD1, or PD2, depending on the number of attached
drives on your system.

**Linux**

Here we want the /dev file. The line directly above should include
/dev/sg2 or /dev/sg3 depending on your system configuration.

**Sending Data**

With this information in hand, you can now run a loop to grab and send
the file data. This should be possible in most any language, so I'll
just get the particulars across.


 CBF\_PACKET\_SIZE = 16384

    * This is set by the bootloader, and is the size of data it expect on each pass.

byte1 = '00'

-   This will be the LSB of the LBA, it needs to be changed to 01 after
    the first pass, after that, doesn't matter.

file\_position

-   Keeps track of where we are in the file, while looping through the
    data.

Data Send Loop

-   sg\_raw is provided a file to take data from
-   the loop will control where and how much

sg\_raw /dev/sg2 -b -s CBF\_PACKET\_SIZE -n -k file\_position -i
"path/to/surgeon.cbf" 2A 00 00 00 00 byte1 00 00 20 00

This is a SCSI Write(10) command 0x2A that will send 16384 bytes of
data, from file surgeon.cbf starting at file\_position.

You should receive a "Status:Good" after each send, if not, there is an
issue.

Once all the data has been sent the verify command is sent, which seems
to tell the bootloader EOF on the send. The device should start booting
Surgeon after this if all went well.

Verify

-   sg\_verify /dev/sg2



## Using Surgeon

Mounting stock Explorer / and /LF/Bulk

Once surgeon.cbf has been booted, you can use the serial console as
normal. This script mounts /patient-bulk and /patient-rfs which are the
device's normal partitions. This can be used to edit files, or fix
problems with out conflicting with the OS as they are not ever in use in
this state.

    ./etc/init.d/recovery-mounts start


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")

