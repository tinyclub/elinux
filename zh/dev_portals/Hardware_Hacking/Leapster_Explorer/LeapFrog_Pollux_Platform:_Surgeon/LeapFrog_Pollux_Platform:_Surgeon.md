> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Surgeon "http://eLinux.org/LeapFrog_Pollux_Platform:_Surgeon")


# LeapFrog Pollux Platform: Surgeon



Surgeon is a special initramfs USB Bootable firmware designed for the
[LeapPad Explorer](http://eLinux.org/LeapPad_Explorer "LeapPad Explorer") and [Leapster
Explorer](http://eLinux.org/Leapster_Explorer "Leapster Explorer"), that is used during
the firmware updating process. [Emerald
Boot](http://eLinux.org/Leapster_Explorer:_Emerald_Boot "Leapster Explorer: Emerald Boot")
is required for [USB
Booting](http://eLinux.org/Leapster_Explorer:_USB_Boot "Leapster Explorer: USB Boot"),
which comes stock with both LeapPad and Explorer. The
[Didj](http://eLinux.org/Didj "Didj") can be modified to run
[Emerald-Boot](http://eLinux.org/Didj_Emerald_Boot "Didj Emerald Boot") also, but
requires some work.

## Contents

-   [1 Anatomy](#anatomy)
-   [2 Versions](#versions)
-   [3 Building](#building)
    -   [3.1 Prerequisites](#prerequisites)
    -   [3.2 Software Needed](#software-needed)
    -   [3.3 Rootfs](#rootfs)
    -   [3.4 Compiling](#compiling)
        -   [3.4.1 Didj Patches](#didj-patches)
    -   [3.5 Booting](#booting)

### Anatomy

Surgeon is wrapped in a
[CBF](http://eLinux.org/LeapFrog_Pollux_Platform:_File_Format_CBF "LeapFrog Pollux Platform: File Format CBF")
layer. Inside is a basic gzip compressed zImage with an initramfs that
includes all of the programs necessary to run the basic Linux and
updating software.

Once in USB boot mode, either with
[LFConnect](http://eLinux.org/Leapster_Explorer:_USB_Boot "Leapster Explorer: USB Boot")
or [with
out](http://eLinux.org/Leapster_Explorer:_USB_Boot "Leapster Explorer: USB Boot") the
surgeon.cbf file can be sent to the device, where it is loaded by
Emerald Boot and executed.

This will start the [DFTP
Device](http://eLinux.org/LeapFrog_Pollux_Platform:_DFTPdevice "LeapFrog Pollux Platform: DFTPdevice")
which is basically a modified FTP server. You can use
[OpenLFConnect](http://eLinux.org/LeapFrog_Pollux_Platform:_OpenLFConnect "LeapFrog Pollux Platform: OpenLFConnect")
to exploit various functionality of the server. Using the update command
the kernel, erootfs and bulk firmwares can be flashed to NAND. You can
also mount the already installed firmware partitions, if you need to fix
an issue that can not be done during normal booting. Do remember Surgeon
is completely temporary, anything you modifying with in Surgeon, will
not remain after a reboot, which can make it an excellent means of
non-destructive testing.

### Versions

<table>
<thead>
<tr class="header">
<th align="left">Device</th>
<th align="left">Language</th>
<th align="left">File</th>
<th align="left">kernel_load</th>
<th align="left">kernel_jump</th>
<th align="left">compressed</th>
<th align="left">initramfs</th>
<th align="left">Size Limit</th>
<th align="left">DFTP Version</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">LeapPad</td>
<td align="left">English</td>
<td align="left">Surgeon.cbf</td>
<td align="left">0x00010000</td>
<td align="left">0x00010000</td>
<td align="left">True</td>
<td align="left">True</td>
<td align="left">8MB Memory Limited</td>
<td align="left">1.12</td>
</tr>
<tr class="even">
<td align="left">Explorer</td>
<td align="left">English</td>
<td align="left">Surgeon.cbf</td>
<td align="left">0x00008000</td>
<td align="left">0x00008000</td>
<td align="left">True</td>
<td align="left">True</td>
<td align="left">8MB Memory Limited</td>
<td align="left">1.12</td>
</tr>
<tr class="odd">
<td align="left">Explorer</td>
<td align="left">French</td>
<td align="left">Surgeon.cbf</td>
<td align="left">0x00008000</td>
<td align="left">0x00008000</td>
<td align="left">True</td>
<td align="left">True</td>
<td align="left">8MB Memory Limited</td>
<td align="left">1.8</td>
</tr>
</tbody>
</table>

## Building

### Prerequisites

[Set Up Build
Environment](http://eLinux.org/LeapFrog_Pollux_Platform:_Build_Environment "LeapFrog Pollux Platform: Build Environment")

[Kernel
Configuration](http://eLinux.org/LeapFrog_Pollux_Platform:_Kernel_Configuration "LeapFrog Pollux Platform: Kernel Configuration")

### Software Needed

[OpenLFConnect](http://eLinux.org/LeapFrog_Pollux_Platform:_OpenLFConnect "LeapFrog Pollux Platform: OpenLFConnect")

[Kernel Sources LeapPad or
Explorer](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code "LeapFrog Pollux Platform: Source Code")
RootFS

    * Build your own
    * Use OpenLFConnect to extract one from Surgeon

### Rootfs

The easiest way is to use OpenLFConnect, and extract one from a factory
Surgeon file. These commands will download the Surgeon package, extract
it, then extract the initramfs(rootfs) to \<current dir\>/rootfs.lx/

    package_download LX surgeon
    package_extract LX_surgeon<version>.lfp
    surgeon_extract_rootfs lx surgeon.cbf

This will

### Compiling

Nothing out of the ordinary here, there is a supplied config file for
surgeon, and just need SURGEONFS on the command line to point to your
rootfs.

    make lf1000_ts_surgeon_defconfig
    SURGEONFS=/path/to/your/rootfs ./install.sh

In either \<lf\_sources\>/linux-2.6/arch/arm/boot/ or
\<lf\_sources\>/target/tftp you'll find a zImage file of roughly 5.8mb
depending on LeapPad or Explorer sources.

Next using OpenLFConnect again, the file needs to be wrapped in CBF.
High(0x00010000) or Low(0x00008000) memory is according to your device,
check the versions chart.

    cbf_wrap high surgeon.cbf path/to/zImage

#### Didj Patches

[Didj Surgeon
Patch](http://files.poxlib.org/LeapFrog/elinux_downloads/Didj_Surgeon_Patch.tar.gz)

These patches take care of a few minor adjustments with the RootFS and
Kernel to allow Surgeon to work as normal with [Emerald
Boot](http://eLinux.org/Didj_Emerald_Boot "Didj Emerald Boot") on the
[Didj](http://eLinux.org/Didj "Didj"). Complied version included.

### Booting

Set the device in USB Boot mode, with cord connected. Again with
OpenLFConnect boot surgeon.

    surgeon_boot /path/to/surgeon.cbf

Once the command line returns, your device should be booting up. You can
then connect to the DFTP if you like thru OpenLFConnect

    dftp_device

You should get a summary of data, and you can now play around with
Surgeon.


