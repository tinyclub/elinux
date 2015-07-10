> From: [eLinux.org](http://eLinux.org/Android_Kernel_Installation "http://eLinux.org/Android_Kernel_Installation")


# Android Kernel Installation



How to use a new kernel with the emulator or on a product.

In general, this will be very product-specific.

## Contents

-   [1 With the G1/ADP1](#with-the-g1-adp1)
    -   [1.1 Installing a boot image](#installing-a-boot-image)
-   [2 With the emulator](#with-the-emulator)
-   [3 On a board using an SDCARD](#on-a-board-using-an-sdcard)
    -   [3.1 OMAP EVM](#omap-evm)

## With the G1/ADP1

On the ADP1, you can boot using a specific kernel using fastboot, which
will send it to the board as part of the bootup sequence. Specify the
kernel as one of the parameters to the 'fastboot boot' option. See
[http://www.gotontheinter.net/content/fastboot-cheat-sheet](http//www-gotontheinter-net/content/fastboot-cheat-sheet)
for details.

### Installing a boot image

You can create a "boot" image directly, and install that to the boot or
recovery flash partition manually. This can be done either using a
running kernel or using fastboot.

See these instructions for doing that:
[http://android-dls.com/wiki/index.php?title=HOWTO:\-Unpack,\-Edit,\-and\-Re-Pack\-Boot\-Images](http//android-dls-com/wiki/index-php?title=HOWTO:-Unpack,-Edit,-and-Re-Pack-Boot-Images)

Also, you can install the kernel into a recovery image, and install the
recovery image using the system recovery procedure.

## With the emulator

You can specify the kernel to use with the emulator using the '-kernel'
command line option.

There are some interesting notes about using the emulator without
specifying a AVD file at:
[http://groups.google.com/group/android-platform/browse\-thread/thread/59-0fde1e9865a](http//groups-google-com/group/android-platform/browse-thread/thread/59-0fde1e9865a)

## On a board using an SDCARD

### OMAP EVM

For an OMAP EVM, using the Android image available from Mistral, place a
new uImage on the SDCARD at the root the vfat partition. The bootloader
will run the commands (from where??) to load the uImage and boot it-

Note that for the OMAP EVM, you need to have the board configured to
boot from sdcard, rather than from flash.


[Category](http://eLinux.org/SpecialCategories "Special:Categories"):

-   [Android](http://eLinux.org/CategoryAndroid "Category:Android")

