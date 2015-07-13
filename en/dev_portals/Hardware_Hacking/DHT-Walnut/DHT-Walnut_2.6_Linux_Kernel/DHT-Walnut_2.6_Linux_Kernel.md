> From: [eLinux.org](http://eLinux.org/DHT-Walnut_2.6_Linux_Kernel "http://eLinux.org/DHT-Walnut_2.6_Linux_Kernel")


# DHT-Walnut 2.6 Linux Kernel



## Linux Kernel v2.6.15

Here is a 2.6.15 kernel, built from unmodified source code found
[here](http://kernel.org/pub/linux/kernel/v2.6/patch-2.6.15.4.bz2).

-   [uImage.2.6.15.4-walnut-df4](http://www.farnsworth.org/linuxppc/uImage.2.6.15.4-walnut-df4)
-   [config.2.6.15.4-walnut-df4](http://www.farnsworth.org/linuxppc/config.2.6.15.4-walnut-df4)

(this latest image adds CONFIG\_MATH\_EMULATION, CONFIG\_I2C,
CONFIG\_CRAMFS, CONFIG\_DEVFS\_FS, and CONFIG\_PACKET)

This kernel works with ppcboot 1.1.6 or the U-Boot bootloader available
[wiki:DHT-Walnut-U-Boot here].

The following things have been tested and all seem to work:

-   10/100 Ethernet port
-   IDE with drives on /dev/hda and /dev/hdb
-   Firewire with the PCI card sold with the DHT-Walnut. I tested a
    Firewire DVD-writer.
-   USB with an PCI OHCI adapter
-   Console on Matrox video FB using a USB keyboard
-   NFS root filesystem
-   standalone system with root=/dev/hda1 and matrox fb console with usb
    keyboard.

All the on-board hardware seems to be supported by the vanilla 2.6.15
kernel.

Note: To set the Linux console baud rate to 115200, add
"console=ttyS0,115200" to the U-Boot bootargs environment variable.

Please let me know of any success or issues you encounter.
[dale-elinux@farnsworth.org](mailto:dale-elinux@farnsworth.org).


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")

