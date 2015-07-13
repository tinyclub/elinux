> From: [eLinux.org](http://eLinux.org/RPi_Distributions "http://eLinux.org/RPi_Distributions")


# RPi Distributions





<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Overview">1 Overview</a>
<ul>
<li><a href="#What_is_armhf">1.1 What is armhf</a></li>
<li><a href="#What_are_ARMv6_and_ARMv7">1.2 What are ARMv6 and ARMv7</a></li>
<li><a href="#Comparison">1.3 Comparison</a></li>
</ul></li>
<li><a href="#Available_ARMv6_Distributions">2 Available ARMv6 Distributions</a>
<ul>
<li><a href="#Fedora_Remix">2.1 Fedora Remix</a></li>
<li><a href="#Debian_.28Squeeze.2F6.x.29">2.2 Debian (Squeeze/6.x)</a></li>
<li><a href="#Arch">2.3 Arch</a></li>
<li><a href="#Raspbian">2.4 Raspbian</a></li>
<li><a href="#DietPi">2.5 DietPi</a></li>
<li><a href="#nOS">2.6 nOS</a></li>
<li><a href="#Moebius">2.7 Moebius</a></li>
<li><a href="#Raspbian_Server_Edition">2.8 Raspbian Server Edition</a></li>
<li><a href="#Red_Sleeve_Linux">2.9 Red Sleeve Linux</a></li>
<li><a href="#IPFire">2.10 IPFire</a></li>
<li><a href="#Raspberry_Pi_Thin_Client">2.11 Raspberry Pi Thin Client</a></li>
<li><a href="#BerryTerminal">2.12 BerryTerminal</a></li>
<li><a href="#GeeXboX_ARM">2.13 GeeXboX ARM</a></li>
<li><a href="#DarkElec">2.14 DarkElec</a></li>
<li><a href="#OpenELEC">2.15 OpenELEC</a></li>
<li><a href="#OSMC">2.16 OSMC</a></li>
<li><a href="#XBian">2.17 XBian</a></li>
<li><a href="#RasPlex">2.18 RasPlex</a></li>
<li><a href="#PwnPi">2.19 PwnPi</a></li>
<li><a href="#ha-pi">2.20 ha-pi</a></li>
<li><a href="#Kali">2.21 Kali</a></li>
<li><a href="#I2Pberry">2.22 I2Pberry</a></li>
<li><a href="#Bodhi">2.23 Bodhi</a></li>
<li><a href="#Gentoo">2.24 Gentoo</a></li>
<li><a href="#Adafruit_-_Occidentalis_v0.1">2.25 Adafruit - Occidentalis v0.1</a></li>
<li><a href="#Tiny_Core_Linux">2.26 Tiny Core Linux</a></li>
<li><a href="#RISC_OS">2.27 RISC OS</a></li>
<li><a href="#Commodore_Pi">2.28 Commodore Pi</a></li>
<li><a href="#PiParted">2.29 PiParted</a></li>
<li><a href="#PiBang_Linux">2.30 PiBang Linux</a></li>
<li><a href="#Plan_9">2.31 Plan 9</a></li>
<li><a href="#NetBSD">2.32 NetBSD</a></li>
<li><a href="#FreeBSD">2.33 FreeBSD</a></li>
<li><a href="#SlaXBMCRPi">2.34 SlaXBMCRPi</a></li>
<li><a href="#PiMAME">2.35 PiMAME</a></li>
<li><a href="#PiBox">2.36 PiBox</a></li>
<li><a href="#OpenWrt">2.37 OpenWrt</a></li>
<li><a href="#Nard">2.38 Nard</a></li>
<li><a href="#Volumio">2.39 Volumio</a></li>
<li><a href="#Kano_OS">2.40 Kano OS</a></li>
<li><a href="#MINIBIAN">2.41 MINIBIAN</a></li>
<li><a href="#slrpi">2.42 slrpi</a></li>
<li><a href="#motionPie">2.43 motionPie</a></li>
<li><a href="#Slackware_ARM">2.44 Slackware ARM</a></li>
</ul></li>
<li><a href="#Available_ARMv7_distributions">3 Available ARMv7 distributions</a>
<ul>
<li><a href="#Ubuntu">3.1 Ubuntu</a></li>
<li><a href="#Windows_10_IoT_Core_Edition">3.2 Windows 10 IoT Core Edition</a></li>
</ul></li>
<li><a href="#Announced_distributions">4 Announced distributions</a>
<ul>
<li><a href="#Firefox_OS">4.1 Firefox OS</a></li>
<li><a href="#OpenSuSE">4.2 OpenSuSE</a></li>
<li><a href="#Meego_MER_.26_XBMC">4.3 Meego MER &amp; XBMC</a></li>
<li><a href="#Puppy">4.4 Puppy</a></li>
<li><a href="#RPi-Buildroot">4.5 RPi-Buildroot</a></li>
<li><a href="#Aros_Hosted_on_Linux">4.6 Aros Hosted on Linux</a></li>
<li><a href="#Android">4.7 Android</a></li>
<li><a href="#ANDROID_TRANSPORTER">4.8 ANDROID TRANSPORTER</a></li>
</ul></li>
<li><a href="#Related_links">5 Related links</a></li>
<li><a href="#References">6 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Software & Distributions:**

*[Software](http://eLinux.org/RPi_Software "RPi Software") - an overview.*

***Distributions** - operating systems and development environments for
the Raspberry Pi.*

*[Kernel Compilation](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation")
- advice on compiling a kernel.*

*[Performance](http://eLinux.org/RPi_Performance "RPi Performance") - measures of the
Raspberry Pi's performance.*

*[Programming](http://eLinux.org/RPi_Programming "RPi Programming") - programming
languages that might be used on the Raspberry Pi.*

# Overview

## What is armhf

The Debian Squeeze image originally issued by the Raspberry Pi
foundation as the recommended distribution used "soft float" settings.
The foundation felt necessary to use the existing Debian port for
less-capable ARM devices due to time and resource constraints during
development of the Raspberry Pi. Therefore, it did not make use of the
Pi's processor's floating point hardware - reducing the Pi's performance
during floating point intensive applications - or the advanced
instructions of the ARMv6 CPU.

The [official Raspberry Pi
distributions](http://www.raspberrypi.org/downloads) are now optimized
for ARMv6 and for "hard float" which should have better performance on
certain CPU intensive tasks.

There is some information on the news groups that "hard float"
optimization can speed up floating point operating up to 10x, please
read detailed discussion on the [Raspberry Pi
forums](http://www.raspberrypi.org/phpBB3/viewtopic.php?p=61497#p61497).

## What are ARMv6 and ARMv7

Read more [here](https://en.wikipedia.org/wiki/ARM_architecture#Cores).

## Comparison

Operating Systems for Raspberry Pi models A and B

Distribution

Latest release date

First release date

OS platform

License

RAM footprint

sdcard footprint

armhf

Image / installer

Packages

user:password

Default GUI

[DietPi](http://fuzon.co.uk/phpbb/viewtopic.php?f=8&t=6)

24/05/2015

08/01/2014

Linux / Raspbian

[OSI GPLv2](http://www.opensource.org/licenses/gpl-2.0.php)

15MB

650MB.img 350MB.filesystem

Yes

[DietPi-Image](http://sourceforge.net/projects/dietpi/files/Raspberry%20Pi%20%28All%20Models%29/DietPi_Raspberry-Pi.7z/download)

[Optional installer (dietpi-software) for popular, "ready to run",
optimized programs unique to all Pi Models(Kodi/RetroPie
etc).](http://fuzon.co.uk/phpbb/viewtopic.php?f=8&t=5)

root:raspberry

None / Optional minimal LXDE with dietpi-software installer.

[Arch Linux ARM](http://archlinuxarm.org/platforms/armv6/raspberry-pi)

2015-03-02

2012-03-01

Linux

[OSI GPLv2](http://www.opensource.org/licenses/gpl-2.0.php)

Yes

[raw image (RPi
1)](http://archlinuxarm.org/os/ArchLinuxARM-rpi-latest.tar.gz)

[raw image (RPi
2)](http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz)

[8,700](http://archlinuxarm.org/packages)

root:root

none

[BerryTerminal](http://www.berryterminal.com/doku.php)

2013-12-25

2012-06-02

Linux

No

[Image](http://downloads.sourceforge.net/project/berryboot/os_images/berryterminal-standalone-20131225.zip)

N/A

[ltsp](http://www.ltsp.org/)

[Bodhi Linux](http://bodhilinux.com/)

2013-01-25 (raspbian/wheezy)

2012-06-12 (wheezy)

Linux / Raspbian

[Core: OSI mixed](http://www.debian.org/legal/licenses/) (GPLv2 BSD etc)

Yes

[img+md5sum](http://bodhilinux.com/downloads_mobile.php)

[35,000+](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=66&t=4256&start=552)


[ARMHF](http://jeffhoogland.blogspot.co.at/2012/08/bodhis-arm-branch-moves-to-armhf.html)

pi/bodhilinux
(sudo su root/bodhilinux)

[Enlightenment](http://www.enlightenment.org/)

[Debian ARM](http://www.debian.org/ports/arm/)

2012-04-19 (Squeeze)

2012-02-16 (Squeeze)

Linux

[Core: OSI mixed](http://www.debian.org/legal/licenses/) (GPLv2 BSD etc)

No

[raw
image](http://downloads.raspberrypi.org/images/debian/6/debian6-19-04-2012/debian6-19-04-2012.zip)

[20,000+](http://packages.debian.org/stable/allpackages)

pi:raspberry

 ?

[DRUMS::DLNA Raspberry USB Music
Server](http://www.binaryemotions.com/raspberry-music-server-dlna-usb/)

2014-11-18

2014-11-18

Linux / Raspbian

GPLv2

Yes

[raw image](http://sourceforge.net/projects/raspberrymusicserver/files)

No interface.

[Fedora Remix](http://fedoraproject.org/wiki/Architectures/ARM)

2013-05-22 (F18)

2012-07-07 (F14)

Linux

[OSI mixed](http://fedoraproject.org/wiki/Licensing:Main) (GPLv2 BSD
etc)

Yes

Fedora RPM:
[installer](http://files.velocix.com/c1410/fedora/installer/fedora/fedora-arm-installer-1.0.0-1.fc16.noarch.rpm)
Windows Zip:
[installer](http://files.velocix.com/c1410/fedora/installer/windows/fedora-arm-installer-1.0.0.zip)
Other Linux: [Python
script](http://files.velocix.com/c1410/fedora/installer/source/faii-1.0.0.tar.gz)

[16,464](http://dl.fedoraproject.org/pub/fedora-secondary/releases/18/Everything/armhfp/os/Packages/)?

N/A

Xfce

[Gentoo Linux](http://www.gentoo.org/)

2013-08-16

2012-04-27

Linux

[GPLv2](http://www.opensource.org/licenses/gpl-2.0.php)

\~23 MiB

Yes

[Wiki article](http://wiki.gentoo.org/wiki/Raspberry_Pi) [Quick Install
Guide](http://wiki.gentoo.org/wiki/Raspberry_Pi_Quick_Install_Guide)
 [stage3
tarball](http://distfiles.gentoo.org/releases/arm/autobuilds/current-stage3-armv6j_hardfp/)

N/A

[IPFire](http://planet.ipfire.org/post/ipfire-on-raspberry-pi-ready-to-first-test)

2012-06-27 (2.11)

2012-06-27 (2.11)

Linux

Open Source

\~20 MiB

No

raw image (404 error from their own website)

[144](http://wiki.ipfire.org/en/addons/all)

N/A

none

[I2Pberry](https://github.com/m6urns/i2pberry)

2015-01-04

2013-04-18

Linux

[OSI GPLv2](http://www.opensource.org/licenses/gpl-2.0.php)

Yes

[torrent](https://github.com/m6urns/i2pberry/blob/master/torrents)

[20,000+](http://packages.debian.org/stable/allpackages)

user:raspberry

none

[Kali](http://docs.kali.org/armel-armhf/install-kali-linux-arm-raspberry-pi)

2013-03-11

2013-03-11

Linux

 ?

 ?

No

[image](http://cdimage.kali.org/kali-images/kali-linux-1.0-armel-raspberrypi.img.gz)

 ?

root:toor

XFCE4

[Meego MER + Kodi](http://wiki.meego.com/User:Vgrade#Raspberry_Pi)

2012-04-27 (0.2)

2012-04-11 (0.1)

Linux (embedded)

[OSI mixed](http://www.opensource.org/licenses/index.html) (GPLv2 BSD
etc)

\~34 MiB + Kodi

No

[\~320](http://gitweb.merproject.org/gitweb/) (core)

N/A

[Kodi](http://kodi.tv)

[Moebius](http://moebiuslinux.sourceforge.net/)

2015-01-11 (2.0.0)

2012-08-01 (1.0.0)

Linux

(GPLv2)

\~20 MiB

Yes

[Raw Image](http://moebiuslinux.sourceforge.net/download)

(core) + Github moebius repositories

root: moebius

none

[MINIBIAN](http://minibianpi.wordpress.com/)

2015-02-18

2013-07-05

Linux / Raspbian

(GPLv2)

\~17 MiB

\< 512 MB

Yes

[Raw
Image](http://sourceforge.net/projects/minibian/files/latest/download)

(core) + Raspbian Repositories

root: raspberry

none

[nOS](http://nos.net.nz/)

2014-03-14(2.2)

2013-11-28 (2.0)

Linux

(GPLv2)

\~90 MiB

Yes

[Zip
File](http://http://sourceforge.net/projects/nos/files/2.2/nos-2.2-rpi.zip/download/Download)

35,000+

pi:raspberry

XFCE

[openSUSE](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=87&t=40664)

2013-12-06

2012-07-30

Linux 3.11

[OSI mixed](http://www.opensource.org/licenses/index.html) (GPLv2 BSD
etc)

28 MiB (inc. X11)

Yes

[raw
image](http://www.zq1.de/~bernhard/linux/opensuse/raspberrypi-opensuse-latest.img.xz)

[6300](https://build.opensuse.org/project/show?project=openSUSE%3AFactory%3AARM)

root:linux

icewm

[OpenWRT](http://wiki.openwrt.org/toh/raspberry_pi)

2014-10-02 (14.07 Barrier Breaker)

2012-08-15

Linux

[OSI mixed](http://www.opensource.org/licenses/index.html) (GPLv2 BSD
etc)

3.3MiB

No

[Image](http://downloads.openwrt.org/attitude_adjustment/12.09-beta2/brcm2708/generic/)

[3358](http://downloads.openwrt.org/attitude_adjustment/12.09-beta2/brcm2708/generic/packages/)

[first login with telnet](http://wiki.openwrt.org/doc/howto/firstlogin)

 set your SSH pw

[LuCI](http://wiki.openwrt.org/doc/howto/luci.essentials)

[PiBang Linux](http://pibanglinux.org/)

2013-10-14

2012-10-29

Linux

[Core: OSI mixed](http://www.debian.org/legal/licenses/) (GPLv2 BSD etc)

Yes

[Latest image](http://pibanglinux.org/download.html)

(user created at first boot)

[Openbox](http://en.wikipedia.org/wiki/Openbox/),[i3wm](http://en.wikipedia.org/wiki/I3_(window_manager))

[PwnPi](http://www.pwnpi.net/index.html)

2012-06-29 (Squeeze)

2012-05-26 (Squeeze)

Linux

GNU General Public License version 3.0

No

[Image](http://sourceforge.net/projects/pwnpi/files/pwnpi-2.0-final.7z/download)

[20,000+](http://packages.debian.org/stable/allpackages)

root:toor

[xfce](http://www.xfce.org/)

[QtonPi](http://wiki.qt-project.org/QtonPi)

2012-05-27 (0.2)

2012-05-07 (0.1)

Linux

No

[qt 5 sdk + sdcard
image](http://downloads.raspberrypi.org/images/qtonpi/qtonpi-0.02/qtonpi-0.2.tar.bz2)

root:rootme
qtonpi:qtonpi

 ?

[VPNbian](http://techfunbln.blogspot.de/2013/09/raspberry-pi-as-openvpn-gateway-with-or.html)

2013-09-22

2013-09-22 Linux 3.6.11+
 2012-05-28 (Wheezy)

Linux

[Core: OSI mixed](http://www.debian.org/legal/licenses/) (GPLv2 BSD etc)

\~40 MiB w/o desktop

Yes

[vpn & airport image](http://roow.de/raspberry/vpnairplay.image.zip)
[vpn image](http://roow.de/raspberry/vpn.image.zip)

[35,000+](http://techfunbln.blogspot.de/2013/09/raspberry-pi-as-openvpn-gateway-with-or.html)

root:raspberry

none

[Raspbian](http://www.raspbian.org/)

2013-05-25

2012-05-28 (Wheezy)

Linux

[Core: OSI mixed](http://www.debian.org/legal/licenses/) (GPLv2 BSD etc)

\~30 MiB w/o desktop

2500 MB

Yes

[pi image list](http://www.raspbian.org/RaspbianImages)
[qemu image](http://debian.raspbian.com/qemu/)

[35,000+](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=66&t=4256&start=552)

root:hexxeh
root:raspbian
pi:raspberry

[LXDE Openbox](http://wiki.lxde.org/en/Openbox)

[OpenELEC](http://openelec.tv/get-openelec/viewcategory/10-raspberry-pi-builds)

2015-02-28 (5.0.5)

2012-05-10

Linux 3.14.11 (embedded)

[OSI mixed](http://www.opensource.org/licenses/index.html) (GPLv2 BSD
etc)

110 MiB (incl. Kodi)

Yes

[- Official
Downloadsite](http://www.openelec.tv/get-openelec/download/viewcategory/10-raspberry-pi-builds)

[- Install
instructions](http://wiki.openelec.tv/index.php?title=Installing_OpenELEC_on_Raspberry_Pi)
 [- Build
instructions](http://wiki.openelec.tv/index.php?title=Building_and_Installing_OpenELEC_for_Raspberry_Pi)
 [- Test and development
builds](http://sources.openelec.tv/tmp/image/)
 [- RAW image (unofficial)](http://openelec.thestateofme.com/)

[\~140](https://github.com/OpenELEC/OpenELEC.tv/tree/master/packages) (+
[7](http://wiki.openelec.tv/index.php?title=OpenELEC_Addons_(official))
via Kodi)

root:openelec
(ssh only)

[Kodi](http://kodi.tv)

[XBian](http://xbian.org/)

2015-02-08

2012-07-29

Linux / Raspbian

[OSI mixed](http://www.opensource.org/licenses/index.html) (GPLv2 BSD
etc)

Yes

[Windows installer](http://download.xbian.org/xbian-installer.zip)
 [Latest Pi 1
image](http://sourceforge.net/projects/xbian/files/release/XBian_Latest_rpi.img.gz)

 [Latest Pi 2
image](http://sourceforge.net/projects/xbian/files/release/XBian_Latest_rpi2.img.gz)

[Install instructions](http://xbian.org/getting-started/)

[35,000+](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=66&t=4256&start=552)

xbian:raspberry

[Kodi](http://kodi.tv)

[osmc](https://osmc.tv/)

2015-05-15 (RC3)

Linux / Raspbian

GPLv2 <sup>[[1]](#cite_note-1)</sup>

Yes

[installers](https://osmc.tv/download/)

[20,000+](http://packages.debian.org/stable/allpackages)

osmc:osmc

Custom [Kodi](http://kodi.tv) skin

[RISC OS](http://en.wikipedia.org/wiki/RISC_OS)

2012-11-01 (5.19 RC6)

2012-07-09 (5.19)

RISC OS

[Shared Source](http://www.riscosopen.org/content/documents/ssfaq)

No

[Latest official image](http://www.raspberrypi.org/downloads)

(not applicable)

[RISC OS WIMP](http://en.wikipedia.org/wiki/RISC_OS)

[SliTaz](http://www.slitaz.org/)

2012-12-14 (cooking)

2012-05-29 (4.0)

Linux 3.2.27

[GPLv2](http://www.opensource.org/licenses/gpl-2.0.php)

\~10 MiB

Yes

[raw image](http://arm.balinor.net/slitaz/armhf/)

[260](http://arm.balinor.net/slitaz/armhf/packages/)

root:root

[Openbox ?](http://en.wikipedia.org/wiki/Openbox/)

[Aros hosted on Raspbian Limited Demo](http://www.aros.org/)

2012-06-14

2012

Linux / Debian6 + Aros

Mixed - [GPLv2](http://www.opensource.org/licenses/gpl-2.0.php) and APL
(MPL derivative)

\<\~50 MiB

No

[Binaries and run
./where/ever/AEROS/boot/AROSbootstrap](http://www.aeros-os.org/aerosmxb2.tar.gz)

pi:raspberry

[Aros Wanderer](http://www.aros.org)

[Plan9](http://plan9.bell-labs.com/plan9)

2013-09-23

2012-11-12

Plan 9

[Lucent](http://plan9.bell-labs.com/sources/plan9/LICENSE)

Yes

[raw
image](http://plan9.bell-labs.com/sources/contrib/miller/9pi.img.gz)

[Rio](http://plan9.bell-labs.com/wiki/plan9/using_rio)

[9front](http://9front.org/)

2013-12-13

2013-10-20

9front

[Lucent](http://plan9.bell-labs.com/sources/plan9/LICENSE)

Yes

[raw
image](http://intma.in/downloads/9front-pi-3125.9fcca5b8ac11.img.bz2)

[Rio](http://plan9.bell-labs.com/wiki/plan9/using_rio)

[SlaXBMCRPi](http://slaxbmc.blogspot.co.uk/2014/04/slaxbmc-141-is-released.html)

2014-04-09 [14.1]

2013-02-19 [14.0]

Linux

[OSI mixed](http://www.opensource.org/licenses/index.html) (GPLv2,
GPLv3, BSD etc.)
[BCL For Java
SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html)

No

[Raw Image (Developer)](http://slackware.org.uk/slaxbmc/14.1/)
 [Raw Image (Minimal)](http://slackware.org.uk/slaxbmc/14.1/)
 [Manual
Installer](http://slackware.org.uk/slaxbmc/14.1/slaxbmcrpi-14.1/)
 [Install Instructions
(Windows/Linux)](http://slackware.org.uk/slaxbmc/14.1/slaxbmcrpi-14.1/INSTALL.TXT)

[476](http://slackware.org.uk/slaxbmc/14.1/slaxbmcrpi-14.1/)
(+ [Official SlackwareARM 14.1
Packages](http://slackware.org.uk/slackwarearm/slackwarearm-14.1/))

root:slaxbmcrpi

[Fluxbox](http://fluxbox.org/)
, autostart into [Kodi](http://kodi.tv)

[PiMAME](http://pimame.org)

2013-08-25

2012-12-01

Linux

Core: OSI mixed (GPLv2 BSD etc)

Yes

[raw image](http://pimame.org)

pi:raspberry

none

[PiBox](http://www.graphics-muse.org/wiki/pmwiki.php/RaspberryPi/RaspberryPi)

2015-01-18

2013-07-14

Linux / Buildroot

OSI Mixed

Yes

[image](http://www.graphics-muse.org/archives/pibox/0.10.0/) (Source,
rootfs, staging tree, install images, SD card builder)

root:pibox

Blackbox/Matchbox

[pipaOS](http://pipaos.mitako.eu/)

2014-01-12

2013-02-10

Linux / Raspbian

[Core: OSI mixed](http://www.debian.org/legal/licenses/) (GPLv2 BSD etc)

\~32 MiB

Yes

[Image](http://pipaos.mitako.eu/download/pipaos-stable.img.gz)

37.500

sysop:posys with sudo root privileges

none

[Raspberry WebKiosk](http://www.binaryemotions.com/raspberry-webkiosk)

2013-11-28

2013-11-26

Linux / Raspbian

GPLv2

Yes

[raw image](http://sourceforge.net/projects/raspberrywebkiosk/files)

Browser-only: Chromium

[Raspberry Digital
Signage](http://www.binaryemotions.com/raspberry-digital-signage)

2013-11-12

2013-06-06

Linux / Raspbian

GPLv2

Yes

[raw image](http://sourceforge.net/projects/raspberrysign/files)

Browser-only (restricted fullscreen): Chromium, Firefox or Midori

[Volumio](http://volumio.org/)

2014-06-13

2013-12-14

Linux / Raspbian

[GPLv3](http://gplv3.fsf.org/)

Yes

[Latest image](http://volumio.org/get-started/)

volumio:volumio

[Openbox](http://en.wikipedia.org/wiki/Openbox/),[i3wm](http://en.wikipedia.org/wiki/I3_(window_manager))

[Nard SDK](http://www.arbetsmyra.dyndns.org/nard/)

2015-01-21

2014-06-24

Linux / Embedded

Donationware

\~37 MB

Yes

[Build instructions](http://www.arbetsmyra.dyndns.org/nard/#building)

root:pass

none

[ThinBox](http://jontylovell.net/index.php?page=30)

2014-08-14

2014-08-14

Linux / Raspbian

Freeware

1000 MB

Yes

[Latest Image](http://jontylovell.net/index.php?page=30)

Not Needed

Autostarts

[slrpi](https://sourceforge.net/projects/slrpi/)

2015-01-01

2014-12-25

Linux

(GPLv2)

Yes

[Raw
Image](https://sourceforge.net/projects/slrpi/files/latest/download)

90 Slackware ARM packages

root: password

none

[Slackware ARM](http://rpi.fatdog.eu/)

2015-03-13

2012-10-28

Linux

[GPLv2, GPLv3](http://en.wikipedia.org/wiki/GNU_General_Public_License)

No

[XZ image and .ZIP file](http://rpi.fatdog.eu/?p=downloads) RPi1

[XZ image and .ZIP file](http://rpi2.fatdog.eu/?p=downloads) RPi2

[Slackware .tgz packages](http://rpi.fatdog.eu/?p=downloads) RPi1

[Slackware .tgz packages](http://rpi2.fatdog.eu/?p=downloads) RPi2

root:user\_defined

none

[Windows 10 IoT](http://ms-iot.github.io/content/win10/SetupRPI.htm)

2015-04-29

2015-04-29

Windows

[n.a.](https://connect.microsoft.com/terms.aspx)

No

[FFU
Image](https://connect.microsoft.com/windowsembeddedIoT/Downloads/DownloadDetails.aspx?DownloadID=57782)
RPi2

Administrator:p@ssw0rd

none

[raspbian-ua-netinst](https://github.com/debian-pi/raspbian-ua-netinst)

Linux

640 MB

Yes

[FreeBSD](https://wiki.freebsd.org/FreeBSD/arm/Raspberry%20Pi)

BSD

260 MB

[NetBSD](http://wiki.netbsd.org/ports/evbarm/raspberry_pi/)

BSD

Yes

# Available ARMv6 Distributions

## Fedora Remix

The Raspberry Pi Fedora Remix is a Linux software distribution for the
Raspberry Pi computer. It contains software packages from the Fedora
Project (specifically, the Fedora ARM secondary architecture project),
packages which have been specifically written for or modified for the
Raspberry Pi, and proprietary software provided by the Raspberry Pi
Foundation for device access.

-   [wiki
    page](http://zenit.senecac.on.ca/wiki/index.php/Raspberry_Pi_Fedora_Remix)

## Debian (Squeeze/6.x)

[http://www.debian.org/ports/arm/](http://www.debian.org/ports/arm/)

[Debian](http://www.debian.org/) was the default distribution on the
Alpha boards. Boot time depends on width & speed of SD-card. Alpha board
boot into Debian prompt (no GUI) was timed taking about 34 seconds.

The Debian distro for Raspberry Pi is the Cambridge reference
filesystem, which is a fully functional Debian Squeeze installation
containing LXDE (desktop) and Midori (browser); development tools; and
sample code for accessing the multimedia functionality on the device.

## Arch

[Arch Linux ARM](http://archlinuxarm.org) is based on [Arch
Linux](http://www.archlinux.org/), which aims for simplicity and full
control to the end user. It provides a lightweight base structure that
allows you to shape the system to your needs. For this reason, the Arch
Linux ARM image for the Raspberry Pi does not come with a graphical user
interface, though you can easily install one yourself. Please note that
the Arch distribution may not be suitable for beginners.

Arch Linux ARM is on a rolling-release cycle that can be updated daily
through small packages instead of huge updates every few months.

More information is available at
[http://archlinuxarm.org](http://archlinuxarm.org)

## Raspbian

Raspberry Pi + Debian = [Raspbian](http://www.raspbian.org). A project
to create a hard float port of Debian Wheezy (7.x) armhf for the
Raspberry Pi. The intent of Raspbian is to bring to the Raspberry Pi
user 10,000s of pre-built Debian packages specifically tuned for optimal
performance on the Raspberry Pi hardware. The project is still in its
early phases, but the major push to rebuild nearly all Debian packages
for the Raspberry Pi is expected to be completed by early June, 2012
(only several hundred packages remain as of June 1st). After that,
efforts will focus on making Raspbian the easiest to use, most stable
and best performing Linux distribution available for the Raspberry Pi.

More information is available at
[http://www.raspbian.org](http://www.raspbian.org)

## DietPi

[DietPi - Minimal Raspbian
Image](http://fuzon.co.uk/phpbb/viewtopic.php?f=8&t=6)

At its core, DietPi is the goto image for a minimal Raspbian/Debian
Server install. We've stripped down and removed everything from the
official Raspbian image to give us a bare minimal Raspbian server image
that we call DietPi-Core.


 [DietPi - Core (Minimal image
stats):](http://fuzon.co.uk/phpbb/viewtopic.php?f=8&t=6)

-   Minimal and optimized Raspbian Image for all Pi models.
-   DietPi-Software: Install optional "ready to run" software, quickly
    and easily, with optimizations unique to your Pi model.
-   DietPi-Config: A feature rich config tool for your Pi. Overclock and
    tweak your pi, scan and connect to wifi SSID's, and many many more
    options.
-   ARMhf - hardware floating point calculations.
-   Small 120MB compressed image.
-   Fits on a 1GB or greater SD card
-   Only 11 running processes after boot
-   16MB of memory usage after boot
-   RamLog installed. All logs goto RAM and get cleared on daily basis
    with cron (saves SD writes, performance increased, no need for
    rsyslog).
-   Lightweight SSH server (Dropbear) is installed instead of OpenSSH.
-   Wifi Support. Unlike most Raspbian minimal images, ours includes
    full Wifi support.


 [DietPi-Software:](http://fuzon.co.uk/phpbb/viewtopic.php?f=8&t=5)
DietPi-Software allows for popular, optional install choices. All of
which are pre-configured and "ready to run" with all the optimizations
and configurations done for you. This ensures you get the maximum
performance from your Pi and the software you choose to install

-   LXDE (Lightweight Desktop, without the bloatware found in Raspbian)
-   Kodi / Xbmc
-   Gaming (RetroPie)
-   Gaming (OpenTyrian Game)
-   Bittorrent Server (Transmission)
-   OwnCloud Server
-   DLNA/UPnP Media Server (MiniDLNA)
-   HiFi / Web Interface Music Player (MPD + YMPD)
-   Forums (phpbb3)
-   Web Server Stacks (Apache2/Nginx + mysql + php5 + phpmyadmin)
-   FTP server (Proftpd)
-   File Server (Samba)
-   VPN Server (SoftEther)
-   Website URL Address (No-Ip)


 [DietPi-Config:](http://fuzon.co.uk/phpbb/viewtopic.php?f=8&t=5)
DietPi-Config is a feature rich configuration tool for your Pi:

-   Change overclocking profiles
-   Change resolution, set audio output, analogue audio quality etc.
-   Tweak ARM temp limits, change CPU governor settings and many more.
-   Full networking tool that allows you to connect to Wifi SSIDs
    easily, change static IP's address, and many more options.
-   Samba client utility allows you to quickly and easily connect to
    Windows Shares.
-   NoIp client utility, allows you to quickly and easily setup your
    website address for your Pi.

[DietPi - Download /
Info](http://fuzon.co.uk/phpbb/viewtopic.php?f=8&t=6)

## nOS

nOS is an operating system for the Raspberry Pi that aims to make the
device simple, fast and easy to use. It incorporates an XFCE desktop
which is lightweight and user friendly for previous users of Microsoft
Windows. It uses a modified version of the NOOBS installer for the
installation as it only requires a quick drag and drop to the SD card.

More information is available at
[http://www.nos.net.nz](http://www.nos.net.nz)

## Moebius

A very compact ARM HF distribution, using 20Mb of RAM (with SSH server
running) for the entire operating system. It fits in a 128Mb SD card,
has auto-resizing features to better adapt to your SD card size and uses
its own repositories for installing everything you need. A wise
configuration and a small memory footprint are ideal for an headless
machine or for interacting with real word I/O devices, take a look at
[Moebius Website](http://moebiuslinux.sourceforge.net/). Version 2 is
current stable version.

## Raspbian Server Edition

This is a stripped-down version of Raspbian with some extra packages.

-   [Main site of version
    2.3](http://sirlagz.net/2013/03/04/raspbian-server-edition-version-2-3-1gb-image/)
-   [Download Version
    2.3](http://sirlagz.net/wp-content/plugins/download-monitor/download.php?id=15)

## Red Sleeve Linux

[Red Sleeve Linux](http://www.redsleeve.org/) is a Linux distribution
that aims to bring the RHEL clone design to the ARM architecture. There
are images for several ARM devices including the Raspberry Pi.

## IPFire

[IPFire](http://www.ipfire.org) is an Open Source firewall distribution
for x86 and ARM-based systems. It turns the Raspberry Pi computer into a
small router for home networks and very small businesses. As the
Raspberry Pi computer comes with only one NIC, it works perfectly as a
3G router without plugging in additional hardware.

The generally small system that provides essential services for networks
can be enhanced by addons which add new features to IPFire. So the
system can be turned into a file server and much more.

More information is available at
[http://www.ipfire.org](http://www.ipfire.org)

## Raspberry Pi Thin Client

Thin Client project want to create a very cheap thin client over
Raspberry Pi board! Microsoft RDC, Citrix ICA & VMWare View

-   [Homepage](http://rpitc.blogspot.se/)
-   [Download](http://rpitc.blogspot.se/p/download.html)

## BerryTerminal

BerryTerminal is a minimal Linux distribution designed to turn the
Raspberry Pi mini computer into a low-cost thin client. It allows users
to login to a central Edubuntu or other LTSP server, and run
applications on the central server

-   [Main Site](http://www.berryterminal.com/doku.php)
-   [Download](http://dl.berryboot.com/berryterminal-20130321.zip)

## GeeXboX ARM

GeeXboX is a free and Open Source Media-Center purposed Linux
distribution for embedded devices and desktop computers. GeeXboX is not
an application, it’s a full-featured OS, that one can boot as a LiveCD,
from a USB key, an SD/MMC card or install on its regular HDD. The
GeeXboX distribution is lightweight and designed for one single goal:
embed all major multimedia applications as to turn your computer into an
HTPC.

[http://www.geexbox.org/category/arm/](http://www.geexbox.org/category/arm/)

## DarkElec

None of the currently available solutions do a perfect job with running
XBMC/Kodi on the Pi, however OpenELEC comes by far the closest, in spite
of its locked-down nature.

This fork aims to remedy the very few flaws in its implementation and to
focus 100% on the Pi, while also sticking to upstream and incorporating
its updates.

Features:

    •Low idle CPU usage (< 15%)
    •Smoother and more responsive
    •Built-in XBMC addons: iPlayer, custom fixed version of Demand 5, various unofficial repos
    •iPlayer, 4oD, Demand 5, ITV Player, SportsDevil all fully tested+working
    •Improved wifi connectivity
    •Added test-connman scripts for easy wifi setup
    •Added wireless_tools (iwconfig etc.)
    •Added rndis_wlan wifi driver (broadcom 4320 chipset)
    •Easy SD card installation script for building from source

-   [Main site](http://darkimmortal.com/category/raspberry-pi/)
-   [Download DarkELEC Release 3](http://shit.weeaboo.com/darkelec3.zip)

## OpenELEC

OpenELEC is an embedded operating system built specifically to run
[XBMC](http://www.xbmc.org), the Open Source entertainment media hub.
The idea behind OpenELEC is to allow people to use their Home Theatre PC
(HTPC) like any other device you might have attached to your TV, like a
DVD player or Sky box. Instead of having to manage a full operating
system, configure it and install the packages required to turn it into a
hybrid media center, OpenELEC is designed to be simple to install,
manage and use, making it more like running a set-top box than a
full-blown computer.

-   [OpenELEC Mainsite](http://www.openelec.tv)
-   In February 2012, OpenELEC.tv announced their [ARM port for
    Raspberry
    Pi](http://openelec.tv/component/k2/item/235-openelec-on-raspberry-pi-our-first-arm-device-supported)
-   [OpenELEC
    forum](http://openelec.tv/forum/90-miscellaneous/11763-raspberry-pi)
    thread
-   [RaspberryPi
    forum](http://www.raspberrypi.org/forum/general-discussion/openelec)
    thread
-   [Raspberry Pi build instructions for
    OpenELEC](http://elinux.org/Rpi_openELEC)

## OSMC

Raspbmc now OSMC is a Linux distribution based on Debian that brings
XBMC/Kodi to your Raspberry Pi. This device has an excellent form factor
and enough power to handle media playback, making it an ideal component
in a low HTPC setup, yet delivering the same XBMC/Kodi experience that
can be enjoyed on much more expensive platforms. Raspbmc is brought to
you by the developer of the Crystalbuntu Linux Distribution, which
brings XBMC/Kodi and 1080p decoding to the 1st generation Apple TV.

-   [Main osmc Site](https://osmc.tv/)
-   [Main raspbmc Site](http://www.raspbmc.com/)
-   [Blog](http://www.stmlabs.com/2012/06/24/network-issues/)
-   [image](http://files.velocix.com/c1410/raspbmc/downloads/bin/ramdistribution/installer-testing.img.gz)
-   [1-click-Installer
    (Win)](http://download.raspbmc.com/downloads/bin/installers/raspbmc-win32.zip)
-   [Installation instructions
    (Mac/Lin)](http://www.raspbmc.com/wiki/user/os-x-linux-installation/)
-   [source](http://svn.stmlabs.com/listing.php?repname=raspbmc)

## XBian

XBian is a small, fast and lightweight media center distro for the
Raspberry Pi, based on a minimal Raspbian image. It's slogan is "XBMC on
Raspberry Pi, bleeding edge" and thus it's main focus is delivering the
fastest XBMC/Kodi solution for the Raspberry Pi. Thereby making most of
the commercial media-center products obsolete...

[Features:](http://eLinux.org/index.php?title=Features:&action=edit&redlink=1 "Features: (page does not exist)")

-   Fits on a 1GB SD card
-   Low RAM and CPU usage
-   Very smooth UI
-   Auto mount USB
-   AFP support
-   NFS support
-   AirPlay support
-   CEC support
-   Lirc support
-   PVR support
-   Kernel 3.10.9
-   Performance as the default governor
-   Out of the box support for almost all wlan adapters
-   User friendly configuration tool xbian-config
-   Source code on github
-   Large community
-   Debian-based Apt repo so keeping your system up-to-date is easy.



-   [Main Site](http://xbian.org/)
-   [Xbian Github](https://github.com/xbianonpi/xbian)

## RasPlex

RasPlex is an Entertainment Center Solution for Raspberry Pi Simply put,
RasPlex lets you turn your TV into a Smart TV. Similar to the AppleTV,
but completely free and Open Source, RasPlex is basically a set-top box
software. Once RasPlex is stable, it will have support for legacy
console game emulation (NES, SNES, etc), as well as Plex Channels
(Netflix, Crackle, Youtube, etc). RasPlex is a Plex Home Theater Client
More technically stated, RasPlex is a complete port of Plex Home Theater
(formerly Plex Media Center) for Raspberry Pi. RasPlex currently runs on
OpenELEC for reasons of limited manpower, but there is a working
Raspbian port that just needs some time to be brought up to speed.
RasPlex was created on Gentoo linux, but that port has since been
abandoned for performance reasons. We regularly merge in changes from
Plex Home Theater and OpenELEC. Once things cool off a bit and we are
more stable (or we get the manpower), we will maintain a Raspbian
release as well. RasPlex is the Perfect Companion to a Plex Media Server
Many people will use expensive computers as Plex Clients, or have to go
through the inconvenient of plugging a computer into their TV every time
they want to use Plex. With RasPlex, just plug it in and your media is
always ready. Put one on every TV, and have your media everywhere! You
can even put RasPlex on your friend's TV's, and watch your media
remotely.

-   [Download](http://rasplex.com/get-started/download-rasplex.html)
-   [Main Site](http://rasplex.com/)

## PwnPi

-   [http://pwnpi.net/](http://pwnpi.net)

PwnPi is a Linux-based penetration testing Dropbox distribution for the
Raspberry Pi. It currently has 181 network security tools pre-installed
to aid the penetration tester. It is built on the Debian Squeeze image
from the Raspberry Pi foundation's website and uses XFCE as window
manager

## ha-pi

-   [Main Site](https://sourceforge.net/projects/ha-pi/)

Description This Debian Squeeze image created to perform "pwn plug" type
of attacks using Raspberry Pi. Please look at the wiki for further
details [Wiki](https://sourceforge.net/p/ha-pi/wiki/Home/)

## Kali

Kali Linux Features

Kali is a complete rebuild of BackTrack Linux, adhering completely to
Debian development standards. All-new infrastructure has been put in
place, all tools were reviewed and packaged, and we use Git as VCS.

-   More than 300 penetration testing tools: After reviewing every tool
    that was included in BackTrack, we eliminated a great number of
    tools that either did not work or had other tools available that
    provided similar functionality.
-   Free and always will be: Kali Linux, like its predecessor, is
    completely free and always will be. You will never, ever have to pay
    for Kali Linux.
-   Open Git source tree: We are huge proponents of Open Source software
    and our development tree is available for all to see and all sources
    are available for those who wish to tweak and rebuild packages.
-   FHS compliant: Kali has been developed to adhere to the Filesystem
    Hierarchy Standard, allowing all Linux users to easily locate
    binaries, support files, libraries, etc.
-   Wide wireless device support: We have built Kali Linux to support as
    many wireless devices as we possibly can, allowing it to run
    properly on a wide variety of hardware and making it compatible with
    numerous USB and other wireless devices.
-   Custom kernel patched for injection: As penetration testers, the
    development team often needs to do wireless assessments so our
    kernel has the latest injection patches included.
-   Secure development environment: The Kali Linux team is made up of a
    small group of trusted individuals who can only commit packages and
    interact with the repositories while using multiple secure
    protocols.
-   GPG signed packages and repos: All Kali packages are signed by each
    individual developer when they are built and committed and the
    repositories subsequently sign the packages as well.
-   Multi-language: Although pentesting tools tend to be written in
    English, we have ensured that Kali has true multilingual support,
    allowing more users to operate in their native language and locate
    the tools they need for the job.
-   Completely customizable: We completely understand that not everyone
    will agree with our design decisions so we have made it as easy as
    possible for our more adventurous users to customize Kali Linux to
    their liking, all the way down to the kernel.
-   ARMEL and ARMHF support: Since ARM-based systems are becoming more
    and more prevalent and inexpensive, we knew that Kali’s ARM support
    would need to be as robust as we could manage, resulting in working
    installations for both ARMEL and ARMHF systems. Kali Linux has ARM
    repositories integrated with the mainline distribution so tools for
    ARM will be updated in conjunction with the rest of the
    distribution. Kali is currently available for the following ARM
    devices:

rk3306 mk/ss808 Raspberry Pi ODROID U2/X2 Samsung Chromebook

Kali is specifically tailored to penetration testing and therefore, all
documentation on this site assumes prior knowledge of the Linux
operating system. Install
[Download](http://cdimage.kali.org/kali-images/kali-linux-1.0-armel-raspberrypi.img.gz)
If all you want to do is to install Kali on your Raspberry Pi, follow
these instructions:

-   1.Get a nice fast 8 GB (or more) SD card. Class 10 cards are highly
    recommended.
-   2.Download the Kali Linux Raspberry Pi image from our downloads
    area.
-   3.Use the dd utility to image this file to your SD card.

On Windows you can use [win32 disk
imagier](http://www.softpedia.com/progDownload/Win32-Disk-Imager-Download-173006.html)
Guide how to use[win32 disk
imagier](http://www.youtube.com/watch?v=sdSB1GKQIdU)

Alert! This process will wipe out your SD card. If you choose the wrong
storage device, you will wipe out your computer's hard disk.

This process can take a while depending on your USB storage device speed
and image size. Once the dd operation is complete, boot up your Rasberry
Pi with the SD card plugged in. You will be able to log in to Kali (root
/ toor) and startx. That’s it, you’re done!

-   [Main Site](http://www.kali.org/)

## I2Pberry

The Invisible Internet Project (I2P) is a computer network layer that
allows applications to send messages to each other pseudonymously and
securely. Uses include anonymous web surfing, chatting, blogging and
file transfers. The software that implements this layer is called an I2P
router and a computer running I2P is called an I2P node. The software is
Free and Open Source and is published under multiple licenses.

I2Pberry was created to turn a Raspberry Pi into a I2P node through
which you can access all the services offered through I2P. Detailed
installation instructions and alternate download methods are included on
our main site.

-   [Main Site](https://github.com/m6urns/i2pberry)
-   [Torrent](https://github.com/m6urns/i2pberry/blob/master/torrents)

## Bodhi

Bodhi Linux is a small Linux distribution using the
[Enlightenment](http://www.enlightenment.org) window manager and the ARM
build is based on Debian.

If you hit any snags or find bugs with this image please let us know in
the [R\_Pi section of our user
forums](http://forums.bodhilinux.com/index.php?/forum/30-raspberry-pi/)
so we can improve this release.

-   [ARMHF](http://jeffhoogland.blogspot.co.at/2012/07/bodhi-linux-raspberry-pi-beta.html?showComment=1343869408306#c8475812441665709126/)
    announced for Bodhi Linux on R\_Pi
-   [Release
    Announcement](http://jeffhoogland.blogspot.co.at/2012/06/bodhi-linux-arm-alpha-release-for.html)
    from Bodhi Developer Blog
-   [Download](http://sourceforge.net/projects/bodhilinux/files/ARM/RaspBerryPi/)
    from SourceForge.net
-   [what-about-the-raspberry-pi](http://forums.bodhilinux.com/index.php?/topic/2472-what-about-the-raspberry-pi/)
    Forum thread

Alpha Release [| Link Alpha Bodhi
R\_Pi](http://jeffhoogland.blogspot.co.at/2012/06/bodhi-linux-arm-alpha-release-for.html))
User/Password: bodhi/bodhi root/raspberry Beta Release [| Link Beta
Bodhi
R\_Pi](http://jeffhoogland.blogspot.co.at/2012/07/bodhi-linux-raspberry-pi-beta.html)
User/Password: pi/bodhilinux Root: sudo su root/bodhilinux

Bodhi Linux moves ARM branch to
[ARMHF](http://jeffhoogland.blogspot.co.at/2012/08/bodhis-arm-branch-moves-to-armhf.html)
[Download newest Release from
SourceForge.net](http://sourceforge.net/projects/bodhilinux/files/ARMHF/Pi/)
The R\_Pi Bodhi build is built directly on top of Raspbian and
incorporates all of their changes and improvements.

## Gentoo

[Gentoo Linux](http://www.gentoo.org/) is a source based rolling-release
meta-distribution which emphasizes choice and flexibility. [Gentoo
ARM](http://www.gentoo.org/proj/en/base/arm/) aims to be the most up to
date and fastest ARM distribution available.

A [Quick Start
Guide](http://wiki.gentoo.org/wiki/Raspberry_Pi_Quick_Install_Guide)
exists how to install Gentoo on the Raspberry Pi.

[Gentoo Section](http://www.raspberrypi.org/phpBB3/viewforum.php?f=54)
on the official Raspberry Pi forum.

## Adafruit - Occidentalis v0.1

[http://learn.adafruit.com/adafruit-raspberry-pi-educational-linux-distro/occidentalis-v0-dot-1](http://learn.adafruit.com/adafruit-raspberry-pi-educational-linux-distro/occidentalis-v0-dot-1)
Occidentalis v0.1. Rubus occidentalis is the black raspberry. It is
derived from Raspbian Wheezy July 15 Made a few key changes to make it
more hardware-hacker friendly!

-   I2C and hardware SPI support
-   I2C/SPI modules initialized on boot

... Please keep in mind, adafruit is not full time linux distro
maintainers - we will try to fix any bugs we find but this distro is not
for beginners or people who are new to linux!

## Tiny Core Linux

What is Tiny Core?

First, if you don't know what Linux and distributions are, you should
read some interesting and conflicting definitions of Linux. Then, read
about distributions. In short, the Tiny Core distribution is like a
customized version of the Linux kernel and other tools

[Download](http://www.tinycorelinux.net/4.x/armv6/piCore.img.gz)

## RISC OS

RISC OS is a fast and lightweight computer operating system designed in
Cambridge, England by
[Acorn](http://en.wikipedia.org/wiki/Acorn_Computers). First released in
1987, its origins can be traced back to the original team that developed
the ARM microprocessor. RISC OS includes [BBC
BASIC](http://en.wikipedia.org/wiki/BBC_BASIC) which was primarily
conceived to teach programming skills as part of the BBC computer
literacy project.

-   [RISC OS Open](http://www.riscosopen.org/) (ROOL) has released the
    sources. Community members have ported the OS to the BeagleBoard and
    similar hardware
-   In November 2011, RISCOScode.com announced that [RISC OS will be
    available as an alternative
    OS](http://www.riscoscode.com/Pages/Item0113.html) for Raspberry Pi
    <s>from launch</s>
-   [RaspberryPi
    forum](http://www.raspberrypi.org/forum?mingleforumaction=viewtopic&t=919)
    thread
-   [ROOL forum](http://www.riscosopen.org/forum/forums/5/topics/783)
    thread
-   [http://www.pilearn.com/Pages/Page1001.html](http://www.pilearn.com/Pages/Page1001.html)

## Commodore Pi

What It Is... The goal of this project is to develop a native Commodore
64 emulator and operating system for the Raspberry Pi, with the
following features: •Fast boot up time - nearly instant on •Output to
HDMI and composite video sources •GPIO pin connection to external
devices (hooks via the kernal code) •Ethernet connection •USB
Connections •Access to the full RAM of the Pi possibly via bank
switching •Multitasking by means of multiple emulation cores •Modern
graphics modes Think of the project as a Commodore 64 operating system.
It is based on the Comeback64 emulator. The goal will be to include all
of the expected emulation features such as SID sound, sprites, joystick
connectivity, REU access, etc. In time, even the emulation speed could
be changed, as well as additional modern graphics modes. Links

-   [Git Repository](https://github.com/xlar54/Commodore-Pi)
-   [A video of the OS
    running](http://www.youtube.com/watch?v=O-NF8ZiT3QM&feature=youtu.be)
-   [Latest bootable SD
    card](https://googledrive.com/host/0B_3mpqCnipalNDhYWnBOdVVaWlE/CommodorePi_Image.zip)

<!-- -->

    Just copy to your Raspbian card. It has only been tested on composite output

## PiParted

A lot of issues come from people not knowing how to do it right, e.g.
just dropping the img file onto an SD card. So I’ve customised a GParted
LiveCD ISO and written up a custom script to \*hopefully\* install a
distro straight onto an SD card. This is a very early iteration of this
idea, but hopefully will develop into something useful.

At the moment, essentially what it will do is

-   1. Grab the list of Distros from the RPI Download page
-   2. Let the user select which distro he wants to install
-   3. Select the Disk device that he wants to install it onto
-   4. dd the image onto the disk device.
-   5. Flash OS from zip file on SD Card:
-   6. Reset SD Card: This will format an SD Card back to defaults, i.e.
    one vfat partition.
-   [Download](http://sirlagz.net/wp-content/plugins/download-monitor/download.php?id=19)
-   [Main site](http://sirlagz.net/?s=PiPArted+&searchsubmit=)

## PiBang Linux

PiBang linux is a Raspbian-based distribution. PiBang is inspired by
Crunchbang Linux, an i686 and x86\_68 Debian-based distribution. It
comes preconfigured with many helpful scripts and pipemenus as well as a
fork of Raspi-config with increases functions such as support for
changing the user and hostname. PiBang is also one of the heavier
Rasperry Pi distributions boasting a complete package set with favorites
such as Abiword, OMXPlayer, GIMP, and VLC all pre-installed.

[http://www.pibanglinux.org](http://www.pibanglinux.org)

## Plan 9

Plan 9 is a distributed operating system originally designed and
implemented by Ken Thompson, Rob Pike, Dave Presotto, and Phil
Winterbottom @ Bell Labs. It is a lean operating system that has been
ported to super computers such as IBM's Blue Gene down to tiny boards
such the Raspberry Pi.

-   [Distribution disk
    image](http://plan9.bell-labs.com/sources/contrib/miller/9pi.img.gz)
-   [Plan9 subforum @
    raspberryPi.org](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=80)
-   [Acme editor tutorial](http://research.swtch.com/acme)
-   [Plan 9 Main page](http://plan9.bell-labs.com/plan9/)
-   [Plan 9
    wiki](http://www.plan9.bell-labs.com/wiki/plan9/plan_9_wiki/)

## NetBSD

NetBSD is an operating system based off 4.3BSD and is geared towards
embedded systems. There has been an unofficial public release [Download
here](http://downloads.raspberrypi.org/images/netbsd/rpi-20130124/rpi-20130124.img.bz2)
comments about the release
[here](http://www.raspberrypi.org/archives/3145)

## FreeBSD

[Details of the FreeBSD port](http://www.raspberrypi.org/archives/3094)
[Download
here](http://downloads.raspberrypi.org/images/freebsd/freebsd-pi-r245446/freebsd-pi-r245446.img.gz)

## SlaXBMCRPi

SlaXBMCRPi is a minimal Linux distribution based on Slackware ARM that
brings a full-featured XBMC/Kodi solution to your Raspberry Pi. It
allows the user to exit from XBMC/Kodi to the Desktop should he need to
perform typical desktop tasks (browsing, text editing etc.).
There are two pre-built images available:
  **Developer:** Weighs 3.2GB and contains all development packages
required to compile the Linux kernel, XBMC and other XBMC-related (or
not) packages
  **Minimal:** Weighs 1.9GB and contains only the packages required to
run XBMC. (Does not include Midori and relevant dependencies)

-   [Main Site](http://slaxbmc.blogspot.co.uk/)
-   [Developer
    Image](http://slackware.org.uk/slaxbmc/14.1/slaxbmcrpi-14.1-developer.img.xz)
-   [Minimal
    Image](http://slackware.org.uk/slaxbmc/14.1/slaxbmcrpi-14.1-minimal.img.xz)
-   [Manual Installation
    Packages](http://slackware.org.uk/slaxbmc/14.1/slaxbmcrpi-14.1/)
-   [Source
    Code](http://slackware.org.uk/slaxbmc/14.1/slaxbmcsrc-14.1/sourcerpi/)
-   [Installation Instructions
    (Windows/Linux)](http://slackware.org.uk/slaxbmc/14.1/slaxbmcrpi-14.1/INSTALL.TXT)

## PiMAME

Raspberry Pi distribution geared towards emulating video games.
Maintained by [Shea Silverman](http://blog.sheasilverman.com)

-   [Main
    site](http://blog.sheasilverman.com/pimame-raspberry-pi-os-download/)

## PiBox

*PiBox* provides a build system based on Crosstool-NG,
Buildroot/Busybox, the Linux kernel, Rasperry Pi firmware and
installation tools to create a base system that can be installed to an
SD card to boot a Raspberry Pi. The base system serves as a foundation
on which opkg based extensions such as XBMCBox can be installed. PiBox
originated as a build system and has been extended with opkgs to the
media distributions. It's current focus is to provide a lightweight
system for providing services (wifi webcam, media server, platform for
DLP display) for [travel
trailers](http://redmine.graphics-muse.org/news/10), though this is just
an initial target audience.

**PiBox Development Platform** is the official name of the core build
system. It provides the platform on which the following two products are
based.

**PiBox Media Server** is a purpose-specific implementation built on
PiBox with a goal of providing a media server that can stream webcam
video and serve video files over SMB. This is accomplished by adding
custom opkg installs on the base PiBox development platform. The PiBox
Media Server can be used as a node on a network or as a wireless access
point. Future plans include support for sensor management making it
similar to a home monitoring system.

**PiBox Media Player** is a purpose-specific implementation built on
PiBox with a goal of providing a remote media player companion to the
Media Server. The player is intended to integrate with PiBox Media
Server over wifi with the server acting as a wireless access point.
HDMI-based DLP projectors for use as a personal Drive In Theater
experience. This is also accomplished by adding custom opkg installs on
the base PiBox development platform.

PiBox Media Server and PiBox Media Player are consumer oriented
distributions for distributed media playback in travel trailers without
Internet connectivity. The UI is based on GTK+ with Cairo and the system
runs on the Raspberry Pi optimized PiBox Developement Platform
distribution.

PiBox is currently a one man project. I'd like to have more users of the
system and welcome new developers. To get started using the system
please download the tarball, unpack it and use the mksd card to format
your SD card. Then use the mkinstall script to install the distribution
to the SD card. To get started with development, please read the
developer wiki on how to build the [PiBox Development
Platform](http://www.graphics-muse.org/wiki/pmwiki.php/RaspberryPi/Software).

Contact me at mjhammel@graphics-muse.org or if you're interested in
helping out, have ideas for improvement or just want to know how to use
the system.

Created and maintained by [Michael J.
Hammel](http://www.graphics-muse.org)

-   [Web
    Site](http://www.graphics-muse.org/wiki/pmwiki.php/RaspberryPi/RaspberryPi)
-   [Binary Downloads](http://www.graphics-muse.org/archives/pibox/)
-   [Screenshots and
    videos](http://www.graphics-muse.org/wiki/pmwiki.php/RaspberryPi/ScreenShots)
-   [Issue
    Tracker](http://redmine.graphics-muse.org/projects/pibox/issues)
-   [Git](https://gitorious.org/pibox)

## OpenWrt

OpenWrt is described as a Linux distribution for embedded devices.

The Raspberry Pi is now supported by the Barrier Braker release
(14.07-rc1) available here:

[http://downloads.openwrt.org/barrier\_breaker/14.07-rc1/brcm2708/generic/](http://downloads.openwrt.org/barrier_breaker/14.07-rc1/brcm2708/generic/)

The Raspberry Pi is also supported by the older Attitude Adjustment
release (12.09-beta) available here:

[http://downloads.openwrt.org/attitude\_adjustment/12.09-beta/brcm2708/generic/](http://downloads.openwrt.org/attitude_adjustment/12.09-beta/brcm2708/generic/)

The daily trunk is now finally available here:

[http://downloads.openwrt.org/snapshots/trunk/brcm2708/](http://downloads.openwrt.org/snapshots/trunk/brcm2708/)

You should mirror those files if you want to use them because they are
built daily.

OpenWrt Wiki for Raspberry Pi
[http://wiki.openwrt.org/toh/raspberry\_pi](http://wiki.openwrt.org/toh/raspberry_pi)

Related links:

-   [http://www.zoobab.com/raspberry-pi-openwrt](http://www.zoobab.com/raspberry-pi-openwrt)
-   [http://thread.gmane.org/gmane.comp.embedded.openwrt.devel/14815](http://thread.gmane.org/gmane.comp.embedded.openwrt.devel/14815)
-   [openWRT
    Thread](https://forum.openwrt.org/viewtopic.php?pid=173937#p173937)
    about Raspberry Pi status

## Nard

Nard is a software development kit (SDK) written from scratch for the
Raspberry Pi family of boards. Unlike Raspbian, which primarily is for
desktop use, Nard focuses on embedded systems 24x7 over years. It has
many features requested by industrial users.

[http://www.arbetsmyra.dyndns.org/nard/](http://www.arbetsmyra.dyndns.org/nard/)

## Volumio

Volumio is described as an Audiophile Music Player solution for
Raspberry PI and embedded single board computers. Evolution of [RaspyFi
project](http://www.raspyfi.com) it is based on a custom minimal Debian
system fine tuned for Bit Perfect Audio Playback. It is designed to be
operated in headless mode, controlling and configuring it via its WebUI
or from third party clients.

Features:

    •Ready to play: flash it and you're ready
    •Audiophile Quality: fine tuned ALSA for bit perfect and low latency playback
    •Control it via integrated Webui with PC, Smartphone, Tablet
    •FLAC, WAV, MP3, AAC, ALAC, PLS, Muse, DSD, OGG playback
    •Easy configuration of Wi-Fi networking and  NAS Mounts
    •Airplay, UPNP, DLNA and WebRadios playback capability
    •Audio out via HDMI, USB, Analog Jack, S/PDIF, I2S (depends on platform)
    •All Raspberry PI i2s DACs supported
    •Multiroom Playback via Android App

Related links:

-   [Project Homepage](http://volumio.org)
-   [Forum](http://volumio.org/forum)
-   [Wiki](http://wiki.volumio.org/)

## Kano OS

Kano is a fast and fun OS for the Raspberry Pi, pre-installed with
modified Minecraft Pi and Chromium.

Related links:

-   [Kano Homepage](http://kano.me)

## MINIBIAN

MINIBIAN is a minimal Raspbian-based Linux image for Raspberry Pi. The
main focus is to have a small, updated and stable distribution that is
fully compatible with official Raspbian “Wheezy” image, without GUI and
unneeded tools. So this image is perfect for embedded projects, or
wherever you need to use all RPi resources for your specific tasks. The
main advantage is that MINIBIAN has a very small footprint, boots in
some seconds and uses just few of precious RPi RAM. Unlike other similar
projects, MINIBIAN has not been obtained purging unneeded packages from
original image, neither recompiling the source code: it’s just a
customized Raspbian installation obtained from the same repository used
for official RPi Wheezy image. So kernel and binary files are exactly
the same you will find on standard image, with the difference that
MINIBIAN fit on 512Mb SD Card, is fastest, and more frequently updated.

Related links:

-   [Minibian Homepage](http://minibianpi.wordpress.com/)
-   [Minibian Sourceforge
    Page](http://sourceforge.net/projects/minibian/)

## slrpi

Slrpi (slackware/raspberry pi) is a minimal installation of Slackware
ARM on a Raspberry Pi. It is built with the mini root filesystem and the
Raspbian image.

Related links:

-   [slrpi Sourceforge Page](https://sourceforge.net/projects/slrpi/)

## motionPie

motionPie is a video surveillance distro for the Raspberry PI based on
BuildRoot and Motion.

Related links:

-   [Homepage](https://github.com/ccrisan/motionPie)
-   [Downloads](https://github.com/ccrisan/motionPie/releases)
-   [Install
    Instructions](https://github.com/ccrisan/motionPie/wiki/Installation)

## Slackware ARM

Slackware ARM's primary goal is to provide (as near as possible) a full
port of Slackware x86. Some packages have not been built since they are
x86 only, whilst some have been added to support ARM platforms.
Slackware is the longest surviving-- currently maintained-- Linux
distribution available and is still the most "UNIX-like" Linux
distribution out there. Slackware complies with the published Linux
standards, such as the Linux File System Standard and has always
considered simplicity and stability paramount. As a result, Slackware
has become one of the most popular, stable, and friendly distributions
available. There's a vast number of people running Slackware ARM on
their RPis. Since before the release of Slackware ARM 14.0, there have
been a number of community efforts to bring Slackware to the Raspberry
Pi. From preinstalled images to full installation guides, Slackware ARM
has a thriving community of Raspberry Pi users, and is very well
supported in that respect. Slackware has always been well known for its
reliability, power, and versatility, and that's exactly what you will
find when running it on the Raspberry Pi. The Slackware-on-Raspberry Pi
community caters for all the original RPi versions as well as the latest
Raspberry Pi 2 model B.

Slackware ARM is not supported by the Raspberry Pi Foundation. The
Raspberry Pi is only supported by the Slackware community, outside of
the official Slackware ARM tree.

Related links:

-   [Slackware-on-Raspberry Pi Community
    Page](http://docs.slackware.com/howtos:hardware:arm:raspberrypi)
-   [Slackware ARM
    Forum](http://www.linuxquestions.org/questions/slackware-arm-108)
-   [SARPi - Slackware ARM on a Raspberry Pi 1 installation
    guide](http://rpi.fatdog.eu)
-   [SARPi2 - Slackware ARM on a Raspberry Pi 2 installation
    guide](http://rpi2.fatdog.eu)
-   [Slackware ARM preinstalled Raspberry Pi
    images](http://stanleygarvey.com/slackwarearm_rpi/index.php)
-   [Slackware ARM 13.37 on the Raspberry Pi 1 model
    A/B](http://www.daves-collective.co.uk/raspi/)

# Available ARMv7 distributions

## Ubuntu

[Ubuntu](http://www.ubuntu.com/) was initially planned to be the default
distribution, but the current version of Ubuntu only supports ARMv7
onwards, not the ARMv6 architecture used by the Raspberry Pi's processor
(until Pi 2). Therefore Ubuntu does not work on Raspberry Pi 1, and
there is no further information about this changing in the near future.

A bug report on this subject was submitted to Ubuntu's bug tracker. The
responses to that bug include an unofficial viewpoint from a Canonical
employee, outlining the amount of work required to support ARMv6 (and
therefore, potentially, Raspberry Pi 1). See [Bug
848154](https://bugs.launchpad.net/ubuntu/+bug/848154)

[https://wiki.ubuntu.com/ARM](https://wiki.ubuntu.com/ARM)

## Windows 10 IoT Core Edition

Windows 10 Internet of Things Core Edition is available as preview
version at the moment, with the release of it it will be available to
the maker and IoT community for free.

Related links:

-   [Windows on Devices Home](https://dev.windows.com/en-US/iot)
-   [Detailed Setup and Admin Guide
    (German)](http://raspberry.tips/raspberrypi-tutorials/windows-10-iot-auf-dem-raspberry-pi-2-installieren/)

# Announced distributions

The following distributions have been announced and may have been
publicly demonstrated but distributions are not generally available
quite yet.

## Firefox OS

-   [news](https://www.google.ca/search?q=firefoxos+site%3Awww.raspberrypi.org)

## OpenSuSE

[https://en.opensuse.org/Portal:ARM](https://en.opensuse.org/Portal:ARM)

An ARM port of OpenSuSE has existed for several years. Since July 2012
it been available as well for the Raspberry Pi.

The status is currently beta. The OpenSuSE RPi image is minimalistic,
without YaST. Installation of required and optional software and
performing updates are quite simple with zypper, the same as on x86.

Current infomation is gathered at the RPI Forum:
[http://www.raspberrypi.org/phpBB3/viewforum.php?f=87](http://www.raspberrypi.org/phpBB3/viewforum.php?f=87)

## Meego MER & XBMC

The MeeGo MER project provides a Linux-based, Open Source software
platform for the next generation of computing devices. The MeeGo MER
software platform is designed to give developers the broadest range of
device segments to target for their applications, including netbooks,
handheld computing and communications devices, in-vehicle infotainment
devices, smart TVs, tablets and more – all using a uniform set of APIs
based on Qt. XBMC is an award-winning free and open source (GPL)
software media player and entertainment hub for digital media. Meego TV
1.2 uses XBMC as a reference GUI (that is, a starting point for creating
a custom GUI).

-   [http://www.madeo.co.uk/?p=783](http://www.madeo.co.uk/?p=783)
-   [http://www.madeo.co.uk/?page\_id=605](http://www.madeo.co.uk/?page_id=605)
-   [http://wiki.meego.com/User:Vgrade\#Raspberry\_Pi](http://wiki.meego.com/User:Vgrade#Raspberry_Pi)
-   [http://wiki.merproject.org/wiki/Community\_Workspace/RaspberryPi](http://wiki.merproject.org/wiki/Community_Workspace/RaspberryPi)
-   [https://github.com/xbmc/xbmc-rbp](https://github.com/xbmc/xbmc-rbp)

## Puppy

Puppy Linux is designed to be a tiny Linux distribution (\<100MB). One
distro version of Puppy for ARM is [SAP6 Debian6 armel
binaries](http://distro.ibiblio.org/quirky/arm/test/raspi-sap-5.95-alpha1/sap-5.95-alpha1-readme.htm)
and another [PuppiPlan](http://puppylinux.org/wikka/PuppiPlan) all under
the [Puppy](http://puppylinux.org/wikka/PARM) initiative. [Puppy
Linux](http://en.wikipedia.org/wiki/Puppy_Linux) is going back to his
roots. Designed to run from 256MB of RAM. Making every bit count. Join
the [Puppy geek
adventure](http://www.murga-linux.com/puppy/viewtopic.php?p=526#526) for
2012. Woof Woof

## RPi-Buildroot

RPi-Buildroot is a set of Makefiles and patches that make it easy to
generate a complete customized embedded Linux system for your Raspberry
Pi. This distro is based on [Buildroot](http://buildroot.uclibc.org/) so
it's perfect for somebody looking to build a trimmed-down or
task-specific system.

Please note that this distro is intended for **advanced users**.

-   [More
    Information](https://github.com/gamaral/rpi-buildroot/blob/rpi/README.md)
-   [Git Repository](https://github.com/gamaral/rpi-buildroot/)
-   [Test-drive SD card images and
    toolchain](http://guillermoamaral.com/read/rpi-buildroot/)
-   [Marshmallow Entertainment
    System](http://guillermoamaral.com/read/mes/)

## Aros Hosted on Linux

[Aros](http://www.aros.org) is an Open Source Amiga like operating
system (OS) at the API level. This version runs as a task under Linux to
take advantage of the drivers available inside the GNU Linux OS core.

## Android

Discuss: [Forum at
raspberrypi.org](http://www.raspberrypi.org/phpBB3/viewforum.php?f=73)

[Wiki & Main site](http://androidpi.wikia.com/wiki/Android_Pi_Wiki)



## ANDROID TRANSPORTER

The Android Transporter allows you to share display content wirelessly
with remote screens in real time. Please be aware that the Transporter
is still a technology study and it is missing the maturity of a
full-featured product. However, we think that the Android Transporter is
already exciting enough to let you play around with it. We believe that
with the recently released Miracast standard you will get a very similar
technology in upcoming Android devices, and we are considering making
the Transporter compliant with the Miracast specs.

QUICK START GUIDE Let’s start with the Asus Nexus 7. By installing the
Android Transporter firmware on your Asus Nexus 7 all data on the device
will be removed including the contents of the /sdcard directory! So
maybe you want to backup some data before you begin. To start, enable
USB debugging on your Nexus 7 by switching on this option under Settings
-\> Developer options. Next, unlock the bootloader of your Nexus 7
device. This will void your device warranty and it will also do a
factory reset! Install the adb and fastboot utilities. On Microsoft
Windows you will also need Google’s USB drivers. Just search the
Internet for instructions how to install this tools. Unlocking the
bootloader is done by getting the device into the bootloader using the
adb reboot bootloader command. Now unlock it with the fastboot oem
unlock command.
[Download](http://esrlabs.com/downloads/ESRLabs-Asus-Nexus-7-Android-Transporter-2012-10-04.zip)
the Android Transporter firmware for the Asus Nexus 7 and unpack it.
Reboot your Nexus 7 device into the bootloader using adb reboot
bootloader. In the Android-Transporter directory you will find the flash
script, which is called flash-all.sh. Be aware that the fastboot utility
has to be available in the PATH environment for the flash script.
Execute the flash script. Your Asus Nexus 7 is now ready. To switch back
to the original Nexus 7 firmware image you should first download it
from[Google’s factory images
site.](https://developers.google.com/android/nexus/images#nakasi) Then
you can flash the original firmware image using the same instructions
that you used to flash the Android Transporter firmware image.

Let’s move on to the Raspberry Pi.
[Download](http://esrlabs.com/downloads/esrlabs-rpi-android-transporter-2012-10-02.zip)
the Android Transporter firmware for the Raspberry Pi and unpack it.
Insert an SD card into your card reader and flash the firmware image
using the dd utility: sudo dd bs=1M
if=esrlabs-rpi-android-transporter-2012-10-02.img of=/dev/sdX.
Substitute /dev/sdX with the real SD card device name. For more
information on flashing the Raspberry Pi see the Embedded Linux Wiki
page for the Raspberry Pi. The Raspberry Pi is now also ready.

Next, you have to set up the networking between the two devices. You can
either connect both devices to your home router or you can make use of
the Raspberry Pi Wi-Fi hotspot. Both scenarios require the Raspberry Pi
to be plugged into your home router. The Wi-Fi hotspot works with USB
Wi-Fi adapters that are supported by the Realtek rtl8192cu Linux driver.
We tested the Wi-Fi hotspot with the Netgear N150 Microadapter and with
the Asus N13 Wi-Fi Stick. It works well with both Wi-Fi sticks except
that we occasionally had some power consumption issues with the Asus
device. If you want to make use of the Wi-Fi hotspot plug in the stick
before the Raspberry Pi starts up. The network name of the Wi-Fi hotspot
is RaspberryPiAP and the default password is E.S.R.Labs. The Wi-Fi
hotspot may have the advantage that the Android Transporter has its own
dedicated network to minimize the latency jitter during screen
mirroring. If you connect both devices to your home router please make
sure that the Wi-Fi transmitting power of your router is set to high.
Otherwise you may experience high packet loss, which is bad for the
Android Transporter.

When you now connect your Nexus 7 to the Wi-Fi network and start the
Android Transporter you should see the Raspberry Pi in the list of
available media hubs. The Raspberry Pi has announced itself as media
sink via service discovery. Just tap on the Raspberry Pi item to start
the screen mirroring. If you want to stop the screen mirroring just pull
down the notification bar and click the Android Transporter “Switch off”
item.

By default the Android Transporter will make use of the H.264 over RTP
over UDP streaming protocols according to RFC3984. If you are in a
building with a lot of Wi-Fi networks, it may be possible that the
Android Transporter does not work really well because of high packet
loss. If that is the case you should switch to the H.264 over RTP over
TCP streaming protocols according to RFC3984 and RFC4571. You can do
this in the preferences of the Android Transporter app. The latency will
typically be around 20-30ms higher when using the reliable TCP transport
protocol.

Enjoy the Android Transporter tech demo .

The Android Transporter is a custom ROM and not an app since we had to
make adjustemts to various parts of the Android platform to make it
happen.



# Related links

-   [http://amigaworld.net/modules/newbb/viewtopic.php?topic\_id=35843&forum=48](http://amigaworld.net/modules/newbb/viewtopic.php?topic_id=35843&forum=48)
-   [http://www.raspberrypi.org/archives/tag/aros](http://www.raspberrypi.org/archives/tag/aros)
-   [Youtube
    videos](http://www.youtube.com/results?search_query=raspberry+pi+aros&oq=raspberry+pi+aros&gs_l=youtube.3..0.614.4729.0.4969.11.9.0.0.0.0.370.1872.1j4j2j2.9.0...0.0...1ac.1.m-tiINLoemg)
-   [http://www.amiga.org/forums/archive/index.php/t-62135.html](http://www.amiga.org/forums/archive/index.php/t-62135.html)

# References

1.  [↑](#cite_ref-1) [osmc on
    github](https://github.com/samnazarko/osmc)

-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

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

[Software](http://eLinux.org/RPi_Software "RPi Software") - **Distributions** -
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

