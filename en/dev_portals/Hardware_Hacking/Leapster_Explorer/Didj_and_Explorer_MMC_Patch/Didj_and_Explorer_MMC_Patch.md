> From: [eLinux.org](http://eLinux.org/Didj_and_Explorer_MMC_Patch "http://eLinux.org/Didj_and_Explorer_MMC_Patch")


# Didj and Explorer MMC Patch



The original source code for the MMC drivers that were released for the
2.6.31 (LX) kernel were not completed but lucky for us there was a patch
included that finishes them to a usable state.


 **Notice: Hot swapping is not supported yet and may lead to data loss
in the event that the card is not unmounted before it is removed.**

**As these drivers haven't been through extensive testing you should
backup any important information on the card before use.**

**Applies to the 2.6.31 kernel only**

Here are the files you will need (Located on Moogle's server for now)
[mmc\_patch\_Kconfig.patch](http://wtfmoogle.com/wp-content/uploads/2010/07/mmc_patch_Kconfig.patch)
[mmc\_patch\_lf1000-sdio.patch](http://wtfmoogle.com/wp-content/uploads/2010/07/mmc_patch_lf1000-sdio.patch)

To apply these patches just copy them to /drivers/mmc/host/ and type the
following

    patch lf1000_mmc.c < mmc_patch_lf1000-sdio.patch
    patch Kconfig < mmc_patch_Kconfig.patch

Now, when you do a make menuconfig, under Device Drivers, enable:

    <M> MMC/SD/SDIO card support

then

    <M>   MMC block device driver
    <M>   LF1000 SDIO controller support
    [*]     Enable SDIO controller 0

Save your configuration, then build the MMC drivers as modules by typing
the following:

    make -j Number of cpu cores+1
    sudo make modules_install

and your modules will be in /lib/modules/2.6.31-leapfrog on your system
ready for you to copy them over

on the device, it is best to copy them to
/lib/modules/2.6.31-leapfrog/kernel/drivers/mmc/

and then run:

    depmod

on your device. Note: depmod is only included in the busybox on the
explorer kernel.

**Reboot the device with the kernel you just compiled (it is now enabled
for the mmc device modules).**


 Using the kernel you just built, when you want to mount a card simply
type the following to load the modules

    modprobe lf1000_mmc

you will then see something like this:

    XXX: checking for SDIO...
    XXX: checking for SD...
    XXX: SD...
    mmc0: host does not support reading read-only switch. assuming write-enable.
    mmc0: new high speed SDHC card at address 0007

then type:

    modprobe mmc_block

you will then see something like the following

    mmcblk0: mmc0:0002 00000 3.82 GiB
    mmcblk0:
    p1

type the following to add the device such that it can be mounted (only
need to do this once, the first time)

    mdev -s


 To mount the card type

    mount /dev/mmcblk0p1 /mnt

and you will then have access to the files on your micro sd card in the
/mnt directory

to unmount the card simply type

    umount /dev/mmcblk0p1

much thanks to zucchini for the help


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

