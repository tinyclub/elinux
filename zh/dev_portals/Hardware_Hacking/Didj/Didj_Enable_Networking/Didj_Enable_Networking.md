> From: [eLinux.org](http://eLinux.org/Didj_Enable_Networking "http://eLinux.org/Didj_Enable_Networking")


# Didj Enable Networking



## Contents

-   [1 Summary](#summary)
-   [2 Software Needed](#software-needed)
-   [3 Hardware Needed](#hardware-needed)
-   [4 Build Module](#build-module)
    -   [4.1 Kernel Configuration](#kernel-configuration)
    -   [4.2 Building Kernel](#building-kernel)
-   [5 Install and Configure](#install-and-configure)
    -   [5.1 Configure PTY device](#configure-pty-device)
    -   [5.2 Installing g\-ether.ko](#installing-g-ether-ko)
    -   [5.3 Set up TCP/IP](#set-up-tcp-ip)
    -   [5.4 Add User](#add-user)

## Summary

This how-to outlines the basic steps to enabling networking via the USB
gadget Ethernet driver (g\_ether) contained in the LF 2009 sources.

Following the steps contained herein should result in a functioning
Ethernet connection and the ability to telnet into the device via USB.

The version of g\_ether we are using does **not** support Windows at
this time (due to what seems to be a broken RNDIS implementation in this
version of ether.c).

To-dos: Investigate and address enabling g\_ether connectivity to hosts
running recent linux kernels, Windows, OS X...



## Software Needed

[Source
Code](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#Didj "LeapFrog Pollux Platform: Source Code")
(Didj-Linux-4222-20090422-1236.tar.gz)



## Hardware Needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")

## Build Module

#### Kernel Configuration

Out of the box, neither networking support nor the PTY devices used by
busybox/telnetd are enabled in the stock Didj kernel. There are two ways
to enable this. You can manually configure the kernel with make
menuconfig, or use a configuration included in the Didj sources,
lf1000\_tt\_eth\_defconfig.

**Using alternate included config file**

More information on configuring [using preexisting
config](http://eLinux.org/LeapFrog_Pollux_Platform:_Kernel_Configuration#Using_Preexisting_Config "LeapFrog Pollux Platform: Kernel Configuration")

*On Host*

    cd SOURCE_CODE/linux-2.6.20-lf1000
    $ make lf1000_ff_eth_defconfig

Your config file is now loaded, and you are ready to proceed.

**Using make menuconfig**

More information on configuring [using make
menuconfig](http://eLinux.org/LeapFrog_Pollux_Platform:_Kernel_Configuration#Make_Menuconfig "LeapFrog Pollux Platform: Kernel Configuration")

*On Host*

    cd SOURCE_CODE/linux-2.6.20-lf1000
    $ make menuconfig

When the menu system launches, enable the following:

1.  Networking
    1.  Select: Networking-\> Networking Options-\> TCP/IP Networking
    2.  Make sure its selected if not hit Spacebar to select TCP/IP
        Networking.
    3.  Exit back to the main menu.

2.  USB Ethernet support
    1.  Select: Device Drivers-\> USB Support-\> USB Gadget Support
    2.  Hit spacebar to select USB Gadget Support
    3.  Select: Ethernet Gadget (with CDC Ethernet support)
    4.  Hit Spacebar to configure it as a kernel module \<M\>. *Note:
        RNDIS support is listed, but it is broken, so deselect it.*
    5.  Exit up to device drivers

3.  PTY device support (for telnetd)
    1.  Select: Device Drivers-\>Character Drivers-\>Unix98 PTY Support
    2.  Hit Spacebar to select \<\*\>
    3.  Select: Device Drivers-\>Character Drivers-\>Legacy (BSD) PTY
        Support
    4.  Hit Spacebar to select
    5.  If its not already pre-set, set 'Maximum number of legacy PTY in
        use' at 256

4.  Exit all the way out of the menu application, making sure to save
    the changes when prompted.

Your config file is now set, and you are ready to proceed.

#### Building Kernel

[Set up your Build
Environment](http://eLinux.org/LeapFrog_Pollux_Platform:_Build_Environment "LeapFrog Pollux Platform: Build Environment")
and from inside the kernel directory linux-2.6-lf1000/ run.

    $ ./install.sh

If everything is set up properly, this should fail trying to create some
folders, which is after its built the kernel, which is fine, look in
your TFTP\_PATH directory, and you should see your zImage, which can be
used to boot from an SD card or UART for testing purposes.

[Didj\_Boot\_From\_UART](http://eLinux.org/Didj_Boot_From_UART "Didj Boot From UART")

## Install and Configure

These steps, except for creating the device, will need to be repeated on
each boot. If you'd like to make the USB device an Ethernet device
permanently, you'll want to look into modifying the start up scripts.

#### Configure PTY device

Programs like telnetd and dropbear require these devices to be
configured in order to run.

If not already created, create the node and directory for PTS *On Didj*

    # mkdir --mode=755 /dev/pts
    # mknod -m=666 /dev/ptmx c 5 2

Mount PTS

*On Didj*

    # mount -t devpts none /dev/pts

You can also add this line to /etc/fstab for it to always mount

    none            /dev/pts        devpts  defaults                0       0

#### Installing g\_ether.ko

First, boot the device, connect the USB cable, and [mount the device as
a drive.](http://eLinux.org/Didj_USB_Mounting "Didj USB Mounting")

You'll find g\_ether.ko in your kernel sources directory tree:

SOURCE\_CODE/linux-2.6.20-lf1000/drivers/usb/gadget/g\_ether.ko


 Copy this to your Didj.

**Inserting the g\_ether.ko kernel module**

First, if its still connected, unmount the /Didj partition from your
host.

Then, mount /Didj on your Didj:

*On Didj*

    # usbctl -d mass_storage -a disable
    Mounting /dev/mtdblock9 on /Didj as rw

remove the g\_file\_storage kernel module:

    $ rmmod g_file_storage

and install g\_ether.ko:

    # cd /Didj
    # insmod ./g_ether.ko
    ether gadget: using random self ethernet address
    usb0: Ethernet Gadget, version: May Day 2005
    usb0: using lf1000_udc, OUT ep2-bulk IN ep1-bulk
    usb0: MAC 46:ac:79:6e:92:e2
    usb0: high speed config #1: 100 mA, Ethernet Gadget, using CDC Ethernet Subset
    ether gadget: set_interface ignored!



#### Set up TCP/IP

With the USB cable still connected to your host, configure an IP address
(make sure this is a different subnet from your existing LAN). To
quickly get up and running, use the Temporary Device and Host setups.
Later you can make more permanent configurations. Although you can only
have one, either Mass Storage or Ethernet operational at any given time.

[Networking
Setup](http://eLinux.org/LeapFrog_Pollux_Platform:_Networking "LeapFrog Pollux Platform: Networking")

#### Add User

For logging in from remote hosts, you'll need a user. This can cause
issues with permissions and what you can do. Some programs may allow
root login with some extra configuration.

*On Didj*

    # touch /etc/group
    # echo root:x:0:0:root:/root:/ > /etc/passwd
    # mkdir /home
    # adduser didj
    (this will prompt you for a password, can leave blank by hitting return twice, and ignoring the warnings.)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

