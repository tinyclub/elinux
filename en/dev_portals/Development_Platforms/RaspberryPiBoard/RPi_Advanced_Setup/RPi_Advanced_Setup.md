> From: [eLinux.org](http://eLinux.org/RPi_Advanced_Setup "http://eLinux.org/RPi_Advanced_Setup")


# RPi Advanced Setup





<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Notes">1 Notes</a></li>
<li><a href="#Finding_hardware_and_setting_up">2 Finding hardware and setting up</a></li>
<li><a href="#Serial_connection">3 Serial connection</a></li>
<li><a href="#Advanced_SD_card_setup">4 Advanced SD card setup</a>
<ul>
<li><a href="#Formatting_the_SD_card_via_the_mkcard.txt_script">4.1 Formatting the SD card via the mkcard.txt script</a></li>
<li><a href="#Formatting_the_SD_card_via_fdisk_.22Expert_mode.22">4.2 Formatting the SD card via fdisk &quot;Expert mode&quot;</a></li>
<li><a href="#Setting_up_the_boot_partition">4.3 Setting up the boot partition</a>
<ul>
<li><a href="#Additional_files_supplied_by_the_foundation">4.3.1 Additional files supplied by the foundation</a></li>
</ul></li>
</ul></li>
<li><a href="#Finally_booting_GNU.2FLinux">5 Finally booting GNU/Linux</a>
<ul>
<li><a href="#important_steps">5.1 important steps</a></li>
<li><a href="#Setting_up_for_remote_access_.2F_headless_operation">5.2 Setting up for remote access / headless operation</a></li>
</ul></li>
<li><a href="#Software_development.2Fproving">6 Software development/proving</a></li>
<li><a href="#Sample_setup_scripts_to_run_after_a_fresh_Raspbian_install">7 Sample setup scripts to run after a fresh Raspbian install</a></li>
<li><a href="#Further_reading">8 Further reading</a></li>
<li><a href="#Thanks_to">9 Thanks to</a></li>
<li><a href="#References">10 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

![RaspPi.png](http://eLinux.org/images/thumb/c/ca/RaspPi.png/25px-RaspPi.png) [Back to
the Hub](http://eLinux.org/RPi_Hub "RPi Hub")



**Getting Started:**

*[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - for advice on
buying the Raspberry Pi.*

*[SD Card Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") - for
information on how to prepare the SD Card used to boot your Raspberry
Pi.*

*[Basic Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") -
for help with buying / selecting other hardware and setting it up.*

*[Beginners Guide](http://eLinux.org/RPi_Beginners "RPi Beginners") - you are up and
running, now what can you do?*

***Advanced Setup** - for more extensive information on setting up.*

*[Trouble Shooting](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting") - some
things to check if things don't work as expected.*



# Notes

**WARNING: This page is not suitable for the average user. Information
in this page is for experienced hackers only.**

This page is a community work in progress in preparation for the first
users. If something doesn't work or isn't covered in these guides,
please feel free to ask on the
[Forum](http://www.raspberrypi.org/?page_id=43). But *before* you ask
there, make sure you read the
**[FAQs](http://www.raspberrypi.org/?page_id=8)**.

This page is based on
[BeagleBoardBeginners](http://eLinux.org/BeagleBoardBeginners "BeagleBoardBeginners") so
the serial port info is applicable only under explained circumstances.
Also, many Raspberry Pi users will buy pre-programmed SD cards and can
skip to reading [RPi Hardware Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup"). We expect
that once Raspberry Pi boards become generally available helpful
volunteers will update this page to match Raspberry Pi completely or
point to better information elsewhere.

**This page in a major work in progress!**

# Finding hardware and setting up

*Main article: see [RPi Hardware Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup")*

You'll need to [copy an
image](http://eLinux.org/RPi_Beginners#SD_card_setup "RPi Beginners") to a [suitable SD
card](http://eLinux.org/RPi_VerifiedPeripherals#SD_cards "RPi VerifiedPeripherals") (or
[make your own
image](http://eLinux.org/RPi_Beginners#Advanced_SD_card_setup "RPi Beginners")). You'll
also need a USB keyboard, TV/Monitor (with HDMI/DVI/Composite/SCART
input), and power supply (USB charger or a USB port from a powered USB
Hub or another computer).

You'll likely also want a USB mouse, a case, and a USB Hub (a necessity
for Model A). A powered USB Hub will reduce the demand on the RPi. To
connect to the Internet, you'll need either an Ethernet/LAN cable (Model
B) or a USB WiFi adaptor (either model). See [RPi
VerifiedPeripherals](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals")
for more information on supported peripherals.

All this basic verified hardware is available from both [Pi Hut's
Raspberry Pi Store](http://thepihut.com/) and [ModMyPi's Raspberry Pi
Shop](http://modmypi.com)

When setting up, it is advisable to connect the power after everything
else is ready. *See
[RPi\_Hardware\_Basic\_Setup\#Connecting\_Together](http://eLinux.org/RPi_Hardware_Basic_Setup#Connecting_Together "RPi Hardware Basic Setup").*

# Serial connection

*For help setting up a serial connection with the Raspberry Pi, see
[RPi\_Serial\_Connection](http://eLinux.org/RPi_Serial_Connection "RPi Serial Connection").*

# Advanced SD card setup

Now we want to use an SD card to install some GNU/Linux distro in it and
get more space for our stuff. You can use either an SD or SDHC card. In
the latter case of course take care that your PC card reader also
supports SDHC. Be aware that you are not dealing with an x86 processor,
but instead a completely different architecture called ARM, so don't
forget to install the ARM port for the distro you are planning to use.

Our first step will be the formatting of the SD card.

## Formatting the SD card via the mkcard.txt script

1.  Download **mkcard.txt** from
    [http://downloads.angstrom-distribution.org/demo/beaglebone/mkcard.txt](http://downloads.angstrom-distribution.org/demo/beaglebone/mkcard.txt)
2.  `$ chmod +x mkcard.txt`
3.  `$ ./mkcard.txt /dev/sd`*X*, Where *X* is the letter of the card.
    You can find this by inserting your card and then running
    ` dmesg | tail`. You should see the messages about the device being
    mounted in the log. Mine mounts as **sdc**.

Once run, your card should be formatted.

## Formatting the SD card via fdisk "Expert mode"

First, lets clear the partition table:

    ================================================================================
    $ sudo fdisk /dev/sdb

    Command (m for help): o
    Building a new DOS disklabel. Changes will remain in memory only,
    until you decide to write them. After that, of course, the previous
    content won't be recoverable.

    Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)
    ================================================================================

Print card info:

    ================================================================================
    Command (m for help): p

    Disk /dev/sdb: 128 MB, 128450560 bytes
    ....
    ================================================================================

Note card size in bytes. Needed later below.

Then go into "Expert mode":

    ================================================================================
    Command (m for help): x
    ================================================================================

Now we want to set the geometry to 255 heads, 63 sectors and calculate
the number of cylinders required for the particular SD/MMC card:

    ================================================================================
    Expert command (m for help): h
    Number of heads (1-256, default 4): 255

    Expert command (m for help): s
    Number of sectors (1-63, default 62): 63
    Warning: setting sector offset for DOS compatiblity
    ================================================================================

NOTE: Be especially careful in the next step. First calculate the number
of cylinders as follows:

-   B = Card size in bytes (you got it before, in the second step when
    you printed the info out)
-   C = Number of cylinders

<!-- -->

    C=B/255/63/512

When you get the number, you round it DOWN. Thus, if you got 108.8
you'll be using 108 cylinders.

    ================================================================================
    Expert command (m for help): c
    Number of cylinders (1-1048576, default 1011): 15
    ================================================================================

In this case 128MB card is used (reported as 128450560 bytes by fdisk
above), thus 128450560 / 255 / 63 / 512 = 15.6 rounded down to 15
cylinders. Numbers there are 255 heads, 63 sectors, 512 bytes per
sector.

So far so good, now we want to create two partitions. One for the boot
image, one for our distro.

Create the FAT32 partition for booting and transferring files from
Windows. Mark it as bootable.

    ================================================================================
    Expert command (m for help): r
    Command (m for help): n
    Command action
      e   extended
      p   primary partition (1-4)
    p
    Partition number (1-4): 1
    First cylinder (1-245, default 1): (press Enter)
    Using default value 1
    Last cylinder or +size or +sizeM or +sizeK (1-245, default 245): +50

    Command (m for help): t
    Selected partition 1
    Hex code (type L to list codes): c
    Changed system type of partition 1 to c (W95 FAT32 (LBA))

    Command (m for help): a
    Partition number (1-4): 1
    ================================================================================

Create the Linux partition for the root file system.

    ================================================================================
    Command (m for help): n
    Command action
      e   extended
      p   primary partition (1-4)
    p
    Partition number (1-4): 2
    First cylinder (52-245, default 52): (press Enter)
    Using default value 52
    Last cylinder or +size or +sizeM or +sizeK (52-245, default 245):(press Enter)
    Using default value 245
    ================================================================================

Print and save the new partition records.

    ================================================================================
    Command (m for help): p

    Disk /dev/sdc: 2021 MB, 2021654528 bytes
    255 heads, 63 sectors/track, 245 cylinders
    Units = cylinders of 16065 * 512 = 8225280 bytes

      Device Boot      Start         End      Blocks   Id  System
    /dev/sdc1   *           1          51      409626    c  W95 FAT32 (LBA)
    /dev/sdc2              52         245     1558305   83  Linux

    Command (m for help): w
    The partition table has been altered!

    Calling ioctl() to re-read partition table.

    WARNING: Re-reading the partition table failed with error 16: Device or resource busy.
    The kernel still uses the old table. The new table will be used at the next reboot.

    WARNING: If you have created or modified any DOS 6.x partitions, please see the fdisk
    manual page for additional information.
    Syncing disks.
    ================================================================================

Now we've got both partitions, next step is formatting them.

*NOTE*: If the partitions (http://eLinux.org/dev/sdc1 and /dev/sdc2) does not exist, you
should unplug the card and plug it back in. Linux will now be able to
detect the new partitions.

    ================================================================================
    $ sudo mkfs.msdos -F 32 /dev/sdc1 -n LABEL
    mkfs.msdos 2.11 (12 Mar 2005)

    $ sudo mkfs.ext3 /dev/sdc2
    mke2fs 1.40-WIP (14-Nov-2006)
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    195072 inodes, 389576 blocks
    19478 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=402653184
    12 block groups
    32768 blocks per group, 32768 fragments per group
    16256 inodes per group
    Superblock backups stored on blocks:
           32768, 98304, 163840, 229376, 294912

    Writing inode tables: done
    Creating journal (8192 blocks): done
    Writing superblocks and filesystem accounting information:
    ================================================================================

All done!

*NOTE*: For convenience, you can add the `-L` option to the `mkfs.ext3`
command to assign a volume label to the new ext3 filesystem. If you do
that, the new (automatic) mount point under `/media` when you insert
that SD card into some Linux hosts will be based on that label. If
there's no label, the new mount point will most likely be a long hex
string, so assigning a label makes manual mounting on the host more
convenient.

## Setting up the boot partition

The boot partition must contain the following files, get them from one
of the official images:(bootable/fat32 partition)

-   bootcode.bin : 2nd stage bootloader, starts with SDRAM disabled
-   <s>loader.bin : 3rd stage bootloader, starts with SDRAM enabled</s>
-   start.elf: The GPU binary firmware image, provided by the
    foundation.
-   kernel.img: The OS kernel to load on the ARM processor. Normally
    this is Linux - see instructions for [compiling a
    kernel](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation").
-   [cmdline.txt](http://eLinux.org/RPi_cmdline.txt "RPi cmdline.txt"): Parameters passed
    to the kernel on boot.


 Optional files:

-   [config.txt](http://eLinux.org/RPi_config.txt "RPi config.txt"): A configuration file
    read by the GPU. Use this to override set the video mode, alter
    system clock speeds, voltages, etc.
-   vlls directory: Additional GPU code, e.g. extra codecs. Not present
    in the initial release.

### Additional files supplied by the foundation

These files are also present on the SD card images supplied by the
foundation.

Additional kernels. Rename over kernel.img to use them (ensure you have
a backup of the original kernel.img first!):

-   kernel\_emergency.img : kernel with busybox rootfs. You can use this
    to repair the main linux partition using e2fsck if the linux
    partition gets corrupted.

Before the introduction of the 512MB Raspberry PI additional GPU
firmware images (start.elf files) were delivered, to be copied over
start.elf to use them:

the file called start.elf actually determines how much of the available
256MB of memory is assigned to the GPU, but previously each start.elf
file gave a fixed split size. The other splits were simply very similar
files with a different filename, which were copied over the one called
start.elf that was actually to be used, the others had names like
arm192\_start.elf and such.

-   arm128\_start.elf : 128M ARM, 128M GPU split (use this for heavy 3D
    work, possibly also required for some video decoding)
-   arm192\_start.elf : 192M ARM, 64M GPU split (this is the default)
-   arm224\_start.elf : 224M ARM, 32M GPU split (use this for Linux only
    with no 3D or video processing. Its enough for the 1080p
    framebuffer, but not much else)
-   arm240\_start.elf : 240M ARM, 16M GPU split (use this for headless
    mode only. It is enough to boot the system, but you can not use
    video at all.)

Note that actually there is no "default" split, the nature of the
software determines what is the most suitable split. So a "distro" that
is very heavy multimedia oriented will normally use the 128/128MB split
as the GPU needs a lot of RAM, but a generic desktop distro will
probably use the 64/192 MB split, and a game that doesn't use the GPU
will probably use the 32/224MB split.

However for a situation where there are two memory sizes (256 and 512)
this isn't a very smart system. For example the maximum GPU memory spit
of 256MB /2 = 128 MB would in the past give the CPU 128 MB, and the GPU
also 128 MB, but when you use that memory split on a 512 MB PI it would
stil give 128 MB to the CPU, and the rest, a whopping 384 MB to the GPU,
which couldn't do anything with it.

So the RPF changed the firmware so that a single start.elf you now can
give the GPU exactly the amount you want, in chunks of 16MB, with 16MB
as minimum, and 128MB as maximum.

The new syntax is to use:

**gpu\_mem=(number of megabytes for the GPU)**

So for example putting

gpu\_mem=64

will give the GPU 64 MB and whatever the rest is (either 192 or 448 MB)
to the ARM CPU.



# Finally booting GNU/Linux

## important steps

to be completed

## Setting up for remote access / headless operation

If you're anything like me (lazy, with a limited number of monitors),
you'll want to get your Pi set up for remote access as soon as possible.
Luckily, this is easy. *These instructions assume you're using the
official Debian distro for the Pi. Steps 0 & 1 based on info from [Steve
Smith](http://steve.dynedge.co.uk/2012/05/29/enabling-ssh-on-debian-raspberry-pi/).*

-   **Step 0**. Before you set up SSH, you might want to change the
    default password on the Pi, especially if it'll end up
    internet-facing. Do this on the Pi's console with the following
    command:

        passwd

-   **Step 1: Enable SSH** with the following command:

        sudo mv /boot/boot_enable_ssh.rc /boot/boot.rc

    This will enable sshd on the next boot. Restart the Pi. On reboot,
    you should see a line like the following:

        Starting OpenBSD Secure Shell server: sshd

    near the end of the boot sequence. This indicates that sshd is
    enabled, and you should be able to ssh into the Pi. You'll need the
    Pi's IP adress to do that; get that at the Pi's console with:

        ip addr

    You may also find it useful to copy an SSH key to the Pi so you
    don't need to enter a password each time you connect. To do that,
    first check if you've already got a public ssh keyfile:

        ls ~/.ssh/id_rsa.pub

    If you haven't, you can generate one with:

        ssh-keygen -t rsa -C "your_email@youremail.com"

    Finally, copy the keyfile to **\~/.ssh/authorized\_keys** on the Pi
    (there's a few different ways to do this, I used
    Transmit[[1]](http://panic.com/transmit/) to copy it over SFTP,
    since I'm a Mac user. Windows users have
    WinSCP[[2]](http://winscp.net/eng/index.php), and Linux users
    probably already know how to do it ;) ). This file contains **all**
    of the keys authorised to connect to the Pi, so will probably be
    blank or non-existent on a new Pi. If so, just copy **id\_rsa.pub**
    to this location. If it already exists, add the key from
    **id\_rsa.pub** to the end of the file.

-   **Step 2: IP address config.** If your Pi is going to be always-on,
    or your network is set up in a such a way that devices always get
    the same IP, you can skip the step. However, if your Pi's IP is
    likely to change frequently (say, for instance, you're just powering
    it up every so often to play, and your network assigns IPs
    first-come first-served {like most home routers} ), it's a good idea
    to set up a consistent network address for your Pi. There's two ways
    to do this: the quick (but brittle) way and the more flexible way.
    -   **The quick way: assign a static IP address to your Pi.** This
        is simple, but runs the risk of clashing IP addresses with other
        devices on your network since your Pi's address will no longer
        be managed by DHCP. I haven't tried this myself, but here's some
        instructions from [Andrew
        Munsell](http://blog.andrewmunsell.com/post/24830266512/setting-up-the-raspberry-pi-as-a-headless-device).
        He's using **192.168.1.222** for his Pi, since that's outside
        the range assigned by his router. Change this address to
        whatever suits.

            You can do this in Debian Squeeze on the Raspberry by modifying the /etc/network/interfaces file.

            I removed the original iface eth0 line and replaced it with the following:

            iface eth0 inet static
            address 192.168.1.222
            netmask 255.255.255.0
            gateway 192.168.1.1

        On reboot, your Pi should now be using the static address
        specified in **/etc/network/interfaces**.

    -   **The flexible way: set up avahi / zeroconf.** Zeroconf is 'a
        set of techniques that automatically creates a usable Internet
        Protocol (IP) network without manual operator intervention or
        special configuration
        servers.'[[3]](http://en.wikipedia.org/wiki/Zero_configuration_networking).
        Avahi is an implementation of zeroconf which 'ships with most
        Linux and \*BSD
        distributions'[[4]](http://en.wikipedia.org/wiki/Avahi_(software)),
        but **not** the Pi's Debian distro. Zeroconf will be familiar to
        Apple users as **Bonjour**, and is pretty clever tech which
        means that things Just Work when sharing stuff across computers
        on a network. In this context, it means that once we've set it
        up on the Pi, we'll be able to address it as:

            raspberrypi.local

        regardless of what IP address it's been assigned on your local
        network. This is handy if its IP is likely to change regularly,
        and even means we'll continue to be able to address it if we're
        on a different network (say, shuffling between home & work
        networks).
        *Information in this section largely gathered from
        [4dc5](http://4dc5.com/2012/06/12/setting-up-vnc-on-raspberry-pi-for-mac-access/)*.

1.  **Install avahi** with the following commands on the Pi:

        sudo apt-get install avahi-daemon

    and then on older Debian installs:

        sudo update-rc.d avahi-daemon defaults

    or on newer Raspbian installs:

        sudo insserv avahi-daemon

    (if in doubt, you're probably on the newer one).

2.  **Create a configfile for Avahi** at
    **/etc/avahi/services/multiple.service**. I did this with the
    following command:

        sudo pico /etc/avahi/services/multiple.service

    The contents of this file should be something like the following,
    courtesy of **aXon** on the [Rasperry Pi
    forums](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=29&t=7795&p=94439&hilit=avahi#p94439):

        <?xml version="1.0" standalone='no'?>
        <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
        <service-group>
                <name replace-wildcards="yes">%h</name>
                <service>
                        <type>_device-info._tcp</type>
                        <port>0</port>
                        <txt-record>model=RackMac</txt-record>
                </service>
                <service>
                        <type>_ssh._tcp</type>
                        <port>22</port>
                </service>
        </service-group>

3.  **Apply the new configuration** with:

        sudo /etc/init.d/avahi-daemon restart

    The Pi should now be addressable from other machines as
    **raspberrypi.local**, for example:

        ssh pi@raspberrypi.local

4.  **Get Wind/blows to play nice with avahi**
    If you've done the first steps correctly and you open up Putty and
    you try to address your pi as raspberrypi.local, it will tell you:
    [![Puttyerroravahi.png](http://eLinux.org/images/d/d8/Puttyerroravahi.png)](http://eLinux.org/File:Puttyerroravahi.png)
    This happens for a very good reason: your Windows PC can't interpret
    the udp-datagrams avahi sends and most firewalls don't even allow
    them to get read. So you'll have to do a couple of things extra to
    get it working.

* * * * *



1.  **Get Bonjour for Windows**
     [http://support.apple.com/kb/DL999](http://support.apple.com/kb/DL999)
    Just install it, quick next next next next procedure will suffice.
    Now your computer is able to interpret the UDP datagrams which are
    multicasted by the pi. But we're not out of the woods just yet, if
    you try to ping to your raspberry pi:

        C:\Windows\System32>ping raspberrypi.local
        Ping-request cannot find host raspberrypi.local.
        Check the name and try again.

2.  **Tell your firewall: trust me, I'm an engineer.**
    Stereotypically, the firewall forbids us to have some fun. First of
    all, the 5353 udp-port is blocked on most firewalls, so you have to
    add an exception for it. Also, you'll have to grant internet access
    to the mDNSresponder.exe, this way, whenever your computer tries to
    connect with a host \*.local, mDNS sends a multicast over the local
    subnet to ask whether anyone calls himself \*.local. If mDNS isn't
    granted network access, nothing gets multicasted and nobody answers
    the phone.
    *Note:* If you have the McAfee firewall, you'll also have to enable
    UDP-control. If it isn't enabled, all UDP-datagrams are ignored.
3.  **Enjoy the pleasure of typing raspberrypi.local in Putty**
     After these steps, you should be able to ping to raspberrypi.local
    and even address it that way in putty. YMMV, if you're still having
    troubles at this point, try to ping to raspberrypi.local with the
    firewall turned off. If it works: hey presto, you've got your
    culprit and you can start an educated google search.

--Live long and geeky 17:14, 17 November 2012 (UTC)

# Software development/proving

A supported platform for the Raspberry is Qt, which is already being
worked on. C/C++ is supported through a gcc cross-compiling toolchain.
On Debian/Ubuntu systems, the packages gcc-4.6-arm-linux-gnueabi and
g++-4.6-arm-linux-gnueabi provide suitable compilers. For other build
platforms, [Chris has good instructions for building a
cross-compiler](http://www.bootc.net/archives/2012/05/26/how-to-build-a-cross-compiler-for-your-raspberry-pi/#comment-22483)
- this should also work in a Cygwin environment on Windows. MinGW may
also be supported.

Python is being pushed forward by the foundation. (Status ??)

After compiling, using QEMU and a Linux VM would be one way of testing
your apps (this also works on Windows). Search the forum for the
ready-made ARM images.

The choice of programming languages, IDEs and other tools on the R-Pi is
only determined by:

1) The operating system compatibility (at the moment the specific Linux
distro used)

2) The status of the respective ARM package repositories and their
binary compatibility

3) The possibilty to build other software + its dependencies for the
R-Pi from sources (depends on C cross-compiler ???)

What kind of software development and testing loop has been proven
effective please (from someone who's been there and done it)?

For me (and others, hopefully) that would be very useful.

# Sample setup scripts to run after a fresh Raspbian install

[https://github.com/iugamarian/raspberrypisetup](https://github.com/iugamarian/raspberrypisetup)

# Further reading

The main Raspberry Pi resources are:

-   Raspberry Pi Foundation-maintained [Raspberry Pi
    home](http://raspberrypi.org/)
-   Raspberry Pi Foundation-maintained [Raspberry Pi
    Forum](http://raspberrypi.org/phpBB3)
-   Community-maintained [eLinux wiki](http://eLinux.org/R-Pi_Hub "R-Pi Hub") (see [wiki
    article overview](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi") for
    a list of existing articles)


 An alternative startup guide for beginners can be found on h2g2:
[Introducing the Raspberry Pi](http://h2g2.com/A13735596)

For more guides and projects involving the Raspberry Pi, see [RPi
Projects](http://eLinux.org/RPi_Projects "RPi Projects").

# Thanks to

-   Nabax, \_vlad, jkridner, ds2 and the other
    [BeagleBoard](http://eLinux.org/BeagleBoard "BeagleBoard") wiki contributors on
    elinux.org for an excellent
    [BeagleBoardBeginners](http://eLinux.org/BeagleBoardBeginners "BeagleBoardBeginners")
    resource, which we used as the template for this page.



# References



-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

[Raspberry Pi](http://eLinux.org/R-Pi_Hub "R-Pi Hub")

**Startup**

[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - [SD Card
Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") - [Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") -
**Advanced Setup** - [Beginners Guide](http://eLinux.org/RPi_Beginners "RPi Beginners") -
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


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [ARM Development
    Boards](http://eLinux.org/Category:ARM_Development_Boards "Category:ARM Development Boards")
-   [Broadcom](http://eLinux.org/index.php?title=Category:Broadcom&action=edit&redlink=1 "Category:Broadcom (page does not exist)")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")
-   [Education](http://eLinux.org/Category:Education "Category:Education")

