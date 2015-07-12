> From: [eLinux.org](http://eLinux.org/Hisense "http://eLinux.org/Hisense")


# Hisense



[![DB-2010.jpg](http://eLinux.org/images/8/80/DB-2010.jpg)](http://eLinux.org/File:DB-2010.jpg)

US Digital (USDTV [http://usdtv.com/](http://usdtv.com/)) sold an HDTV
Receiver called the DB-2010 manufactured by HiSense. The unit runs an
embedded Linux 2.4.18-12 kernel, with usb-storage compiled into the
kernel. They swap MTD flash RAM partitions 1 and 4 with each new
firmware update (similar to Tivo).

-   [http://www.walmart.com/catalog/product.do?product\_id=2598451](http://www.walmart.com/catalog/product.do?product_id=2598451)
-   [http://www.hisense.com/english/](http://www.hisense.com/english/) -
    manufacturer
-   [http://usdtv.com/](http://usdtv.com/) - reseller
-   [http://www.ati.com/companyinfo/press/2003/4628.html](http://www.ati.com/companyinfo/press/2003/4628.html)
    - related press release?
-   [http://www.linuxdevices.com/products/PD4781682328.html](http://www.linuxdevices.com/products/PD4781682328.html)
    - Xilleon 220?
-   [http://rikers.org/gallery/hardware-hisense](http://rikers.org/gallery/hardware-hisense)
-   [http://linux-hacker.net/usdtv](http://linux-hacker.net/usdtv) -
    serial port pinout dmesg and boot
-   [http://web.archive.org/web/20061019225229/http://www.videohelp.com/forum/archive/t302016.html](http://web.archive.org/web/20061019225229/http://www.videohelp.com/forum/archive/t302016.html)
-   [http://www.avsforum.com/avs-vb/showthread.php?t=479882](http://www.avsforum.com/avs-vb/showthread.php?t=479882)
    - active forum
-   [http://www.vanillahd.com/index.php/receiving-free-over-the-air-ota-tv-with-a-usdtv-box/](http://www.vanillahd.com/index.php/receiving-free-over-the-air-ota-tv-with-a-usdtv-box/)
    - more unlocking info
-   [http://www.avsforum.com/avs-vb/showthread.php?t=1055192](http://www.avsforum.com/avs-vb/showthread.php?t=1055192)
    - hardware versions and other useful bits
-   [http://www.mediafire.com/dogleg69](http://www.mediafire.com/dogleg69)
    - patched firmware including DST fix and timers

The box has a card slot on the front, but there is no card reader behind
the slot. It has a single USB port on the back that can be used to
upgrade the firmware. This uses the AMD/ATI Xilleon 225, a MIPS
processor.

[Tim Riker](http://eLinux.org/User:TimRiker "User:TimRiker") wrote USDTV requesting the
source code on 2006.03.22 and got this reply on 2006.03.31:

    Dear Mr. Riker,

    Your request for access to the GPL and LGPL source code used in the USDTV DB-2010
    receiver was recently forwarded to me.  First of all, let me assure you that we
    at USDTV are fully aware of the terms of these software licenses.  Many members
    of our development team are long-time users and supporters of free and
    open-source software.

    As you have requested, we will make available for Internet file transfer copies
    of the software used in the USDTV receiver that is covered by these licenses.
    Unfortunately, your request has caught us at a bad time.  The USDTV development
    offices are currently in the process of moving to a new location, so we do not
    at this time have a server to host copies of the software to download.  Once our
    move is completed and our full Internet service is restored, we will set up a
    site with the requested software available.  In the meantime, I have attached
    below a list of software that we use; all of these packages should be available
    for download elsewhere on the Internet.

       Linux kernel version 2.4.18
       glibc version 2.2.4
       libpthread version 0.9
       busybox version 0.60.0
       GNU tar 1.13.19
       gzip version 1.3

    Thanks,
    Jim Burmeister
    Technical Lead, Set-Top Box Software Development
    U.S. Digital Television

Some other emails have gone back and forth, but no sources have yet been
made available to [Tim Riker](http://eLinux.org/User:TimRiker "User:TimRiker").

USDTV filed for Chapter 7 bankruptcy in the US District Court of
Delaware, and approximately 6600 receivers (many new in box) were sold
on **July 17th 2007 at 10:00AM** at 12552 S 125 West, STE 200 Draper, UT
(upstairs @ DAW Group Bldg).

-   [http://www.salesandauction.com/7172007.htm](http://www.salesandauction.com/7172007.htm)
-   [http://www.salesandauction.com/usdlotlist.htm](http://www.salesandauction.com/usdlotlist.htm)

For those of you that never received a firmware update, here is the
update. It contains GPL code yet we have no method of extracting only
that code. As the GPL portions are freely copyable, and not extractable,
the package itself must also be copyable. Were it not so, the GPL would
be violated, and I'm sure they would never do that. With no further ado,
here are the packages. **REMEMBER TO NOT INCLUDE THE DELETEME.txt ON THE
USB STICK** or the upgrade **WILL FAIL**.

-   [File:USDTV-2.7.11.tgz](http://eLinux.org/File:USDTV-2.7.11.tgz "File:USDTV-2.7.11.tgz")
    - last known update for non-subscription (ie: FTA or WalMart) boxes
-   [File:USDTV-2.7.15-FTA.tgz](http://eLinux.org/File:USDTV-2.7.15-FTA.tgz "File:USDTV-2.7.15-FTA.tgz")
    - last known update for subscription (ie: USDTV) boxes to use over
    the air

The two different installed firmware images appear to use different
digital signatures. This is why one firmware update will not run on the
other machine. It is expected that they can be swapped, but we are not
publishing this information yet. We expect to publish extracted
filesystem images here soon.

File signatures compatible with the 2.7.15-FTA upgrade are computed by
obtaining the 32-character MD5 checksum of the file, then performing an
MD5 hash using the salt *\$1\$@M&k=Ba}\$* or '\$1\$69-1@4Pm\$'

The low-level boot code is ATI's (now AMD's) proprietary version of
MMON, very likely derived from Eric Smith's mmon MIPS monitor -
[http://www.brouhaha.com/\~eric/software/mmon/](http://www.brouhaha.com/~eric/software/mmon/)

If you have other GPL-containing firmware updates you would like posted
here, please contact [Tim Riker](http://eLinux.org/User:TimRiker "User:TimRiker").

## Hacks

-   Guide-Aspect-Exit-Aspect-Guide - turns on/off a setup -\>
    diagnostics menu including "stream info"
-   Guide-Aspect-Exit-ProgramInfo-0 - factory reset (do we need the 0 ?)
-   Guide-ProgramInfo-Exit-Aspect-Exit - Update Configuration - change
    when box checks for updates that will never come
-   Guide-ProgramInfo-Aspect-ProgramInfo-1 - reboot to other rom image
    (delays 17 seconds or so before reboot)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware
    Hacking](http://eLinux.org/Category:Hardware_Hacking "Category:Hardware Hacking")

