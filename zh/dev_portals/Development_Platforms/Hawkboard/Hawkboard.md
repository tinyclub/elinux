> From: [eLinux.org](http://eLinux.org/Hawkboard "http://eLinux.org/Hawkboard")


# Hawkboard



[![Hawk
sticker1.JPG](http://eLinux.org/images/3/38/Hawk_sticker1.JPG)](http://eLinux.org/File:Hawk_sticker1.JPG)

Access Beginners Guide to Hawkboard if you are new to Development on
Hawkboard
[http://elinux.org/Hawkboard/BeginnersGuide](http://elinux.org/Hawkboard/BeginnersGuide)



## Contents

-   [1 Hardware Details](#hardware-details)
-   [2 Software Details](#software-details)
    -   [2.1 Tools & Softwares
        Downloads](#tools-26-softwares-downloads)
        -   [2.1.1 Tools From Other Vendors](#tools-from-other-vendors)
        -   [2.1.2 JTAG emulators](#jtag-emulators)
    -   [2.2 Misc Tools](#misc-tools)
    -   [2.3 Sources](#sources)
    -   [2.4 Sample Rootfs](#sample-rootfs)
-   [3 Getting Started](#getting-started)
    -   [3.1 Command prompts in this
        guide](#command-prompts-in-this-guide)
-   [4 Building & Booting Uboot images from
    source](#building-26-booting-uboot-images-from-source)
    -   [4.1 Setting up the Linux
        Environment](#setting-up-the-linux-environment)
    -   [4.2 Compiling u-boot
        (bootloader)](#compiling-u-boot-bootloader)
    -   [4.3 Signing u-boot for UART
        boot](#signing-u-boot-for-uart-boot)
    -   [4.4 Signing u-boot for NAND
        boot](#signing-u-boot-for-nand-boot)
    -   [4.5 Booting](#booting)
        -   [4.5.1 Booting u-boot over UART](#booting-u-boot-over-uart)
        -   [4.5.2 Procedure to flash u-boot on
            NAND](#procedure-to-flash-u-boot-on-nand)
        -   [4.5.3 Booting u-boot over NAND](#booting-u-boot-over-nand)
-   [5 Building & Booting Kernel images from
    source](#building-26-booting-kernel-images-from-source)
    -   [5.1 Compiling Linux Kernel](#compiling-linux-kernel)
    -   [5.2 Booting](#booting-2)
        -   [5.2.1 Booting Linux Kernel and Mounting
            RAMDISK](#booting-linux-kernel-and-mounting-ramdisk)
        -   [5.2.2 Booting Linux Kernel and Mounting NFS (Network File
            System)](#booting-linux-kernel-and-mounting-nfs-network-file-system)
            -   [5.2.2.1 Setting NFS Server](#setting-nfs-server)
            -   [5.2.2.2 Booting Board using
                NFS](#booting-board-using-nfs)
        -   [5.2.3 Booting Linux Kernel from
            USB](#booting-linux-kernel-from-usb)
        -   [5.2.4 Booting Linux Kernel from
            SATA](#booting-linux-kernel-from-sata)
        -   [5.2.5 Booting Linux Kernel from SD OR
            MMC](#booting-linux-kernel-from-sd-or-mmc)
        -   [5.2.6 MISC](#misc)
-   [6 Custom RootFS](#custom-rootfs)
-   [7 Making Use of the C6740 DSP
    Core](#making-use-of-the-c6740-dsp-core)
-   [8 FAQs](#faqs)
-   [9 Common Issues](#common-issues)
-   [10 Projects Based on HawkBoard](#projects-based-on-hawkboard)
-   [11 Live Links](#live-links)
-   [12 Guide Links](#guide-links)
-   [13 Subpages](#subpages)

## Hardware Details

[![Hawkboard
hw.jpg](http://eLinux.org/images/d/d7/Hawkboard_hw.jpg)](http://eLinux.org/File:Hawkboard_hw.jpg)

-   [**HawkBoard User
    Manual**](http://hawkboard.googlecode.com/files/Hawkboard_UG_ver1.pdf)
-   [**HawkBoard
    Schematics**](http://hawkboard.googlecode.com/files/Hawkboard_schematics_v1.pdf)
-   Technical Reference Manual for OMAP L 138 Processor is
    [Here](http://focus.ti.com/docs/prod/folders/print/omap-l138.html)
-   Applications of OMAP L 138 are
    [Here](http://wiki.davincidsp.com/index.php/C674x/OMAPL1x_Introductory_Information)



## Software Details

### Tools & Softwares Downloads

-   **[ARM Cross Compiler - For
    Linux/U-boot](http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-2009q3-67-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2)**

*Note:*

1.Systems running "full" Linux, i.e., Linux on CPUs with an MMU. Use
this to build both the Linux kernel and applications.

2.New Releases :
[http://www.codesourcery.com/sgpp/lite/arm/portal/release1039](http://www.codesourcery.com/sgpp/lite/arm/portal/release1039)



-   **[DSP Cross Compiler -TI's Code Generation Tool
    (CGT)](http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/omap_l138/1_00/latest/index_FDS.html)
    c674x via option -mv6740**

-   **[TI CCS 4
    Plantinum](http://195.148.217.80/Oppilas/TI/setup_CCS_4_Platinum.zip)**



-   **[ARM Cross Compiler - Bare
    Metal](http://www.codesourcery.com/sgpp/lite/arm/portal/package5353/public/arm-none-eabi/arm-2009q3-68-arm-none-eabi-i686-pc-linux-gnu.tar.bz2)**

*Note:*

1.This is for RTOS systems or "bare metal" systems where no operating
system is present. **These toolchains should not be used to build Linux
kernels or Linux applications**.

2.New Releases :
[http://www.codesourcery.com/sgpp/lite/arm/portal/release1033](http://www.codesourcery.com/sgpp/lite/arm/portal/release1033)



-   **[AIS Generator / UART Host
    Tool](http://www-s.ti.com/sc/techlit/sprab41.zip) ([Needs .NET
    Framework](http://download.microsoft.com/download/6/0/f/60fc5854-3cb8-4892-b6db-bd4f42510f28/dotnetfx35.exe))**

#### Tools From Other Vendors

-   [ARM Cross Compiler provided by
    impactlinux](http://impactlinux.com/fwl/downloads/binaries/cross-compiler-armv5l.tar.bz2)

-   [ARM Native Compiler (to be used directly on Hawkboard) provided by
    impactlinux](http://impactlinux.com/fwl/downloads/binaries/native-compiler-armv5l.tar.bz2)

-   [ARM Cross Compiler provided by
    Ridgerun](https://support.ridgerun.com/omapl138sdk/downloads/OMAPL138SDK-835802-Linux-x86-Install.bin)

-   [Fedora Cross
    Compiler](http://fedoraproject.org/wiki/Architectures/ARM/CrossToolchain)

#### JTAG emulators

-   [Application Note for using CCSv4 & XDS Emulator with
    Hawkboard](http://www.innovatesolutions.net/whitepapers/app-note-for-using-ccsv4-xds-emulator-with-hawkboard)

### Misc Tools

-   [VirtualBox -To run Linux/Windows simultaneously with
    Windows/Linux](http://www.virtualbox.org/wiki/Downloads)

-   [Tftp
    Server](http://tftpd32.jounin.net/download/Tftpd32-3.35-setup.exe)

-   [Teraterm-Tool to Access Serial Console(Alternative to
    Hyperterminal) + SSH
    Client](http://www.ayera.com/teraterm/ttpro313.zip)

### Sources

-   [Linux
    Kernel](http://hawkboard.googlecode.com/files/linux-omapl1_ver1.tar.bz2)
-   [u-boot](http://hawkboard.googlecode.com/files/u-boot-omapl1_v1.tar.bz2)

### Sample Rootfs

1.Ubuntu Jaunty
[http://hawktool.googlecode.com/files/RootFS\_v1.tar.bz2](http://hawktool.googlecode.com/files/RootFS_v1.tar.bz2)
(username/password =hawk/password)

2.Fedora RootFS
-[http://ftp.linux.org.uk/pub/linux/arm/fedora/rootfs/rootfs-f12.tar.bz2](http://ftp.linux.org.uk/pub/linux/arm/fedora/rootfs/rootfs-f12.tar.bz2)
(username/password =root/fedoraarm)

3.Impactlinux
[http://impactlinux.com/fwl/downloads/binaries/root-filesystem-armv5l.tar.bz2](http://impactlinux.com/fwl/downloads/binaries/root-filesystem-armv5l.tar.bz2)



## Getting Started

1.**Powering the Device**: Hawkboard can be powered through USB OTG
port(mini USB) or Separate 5V Source. Since the USB port of a PC/laptop
or hub are often limited to 500 mA, it is advisable to use a separate
power supply of 5VDC that supplies at least 1 A of current.

**Note: It is recommended to use a separate 5VDC Power supply with at
least a 1 Amps current rating instead of USB Power for Normal Operation
of the Board**

2.**Connecting VGA Monitor**: Once the power supply has been attached,
Hawkboard boots to Uboot Bootloader and will show Hawkboard Logo on
Screen.

3.**Connecting UART**: To transfer images to Hawkboard and to set other
parameters, the UART/serial cable needs to be attached to Hawkboard and
PC. A NULL Modem(Crossed Cable i.e 2 and 3 Crossed) is needed for that.
Run a terminal session (such as Minicom on Linux or TeraTerm on Windows)
on the Host PC and configure it to connect to that serial port with the
following characteristics:

Bits per Second: 115200

Data Bits: 8

Parity: None

Stop Bits: 1

Flow Control: None

Transmit delay: 0 msec/char, 10 msec/line

[![Hawk Serial
Set.JPG](http://eLinux.org/images/8/8b/Hawk_Serial_Set.JPG)](http://eLinux.org/File:Hawk_Serial_Set.JPG)

After powering the device you should be able to see the following:

[![Hawk uboot
msg.JPG](http://eLinux.org/images/thumb/f/f2/Hawk_uboot_msg.JPG/480px-Hawk_uboot_msg.JPG)](http://eLinux.org/File:Hawk_uboot_msg.JPG)
[![Hawk vga
logo.jpg](http://eLinux.org/images/thumb/1/17/Hawk_vga_logo.jpg/480px-Hawk_vga_logo.jpg)](http://eLinux.org/File:Hawk_vga_logo.jpg)



-   On Hyperterminal (Any other Serial Console) (Left) On VGA Monitor
    you will see HawkBoard Logo (Right)



### Command prompts in this guide

In this guide, commands are preceded by prompts that indicate the
environment where the command is to be typed. For example:

-   **host\$**

Indicates command to be typed into the shell window of the host Linux
workstation.

-   **Hawkboard.org\>**

Indicates commands to be typed into the U-Boot shell in a console window
connected to the Hawkboard's serial port.

-   **target\$**

Indicates commands to be typed into the Linux shell in the terminal
window connected to the Hawkboard's serial port or TTY..

## Building & Booting Uboot images from source

HawkBoard comes with pre-installed U-boot and normally you don't want to
Compile and Load U-boot unless you have Bricked the Bootloader or want
to change something.So You can Skip this Section and can go Directly to
[Compiling Linux
Kernel](http://elinux.org/Hawkboard#Compiling_Linux_Kernel) or
[Booting](http://elinux.org/Hawkboard#Booting_2) Kernel Section.

### Setting up the Linux Environment

Most of the following instruction for UART booting are meant for Windows
environment. For people who only have Linux on their machines the UART
booting steps and creating the UART and NAND image from the ELF files
seems impossible. But nothing is impossible on Linux. Hence the way out.
The following instructions are Fedora specific. If you have a Debian
based distro please make the corresponding changes with apt-get.

-   Installing WINE and MONO

<!-- -->

      host# yum install wine mono* -y

You need to install wine and mono(make sure your mono is v2.4 and above)
packages. They will help you install and run the TI provided development
tools.

-   Installing the TI development tools

<!-- -->

      host$ wine AISgen_d800k002_Install_v1.3.exe

These tools are installed in your wine/drive\_C directory where-ever
that is defined for your particular distribution. For Fedora the steps
are as follows, from your home directory.

-   Using the actual tools

<!-- -->

      host$ cd .wine/drive_c/Program Files/Texas Instruments/AISgen for D800K002/

-   Running the AISgen tool

<!-- -->

      host$ mono AISgen_d800k002.exe

-   Running the UartHost tool

<!-- -->

      host$ cd UartHost
      host$ mono UartHost.exe

-   Setting up your COMPORT

<!-- -->

      host$ cd .wine/dosdevices
      host# ln -s /dev/ttyS1 com1

Now you can follow all the instructions given below from your Linux
machine.

### Compiling u-boot (bootloader)

1.  Issue compile commands with make:

<!-- -->

      host$ make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- distclean
      host$ make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- omapl_hawkboard_config
      host$ make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-

If you get an error while compiling, see the
[FAQ](http://elinux.org/HawkboardFAQ#U-Boot)or [the mailing list
thread](http://groups.google.com/group/hawkboard/browse_thread/thread/691955057ce958d0)

### Signing u-boot for UART boot

1.  Copy u-boot (elf) file to the host machine where AIS Generator is
    installed. Follow the below steps
2.  [![AIS gen
    uart1.JPG](http://eLinux.org/images/8/86/AIS_gen_uart1.JPG)](http://eLinux.org/File:AIS_gen_uart1.JPG)
3.  [![AIS gen
    uart2.JPG](http://eLinux.org/images/6/68/AIS_gen_uart2.JPG)](http://eLinux.org/File:AIS_gen_uart2.JPG)
4.  [![AIS gen
    uart3.JPG](http://eLinux.org/images/a/a5/AIS_gen_uart3.JPG)](http://eLinux.org/File:AIS_gen_uart3.JPG)
5.  [![AIS gen
    uart4.JPG](http://eLinux.org/images/9/99/AIS_gen_uart4.JPG)](http://eLinux.org/File:AIS_gen_uart4.JPG)

### Signing u-boot for NAND boot

1.  Copy u-boot (elf) file to the host machine where AIS Generator is
    installed. Follow the below steps
2.  [![AIS gen
    nand1.JPG](http://eLinux.org/images/8/8e/AIS_gen_nand1.JPG)](http://eLinux.org/File:AIS_gen_nand1.JPG)
3.  Configure PLL0, PLL1, DDR tabs as shown above. The File name to
    generate remains as in the step above.

### Booting

#### Booting u-boot over UART

-   Power OFF the board
-   Close any previously running terminal programs
-   Connect the UART cable(Null/Cross Cable) to the Host machine.

Following process used on Windows family of Operating System:

-   User can use mono utility with dvflasher.ext program to load u-boot
    on Linux system.
-   Details To be updated

Following process used on Windows family of Operating System:

-   Configure the Boot Switches as 1-OFF 2-ON 3-OFF 4-ON
-   Start the UART Host Utility, should have been installed with [AIS
    Generator / UART Host
    Tool](http://www-s.ti.com/sc/techlit/sprab41.zip)
-   Select the AIS FILE Generated for UART

[![UART HOST
BOOT.JPG](http://eLinux.org/images/b/b3/UART_HOST_BOOT.JPG)](http://eLinux.org/File:UART_HOST_BOOT.JPG)

-   Click on the Start button
-   Power UP the Device
-   If you see errors click on stop and press start again and give a
    board reset.
-   Wait till you all the below messages and COM is closed:

<!-- -->

      (File IO): Read 414964 bytes from file D:\hawk_release\u-boot_uart_ais.bin.
      (Serial Port): Opening COM1 at 115200 baud...
      (AIS Parse): Read magic word 0x41504954.
      (AIS Parse): Waiting for BOOTME...
      (AIS Parse): Performing Start-Word Sync...
      (AIS Parse): Performing Ping Opcode Sync...
      (AIS Parse): Processing command 0: 0x5853590D.
      (AIS Parse): Performing Opcode Sync...
      (AIS Parse): Executing function...
      (AIS Parse): Processing command 1: 0x5853590D.
      (AIS Parse): Loaded 1512-byte section to address 0xC10E4BEC.
      ...
      ...
      ...
      (AIS Parse): Processing command 15: 0x58535906.
      (AIS Parse): Performing Opcode Sync...
      (AIS Parse): Performing jump and close...
      (AIS Parse): AIS complete. Jump to address 0xC1080000.
      (AIS Parse): Waiting for DONE...
      (AIS Parse): Boot completed successfully.
      (Serial Port): Closing COM1.

-   Now Start any standard UART Terminal and hit enter key, should see
    the u-boot prompt

#### Procedure to flash u-boot on NAND

After booting the u-boot over UART as mentioned above,

-   On the u-boot prompt in the terminal window
-   Configure the Ethernet server and Client IP addresses, For e.g.

<!-- -->

      hawkboard.org > setenv serverip 172.24.156.199
      hawkboard.org > setenv ipaddr 172.24.190.58

-   Download the u-boot generated for NAND

<!-- -->

      hawkboard.org > tftpboot 0xc0700000 u-boot_nand_ais.bin

      TFTP from server 172.24.156.199; our IP address is 172.24.190.58
      Filename 'u-boot_nand_ais.bin'.
      Load address: 0xc0700000
      Loading: #################################################################
               #################
      done
      Bytes transferred = 414988 (6550c hex)

-   Erase NAND Flash

<!-- -->

      hawkboard.org > nand erase

      NAND erase: device 0 whole chip
      OK

-   Flash the NAND with u-boot

<!-- -->

      hawkboard.org > nand write.e 0xc0700000 0x20000 0x70000

      NAND write: device 0 offset 0x20000, size 0x70000
      458752 bytes written: OK
      hawkboard.org >

-   Switch off the board
-   Change the DIP Switches for NAND boot 1-ON 2-OFF 3-OFF 4-OFF

#### Booting u-boot over NAND

Flash u-boot into NAND as mentioned above

-   Switch off the board
-   Change the DIP Switches for NAND boot 1-ON 2-OFF 3-OFF 4-OFF
-   Switch on the board

## Building & Booting Kernel images from source

### Compiling Linux Kernel

1.  Issue compile commands with make:

<!-- -->

      make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- distclean
      make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- omapl138_hawkboard_defconfig
      make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- uImage

If you get the *"mkimage" command not found - U-Boot images will not be
built* error,build uboot from the source first and then copy the mkimage
binary from \~u-boot-omapl1/tools to a directory in your PATH

### Booting

#### Booting Linux Kernel and Mounting RAMDISK

You should find a kernel and a ramdisk image if you haven't found
already. You can download samples from
[[1]](http://code.google.com/p/hawkboard/downloads/list) (uImage\_v1 &
ramdisk\_v1.gz)). Then copy these files to your "/tftpboot" directory
assuming you will use tftp for transferring files to your board. In
order to do so you need to run a tftp server on your system. Under linux
a good choice is atfptd, but you can also use others. Typically a linux
tftp server exports the directory /tftpboot. Make sure before you
continue that your ftp server is running.
 At the u-boot prompt:

Set ethernet connection:

    $setenv serverip <PC ipaddress>
    $setenv ipaddr <board ipaddress>

\<PC ipaddress\> should be the address of the PC running the tftp
server.
 \<board ipaaddress\> should be an address that is not in use on the
same subnet as the tftp server.
 Transfer files to the board:

    $tftp c0700000 uImage_v1
    $tftp c1180000 ramdisk_v1.gz

If you broke your bootargs previously then:

    $setenv bootargs "mem=128M console=ttyS2,115200n8 root=/dev/ram0 rw initrd=0xc1180000,4M"

And finally boot the images:

    $bootm c0700000

The TFTP transferred images can be written to the NAND Flash for future
use to perform kernel upgrades and enable booting without network
connection.

To do this erase the sections of the NAND containing the kernel and file
system and write the images from RAM to the NAND.

    $nand erase 200000 200000
    $nand write.e 0xc0700000 0x200000 0x200000

    $nand erase 0x400000 0x300000
    $nand write.e 0xc1180000 0x400000 0x300000

The written images can be read back using

    $nand read.e 0xc0700000 0x200000 0x200000
    $nand read.e 0xc1180000 0x400000 0x300000

Set the bootcmd to read these images from NAND automatically and boot:

    $setenv bootcmd 'nand read.e 0xc0700000 0x200000 0x200000;nand read.e 0xc1180000 0x400000 0x300000;bootm 0xc0700000'

#### Booting Linux Kernel and Mounting NFS (Network File System)

Load the Kernel through NAND Flash or TFTP Method ,Once kernel has been
loaded to RAM using tftp c0700000 uImage\_v1 or similar Next. Follow
following steps to Mount RootFS through NFS.(Ubuntu)

##### Setting NFS Server

1. Install NFS Server

    host$ sudo apt-get install portmap nfs-kernel-server

2. Share the Folder containing extracted RootFS (e.g /nfsroot contains
RootFS)

Edit /etc/exports and add the shares:

    /nfsroot <NETWROK_IP><SUBNET_MASK>(rw,sync,no_subtree_check,no_root_squash)

e.g, /nfsroot
192.168.0.0/255.255.255.0(rw,sync,no\_subtree\_check,no\_root\_squash)

Assuming your network is is 192.168.0.0

NB:- no\_root\_squash might be necessary if you are getting sudo erros
in Ubuntu Rootfs

3.After setting up /etc/exports, export the shares:

     host$ sudo exportfs -ra

restart the nfs-server if required

     host$ sudo /etc/init.d/nfs-kernel-server restart

##### Booting Board using NFS

Under Uboot prompt once the Kernel has been loaded through

     hawkboard.org> tftp c0700000 uImage_v1

1.Set bootargs

Set boot arguments:

a)If Board uses Static IP



    hawkboard.org> setenv bootargs 'console=ttyS2,115200n8 noinitrd rw ip=<HawkboardIP>:<server-ip>:<gateway-ip>:<netmask>::eth0: root=/dev/nfs nfsroot=<NFS Server ipaddress>:/nfsroot'

e.g

     hawkboard.org> setenv bootargs 'console=ttyS2,115200n8 noinitrd rw ip=192.168.0.125:192.168.0.1:192.168.0.1:255.255.255.0::eth0: root=/dev/nfs nfsroot=<NFS Server ipaddress>:/nfsroot'

where 192.168.0.125 is board IP & 192.168.0.1 is gateway IP& Router IP.


 b)DHCP IP Board

     hawkboard.org> setenv bootargs "mem=128M console=ttyS2,115200n8 root=/dev/nfs nfsroot=<Server ipaddress>:/nfsroot ip=dhcp"


 2.And finally boot the image:

     hawkboard.org> bootm c0700000

#### Booting Linux Kernel from USB

This steps work for USB Pendrive connected to Hub or Directly to USB
Standard Port and rootfs is Ubuntu jaunty made through rootstock.Should
work for other distribution too.

1. Load uimage through tftp ( as usual)

    setenv serverip <PC IP>
    setenv ipaddr <BOARD IP>
    tftp c0700000 uImage_v1

2.Sent environment variable

    setenv bootargs console=ttyS2,115200n8 noinitrd root=/dev/sda1 rootwait rw init=/sbin/init

3.bootm

    bootm c0700000

Here /dev/sda1 is USB Drive with only one ext2 partition and rootfs
lying init.

#### Booting Linux Kernel from SATA

Currently the provided u-boot does not allow booting from either SATA.
However, it is possible to boot from nand and have the root filesystem
loaded from SATA.
 If you want to do so, you have to figure out the right partition for
the root filesystem and add that to your bootargs.

E.g. in u-boot say something like:

    setenv bootargs mem=128M console=ttyS2,115200n8 root=/dev/sda1 rootwait

Where you replace /dev/sda1 with the name of the device that contains
your root filesystem. /dev/sda1 is a good name for sata partition 1 if
no usb or sd devices are present. Note that the rootwait argument is
needed. It tells the kernel to wait until the disk has settled.

#### Booting Linux Kernel from SD OR MMC

Currently the provided u-boot does not allow direct booting from either
SD or MMC However, it is possible to boot from nand and have the root
filesystem loaded from SD
 If you want to do so, you have to figure out the right partition for
the root filesystem and add that to your bootargs.


 E.g. in u-boot say something like:

    setenv bootargs console=ttyS2,115200n8 console=tty1 noinitrd root=/dev/mmcblk0p1 rootwait rw

or

    setenv bootargs console=ttyS2,115200n8 console=tty1 noinitrd root=/dev/mmcblk0p1 rootdelay = 2 rootfstype = ext2 rw

Here p1 in mmcblk0p1 says that Rootfs is present in first partition of
SD Card.

#### MISC

1.If you find screen broken, do this before bootm in u-boot, ideally
this should go into kernel code

    mw.l 0x01c14110 0x44442222 1;mw.l 0x01c14114 0x44400000 1;mw.l 0x01c14118 0x04604404 1;

2.For booting android over MMC the bootargs should be

    setenv bootargs mem=128M console=ttyS2,115200n8 noinitrd root=/dev/mmcblk0p1 rootwait ip=off init=/init androidboot.console=ttyS2

3.You probably want to avoid that you have to retype these commands
every time you want to boot. This can be achieved easily by issuing the
following commands on the u-boot prompt:

    setenv serverip <PC ipaddress>
    setenv ipaddr <board ipaddress>
    setenv bootargs_nfs mem=128M console=ttyS2,115200n8 root=/dev/nfs nfsroot=<PC ipaddress>:/nfsroot ip=dhcp
    setenv bootcmd 'setenv bootargs $bootargs_nfs;tftp c0700000 uImage.v1; bootm c0700000'
    saveenv

Make sure to use single quotes in the last setenv command.



## Custom RootFS

1.Fedora
[http://fedoraproject.org/wiki/Architectures/ARM/RfsBuild](http://fedoraproject.org/wiki/Architectures/ARM/RfsBuild)

2.[http://arago-project.org](http://arago-project.org)

3.Ubuntu Use Rootstock

4.Angstrom uses Openembedded
[http://www.angstrom-distribution.org/narcissus/](http://www.angstrom-distribution.org/narcissus/)



## Making Use of the C6740 DSP Core

The C6740 DSP core inside the OMAP-L138 processor is extremely capable,
providing fixed-point and full double-precision floating-point
operations. Probably the simplest way to get started with the C6740 DSP
core on the Hawkboard is the C6Run project. It provides a GCC-like front
end for building applications, which, when executed from the Linux
command prompt, run transparently on the DSP. See the [C6Run main page
on the TI Embedded Processor
wiki](http://processors.wiki.ti.com/index.php/C6Run) for more details
and to get started.



## FAQs

For HawkBoard frequently asked questions (FAQ) see [community
FAQ](http://eLinux.org/HawkboardFAQ "HawkboardFAQ").



## Common Issues

At this stage it appears that the latest (late 2010) batch of boards
have serious problems many problems have been discussed on the mailing
list regarding failure to boot linux and problems with tftp There has
been a hardware fix posted on
[www.innovatesolutions.net](http://www.innovatesolutions.net) and
discussed [HERE](http://eLinux.org/Hawkboard_problem "Hawkboard problem"). Summary of the
fix is either to send the faulty board to distributor who will send them
on to innovate alternatively, the fix can also be done by customers
without voiding guarantees. The fix is made up by removing two ferrite
beads and shortening the pads afterwards. [![Hawkboard as
delivered](http://eLinux.org/images/thumb/e/ee/Late_2010_Batch_Hawkboard_Before.jpg/400px-Late_2010_Batch_Hawkboard_Before.jpg)](http://eLinux.org/File:Late_2010_Batch_Hawkboard_Before.jpg "Hawkboard as delivered")[![Hawkboard
after the fix has been
applied](http://eLinux.org/images/thumb/2/2a/Late_2010_Batch_Hawkboard_After.jpg/379px-Late_2010_Batch_Hawkboard_After.jpg)](http://eLinux.org/File:Late_2010_Batch_Hawkboard_After.jpg "Hawkboard after the fix has been applied")

## Projects Based on HawkBoard

## Live Links

-   Blog :
    [http://hawkboard.wordpress.com/](http://hawkboard.wordpress.com/)
-   Portal : [http://hawkboard.org](http://hawkboard.org)
-   Join us : hawkboard on google groups
-   IRC : “\#hawkboard” on Freenode
-   IRC logs  :
    [http://ibot.rikers.org/%23hawkboard/](http://ibot.rikers.org/%23hawkboard/)
-   Twitter :
    [http://twitter.com/hawkboard](http://twitter.com/hawkboard)
-   Wikipedia  :
    [http://en.wikipedia.org/wiki/Hawk\_Board](http://en.wikipedia.org/wiki/Hawk_Board)
-   Photos(Flickr):
    [http://www.flickr.com/photos/hawkboard](http://www.flickr.com/photos/hawkboard)
-   Mails : hawkboard@googlegroups.com
-   Software : code.google.com/p/hawkboard
-   OMAP L 138 :
    [http://focus.ti.com/docs/prod/folders/print/omap-l138.html](http://focus.ti.com/docs/prod/folders/print/omap-l138.html)
-   Applications :
    [http://wiki.davincidsp.com/index.php/C674x/OMAPL1x\_Introductory\_Information](http://wiki.davincidsp.com/index.php/C674x/OMAPL1x_Introductory_Information)
-   More Details :
    [http://wiki.davincidsp.com/index.php/Category:OMAPL1](http://wiki.davincidsp.com/index.php/Category:OMAPL1)



## Guide Links

-   Ubunty Jaunty on the hawkboard :
    [http://blog.binaerwelt.com/2010/02/ubuntu-on-the-hawkboard/](http://blog.binaerwelt.com/2010/02/ubuntu-on-the-hawkboard/)
-   Android on the hawkboard :
    [http://labs.embinux.org/index.php/Android\_Porting\_Guide\_to\_OMAP-L\_138\_HawkBoard](http://labs.embinux.org/index.php/Android_Porting_Guide_to_OMAP-L_138_HawkBoard)



## Subpages

Updated List is here
[http://elinux.org/Category:Hawkboard](http://elinux.org/Category:Hawkboard)
\<splist


 /\>


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [DSP](http://eLinux.org/index.php?title=Category:DSP&action=edit&redlink=1 "Category:DSP (page does not exist)")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [Hawkboard](http://eLinux.org/Category:Hawkboard "Category:Hawkboard")

