> From: [eLinux.org](http://eLinux.org/RPi_Kernel_Compilation "http://eLinux.org/RPi_Kernel_Compilation")


# Raspberry Pi Kernel Compilation


(Redirected from [RPi Kernel
Compilation](http://eLinux.org/index.php?title=RPi_Kernel_Compilation&redirect=no "RPi Kernel Compilation"))


<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Important_note">1 Important note</a></li>
<li><a href="#Overview">2 Overview</a>
<ul>
<li><a href="#Example_Checklist.2FRoadmap">2.1 Example Checklist/Roadmap</a></li>
</ul></li>
<li><a href="#Get_the_kernel_source">3 Get the kernel source</a></li>
<li><a href="#Get_a_compiler">4 Get a compiler</a>
<ul>
<li><a href="#1._On_the_Raspberry_Pi">4.1 1. On the Raspberry Pi</a>
<ul>
<li><a href="#Raspbian_and_PiBang">4.1.1 Raspbian and PiBang</a></li>
<li><a href="#Arch_Linux">4.1.2 Arch Linux</a></li>
<li><a href="#openSUSE_Linux">4.1.3 openSUSE Linux</a></li>
</ul></li>
<li><a href="#2._Cross_compiling_from_Linux">4.2 2. Cross compiling from Linux</a>
<ul>
<li><a href="#Use_the_provided_compiler">4.2.1 Use the provided compiler</a></li>
<li><a href="#Custom-built_Linaro_GCC">4.2.2 Custom-built Linaro GCC</a></li>
<li><a href="#Ubuntu">4.2.3 Ubuntu</a></li>
<li><a href="#Gentoo_Linux">4.2.4 Gentoo Linux</a></li>
<li><a href="#Arch_Linux_2">4.2.5 Arch Linux</a></li>
</ul></li>
<li><a href="#Cross_compiling_from_OS_X">4.3 Cross compiling from OS X</a>
<ul>
<li><a href="#Macports">4.3.1 Macports</a></li>
<li><a href="#Yagarto">4.3.2 Yagarto</a></li>
</ul></li>
</ul></li>
<li><a href="#Perform_the_compilation">5 Perform the compilation</a></li>
<li><a href="#Transfer_the_build">6 Transfer the build</a></li>
<li><a href="#Get_the_firmware">7 Get the firmware</a></li>
<li><a href="#Transfer_the_firmware">8 Transfer the firmware</a></li>
<li><a href="#Test_your_build">9 Test your build</a></li>
<li><a href="#Build_modules_for_the_running_kernel">10 Build modules for the running kernel</a>
<ul>
<li><a href="#1._Using_rpi-source">10.1 1. Using rpi-source</a></li>
<li><a href="#2._Manually">10.2 2. Manually</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Software & Distributions:**

*[Software](http://eLinux.org/RPi_Software "RPi Software") - an overview.*

*[Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") - operating
systems and development environments for the Raspberry Pi.*

*[Kernel Compilation](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation")
- advice on compiling a kernel.*

*[Performance](http://eLinux.org/RPi_Performance "RPi Performance") - measures of the
Raspberry Pi's performance.*

*[Programming](http://eLinux.org/RPi_Programming "RPi Programming") - programming
languages that might be used on the Raspberry Pi.*

# Important note

The instructions provided below appears to outdated, are inconsistent
and fail for the current version of the reffered repositories. Consider
[http://www.raspberrypi.org/documentation/linux/kernel/building.md](http://www.raspberrypi.org/documentation/linux/kernel/building.md),
for which the cross-compilation instructions is confirmed to work. (19
March 2015, tools: 783eb21c, linux: c4ba28133).

# Overview

This page explains how to rebuild the kernel image for the Raspberry Pi.
There are two possible routes available:

1.  Compile on the Raspberry Pi itself
2.  Cross compile on another Linux system

Both of these routes are covered below, however, you are strongly
recommended to follow the cross-compilation route. The low processing
power of the Raspberry Pi means that a local compile will take many
hours. A compilation of the latest kernel and modules took about 752
minutes (12h30m)!

If you want to compile an upstream kernel, rather than the Raspberry Pi
Foundation's downstream kernel, please see
[RPi\_Upstream\_Kernel\_Compilation](http://eLinux.org/RPi_Upstream_Kernel_Compilation "RPi Upstream Kernel Compilation")
for a few tips.

## Example Checklist/Roadmap

This section serves to hold a new user's hand just a bit more than some
of the other more generic information below in the document. To get more
information on the steps in the roadmap, search this page for additional
details. It assumes you can navigate filesystems, move files across
systems, and have a general understanding of compiling linux kernels,
filesystems, partitions, and block devices.

This series of steps yielded a successful custom/updated hardfp kernel
to a stock Raspbian installation, cross compiled from an AMD 64-bit
Debian system without regression on any kernel configuration options or
requiring modified boot parameters. Be aware that in the worst case, you
may need to overlay a stock set of kernel/modules/firmware on the
Raspberry Pi if something fails. If you do not know how to do this, then
a reimage of the SD card may be necessary. Assuming this is not an issue
for your configuration, continue onward:

1.  Get the latest Raspberry Pi kernel source
    ([https://github.com/raspberrypi/linux](https://github.com/raspberrypi/linux))
2.  Set an environment variable KERNEL\_SRC to point to the location of
    the source (for example, KERNEL\_SRC=/home/me/linux/ )
3.  Get the latest Raspberry Pi compiler (git clone
    [https://github.com/raspberrypi/tools](https://github.com/raspberrypi/tools))
4.  Set an environment variable CCPREFIX to point to the location of
    tools (for example,
    CCPREFIX=/home/me/tools/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin/arm-bcm2708-linux-gnueabi-
    )
5.  From the kernel clone location, clean the kernel source with "make
    mrproper"
6.  Pull the /proc/config.gz from the running Raspbian installation
7.  Prime the kernel with the old configuration by running "ARCH=arm
    CROSS\_COMPILE=\${CCPREFIX} make oldconfig"
8.  Modify the kernel configuration by either modifying the .config file
    or using "ARCH=arm CROSS\_COMPILE=\${CCPREFIX} make menuconfig"
9.  Build the new kernel by using "ARCH=arm CROSS\_COMPILE=\${CCPREFIX}
    make"
10. Set an environment variable, MODULES\_TEMP, to point to the location
    of the source (for example, MODULES\_TEMP=/home/me/modules/ )
11. Set aside the new kernel modules by using "ARCH=arm
    CROSS\_COMPILE=\${CCPREFIX} INSTALL\_MOD\_PATH=\${MODULES\_TEMP}
    make modules\_install"
12. From the tools clone location, in the mkimage directory, run
    "./imagetool-uncompressed.py \${KERNEL\_SRC}/arch/arm/boot/zImage"
13. Move the resulting kernel.img to the Raspberry Pi's /boot/ directory
14. Package up the modules into an archive such that at the top level,
    the structure looks like this:
    -   ./firmware
    -   ./firmware/brcm
    -   ./firmware/edgeport
    -   ./firmware/emi26
    -   ...
    -   ./modules
    -   ./modules/3.6.11+
    -   ./modules/3.6.11+/kernel
    -   ./modules/3.6.11+/kernel/lib
    -   ./modules/3.6.11+/kernel/fs
    -   ...

15. Move the modules archive to the Raspberry Pi and extract them such
    that the aforementioned firmware and modules directories overwrite
    /lib/firmware and /lib/modules
16. Get the latest Raspberry Pi firmware
    ([git://github.com/raspberrypi/firmware.git](git://github.com/raspberrypi/firmware.git))
17. Transfer the following files from the firmware/boot directory to the
    Raspberry Pi /boot directory:
    -   bootcode.bin
    -   fixup.dat
    -   start.elf

18. Transfer the firmware/hardfp/opt directory to the Raspberry Pi /opt
    directory
19. Reboot the Raspberry Pi

The Raspberry Pi should now boot with the newly configured/recompiled
kernel.

# Get the kernel source

The kernel source should be downloaded from the [Raspberry Pi Linux
section on GitHub](https://github.com/raspberrypi/linux). Although you
could just compile the vanilla kernel from
[Kernel.org](http://www.kernel.org/), it will not have the necessary
drivers and modules for the Broadcom SoC on the Raspberry Pi. You can
however apply patches from the vanilla kernel to the Raspberry Pi one -
be prepared for potential compiler grumbles though!

On Jan 2014, the current is rpi-3.10.y. You can check this and other
available versions by browsing [Raspberry Pi Linux section on
GitHub](https://github.com/raspberrypi/linux)

You can download the source directly using Git. For the 3.10 branch:

    git init
    git clone --depth 1 git://github.com/raspberrypi/linux.git

And for the other stable code branch, change the numbers in the
following to suit:

    git init
    git fetch git://github.com/raspberrypi/linux.git rpi-3.6.y:refs/remotes/origin/rpi-3.6.y
    git checkout rpi-3.6.y

Or you can download a tarball from the same website:

# Get a compiler

Next, you will need to get a version of GCC in order to build the
kernel.

## 1. On the Raspberry Pi

### Raspbian and PiBang

    apt-get update
    apt-get -y dist-upgrade
    apt-get -y install gcc make bc screen ncurses-dev

### Arch Linux

    pacman -Syu
    pacman -S gcc make

### openSUSE Linux

Detailed openSUSE Raspberry Pi 12.3 Image 20130407 + 3.8.8 kernel hack
tutorial witten (2013-04-22 updated) see:
[http://www.raspberrypi.org/phpBB3/viewtopic.php?f=87&t=40664&p=331953\#p331953](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=87&t=40664&p=331953#p331953)
The kernel compile takes about 22 hours on Raspberry Pi Model B due
massive module compiles. Include all IP\_VS, ARPD, Fuse-zfs, Zram and
more :-)

This works as well for Debian, Fedora Remix and others (just the package
install command differs):

    zypper install u-boot-tools sudo gcc automake autoconf bison gettext flex libncurses5 ncurses-devel

    cd /usr/src
    mkdir GIT; cd GIT; git init; D=`date +"%m-%d-%Y"`
    git fetch git://github.com/raspberrypi/linux.git rpi-3.8.y:refs/remotes/origin/rpi-3.8.y
    git checkout rpi-3.8.y
    tar cpf rpi-3.8.y.$D.tar   rpi-3.8.y

    cd /usr/src
    tar xpf  GIT/rpi-3.8.y.$D.tar
    rm linux
    ln -s linux-rpi-3.8.y linux

    cd /usr/src/linux
    kversion=$(make -s kernelrelease)
    cp linux/.config .config_$kversion

    cd /usr/src/
    # Get config-3.8.7.ipvs+krb5+arpd.tar.bz2 from the tutorial:
    wget http://www.raspberrypi.org/phpBB3/download/file.php?id=3174
    # Copy the .config file to /usr/src/linux:
    tar xpfj config-3.8.7.ipvs+krb5+arpd.tar.bz2


    #Make the kernel and go sleep :-)
    cd linux
    make oldconfig
    nohup make zImage dep modules &

    #The next day: Install it.
    cd /usr/src/linux
    kversion=$(make -s kernelrelease)
    echo $kversion
    mkdir -p  /boot/$kversion
    make ARCH=arm INSTALL_PATH=/boot/ install
    cp System.map /boot/System.map-$kversion
    cp System.map-$kversion /boot/System.map
    make ARCH=arm modules_install INSTALL_MOD_PATH=/
    make ARCH=arm INSTALL_PATH=/boot/ zinstall
    cp .config /boot/config-$kversion
    cp ./Module.symvers  /boot/symvers-$kversion
    cp arch/arm/boot/Image /boot/kernel.img

## 2. Cross compiling from Linux

Please note that when cross-compiling, your compiler may not target the
correct ARM processor by default. This will at best reduce performance,
or worse, compile for a much newer processor resulting in illegal
instructions in your code. The pre-built compiler or a custom-built
compiler are recommended because of this. (For example, the latest GCC
Linaro binary targets armv7-a by default, whereas the Raspberry Pi
requires armv6kz). It is possible to add extra compiler options to the
`HOSTCFLAGS` line in `Makefile`. The correct flags are shown on the
[software page](http://eLinux.org/RPi_Software#Compiler "RPi Software") - note that you
may also need to add `-marm` if your compiler produces Thumb code by
default.

### Use the provided compiler

Download the pre-built bmc2708 compiler from the [Raspberry Pi tools
section on
GitHub](https://github.com/raspberrypi/tools/tree/master/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi).

    git clone git://github.com/raspberrypi/tools.git --depth 1

Or you can download a tarball from the website using [this
link](https://github.com/raspberrypi/tools/archive/master.tar.gz).

### Custom-built Linaro GCC

See [Linaro GCC
Compilation](http://eLinux.org/RPi_Linaro_GCC_Compilation "RPi Linaro GCC Compilation").

### Ubuntu

    apt-get install gcc-arm-linux-gnueabi make ncurses-dev

### Gentoo Linux

    crossdev -S -v -t arm-unknown-linux-gnueabi

Crossdev should create a cross-toolchain using the latest stable
versions of the required packages. If it fails, you can specify exact
versions by removing the "-S" flag and adding the "--b", "--g", "--k"
and "--l" flags. On 2012-05-06, `cross -S -v -A gnueabi arm` works just
fine.

### Arch Linux

    yaourt -S arm-linux-gnueabi-gcc

## Cross compiling from OS X

### Macports

The kernel source requires a case-sensitive filesystem. If you do not
have a HFS+ case-sensitive partition that can be used, create a disk
image with the appropriate format. Ensure the latest versin of Xcode and
command line tools are installed from [Apple Developer
Connection](http://developer.apple.com/downloads) Install
[macports](http://guide.macports.org/#installing)

    port install arm-none-eabi-gcc
    port install arm-none-eabi-binutils

**If you get an error message that elf.h is missing**

    sudo port install libelf && sudo ln -s /opt/local/include/libelf /usr/include/libelf

From opensource.apple.com, download and copy
[elf.h](http://opensource.apple.com/source/dtrace/dtrace-48/sys/elf.h?txt)
and
[elftypes.h](http://opensource.apple.com/source/dtrace/dtrace-48/sys/elftypes.h?txt)
to /usr/include

Edit elf.h and add

    #define EM_S390           22
    #define R_386_NONE        0
    #define R_386_32          1
    #define R_386_PC32        2
    #define R_ARM_NONE        0
    #define R_ARM_PC24        1
    #define R_ARM_ABS32       2
    #define R_MIPS_NONE       0
    #define R_MIPS_16         1
    #define R_MIPS_32         2
    #define R_MIPS_REL32      3
    #define R_MIPS_26         4
    #define R_MIPS_HI16       5
    #define R_MIPS_LO16       6
    #define EM_S390           22
    #define R_MIPS_64         18
    #define R_390_64          22
    #define R_X86_64_64       1
    #define R_SPARC_64        32
    #define R_SH_DIR32        1
    #define R_PPC_ADDR32      1
    #define R_PPC64_ADDR64    38
    #define R_IA64_IMM64      0x23

**If you get a "SEGMENT\_SIZE is undeclared" error** open the Makefile
and change the line:

    NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)

to

    NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include) -Dlinux

**Complete script** requires raspberrypi.config to be in the same folder
that you execute from.

    sudo port install arm-none-eabi-gcc
    sudo port install arm-none-eabi-binutils
    sudo port install libelf && sudo ln -s /opt/local/include/libelf /usr/include/libelf
    sudo curl http://opensource.apple.com/source/dtrace/dtrace-48/sys/elftypes.h?txt -o  /usr/include/elftypes.h
    sudo curl http://opensource.apple.com/source/dtrace/dtrace-48/sys/elf.h?txt -o /usr/include/elf.h
    #code to append to elf.h
    echo "
    #define EM_S390 22
    #define R_386_NONE 0
    #define R_386_32 1
    #define R_386_PC32 2
    #define R_ARM_NONE 0
    #define R_ARM_PC24 1
    #define R_ARM_ABS32 2
    #define R_MIPS_NONE 0
    #define R_MIPS_16 1
    #define R_MIPS_32 2
    #define R_MIPS_REL32 3
    #define R_MIPS_26 4
    #define R_MIPS_HI16 5
    #define R_MIPS_LO16 6
    #define EM_S390 22
    #define R_MIPS_64 18
    #define R_390_64 22
    #define R_X86_64_64 1
    #define R_SPARC_64 32
    #define R_SH_DIR32 1
    #define R_PPC_ADDR32 1
    #define R_PPC64_ADDR64 38
    #define R_IA64_IMM64 0x23" > elf-append.h
    sudo -s 'cat elf-append.h >> /usr/include/elf.h'

    #Make a case sensitive 3 GB disk image, raspberrypi-kernel, and attach it:
    hdiutil create -size 10g -type SPARSEBUNDLE -nospotlight -volname raspberrypi-kernel -fs "Case-sensitive Journaled HFS+" -attach ./raspberrypi-kernel.dmg
    cp raspberrypi.config /Volumes/raspberrypi-kernel/
    mkdir /Volumes/raspberrypi-kernel/src
    cd /Volumes/raspberrypi-kernel/src

    #Get source, either 1. from a ZIP file (faster), or 2. from Git
    #1. From a ZIP file
    curl https://codeload.github.com/raspberrypi/linux/zip/rpi-3.6.y -o ./rpi-3.6.y.zip
    unzip rpi-3.6.y.zip
    #2. From Git (disabled)
    #git init
    #git fetch git://github.com/raspberrypi/linux.git rpi-3.6.y:refs/remotes/origin/rpi-3.6.y
    #git checkout rpi-3.6.y

    cpu=$(sysctl hw.ncpu | awk '{print $2}')
    cpup1=$((cpu+1))

    cd /Volumes/raspberrypi-kernel/src/linux-rpi-3.6.y/
    export CCPREFIX=/opt/local/bin/arm-none-eabi-
    make mrproper
    cp /Volumes/raspberrypi-kernel/raspberrypi.config .config
    #Answer yes to all config options
    #yes "" | make ARCH=arm CROSS_COMPILE=${CCPREFIX} oldconfig
    make ARCH=arm CROSS_COMPILE=${CCPREFIX} -j$cpup1
    #make ARCH=arm CROSS_COMPILE=${CCPREFIX} modules -j$cpup1

### Yagarto

Download and install from [here](http://www.yagarto.de/#downloadmac).

# Perform the compilation

Firstly, ensure your build directory is clean:

    make mrproper

Next, in all cases, you will want to get a working kernel configuration
to start from. You can get the one running on the Raspberry Pi by typing
the following (on the Raspberry Pi):

    zcat /proc/config.gz > .config

Then copy `.config` into your build directory.

Alternatively, the default configuration is available in the downloaded
kernel source in `arch/arm/configs/bcmrpi_defconfig`. Just copy this to
`.config` in the build directory.

From this point on, if you are cross-compiling, set an environment
variable `CCPREFIX` that points to the prefix of your compiler binary as
each compiler will be named slightly differently.

    export CCPREFIX=/path/to/your/compiler/binary/prefix-of-binary-

If you are building on the Raspberry Pi, remove
`ARCH=arm CROSS_COMPILE=${CCPREFIX}` from each command.

Ensure that your configuration file is up-to-date:

    make ARCH=arm CROSS_COMPILE=${CCPREFIX} oldconfig

If any configuration options have been added, you will be asked what set
each option to. If you don't know the answer, just press enter to accept
the default.

Optionally, if you want to make changes to the configuration, run this
next:

    make ARCH=arm CROSS_COMPILE=${CCPREFIX} menuconfig

Now you are ready to build:
 (On the Raspberry Pi, type 'screen' to open a virtual screen. If you
use it you can disconnect from the Raspberry Pi and compile
overnight...)

    make ARCH=arm CROSS_COMPILE=${CCPREFIX}

If you are on a multi-core system, you can make the build faster by
appending `-j<N>` where `<N>` is the number of cores on your system plus
one (that is, -j3 for two cores).

Find something else to get on with while the compilation takes place. On
an average PC with the default configuration, this should take about 15
minutes.

The modules will be build with the following command.

    make ARCH=arm CROSS_COMPILE=${CCPREFIX} modules

# Transfer the build

The fully built kernel will be `arch/arm/boot/Image`. Copy your new
kernel file into the Raspberry Pi boot partition, though preferably as a
new file (such as `kernel_new.img`) just in case it doesn't work. If
you're building on the Raspberry Pi, just copy the file to `/boot`. If
you use a different filename, edit `config.txt` change the kernel line:

    kernel=kernel_new.img
    #kernel=kernel.img

Now you need to transfer the modules. Set an environment variable that
points to a temporary module path.

    export MODULES_TEMP=~/modules

In the build directory, run the following command:

    make ARCH=arm CROSS_COMPILE=${CCPREFIX} INSTALL_MOD_PATH=${MODULES_TEMP} modules_install

The contents of this directory, a single

    lib

directory, should then be copied into the Raspberry Pi root directory,
merging or overwriting

    /lib

NOTE: If you have rebuilt the new kernel with exactly the same version
as the one that's running, you'll need to remove the old modules first.
Ideally this should be done offline by mounting the SD card on another
system.

NOTE: The lib directory will have symlinks back to the kernel sources
(lib/modules/\<kernel-version\>/source and
lib/modules/\<kernel-version\>/build). If you have limited space on the
SD card and don't intend to compile modules on the Raspberry Pi itself,
you will probably want to remove those links before you transfer the lib
directory. The size difference can be many hundreds of MB.

Your Raspberry Pi should now be ready to boot the new kernel. However,
at this point it's recommended that you update your GPU firmware and
libraries. **This is required if you've just moved from 3.2 to 3.6 as
the firmware interface has changed**.

# Get the firmware

The firmware and boot files should be updated at the same time to ensure
that your new kernel works properly. Again, two branches are available:

-   **master** - This is the version of firmware currently used in
    Raspbian (that is, it works with the 3.2 kernel).
-   **next** - This is a development branch which provides a newer GPU
    firmware to work with the updated drivers in the 3.6 kernel.

You can either download the source directly using Git: You can download
the firmware directly using Git. For the master branch:

    git clone git://github.com/raspberrypi/firmware.git

And for the next branch:

    git fetch git://github.com/raspberrypi/firmware.git next:refs/remotes/origin/next

Or you can download a tarball from the website using these links:
[master](https://github.com/raspberrypi/firmware/archive/master.tar.gz)
[next](https://github.com/raspberrypi/firmware/archive/next.tar.gz)

# Transfer the firmware

Firstly, update the required boot files in the Raspberry Pi `boot`
directory with those you've downloaded. These are:

-   bootcode.bin
-   fixup.dat
-   start.elf

Next, you need to copy the VC libraries over. There are two copies of
this: one for hard float and one for soft float. To find the correct
one, run the following command:

    ${CCPREFIX}gcc -v 2>&1 | grep hard

If something prints out, and you can see `--with-float=hard`, you need
the hard float ones. NOTE: The current version of Raspbian uses hard
float.

Remove the `/opt/vc` directory from the Raspberry Pi root, then:

-   For hard float, copy `vc` from the `hardfp/opt` directory into
    `/opt` in the Raspberry Pi root directory
-   Otherwise copy `vc` from the top-level `opt` directory into `/opt`
    in the Raspberry Pi root directory.

Note: The hard float vs soft float here refers only to the kernel
itself, not the functionality it provides. Your applications will still
be able to use hard floats. The kernel doesn't use floats anyway, so it
is not something to worry about as long as you select the correct `vc`
directory to copy.

# Test your build

Power cycle your Raspberry Pi and check the following:

-   If you have the serial port on the GPIO expander wired up, you
    should see the kernel booting.
-   The screen works - the kernel boots and you get a login prompt.
-   The VC interface is working - if the 'OK' LED flashes regularly
    eight or so times every few seconds once the OS has booted, it's
    not. You can also test this by running `vcgencmd measure_temp`. If
    it prints "VCHI initialization failed", you have the a mismatch
    between the firmware, the VC libraries, and the kernel driver.
-   Run `uname -a` and check that your new kernel is the one that's
    running.
-   Make sure you don't have any odd error messages during boot that may
    indicate a module isn't working properly. If you see
    `missed completion of cmd 18` regarding DMA transfers to the SD
    card, you can safely ignore it.

# Build modules for the running kernel

You need the kernel sources for the currently running kernel to
successfully build kernel modules for the Raspberry Pi. More
specifically, only parts of the complete source, the so called kernel
headers are needed. There are two ways to arrive at a state from which
you can build kernel modules on the Raspberry Pi.

[1.](http://eLinux.org/Raspberry_Pi_Kernel_Compilation#1._Using_rpi-source "Raspberry Pi Kernel Compilation")
is most suitable if you have been using Kernel sources from
raspberrypi.org

[2.](http://eLinux.org/Raspberry_Pi_Kernel_Compilation#2._Manually "Raspberry Pi Kernel Compilation")
is using only mainline kernel stuff

## 1. Using rpi-source

[rpi-source](https://github.com/notro/rpi-source/wiki) downloads a
matching source for the running kernel. It supports rpi-update kernels
and Raspian kernels.

Examples:
[https://github.com/notro/rpi-source/wiki/Examples-on-how-to-build-various-modules](https://github.com/notro/rpi-source/wiki/Examples-on-how-to-build-various-modules)

## 2. Manually

If you have used or want to stick with a vanilla (mainline) kernel,
there is a different way

You have been following the
[RPi\_Upstream\_Kernel\_Compilation](http://eLinux.org/RPi_Upstream_Kernel_Compilation "RPi Upstream Kernel Compilation")
guide, correct? Great, let's move on: That guide is not using modules,
so enable modules in make menuconfig first. Then execute

    $ ARCH=arm CROSS_COMPILE=${CCPREFIX} chrt -i 0 make -j 8
    $ ARCH=arm CROSS_COMPILE=${CCPREFIX} INSTALL_MOD_PATH=${MODULES_TEMP} make modules_install

The second line will create the .ko files and it will create the
necessary folder structure (http://eLinux.org/usr/src/linux/lib/modules/\`uname
-r\`/[build|kernel|source]. build and source are symlinks to the kernel
sources. kernel contains the module files (under some subdirectories).

Now you can continue with
[RPi\_Upstream\_Kernel\_Compilation](http://eLinux.org/RPi_Upstream_Kernel_Compilation "RPi Upstream Kernel Compilation")
compiling the bootloader and so on. Finally also copy the used kernel
sources onto the SD card, e.g. under /home/pi/linux

    $ cp -av /usr/src/linux/ <sdcard-ext4-root>/home/pi/

Boot the Raspberry Pi, then execute

    $ cd /home/pi
    $ sudo chown -R pi:pi linux/

to change back ownership to you (this is necessary unless your username
on your build machine is also "pi"...). Now copy
/home/pi/linux/lib/modules/\* to the correct

    $ sudo cp -R /home/pi/linux/lib/modules/`uname -r`/ /lib/modules/

Correct the symlinks:

    $ sudo cd /lib/modules/`uname -r`/
    $ sudo rm build source
    $ ln -s /home/pi/linux build
    $ ln -s /home/pi/linux source

Now, we need to fix one more problem: During the cross-compilation
build, a couple scripts were compiled for the host. We also need them
for the Raspberry Pi. Still on the Pi, this can be checked with e.g.

    $ file /home/pi/linux/scripts/recordmcount (returns something with x86-64)
    $ cd /home/pi/linux/
    $ make scripts
    $ file /home/pi/linux/scripts/recordmcount (now returns something with 32-bit and ARM)





-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

[Raspberry Pi](http://eLinux.org/R-Pi_Hub "R-Pi Hub")

**Startup**

[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - [SD Card
Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") - [Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") - [Advanced
Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") - [Beginners
Guide](http://eLinux.org/RPi_Beginners "RPi Beginners") -
[Troubleshooting](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting")

[![RpiFront.jpg](http://eLinux.org/images/thumb/9/96/RpiFront.jpg/167px-RpiFront.jpg)](http://eLinux.org/File:RpiFront.jpg)

**Hardware**

[Hardware](http://eLinux.org/RPi_Hardware "RPi Hardware") - [Hardware
History](http://eLinux.org/RPi_HardwareHistory "RPi HardwareHistory") - [Low-level
peripherals](http://eLinux.org/RPi_Low-level_peripherals "RPi Low-level peripherals") -
[Expansion Boards](http://eLinux.org/RPi_Expansion_Boards "RPi Expansion Boards")

**Peripherals**

[Screens](http://eLinux.org/RPi_Screens "RPi Screens") - [Cases](http://eLinux.org/RPi_Cases "RPi Cases")
- [Other Peripherals (Keyboard, mouse, hub,
wifi...)](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals")

**Software**

[Software](http://eLinux.org/RPi_Software "RPi Software") -
[Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") -
[Kernel](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation") -
[Performance](http://eLinux.org/RPi_Performance "RPi Performance") -
[Programming](http://eLinux.org/RPi_Programming "RPi Programming") - [VideoCore
APIs](http://eLinux.org/RPi_VideoCore_APIs "RPi VideoCore APIs") -
[Utilities](http://eLinux.org/RPi_Utilities "RPi Utilities")

**Projects**

[Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") -
[Guides](http://eLinux.org/RPi_Guides "RPi Guides") -
[Projects](http://eLinux.org/RPi_Projects "RPi Projects") -
[Tasks](http://eLinux.org/RPi_Tasks "RPi Tasks") -
[DataSheets](http://eLinux.org/RPi_DatasheetCategories "RPi DatasheetCategories") -
[Education](http://eLinux.org/RPi_Education "RPi Education") -
[Communities](http://eLinux.org/RPi_Community "RPi Community")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")
-   [Linux-kernel](http://eLinux.org/index.php?title=Category:Linux-kernel&action=edit&redlink=1 "Category:Linux-kernel (page does not exist)")

