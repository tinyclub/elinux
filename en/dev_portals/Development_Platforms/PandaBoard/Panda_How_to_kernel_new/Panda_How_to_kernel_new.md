> From: [eLinux.org](http://eLinux.org/Panda_How_to_kernel_new "http://eLinux.org/Panda_How_to_kernel_new")


# Panda How to kernel new



## **The information posted below is atm outdated. A really nicer version was already done by km and can be found here [PandaBoard\#How\_To.27s](http://eLinux.org/PandaBoard#How_To.27s "PandaBoard")**

* * * * *

* * * * *

* * * * *

* * * * *

* * * * *

* * * * *

This page is still a work in progress,--- km..3/3/2011

There have been few changes between 2.6.38-rc3 and -rc4, -rc5, and -rc6
that effect the pandaboard, but -rc7 has some changes on arch/omap2.
More omap related changes are being pushed into mainline during each
release, so this page will be updated every -rcx release to at least
note any build or .config issues.

-   There have been no changes that affect the Pandaboard (directly) in
    -rc5 and -rc6, but there have been some regressions in the mainline
    code, so we'll skip 2.6.38-rc5 and -rc6.

-Kernel building for kernel 2.6.38-rc3, 2.6.38-rc4 and 2.6.38-rc7.

Newer kernels require that you use a more recent MLO (x-loader) and
u-boot than described in previous How-To's.

You can build these from source, or try to find binaries. One issue with
the binary route is that you might want to alter the kernel command line
embedded inside u-boot. Such as for experimenting with different
partition formats, or different filesystem types (ext3 vs ext2), etc. Of
course you could stop the autoboot and type it in yourself, but we will
build from source.

For this How-to, we will use the Code Sourcery G++ version arm-2009q3.
It should already be installed on your system. Kernels have also been
successfully built with arm-2010q1.


 First, let's get the x-loader source code and build it.

    git clone git://gitorious.org/x-loader/x-loader.git

cd to the x-loader directory

Then using git or gitk make and check out a new branch at the commit
"6f3a261 omap1: remove support for 1710 and 1510"

Next, select the panda config:

    make CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi- omap4430panda_config

Now compile MLO:

    make CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi- ift

This should produce the MLO file in the x-loader directory.



Now for U-boot:

    git clone git://git.denx.de/u-boot.git

cd to the u-boot directory

Then using git or gitk make and check out a new branch at tag: v2010.12

Next, select the panda config:

    make CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi- omap4_panda_config

Change ttyS2 to ttyO2 in the u-boot kernel command line in:
u-boot/include/configs/omap4\_panda.h

Now compile U-boot:

    make USE_PRIVATE_LIBGG=yes CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi-

This should produce u-boot.bin in the u-boot directory


 Now for the kernel:

Either download
[http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.38-rc3.tar.bz2](http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.38-rc3.tar.bz2),
[http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.38-rc4.tar.bz2](http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.38-rc4.tar.bz2)
or
[http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.38-rc7.tar.bz2](http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.38-rc7.tar.bz2)

or

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

-Warning- this will be a really big download

cd to the appropriate root directory

If you downloaded the .tar.bz2 file you can dkip this step.

Using git or gitk make and check out a new branch at tag: v2.6.38-rc3,
v2.6.38-rc4 or v2.6.38-rc7.

Next, select the panda config:

    make ARCH=arm omap2plus_defconfig

Now compile the kernel:

    make -j10 V=99 ARCH=arm CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi- uImage


 In these newer kernels the ttyOx serial ports are given dynamic major
minor node numbers, it is important to have your rootfs use udev or mdev
to figure out which ones they are.

Put the MLO, uboot.bin and uImage on your vfat partion of your SD card,
insert into your trusty pandaboard and power it up. Depending on your
rootfs and whether your udev/mdev is setup and working, the kernel
should boot. udev/mdev problems will occur when init tries to run
inittab.

Once you have the kernel booting, go back and

     make ARCH=arm menuconfig

and turn on the usb networking, EHCI and whatever else you might want to
play with, then rebuild the kernel.

Or, just use this config
[config.2.6.38-rc3](http://eLinux.org/images/3/3c/Config.2.6.38-rc3 "Config.2.6.38-rc3")
as it has only the changes needed for the pandaboard's usb networking
and EHCI.

-Note- this config works for 2.6.38-rc4 and -rc7 as well. Just remember
to run make ARCH=arm oldconfig to update things that were changed in the
new -rcx.


 USB and ethernet work, but hdmi video does not as of 2/2/2011.

Here is what should come out the serial port during bootup (followed up
by my testing of the ethernet):
[http://paste.ubuntu.com/561130/](http://paste.ubuntu.com/561130/)

Of course that is my rootfs, which was built here:
[http://elinux.org/Panda\_How\_to\_buildroot](http://elinux.org/Panda_How_to_buildroot)

With the sysinit part of inittab looking like this:

    # Startup the system
    ::sysinit:/bin/mount -t proc proc /proc
    ::sysinit:/bin/mount -o remount,rw /
    ::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 tmpfs /dev
    ::sysinit:/bin/mkdir /dev/pts
    ::sysinit:/bin/mount -t devpts devpts /dev/pts
    ::sysinit:/bin/mknod -m 660 /dev/console c 5 1
    ::sysinit:/bin/mknod -m 660 /dev/null c 1 3
    ::sysinit:/bin/mount -t sysfs sysfs /sys
    null::sysinit:/bin/echo /sbin/mdev > /proc/sys/kernel/hotplug
    null::sysinit:/sbin/mdev -s
    null::sysinit:/bin/mount -a
    null::sysinit:/bin/hostname -F /etc/hostname
    # now run any rc scripts
    ::sysinit:/etc/init.d/rcS


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [Omap4430](http://eLinux.org/Category:Omap4430 "Category:Omap4430")
-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")

