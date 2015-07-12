> From: [eLinux.org](http://eLinux.org/Didj_Common_Commands "http://eLinux.org/Didj_Common_Commands")


# Didj Common Commands



This is a collection of useful commands to have when accessing your Didj
from the command prompt. Its meant as a quick reference guide, for more
complex procedures look in the [How
To'ssection](http://eLinux.org/Didj#Tutorials.2FHow_To.27s_Tutorials "Didj") of the Didj
Wiki main page.

## Contents

-   [1 AppManager](#appmanager)
    -   [1.1 Stop Start Restart](#stop-start-restart)
    -   [1.2 Permanently Prevent
        Starting](#permanently-prevent-starting)
-   [2 USB](#usb)
    -   [2.1 USB File Storage](#usb-file-storage)
-   [3 Make Root Partition Writable](#make-root-partition-writable)
-   [4 Manufacturer's Partition](#manufacturer-s-partition)
-   [5 Display Commands](#display-commands)

## AppManager

#### Stop Start Restart

    /etc/init.d/lightning (start | stop | restart)

#### Permanently Prevent Starting

First, make the root partition mountable.

In the /etc/rc.d folder, remove these files, or back them up to a
different folder.

    rm K50example
    rm S50example
    rm K51lightning
    rm S51lightning



## USB

#### USB File Storage

The USB mass\_storage driver on the stock Didj, requires a few commands
be run after its been connected to a host PC, before it will mount like
a normal USB drive.

*On Didj*

**Mount on Host**

    usbctl -d mass_storage -a enable
    usbctl -d mass_storage -a unlock

**Mount on Didj**

    usbctl -d mass_storage -a disable
    usbctl -d mass_storage -a lock


 **Normal Mount Command**

Mount the /Didj file system

    mount -t vfat -o async,noatime /dev/mtdblock9 /Didj



## Make Root Partition Writable

(note) NAND partitions can not be shared by USB host and device
simultaneously. Developers should use the usbctl command judiciously to
avoid corrupting NAND.

*On Didj*

    mount -o remount, rw /

## Manufacturer's Partition

*Mount Partition*

    mount -t jffs2 $mfgdatamnt /mnt2/mfgfg

*Make Writable*

    mount -o remount,rw /mfgdata

## Display Commands

*Power off the screen*

    mlc-control /dev/mlc s enable off


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

