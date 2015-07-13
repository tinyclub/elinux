> From: [eLinux.org](http://eLinux.org/RPi_Tasks "http://eLinux.org/RPi_Tasks")


# RPi Tasks





<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#About">1 About</a></li>
<li><a href="#OTG_device_mode">2 OTG device mode</a></li>
<li><a href="#OTG_Device_mode_2">3 OTG Device mode</a>
<ul>
<li><a href="#Possibly_simpler_recovery_idea">3.1 Possibly simpler recovery idea</a></li>
<li><a href="#An_Even_Simpler_Backup.2FRestore_Idea">3.2 An Even Simpler Backup/Restore Idea</a></li>
</ul></li>
<li><a href="#mkcard.sh">4 mkcard.sh</a></li>
<li><a href="#delay_copy.sh">5 delay_copy.sh</a>
<ul>
<li><a href="#Automatic.2C_no_delay_solution">5.1 Automatic, no delay solution</a></li>
</ul></li>
<li><a href="#RISC_OS">6 RISC OS</a></li>
<li><a href="#R-Pi_System.2FData_Management">7 R-Pi System/Data Management</a></li>
<li><a href="#Multi_Code">8 Multi Code</a></li>
<li><a href="#References">9 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Community Pages:**

*[Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") - a list of tutorials.
Learn by doing.*

*[Guides](http://eLinux.org/RPi_Guides "RPi Guides") - a list of informative guides. Make
something useful.*

*[Projects](http://eLinux.org/RPi_Projects "RPi Projects") - a list of community
projects. Help others out.*

***Tasks** - for advanced users to collaborate on software tasks.*

*[Datasheets](http://eLinux.org/RPi_DatasheetCategories "RPi DatasheetCategories") - a
frambozenier.org documentation project.*

*[Education](http://eLinux.org/RPi_Education "RPi Education") - a place to share your
group's project and find useful learning sites.*

*[Community](http://eLinux.org/RPi_Community "RPi Community") - links to the community
elsewhere on the web.*

*[Games](http://eLinux.org/RPi_Games "RPi Games") - all kinds of computer games.*



## About

This page lists key functionality missing from [Raspberry Pi
Foundation's](http://www.raspberrypi.org) ultra-low-cost (\~15UKP or
25USD) Linux computer for teaching computer programming to children, and
encourages the community to provide a solution.

The Raspberry Pi Foundation is a UK registered charity (Registration
Number 1129409) which exists to promote the study of computer science
and related topics, especially at school level, and to put the fun back
into learning computing. We expect this computer to have many other
applications both in the developed and the developing world.

**Please note that the Raspberry Pi has only just been released - this
page is a community work in progress in preparation for when people get
their devices. Please also note that we will be setting up a repository
for uploading contributions, but this isn't ready yet so please simply
use [http://pastebin.com](http://pastebin.com) or
[http://dropbox.com](http://dropbox.com) and provide a link from this
page, until we have something set up**

It is intended that these tasks will be implemented by the Raspberry Pi
community.



## OTG device mode

Inspired by the device mode idea below: Allow the Raspberry Pi to work
as an USB device. Sharing the SD card as a storage device is one option.
But becoming an USB-display is another.

Decisions to make: Run Linux on the "device mode" Raspberry Pi or not?

Difficulties: the Raspberry Pi has a "device mode" connector, but the
data pins are unconnected. Solutions: Use the USB connector on a Model A
with a custom cable/converter, or find pins on the board to attach
patchwires to.



## OTG Device mode

**The idea**: A student has damaged or wiped the OS on their SDCard. By
plugging two Raspberry Pi's back-to-back using the Mini-AB cable with
the white end attached to the working device and a recovery SDcard image
in the non-working device, the firmware will allow the non-working
unit's SD card to be accessible to the working unit.

**The detail**: Once both devices are booted, the recovery image runs
completely from RAM. The SDcard can be ejected and the damaged or wiped
SDcard inserted. The SDcard of the working machine can then be cloned.

**The task**: The device won’t support device mode out of the box,
though we’re using a Synopsys OTG core so the hardware is there and the
firmware is open, so it might be possible. I suspect if you forced 5V
onto the USB power rail it would boot. (Note: Maybe not: There might be
a 140mA Polyfuse in there, if the PI is produced before August 25,
2012).

A device driver would need to be written and a recovery image created. A
command line tool set will need to be provided to deliver the
functionality described above.

### Possibly simpler recovery idea

How about a recovery application as part of the standard image, that can
run from RAM? This just needs a working SDcard. The goal is to clone the
working SDcard to a "bricked" SDcard.

Here's a possible workflow:

1.  Start the device with a working SDCard.
2.  Start the "recovery" application. This probably does super
    kernel/driver magic to only provide text out, and SDcard
    mounting/unmounting, and prompts the user.
3.  Using the available RAM as buffer, load the first 128/256 MB (minus
    1 MB for the recovery thing.)
4.  Ask the user to switch to the "bricked" card.
5.  Write the first 128/256 MB to the bricked card.
6.  Keep swapping, 16 times (or 8, if you have a 256 MB device)
7.  If the card has two partitions, one for OS, and one for user files,
    the number of swaps needed is smaller.

With two devices, this can be improved to something similar to the
original suggestion, but using a simple binary that comes with the
distribution:

1.  Start device 1 with a working SDcard.
2.  Run the "brick recovery" application. This makes sure to lock itself
    in RAM. Prompt user to insert the bad card and connect device 2.
3.  Start device 2 off the working SDcard and connect to device 1. (How
    does power work here? That might be really hard without a special "A
    to A" cable...)
4.  Run the "brick recovery" application on device 2. This detects that
    device 1 is already connected, and starts transferring the image
    from the SDcard.

The nice thing here is that recovery only needs to be a small binary on
the original image, and is always available, and would be available even
without a USB cable in case 1.

The special affordances needed by the recovery application are:

1.  Switch graphics into text mode, or some other super-simple
    presentation mode that doesn't need lots of RAM.
2.  Run the SDcard port.
3.  Stop everything else from happening.
4.  Lock the recovery application and SDcard driver into RAM.
5.  Optional USB driver for 2-device recovery, also coded into the
    recovery app.

Once the kernel has that "take over the device" mode, I'm sure some
neato to-the-metal applications will also spring up ;-)

### An Even Simpler Backup/Restore Idea

A much easier and less error-prone recovery method would be to clone the
current system's SDcard to another card in a USB writer. The software
required could be a simple shell script wrapper around dd, maybe using
dialog for prompts and warnings and confirmations.

USB SDcard Reader/Writers are cheap - even Amazon has them for \$1.75,
retail price for single units, and you can probably find them even
cheaper if you google for "USB SDcard writer". Some writers are as small
as USB thumb-drives.

They could offered as an optional purchase along with a Raspberry Pi, or
schools could be given one or two with larger orders, along with
instructions on how to use them to restore a student's damaged SDcard.

This could be treated as a mundane "Backup Your SDcard" procedure,
rather than as a scary last resort.

## mkcard.sh

**The idea**: A script which partitions and formats the SDcard ready for
software.

**The detail**: BeagleBoard community uses something similar, see
[http://www.angstrom-distribution.org/demo/beagleboard/](http://www.angstrom-distribution.org/demo/beagleboard/)
and
[http://www.xora.org.uk/2009/08/14/omap3-sd-booting/](http://www.xora.org.uk/2009/08/14/omap3-sd-booting/)

**The task**: Write a script to create a FAT32 partition for the GPU
firmware and a EXT3 partition for the rootfs.


 [Tomato](http://eLinux.org/User:Tomato "User:Tomato") 22:08, 22 October 2011 (UTC)

Some of my past projects use such a script to generate a sdcard. I
modified it, so it does only the requested things ( removed the part
that installs a MBR and copies files to the card ). It can be found here
[http://pastebin.com/u9Qpm5n0](http://pastebin.com/u9Qpm5n0). ATM the
partitions are \~80 MB for ext, rest of the card for FAT32 (can be
changed on request).

[John
Lane](http://eLinux.org/index.php?title=User:Johnlane&action=edit&redlink=1 "User:Johnlane (page does not exist)")
has made his utilities for the Raspberry Pi available. Included is
[rpi\_mkimage](https://github.com/johnlane/rpi-utils/blob/master/disk/rpi_mkimage)
which partitions and formats an sd card, aligning it with its preferred
erase size. It can also copy files onto the card leaving it ready to
boot. Available on [GitHub](https://github.com/johnlane/rpi-utils).
August 22nd, 2012.

## delay\_copy.sh

**The idea**: A script that copies files from an attached USB flash
drive to the SDcard after a delay, allowing the user to unplug the
keyboard or mouse and plug in the USB drive.

**The detail**: See
[http://www.raspberrypi.org/?page\_id=43&mingleforumaction=viewtopic&t=152.0](http://www.raspberrypi.org/?page_id=43&mingleforumaction=viewtopic&t=152.0)

**The task**: Write the script. Make it bullet proof.



### Automatic, no delay solution

--[Markit](http://eLinux.org/index.php?title=User:Markit&action=edit&redlink=1 "User:Markit (page does not exist)")
21:24, 26 October 2011 (UTC)

-   Download
    [devmon](http://igurublog.wordpress.com/downloads/script-devmon/).
-   Start a daemon with
    -   devmon --no-gui --exec-on-drive "cp -r
        /directory/to/copy/each/time %d;devmon --unmount-recent;echo
        Copy complete, safe to remove | wall"

[Tomato](http://eLinux.org/User:Tomato "User:Tomato") 23:38, 26 October 2011 (UTC)

{

-   "rsync -ac /directory/to/copy/each/time %d" might be better suited
    to transfer the files to the card.
-   "sync" to flush the buffers afterwards couldn't hurt either

}

-   Each time a usb key is added, the daemon will automatically copy the
    folder, unmount the disk and send a message to all connected
    local/ssh terminals.

udev could also be used.

## RISC OS

-   Discussion and task list being developed on the [ROOL
    site](http://www.riscosopen.org/forum/forums/5/topics/783).

## R-Pi System/Data Management

--[Meltwater](http://eLinux.org/User:Meltwater "User:Meltwater") 20th Dec 2011

Details here: [Pi in the Sky - Cloud
management?](http://www.raspberrypi.org/forum?mingleforumaction=viewtopic&t=1204)
Basic concept: Enable ways to easily switch and share system images for
the R-Pi and manage user data, allowing joint development and easy
management of set-ups.

-   Fast/Easy backup of system/data to external storage or network
    (local or cloud).
-   Management/Repository of base images.
-   Boot from network

This would enable a number of potential scenarios:

-   Keep multiple R-Pi's synced across locations (office vs home or
    classroom vs home)
-   Manage a multiple users of R-Pi's (i.e. classroom setup, each user's
    data gets synced with network so each user can continue their own
    work on any R-Pi)
-   Easy switching of function by booting to multiple images (i.e. Media
    centre image, programming image, in-car image)
-   Remote management of R-Pi's (by updating the master image)

The project should be able to be divided into a number of smaller
projects which when put together may well be able to perform the
functions we want.

-   User Data sync/web mount
-   System Image backup/restore (to online/local network/local)
-   Bootloader with boot from online/local network/local image
-   Online image repository

Project Wiki Page - [R-Pi System/Data
Management](http://eLinux.org/R-Pi_System/Data_Management "R-Pi System/Data Management")


 **First problem** Defining how user applications are managed and
installed, and thus how the card is partitioned. Straw man proposal:

-   FAT GPU (and boot?) partition
-   EXT partition for rootfs and /usr and /var /etc ... root writable
-   EXT partition for /usr/local ... all user-installed applications go
    here (note: traditional Linux "rpm -i something.rpm" writing
    everywhere in the FS is not particularly great for manageability)
-   FAT partition for Windows-shareable user files -- perhaps /home is
    mounted here?
-   Do we need swap?
-   Default for bigger cards should probably be something like putting
    65% of free space on /usr/local (EXT) and 35% on /home (FAT)

## Multi Code

**The idea**: One R\_pi will be connected to another and both can work
on the same code.py. So that way say a teacher wanted to help a student
with code without taking over. They can just plug there pi in to the
students and go through checking for mistakes ect.

**The Conection**: Conection will probably be via Ethernet using an *ad
hoc* Network.

**Whats needed?**: The program needs to open .py files and edit them.
Next it needs to make a shered file that is updated every time a
character changes. A different program (or same does not matter) should
then connect to this file and update it in the same way. Every 10
seconds both pi's reload the shared file, thus have the same code. If
the changes contradict each other then the host pi will override the
connected pi.

Why not just use VNC?

How much of this "collaborative editing" is already built into Sugar?
[[1]](http://wiki.laptop.org/go/Activity_sharing)

For something a little less intrusive/immediate, a DVCS like mercurial
or git keeps people from stepping on each other's toes.

**Further evolutions**: once/if the initial goals are acheved then
further developments to the project would include making the systom
compleatly live so there in no 10 second delay to each update. And make
it posibal to connect the pi's via the Internet.

**The initial task**: The first stage In this project is to make a file
browser that can open and edit .py files.

**More info**: for more information about the project follow @Lipj01 on
twitter or email me at: Lippojac@gmail.com



# References



-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://www.elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

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
[Projects](http://eLinux.org/RPi_Projects "RPi Projects") - **Tasks** -
[DataSheets](http://eLinux.org/RPi_DatasheetCategories "RPi DatasheetCategories") -
[Education](http://eLinux.org/RPi_Education "RPi Education") -
[Communities](http://eLinux.org/RPi_Community "RPi Community")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [ARM Development
    Boards](http://eLinux.org/Category:ARM_Development_Boards "Category:ARM Development Boards")
-   [Broadcom](http://eLinux.org/index.php?title=Category:Broadcom&action=edit&redlink=1 "Category:Broadcom (page does not exist)")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")
-   [Education](http://eLinux.org/Category:Education "Category:Education")

