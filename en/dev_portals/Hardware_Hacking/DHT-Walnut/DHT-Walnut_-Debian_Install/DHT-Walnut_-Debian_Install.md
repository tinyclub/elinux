> From: [eLinux.org](http://eLinux.org/DHT-Walnut_-Debian_Install "http://eLinux.org/DHT-Walnut_-Debian_Install")


# DHT-Walnut -Debian Install



This page contains information on installing Debian on the DHT-Walnut
board.

[uImage.2.6.15.4-walnut-debinstall-df4](http://www.farnsworth.org/linuxppc/uImage.2.6.15.4-walnut-debinstall-df4)
contains a kernel and a ramdisk containing the Debian Netboot Installer.
The installer will download a basic Debian System from the internet and
install it to your hard disk. **Your DHT-Walnut board must have internet
access in order to use this installer.**

Download
[uImage.2.6.15.4-walnut-debinstall-df4](http://www.farnsworth.org/linuxppc/uImage.2.6.15.4-walnut-debinstall-df4)
and boot it on your walnut with commands similar to:

    setenv bootargs console=ttyS0,115200 root=/dev/ram

**tftpboot 1000000 uImage.2.6.15.4-walnut-debinstall-df4** **bootm**

*If you are using a different console device or baudrate, please adjust
the bootargs* environment variable as required.

After the kernel boots, the Debian Installer will automatically begin
and present a series of menus to proceed with the installation.

The Debian Installation Guide for [PowerPC](http://eLinux.org/PowerPC "PowerPC") is
available at
[http://www.debian.org/releases/stable/powerpc/index.html.en](http://www.debian.org/releases/stable/powerpc/index.html.en)

Since the Debian Installer image used here was *not* built specifically
for the DHT-Walnut board or for the specific kernel being used, the
following notes may be helpful.

-   The modules on the Installer image don't match the kernel, so you
    will see messages like

*No kernel modules were found. This probably is due to a mismatch*
*between the kernel used by this version of the installer and the*
*kernel version available in the archive.*

    This is not a problem, since the needed modules are already built into the kernel.

    When this question

     Continue the install without loading kernel modules?

    appears, simply answer Yes

-   You may see a message like

*Partition disks* *This partitioner doesn't have information about the
default type of* *the partition tables on your architecture.*

    If so, answer Yes to this question:
     Continue with partitioning?

-   When partitioning the hard disk, create a small (large enough to
    hold any kernel image you would want to boot) partition for the
    kernel image.

-   I have only had success installing the *stable* (*sarge*)
    distribution. *testing* (*etch*) and *unstable* (*sid*) would not
    install for me. This isn't really a problem because you can easily
    upgrade distributions after installing the base system.

-   When the installer asks you to choose a kernel to install, simply
    choose one of the provided options. The kernel will be installed in
    /boot, but we will not use it with the DHT-Walnut board. Later, you
    may remove the /boot directory entirely if you wish.

-   Use the instructions in [How to boot from hard
    disk](http://eLinux.org/DHT-Walnut_Booting_From_Hdd "DHT-Walnut Booting From Hdd") to
    boot from the hard disk. Since in my system, /dev/hda1 contains my
    kernel image and partition 4 contains the Debian root (http://eLinux.org/) directory,
    I use the following commands to boot from the hard disk.

*setenv bootargs console=ttyS0,115200 root=/dev/hda4* *bootdisk 0:1*


 Please let me know of any success or problems you encounter by sending
an e-mail to
[dale-elinux@farnsworth.org](mailto:dale-elinux@farnsworth.org) .


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")

