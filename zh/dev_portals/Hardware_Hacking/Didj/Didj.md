> From: [eLinux.org](http://eLinux.org/Didj "http://eLinux.org/Didj")


# Didj



**This device is part of the [LeapFrog Pollux
Platform](http://eLinux.org/LeapFrog_Pollux_Platform "LeapFrog Pollux Platform"), it's
recommended to start there for general information.**

[![](http://eLinux.org/images/thumb/c/cd/Didj.jpg/350px-Didj.jpg)](http://eLinux.org/File:Didj.jpg)

[](http://eLinux.org/File:Didj.jpg "Enlarge")

The LeapFrog Didj

## Contents

-   [1 Summary](#summary)
-   [2 Platform](#platform)
-   [3 Boot Loader](#boot-loader)
-   [4 Sources and Toolchains](#sources-and-toolchains)
-   [5 Tutorials/How To's](#tutorials-how-to-s)
-   [6 Development Scripts and
    Programs](#development-scripts-and-programs)
-   [7 Technical Information](#technical-information)
-   [8 Images](#images)
-   [9 External Links](#external-links)

## Summary

The Didj was a toy produced by Leapfrog marketed for educational games
for children aged 5-10.

Didj was end-of-lifed by Leapfrog in mid-2010. It has been replaced by
the [Leapster Explorer](../../.././dev_portals/Hardware_Hacking/Leapster_Explorer/Leapster_Explorer.md "Leapster Explorer").

Although Didj has a proprietary graphical front end, it runs a generic
Linux distribution on an Arm based processor. Soon after the Didj's
release, it was discovered that the cartridge port contained pins that
allowed for serial console access with root privileges. After this
discovery, work began to modify the Didj into an accessible emulation
device.

Since development began, much has been accomplished, including:

-   Discovered that the Arm chip is the same as on the [GP2X
    Wiz](http://eLinux.org/GP2X_Wiz "GP2X Wiz"), only at a lower clock speed.
-   Created cartridges that support SD cards
-   Accessed the UART features in the cartridge slot



## Platform

[LeapFrog Pollux
Platform](http://eLinux.org/LeapFrog_Pollux_Platform "LeapFrog Pollux Platform")

The Didj is part of 3 different devices that all share a common hardware
platform, based around the [Pollux](http://eLinux.org/Pollux "Pollux") SoC. The platform
page contains information generic across these devices, and it is
recommended that you refer to that page as it is a good starting point
to understanding the Didj, and contains some basic How To's and
Tutorials to get you started.

## Boot Loader

-   [Lightning Boot](http://eLinux.org/Didj_Lightning_Boot "Didj Lightning Boot")
-   [U-Boot](http://eLinux.org/Didj_U-Boot "Didj U-Boot")
-   [Compile and Install
    Emerald-Boot](http://eLinux.org/Didj_Emerald_Boot "Didj Emerald Boot")

## Sources and Toolchains

-   [Sources and
    Toolchains](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code "LeapFrog Pollux Platform: Source Code")

## Tutorials/How To's

**General**

-   [Common Commands
    Reference](http://eLinux.org/Didj_Common_Commands "Didj Common Commands")
-   [Console
    Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")
-   [Cartridges](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge "LeapFrog Pollux Platform: Cartridge")
    -   [Cartridge
        Settings](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge_Settings "LeapFrog Pollux Platform: Cartridge Settings")
-   [Extract lfp/lf2
    Archives](http://eLinux.org/LeapFrog_Pollux_Platform:_Extract_Archives "LeapFrog Pollux Platform: Extract Archives")

**Networking**

-   [Enable Networking via USB
    Gadget](http://eLinux.org/Didj_Enable_Networking "Didj Enable Networking")
-   [Install Dropbear
    SSH](http://eLinux.org/Didj_Install_Dropbear "Didj Install Dropbear")
-   [Playing MP3 network streams and
    files](http://eLinux.org/Didj_MP3_Streaming "Didj MP3 Streaming")
-   [Networking
    Setup](http://eLinux.org/LeapFrog_Pollux_Platform:_Networking "LeapFrog Pollux Platform: Networking")
-   [Networking
    Applications](http://eLinux.org/LeapFrog_Pollux_Platform:_Networking_Applications "LeapFrog Pollux Platform: Networking Applications")
-   [Internet Access from
    Device](http://eLinux.org/LeapFrog_Pollux_Platform:_Internet_Access "LeapFrog Pollux Platform: Internet Access")
-   [Mount NFS
    Directory](http://eLinux.org/LeapFrog_Pollux_Platform:_Mount_NFS_Directory "LeapFrog Pollux Platform: Mount NFS Directory")

**USB Storage**

-   [USB Mounting Under Windows, Linux, and OS
    X](http://eLinux.org/Didj_USB_Mounting "Didj USB Mounting")
-   [SCSI Commands](http://eLinux.org/Didj_SCSI_Commands "Didj SCSI Commands")

**Cartridge**

-   [Make an ATAP NAND Cartridge](http://eLinux.org/Didj_Make_ATAP "Didj Make ATAP")

**Flash NAND**

-   [Flash Data to
    NAND](http://eLinux.org/Didj_U-Boot_NAND_Flashing "Didj U-Boot NAND Flashing")
-   [Updating
    Bootloader/Firmware](http://eLinux.org/Didj_BootLoader_Firmware_Updating "Didj BootLoader Firmware Updating")

**Firmware Image**

-   [Mount JFFS2 Image on
    Linux](http://eLinux.org/File_Systems#Mounting_JFFS2_image_on_PC_using_mtdram "File Systems")
    -   Relevant Settings
    -   Correct endianess

-   [Create JFFS2
    image](http://eLinux.org/LeapFrog_Pollux_Platform:_Firmware#Didj_JFFS2 "LeapFrog Pollux Platform: Firmware")
    -   Relevant Settings
    -   -e 128
    -   -p

**Kernel/RootFS/Firmware**

-   [Building
    libSDL](http://eLinux.org/Didj_and_Explorer_libSDL "Didj and Explorer libSDL")
-   [Building SDL\_ttf font
    library](http://eLinux.org/Didj_and_Explorer_SDL_ttf "Didj and Explorer SDL ttf")
-   [Building SDL\_image library with jpg and png
    support](http://eLinux.org/Didj_and_Explorer_SDL_image "Didj and Explorer SDL image")
-   [Building SDL\_mixer audio
    library](http://eLinux.org/Didj_and_Explorer_SDL_mixer "Didj and Explorer SDL mixer")
-   [Building
    tslib](../../.././dev_portals/Hardware_Hacking/Leapster_Explorer/Leapster_Explorer.md:_tslib_Touchscreen_Library "Leapster Explorer: tslib Touchscreen Library")
-   [SDL
    Resources](../../.././dev_portals/Hardware_Hacking/Leapster_Explorer/Leapster_Explorer.md:_SDL_resources "Leapster Explorer: SDL resources")
-   [Didj Kernel 2.6.31
    Upgrade](http://eLinux.org/Didj_2.6.31_Kernel "Didj 2.6.31 Kernel")
-   [2.6.31 Kernel for
    Didj](http://eLinux.org/Didj_Explorer_Kernel "Didj Explorer Kernel")
-   [Boot Kernel and Rootfs from SD
    w/Framebuffer](http://eLinux.org/Didj_Explorer_SD_Kernel "Didj Explorer SD Kernel")
-   [Linux Framebuffer
    Driver](../../.././dev_portals/Hardware_Hacking/Leapster_Explorer/Leapster_Explorer.md_Framebuffer_Driver "Leapster Explorer Framebuffer Driver")
-   [Enable SD Card
    Module](http://eLinux.org/Didj_and_Explorer_MMC_Patch "Didj and Explorer MMC Patch")
-   [Building The Explorer Root File
    System](../../.././dev_portals/Hardware_Hacking/Leapster_Explorer/Leapster_Explorer.md_Root_File_System "Leapster Explorer Root File System")
-   [Changing the fb driver to display the boot logo
    correctly](http://eLinux.org/Didj_and_Explorer:_boot_pixel_format "Didj and Explorer: boot pixel format")
-   [TV
    Out](http://eLinux.org/LeapFrog_Pollux_Platform:_TV_Out "LeapFrog Pollux Platform: TV Out")
-   [Generic Buildroot Rootfs and Kernel
    build](http://eLinux.org/Didj_2.6.31_Generic_Buildroot "Didj 2.6.31 Generic Buildroot")

**Games and Emulators**

-   [Emulators and
    Games](http://eLinux.org/LeapFrog_Pollux_Platform:_Emulators_And_Games "LeapFrog Pollux Platform: Emulators And Games")

**Brio Development**

-   [Replacing the default App Menu from the default App
    Menu](http://eLinux.org/Didj_Replacement_App_Menu "Didj Replacement App Menu")

**JTAG**

-   [JTAG
    Pinouts](http://eLinux.org/LeapFrog_Pollux_Platform:_JTAG_Pinouts "LeapFrog Pollux Platform: JTAG Pinouts")
-   [Pollux FTDI JTAG How
    To](http://eLinux.org/Pollux:_FTDI_JTAG_How_To "Pollux: FTDI JTAG How To")
-   [Pollux JTAG Wiggler
    Config](http://eLinux.org/Pollux_JTAG_with_Wiggler "Pollux JTAG with Wiggler")
-   [JTAG Kernel
    Boot](http://eLinux.org/LeapFrog_Pollux_Platform:_JTAG_Kernel_Boot "LeapFrog Pollux Platform: JTAG Kernel Boot")

**Compiling Source Code**

-   [Set up the Build
    Environment](http://eLinux.org/LeapFrog_Pollux_Platform:_Build_Environment "LeapFrog Pollux Platform: Build Environment")
-   [Kernel
    Configuration](http://eLinux.org/LeapFrog_Pollux_Platform:_Kernel_Configuration "LeapFrog Pollux Platform: Kernel Configuration")

## Development Scripts and Programs

-   [LF1000 UART Bootstrap
    Utility](http://git.berlios.de/cgi-bin/gitweb.cgi?p=opendidj;a=blob_plain;f=host_tools/lf1000_bootstrap.py;h=f0d3ef0d9186edf368062608ff868914e6083ee4;hb=06890453479d271856f58d1d2cb685ee6e5afd5f)
    written in Python
-   [LF1000 UART Bootstrap
    Utilities](http://eLinux.org/images/a/ad/Lf1000-bootstrap-utilities.tar.gz "Lf1000-bootstrap-utilities.tar.gz")
    based on the OMAP boot utilities from TI

## Technical Information

-   [Initial Memory Map Dump](http://eLinux.org/Didj_Mem_Map "Didj Mem Map")
-   [Map of Didj GPIO Pins](http://eLinux.org/Didj_GPIO_Map "Didj GPIO Map")
-   [Device
    Comparison](http://eLinux.org/LeapFrog_Pollux_Platform:_Technical_Details "LeapFrog Pollux Platform: Technical Details")

**File System Info**

-   rootfs / rootfs rw
-   /dev/root / jffs2 ro
-   none /proc proc rw
-   sysfs /sys sysfs rw
-   /dev/ram0 /tmp tmpfs rw
-   /dev/mtdblock1 /flags jffs2 rw,sync,noatime
-   /dev/mtdblock2 /mfgdata jffs2 ro,sync,noatime
-   /dev/mtdblock10 /Didj vfat
    rw,noatime,fmask=0022,dmask=0022,codepage=cp437,iocha rset=iso8859-1
-   /dev/mtdblock11 /Cart vfat
    ro,noatime,fmask=0022,dmask=0022,codepage=cp437,iocha rset=iso8859-1

<!-- -->

    Filesystem                Size       Mounted on
    /dev/mtdblock6           14.0M     /
    /dev/mtdblock1          896.0k    /flags
    /dev/mtdblock2            1.0M    /mfgdata
    /dev/mtdblock9          215.8M    /Didj


 **Active Kernel/Rootfs**

Near the begging of the boot message you should see one of two root
options:

    root=31:04

You are using mtd4: 00e00000 00020000 "Linux\_RFS0" or

    root=31:06

You are using mtd6: 00e00000 00020000 "Linux\_RFS1"


 **Partitions**

<table>
<tbody>
<tr class="odd">
<td align="left">Name</td>
<td align="left">Location</td>
<td align="left">Size</td>
<td align="left">Device</td>
<td align="left">Notes</td>
</tr>
<tr class="even">
<td align="left">LF1000_uniboot</td>
<td align="left">0x00000000</td>
<td align="left">0x00020000</td>
<td align="left">/dev/mtd0</td>
<td align="left">Lightning Boot</td>
</tr>
<tr class="odd">
<td align="left">Atomic_Boot_Flags</td>
<td align="left">0x00020000</td>
<td align="left">0x000E0000</td>
<td align="left">/dev/mtd1</td>
<td align="left">On NAND</td>
</tr>
<tr class="even">
<td align="left">Manufacturing_Data</td>
<td align="left">0x00100000</td>
<td align="left">0x00100000</td>
<td align="left">/dev/mtd2</td>
<td align="left">On NAND</td>
</tr>
<tr class="odd">
<td align="left">Kernel0</td>
<td align="left">0x00200000</td>
<td align="left">0x00200000</td>
<td align="left">/dev/mtd3</td>
<td align="left">On NAND</td>
</tr>
<tr class="even">
<td align="left">Linux_RFS0</td>
<td align="left">0x00400000</td>
<td align="left">0x00E00000</td>
<td align="left">/dev/mtd4</td>
<td align="left">On NAND</td>
</tr>
<tr class="odd">
<td align="left">Kernel1</td>
<td align="left">0x01200000</td>
<td align="left">0x00200000</td>
<td align="left">/dev/mtd5</td>
<td align="left">On NAND</td>
</tr>
<tr class="even">
<td align="left">Linux_RFS1</td>
<td align="left">0x01400000</td>
<td align="left">0x00E00000</td>
<td align="left">/dev/mtd6</td>
<td align="left">On NAND</td>
</tr>
<tr class="odd">
<td align="left">Brio</td>
<td align="left">0x02200000</td>
<td align="left">0x0DE00000</td>
<td align="left">/dev/mtd7</td>
<td align="left">On NAND</td>
</tr>
<tr class="even">
<td align="left">EXT</td>
<td align="left">0x10000000</td>
<td align="left">0x10000000</td>
<td align="left">/dev/mtd8</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">Cartridge</td>
<td align="left">0x00000000</td>
<td align="left">0x10000000</td>
<td align="left"></td>
<td align="left">On Cartridge NAND</td>
</tr>
</tbody>
</table>


 **Battery Compartments**

The Didj has two identical battery compartments, the combined collection
of batteries are wired in series.

-   Battery Compartment Terminals:
    -   Term 1 - Battery +
    -   Term 2 - Temp Sensor + Wired to Pollux pins K20 / GPIOA 28 and
        K21 / GPIOA 29
    -   Term 3 - Temp Sensor -
    -   Term 4 - Battery -


 **Rechargeable Batteries**

In addition to the terminals facing the Didj's contacts, there are
another set of contacts facing away from the Didj. These contacts are
duplicates used by the charging station. The batteries themselves are
NIMH cells, producing around 2.5v per pack when fully charged.


 **Recharging Station**

The recharger station contains a battery charge circuit with temperature
monitoring. The station also has a pair of contacts that duplicate the
9V dc barrel jack.


 **SSP / SPI Controller** [Didj SPI
Info](http://eLinux.org/Didj_SPI_Info "Didj SPI Info")

## Images

-   PCB Images
-   Error creating thumbnail: Invalid thumbnail parameters

    Front side mainboard, with LF1000 CPU and SDRAM de-soldered.

-   [![](http://eLinux.org/images/thumb/5/51/Bga-closeup.jpg/112px-Bga-closeup.jpg)](http://eLinux.org/File:Bga-closeup.jpg)

    Close up of the LF1000 CPU ball-grid.

-   Error creating thumbnail: Invalid thumbnail parameters

    Back side mainboard, with cartridge socket and NAND de-soldered.

-   [![](http://eLinux.org/images/thumb/d/db/Didj_Mainboard_Front.jpg/120px-Didj_Mainboard_Front.jpg)](http://eLinux.org/File:Didj_Mainboard_Front.jpg)

    Front side mainboard

-   [![](http://eLinux.org/images/thumb/f/f5/Didj_Mainboard_Back.jpg/120px-Didj_Mainboard_Back.jpg)](http://eLinux.org/File:Didj_Mainboard_Back.jpg)

    Back side mainboard

## External Links

-   [Cozybit boasts of their involvment in integrating Linux with the
    Didj](http://www.cozybit.com/stories.htm)
-   [Hacking around with the Leapfrog
    Didj](http://blogs.distant-earth.com/wp/?p=64)
-   [Claude's Didj Hacking
    Page](http://sites.google.com/site/claudeschwarz/didjhacking2)
-   Hackaday Posts
    -   [Didj
        Hacking](http://hackaday.com/2010/02/01/leapfrog-didj-handheld-linux-on-the-cheap/)
    -   [Didj Hacking
        Followup](http://hackaday.com/2010/02/03/leapfrog-didj-followup/)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

