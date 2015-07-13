> From: [eLinux.org](http://eLinux.org/DaVinci_USBHost_1.0 "http://eLinux.org/DaVinci_USBHost_1.0")


# DaVinci USBHost 1.0



USB Host Guide 1.0

cd into your kernel lsp directory.

Run

    make menuconfig.

Select drivers -\> SCSI.

Enable scsi disk support and enable Probs multiple LUN option.

Select drivers -\> USB.

Enable Host-side USB.

Enable USB device filesystem.

Enable USB Mass Storage Device option.

Get the kernel onto your board in the usual way.

Make sure the jumper by the USB port is in the right location for HOST
mode (check manual).

    mkdir /usbdrive

insert your USB card reader

mount your card using:

    mount /dev/sdXX /usbdrive -o sync

where XX = a1, a2, a3, b1 etc..

Enjoy!


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [DaVinci](http://eLinux.org/Category:DaVinci "Category:DaVinci")

