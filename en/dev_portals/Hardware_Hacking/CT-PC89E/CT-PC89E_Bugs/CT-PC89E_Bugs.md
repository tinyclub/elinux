> From: [eLinux.org](http://eLinux.org/CT-PC89E_Bugs "http://eLinux.org/CT-PC89E_Bugs")


# CT-PC89E Bugs



## Contents

-   [1 Bugs found with operating the
    CT-PC89E](#bugs-found-with-operating-the-ct-pc89e)
    -   [1.1 21feb2010 report from fjp](#21feb2010-report-from-fjp)
    -   [1.2 9mar2010 report from
        bjdooks](#9mar2010-report-from-bjdooks)
    -   [1.3 9mar2010 report from fjp](#9mar2010-report-from-fjp)

# Bugs found with operating the CT-PC89E

This page contains a record of problems found so far with the CT-PC89E,
a very new design of ARM 8.9in netbook. As they are corrected, the
issues will be removed.

-   machine left on overnight resulted in "LCD burn" probably due to
    kernel crash resulted in brightness of LCD being pushed beyond
    limits (a common problem on embedded systems). can only really be
    fixed by a hardware watchdog timer, resulting in power-down.
-   further reverse-engineering of the binary kernel shows that yes,
    there appears to be no hardware watchdog timer, and several
    "shutdown" sections of linux kernel code have been hard-hack
    removed, and replaced with a simple GPIO-based hardware power-down
    sequence.
-   Starting "appliaction" spelling mistake
-   Plastic button activiating Reset pushed in (!) after use only about
    ten times. still works but care now needed.
-   No lid "sleep" system, so LCD stays active after lid is closed
-   layout of filesystem is not FHS compliant.
-   kernel modules have been moved to /drivers instead of
    /usr/lib/modules/2.6.24.2/kernel/drivers, violating FHS compliance
    and absolutely guaranteeing future problems with system upgrades.
-   debian packages on MOS mid-fun operating system violate FHS and
    standard debian policy: many packages install identical files TWICE,
    some of which are in an indentical file-structure under
    /READONLY\_FS. this should NOT be done: the files should be copied
    manually, or installed using debootstrap into /READONLY\_FS but NOT
    added twice into one package.
-   kernel modules compiled into the kernel are still present in
    /drivers, causing segfaults in some cases
-   kernel GPL source code not yet been provided
-   u-boot GPL source code not yet been provided
-   MOS mid-fun GPL source code not yet been provided (workaround
    provided by deleting MOS entirely and creating a Debian/Lenny image
    instead)
-   on 3G dialup (vodafone USB modem), pppd segfaults (presumably kernel
    problem) under Debian, and machine becomes unreliable (indicating
    kernel problem). this can be fixed by providing the kernel source
    code.
-   on 3G dialup (USB modem used by adam), again it fails. kernel source
    DEFINITELY needed.
-   root password was cracked within 4 days, by running "john" on
    /etc/passwd, and found to be "mos2010"
-   /etc and many other files are owned by midfun not root, making it
    unnecessary to have performed the crack: just edit /etc/passwd
-   /sbin/udevd and other applications run as root are owned by midfun,
    allowing them to be replaced and perform root operations under user
    control.
-   screen brightness control is non-linux-compliant: there is no
    standard entry (that could be found) in /proc or /sys for the LCD
    brightness, making it impossible to use standard linux applications
    and distributions. this can be fixed by providing the linux kernel
    source code.
-   the built-in microphone doesn't seem to work, or if it does, the
    kernel drivers are borked and don't make it available under ACPI.
    speakers work fine though.
-   The newly-developed
    [http://gitorious.org/xf86-video-s3c64xx](http://gitorious.org/xf86-video-s3c64xx)
    which is 20x or greater speedups cannot be used because the linux
    kernel source is not yet available, in order to add it.
-   removing ethernet cable, re-insertion doesn't result in
    reconnection. this may be due to linux kernel bugs, but it is hard
    to tell
-   lkcl: after dropping the machine (entirely my own fault!) onto a
    wooden floor from a height of 15in, it fell onto the power lead and
    ethernet dongle side. the ethernet dongle is now also fairly loose,
    and requires to have gravity-assistance (dangling) in order to
    maintain an ethernet connection. not entirely sure what to
    recommend, here, because the connector is about as small as you can
    get, and there's simply no room for the height or width of a
    "standard" RJ45 connector, because overall the machine is really
    very thin. the macbook "air" design springs to mind, with a hole in
    the underside and an approx 30 degree angle on the RJ45 connector,
    but... on a low-cost netbook, that would seem to be a bit of a mad
    design decision.
-   the NAND flash is compiled with ext4 tools, then marked as ext3. the
    kernel is then only compiled with ext4 driver, from 2.6.24.2 which
    is KNOWN to be UNSTABLE. this will (and is already) cause problems.
-   using IDApro to analyse the disassembly of
    \_\_apm\_get\_power\_status it looks like GPIO Bank N pin 2 is used
    as a multiplex selector to choose the source for the S3C ADC input.
    no mutex locking is in evidence on the GPIO Bank N pin 2, thus
    making a race condition quite possible and thus resulting in
    corrupted ADC input.

## 21feb2010 report from fjp

overall: good!

-   osx-style rollerbar at bottom did not start up on first boot.
-   mouse trackpad was inoperable when machine started up when low on
    battery. inserting power cable, mouse trackpad was fine.
-   was unable to connect to my IMAP server; AFAICT no SSL support
-   I played an AVI (a 2005 episode of Doctor Who) on it; fairly good,
    but not great; there were some freezes, probably due to buffer
    underruns
-   while playing the AVI with headphone plugged in there was a fairly
    loud hiss from the internal speaker
-   there seems to be some flash support: it loads, but when playing all
    I got was a "DEMO" logo instead of the actual content
-   Application manager allows to install some additional packages, but
    installation of gnome-games resulted in errors (unrecognized format
    of SVG files) when trying to play them. Missing dependency I guess.
-   Loads of funny spelling errors (to say nothing about some of the
    phrases):
    -   - PowerManagaer
    -   - PowerManager Eanble
    -   - FALSH (instead of FLASH)
-   evbug is compiled in causing major spam of dmesg (making it
    unusable). It is also a security issue as it means all keystrokes
    get logged. And it probably reduces performance somewhat.

## 9mar2010 report from bjdooks

related to the DM9000, from the photos of the PCB. ben has done a
design:
[http://www.fluff.org/ben/pics/im-s3e-mk1/img\_0472.jpg](http://www.fluff.org/ben/pics/im-s3e-mk1/img_0472.jpg)

-   all davicom's schematics claim you need 220uF on the output
    regulators
-   oh, looks like there's a 47uF tant near the transformer
-   however, they've crossed the tx/rx pair over on the output side and
    not put a gnd plan inbetween

## 9mar2010 report from fjp

-   I also have had multiple times that kbd and touchpad are dead after
    boot.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CT-PC89E](http://eLinux.org/index.php?title=Category:CT-PC89E&action=edit&redlink=1 "Category:CT-PC89E (page does not exist)")

