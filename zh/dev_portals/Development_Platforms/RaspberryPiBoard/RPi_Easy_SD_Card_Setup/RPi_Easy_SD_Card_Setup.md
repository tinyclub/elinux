> From: [eLinux.org](http://eLinux.org/RPi_Easy_SD_Card_Setup "http://eLinux.org/RPi_Easy_SD_Card_Setup")


# RPi Easy SD Card Setup





<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#SD_card_setup">1 SD card setup</a></li>
<li><a href="#Safe_.2F_Easy_way">2 Safe / Easy way</a></li>
<li><a href="#Create_your_own">3 Create your own</a>
<ul>
<li><a href="#Using_NOOBS">3.1 Using NOOBS</a></li>
<li><a href="#Flashing_the_SD_Card_using_Windows">3.2 Flashing the SD Card using Windows</a>
<ul>
<li><a href="#Using_the_Win32DiskImager_program">3.2.1 Using the Win32DiskImager program</a></li>
<li><a href="#Using_flashnul_.28if_Win32DiskImager_isn.27t_successful.29">3.2.2 Using flashnul (if Win32DiskImager isn't successful)</a></li>
<li><a href="#Using_the_Fedora_Remix_Installer">3.2.3 Using the Fedora Remix Installer</a></li>
</ul></li>
<li><a href="#Flashing_the_SD_card_using_Mac_OS_X">3.3 Flashing the SD card using Mac OS X</a>
<ul>
<li><a href="#Run_an_App_.28Only_with_graphical_interface.29">3.3.1 Run an App (Only with graphical interface)</a></li>
<li><a href="#Using_system_tools_.28mostly_graphical_interface.29">3.3.2 Using system tools (mostly graphical interface)</a></li>
<li><a href="#Using_command_line_tools_.281.29">3.3.3 Using command line tools (1)</a></li>
<li><a href="#Using_command_line_tools_.282.29">3.3.4 Using command line tools (2)</a></li>
</ul></li>
<li><a href="#Flashing_the_SD_Card_using_Linux_.28including_on_a_Raspberry_Pi.21.29">3.4 Flashing the SD Card using Linux (including on a Raspberry Pi!)</a>
<ul>
<li><a href="#Using_ImageWriter_.28graphical_interface.29">3.4.1 Using ImageWriter (graphical interface)</a></li>
<li><a href="#Using_the_Linux_command_line">3.4.2 Using the Linux command line</a></li>
</ul></li>
<li><a href="#Using_any_system_and_BerryBoot">3.5 Using any system and BerryBoot</a></li>
</ul></li>
<li><a href="#Other_points">4 Other points</a></li>
<li><a href="#Manually_resizing_the_SD_card_partitions_.28Optional.29">5 Manually resizing the SD card partitions (Optional)</a></li>
<li><a href="#Adding_a_data_partition_.28Optional.29">6 Adding a data partition (Optional)</a></li>
<li><a href="#References">7 References</a>
<ul>
<li><a href="#SD.28DC.7CDX.5D_Card_Class_6_.26_10_Hints">7.1 SD(DC|DX] Card Class 6 &amp; 10 Hints</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

![RaspPi.png](http://eLinux.org/images/thumb/c/ca/RaspPi.png/25px-RaspPi.png) [Back to
the Hub](http://eLinux.org/RPi_Hub "RPi Hub")



**Getting Started:**

*[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - for advice on
buying the Raspberry Pi.*

***SD Card Setup** - for information on how to prepare the SD Card used
to boot your Raspberry Pi.*

*[Basic Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") -
for help with buying / selecting other hardware and setting it up.*

*[Beginners Guide](http://eLinux.org/RPi_Beginners "RPi Beginners") - you are up and
running, now what can you do?*

*[Advanced Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") - for more
extensive information on setting up.*

*[Trouble Shooting](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting") - some
things to check if things don't work as expected.*

# SD card setup

The Raspberry Pi will not start without a properly formatted SD Card,
containing the bootloader and a suitable operating system. Many problems
with booting the Raspberry Pi are a result of an improperly formatted or
corrupted card. Make sure that you insert the card before powering on
the Raspberry Pi, and that you shutdown the Raspberry Pi before
unplugging the card. If you do have problems booting the Raspberry Pi,
see the [trouble shooting
page](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting") first.

You will also need to choose a distribution. Available distributions
[are shown here](http://eLinux.org/RPi_Distributions "RPi Distributions"); you will need
the Raspberry Pi bootloader to launch your distribution, so you need one
for the Raspberry Pi and cannot download a PC based distribution and use
that. Note that you can have several SD Cards with a separate
distribution on each, then power off, swap cards and restart the
Raspberry Pi to use that card.

Some Raspberry Pi kits will come with a ready-to-go card with the
distribution pre-installed, or these can be bought separately. There is
more on this below.

If you don't have a pre-installed card you will need to prepare your
own. Make sure you get a reasonable quality card rather than a cheap
one. Check the [SD Card list](http://eLinux.org/RPi_SD_cards "RPi SD cards") if you are
not sure. Warning! When you write the Raspberry Pi image to your SD card
you will lose all data that was on the card. Official images are
available from
[http://www.raspberrypi.org/downloads](http://www.raspberrypi.org/downloads).

**Note: It is highly recommended that you start with the latest official
NOOBS installer: check the Raspberry Pi official website
([http://www.raspberrypi.org/downloads](http://www.raspberrypi.org/downloads))
for the current version. This makes the process of installing an
operating system as easy as copying a few files in a zip archive to your
SD card. This contains the reccomended Raspbian distribution, as well as
various other distributions, all of which are available as individual
images from the downloads page, if you prefer not to use NOOBS.**

# Safe / Easy way

Buying a preloaded SD card from a reputable supplier means that you can
just plug it in and power up your Raspberry Pi; it should then just
work. If you don't buy one of these, you will have to create your own
using the instructions below

You may need to perform an upgrade of the card once you have got the
Raspberry Pi working, as a distribution (usually) is continuously
updated and the card may not contain those updates

Compare these for prices, delivery, distribution and card size/class:

-   Official [Raspberry Pi Swag Store](http://swag.raspberrypi.org/)

-   [The Pi Hut](http://thepihut.com/) offers a wide range of SD cards
    preloaded with either:
    -   [NOOBS](http://thepihut.com/products/noobs-8gb-sd-card-official).
    -   [Raspbian](http://thepihut.com/products/raspbian-preinstalled-sd-card).
    -   [OpenELEC
        XBMC](http://thepihut.com/products/xbmc-preinstalled-sd-card).
    -   [PiPlay (formerly
        PiMame)](http://thepihut.com/products/pimame-preinstalled-sd-card).

-   [ModMyPi](http://modmypi.com/) Sell high quality Samsung SD cards
    pre-loaded with the latest Raspian Wheezy OS.
    -   [8 GB Raspian Wheezy
        Pre-Loaded](https://www.modmypi.com/sd-cards-and-adaptors/samsung-8gb-sd-card-pre-loaded-with-debian-linux-os)
    -   [16 GB Raspian Wheezy
        Pre-Loaded](https://www.modmypi.com/sd-cards-and-adaptors/samsung-16gb-sd-card-pre-loaded-with-debian-linux-os)
    -   [32 GB Raspian Wheezy
        Pre-Loaded](https://www.modmypi.com/sd-cards-and-adaptors/samsung-32gb-sd-card-pre-loaded-with-debian-linux-os)

**[Public Service Announcement on SD
Cards](http://www.raspberrypi.org/archives/3534)**. There have been
reports of problems with SD cards purchased from ebay and Amazon. Make
sure the SD card you're purchasing is up to date with the latest version
of your chosen operating System to avoid any issues.

# Create your own

To create your own SD Card for the Raspberry Pi you will need access to
another machine, or a friend with one. You will need to be careful, as
you could corrupt the disk on that machine if you do things wrong
(although it is not hard to do it right, and NOOBS makes it impossible
to go wrong). If you are lucky, you might find a local Raspberry Pi or
Linux group who will offer to load your card for you.

You will also need to choose and download a distribution (mentioned
above), or use NOOBS, which has all the . Check the [Distributions
list](http://eLinux.org/RPi_Distributions "RPi Distributions") to make sure that you are
getting a distribution that will work with the Raspberry Pi. **Note that
the distribution must be written to the card using the methods below;
the standard file copy method will not work**

## Using NOOBS

Recently, the Raspberry Pi Foundation have released a really easy way to
set up your SD Card. It's called the New Out Of Box Software (or NOOBS
for short) and provides a really easy way to install Raspberry Pi
distributions. Be warned, however, that it is a 1 GB download - if you
have a limit on what you are allowed to download, follow the
instructions below, as the other images are around 500 MB.

1.  Download NOOBS from the [raspberrypi.org downloads
    page](http://www.raspberrypi.org/downloads)
2.  Insert a (4 GB+) SD Card into your computer
    -   If you want to save space on the SD Card, you can delete some of
        the images inside the os folder in the NOOBS zip file that you
        don't want to use.

3.  Format the disk
    -   **Windows**

    1.  Download and install the SD Association's Formatting tool from
        [https://www.sdcard.org/downloads/formatter\_4/eula\_windows/](https://www.sdcard.org/downloads/formatter_4/eula_windows/)
    2.  Open the Application you have just installed
    3.  Set "FORMAT SIZE ADJUSTMENT" to ON in the Options menu.
    4.  Make sure you have selected the Drive your SD Card is inserted
        in
    5.  Click "Format"

    -   **Mac**

    1.  Download and install the SD Association's Formatting tools from
        [https://www.sdcard.org/downloads/formatter\_4/eula\_mac/](https://www.sdcard.org/downloads/formatter_4/eula_mac/)
    2.  Select "Overwrite format"
    3.  Make sure you have selected your SD Card, and not something else
    4.  Click "Format"

    -   **Linux**

    1.  Use gparted (or the command-line version parted if you prefer),
        if you don't have it, install it as you usually would.
    2.  Format the entire disk as FAT32 (FAT16 will not work! Make sure
        you select the correct disk!)

4.  Extract the file you downloaded in Step 1
5.  Copy the files you just extracted to your SD Card (see below on
    flashing your SD card)

Not all monitors work with NOOBS straight away. If your monitor is one
of those that doesn't work, press the Number buttons 1-4 until you see
what you want.

1.  Default HDMI Mode
2.  HDMI Safe Mode - Use this if Default (1) doesn't work and you cannot
    see anything
3.  Composite PAL Mode - Use this or 4. if you are using the yellow and
    black outputs on the opposite side to the HDMI output
4.  Composite NTSC Mode

## Flashing the SD Card using Windows

### Using the Win32DiskImager program

1.  Download the distribution from the [raspberrypi.org downloads
    page](http://www.raspberrypi.org/downloads) or from a mirror or
    torrent. Make sure the distribution is for the Raspberry Pi, as
    others will not work. Usually these are zipped (compressed) files
    ending in .zip or .gz (something like "distribution-name.zip").
2.  Extract the image file from the downloaded .zip file, so you now
    have "distribution-name.img".
3.  Insert the SD card into your SD card reader and check what drive
    letter it was assigned. You can easily see the drive letter (for
    example G:) by looking in the left column of Windows Explorer. You
    can use the SD Card slot (if you have one) or a cheap Adapter in a
    USB slot.
4.  Download the
    [Win32DiskImager](http://sourceforge.net/projects/win32diskimager)
    utility (it is also a zip file). You can run this from a USB drive.
    [![Win32DiskImager
    screen](http://eLinux.org/images/thumb/3/38/Win32DiskImager.png/300px-Win32DiskImager.png)](http://eLinux.org/File:Win32DiskImager.png "Win32DiskImager screen")
5.  Extract the executable from the zip file and run the Win32DiskImager
    utility; you may need to run the utility as Administrator!
    Right-click on the file, and select 'Run as Administrator'
6.  Select the image file you extracted above.
7.  Select the drive letter of the SD card in the device box. **Be
    careful to select the correct drive; if you get the wrong one you
    can destroy your data on the computer's hard disk!** If you are
    using an SD Card slot in your computer (if you have one) and can't
    see the drive in the Win32DiskImager window, try using a cheap
    Adapter in a USB slot.
8.  Click Write and wait for the write to complete.
9.  Exit the imager and eject the SD card.
10. You are now ready to plug the card into your Raspberry Pi. See
    [RPi\_Hardware\_Basic\_Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup")
    for the other things you need.

*In Windows, the SD card will appear only to have a fairly small size
once written - about 55 to 75 MB. This is because most of the card has a
partition that is formatted for the Linux operating system that the
Raspberry Pi uses which is not visible in Windows. If you don't see this
small directory with files such as kernel.img then the copy may not have
worked correctly.*

### Using flashnul (if Win32DiskImager isn't successful)

You may not be able to choose the device in Win32DiskImager on some
notebooks so this is a different way to achieve the same thing on a
Windows machine.

-   Download the distribution from the [| raspberrypi.org downloads
    page](http://www.raspberrypi.org/downloads) or from a mirror or
    torrent. Make sure the distribution is for the Raspberry Pi, as
    others will not work. Usually these are zipped (compressed) files
    ending in .zip or .gz (something like "distribution-name.zip").
-   Extract the image file from the downloaded .zip file, so you now
    have "distribution-name.img".
-   Insert the SD card into your SD card reader and check what drive
    letter it was assigned. You can easily see the drive letter (for
    example G:) by looking in the left column of Windows Explorer. You
    can use an SD Card slot in your computer (if you have one) or a
    cheap Adapter in a USB slot.
-   Download the flashnul software from
    [http://shounen.ru/soft/flashnul/index.html](http://shounen.ru/soft/flashnul/index.html) ;
    here is the English [Translated
    version](http://translate.google.com/translate?hl=en&sl=ru&tl=en&u=http%3A%2F%2Fshounen.ru%2Fsoft%2Fflashnul%2Findex.html)
    with a link to instructions (also translated)
-   Download the latest version. At the time of writing it was
    flashnul-1rc1.
-   Extract the application from the archive.
-   Click Start button \> All Programs \> Accessories \> Command Prompt,
    right click on it and Run as Administrator.
-   Run flashnul with argument "-p":

<!-- -->

    C:\flashnul\flashnul.exe -p

-   Flashnul will tell you something like this (it should be different,
    as it depends on the drives on your machine):

<!-- -->

    Available physical drives:
    0       size = 250059350016 (232 Gb)
    1       size = 1990197248 (1898 Mb)

    Available logical disks:
    C:\
    D:\
    E:\
    F:\

    Press ENTER to exit.

-   Use the Load option of flashnul to put the image file on the SD
    Card. **Make sure that you use the correct drive letter for the SD
    Card as that drive will be overwritten!**

<!-- -->

    C:\flashnul\flashnul.exe E: -L C:\temp\distribution-name.img

Where C:\\flashnul\\flashnul.exe is the location of the flashnul
program; E: is the drive you want to overwrite, and
C:\\temp\\distribution-name.img is the location of the .img file.

-   Flashnul will give you a device summary and a caution message. Check
    the information to make sure you have selected the correct device,
    then type yes and press enter.
-   If you get an access denied error, make sure to close all explorer
    windows or folders open for the device, then try re-plugging the SD
    card.

### Using the Fedora Remix Installer

Download the installer program from [Fedora ARM
Installer](http://zenit.senecac.on.ca/wiki/index.php/Raspberry_Pi_Fedora_Remix_Installation#SD_Card_Installation_Using_the_Installer).
This will download and install the Raspberry Pi Fedora Remix images, but
it will also install other images if they are already downloaded and in
uncompressed or .gz format. This also works with Linux.

## Flashing the SD card using Mac OS X

**Note:** In OS X each disk may have two path references in /dev:

-   /dev/disk\# is a buffered device, which means any data being sent
    undergoes extra processing.
-   /dev/**r**disk\# is a *raw* path, which is much faster, and
    perfectly OK when using the dd program.

On a Class 4 SD card the difference was around 20 times faster using the
rdisk path.

### Run an App (Only with graphical interface)

**Pi Filler** [Pi Filler](http://ivanx.com/raspberrypi) is a simple tool
for copying a Raspberry Pi operating system image file to an SD card, or
restoring an SD card backup created by [Pi
Copier](http://ivanx.com/raspberrypi). Version 1.3 is about 5x faster
than previous versions and can write a full card in 5-7 minutes. Pi
Filler automatically identfies your SD card (and asks for confirmation
to prevent any chance of the wrong disk being written to), and shows
estimated time remaining during the copy. After it's done, if your
Raspberry Pi is not connected to a display, you can use [Pi
Finder](http://ivanx.com/raspberrypi) to locate it on your network and
log in from Terminal. These utilities are written in AppleScript and
Bash, are compatible with OS X 10.6 Snow Leopard through 10.10 Yosemite,
and include source code.


 **RPi-sd card builder** The [RPi-sd card
builder](http://alltheware.wordpress.com/2012/12/11/easiest-way-sd-card-setup/)
utility is an application which will walk you through the process of
installing to SD card. Note: This is a closed source application which
requires your root password.


 **ApplePi-Baker**

[![ApplePi-Baker
Window](http://eLinux.org/images/thumb/7/75/ApplePi-Baker.png/300px-ApplePi-Baker.png)](http://eLinux.org/File:ApplePi-Baker.png "ApplePi-Baker Window")

[ApplePi-Baker](http://www.tweaking4all.com/hardware/raspberry-pi/macosx-apple-pi-baker/)
is a free utility that allows you to create a NOOBS SD, write an IMG
file to SD card, or backup an SD card to IMG, with only a few simple
clicks. This is also a closed source application and also requires your
root password to write to SD cards. The application is written in
Lazarus Pascal and supports Retina.


 **PiWriter**

[PiWriter](http://sourceforge.net/projects/piwriter/) is a simple wizard
made using shell scripts, PlatyPus and CocoaDialog. To prevent users
from making mistakes the wizard auto-detect's the SD card you plan to
use and prevents you from selecting your system disk. Also there is no
need for a root password so even less damage can be done. The nextgen
PiWriter2 introduces a new 'drag and drop' approach and also includes a
backup feature. PiWriter 1.0.4 does not work on Mac OS X Mavericks.

-   [Get PiWriter 1.0.4](http://sourceforge.net/projects/piwriter/)
-   [Get
    PiWriter2](http://sourceforge.net/projects/piwriter/files/PiWriter-2.x)

-   [Watch the 1.x quick review video](http://vimeo.com/62083666)
-   [Watch full OS X HOWTO video using PiWriter
    1.x](http://www.youtube.com/watch?v=PIvNxprbDhQ) By: [Bruce
    Fulton](http://www.youtube.com/user/brucefulton?feature=watch)

### Using system tools (mostly graphical interface)

1.  Download the image from a mirror or torrent
    -   [http://www.raspberrypi.org/downloads](http://www.raspberrypi.org/downloads)

2.  Extract the image by double clicking on the download file
3.  Connect the SD card reader with the SD card inside; note: must be
    formatted in FAT32!
4.  From the *Apple () menu*, choose *About This Mac*, then click on
    *More info...*; if you are using Mac OS X 10.8.x Mountain Lion then
    click on *System report*.
5.  Click on *USB* (or *Card Reader* if using an in-built SD card
    reader) then search for your SD card in the upper right section of
    the window; click it, then search for *BSD name* in the lower right
    section: must be something like **disk***n* where *n* is a number
    (for example, disk4). Note this number
6.  Unmount the partition so that you will be allowed to overwrite the
    disk by opening Disk Utility and unmounting it (do not eject it, or
    you have to reconnect it). Note: On Mac OS X 10.8.x Mountain Lion,
    "Verify Disk" (before unmounting) will display the BSD name as
    "*/dev/disk1s1"* (or similar), allowing you to skip the previous two
    steps.
7.  From the Terminal run:
    -   **sudo dd if=*path\_of\_your\_image.img* of=/dev/disk*n* bs=1M**
    -   Remember to replace *n* with the number that you noted before!

8.  Wait a LONG time! *(or see the note above about using
    /dev/rdisk\#...)* To see the current status, send `SIGINFO` signal
    by pressing `Ctrl+T`.
9.  You're done! Insert it in the Raspberry Pi, and have fun

### Using command line tools (1)

-   If you are comfortable with the command line, you can image a card
    without any additional software. Run:
    -   diskutil list
        -   identify the disk (not partition) of your SD card. e.g.
            disk4 (not disk4s1)
    -   diskutil unmountDisk /dev/\<disk\# from diskutil\>
        -   e.g. diskutil unmountDisk /dev/disk4
    -   sudo dd bs=1m if=\<your image file\>.img of=/dev/\<disk\# from
        diskutil\>
        -   e.g. sudo dd bs=1m if=2014-09-09-wheezy-raspbian.img
            of=/dev/disk4
        -   (This will take a few minutes)

### Using command line tools (2)

**Note**: Some users have [reported
issues](http://www.raspberrypi.org/phpBB3/search.php?keywords=extra+files&t=8226&sf=msgonly)
with using Mac OS X to create SD cards.

1.  These commands and actions need to be performed from an account that
    has administrator privileges.
2.  Download the image from a mirror or torrent
    -   [http://www.raspberrypi.org/downloads](http://www.raspberrypi.org/downloads)

3.  Verify if the the hash key is the same (optional), in the terminal
    run:
    -   **shasum \~/Downloads/2014-09-09-wheezy-raspbian.zip**

4.  Extract the image:
    -   **unzip \~/Downloads/2014-09-09-wheezy-raspbian.zip**
    -   *(or: just double click the zip, it will extract automatically)*

5.  From the terminal run **df -h**
6.  Connect the SD card reader with the SD card inside
7.  Run **df -h** again and look for the new device that wasn't listed
    last time. Record the device name of the filesystem's partition, for
    example, **/dev/disk3s1**
8.  Unmount the partition so that you will be allowed to overwrite the
    disk:
    -   **sudo diskutil unmount /dev/disk3s1**
    -   *(or: open Disk Utility and unmount the partition of the SD card
        (do not eject it, or you have to reconnect it)*

9.  Using the device name of the partition work out the raw device name
    for the entire disk, by omitting the final "s1" and replacing "disk"
    with "rdisk" (**this is very important:** you **will** lose all data
    on the hard drive on your computer if you get the wrong device
    name). Make sure the device name is the name of the whole SD card as
    described above, not just a partition of it (for example, rdisk3,
    not rdisk3s1. Similarly you might have another SD drive name/number
    like rdisk2 or rdisk4, etc. -- recheck by using the **df -h**
    command both before & after you insert your SD card reader into your
    Mac if you have any doubts!):
    -   For example, **/dev/disk3s1** =\> **/dev/rdisk3**

10. In the terminal write the image to the card with this command, using
    the raw disk device name from above (read **carefully** the above
    step, to be sure you use the correct rdisk\# here!):
    -   **sudo dd bs=1M
        if=\~/Downloads/2014-09-09-wheezy-raspbian/2014-09-09-wheezy-raspbian.img
        of=/dev/rdisk3**
    -   if the above command report an error (dd: bs: illegal numeric
        value), please change bs=1M to bs=1m
    -   (note that dd will not feedback any information until there is
        an error or it is finished, information will show and disk will
        re-mount when complete. However if you are curious as to the
        progresss - ctrl-T (SIGINFO, the status argument of your tty)
        will display some en-route statistics).

11. After the dd command finishes, eject the card:
    -   **sudo diskutil eject /dev/rdisk3**
    -   *(or: open Disk Utility and eject the SD card)*

12. Insert it in the Raspberry Pi, and have fun

-   (**Mac**) The [RasPiWrite](https://github.com/exaviorn/RasPiWrite)
    utility is a Python script which will walk you through the process
    of installing to SD card, it works with any Raspberry Pi compatible
    disk image, and can download one of the currently available distros
    if you don't have one. [As of April 2015, several fatal but
    easy-to-fix, bugs prevent RasPiWrite from running at all and have
    been present for over a year, and thus RasPiWrite seems abandoned,
    at least for now. You can use it if you are willing to fix Python
    syntax errors. ]

## Flashing the SD Card using Linux (including on a Raspberry Pi!)

### Using ImageWriter (graphical interface)

If you are using Ubuntu and hesitate to use the terminal, you can use
the ImageWriter tool (nice graphical user interface) to write the .img
file to the SD card.

1.  Download the zip file containing the image from a mirror or torrent
    -   [http://www.raspberrypi.org/downloads](http://www.raspberrypi.org/downloads)

2.  Right click the zip file and select "Extract here"
    -   **ATTENTION**: As of this writing (15 June 2012), there is a bug
        in the ImageWriter program that causes it to fail if the
        filename of the image file or its path (i.e. all the names of
        any parent folders that you extract the image file into) contain
        any space characters. Before going any further, ensure that
        neither the file name of the image you're using or the path
        contain any spaces (or other odd characters, for that matter). A
        bug has been opened for this issue:
        [https://bugs.launchpad.net/usb-imagewriter/+bug/1013834](https://bugs.launchpad.net/usb-imagewriter/+bug/1013834)
        Once the issue is fixed, edit this page to advise people to use
        an updated/patched version of ImageWriter.

3.  Insert the SD card into your computer or connect the SD card reader
    with the SD card inside
4.  Install the ImageWriter tool from the Ubuntu Software Center
5.  Launch the ImageWriter tool (it needs your administrative password)
6.  Select the image file (example 2012-10-28-wheezy-raspbian.img) to be
    written to the SD card (note: because you started ImageWriter as
    administrator the starting point when selecting the image file is
    the administrator's home folder so you need to change to your own
    home folder to select the image file)
7.  Select the target device to write the image to (your device will be
    something like "/dev/mmcblk0" or "/dev/sdc")
8.  Click the "Write to device" button
9.  Wait for the process to finish and then insert the SD card in the
    Raspberry Pi

### Using the Linux command line

Please note that the use of the "dd" tool can overwrite any partition of
your machine. If you specify the wrong device in the instructions below
you could delete your primary Linux partition. Please be careful.

1.  Download the zip file containing the image from a mirror or torrent
    -   [http://www.raspberrypi.org/downloads](http://www.raspberrypi.org/downloads)

2.  Verify if the the hash key of the zip file is the same as shown on
    the downloads page (optional). Assuming that you put the zip file in
    your home directory (\~/), in the terminal run:
    -   **sha1sum \~/2012-12-16-wheezy-raspbian.zip**
    -   This will print out a long hex number which should match the
        "SHA-1" line for the SD image you have downloaded

3.  Extract the image, with
    -   **unzip \~/2012-12-16-wheezy-raspbian.zip**

4.  Run **df -h** to see what devices are currently mounted
5.  If your computer has a slot for SD cards, insert the card. If not,
    insert the card into an SD card reader, then connect the reader to
    your computer.
6.  Run **df -h** again. The device that wasn't there last time is your
    SD card. The left column gives the device name of your SD card. It
    will be listed as something like "/dev/mmcblk0p1" or "/dev/sdd1".
    The last part ("p1" or "1" respectively) is the partition number,
    but you want to write to the whole SD card, not just one partition,
    so you need to remove that part from the name (getting for example
    "/dev/mmcblk0" or "/dev/sdd") as the device for the whole SD card.
    Note that the SD card can show up more than once in the output of
    df: in fact it will if you have previously written a Raspberry Pi
    image to this SD card, because the Raspberry Pi SD images have more
    than one partition.
7.  Now that you've noted what the device name is, you need to unmount
    it so that files can't be read or written to the SD card while you
    are copying over the SD image. So run the command below, replacing
    "/dev/sdd1" with whatever your SD card's device name is (including
    the partition number)
    -   **umount /dev/sdd1**
    -   If your SD card shows up more than once in the output of df due
        to having multiple partitions on the SD card, you should unmount
        all of these partitions.

8.  In the terminal write the image to the card with this command,
    making sure you replace the input file **if=** argument with the
    path to your .img file, and the "/dev/sdd" in the output file
    **of=** argument with the right device name (**this is very
    important:** you **will** lose all data on the hard drive on your
    computer if you get the wrong device name). Make sure the device
    name is the name of the whole SD card as described above, not just a
    partition of it (for example, sdd, not sdds1 or sddp1, or mmcblk0
    not mmcblk0p1)
    -   **dd bs=4M if=\~/2012-12-16-wheezy-raspbian.img of=/dev/sdd**
        -   Please note that block size set to 4M will work most of the
            time, if not, please try 1M, although 1M will take
            considerably longer.
    -   Note that if you are not logged in as root you will need to
        prefix this with **sudo**
    -   The dd command does not give any information of its progress and
        so may appear to have frozen. It could take more than five
        minutes to finish writing to the card. If your card reader has
        an LED it may blink during the write process. To see the
        progress of the copy operation you can run **pkill -USR1 -n -x
        dd** in another terminal (prefixed with **sudo** if you are not
        logged in as root). The progress will be displayed (perhaps not
        immediately, due to buffering) in the original window, not the
        window with the **pkill** command.

9.  Instead of dd you can use dcfldd; it will give a progress report
    about how much has been written.
10. Another option to monitor progress is to use Pipe Viewer (pv). Pipe
    **dd** input part through **pv** to the output part of **dd**:
    -   dd bs=4M if=2014-09-09-wheezy-raspbian.img | pv | dd of=/dev/mmcblk0

    -   2,02GB 0:06:34 [10,4MB/s] [       <=>                              ]

11. You can check what's written to the SD card by dd-ing from the card
    back to your harddisk to another image, and then running diff (or
    md5sum) on those two images. There should be no difference.
12. As root run the command **sync** or if a normal user run **sudo
    sync** (this will ensure the write cache is flushed and that it is
    safe to unmount your SD card)
13. Remove SD card from card reader, insert it in the Raspberry Pi, and
    have fun

## Using any system and BerryBoot

If your Raspberry Pi is connected to the **Internet**, you can use the
[BerryBoot installer](http://www.berryterminal.com/doku.php/berryboot)
to let it download and install the operating system. This requires that
you first use a normal Windows/Mac/Linux computer to download a small
.zip file with the Berryboot system files and extract it to an empty SD
card. Then you put the SD card in your Raspberry Pi, and follow the
on-screen prompts to complete the installation. An additional advantage
is that Berryboot allows you to install more than one operating system
on a single SD card. Also, it is not necessary to install any additional
software on your normal Windows/Mac/Linux computer.

# Other points

To write your SD card you start by downloading the SD image (the data
you will write to the card). The best way to do this is using
[BitTorrent](http://en.wikipedia.org/wiki/BitTorrent_(protocol)). This
generally results in a faster download as it is a highly distributed
system (you will be downloading the data from users who have previously
downloaded it).

# Manually resizing the SD card partitions (Optional)

The SD card image is sized for a 2 GB card. So, if you are using an SD
card with a greater capacity, you may find that only 2 GB is available.
If this is the case, then to gain more free space, the partitions must
be resized. The Fedora Remix and the BerryBoot will automatically resize
the partitions on the mounted card during the first boot. The Debian ,
OpenSuSe and Rasbian images won't, so you'll have to do it manually. The
easiest way is to use the tool [RPi
raspi-config](http://eLinux.org/RPi_raspi-config "RPi raspi-config") selecting menu item
EXPAND-ROOTFS - Expand Root Partition to Fill SD Card. If you want to
resize the SD card whilst the SD card is not mounted in the Raspberry
Pi, look
[here](http://eLinux.org/RPi_Resize_Flash_Partitions "RPi Resize Flash Partitions") for
instructions.

# Adding a data partition (Optional)

If you would rather not resize the partition on another machine as
described above, either because you do not have another working Linux
machine or you wish to keep your data on another partition to your
operating system, you can instead create a new data partition and have
that mount automatically at boot.

-   First you need to become root and install parted (I did all of this
    from the boot command prompt, although if you feel safer in a GUI,
    you can do all of this in a terminal window):

<!-- -->

    sudo su -
    apt-get install parted

-   Then you need to run parted on your SD card, mine is /dev/mmcblk0,
    [ymmv](http://en.wiktionary.org/wiki/your_mileage_may_vary):

<!-- -->

    parted /dev/mmcblk0

-   Once running, set the display units to something usable and then
    print your partition table:

<!-- -->

    unit chs
    print

-   You should see something like this:

<!-- -->

    Model: SD SD08G (sd/mmc)
    Disk /dev/mmcblk0: 121279,3,31
    Sector size (logical/physical): 512B/512B
    BIOS cylinder,head,sector geometry: 121280,4,32.  Each cylinder is 65.5kB.
    Partition Table: msdos
    Number  Start      End         Type     File system     Flags
     1      16,0,0     1215,3,31   primary  fat32           lba
     2      1232,0,0   26671,3,31  primary  ext4
     3      26688,0,0  29743,3,31  primary  linux-swap(v1)

-   Now you need to create your data partition - you need to choose one
    more than the end of partition 3 with ,0,0 as your start and use the
    number from the line that starts with Disk as your end:

<!-- -->

    mkpart primary 29744,0,0 121279,3,31
    print

-   That should show your new partition:

<!-- -->

    Number  Start      End          Type      File system     Flags
     1      16,0,0     1215,3,31    primary   fat32           lba
     2      1232,0,0   26671,3,31   primary   ext4
     3      26688,0,0  29743,3,31   primary   linux-swap(v1)
     4      29744,0,0  121279,3,31  primary

-   Now quit and format the partition (again, ymmv with the specific
    device name, try ls /dev for some clues), and then label it:

<!-- -->

    quit
    mkfs.ext4 /dev/mmcblk0p4
    e2label /dev/mmcblk0p4 data

-   Now we need to make sure that the partition is mounted automatically
    when the system boots (maybe don't use vi if you never have before,
    try nano):

<!-- -->

    vi /etc/fstab

-   Enter a line exactly like this at the end of the file and save and
    quit your text editor:

<!-- -->

    /dev/mmcblk0p4  /data           ext4    defaults        1       2

-   Create the mount point:

<!-- -->

    mkdir /data

-   Now mount the partition:

<!-- -->

    mount /data
    cd /data
    ls

Your new partition has been created!

# References



## SD(DC|DX] Card Class 6 & 10 Hints

    [card usage Hints with OverClocking ]

-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

[Raspberry Pi](http://eLinux.org/R-Pi_Hub "R-Pi Hub")

**Startup**

[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - **SD Card Setup**
- [Basic Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") -
[Advanced Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") - [Beginners
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


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")

