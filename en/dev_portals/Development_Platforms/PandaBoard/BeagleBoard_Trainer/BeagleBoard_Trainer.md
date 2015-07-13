> From: [eLinux.org](http://eLinux.org/BeagleBoard_Trainer "http://eLinux.org/BeagleBoard_Trainer")


# BeagleBoard Trainer



[![Trainer1a.jpg](http://eLinux.org/images/thumb/8/8d/Trainer1a.jpg/240px-Trainer1a.jpg)](http://eLinux.org/File:Trainer1a.jpg)

Trainer Features:

-   I2C interface(+3.3v or +5v selectable)
    -   Can be used with the [Nintendo Wii
        NunChuk](http://en.wikipedia.org/wiki/Wii_Remote#Nunchuk)
        interface
    -   Pin compatible with [WiiChuk
        Adapter](http://todbot.com/blog/2008/02/18/wiichuck-wii-nunchuck-adapter-available)
    -   WiiChuk Adapter is available from
        [SparkFun](http://www.sparkfun.com/commerce/product_info.php?products_id=9281)
    -   [Wii Nunchuk
        project](http://eLinux.org/BeagleBoard_Trainer_Nunchuk "BeagleBoard Trainer Nunchuk")
-   SPI inteface (+3.3v)
-   GPIO's(+3.3v)
-   Large prototyping area (0.1" x 0.1" matrix with access to power bus)
-   Atmega328 processor (user programmable)
    -   Arduino compatible
    -   ATmega328 power is +3.3v or +5v selectable
    -   Communicate to the ATmega328 via the BeagleBoard's second RS-232
        uart

Available from [[1]](http://www.tincantools.com/Trainer-Board.html)

## Contents

-   [1 Hardware](#hardware)
    -   [1.1 I²C Interface](#i-c2-b2c-interface)
    -   [1.2 SPI Interface](#spi-interface)
    -   [1.3 GPIO Interface](#gpio-interface)
    -   [1.4 Serial EEPROM](#serial-eeprom)
    -   [1.5 ATmega328 (Arduino Hardware
        Compatible)](#atmega328-arduino-hardware-compatible)
    -   [1.6 Prototyping / Breakout
        Area](#prototyping-breakout-area)
-   [2 PC Board Test Point Locations](#pc-board-test-point-locations)
-   [3 PC Board Silkscreen Errata](#pc-board-silkscreen-errata)
-   [4 Soldering BeagleBoard's Expansion
    Header](#soldering-beagleboard-s-expansion-header)
    -   [4.1 Attaching to the
        BeagleBoard](#attaching-to-the-beagleboard)
-   [5 Creating a bootable SD card in
    Ubuntu](#creating-a-bootable-sd-card-in-ubuntu)
    -   [5.1 Copy files onto the BOOT
        partition](#copy-files-onto-the-boot-partition)
    -   [5.2 Copy the files onto the Linux
        partition](#copy-the-files-onto-the-linux-partition)
-   [6 Trainer Schematics](#trainer-schematics)
-   [7 Where to purchase the Trainer
    board](#where-to-purchase-the-trainer-board)
-   [8 RevB Changes](#revb-changes)
-   [9 Other Links](#other-links)

# Hardware

[![Trainer
Rev-A](http://eLinux.org/images/thumb/b/b6/Trainer2.jpg/800px-Trainer2.jpg)](http://eLinux.org/File:Trainer2.jpg "Trainer Rev-A")


 [![Trainer Rev-A
Interface](http://eLinux.org/images/0/0e/Trainer_Rev-A_Interface_800.jpg)](http://eLinux.org/File:Trainer_Rev-A_Interface_800.jpg "Trainer Rev-A Interface")



## I²C Interface

The Trainer provides an interface to the BeagleBoard's I²C port. The I²C
signals are level translated to either +3.3V or +5V (user selectable
with a jumper). The I²C signals are located next the the prototyping
area.

How to access the I2C bus (from software):
[http://i2c.wiki.kernel.org/index.php/Linux\_2.6\_I2C\_development\_FAQ](http://i2c.wiki.kernel.org/index.php/Linux_2.6_I2C_development_FAQ)

## SPI Interface

The Trainer provides an interface the the BeagleBoard's SPI port and the
signals are level translated to +3.3V. The SPI signals are located next
to the prototyping area.

-   [SPI is working on the
    BeagleBoard-xM](http://beagleboardxm.org/blog/2011/03/22/progress-spi-is-working-on-the-beagleboard-xm/)
-   Accessing the SPI interface
    -   [user-space](http://www.kernel.org/doc/Documentation/spi/spidev)
    -   [kernel-space](http://www.kernel.org/doc/Documentation/spi/spi-summary)

## GPIO Interface

The Trainer provides an interface to several of the BeagleBoard's GPIO
signals. The GPIO signals are level translated to +3.3V and are located
next to the prototyping area.

## Serial EEPROM

The Trainer board provides an AT24C01 serial EEPROM that contains a
Vendor ID and a Device ID that the BeagleBoard uses to identify the type
of board connected to the expansion header. This information enables the
BeagleBoard to auto-configure the pin mux for signals needed by the
Trainer. More information can be found on the [Beagle Board Pin Mux
Page](http://eLinux.org/BeagleBoardPinMux "BeagleBoardPinMux").

## ATmega328 (Arduino Hardware Compatible)

An ATmega328 embedded processor is located on the Trainer board that is
user programmable. The ATmega328 is hardware compatible with the Arduino
and it's I/O signals are available next to the prototyping area. The
ATmega328 can be user jumpered to run at either +3.3V or +5V. One of the
BeagleBoard's GPIO signals (GPIO 162) controls the ATmega328's power
supply and can turn on or off the power to the ATmega328. The ATmega328
can run off it's internal RC oscillator or it also has an external 8.0
Mhz ceramic resonator.

**Note:** The ATmega328 must be programmed with an external hardware
programmer (not included) like the [Pocket AVR
Programmer](http://www.sparkfun.com/commerce/product_info.php?products_id=9231)
or the
[ATAVRISP2](http://www.mouser.com/ProductDetail/Atmel/ATAVRISP2/?qs=sGAEpiMZZMv256HIxPBQcA8%252bsNH3cLLR).

-   [Atmel Atmega328 Product
    Page](http://www.atmel.com/dyn/products/product_card_mcu.asp?PN=ATmega328)
-   Flash Programming
    -   [AVRDUDE](http://www.nongnu.org/avrdude/) software
    -   [AVR ISP](http://www.sparkfun.com/commerce/categories.php?c=7)
        hardware
-   [Introduction to programming Atmel AVR's under
    Linux](http://www.linuxjournal.com/article/7289?page=0,3)
-   [Arduino Homepage](http://www.arduino.cc/)
-   Arduino bootloader compatible with [ATmega328 Pro at
    8MHz](http://code.google.com/p/arduino/source/browse/tags/latest/hardware/arduino/bootloaders/atmega/ATmegaBOOT_168_atmega328_pro_8MHz.hex)
-   Arduino bootloader source can be found at
    [www.arduino.cc](http://code.google.com/p/arduino/source/browse/#svn/tags/latest/hardware/arduino/bootloaders/atmega)
-   Arduino bootloader configuration using ISP programmer:

<!-- -->

    avrdude -c usbtiny -p atmega328p -e -u -U lock:w:0x3f:m -U efuse:w:0x05:m -U hfuse:w:0xda:m -U lfuse:w:0xff:m
    avrdude -c usbtiny -p atmega328p -U flash:w:ATmegaBOOT_168_atmega328_pro_8MHz.hex -U lock:w:0x0f:m

-   AVR code and Arduino sketches can be uploaded using avrdude on the
    BeagleBoard:

<!-- -->

    avrdude -V -F -c stk500v1 -p m328p -P /dev/ttyS1 -b 57600 -U flash:w:main.hex

-   AVR code and Arduino sketches can be uploaded using
    [avrgal](http://eLinux.org/Avrgal "Avrgal") on the BeagleBoard:

<!-- -->

    avrgal main.hex

## Prototyping / Breakout Area

-   provides a prototyping / breakout area with a standard 0.1" x 0.1"
    spacing matrix
-   Access to BeagleBoard's level translated signals
-   Access to the ATmega328's I/O pins

# PC Board Test Point Locations

[![Trainer
Rev-A](http://eLinux.org/images/d/d5/Trainer_rev-a_tp_800.jpg)](http://eLinux.org/File:Trainer_rev-a_tp_800.jpg "Trainer Rev-A")



# PC Board Silkscreen Errata

There are errors on four silkscreen labels on the Trainer Rev-A board.
The silkscreen for the signals: GP135, GP134, GP133, and GP132 are
mislabeled. The correct labels are indicated on the following image:

[![Trainer Errata
Rev-A](http://eLinux.org/images/7/73/Trainer_rev-a_errata_800.jpg)](http://eLinux.org/File:Trainer_rev-a_errata_800.jpg "Trainer Errata Rev-A")


 Note: Trainer Rev-B has fixed these errors.

# Soldering BeagleBoard's Expansion Header

This is a quick guide showing you how to solder the 2x14 Header into the
BeagleBoard’s Expansion connector (J3).

[![Zippy2-expansion
connector1.jpg](http://eLinux.org/images/thumb/4/42/Zippy2-expansion_connector1.jpg/400px-Zippy2-expansion_connector1.jpg)](http://eLinux.org/File:Zippy2-expansion_connector1.jpg)

Insert the 2x14 Header’s SHORT PINS from the back side of the
BeagleBoard into the BeagleBoard’s expansion connector (J3).


 [![Zippy2-expansion
connector2.jpg](http://eLinux.org/images/thumb/4/4c/Zippy2-expansion_connector2.jpg/400px-Zippy2-expansion_connector2.jpg)](http://eLinux.org/File:Zippy2-expansion_connector2.jpg)

Position the 2x14 Header so the LONG PINS are on the BACK SIDE of the
BeagleBoard.


 [![Zippy2-expansion
connector3.jpg](http://eLinux.org/images/thumb/5/57/Zippy2-expansion_connector3.jpg/400px-Zippy2-expansion_connector3.jpg)](http://eLinux.org/File:Zippy2-expansion_connector3.jpg)

Solder the SHORT PINS of the 2x14 Header from the TOP SIDE of the
BeagleBoard.

## Attaching to the BeagleBoard

[![Zippy2-expansion
connector7.jpg](http://eLinux.org/images/thumb/e/e1/Zippy2-expansion_connector7.jpg/400px-Zippy2-expansion_connector7.jpg)](http://eLinux.org/File:Zippy2-expansion_connector7.jpg)

Attach the four board spacers with the screws provided.



[![Zippy2-expansion
connector4.jpg](http://eLinux.org/images/thumb/e/e6/Zippy2-expansion_connector4.jpg/400px-Zippy2-expansion_connector4.jpg)](http://eLinux.org/File:Zippy2-expansion_connector4.jpg)

Connect the expansion board onto the BACK SIDE of the BeagleBoard by
mating with the 2x14 Header you just soldered. Make sure all of the pins
align correctly.


 [![Zippy2-expansion
connector5.jpg](http://eLinux.org/images/thumb/e/e8/Zippy2-expansion_connector5.jpg/400px-Zippy2-expansion_connector5.jpg)](http://eLinux.org/File:Zippy2-expansion_connector5.jpg)

Continue pushing the two boards together until the connectors mate
together.


 [![Zippy2-expansion
connector6.jpg](http://eLinux.org/images/thumb/5/5f/Zippy2-expansion_connector6.jpg/400px-Zippy2-expansion_connector6.jpg)](http://eLinux.org/File:Zippy2-expansion_connector6.jpg)

Attach the male standoffs as shown.



[![Zippy2-expansion
connector8.jpg](http://eLinux.org/images/thumb/2/29/Zippy2-expansion_connector8.jpg/400px-Zippy2-expansion_connector8.jpg)](http://eLinux.org/File:Zippy2-expansion_connector8.jpg)

# Creating a bootable SD card in Ubuntu

This guide will demonstate how to create a **dual-partition** SD card
for the BeagleBoard/Trainer board combination to boot Linux from the
first partition and have the root file system located on the second
partition.

This guide covers the same procedure as [SDCard
setup](http://eLinux.org/BeagleBoardBeginners "BeagleBoardBeginners") and
[LinuxBootDiskFormat](http://code.google.com/p/beagleboard/wiki/LinuxBootDiskFormat).

This guide will use a **2GB SD card** for all examples.

**Determine which device the SD Card Reader is on your system**

Insert the SD Card into the SD Card Reader reader on your Linux PC. Then
determine which device it is on your system:

    dmesg | tail
    ...
    [2079456.496092] sd 34:0:0:0: [sdb] Mode Sense: 03 00 00 00
    [2079456.496096] sd 34:0:0:0: [sdb] Assuming drive cache: write through
    [2079456.513743] sd 34:0:0:0: [sdb] Assuming drive cache: write through
    [2079456.513751]  sdb: sdb1
    [2079456.529193] sd 34:0:0:0: [sdb] Assuming drive cache: write through
    [2079456.529201] sd 34:0:0:0: [sdb] Attached SCSI removable disk

In this case it shows up as /dev/sdb (note sdb insite the square
brackets above).

**Check to see if the automounter has mounted the SD Card:**

    df -h
    Filesystem            Size  Used Avail Use% Mounted on
    ...                   1.8G     0  1.8G   0% /lib/init/rw
    /dev/sdb1             1.9G     0  1.9G   0% /media/6262-9331
    ...

**If mounted, unmount the SD card**

    umount /media/6262-9331

**Start fdisk:**

    sudo fdisk /dev/sdb

**Print the partition record:**

      Command (m for help): p

      Disk /dev/sdb: 1967 MB, 1967128576 bytes
      57 heads, 56 sectors/track, 1203 cylinders
      Units = cylinders of 3192 * 512 = 1634304 bytes
      Disk identifier: 0x00000000

      Device Boot      Start         End      Blocks   Id  System
      /dev/sdb1            1        1204     1920955+   6  FAT16

Note card size in bytes listed above (in this example: **1967128576**).
**Write this number down, it will be needed later below**.

**Delete any partitions that are already on the SD card**

     Command (m for help): d
     Selected partition 1

**Set the Geometry of the SD Card**

Go into "Expert mode":

     Command (m for help): x

Now we want to set the geometry to 255 heads, 63 sectors and calculate
the number of cylinders required for the particular SD card you are
using:

      Expert command (m for help): h
      Number of heads (1-256, default 57): 255

      Expert command (m for help): s
      Number of sectors (1-63, default 56): 63
      Warning: setting sector offset for DOS compatiblity

      Expert command (m for help): c
      Number of cylinders (1-1048576, default 1203): 239

The **239** entered in the cylinders above must be calculated based upon
the size of your particular SD card.

**Now Calculate the number of Cylinders for your SD card:**

***number of cylinders = FLOOR (the number of Bytes on the SD Card (from
above) / 255 heads / 63 sectors / 512 sector size in bytes )***

So for this example: 1967128576 / 255 / 63 / 512 = 239.156427 (use
Google to calculate). So we use 239 (i.e. truncate, don't round).

Return to "Normal" mode:

    Expert command (m for help): r


 **Print the partition record to check your work:**


     Command (m for help): p

     Disk /dev/sdb: 1967 MB, 1967128576 bytes
     255 heads, 63 sectors/track, 239 cylinders
     Units = cylinders of 16065 * 512 = 8225280 bytes

       Device Boot      Start         End      Blocks   Id  System

**Create the FAT32 partition for booting and transferring files from
your PC**

     Command (m for help): n
     Command action
        e   extended
        p   primary partition (1-4)
     p
     Partition number (1-4): 1
     First cylinder (1-15, default 1): 1
     Last cylinder or +size or +sizeM or +sizeK (1-239, default 239): 50

     Command (m for help): t
     Selected partition 1
     Hex code (type L to list codes): c
     Changed system type of partition 1 to c (W95 FAT32 (LBA))

We use 50 cylinders of the total of 239 for the FAT32 partition above.
The remainder of the cylinders will be used for the Linux root file
system below.

**Mark this FAT32 partition as bootable:**

    Command (m for help): a
    Partition number (1-4): 1

**Create the Linux partition for the root file system**

     Command (m for help): n
     Command action
        e   extended
        p   primary partition (1-4)
     ''p''
     Partition number (1-4): 2
     First cylinder (51-239, default 51): 51
     Last cylinder or +size or +sizeM or +sizeK (51-239, default 239): 239

**Print the partition record to check your work**


     Command (m for help): p

     Disk /dev/sdb: 1967 MB, 1967128576 bytes
     255 heads, 63 sectors/track, 239 cylinders
     Units = cylinders of 16065 * 512 = 8225280 bytes


       Device Boot      Start         End      Blocks   Id  System
     /dev/sdb1               1         50     1920955+   c  w95 FAT32 (LBA)
     /dev/sdb2              51         239               83 Linux

**Save the new partition records on the SD card**

This is an important step. All work up to now has been temporary.

      Command (m for help): w
      The partition table has been altered!

      Calling ioctl() to re-read partition table.

      WARNING: If you have created or modified any DOS 6.x
      partitions, please see the fdisk manual page for additional
      information.
      Syncing disks.

**Format the partitions**

      sudo mkfs.msdos -F 32 /dev/sdb1 -n boot
      mkfs.msdos 3.0.3 (18 May 2009)

      sudo mkfs.ext3 -L rootfs /dev/sdb2
      mke2fs 1.41.9 (22-Aug-2009)
      Filesystem label=rootfs
      OS type: Linuxsudo mkfs.ext3 -L rootfs /dev/sdb2
      mke2fs 1.41.9 (22-Aug-2009)
      Filesystem label=rootfs
      OS type: Linux
      Block size=4096 (log=2)
      Fragment size=4096 (log=2)
      95040 inodes, 379535 blocks
      18976 blocks (5.00%) reserved for the super user
      First data block=0
      Maximum filesystem blocks=390070272
      12 block groups
      32768 blocks per group, 32768 fragments per group
      7920 inodes per group
      Superblock backups stored on blocks:
          32768, 98304, 163840, 229376, 294912

      Writing inode tables: done
      Creating journal (8192 blocks): done
      Writing superblocks and filesystem accounting information: done

## Copy files onto the BOOT partition

You will need to download the demo/test files for the
BeagleBoard/Trainer board combination:

1.  [MLO](http://eLinux.org/images/5/57/MLO-trainer.ift "MLO-trainer.ift") (save as MLO)
2.  [u-boot.bin](http://eLinux.org/images/c/c0/U-boot-trainer.bin "U-boot-trainer.bin")
    (save as u-boot.bin)
3.  [uImage](http://eLinux.org/images/d/db/UImage-trainer.bin "UImage-trainer.bin") (save
    as uImage)
4.  [test.rootfs.tar.gz](http://eLinux.org/images/7/73/Test.rootfs3.tar.gz "Test.rootfs3.tar.gz")
    (save as test.rootfs.tar.gz)


 And now copy the first three files onto the boot partition
(**IMPORTANT: Copy MLO FIRST!** because of a bug in the X-loader which
causes problems if MLO is not the first file written onto the boot
partition).

     cp MLO /media/boot/MLO
     cp u-boot.bin /media/boot/u-boot.bin
     cp uImage /media/boot/uImage

## Copy the files onto the Linux partition

The next step is to extract the files in **test-rootfs.tar.gz** into the
rootfs partition (NOT the boot partition) on the SD card. This can only
be done by using Linux.

     sudo tar -zxvf test-rootfs.tar.gz -C /media/rootfs

Unmount the SD card from the Linux PC and insert it into the
BeagleBoard's SD connector.

Then boot your BeagleBoard while holding down the "User" button.

# Trainer Schematics

The Trainer Rev-A schematic is avalible here:

-   [Trainer\_Rev-A1\_schematic](http://eLinux.org/images/b/b6/Trainer_Rev-A1_schematic.pdf "Trainer Rev-A1 schematic.pdf")

The Trainer Rev-B schematic is avalible here:

-   [Trainer\_Rev-B\_schematic](http://eLinux.org/images/6/6b/Trainer_Rev-B_schematic.pdf "Trainer Rev-B schematic.pdf")

# Where to purchase the Trainer board

The Trainer board can be purchased from:

USA:
[www.tincantools.com](http://www.tincantools.com/product.php?productid=16149&cat=0&page=1&featured)

Canada: [www.robotcraft.ca](http://www.robotcraft.ca/webshop/)

Germany:
[www.watterott.com](http://www.watterott.com/index.php?page=product&info=1494)

# RevB Changes

-   Fix the silkscreen errors on the signals: GP135, GP134, GP133, and
    GP132. They are currently mislabeled.
-   Change the pushbutton switch (S1 - ATMEL reset switch) to a
    different part.
-   Move TP58 (+5V) away from the mounting hole about 0.050 inches. It
    can sometimes short when the mounting screw touches it.
-   Add a 2x2 header break-out for the TXD and RXD signals going to the
    ATMEGA328.
    -   Some people want to be able to use the level translated serial
        signals to communicate with the Beagle/Beagle-xM instead of
        using it for the ATMEGA328.
    -   Add two traces on the back of the board connecting the two
        header holes so that jumper are not required.
-   Fix the footprint on the ceramic resonator.
-   Change the I2C level translator to a PCA9306. This will allow
    smaller pull-ups for the I2C signals going to the AT24C01 EEPROM.
-   Eliminate resistor network RN1 and replace it with three individual
    2.2K pull-up resistors (0402).

# Other Links

Makezine post about the Trainer Board is located
[here.](http://blog.makezine.com/archive/2010/09/playing-with-the-arduino-compatible.html)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [BeagleBoard](http://eLinux.org/Category:BeagleBoard "Category:BeagleBoard")
-   [BeagleBoard Expansion
    Boards](http://eLinux.org/Category:BeagleBoard_Expansion_Boards "Category:BeagleBoard Expansion Boards")
-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")

