> From: [eLinux.org](http://eLinux.org/CT-PC89E_Debian_Installer "http://eLinux.org/CT-PC89E_Debian_Installer")


# CT-PC89E Debian Installer



installing Debian Squeeze using Debian Installer is, with a few
limitations, as easy as installing Debian on any other system.

Before attempting this yourself, please read the information below
carefully. The installation procedure has been successfully tested, but
keep in mind that this is not rock solid code yet.

## Contents

-   [1 Known issues and limitations](#known-issues-and-limitations)
-   [2 kernel issues](#kernel-issues)
-   [3 installer limitations](#installer-limitations)
-   [4 Debian Installer functionality](#debian-installer-functionality)
-   [5 Installation tips](#installation-tips)
-   [6 Installation HOWTO](#installation-howto)
-   [7 Final remarks](#final-remarks)

## Known issues and limitations

The only real issues are because our kernel is not yet perfect.

## kernel issues

The installer uses and will install the 2.6.24.7 kernel Luke and I have
been working on. This kernel is still very much work in progress. Help
fixing the issues below would be very much appreciated!

Current known kernel issues are (roughly in order of importance):

-   Internal flash (mmcblk0) gets disabled (or reset) when external SD
    card is inserted/removed. Do \*NOT\* change the SD card while the
    installer or Debian is running.
-   System does not power off after shutdown; use the "reset" button on
    the bottom to power off the system after shutdown.
-   No driver for wireless networking available.
-   The dm9000 eth0 network device has some issues and is slow to come
    up. Once up it has been reliable for me.
-   The dm9000 is assigned a random MAC address on each boot, pending
    work on a device driver to read the DS2431 EEPROM where there is a
    MAC address stored.
-   Various other (less important) devices are not yet enabled or
    tested.

## installer limitations

-   Do \*not\* change mmcblk0p1; this is where u-boot and the kernel
    live...
-   The root file system \*must\* be formatted for ext2. Reason is that
    we don't have a initrd, so the driver for the root file system must
    be compiled into the kernel. Only ext2 and ext4dev are compiled in
    at the moment.
-   ext4 is \*not\* usable. Cause is probably an incompatibility between
    the version of ext4 available in 2.6.24 and Squeeze userland
    libraries and utilities. A newly created ext4 partition fails to
    mount. However, the existing MidFun ext4 partitions mount correctly.
-   The installer will install a "full" Debian base system, not a
    reduced emdebbian "grip" system. Maybe installing emdebbian Squeeze
    grip is possible, but that's untested. "Upgrading" to grip should be
    possible.
-   Repository Release files are \*not\* authenticated. Reason is that
    the installation uses a repository on alioth for custom packages
    which does not (yet) have a signed Release file.

## Debian Installer functionality

The installation is similar to "netboot" installs: only the initial
installer image is read from SD card; all additional installer
components and all packages are downloaded from the Internet. I have
opted for this in order to keep the external SD card completely free for
use for partitioning and the installed system.

All installer components that are specific to the CT-PC89E are included
in the initial installer image.

The installer has a number of customizations for the CT-PC89E:

-   a micro ramdisk piggybacked onto the installation kernel that loads
    the real installer image from SD card
-   the installer itself is \*not\* flashed, but runs entirely in RAM
-   extended timeout for DHCP because of the eth0 kernel issues
-   automatically adds package repository on alioth for:
    -   custom kernel package
    -   custom udev package: this package is identical to the Lenny
        version of udev, but with a version number bumped so it's higher
        than the current version of udev in Squeeze (I've used:
        160-really0.125-1)
-   installs hook scripts to run depmod and to flash the kernel to nand
-   guided partitioning is skipped by default as using it is completely
    unsuitable for use on mmcblk0p1

The custom package repository can be found at:

    http://arm-netbook.alioth.debian.org/dists/

The custom udev package is needed because the current version in Squeeze
requires a 2.6.26 or later kernel.

NOTE: the kernel will automatically be flashed to Nand (mmcblk0p1)
during the installation, and also later when upgraded using a suitable
kernel package.

## Installation tips

-   Do not create a swap partition; by all accounts using swap with
    flash is not a good idea.
-   It is possible, using partman, to delete mmcblk0p2 and mmcblk0p3
    and, create a new mmcblk0p2 partition of \~1.9GB. Or choose your own
    scheme, but \*do not\* touch mmcblk0p1.

## Installation HOWTO

Yes, I've put this at the bottom on purpose :-)

-   Create a VFAT partition on an SD card; the maximum \*total\*
    capacity of the SD card is 4GB; larger cards are not recognized by
    u-boot. Suggested size for the VFAT partition is 100MB; the
    partition \*must\* be partition 1.
-   Copy the Debian Installer files from
    [http://arm-netbook.alioth.debian.org/pub/CT-PC89E/debian-installer/](http://arm-netbook.alioth.debian.org/pub/CT-PC89E/debian-installer/)
    to the SD card. The files are:
    -   zImage\_dt\_update: kernel image + micro initial ram disk
    -   datang-epc.tar.gz: dummy tarball required by u-boot
    -   root.img: the actual Debian Installer image
-   Boot the netbook for a "firmware update" by holding the two touchpad
    buttons and then press and hold the power button. Keep all three
    buttons pressed until you see a blue Chinese text (which presumably
    says the "firmware" image is being loaded).
-   Install as usual, but please observe all the warnings listed above.

## Final remarks

With this milestone reached I'm going to reduce the time spent on the
netbook a bit. However, I will update the package repository and
installer images on alioth as improvements (in the kernel) become
available.

Please share your experiences and let me (and others) know of any
problems, on arm-netbooks@lists.phcomp.co.uk, or by editing the
"discussion" page on this wiki.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CT-PC89E](http://eLinux.org/index.php?title=Category:CT-PC89E&action=edit&redlink=1 "Category:CT-PC89E (page does not exist)")

