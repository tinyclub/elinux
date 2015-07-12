> From: [eLinux.org](http://eLinux.org/Didj_USB_Mounting "http://eLinux.org/Didj_USB_Mounting")


# Didj USB Mounting



This is a list of various techniques for mounting the Didj as a USB
drive under Windows, Linux, and OS X. These techniques will make the
/Didj folder on the Didj available, give you access to Base/ Data/ and
ProgramFiles/ where you will find most of the image and sound files used
by the AppManager for the GUI, plus other various files in use, except
for the underlying linux system files.

## Contents

-   [1 Prerequisites](#prerequisites)
-   [2 Programs Needed](#programs-needed)
-   [3 Hardware Needed](#hardware-needed)
-   [4 On Didj](#on-didj)
-   [5 Under Windows](#under-windows)
    -   [5.1 With LFConnect Running](#with-lfconnect-running)
    -   [5.2 usbctl on Didj](#usbctl-on-didj)
    -   [5.3 Assigning Drive Letter](#assigning-drive-letter)
    -   [5.4 SCSI Command](#scsi-command)
-   [6 Under Linux](#under-linux)
    -   [6.1 scsi\-custom](#scsi-custom)
    -   [6.2 SCSI Command](#scsi-command-2)
    -   [6.3 Udev Rule](#udev-rule)
-   [7 Under OS X](#under-os-x)

## Prerequisites

[Disable LFConnect Auto Start
Feature](http://eLinux.org/LeapFrog_Pollux_Platform:_LFConnect#Disable_Auto_Start "LeapFrog Pollux Platform: LFConnect")

-   This prevents LFConnect from interfering with the techniques that do
    not want it running.

## Programs Needed

SCSI Command technique

-   sg3\_util for Linux.
-   SCSI Utility v0.1 for Windows.

## Hardware Needed

Required for usbctl options.

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")



## On Didj

This method will leave your Didj partition permanently 'unlocked.' It
will always be available to be mounted on a host PC. But will not be
available for the Didj itself. It will not automount on the host unless
the USB cable is plugged in when the Didj has already been booted.

*On Didj*

    echo "UNLOCKED" > /flags/usb_mass_storage

## Under Windows

#### With LFConnect Running

When connecting the Didj to Windows under USB, the contents will be
mounted in one of these folders, depending on your version of windows.

    C:\Documents and Settings\All Users\Application Data\Leapfrog\LeapFrog Connect\Mnt\<Didj Serial Number>\0
    C:\ProgramData\Leapfrog\LeapFrog Connect\Mnt\<Didj Serial Number>\0

LFConnect Software must be installed, and allowed to open for this to be
accessible.

#### usbctl on Didj

LFConnect still must be installed, but this will prevent the need to
have it running.

You will have to run this command on the Didj from a terminal, to unlock
it. *On Didj*

    $ usbctl -d mass_storage -a unlock

#### Assigning Drive Letter

[Assign Drive Letter Pictures](http://wtfmoogle.com/?page_id=741)

With LFConnect disabled from auto starting, you can assign a drive
letter, and access it like a normal drive *On Didj*

/etc/init.d/lightning stop

usbctl -d mass\_storage -a unlock

usbctl -d mass\_storage -a enable

Make sure Monitor.exe is disabled, which can be done via Task Manager,
then plug your Didj in.

Go to Administrative Tools \> Computer Management \> Disk Management

Right click the drive, and select *Change Drive Letters and Paths* click
*Add* and assign the letter.

As long as you don't allow LFConnect to open, the drive letter will be
recognized, even after reboot. You will have to continue using the
commands on your Didj to access it, unless you create a custom script on
the Didj to handle this.

#### SCSI Command

[SCSI Commands
Windows](http://eLinux.org/Didj_SCSI_Commands#In_Windows "Didj SCSI Commands")

Commands go in byte 0

-   C1 = Unlock (mount)
-   C2 = Lock (unmount)
-   C6 = Eject.

## Under Linux

#### scsi\_custom

This is a program provided in the Didj sources.

Compile the program
Didj-Linux-4222-20090422-1236\\host\_tools\\scsi\\scsi\_custom.c with

    $ gcc -o scsi_custom scsi_custom.c


 Tail your messages with

    $ sudo tail -f /var/log/messages


 Plug in your Didj to the USB

Look in your messages for something like this

    kernel: sd 5:0:0:0: Attached scsi generic sg2 type 0

Your looking for the sg with a number sg0, sg1, sg2 etc.


 Now run the scsi\_custom app

    $ sudo scsi_custom -c unlock /dev/sg<your number>

And depending on your system, it should auto mount the Didj as a USB
drive.



#### SCSI Command

[SCSI Commands Linux](http://eLinux.org/Didj_SCSI_Commands#In_Linux "Didj SCSI Commands")



#### Udev Rule

This is a permanent solution, as the device will be unlocked on plug in
by udev. It requires your Linux system to be using udev and have
sg3\_utils installed, which seems rather common.

Create a text file named something like 99-LeapFrog-Didj.rules the
number is the order it is called in, 99 works good. Insert this text all
on one line:

    SUBSYSTEM=="scsi_generic", KERNEL=="sg*", ACTION=="add", ATTRS{vendor}=="LeapFrog", ATTRS{model}=="Didj",
    MODE="666", NAME="didj", RUN+="/usr/bin/sg_raw /dev/didj C2 00 00 00 00 00 00 00 00 00"

This will run the sg\_raw command to unlock the Didj, it also gives it a
persistent device name of Didj, so you can further access it thru sg
commands with /dev/didj. Also note you won't need sudo as the
permissions are changed for regular users.

Finally:

    $ sudo chown root:root 99-LeapFrog-Didj.rules
    $ sudo chmod 644 99-LeapFrog-Didj.rules
    $ sudo cp 99-LeapFrog-Didj.rules /etc/udev/rules.d/

You may have to restart your system for it to take effect or try
running:

    $ sudo udevadm test /sys/class/scsi_generic/sg2/

## Under OS X

Easier than Windows or Linux.


 Plug in your Didj to the USB


 Now you can access the didj using terminal or in Finder by selecting
the "Go" menu and using "Go to Folder..."

navigate to /Users/\*current\_user\*/.lf\_mount\_points/


 Once you have access to your Didj you can force quit LeapFrog Connect
if it's bothering you. Quitting normally causes it to eject the Didj.
However, you won't be able to unmount the Didj from finder, it keeps
mounting again once it's unmounted. To safely disconnect the Didj you'll
have to open LeapFrog Connect again and use the eject button inside the
application.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

