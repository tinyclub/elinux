> From: [eLinux.org](http://eLinux.org/RTS7751R2D_Handling_Manual "http://eLinux.org/RTS7751R2D_Handling_Manual")


# RTS7751R2D Handling Manual



**`RTS7751R2D` Linux software handling manual (CELF 040126 kernel
version)**

[![REnesasSH4.JPG](http://eLinux.org/images/1/19/REnesasSH4.JPG)](http://eLinux.org/File:REnesasSH4.JPG)

**Table of Contents:**



## Contents

-   [1 Technology Adopted in this
    release](#technology-adopted-in-this-release)
-   [2 Download and Install tool
    chain](#download-and-install-tool-chain)
-   [3 Board Hardware manual](#board-hardware-manual)
-   [4 Update your own kernel](#update-your-own-kernel)
-   [5 Initializing CF card for Linux (ext2/swap format & create
    partition)](#initializing-cf-card-for-linux-ext2-swap-format-26-create-partition)
-   [6 Copy root file image to ext2 formatted CF
    card](#copy-root-file-image-to-ext2-formatted-cf-card)
-   [7 Linux kernel update on CF card](#linux-kernel-update-on-cf-card)
-   [8 Console connection](#console-connection)
-   [9 Linux kernel start from CF](#linux-kernel-start-from-cf)
-   [10 Kernel start from network](#kernel-start-from-network)
-   [11 Kernel start from FROM extension card (Kernel space
    XIP)](#kernel-start-from-from-extension-card-kernel-space-xip)
-   [12 RUN demo program (SM501 multi-frame graphics
    demo)](#run-demo-program-sm501-multi-frame-graphics-demo)
-   [13 Swap console device](#swap-console-device)
-   [14 Appendix A (root\-fs
    information)](#appendix-a-root-fs-information)
-   [15 Appendix B (default “lilo-conf” in /etc
    directory)](#appendix-b-default-e2.80.9clilo.conf.e2.80-9d-in-etc-directory)
-   [16 Appendix C](#appendix-c)

## Technology Adopted in this release

<table>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left">Technology</td>
<td align="left">Support Status</td>
<td align="left">Arch Dependent</td>
<td align="left">Comment</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">Kernel preemption</td>
<td align="left">○</td>
<td align="left">No</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">2</td>
<td align="left">Lock breaking</td>
<td align="left">△</td>
<td align="left">No</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">3</td>
<td align="left">O(1) Scheduler</td>
<td align="left">○</td>
<td align="left">No</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">4</td>
<td align="left">Prioritized Work Queues</td>
<td align="left">×</td>
<td align="left"> ??</td>
<td align="left">Celf as is</td>
</tr>
<tr class="even">
<td align="left">5</td>
<td align="left">High Res POSIX timers</td>
<td align="left">×</td>
<td align="left">Yes</td>
<td align="left">SH-4 can use TMU3/4 as a High Res Timer. Mitsubishi has posted Hi-res timer support patch, but not yet merged to CELF kernel</td>
</tr>
<tr class="odd">
<td align="left">6</td>
<td align="left">Kernel XIP</td>
<td align="left">○</td>
<td align="left">No</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">7</td>
<td align="left">User-space XIP</td>
<td align="left">△</td>
<td align="left">No</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">8</td>
<td align="left">Parallel and deferred I/O initialization</td>
<td align="left">×</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">9</td>
<td align="left">Dynamic Power Management (DPM) Framework</td>
<td align="left">×</td>
<td align="left">YES</td>
<td align="left">SH-4 can not scale clock</td>
</tr>
<tr class="odd">
<td align="left">10</td>
<td align="left">CPU Frequency Scaling</td>
<td align="left">×</td>
<td align="left">Yes</td>
<td align="left">SH-4 can not scale clock</td>
</tr>
<tr class="even">
<td align="left">11</td>
<td align="left">Deferred periodic kernel process</td>
<td align="left">×</td>
<td align="left"> ??</td>
<td align="left">Celf as is</td>
</tr>
<tr class="odd">
<td align="left">12</td>
<td align="left">Protected RAM File System</td>
<td align="left">△</td>
<td align="left">No</td>
<td align="left">.</td>
</tr>
</tbody>
</table>

.

Support Status

○ = Activated in this release

△ = code merged, but not activated

× = not available in this release

Arch dependency

"No" means common in all architecture

## Download and Install tool chain

Download tool chain (RPM) for SH-3/4 processor from
[http://tree.celinuxforum.org/pubwiki/moin.cgi/ToolChains](http://tree.celinuxforum.org/pubwiki/moin.cgi/ToolChains)

     SH toolchain tools_sh4_RPMS.tar.gz

It contains gcc 3.2.3, binutil 2.13.90.0.18 for compiling SH-Linux code.

To install this tool chain.

    #tar xvzf tools_sh4_RPMS.tar.gz
    #rpm -i binutils-sh4-2.13.90.0.18-1.i686.rpm
    #rpm -i gcc-sh4-3.2.3-2.i686.rpm

And you can also obtain libraries for compiling some applications as
user-space packages.
[Userland\_sh4\_RPMS.tar.gz](http://tree.celinuxforum.org/toolchains/Userland_sh4_RPMS.tar.gz)

    #rpm -i --force --ignorearch glibc-devel-sh4-2.3.1-3u.sh4.rpm


 *\<\> Note - You would like to use these packages on Windows, you need
to install \*cygwin\* packages to Cygwin.*

It will automatically copy each file to proper location. If not defined
please add “/usr/local/bin” to your search path. If everything
successfully installed, you can start gcc compiler using following
command

    #sh4-linux-gcc –v

you can see version info.

## Board Hardware manual

You can download Hardware manual of rts7751r2d platform from
[Media:R2DHWmanual.pdf](http://eLinux.org/images/a/aa/R2DHWmanual.pdf "R2DHWmanual.pdf")

## Update your own kernel

Download kernel source code (SRPM) from from
[http://tree.celinuxforum.org/pubwiki/moin.cgi/ToolChains](http://tree.celinuxforum.org/pubwiki/moin.cgi/ToolChains)

    #cd (your working location)
    #tar xzvf celinux-040126.tgz

It will create directory named “celinux-040126”

Then config your kernel using “menuconfig” tool.

*\<\> Note - You CAN NOT use “xconfig” tool to current CE-Linux-040126
kernel code*

    #make menuconfig
    #make dep
    #make zImage


 If there is no error, you can see “vmlinx” created in project root and
“zImage” in ./arch/sh/boot directory. Use “zImage” file as a compressed
kernel image to copy to CF card.

## Initializing CF card for Linux (ext2/swap format & create partition)

CF card must be formatted “ext2”. You can format and initialize CF card
using following command

    #mount -t ext2 /dev/(your CF device name) /mnt/cf (depends on your environment)
    #/sbin/fdisk /dev/(your CF device name)



    SH IPL+eth version 1.0, Copyright (C) 2000 Free Software Foundation, Inc.
        ? --- Show this message (HELP)
        b --- Boot the system
        g --- Invoke GDB stub
        l --- Show about license
        w --- Show about (no)warranty
        m --- Serial load
        n --- Ether Boot
        z --- JMP zImage
        j --- JMP 0x8c002000
        i --- Board Infomation
        d --- memory display db,dw,dl
        e --- memory edit eb,ew,el
        v --- Show version infomation



    #/sbin/mkfs –t ext2 /dev/(your CF device normal partition name)
                              <- ex “/dev/sda1” not “/dev/sda”
    #/sbin/mkswap /dev/(your CF device swap partition name)
                              <- ex. “/dev/sda2”

If you are using USB CF card adaptor, your CF device name would be
/dev/sda1 If you are using CF slot built in your notebook PC, it would
be /dev/hde1

## Copy root file image to ext2 formatted CF card

You can use root\_file binary image (RPM) from from
[Userland\_sh4\_RPMS.tar.gz](http://tree.celinuxforum.org/toolchains/Userland_sh4_RPMS.tar.gz)



    #tar xvzf Userland_sh4_RPMS.tar.gz
    #mount /dev/(your CF device name) /mnt/cf (depends on your environment)
    #cd /mnt/cf
    #rpm2cpio <package_name>.sh4.rpm | cpio -id


 *\<\> Note - You need to resolve package conflict by yourself*

See appendix A in detail

## Linux kernel update on CF card

Compressed Linux kernel image “zImage” is stored in /boot directory of
CF card. So you need to overwrite “zImage” to update kernel. And also
you need to execute “lilo” command on host machine to update kernel
information. You may find “lilo” command in your host environment even
you are not using “lilo” as a boot loader. You may be using GRUB as a
boot loader in your host environment. You have to add “-r” option to
“lilo” command so that “lilo” can refer external kernel information
named “lilo.conf”.

-   -   DANGEROUS\*\* If you missed to add “-r” option, you may corrupt
        your host kernel environment. Before executing “lilo” command,
        you need to check “lilo.conf” file saved in /etc directory of CF
        card and “boot.b” file in /boot directory of CF card. Due to
        your CF location in host environment, you may need to update
        “lilo.conf” description. The root file image provided from us
        contains “lilo.conf” file that defines “boot=/dev/sda,
        disk=/dev/sda”. It expect CF card can be accessed as /dev/sda,
        it may be expecting USB CF card adopter is used for CF card
        access. If your CF card can be accessed as “/dev/hde”, you need
        to update “boot=/dev/hde, disk=/dev/hde” in “lilo.conf” file.

To copy kernel image CF card

    mount /dev/(your CF device name) /mnt/cf (depends on your environment)
    cp (your working location)/arch/sh/boot/zImage /mnt/cf/boot
    /sbin/lilo –r /mnt/cf

If “Append sh-linux \*” displayed at “lilo” command, your kernel was
successfully updated on CF card

## Console connection

RTS 7751R2D (R2D) support serial console terminal connected to CN7
(upper Dsub connector) using cross cable. Serial communication setting
is

     - Baud rate = 115200
     - Data     = 8bit
     - Parity    = none
     - Stop     = 1 bit
     - Flow control = none

You can modify console setting defined in boot parameter to support USB
keyboard as a input device. Also you can re-assign console screen to
LCD/VGA output managed by SM501 display controller.

## Linux kernel start from CF

RTS 7751R2D (R2D) platform support is shipped with IPL (boot loader)
program that is burned on FROM. We adopt IPL named "ipl+g" developed by
Mr.Niibe he is a maintainer of Linux-SH, and we add some futures to
original "ipl+g" to support various kind of boot method as follows.

-   CF boot (boot compressed kernel image saved in CF card)
-   Network boot (boot kernel from host machine connected via LAN)
-   XIP boot (boot executable kernel image saved in FROM expansion card)
-   JTAG debugger boot (start kernel already loaded into SD-RAM using
    JTAG debugger)

These boot method depends on SW6 setting. You can find SW6 near ALTERA
FPGA.

<table>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left">ON ( ↓ )</td>
<td align="left">OFF （ ↑ ）</td>
</tr>
<tr class="even">
<td align="left">SW6-1 (○○○●)</td>
<td align="left">auto start (same as type “b”)</td>
<td align="left">display prompt when IPL start</td>
</tr>
<tr class="odd">
<td align="left">SW6-2 (○○●○)</td>
<td align="left">start XIP kernel</td>
<td align="left">normal boot</td>
</tr>
</tbody>
</table>

So please confirm SW6 is correctly set due to your boot requirement.

    <SW6 setting>

kernel boot method

SW6-4/SW6-3

SW6-2

SW6-1

comment

1

CF, interactive

Don’t care for boot

OFF

OFF

type “h” for help, “b” for normal boot

2

CF, auto boot

OFF

ON

boot automatically from CF

3

Network boot

OFF

OFF

type n“ for ipl prompt

4

JTAG debugger mode

OFF

OFF

type “j” for ipl prompt

5

XIP

ON

ON

boot automatically from FROM board

## Kernel start from network

When downloading the kernel from network, use BOOTP/DHCP server (on the
host machine) and obtain an IP address and file name to be downloaded.

**Host side setting**

-   NFS Server
-   DHCP/BOOTP Server

Setting example for the following host machine is described in the
Appendix C.

        R2D IP Address: 192.168.10.72
        Host IP Address: 192.168.10.70
        R2D MAC Address: 00:00:e1:6b:33:5d
        Kernel Download Directory: /tftpboot
        NFS Root Directory: /tftpboot/rootfs


 **Kernel Configrarion**

Kernel Commandline and kernel option for NFS root mount as follows.

-   "mem=64M console=ttySC0,115200 root=/dev/nfs ip=boopt"
-   CONFIG\_NFS\_FS
-   CONFIG\_ROOT\_NFS

You can also use r2d\_nfs.config under arch/sh directory.

After building a kernel, copy arch/sh/boot/zImage to /tftpboot which is
specified in the setting file of BOOTP/DHCP server on host machine.
Enter "n" command for network booting on the prompt.



    Boot Log
    > n
    n
    Booting from network!
     - ioaddr 0xfe242000, addr 00:00:e1:6b:33:5d 100Mbps
    full-duplex
    Searching for server (BOOTP/DHCP)...
    IP Address: 192.168.192.190　　　　<- R2D IP Address
    Server: 192.168.192.189            <- Host IP Address
    Kernel to load: "/tftpboot/zImage"     <- File to be downloaded
    Loading Kernel: /tftpboot/zImage ..............................................



## Kernel start from FROM extension card (Kernel space XIP)

**Build XIP kernel**

Build XIP kernel according to the following procedure. The XIP kernel
will be configured at CONFIG\_XIP\_KERNEL.

     #cd celinux-040126
     #cp arch/sh/r2d_xip.config .config
     #make ARCH=sh CROSS_COMPILE=sh4-linux- oldconfig
     #make ARCH=sh CROSS_COMPILE=sh4-linux- dep
     #make ARCH=sh CROSS_COMPILE=sh4-linux- xImage


 xImage.bin file will be created under celinux-040126 directory. Copy
this file to CF or NFS root.


 **Copy XIP kernel on CF to FROM extension card**

Bootloader jumps to the 0x00020000 (mtd1 area). XIP kernel image uses
regular kernel (zImage) that MTD is usable and writes in mtd1 area.



        #eraseall /dev/mtd1
        #dd if=xImage.bin of=/dev/mtd1


 In the same way, cramfs image can be written in mtd2/mtd3.


 **SW6 setting for XIP**

When having the SW6-2 "ON" and turn on R2D, serial console shows the
message "booting XIP Kernel at 80020000" and XIP kernel will start.


 **[Flash ROM](http://eLinux.org/Flash_ROM "Flash ROM") Mapping**

Currently, MTD device mapping on [Flash ROM](http://eLinux.org/Flash_ROM "Flash ROM") is
set as below.

<table>
<tbody>
<tr class="odd">
<td align="left">0x00000000-0x00020000</td>
<td align="left">&quot;bootloader&quot;</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">0x00020000-0x00320000</td>
<td align="left">&quot;mtdblock1&quot;</td>
<td align="left">XIP kernel</td>
</tr>
<tr class="odd">
<td align="left">0x00320000-0x00520000</td>
<td align="left">&quot;mtdblock2&quot;</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">0x00520000-0x01000000</td>
<td align="left">&quot;mtdblock3&quot;</td>
<td align="left"></td>
</tr>
</tbody>
</table>

## RUN demo program (SM501 multi-frame graphics demo)

In CELF SDK CD-ROM, you can find a demo application “demo.tgz” that is
designed runs on this platform. We wrote some sample code for SM501
multi-frame operation.

[ SM501 debug command ]

name

function

usage

1

view

display enabler

**view 1 1** = enable(show) /dev/fb1

**view 1 0** = disable(hide) /dev/fb1

2

bitmap

display bitmap data

**bitmap /dev/fb0 test.bmp**

3

ckey

chroma key setting

**chkey /dev/fb2 1 7fff0000** = enable fb2 and set chroma key register
as 7fff0000

This function only effective on `VideoAlpha` and Alpha plane

4

cap

capture enabler

**cap 1** = enable video capture

**cap 0** = disable video capture

5

zoom

scaler setting

**zoom /dev/fb1** 87ff87ff = set zoom register value

6

csr

H/W cursor color setting

**csr 2222 3333 4444** = set cursor color register

7

chg

display size and location set

**chg /dev/fb1 320 240 640 480 100 100** =set /dev/fb1 size as 320 x 240
and set real display size as640 x 480 and set display location (100,
100)

This command only effective on movable plane exceptpanel screen

8

mod

set register value

**mod *register\_address*** = modify register value

9

mod2

show register value

**mod2 *register\_address*** = display current register value

Some study on SM501 frame architecture SM501 has 5 frame buffer and 2
H/W cursor plane. Each frame has following functions.

**/dev/fb0** *voyager\_video\_fb* 0xb0000000

Display plane for Panel(LCD) and parent frame for all other display
frame. Currently fb0 size is set to 640 x 480. Have scroll capability.

**/dev/fb1** *voyager\_video\_fb* 0xb00a0000 & 0xb0140000

Frame for video screen and parent of “video\_alpha” frame flexible
resolution, video capture function, H/W scaller function, accept YUV
data Can use double buffer architecture ( fb1 has two separate memory
space)

**/dev/fb2** *voyager\_valpha\_fb* 0xb01e0000

Frame for video\_alpha screen, son of video (fb1) flexible resolution,
chroma key function, H/W scaller function, accept YUV data This frame
can be displaied only upon video frame (fb1), so if video frame is
disabled, this frame also disabled automatically.

**/dev/fb3** *voyager\_alpha\_fb* 0xb0280000

Frame for alpha screen. flexible resolution, chroma key function, accept
YUV data This chroma key can be enable on whole frame including fb0. No
H/W scaller capability, can not accept YUV format

**/dev/fb4** *voyager\_cursor\_fb* 0xb0320000

H/W cursor frame. Size is only 64 x 64 and 2 bit color setting (you can
choose 3 color from 16 bit color) rest of 1 color must be transparent
color.

**/dev/tty0**

console input for /dev/fb0. Screen saver function supported in H/W. You
can display text data using re-direct function “cat /dev/tty0 \>
/dev/tty0” to show LCD character. Initial setting for fb0 is 640 x 480
16bit color RGB screen.

## Swap console device

Original Linux code for this board is expecting serial console device as
a system console that is terminal connected to CN7 (upper Dsub
connector). This setting is defined as a kernel boot parameter in
“lilo.conf”. As this R2D board has a VGA output and USB host interface,
you can use CRT as a console monitor and USB keyboard as a system
keyboard. This part is introducing how to activate these alternative
console devices.

**\< How to use VGA monitor as a system console \>**

To use VGA monitor as a system display, you have to declare following
sentence in “lilo.conf” append line.

     video=voyager_crt_fb:mode:640x480x16

After you modify “lilo.conf”, you need to run “lilo –r” command to
activate this neww setting. Then /dev/fb0 is assigned to
“voyager\_crt\_fb” device, so you can see booting message on VGA monitor
screen.

**\< How to use USB keyboard as a system keyboard \>**

You can use USB keyboard as input device which name is /dev/input/mice
as following kernel configration.

    CONFIG_USB=y
    CONFIG_USB_OHCI_VOYAGERGX=y
    CONFIG_USB_USE_INTERNAL_MEMORY=y
    CONFIG_USB_KBD=y
    CONFIG_USB_MOUSE=y
    CONFIG_INPUT=y
    CONFIG_INPUT_KEYBDEV=y
    CONFIG_INPUT_MOUSEDEV=y


 **\< CRT output switching \>**

Following figure shows SM501 frame buffer architecture. If you switch
“merge” setting between CRT and Panel (red circled position) you can
switch CRT output even If you assigned CRT as a console device. This
“merge” control is managed by 9th bit of “CRT display register”. I
attached small program “vc”Media:vc.zipthat just reverse this bit.

Also I attached two file “.inputrc” and “inittab” for activating USB hot
key to switch this bit. So copy “.inputrc” to /root directory and modify
“initrc” as attched so that system login automatically after boot and
accept hot key. Due to setting defined in “.inputrc” current hot ket is
“CTRL+F” to switch CRT output.

## Appendix A (root\_fs information)

* * * * *

Pre defined user accounts

<table>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left">user name</td>
<td align="left">password</td>
<td align="left">login</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">root</td>
<td align="left">(none)</td>
<td align="left">accept console login</td>
</tr>
<tr class="odd">
<td align="left">2</td>
<td align="left">guest</td>
<td align="left">guest</td>
<td align="left">accept console, ftp, telnet login</td>
</tr>
</tbody>
</table>

* * * * *

Network setting --- modify following script to fit your environment

    　  /etc/sysconfig/network-scripts/ifcfg-eth0
      　       BROADCAST=192.168.10.255
      　       IPADDR=192.168.10.76
      　       NETMASK=255.255.255.0
      　       NETWORK=192.168.10.0
      　       ONBOOT=yes



* * * * *

Pre installed package list

glibc-2.3.1-3u

mgetty-1.1.30-2u

cracklib-2.7-20u

mingetty-1.00-5u

libcap-1.10-15u

minicom-2.00.0-12u

libtermcap-2.0.8-32u

modutils-2.4.22-8u

pam-0.75-46u

net-tools-1.60-12u

popt-1.6.3-1u

portmap-4.0-52u

tcp\_wrappers-7.6-34.as21.1u

psmisc-21.2-4u

zlib-1.1.4-7u

procps-2.0.11-6u

setup-2.5.23-1u

bash-2.05b-16u

sh-utils-2.0.12-3u

busybox-0.60.5-5u

sox-12.17.3-10u

bzip2-1.0.2-8u

strace-4.4.93-2u

devfsd-1.3.25-1u

sysklogd-1.4.1-12u

dhcp-3.0pl1-20u

`SysVinit-2.84-7u`

e2fsprogs-1.32-6u

tar-1.13.25-11u

filesystem-2.2.1-2u

tcpdump-3.7.2-1u

fileutils-4.1.9-11u

telnet-0.17-25u

findutils-4.1.7-9u

termcap-11.0.1-16u

ftp-0.17-17u

textutils-2.0.21-5u

gawk-3.1.1-9u

tinylogin-1.4-1u

gdb-5.3-1u

util-linux-2.11y-4u

grep-2.5.1-7u

vsftpd-1.2.0-2.1

hdparm-5.2-4u

wireless-tools-25-4u

initscripts-7.04-1u

xinetd-2.3.10-2u

iptables-1.2.7a-2u

iputils-20020927-2u

iproute-2.4.7-7u

setup-rts7751r2d-1.0.0-1u

kernel-pcmcia-cs-3.1.31-13u

ipl+eth-1.0.0-1u

MAKEDEV-1.0.0-1u

## Appendix B (default “lilo.conf” in /etc directory)

    linear
    # You must appoint your CF mounting device name on following lines.
    # Default CF mounting device is /dev/hdc.
    boot = /dev/sda
    disk = /dev/sda

    bios = 0x80
    #
    delay = 30
    #vga = normal
    image = /boot/zImage
            label = linux
            root = /dev/hda1
            read-only


 If you use USB CF card adaptor in Linux host environment, CF device can
be accessed as “/dev/sda” . This “lilo.conf” is expecting CF card can be
there. If your CF device name is different, you need to modity”boot=”
and “disk=” portion in this “lilo.conf” file.

To update kernel, you have to do “lilo –r” command in host environment.
“-r” option is mandatory. Also you have to use “boot.b” file, that can
be copy from root\_fs/boot directory.

## Appendix C

* * * * *

Example of /etc/dhcpd.conf

    ddns-update-style ad-hoc;

    subnet 192.168.10.0 netmask 255.255.255.0 {
            range 192.168.10.76 192.168.10.76;
            default-lease-time 600;
            max-lease-time 7200;
    }
    host r2d {
            hardware ethernet 0000e16b335d;
            fixed-address 192.168.10.76;
            filename "/tftpboot/zImage";
        option root-path "192.168.10.70:/tftpboot/rootfs ;
    }



* * * * *

Example of /etc/bootptab

    r2d:sm=255.255.255.0:ha=0000e16b335d:ip=192.168.10.76:hd=/tftpboot:bf=zImage:
    rp=/tftpboot/rootfs



* * * * *

Example of /etc/exports

    /tftpboot     192.168.10.76(rw,no_root_squash)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")

