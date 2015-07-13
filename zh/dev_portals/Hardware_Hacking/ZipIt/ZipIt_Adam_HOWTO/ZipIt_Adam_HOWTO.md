> From: [eLinux.org](http://eLinux.org/ZipIt_Adam_HOWTO "http://eLinux.org/ZipIt_Adam_HOWTO")


# ZipIt Adam HOWTO



This package provides an alternative to the
[OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") firmware for the
[ZipIt](http://eLinux.org/ZipIt "ZipIt") Wireless Messenger. Like
[OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") this firmware includes the
[BusyBox](http://eLinux.org/BusyBox "BusyBox") utilities as well as the Dropbear ssh
client and server. Unlike [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") this
firmware includes a web browser
([ELinks](http://eLinux.org/index.php?title=ELinks&action=edit&redlink=1 "ELinks (page does not exist)")),
however, the [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") audio applications have
been removed to conserve space. Some battery monitoring tools and
various other useful utilities are also included. An additional feature
of this firmware is that it is modular allowing modifications without
the danger of a full re-flash.

## Contents

-   [1 Requirements](#requirements)
-   [2 Server setup](#server-setup)
-   [3 Firmware installation](#firmware-installation)
    -   [3.1 Establish network
        connectivity](#establish-network-connectivity)
    -   [3.2 Mount NFS volume](#mount-nfs-volume)
    -   [3.3 Create block devices](#create-block-devices)
    -   [3.4 Load modules](#load-modules)
    -   [3.5 Re-flash](#re-flash)
-   [4 Customization](#customization)

## Requirements

Installation of this firmware requires a [ZipIt](http://eLinux.org/ZipIt "ZipIt") that
has been re-flashed with the [BURN3](http://eLinux.org/BURN3 "BURN3") firmware and a NFS
server accessible over a wireless network. Re-flashing with the
[BURN3](http://eLinux.org/BURN3 "BURN3") firmware makes it possible to boot the
[ZipIt](http://eLinux.org/ZipIt "ZipIt") to a command line, mount a NFS volume, copy
files to the [ZipIt](http://eLinux.org/ZipIt "ZipIt"), and re-flash the
[ZipIt](http://eLinux.org/ZipIt "ZipIt"). It is beyond the scope of this document to
describe setting up an NFS server. If you are a Linux user consult the
[Linux NFS-HOWTO](http://www.tldp.org/HOWTO/NFS-HOWTO/index.html) or the
documentation provided by your distribution.

## Server setup

Once your NFS server is functioning properly download Adam's Alternate
ROM Load from
[http://www.mib.org/zip/TEST-ROOT/](http://www.mib.org/zip/TEST-ROOT/).
Extract the files from the archive and copy them to a directory on the
NFS server that will be accessible to the [ZipIt](http://eLinux.org/ZipIt "ZipIt").
Depending on your network configuration you may need to change how the
NFS volume is being shared. On Linux this is achieved by editing the
`/etc/exports` file.

## Firmware installation

All of the commands in this section are executed on the
[ZipIt](http://eLinux.org/ZipIt "ZipIt"). Although it is certainly possible to type them
using the [ZipIt](http://eLinux.org/ZipIt "ZipIt")'s keyboard it may be preferable to
connect to the [ZipIt](http://eLinux.org/ZipIt "ZipIt") from a machine with a full-size
keyboard, after network connectivity has been established. BURN3
includes a telnet server so executing



    telnet zipit_ip_address


 where `zipit_ip_address` is the [ZipIt](http://eLinux.org/ZipIt "ZipIt")'s IP address
from a terminal will allow you to login to the [ZipIt](http://eLinux.org/ZipIt "ZipIt")
and execute commands as if you were typing them on its keyboard.

### Establish network connectivity

The first step in the installation process is to connect the
[ZipIt](http://eLinux.org/ZipIt "ZipIt") to the network. If your access point does not
use encryption, broadcasts its SSID, and uses DHCP connecting is as
simple as issuing the command



    udhcpc


 For more complicated configurations involving an access point that uses
WEP or does not broadcast its SSID it will be necessary to configure the
[ZipIt](http://eLinux.org/ZipIt "ZipIt")'s wireless interface using `iwconfig` before
running `udhcpc`. If your router does not use DHCP use `ifconfig` to
specify the [ZipIt](http://eLinux.org/ZipIt "ZipIt")'s IP address manually.

### Mount NFS volume

After successfully connecting the [ZipIt](http://eLinux.org/ZipIt "ZipIt") to the network
mount the NFS volume to a directory on the [ZipIt](http://eLinux.org/ZipIt "ZipIt").
First create a mount point



    mkdir /mnt/net1


 Then mount the NFS volume



    mount -t nfs -o nolock,tcp,intr server_ip_address:/server_folder /mnt/net1


 replacing `server_ip_address` and `server_folder` with appropriate
values for your configuration. Next copy all of the files included with
Adam's Alternate ROM Load from the NFS volume to the
[ZipIt](http://eLinux.org/ZipIt "ZipIt")'s `/tmp` directory

### Create block devices

After copying files from the NFS volume create the two additional block
devices that are utilized by Adam's Alternate ROM Load.



    mknod /dev/mtdblock4 b 31 4
    mknod /dev/mtdblock5 b 31 5


 If all went well



    ls -l /dev/mtdblock*


 should produce something like:



    brw-r----- 1 root root 31, 0 May 19 16:11 /dev/mtdblock0
    brw-r----- 1 root root 31, 1 May 19 16:11 /dev/mtdblock1
    brw-r----- 1 root root 31, 2 May 19 16:11 /dev/mtdblock2
    brw-r----- 1 root root 31, 3 May 19 16:11 /dev/mtdblock3
    brw-r----- 1 root root 31, 4 May 19 16:11 /dev/mtdblock4
    brw-r----- 1 root root 31, 5 May 19 16:11 /dev/mtdblock5

### Load modules

Before re-flashing it is necessary to load several modules that are used
by the firmware. These modules are loaded with the commands:




    cp -R /mnt/net1/* /tmp

    insmod /tmp/modules/mtdcore.o
    insmod /tmp/modules/mtdblock.o
    insmod /tmp/modules/mtdpart.o
    insmod /tmp/modules/chips/chipreg.o
    insmod /tmp/modules/chips/gen_probe.o
    insmod /tmp/modules/chips/cfi_probe.o
    insmod /tmp/modules/chips/cfi_cmdset_0002.o
    insmod /tmp/modules/maps/readwrite_rescue/danger_physmap.o

You are supposed to have the modules folder in the /tmp directory.

### Re-flash

Finally it is time to copy the new filesystems to the block devices and
re-flash. First copy the new filesystems to the appropriate block
devices.



    dd if=/tmp/rootfs.gz of=/dev/mtdblock3
    dd if=/tmp/opt.cramfs of=/dev/mtdblock4
    dd if=/tmp/userprefs.cramfs of=/dev/mtdblock5


 Then execute



    sync


 to write all of the buffered filesystems to disk. Reboot the
[ZipIt](http://eLinux.org/ZipIt "ZipIt") and if everything went well you should be able
to connect to the network using the steps described in the section
"Establish network connectivity". In order to automatically connect to a
network on boot refer to the section below on customization.

## Customization

The multiple partitions used by this firmware make it relatively simple
to make your own modifications. At a minimum you will probably want to
modify the init scripts in `userprefs.cramfs` to automatically establish
[WiFi](http://eLinux.org/WiFi "WiFi") connectivity at boot. In order to make changes
mount `userprefs.cramfs` to a temporary directory on your development
machine. For example:



    mkdir /tmp/userprefs
    mount -t cramfs -o loop userprefs.cramfs /tmp/userprefs


 Then copy the contents of the filesystem to a writable location.



    mkdir /tmp/userprefs_modified
    cp -a /tmp/userprefs/* /tmp/userprefs_modified/


 After making changes to the files in `/tmp/userprefs_modified/` make a
new filesystem by executing.



    mkcramfs /tmp/userprefs_modified /tmp/userprefs_modified.cramfs


 Next make the new filesystem available on the NFS volume. Finally
download the modified filesystem to the [ZipIt](http://eLinux.org/ZipIt "ZipIt"), use dd
to copy it to the appropriate block device, and sync as describe above.
If you wish you can mount the block device that was modified to a
temporary directory before syncing and rebooting in order to verify that
everything is as it should be.

If the [ZipIt](http://eLinux.org/ZipIt "ZipIt") fails to boot hold down the lid closed
button during boot. This will prevent `opt.cramfs` and
`userprefs.cramfs` from being mounted and will drop you into a shell
where you can repair things. The file `rootfs.gz` contains the minimal
rescue filesystem that makes this possible even if you screw up the
filesystems on the other partitions so you probably don't want to mess
with it unless you know what you are doing.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

