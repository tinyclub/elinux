> From: [eLinux.org](http://eLinux.org/DHT-Walnut_Booting_From_Hdd "http://eLinux.org/DHT-Walnut_Booting_From_Hdd")


# DHT-Walnut Booting From Hdd



**Work In Progress**

ppcboot provides only basic functionality to access Hard disks: you can
print the partition table and read and write blocks (addressed by
absolute block number), but there is no support to create new partitions
or to read files from any type of filesystem. The current version of
ppcboot-1.1.6 has a problem with writing to hdd, however, once the Linux
kernel is loaded and the userland initialized, the hdd can be accesses
normally through PIO and DMA modes. This may or may-not be fixed in the
future.

Update: disk write seems to work well in [wiki:DHT-Walnut-U-Boot U-Boot
1.1.4]. The information on this page applies to U-Boot as well as
ppcboot.

As usual, you can get some information about the available IDE commands
using the help command in ppcboot:



      => help ide
    ide reset - reset IDE controller
    ide info  - show available IDE devices
    ide device [dev] - show or set current device
    ide part [dev] - print partition table of one or all IDE devices
    ide read  addr blk# cnt
    ide write addr blk# cnt - read/write `cnt' blocks starting at block `blk#'
        to/from memory address `addr'


 You may create the needed partitions by tftpbooting Linux and an
appropriate userland, then use fdisk to partition the disk. Then reboot
back to ppcboot.

ppcboot can be configured for DOS and Mac OS? type partition tables.
Since ppcboot cannot read files from a filesystem you should create one
(or more) small partitions (maybe 1 or 2 MB) if you want to boot from
the "disk". (The size of these partitions will depend on how large your
kernel and userland images are)

For example on a 128 MB [Compact Flash](http://eLinux.org/Compact_Flash "Compact Flash")
card we could create the following partiton table under Linux:



     # fdisk /dev/hde
     hde: hde1 hde2 hde3 hde4

    Command (m for help): p

    Disk /dev/hde: 8 heads, 32 sectors, 978 cylinders
    Units = cylinders of 256 * 512 bytes

       Device Boot    Start       End    Blocks   Id  System
    /dev/hde1             1        17      2160   83  Linux
    /dev/hde2            18        34      2176   83  Linux
    /dev/hde3            35       803     98432   83  Linux
    /dev/hde4           804       978     22400   82  Linux swap

    Command (m for help): q

    # mkswap /dev/hde4
    Setting up swapspace version 1, size = 22933504 bytes


 Here we have two small boot partitions (http://eLinux.org/dev/hde1 and /dev/hde2, 2 MB
each), one big partition to hold a filesystem (http://eLinux.org/dev/hde3, 99 MB), and a
swap partition (http://eLinux.org/dev/hde4, 22 MB). We also initialized /dev/hde4 as swap
space.

ppcboot will recognize this partition table as follows:



     => ide part

    Partition Map for IDE device 0  --   Partition Type: DOS

    Partition     Start Sector     Num Sectors     Type
        1                   32            4320      83
        2                 4352            4352      83
        3                 8704          196864      83
        4               205568           44800      82


 An easy way to load the Linux kernel into the first partition is to
boot all the way back to Linux, mount an nfs partition to retrieve the
kernel and userland images. then use dd to put them onto the hdd:

-   mount -t nfs -0 nolock xxx:yyy:zzz:aaa:/ /mnt
-   cd /mnt
-   cd /tftpboot
-   dd if=kernel.img of=/dev/hde1
-   dd if=userland.img of=/dev/hde2


 To boot from a disk you can use the diskboot command:



     => help diskboot
    diskboot loadAddr dev:part


 The diskboot command expects a load address in RAM, and a combination
of device and partition numbers, separated by a colon. It then reads the
image from disk and stores it in memory. We can now boot it using the
bootm command [to automatically boot the image define the ppcboot
environment autostart with the value =yes=].



     => diskboot 400000 0:1
    ide_read dev 0 start 0, blocks 1 buffer at 3F9F8C0
    ## Valid DOS partition found ##

    Loading from IDE device 0, partition 1: Name: hda1
      Type: PPCBoot
    First Block: 63,  # of blocks: 8001, Block Size: 512
    ide_read dev 0 start 3F, blocks 1 buffer at 400000
       Image Name:   DHT Kernel
       Created:      2006-02-05  19:37:25 UTC
       Image Type:   PowerPC Linux Kernel Image (gzip compressed)
       Data Size:    1085059 Bytes = 1059 kB = 1 MB
       Load Address: 00000000
       Entry Point:  00000000
    ide_read dev 0 start 40, blocks 847 buffer at 400200

    => diskboot c00000 0:2
    ide_read dev 0 start 0, blocks 1 buffer at 3F9F8C0
    ## Valid DOS partition found ##

    Loading from IDE device 0, partition 2: Name: hda2
      Type: PPCBoot
    First Block: 8064,  # of blocks: 8064, Block Size: 512
    ide_read dev 0 start 1F80, blocks 1 buffer at C00000
       Image Name:   Ramdisk Image
       Created:      2006-02-05  20:24:43 UTC
       Image Type:   PowerPC Linux RAMDisk Image (gzip compressed)
       Data Size:    765638 Bytes = 747 kB = 0 MB
       Load Address: 00000000
       Entry Point:  00000000
    ide_read dev 0 start 1F81, blocks 5D7 buffer at C00200

    => bootm 400000 c00000
    ## Booting image at 00400000 ...
       Image Name:   DHT Kernel
       Created:      2006-02-05  19:37:25 UTC
       Image Type:   PowerPC Linux Kernel Image (gzip compressed)
       Data Size:    1085059 Bytes = 1059 kB = 1 MB
       Load Address: 00000000
       Entry Point:  00000000
       Verifying Checksum ... OK
       Uncompressing Kernel Image ... OK
    ## Loading RAMDisk Image at 00c00000 ...
       Image Name:   Ramdisk Image
       Created:      2006-02-05  20:24:43 UTC
       Image Type:   PowerPC Linux RAMDisk Image (gzip compressed)
       Data Size:    765638 Bytes = 747 kB = 0 MB
       Load Address: 00000000
       Entry Point:  00000000
       Verifying Checksum ... OK
    ...



     => setenv bootargs root=/dev/ram0
    => setenv autostart yes
    => disk 400000 0:1 \;\ diskboot c00000 0:2 \;\ bootm 400000 c00000

    => bootd
    ide_read dev 0 start 0, blocks 1 buffer at 3F9F518
    ## Valid DOS partition found ##

    Loading from IDE device 0, partition 1: Name: hda1
      Type: PPCBoot
    First Block: 63,  # of blocks: 8001, Block Size: 512
    ide_read dev 0 start 3F, blocks 1 buffer at 400000
       Image Name:   DHT Kernel
       Created:      2006-02-05  19:37:25 UTC
       Image Type:   PowerPC Linux Kernel Image (gzip compressed)
       Data Size:    1085059 Bytes = 1059 kB = 1 MB
       Load Address: 00000000
       Entry Point:  00000000
    ide_read dev 0 start 40, blocks 847 buffer at 400200
    ide_read dev 0 start 0, blocks 1 buffer at 3F9F518
    ## Valid DOS partition found ##

    Loading from IDE device 0, partition 2: Name: hda2
      Type: PPCBoot
    First Block: 8064,  # of blocks: 8064, Block Size: 512
    ide_read dev 0 start 1F80, blocks 1 buffer at C00000
       Image Name:   Ramdisk Image
       Created:      2006-02-05  20:24:43 UTC
       Image Type:   PowerPC Linux RAMDisk Image (gzip compressed)
       Data Size:    765638 Bytes = 747 kB = 0 MB
       Load Address: 00000000
       Entry Point:  00000000
    ide_read dev 0 start 1F81, blocks 5D7 buffer at C00200
    ## Booting image at 00400000 ...
       Image Name:   DHT Kernel
       Created:      2006-02-05  19:37:25 UTC
       Image Type:   PowerPC Linux Kernel Image (gzip compressed)
       Data Size:    1085059 Bytes = 1059 kB = 1 MB
       Load Address: 00000000
       Entry Point:  00000000
       Verifying Checksum ... OK
       Uncompressing Kernel Image ... OK
    ## Loading RAMDisk Image at 00c00000 ...
       Image Name:   Ramdisk Image
       Created:      2006-02-05  20:24:43 UTC
       Image Type:   PowerPC Linux RAMDisk Image (gzip compressed)
       Data Size:    765638 Bytes = 747 kB = 0 MB
       Load Address: 00000000
       Entry Point:  00000000
       Verifying Checksum ... OK
       Loading Ramdisk to 03ee4000, end 03f9eec6 ... OK
    id mach(): done
    MMU:enter
    MMU:hw init
    MMU:mapin
    MMU:mapin_ram done
    MMU:setio
    MMU:exit
    setup_arch: enter
    setup_arch: bootmem
    setup_arch: ocp_early_init
    arch: exit
    arch: exit 2




    Welcome to the DHS local environment.

    uclibc login:




 The above procedure puts the userland image from the second partition
into a ramdisk. If you would like the userland to be an
ext2/3/rieser/xfs partition on the hdd do the following:

-   -   put the kernel and small userland onto the first and second
        partitions as above
    -   boot as above from the hdd to the ramdisk userland
    -   bring up the network and NFS mount a remote filesystem
    -   mkfs.ext2/3/reiser/xfs /def/hde3
    -   mount the resulting partition somewhere convienent
    -   populate that partition with the appropriate files
    -   sync, and unmount all mounted filesystems
    -   reboot to ppcboot
    -   change bootargs to "bootargs root=/def/hde3"
    -   bootd to try out the new root, if it works ok, reboot back to
        ppcboot, change the bootargs again and saveenv
    -   bootd and enjoy your new system.

This page was modified from and mostly lifted from:
[[1]](http://www.denx.de/wiki/view/DULG/UsingPCCard)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")

