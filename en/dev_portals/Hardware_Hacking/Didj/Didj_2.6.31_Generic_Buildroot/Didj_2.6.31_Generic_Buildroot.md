> From: [eLinux.org](http://eLinux.org/Didj_2.6.31_Generic_Buildroot "http://eLinux.org/Didj_2.6.31_Generic_Buildroot")


# Didj 2.6.31 Generic Buildroot



## Contents

-   [1 Description](#description)
-   [2 Prerequisites](#prerequisites)
-   [3 Software Needed](#software-needed)
-   [4 Installing Buildroot](#installing-buildroot)
-   [5 Compiling](#compiling)
-   [6 Uploading Firmware](#uploading-firmware)

## Description

Buildroot is a build environment for making a Rootfs and Kernel. The
Rootfs can be configured from a make menu allowing you to easily choose
various applications. The Kernel was modified from the 2011-12-15
Releases, which includes several modifications to remove [LeapPad1
Explorer](http://eLinux.org/LeapPad1_Explorer "LeapPad1 Explorer") and [Leapster
Explorer](http://eLinux.org/Leapster_Explorer "Leapster Explorer") hardware specific
code. To deal with the [Didj's](http://eLinux.org/Didj "Didj") slider volume control,
LFD, an included package in the sources was modified to apply changes to
the volume as input requires.

This firmware will set you up with Avahi, for zero config networking and
sshd. Also included are ncurses and Python with pyGame. Which could be
used for some quick and easy app launching as there is no GUI included,
only console on start up.

**!!Warning!!** This could potentially brick your device, but once
Emerald Boot is installed, assuming you don't over write it, you should
have an easy retry, should something go wrong.



## Prerequisites

-   [Console
    Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")
    or ssh client for development.
-   [Compile and Install
    Emerald-Boot](http://eLinux.org/Didj_Emerald_Boot "Didj Emerald Boot")
-   [OpenLF Buildroot](https://github.com/jrspruitt/OpenLF-Buildroot)
-   Linux host PC

## Software Needed

-   [OpenLFConnect](http://eLinux.org/LeapFrog_Pollux_Platform:_OpenLFConnect "LeapFrog Pollux Platform: OpenLFConnect")
-   [Surgeon for
    Didj](http://eLinux.org/LeapFrog_Pollux_Platform:_Surgeon#Didj_Patches "LeapFrog Pollux Platform: Surgeon")

## Installing Buildroot

On your host PC use git, or download and extract the archive to your
chosen location. Moving Buildroot after it has compiled the toolchain
may be problematic, so choose a good location now. I prefer
opt/buildroot myself.

    git clone https://github.com/jrspruitt/OpenLF-Buildroot.git

or

    wget https://github.com/jrspruitt/OpenLF-Buildroot/archive/master.zip

## Compiling

This will build you a Kernel zImage and rootfs.ubi to use when
installing with
[OpenLFConnect](http://eLinux.org/LeapFrog_Pollux_Platform:_OpenLFConnect "LeapFrog Pollux Platform: OpenLFConnect").
The first time you compile, can take a lot of time, as Buildroot
compiles the toolchain. Once that is built, compiling takes considerably
less time. It is good to choose your packages first and wisely, as
Buildroot allows you to add packages, but requires a full rebuild to
remove any. See [Buildroot
docs](http://buildroot.uclibc.org/downloads/manual/manual.html) for more
information.

There are two places to choose options for your Rootfs. As it stands it
is fairly bare bones, except for Python with pyGame, and ncurses.

-   make menuconfig, this command brings up the Buildroot options,
    'Package Selection' is where you will find various packages to
    install in your device's Rootfs.

-   make busybox-menuconfig, you will find even more options here.

The Kernel uses a patch file applied to the vanilla sources during the
build. So if you plan on doing any Kernel hacking, its best to set up
some vanilla sources alongside your LF sources so you can make a patch
to use in Buildroot. Also study the included patch, as a Didj volume
driver was included, along with several other changes. Admittedly this
is kind of cumbersome, experience with Buildroot may yield some
productivity enhancements here.

For advanced users of Buildroot, there is a board/OpenLF/Didj directory,
where you can find the Kernel patch, various defconfig files, and the
post build script files used during the build. Please refer to the
[Buildroot
documentation](http://buildroot.uclibc.org/downloads/manual/manual.html)
for further explanation of these configurations.

Now that you have everything selected run:

    $ make

If everything went correctly you should find your Kernel and Rootfs in
[Buildroot dir]/output/target/images/ a zImage and rootfs.ubi file.
Before installing you'll need to rename rootfs.ubi, to erootfs.ubi so
OpenLFC can find it, when uploading both at the same time. You will also
need a copy of bulk.ubi, the empty version from LF to utilize the rest
of the NAND for storage. Copy this into the directory with your kernel
and rootfs images.

## Uploading Firmware

Using OpenLFConnect, after you've installed [Emerald
Boot](http://eLinux.org/Didj_Emerald_Boot "Didj Emerald Boot"), you'll need to set the
Didj into USB Boot Mode. Hold both shoulder buttons and the ? button
while turning it on.

Boot surgeon:

    local> surgeon_boot /path/to/surgeon.cbf

Set profile to use:

    local>device_profile_load Extras/Profiles/openlf.cfg

Connect:

    local>dftp_connect

Change directory:

    remote> cd /[Buildroot dir]/output/target/images/

Wrap zImage in CBF structure:

    remote> cbw_wrap high kernel.cbf zImage

Update firmware:

    remote> dftp_update

Reboot and disconnect:

    remote> dftp_reboot

This should reboot your device, if not, cycle the power. At which point
you should see a Tux logo followed by a command line prompt. You now
have a basic Linux set up ready to go, waiting for you to develop
something useful for it. The warm module for [GPSP
Emulator](http://eLinux.org/Didj_gpSP_GBA_Emulator "Didj gpSP GBA Emulator") has been
built into the Kernel if you'd like to start there.


