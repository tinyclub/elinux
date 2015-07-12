> From: [eLinux.org](http://eLinux.org/RPi_VerifiedPeripherals "http://eLinux.org/RPi_VerifiedPeripherals")


# RPi VerifiedPeripherals





<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Notes">1 Notes</a></li>
<li><a href="#Power_Usage_Notes">2 Power Usage Notes</a></li>
<li><a href="#Linux_Driver_Issues">3 Linux Driver Issues</a></li>
<li><a href="#Powered_USB_Hubs">4 Powered USB Hubs</a></li>
<li><a href="#USB_Remotes">5 USB Remotes</a></li>
<li><a href="#USB_Keyboards">6 USB Keyboards</a></li>
<li><a href="#USB_Mouse_devices">7 USB Mouse devices</a></li>
<li><a href="#USB_Real_Time_Clocks">8 USB Real Time Clocks</a></li>
<li><a href="#Internet">9 Internet</a>
<ul>
<li><a href="#USB_Wi-Fi_Adapters">9.1 USB Wi-Fi Adapters</a></li>
<li><a href="#USB_Bluetooth_adapters">9.2 USB Bluetooth adapters</a></li>
<li><a href="#USB_Ethernet_adapters">9.3 USB Ethernet adapters</a></li>
<li><a href="#USB_3G_Dongles">9.4 USB 3G Dongles</a>
<ul>
<li><a href="#Huawei">9.4.1 Huawei</a></li>
<li><a href="#Sierra_Wireless">9.4.2 Sierra Wireless</a></li>
<li><a href="#ZTE">9.4.3 ZTE</a></li>
<li><a href="#Others">9.4.4 Others</a></li>
</ul></li>
</ul></li>
<li><a href="#USB_Sound_Cards">10 USB Sound Cards</a>
<ul>
<li><a href="#Databases_of_supported_sound_cards">10.1 Databases of supported sound cards</a></li>
<li><a href="#Class_compliant_USB_sound_cards">10.2 Class compliant USB sound cards</a></li>
<li><a href="#Troubleshooting">10.3 Troubleshooting</a></li>
</ul></li>
<li><a href="#USB_IR_Receivers">11 USB IR Receivers</a></li>
<li><a href="#USB_Radio_devices">12 USB Radio devices</a></li>
<li><a href="#USB_TV_Tuners_and_DVB_devices">13 USB TV Tuners and DVB devices</a></li>
<li><a href="#USB_Video_.2F_Frame_grabbers">14 USB Video / Frame grabbers</a></li>
<li><a href="#USB_Webcams">15 USB Webcams</a></li>
<li><a href="#USB_GPS_devices">16 USB GPS devices</a></li>
<li><a href="#USB_UART_and_USB_to_Serial_.28RS-232.29_adapters">17 USB UART and USB to Serial (RS-232) adapters</a>
<ul>
<li><a href="#Working_USB_to_Serial_Adapters">17.1 Working USB to Serial Adapters</a></li>
<li><a href="#Problem_USB_to_Serial_Adapters">17.2 Problem USB to Serial Adapters</a></li>
</ul></li>
<li><a href="#USB_Multi-Card_Readers">18 USB Multi-Card Readers</a>
<ul>
<li><a href="#Working_USB_Multi-Card_Readers">18.1 Working USB Multi-Card Readers</a></li>
<li><a href="#Problem_USB_Multi-Card_Readers">18.2 Problem USB Multi-Card Readers</a></li>
</ul></li>
<li><a href="#Other.2C_exotic_USB_devices">19 Other, exotic USB devices</a>
<ul>
<li><a href="#Joysticks_.2F_Joypads">19.1 Joysticks / Joypads</a></li>
<li><a href="#Numpads">19.2 Numpads</a></li>
<li><a href="#USB_to_Parallel_Port.2FPrinter_Adapters">19.3 USB to Parallel Port/Printer Adapters</a></li>
<li><a href="#USB_to_IDE.2FSATA">19.4 USB to IDE/SATA</a></li>
<li><a href="#CAN_Bus">19.5 CAN Bus</a></li>
<li><a href="#Home_automation">19.6 Home automation</a></li>
<li><a href="#Weather_station">19.7 Weather station</a></li>
<li><a href="#One-Wire">19.8 One-Wire</a></li>
<li><a href="#Touch_Screen">19.9 Touch Screen</a></li>
<li><a href="#Floppy_Disk_Drive">19.10 Floppy Disk Drive</a></li>
<li><a href="#USB_Missile_Launcher">19.11 USB Missile Launcher</a></li>
<li><a href="#USB_Docking_Stations">19.12 USB Docking Stations</a></li>
<li><a href="#USB_RFID_Reader">19.13 USB RFID Reader</a></li>
<li><a href="#JTAG">19.14 JTAG</a></li>
<li><a href="#Tinkerforge_Bricks_and_Bricklets_.28http:.2F.2Fwww.tinkerforge.com.29">19.15 Tinkerforge Bricks and Bricklets (http://www.tinkerforge.com)</a></li>
<li><a href="#Thermometers">19.16 Thermometers</a></li>
<li><a href="#Fingerprint_Scanners">19.17 Fingerprint Scanners</a>
<ul>
<li><a href="#Futronic">19.17.1 Futronic</a></li>
</ul></li>
</ul></li>
<li><a href="#PS2_.2F_AT_to_USB_Converters">20 PS2 / AT to USB Converters</a></li>
<li><a href="#Power_Switches">21 Power Switches</a></li>
<li><a href="#Power_adapters">22 Power adapters</a>
<ul>
<li><a href="#Working_power_Adapters">22.1 Working power Adapters</a></li>
<li><a href="#Problem_power_Adapters">22.2 Problem power Adapters</a></li>
<li><a href="#Working_external_Battery_packs_.28with_5.C2.A0V_regulated_output.29">22.3 Working external Battery packs (with 5 V regulated output)</a></li>
</ul></li>
<li><a href="#LCD_touch_screen_add-ons">23 LCD touch screen add-ons</a></li>
<li><a href="#Display_adapters">24 Display adapters</a>
<ul>
<li><a href="#HDMI-.3EDVI-D_cables">24.1 HDMI-&gt;DVI-D cables</a></li>
<li><a href="#HDMI-.3EVGA_Cables">24.2 HDMI-&gt;VGA Cables</a></li>
<li><a href="#HDMI-.3EVGA_converter_boxes">24.3 HDMI-&gt;VGA converter boxes</a></li>
<li><a href="#DVI-D_-.3E_VGA_active_adapters">24.4 DVI-D -&gt; VGA active adapters</a></li>
<li><a href="#Composite-.3ESCART">24.5 Composite-&gt;SCART</a></li>
<li><a href="#Composite-.3EVGA_converter_boxes">24.6 Composite-&gt;VGA converter boxes</a></li>
</ul></li>
<li><a href="#Boblight_hardware">25 Boblight hardware</a></li>
<li><a href="#SD_cards">26 SD cards</a></li>
<li><a href="#Foreign_Language_Translations">27 Foreign Language Translations</a></li>
<li><a href="#References">28 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Hardware & Peripherals:**

*[Hardware](http://eLinux.org/RPi_Hardware "RPi Hardware") and [Hardware
History](http://eLinux.org/RPi_HardwareHistory "RPi HardwareHistory").*

*[Low-level
Peripherals](http://eLinux.org/RPi_Low-level_peripherals "RPi Low-level peripherals") and
[Expansion Boards](http://eLinux.org/RPi_Expansion_Boards "RPi Expansion Boards").*

*[Screens](http://eLinux.org/RPi_Screens "RPi Screens"), [Cases](http://eLinux.org/RPi_Cases "RPi Cases")
and **Other Peripherals**.*


 **A note about this page: For USB devices, please specify if they
required a powered hub**

## Notes

19-Apr-2012: Now that the Model B board is shipping, details added
should relate to this board and the [default Debian
distribution](http://www.raspberrypi.org/downloads) unless stated
otherwise. A suggested suffix markup scheme is as follows:

-   (A) - Relates to model A production board
-   (B) - Relates to model B production board
-   (!) - Information from alpha and beta board days -- beta board
    verified peripherals should still apply to production boards for the
    most part, but the alpha board is fairly different
-   No markup - relates to all production boards

*Discuss:
[http://www.raspberrypi.org/forum/?mingleforumaction=viewtopic&t=247](http://www.raspberrypi.org/forum/?mingleforumaction=viewtopic&t=247)*

If you are adding to a product list it would help clarity if entries are
kept/added in alphabetical order.

## Power Usage Notes

<table>
<tbody>
<tr class="odd">
<td align="left"><img src="http://elinux.org/images/thumb/5/51/Attention_niels_epting.svg/18px-Attention_niels_epting.svg.png" alt="Warning" /> <strong>Warning</strong>:</td>
<td align="left">Adding peripherals may increase the loading on the power supply to your board and this, in turn, may affect the voltage presented to the Raspberry Pi. If the Raspberry Pi's supply voltage falls below a certain value (anecdotally stated as around 4.75 V), or it begins to fluctuate, your setup may become unstable. There is a <a href="http://elinux.org/RPi_Hardware#Power">Wiki section about this issue</a> which is worth a read.</td>
</tr>
</tbody>
</table>

**Model B Hardware Revisions and USB Power limits** **Hardware Revision
1.0** The original Model B board had current limiting polyfuses which
limited the power output of each USB port to approximately 100 mA. USB
devices using more than 100 mA had to be connected via a powered hub.
The Raspberry Pi's PSU was chosen with a power budget of 700 mA of which
200 mA were assigned to the USB ports, so the Raspberry Pi's (poly)fuses
were designed only for devices up to 100 mA, and typical 140 mA
polyfuses will have as much as 0.6 volt across them when drawing
currents near the 100 mA limit. As a consequence the USB ports are only
directly suitable for "single current unit" USB devices which, according
to USB specifications, are designed to work with just 4.4 Volt. Not only
do non single current unit devices draw more current (causing greater
Voltage drops, and greater stress on the fuses), they also might require
4.75 Volt to work.

**Model B Hardware Revision 2.0 and Revision 1.0 with ECN0001 change**
This had the polyfuses removed, removing the 100 mA current limitation
for each USB port (but leaving the main fuse F3 intact). Users should
still ensure their power supply can power the Raspberry Pi and the USB
peripherals. Revision 2.0 was released in August 2012.
![Warning](http://eLinux.org/images/thumb/5/51/Attention_niels_epting.svg/18px-Attention_niels_epting.svg.png)
**Warning**: Because the polyfuses have been removed, back feeding of
the PI, by applying power via its normal USB output, can damage D 17 if
triggered by an over-voltage, and so lead to consequential over-heating.
This can be discovered by melts, scorching, smoke or
worse.[[1]](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=28&t=34149)

## Linux Driver Issues

Shortly after the Raspberry Pi was released it was confirmed that there
were a number of issues with the Linux USB driver for the SMSC95xx chip.
These included problems with USB 1.x peripherals that use split
transactions, a fixed number of channels (causing problems with Kinect)
and the way the ARM processor handles the SMSC95xx interrupts.
[[2]](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=28&t=12097&start=76)
[[3]](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=28&t=5249&start=44)
A large number of fixes were included in the 2012-08-19-Wheezy-raspbian
Linux image.

## Powered USB Hubs

This section has been moved to a separate page. See [RPi Powered USB
Hubs](http://eLinux.org/RPi_Powered_USB_Hubs "RPi Powered USB Hubs")

## USB Remotes

-   The
    [FLIRC](http://www.pi-supply.com/product/flirc-usb-ir-remote-dongle-for-raspberry-pi/)
    USB dongle allows the use of any remote control with your Raspberry
    Pi. Configure the device on your desktop PC, then simply plug into
    your Pi for a perfect media center companion. Available from [Pi
    Supply](http://www.pi-supply.com/) and [The Pi
    Hut](http://thepihut.com/)

-   ASUS TV FM Remote IR - ID 3353:3713 - works. Receiver connected to
    an USB Hub. Tested with archlinux in X. It works also as pointer
    (pressing "Toggle" button)

-   ATI Remote Wonder (X10 Wireless Technology, Inc. X10 Receiver) — ID
    0bc7:0004 — appears as a joystick-like 2 button mouse and a 0-9
    keypad without drivers on console and X.

-   [Logitech Wireless Touch Keyboard K400 with Built-In Multi-Touch
    Touchpad
    (920-003070)](http://www.amazon.com/gp/product/B005DKZTMG/ref=oh_details_o02_s00_i00)
    - keyboard and touchpad work. Have not verified multi-touch
    features.

-   [iPazzport](http://www.ipazzport.com/02A.html) mini 2.4 GHz wireless
    keyboard and touchpad.

-   Pan.Code D1000 - 2.4GHz Wireless keyboard and touchpad.

-   [PKB
    1800](http://www.ortek.com/html/pdt_view.asp?area=46&cat=152&sn=76)
    Wireless Smart Pad ad Mini Keyboard. The pad works as a mouse, but
    not multi touch features. The keyboard works.

-   [Riitek RT-MWK01](http://www.riitek.com/product_Info.asp?id=56)
    **Rii** Wireless 2.4 GHz Keyboard-mouse Combo, also known as
    [Digicom
    WKEYPE01](http://www.digicom.it/digisit/prodotti.nsf/itprodottiidx/WKEYPE01),
    and [Prodige Nanox](http://www.verkkokauppa.com/fi/product/52783).
    Working perfectly, just plug & play.

-   [Tranksung
    TS-Y150](https://www.google.com/search?q=tranksung+TS-Y150) USB RF
    Keyboard and air mouse (B)

-   [Exo Ultra U12-41310 Mini
    Keyboard](http://www.tigerdirect.com/applications/SearchTools/item-details.asp?EdpNo=6753651&CatId=3680#)
    Bluetooth Adapter, Touchpad, Laser Pointer, Presentation &
    Multimedia Controls work perfectly, but it needs a little love and
    config for make it work.[Exo Installer
    script](https://github.com/thunderbirdtr/rs-pi-exo-keyboard)

## USB Keyboards

This section has been moved to a separate page. See [RPi USB
Keyboards](http://eLinux.org/RPi_USB_Keyboards "RPi USB Keyboards")

## USB Mouse devices

This section has been moved to a separate page. See [RPi USB Mouse
devices](http://eLinux.org/RPi_USB_Mouse_devices "RPi USB Mouse devices")

## USB Real Time Clocks

-   Cymbet
    -   Cymbet CBC-EVAL-06 USB Real Time Clock (FT2232 to SPI to
        RV-2123)

Device information at
[http://www.cymbet.com/pdfs/DS-72-22.pdf](http://www.cymbet.com/pdfs/DS-72-22.pdf)
Code to access the RTC from Linux:
[https://github.com/owendelong/Cymbet-RTC](https://github.com/owendelong/Cymbet-RTC)
Does not require a powered hub.

## Internet

### USB Wi-Fi Adapters

This section has been moved to a separate page. See [RPi USB Wi-Fi
Adapters](http://eLinux.org/RPi_USB_Wi-Fi_Adapters "RPi USB Wi-Fi Adapters")

### USB Bluetooth adapters

This section has been moved to a separate page. See [RPi USB Bluetooth
adapters](http://eLinux.org/RPi_USB_Bluetooth_adapters "RPi USB Bluetooth adapters")

### USB Ethernet adapters

This section has been moved to a separate page. See [RPi USB Ethernet
adapters](http://eLinux.org/RPi_USB_Ethernet_adapters "RPi USB Ethernet adapters")

### USB 3G Dongles

#### Huawei

-   E1750 [installation
    instructions](https://shkspr.mobi/blog/2012/07/3g-internet-on-raspberry-pi-success)
-   E173
-   E1820 Works on Raspbian with Sakis3G
-   E220 [installation
    instructions](http://raspberry-at-home.com/installing-3g-modem/)
-   E353 HiLink Works on Raspbian
-   E160 (AT commands only)
-   E169, E620, E800, (12d1:1001) - works on Raspbian Wheezy, [details
    here](https://github.com/sk-vpohybe/stopa-monitor/wiki/3G-modem-Huawei-E169-E620-E800)
-   E303 - works with Raspbian Wheezy 2015-02-16 out of the box, will be
    recognized as network-adapter [ethX]

#### Sierra Wireless

-   AirCard 250u works with wvdial/network manager
-   AirCard 320u (0f3d:68aa) works in WWAN mode, driver provided by the
    kernel. Tested on Arch.
    -   Kernel version 3.10 has a bug that causes the WWAN interface to
        never be in *RUNNING* state (no carrier). Use 3.6 kernel
        instead.
    -   AT command guide can be found
        [here](http://mycusthelpadmin.net/SIERRAWIRELESS/_cs/AnswerDetail.aspx?aid=44)
    -   for GPS to work you have to enable it. First, setup the modem
        (guide [here](http://whirlpool.net.au/wiki/hw_model_1210)) and
        after that enable NMEA output by passing *nmea=1* parameter to
        the *sierra* kernel module. **Warning! Enabling NMEA output may
        cause the modem to drop connections / restart itself**. This is
        probably related to higher power drain. This may not be the
        issue when a powered hub is used.
-   307 Works fine with Sakis3G script. The connection LED does not
    change its state after establishing a connection but the same
    behaviour on a normal linux system.
-   AirCard 340u (Netgear/ATT Beam) works with latest GobiNet/GobiSerial
    code on Raspbian and 3.10.25+ kernel. Requires firmware update from
    Netgear to disable Windows 8 support and make it autoconnect. [guide
    here](http://wes.skeweredrook.com/raspberry-pi-att-beam/).

#### ZTE

-   ZTE MF190S
-   ZTE MF626
    Works fine with Sakis3G script. You can use force it to ALWAYS be in
    modem mode (See here:
    [http://forums.whirlpool.net.au/archive/1205127](http://forums.whirlpool.net.au/archive/1205127)
    ), or use usb-modeswitch ( as described here
    [http://blog.christophersmart.com/2009/05/21/telstra-nextg-working-with-mf626-usb-modem/](http://blog.christophersmart.com/2009/05/21/telstra-nextg-working-with-mf626-usb-modem/)
    )
-   ZTE MF628 Tested with Sakis3g using --noprobegsm, use
    usb\_modeswitch to get ID 19d2:0031.
-   ZTE MF70 (Telstra 3G USB + Wi-FI) Tested. Automatically appears as
    ethernet device. No usb\_modeswitch required. Use DHCP to acquire IP
    address/DNS/Gateway etc. To configure modem, use web browser and
    visit [http://192.168.0.1/](http://192.168.0.1/)
-   ZTE Rocket MF591 - Tested with T-mobile network and Model B+ running
    Raspbian with usb-modeswitch and Sakis3G script. (Followed guide to
    work:
    [http://www.instructables.com/id/Raspberry-Pi-as-a-3g-Huawei-E303-wireless-Edima/?ALLSTEPS](http://www.instructables.com/id/Raspberry-Pi-as-a-3g-Huawei-E303-wireless-Edima/?ALLSTEPS))

#### Others

-   Franklin U600 from Sprint / VirginMobile
    -   Use usb\_modeswitch and vendor 0x1fac and product 0x0150/0x0151
-   Digicom Internet Key 7.2 HSUPA **MU372-L01**
    [[4]](http://www.digicom.it/digisit/prodotti.nsf/itprodottiidx/MU372L01)

Tested on Raspbian and Archlinux. Detected as 230d:0001. Works with
cdc\_acm driver. Install usb\_modeswitch. There are 2 "com ports"(
/dev/ttyACM0 and /dev/ttyACM1 ) . Tested with Network Manager.Works also
perfectly with SAKYS3G [[5]](http://www.sakis3g.org/) tools (!! led is
always off !!) and wvdial. A working wvdial.conf:
[http://ubuntuforums.org/showpost.php?p=10361881&postcount=28](http://ubuntuforums.org/showpost.php?p=10361881&postcount=28)
. (for example for Vodafone IT , replace Init3 with this: Init3 =
AT+CGDCONT=1,"IP","web.omnitel.it" and replace line Modem = /dev/ttyUSB0
with Modem = /dev/ttyACM1 ) and run with wvdial voda .

-   Vodafone MD950 (1dbc:0005) - is working on RPi (Raspbian Wheezy) but
    not out of the box, [more details
    here](https://github.com/sk-vpohybe/stopa-monitor/wiki/3G-modem-Vodafone-MD950).

## USB Sound Cards

You will usually want the `alsa` package for sound. In the Debian image
for Raspberry Pi (and possibly other distributions) USB sound cards are
prevented from loading as the first sound card, which can be an
annoyance if it's the only device you have. To disable this behaviour
edit `/etc/modprobe.d/alsa-base.conf` and comment out the last line;
`options snd-usb-audio index=-2` . If you are not user *pi* you may need
to add your username to the *audio* group thus:
`sudo adduser yourusername audio` (user *pi* usually belongs to this
group anyway).

-   **Creative**
    -   [Sound Blaster
        Play!](http://asia.creative.com/products/product.asp?category=1&subcategory=207&product=17892)
-   **Daffodil**
    -   [USB Sound Adapter
        US01](http://www.amazon.co.uk/gp/product/B002FI7GWK/ref=oh_details_o03_s00_i00).
        Tested with low-cost headphone/microphone set via *audacity*
        (See notes at
        [CPM-Spectre-Pi...DaffodilUSBSoundAdapter](http://www.cpmspectrepi.webspace.virginmedia.com/raspberry_pi/MoinMoinExport/DaffodilUSBSoundAdapter.html)).
-   **Edirol**
    -   [UA-1A](http://www.roland.com/products/en/UA-1A/)
-   **GWCtech**
    -   [AA1570 USB 7.1 Sound
        Card](http://www.gwctech.com/product3.asp?listid=3&id=4&subid=10&pid=788&typeid=96)
        (aka [Conrad AA 1570 7.1
        SoundBox](http://www.conrad.com/ce/en/product/872990/USB-SoundBox-71))
        - playback works fine, Recording stutters unless
        dwc\_otg.speed=1 is set
-   **Hercules**
    -   [Gamesurround Muse XL (Pocket
        LT3)](http://www.hercules.com/fr/Cartes-Son/bdd/p/123/gamesurround-muse-xl-pocket-lt3/)
-   **Hewlett Packard**
    -   Hewlett Packard (HP) Premium Digital Headset, Model No: HUD-02.
        It supports both audio out and audio in. Works in Audacity.
        Recprding volume is quiet even with recording mixer level turned
        way up. Additional post-mixer amplification of audio-in is
        recommended, if possible.
-   **Logilink**
    -   [UA0053 USB Soundcard with Virtual 3D Soundeffects
        LogiLink](http://www.logilink.de/showproduct/UA0053.htm?seticlanguage=en)
-   **Logitech**
    -   [Logitech G930 Wireless Gaming Headset with 7.1 Surround
        Sound](http://www.amazon.com/Logitech-Wireless-Gaming-Headset-Surround/dp/B003VANOFY/ref=sr_1_1?ie=UTF8&qid=1358114107&sr=8-1&keywords=g930)
        (stereo works with ALSA, have not tried 7.1 Surround Sound)
-   **NuForce uDAC-2**
    -   [NuForce uDAC-2 Headphone Amplifier and USB
        DAC](http://www.nuforce.com/hp/products/iconudac2/index.php)
-   **Plantronics**
    -   [Plantronics Stereo USB Adapter
        -01](http://www.ebay.com/itm/Genuine-New-Plantronics-External-USB-Audio-Soundcard-New-Sealed-/300845395889?pt=US_Sound_Card_External&hash=item460bc86fb1)
        (works with ALSA) (shows up in lsusb as 0d8c:000c C-Media
        Electronics, Inc. Audio Adapter)
-   **SpeedLink**
    -   [VIGO USB Soundcard,
        black](http://www.speedlink.com/?p=2&cat=17&pid=23371&paus=1&act_lang=en)
        - Device ID: 0d8c:000e ("C-Media Electronics, Inc. Audio
        Adapter"). Working, but on Raspbian 3.6.11 it fills up kern.log
        with "cm109\_urb\_irq\_callback: urb status -71" messages. To
        prevent this, you can insert \`:msg, contains,
        "cm109\_urb\_irq\_callback" \~´ as first rule into
        /etc/rsyslog.conf.
-   **Terratec**
    -   [Aureon Dual
        USB](http://www.terratec.net/fr/produkte/Aureon_Dual_USB_12339.html)
        (not with USB high speed; add dwc\_otg.speed=1 to
        /boot/cmdline.txt, but that will slow down all USB transfers)
-   **Texas Instruments PCM2704**
    -   [USB DAC PCM2704
        Decoder](http://dx.com/p/usb-dac-pcm2704-decoder-red-172991?Utm_rid=24958662&Utm_source=affiliate)

### Databases of supported sound cards

-   [http://wiki.linuxaudio.org/wiki/current\_audio\_gear](http://wiki.linuxaudio.org/wiki/current_audio_gear)
-   [http://wiki.linuxmusicians.com/doku.php?id=hardware\_matrix](http://wiki.linuxmusicians.com/doku.php?id=hardware_matrix)

### Class compliant USB sound cards

Any USB1.1 audio interface that is class compliant should work with
Linux, same goes for USB2.0 interfaces that adhere to the current USB
audio standards. There are some interfaces that are supported in Linux
while they do not comply to the standards because specific quirks have
been added to the USB Linux drivers. To verify if your interface is
supported search for a manual of your interface and check if it needs
drivers to run under Windows/Mac. If the manual explicitely mentions no
drivers are needed the interface is almost surely a class compliant
device. When in doubt check the aforementioned databases.

### Troubleshooting

If you encounter problems setting up your USB soundcard check the RPi
Wiki article in the linuxaudio.org Wiki:
[http://wiki.linuxaudio.org/wiki/raspberrypi](http://wiki.linuxaudio.org/wiki/raspberrypi)

-   Bulleted list item

## USB IR Receivers

-   The
    [FLIRC](http://www.pi-supply.com/product/flirc-usb-ir-remote-dongle-for-raspberry-pi/)
    USB dongle allows the use of any remote control with your Raspberry
    Pi. Configure the device on your desktop PC, then simply plug into
    your Pi for a perfect media center companion. Available from [Pi
    Supply](http://www.pi-supply.com/), [The Pi
    Hut](http://thepihut.com/) and [Buy Raspberry Pi
    Australia](http://www.buyraspberrypi.com.au)

-   SMK Manufacturing, Inc. eHome Infrared Receiver (Works out of the
    box with OpenELEC)

## USB Radio devices

-   FM Radio
    -   ADS InstantFM Music - FM radio tuner works fine under Debian.

## USB TV Tuners and DVB devices

-   August
    -   DVB-T205, based on rtl2832u chipset, worked with [this
        driver](https://github.com/ambrosa/DVB-Realtek-RTL2832U-2.2.2-10tuner-mod_kernel-3.0.0)
        on older 3.2 kernel. Couldn't get same device working reliably
        on current kernel. (On the older 3.2 kernel it worked with
        Saorview (Irish DTT service), both HD & SD.)
-   Derek?
    -   TV28T v2 USB DVB-T & RTL-SDR Receiver, RTL2832U & R820T Tuner,
        MCX Input. DVB-T works with OpenElec 4.2.1 connected to the
        PiHub, tvheadend backend + frontend, finds all expected,
        non-encrypted channels in the south of Germany. I did not try to
        use the remote.
-   DVBSky
    -   [Mystique SaTiX-S2 Sky
        USB](http://dvbsky.eu/Products_S860.html): Scanning/watching SD
        and HD works via vdr and streamdev plugin, watching on the
        Raspberry Pi directly is laggy as hell. DVB-USB and I2C support
        must be enabled in the kernel. Needs drivers/firmware from
        [here](http://dvbsky.eu/Support.html).
-   Sundtek
    -   Sundtek MediaTV Digital Home
    -   Sundtek MediaTV Pro
    -   Sundtek SkyTV Ultimate
    -   [DVB-C, DVB-T, DVB-S/S2](http://shop.sundtek.de): digital TV
        works, streaming to Windows / Linux is no problem. Easy
        installation
        [English](http://support.sundtek.com/index.php/topic,4.0.html)
-   Hauppauge
    -   Hauppauge NOVA-T Stick (Revision 70xxx) DiBcom DiB0700 chipset,
        requires powered hub.
    -   Hauppauge NOVA-TD Stick (Revision 52xxx) DiBcom DiB0700 chipset,
        requires powered hub.
    -   Hauppauge WinTV-HVR-1950 (tested analog tuner with omxplayer,
        tested Digital OTA with MythTV)
    -   Hauppauge WinTV-HVR-950Q (tested Digital OTA with TVHeadend in
        Raspbian)
-   K-World
    -   K-World UB499-2T Dual DVB-T USB Tuner. IT9137 chipset. With no
        other USB devices connected Raspberry Pi can just about power
        this stick. IR and supplied remote work with XBMC.
-   Technisat
    -   Technisat\_SkyStar\_USB\_HD. Instructions:
        [http://www.linuxtv.org/wiki/index.php/Technisat\_SkyStar\_USB\_HD](http://www.linuxtv.org/wiki/index.php/Technisat_SkyStar_USB_HD)
        Used the Raspberry Pi to receive and redirect it via network to
        another host. Didn't try to play back the stream on the
        Raspberry Pi itself. Tested with Astra 19.2E radio and SD-TV
        channels
-   TECHNOTREND
    -   TT-TVStick CT2-4400 USB Fernbedienung rev2. DVB-T works with
        OpenElec 4.9.4 BETA connected to the PiHub, tvheadend backend +
        frontend, finds all expected, non-encrypted channels in the
        south of Germany. DVB-C also works, finds around \>30 TVs and
        \>100 radio stations. I did not try to use the remote, nor did I
        listen to any radio station. TV works, SD channels are ok, HD
        channels jitter. tvheadend backend crashes often within OpenElec
        4.9.4 BETA, but restarts, so still buggy but looks good(BETA!).
        It did not work out of the box with the stable OpenElec 4.2.1.
-   Terratec
    -   Terratec H7. Tested DVB-C with [dvbv5 tools, part of
        v4l-utils](http://git.linuxtv.org/v4l-utils.git), under [Fedora
        18
        Remix](http://zenit.senecac.on.ca/wiki/index.php/Raspberry_Pi_Fedora_Remix)
        and latest (April, 14 2013) [DVB Kernel
        stack/drivers](http://git.linuxtv.org/media_build.git).
-   Generic
    -   [DVB-T USB Dongle (Silver
        casing)](http://www.onsources.com/product_images/a/757/watch_and_record_digital_tv_dongle__44323_zoom.jpg),
        based on AF9015 chipset.
    -   [DVB-T USB
        Dongle](http://www.electrodepot.fr/media/catalog/product/cache/1/image/500x/9df78eab33525d08d6e5fb8d27136e95/P926993.jpg),
        based on RTL2832 FC12 (HD/SD), IR was detected, but it is not
        tested.
    -   [HDTV USB
        DVB-T](http://obrazki.elektroda.pl/8081115000_1317678968.jpg)
        dongle, based on IT9135. This tuner comes in two revisions.
        Revision is printed on PCB.
        -   rev. 1.0; should work with 3.2+ kernel, need confirmation.
        -   rev. 2.0; works with kernel 3.6.11, without a powered hub.
            This tuner also requires a firmware (dvb-usb-it9135-02.fw)
            which can be downloaded from [this
            page](http://logout.hu/bejegyzes/azbest/usb_dvb-t_tuner_it9135_rev2/hsz_1-50.html).
            It's in Hungarian, so google translate or equivalent is
            recommended. The remote also works.
            According to [this
            post](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=35&t=29141),
            there may be issues on some software configurations when
            using *omxplayer*.

## USB Video / Frame grabbers

-   EasyCAP DC60 (STK1160 chip) - works out of the box for older
    versions of Raspbian. If you're getting grey stripes see this
    [tutorial](http://raspberry-at-home.com/video-grabber-for-raspberry-pi/)
-   EasyCAP (UTV007 Fushicai chip) - works after driver compilation -
    see instructions at [this
    link](http://raspberry-at-home.com/video-grabber-for-raspberry-pi/).
    remember to use older Raspbian version.
-   Hauppage HVR 1900

## USB Webcams

This section has been moved to a separate page. See [RPi USB
Webcams](http://eLinux.org/RPi_USB_Webcams "RPi USB Webcams")

## USB GPS devices

-   Columbus
    -   Columbus V-800 (MediaTek (MTKII) 3329 GPS chipset) - does not
        require powered USB hub. Works on Wheezy (using gpsd &
        gpsd-clients)
-   Royaltek
    -   Royaltek RGM 2000 SiRF2 using the included serial (TTL) to USB -
        converter (Prolific pl2303-chip)
-   Garmin
    -   Garmin eTrex Vista HCx: It works, but it may draw too much
        power. To get it working (software part):
        [https://wiki.openstreetmap.org/wiki/USB\_Garmin\_on\_GNU/Linux](https://wiki.openstreetmap.org/wiki/USB_Garmin_on_GNU/Linux)
-   GlobalSat
    -   GlobalSat BU-353 Does not require a powered hub, works fine when
        directly plugged into the Raspberry Pi. On Raspian, requires the
        gpsd and gpsd-client packages. For some reason, the gpsd daemon
        does not always start correctly on boot. You may need to do
        something like the following to manually restart it:

            sudo killall gpsd; sudo gpsd /dev/ttyUSB0 -F /var/run/gpsd.sock

    -   GlobalSat BU-353-S4 supports two protocols: NMEA, and SiRF v4.
        NMEA works fine, but SiRF v4 isn't compatible with "gpsd"'s SiRF
        v3 interpreter, resulting in a greatly reduced data rate (as low
        as four location fixes per hour). To keep "gpsd"'s
        autoconfiguration from putting the receiver in SiRF mode, you'll
        need to pass the "-b" flag when starting "gpsd".

-   Wintec
    -   WBT-200: No problem on Debian
-   Holux
    -   Holux M-215: Works fine on Arch, uses Silicon Labs CP210x RS232
        serial adaptor driver
-   Bluenext
    -   Bluenext BN903S: No problem on Debian image (19-04-2012).

-   U blox NEO 6 - works well, connects via GPIO (serial console). Info
    [here](http://diydrones.com/profiles/blogs/how-to-connect-3dr-gps-ublox-to-raspberry-pi)
    and
    [here](https://github.com/petervojtek/diy/wiki/GPS-U-blox-NEO-6-with-Raspberry-Pi).

## USB UART and USB to Serial (RS-232) adapters

A USB UART adapter is used to access the serial console of the Raspberry
Pi from a development host such as a laptop or desktop PC. The USB end
connects to the PC and the UART header end connects to the USB. While it
is possible to connect the USB end to another Raspberry Pi, this
configuration has not been tested unless explicitly mentioned against an
individual entry below.

### Working USB to Serial Adapters

-   **FTDI (Future Technology Devices International Limited)**
    -   FT232 chip based adapters works for some people, but others find
        it hangs Linux when the port is opened. The module is ftdi\_sio.
    -   FT232R USB UART works out of the box between Raspbian Wheezy and
        OS X Mavericks (Product-ID: 0x6001, Manufacturer-ID: 0x0403,
        Maximal Speed: 12 MBit/s, Maximal Power Consumption: 90 mA).
    -   FT2232D dual RS232/FIFO works (used in various JTAG devices)

-   **Belkin**
    -   F5U409 Works OOTB; does not support speeds above 115,200, so you
        can't use it for DMX or other high-speed protocols.

-   **Prolific**
    -   PL2303 chip based adaptors works fine on latest Debian tested
        with *minicom*, *gtkterm* and *screen*.

A USB to Serial (RS-232) adapter is used the other way around, ie. the
USB end connects to the Raspberry Pi and the RS-232 end (DSUB-9 or
DSUB-25 pin) to the other device which may be another computer, (old)
modem or printer, or some electronic test equipment.

-   "Best Connectivity" (Possibly also sold under the "Newlink HQ" or
    "Kenable HQ" labels)
    -   FG-U1232-PL2 Based upon the Prolific PL2303X chipset and listed
        by *lsusb* as
        `ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port`.
        Appears as `/dev/ttyUSB0`, and requires the user to be a member
        of the *dialout* group (which *pi* is for *Raspbian Wheezy*).
        Initially tested using an old RS Datalinker setup in "loopback"
        mode via *microcom* upto 9600 baud, and *gtkterm* after
        installing that from source code. All handshake lines toggled as
        expected and no characters were lost. Subsequently *gtkterm* was
        used to check bi-directional communication with an ancient
        brother EP44 electronic typewriter (as a printer/dumb terminal)
        at 1200 baud. Signal lines were again monitored with the
        Datalinker.
-   "PL2303HX USB to RS232 TTL Converter Adapter Module" on dx.com:
    [http://dx.com/p/pl2303hx-usb-to-rs232-ttl-converter-adapter-module-164590](http://dx.com/p/pl2303hx-usb-to-rs232-ttl-converter-adapter-module-164590)
    -   Based on the Prolific PL-2303HX chipset. Listed by *lsusb* as
        `ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port`.
        Appears as `/dev/ttyUSBX` with GUID `dialout` so your user has
        to be in that group. If not,
        `sudo usermod -a -G dialout yourusername` will add your user to
        the `dialout` group. Works great with
        `screen /dev/ttyUSBX 115200` to connect from your workstation to
        your RPi.

### Problem USB to Serial Adapters

**HL-340**

-   CH340 Chipset - **Currently not supported by RPi** but there is a
    patch of kernel code
    [here](http://tiagovaz.wordpress.com/2008/01/04/using-a-hl-340-usb-serial-adapter-against-2623-linux-kernel/),
    but it is for a 2.X kernel. If you find you have bought one of
    these, then it may work under Windows, but as of writing there is no
    support for RPi. Otherwise you can have a go at getting the patch to
    work.

## USB Multi-Card Readers

### Working USB Multi-Card Readers

-   US Robotics USB 3.0 All-In-One Multi-Format Card Reader (Product \#
    USR8420) Accepts 5 cards simultaneously
    -   SD/MMC + MS/MS PRO or DUO/DUO PRO + CF/MD + SM + SD/MMC or MS/MS
        PRO. Useful for backing up cards containing other OS Distros

-   **Generic** (Nintendo branded)
    -   identified as "14cd:8123 Super Top SD MMC Reader" (B)

### Problem USB Multi-Card Readers

-   **Generic**
    -   Card reader based on NEODIO ND3260-LD chip, identified as
        "0aec:3260 Neodio Technologies Corp. 7-in-1 Card Reader", fails
        after a few seconds with all access lights blinking. (B)

## Other, exotic USB devices

### Joysticks / Joypads

-   **Microsoft**
    -   Xbox360 Controller (045e:028e): works. Tested with archlinux,
        connected to an USB Hub, used as "mouse" in X, package
        xf86-input-joystick

-   **Logitech**
    -   Dual Action: works, connected directly to the Pi.

-   **Ion**
    -   Go Pad: works. Tested on Raspbian Wheezy (release 2014-01-07),
        connected to on-board USB port (Model B rev. 2).

-   **VZTEC**
    -   USB Double Shock Controller Game Pad Joystick VZ-GA6002: works.
        Tested on RetroPie V2.3, connected to on-board USB port (Model
        B+).

### Numpads

-   **Conceptronic / Holtek**
    -   USB numpad (04d9:a02a): works. Tested with archlinux, connected
        to an USB Hub
-   **Speedlink SL-7430-SGY**
    -   USB numpad (04d9:1603, HT82M99E Holtek chip inside): works.
        Tested with Raspbian “wheezy”
-   **GreenAsia Inc. ([USB 18-Key Silicone Numeric
    Keypad](http://img.dxcdn.com/productimages/sku_26083_1.jpg))**
    -   USB numpad (0e8f:0022): works. Tested with Raspbian “wheezy”

### USB to Parallel Port/Printer Adapters

-   **Prolific**
    -   PL2305 Chipset with Centronics 36w connector. Originally
        purchased for use with a netbook and connected to an old Canon
        BJC-250 printer. Worked fine under [RISC OS Raspberry
        Pi](http://eLinux.org/RPi_Distributions#RISC_OS "RPi Distributions") with its
        in-built BJC-250 driver. Could not install the CUPS drivers etc.
        for Wheezy-Raspbian initially, but was able to do so for
        Wheezy-armel. Once I'd updated/upgraded Wheezy all was fine.(See
        notes at
        [CPM-Spectre-Pi...USBtoParPrntAdapter](http://www.cpmspectrepi.webspace.virginmedia.com/raspberry_pi/MoinMoinExport/USBtoParPrntAdapter.html)
        for more info. and also a [CUPS/Wheezy installation
        guide](http://www.cpmspectrepi.webspace.virginmedia.com/raspberry_pi/MoinMoinExport/WheezyCUPS.html))

### USB to IDE/SATA

-   **JMicron Technology**
    -   JM20337 USB to SATA/PATA Combo Bridge (152d:2338) - works on
        Raspbian and Arch. The hard drive requires an external power
        supply.
-   **Nippon Labs**
    -   2.5" SATA HDD USB Adapter with silicone HDD sleeve. Model:
        USB-ADT-25SATA. Works on powered Hub, not directly to Raspberry
        Pi. Built-in "Y" power adapter. Does work direct on some ver2.0
        boards if used with 5.25 power supply, or Y adapter

### CAN Bus

-   PEAK-System (www.peak-system.com)
    -   PCAN-USB using the driver (kernel module) from
        [http://www.peak-system.com/fileadmin/media/linux/index.htm](http://www.peak-system.com/fileadmin/media/linux/index.htm)

### Home automation

-   Tellstick (www.telldus.com), installation
    [instructions](http://eLinux.org/R-Pi_Tellstick_core "R-Pi Tellstick core")
    -   Depends on libftdi1

### Weather station

-   Oregon Scientific WMRS-200 : Work out of the box (tested with
    Raspbian & wview)

### One-Wire

-   **PCsensor**
    -   USB9097 (1a86:7523): works out of the box but issue with LAN
        after a few hours, no problem after a firmware update.
        Identify's as "QinHeng Electronics HL-340 USB-Serial adapter"
        Tested with raspbian/wheezy + domotiga & digitemp directly to
        USB port & 4 sensors connected via a '1-wire hub'. Claims to be
        'fully replace DS9097, DS9490 of MAXIM'. Simple and cheap
        solution to measure temperature.

### Touch Screen

-   ACER T230H touch screen
    [[6]](http://support.acer.com/acerpanam/monitor/2009/acer/t230h/t230hnv.shtml)This
    link is Broken
    -   USB TS identifies as "Quanta Computer, Inc. Optical dual-touch
        panel", module hid\_quanta
    -   Seems to draw over 200 mA from USB!
-   SainSmart 3.2 touch screen
    [[7]](http://www.sainsmart.com/sainsmart-3-2-tft-lcd-display-touch-panel-pcb-adapter-sd-slot-for-arduino-2560.html)
    -   320\*240
    -   3.2 inch
    -   SSD1289:240 RGB x 320 TFT Drive
    -   Video: Raspberry Pi with a 3.2" TFT with Touch control
        [[8]](http://www.youtube.com/watch?feature=player_embedded&v=QKxmPdUoNQU)
    -   Tutorial: Raspberry Pi with a 3.2″ TFT with Touch control
        [[9]](http://marks-space.com/2013/05/23/raspberry-pi-with-a-3-2-tft-with-touch-control/)

### Floppy Disk Drive

-   Samsung USB Floppy Drive SFD-321U/HP
    -   I suppose a floppy drive might be considered exotic nowadays!
    -   LSUSB lists it as Samsung Electro-Mechanics Co. Floppy Disk
        Drive
    -   Only tried connected to a powered USB hub, as the drive is
        labelled 5 V at 0.5 A on a Raspberry Pi running Debian Wheezy.
    -   tail -f /var/log/syslog looking for mount device when plugged
        in, came up as SDA in testing.
    -   sudo mkdir /media/floppy
    -   sudo mount /dev/sda /media/floppy
    -   Contents of floppy now available in /media/floppy
    -   To remove drive, ensure no sessions have the floppy directory as
        the current working directory.
    -   sudo umount /media/floppy
-   Y-E Data model HU-35EF
    -   Requires a powered hub and manual mounting/unmounting like the
        Samsung drive above.

### USB Missile Launcher

-   USB Missile Launcher / Rocket Launcher sold in UK by Marks and
    Spencer, but it is also sold under a range of other names.
    -   USB ID 1130:0202 Tenx Technology, Inc. Use apt-get install
        pymissile (python code) and there is C code at [usbmissile from
        Source Forge](http://sourceforge.net/projects/usbmissile/)

### USB Docking Stations

-   StarTech USB 3.0 to Dual 2.5"/3.5" SATA HDD Dock (SATDOCK2U3GB)
    -   This is an externally powered dual sata HDD docking station,
        which has USB2.0 compatibility with the Raspberry Pi.
    -   Tested with latest Raspbmc and Debian Wheezy Raspbian, 3.1.9+
        \#168

-   Icy Box USB 3.0 to Dual 2.5"/3.5" SATA HDD Dock (IB-120StU3)
    -   Externally powered dual HDD dock, USB 2 compatible.
    -   Tested with Slackware ARM 14.0 and drives in both slots, just
        show up as separate SCSI disks.

### USB RFID Reader

-   Unbranded 125 kHz EM4100 RFID reader from eBay sellers (\< £7), the
    one with a Windows logo on (easily scratches off for Linux users).
    -   Initially would not work when plugged in directly to Raspberry
        Pi. Worked when connected via an unpowered Trust hub. Worked
        after Raspberry Pi was modified with 10K resistors over the USB
        polyfuses (warranty invalidated). Probably would work fine with
        powered hub.
    -   Sends a 10 digit string to current window or console as if it
        was a keyboard. Can be captured independently of keyboard using
        Linux event interface (http://eLinux.org/dev/input), but the kernel in current
        distributions does not have CONFIG\_INPUT\_EVDEV selected so
        kernel rebuild is necessary.

### JTAG

-   FTDI2232D dual RS232/FIFO based JTAG (e.g. SheevaPlug JTAGKey USB-ID
    9e88:9e8f)
    -   works using the Raspberry Pi as a development host

### Tinkerforge Bricks and Bricklets ([http://www.tinkerforge.com](http://www.tinkerforge.com))

-   Read out sensors and control motors over USB with open source
    hardware.
-   Tested with the brickd\_armhf.deb from
    [[here](http://www.tinkerforge.com/doc/Downloads.html#tools:)] with:
    -   sudo apt-get install libusb-1.0-0 libudev0
    -   wget
        [http://download.tinkerforge.com/tools/brickd/linux/brickd\_linux\_latest\_armhf.deb](http://download.tinkerforge.com/tools/brickd/linux/brickd_linux_latest_armhf.deb)
    -   sudo dpkg -i brickd\_linux\_latest\_armhf.deb
-   Tested languages: C/C++, C\# (mono), [Free
    Pascal](http://eLinux.org/Free_Pascal "Free Pascal") ([Lazarus](http://eLinux.org/Lazarus "Lazarus")),
    Java, PHP, Python, Ruby (see
    [[here](http://www.tinkerforge.com/doc/Software/API_Bindings.html:)]
    for installation).
-   If a big amount of Bricks is used, a powered USB Hub may be
    required.

### Thermometers

-   TEMPer1 (id: 0c45:7401)
    -   works out of the box on raspbian/wheezy with [pcsensors
        library](https://github.com/petervojtek/usb-thermometer)

### Fingerprint Scanners

#### Futronic

Single finger scanners Futronic FS80 and FS88 tested - they work well
with Raspbian. Example of captured fingerprint here:
[Media:Futronic\_fingerprint\_example.png](http://eLinux.org/images/f/f9/Futronic_fingerprint_example.png "Futronic fingerprint example.png")

To make it working deploy the Futronic libScanAPI on your Raspberry Pi
(example code and instructions included):
[Media:ScanApi\_armlinux\_RPi\_gnueabihf\_gcc472\_update1.zip
‎](http://eLinux.org/images/3/3b/ScanApi_armlinux_RPi_gnueabihf_gcc472_update1.zip "ScanApi armlinux RPi gnueabihf gcc472 update1.zip")

UPDATE: Futronic has released an updated API. This works with their
newer 'H' model scanners (updated CMOS). This means the FS80H and FS81
(the OEM version of the FS80H) will now work with the RPi (I tested this
myself).
[Media:ScanAPI\_v823\_armlinux\_libusb0.1.12-bcm2708\_gnueabihf\_raspbian-472.zip](http://eLinux.org/images/4/4c/ScanAPI_v823_armlinux_libusb0.1.12-bcm2708_gnueabihf_raspbian-472.zip "ScanAPI v823 armlinux libusb0.1.12-bcm2708 gnueabihf raspbian-472.zip")

## PS2 / AT to USB Converters

-   Unbranded active converter known as the "blue cube". Based on the
    Cypress CY7C63723C 8 bit RISC. Please see
    [http://geekhack.org/showwiki.php?title=PS2-to-USB+adapters](http://geekhack.org/showwiki.php?title=PS2-to-USB+adapters)
    for more information.

Note that although the adapter might work, PS/2 keyboards were not
designed to be low power USB devices, so they might not meet the
requirement to work with considerable lowered supply voltage (4.4 volt)
provided by the USB ports of the raspberry PI. These keyboards should
work when powered by a powered hub.

**Tested PS2/AT keyboards**

All above tested with the famous "blue cube" on a powered USB hub.

-   IBM Model F (please note requires an additional AT to PS2 converter)
-   Dell AT101w
-   Northgate Ominikey Ultra T (please note requires an additional AT to
    PS2 converter)

-   04d9:1400 Holtek Semiconductor, Inc. PS/2 keyboard + mouse
    controller
    -   Working: Ipex RT215KTW PS/2 keyboard
    -   Not working: HP SK-2502 PS/2 keyboard (gets power, but it does
        not init - three LEDs remain permanently lit. Keyboard + Holtek
        converter work on a Linux PC, although this keyboard doesn't
        work with some native PS/2 ports.)

## Power Switches

The Raspberry Pi does not have a power on/off switch as standard (it
does have a reset switch), however some add on boards have been
developed to cater for this need.

-   The [Pi Supply
    Switch](http://www.pi-supply.com/product/pi-supply-raspberry-pi-power-switch/)
    is an on/off power switch for the Raspberry Pi which includes a hard
    on and off switch and a soft shutdown switch for the Pi, making it
    easy to manage power on your Pi. They were recently successfully
    funded on Kickstarter.
-   **RemotePi Board**
    -   The [RemotePi
        Board](http://www.msldigital.com/products/remotepi-board) is an
        intelligent infrared remote controlled power switch add-on board
        for the Raspberry Pi. It allows to switch power on and off using
        any button (configurable in learning mode) of an existing
        standard IR remote. Power is only cut after notifying the OS and
        giving it time to shut-down. It is mainly intended to remote
        control (using LIRC) and power off/on a mediacenter system. i.e
        OpenELEC, Raspbmc, XBian, RasPlex, Raspbian. The board is
        compatible to simple GPIO IR receiver and piggy backs onto the
        Raspberry Pi, no soldering required. For more information click
        [here](http://www.msldigital.com/pages/more-information).

## Power adapters

The Raspberry Pi uses a standard Micro USB (type B) power connector,
which runs at 5 V. Generally you can use a MicroUSB to USB cable and
then either power the Raspberry Pi directly from your main computers USB
ports (if they provide enough power), or by using a USB to Mains
adapter. A number of mobile phones use MicroUSB power cables, and these
are compatible with the Raspberry Pi in most cases. Below is a list of
power adapters known to work.



### Working power Adapters

There is now a 5.25V 1500mA power supply manufactured *specially* for
the Raspberry Pi to account for voltage drop due to the high current
draw of the Raspberry Pi when compared to typical (phone charging etc.)
duties.
 Available in UK, EU, USA and AU varieties from [Pi
Hut](http://thepihut.com/collections/raspberry-pi-power-supplies) and
[Pi
Supply](http://www.pi-supply.com/product-category/raspberry-pi-power-supplies/)



-   **Adafruit**
    -   5.25 V 1 A Model 501 (Newark 44W4932) USB 110-240 VAC power
        supply [4.99-5.01 V @ T1/T2 with 100 mA BT and/or mini
        wireless-n on RPi USB ports]
-   **AlcaPower**
    -   5 V 2.5 A Model AP5A - Charger/switching with 7 connectors(also
        Microusb)
-   **Ansmann**
    -   Dual USB charger slim, Model-Nr. 1201-0001
-   **Apple**
    Note that apple designs its charger products to work optimally as
    **chargers**. In practice this means that apple chargers drop their
    output voltages somewhat with output current, so that the charging
    circuits do not need to dissipate more heat than is strictly
    necessary. Because of this, and although many people have reported
    apple products to power their basic PI setup reliably, its still not
    an optimal choice for a PI system that uses power hungry USB
    devices. Also, because of the popularity and high price of these
    chargers there are many very sub standard, but almost impossible to
    recognize as fake copies on the market, and some of these fakes are
    about the worst things you can try to power your PI with! Not only
    do they not work, they may actually be dangerous to use!
    -   5 V 2.1 A USB charger for iPad2, model A1357
    -   5 V 1.0 A USB Charger for iPod
    -   5 V 1.0 A USB Charger for iPhone 4
-   **Amazon**
    -   5 V 0.85 A USB charger for Kindle
    -   5 V 2 A Mains to USB A adaptor, Branded "CostMad"
-   **Artwizz**
    -   5 V 1.0 A USB charger (Model: YFAR23073001)
-   **Asus**
    -   5 V 2.0 A USB charger for Google Nexus 7
-   **Bandridge**
    -   5 V 1.0 A Mobile Phone Charger (Model: BPC3102EC)
-   **Belkin**
    -   5 V 2.6 A 4 port Ultra-Slim Desktop hub (Model F4U040)
        (Raspberry Pi running from USB hub port)
    -   5 V 2.5 A 4 port USB Hub (Model F5U404) (Raspberry Pi running
        from USB hub port)
    -   5 V 3.5 A 7 port USB 2.0 Mobile Powered Hub (Model F4U018)
        (Raspberry Pi running from USB hub port)
    -   5 V 3.5 A 7 port USB Hub (Model F5U706) (Raspberry Pi running
        from USB hub port)
    -   Mini Surge Protector Dual USB Charger (Model BZ103050-TVL)
    -   Universal USB Wall Charger (5 V 1 A) (Model F8Z222uk)
    -   Universal Home Charger with Micro USB ChargeSync Cable (10 Watt/
        2.1 Amp) F8M667tt04
        [link](http://www.belkin.com/us/F8M667-Belkin/p/P-F8M667/)
-   **Blackberry**
    -   Charger for Pearl Flip 8220, Bold 9600 (B)
    -   Charger for Tour 9630
    -   5V 1.8A "Folding Blade" Micro USB Tablet charger Part \#:
        HDW-34724-001 Model \#: AD8213HF (works with model A w/ camera +
        Wifi)
    -   5 V 0.7 A Model PSM04R-0500CHW1(M), RIM Part Number
        HDW-17957-003 (B)
    -   5 V 750 mA Model RIM-C-0004aDUUUC-001, RIM Part Number
        HWD-24481-001 (comes with Blackberry 9300)
    -   5 V 750 mA Model RIM-C-0004ADUUS-001 035D, Single port plug.
        (Tested with USB B to Micro USB cable from Logitech H760
        Headset)
    -   5 V 2 A Model PSAC10R-050QT, RIM Part Number HDW-34725-001
    -   5 V 550 mA curve 8520 charger works with raspberry pi Model B
        Board v. BS1233. It does not work with Raspbmc image.Symtoms are
        frequent key board and external hdd disconnects.
-   **Deal Extreme**
    -   [S-10-5 5 V 2 A Regulated Switching Power Supply
        (110\~220 V)](http://dx.com/p/5v-2a-regulated-switching-power-supply-110-220v-94518)
        (DIY: requires additional micro-USB connector and wiring)
-   **Dell**
    -   USB Hub integrated in Dell monitors (B)
-   **DLO**
    -   5 V 1.0 A PowerBug (Model: SP05001000-A) Powers Pi, Wifi dongle
        and Webcam
-   **The FX Factory**
    -   5 V 1 A (1.2 A max) AC Travel Charger Model KJ-USB Mains.
        Typically provides 4.9 V at 1 A <sup>[[1]](#cite_note-1)</sup>
    -   5 V 2x1 A Dual Charger Model TR9202-MICRO. Typically provides
        4.8 V at 1 A per output. Can be used to power a Pi and, via a
        separate cable, a USB 4-port hub <sup>[[2]](#cite_note-2)</sup>
-   **Garmin**
    -   5 V 1 A charger (Model: PSA105R-050Q) supplied with Garmin Edge
        800 GPS. Requires a USB-A to MicroUSB-B cable. Belkin 6 ft cable
        (F3U151B06) works.
-   **Gembird**
    -   5 V 2 A Universal USB Charger (Model: MP3A-UC-AC5). Test: 1080p
        TV (1xHDMI), USB Wi-fi adapter (1xUSB), wireless keyboard and
        mouse (1xUSB). Results: \~5.3V, works without any problems (own
        usb cable required).
-   **Globe Electric**
    -   2-Outlet Tap with Surge Protection and 2 USB Chargers
        ([46082](http://globe-electric.com/product/2-outlet-tap-with-surge-protection-and-2-usb-chargers-grounded-white/)).
        Rated at 1000 mA. 120 V systems only.
-   **Griffin**
    -   Power Block Model P2417. 5 V 2.1 A
    -   Power Block Model P1190R2 Two USB 5 V Outputs, 1 A each
-   **Hama**
    -   1000 mA Travel Charger for Micro USB universal (barcode nr: 4
        007249 935854)
-   **Hartig + Heiling GmbH & Co. KG**
    -   H+H SN 6 USB
-   **HP**
    -   5.3 V 2 A Charger for HP Touchpad (B)
-   **HTC**
    -   5 V 1 A TCP-300 USB phone charger (B)
    -   5 V 1 A TC B250 USB charger (HTC R/N: 79H00096-00M)
    -   5 V 1 A TC E250 USB charger (HTC R/N: 79H00098-02M)
-   **i-box (Philex Electronic Ltd)**
    -   5 V 1 A USB charger, 1 USB socket, no USB lead supplied, Model:
        76971HS/02 (available from ASDA and others in the UK) (B).
-   **IDAPT**
    -   [i4 multi device
        charger](http://www.idaptweb.com/universal_chargers/i4/) - 3
        interchangeable device tips + USB A socket ([see it in
        use](https://twitter.com/andrewmk/status/226057302879375361))
-   **Innergie**
    -   15 W Dual USB Adapter. Model: mMini AC15. Output: 5 V, 3 A (max
        per port), 15 W max. [Specification
        sheet](http://www.myinnergie.com/DuoPowerKit/specification.aspx)
-   **ICIDU**
    -   PI-707730 charger 5V 2.1A, sometimes drops current to \~1.3A
        during heavy use, but still enough to power the Pi.
-   **Kodak**
    -   5 V 1 A TESA5G1-0501200
    -   5 V 1.0 A K20-AM
-   **König**
    -   5 V 1 A PSUP-GSM01
-   **Kuanten**
    -   Model SSA051F050100USU, 1A output
-   **LG**
    -   4.8 V 1 A Travel Adapter
    -   5.1 V 0.7 A Travel Adapter (Model: STA-U34WVI)
    -   5.1 V 0.7 A Travel Adapter (Model: STA-U12ER)
-   **Logic**
    -   4 port USB Hub (Model LP4HUB10). (Raspberry Pi running from USB
        Hub port, red power line (+5 V) inside hub cut) (B)
-   **LogiLink**
    -   5 V 2.1 A Switching power supply, model PA0040 (B)
-   **Logitech**
    -   5 V 1 A SDC115-USB Remote Control Charger and cable
-   **Maplin Electronics**
    -   5 V 1 A dual USB power supply, model number H25B-MT-K2
    -   Micro USB Power Supply N19HX
-   **Medion**
    -   5 V 1 A USB power supply for OYO ebook reader
-   **Microsoft**
    -   -   Zune Zune AC Adapter v2

-   **ModMyPi**
    -   [5.25V 2A HQ Raspberry Pi USB Power
        Supply](https://www.modmypi.com/shop/5v-2A-modmypi-raspberry-pi-power-supply)
        (Detachable USB) [5.01 - 5.07V @ T1/T2 with Wifi dongle and
        Wireless Mouse/Keyboard on RPi USB ports]
-   **Motorola**
    -   [5 V 0.85 A SPN5504 Charger with
        Cable](http://www.amazon.com/Motorola-Micro-USB-Home-Travel-Charger/dp/B004EYSKM8/)
-   **Noname**
    -   5 V 2.1 A KMS-AC09 4 port USB charger (B)
        [[10]](http://www.miniinthebox.com/kms-ac09-universal-ac-adapter-for-ipad-ipad-2-iphone-white_p208568.html)
    -   5.2 V 1 A MW-3NU10GT - no cable, but this one works well (1m):
        [[11]](http://www.amazon.de/gp/product/B005L8VELA)
    -   5 V 1 A Model H-IP008 Serial No. H10T80L068
    -   5 V 1 A Travel charger Model MSH-TR-018A
        [reseller1](http://www.akizz.com/catalog/product/chargeur-secteur-rapide-de-voyage-70/galaxy-duos-s7562),
        [reseller2](http://www.sepdistribution.fr/produit-2496.html)
    -   5V 2A Mobile Charger For Galaxy S4 NOTE 2 N7100 N7000 With USB
        Cable(in India)
        [Ebay.in](http://cgi.ebay.in/ws/eBayISAPI.dll?ViewItem&item=271603546214)
-   **Novatel Wireless**
    -   5 V 1.05 A Charger, model number SSW-1811, packaged with Verizon
        Wireless MiFi device
-   **Orange**
    -   5 V 0.7 A Charger for Orange San Francisco
-   **Palm**
    -   5 V 1 A Charger for Palm Pixi+ (B)
-   **Pantech**
    -   5.0 V 1 A CNR USB with LG DLC100 micro USB cable
-   **Petzl**
    -   5.0 V 1 A Charger that came with the Tikka core2 XP
-   **Phihong**
    -   Switching Power Supply. Model: PSAC09R-050. Output: 5 V, 1.8 A,
        microUSB. [Digi-key
        Link](http://www.digikey.com/product-detail/en/PSAC09R-050/993-1109-ND/2635771)
-   **Pi Supply**
    -   [5.25V 1.5A Raspberry Pi USB Power
        Supply](http://www.pi-supply.com/product/uk-micro-usb-raspberry-pi-power-supply-5v-1500ma/)
        Specially designed for the Pi. Comes in 4 varieties for
        worldwide compatibility - UK, European (EU), American (USA) and
        Australian (AUS).
-   **PortaPow**
    -   PortaPow UK Mains Wall Power Supply
-   **PowerGen**
    -   PowerGen Dual Port USB 2.1A 10W AC Travel Wall Charger. [Amazon
        Link](http://www.amazon.com/gp/product/B0073FCPSK)
-   **Rayovac**
    -   Universal USB Charger Model: PS69 100-240 VAC to 5 V 1 A (small
        cube w/folding plug) works w/wireless keyboard/mouse and
        mini-Wifi connected
-   **RhoTech**
    -   [RH-PS001](http://www.rhotech.eu/index.php?id_product=10&controller=product)
        5V/2A, dedicated for Raspberry Pi, integrated MicroUSB cable.
        Stable with Raspbmc and WiFi card.
    -   [RH-PS002](http://www.rhotech.eu/index.php?id_product=11&controller=product)
        5V/2.1A dual USB Power Supply.
-   **RS Components'**
    -   HNP06UK (RS 7263069) Switching Adapter 5.0 V 1200 mA
        [[12]](http://uk.rs-online.com/web/p/plug-in-power-supply/7263069)
-   **Samsung**
    -   5 V 0.7 A Charger for Galaxy S model ETA0U10EBE
    -   5 V 0.7 A Charger for Galaxy SII
    -   5 V 1 A Charger for Galaxy SIII
    -   5 V 1 A Charger for Galaxy Nexus
    -   5 V 0.7 A Charger for Galaxy S Vibrant (SGH-T959)
    -   5 V 0.7 A Travel Adapter model ATADU10EBE
    -   5 V 1 A? Samsung C Series TV USB-port for external HDDs. Running
        stable with openelec
    -   5 V ?A (Unknown) Samsung Service Port (USB) on LN32A330J1DXZA
        720p 32 inch HDTV
    -   5 V Unknown Ampere Samsung UA22D5000 & UA32D5000 TV USB Port.
        Test with Raspbian Wheezy, Raspbmc, and RPITC
    -   5 V 2 A charger for Galaxy Note 2; model ETA-U90EWE (works with
        cam module, Edimax wifi, SD card and analog audio out, even down
        to 4.62 V on model B rev 1).
-   **Shun Shing**
    -   100-240 VAC to 5 VDC 1 A USB power supply, model SP5Q-AU
        [Jaycar](http://jaycar.co.nz/productView.asp?ID=MP3455)
-   **Sony Ericsson**
    -   5 V 0.7 A Charger CST-80
    -   5 V 0.85 A Greenheart™ Charger EP800. Typically provides 4.8 V
        at 0.85 A <sup>[[3]](#cite_note-3)</sup>.
-   **StarTech**
    -   4 Port USB 2.0 Hub Raspberry Pi can be powered just by plugging
        USB input into the Raspberry Pi, don't need power in micro USB
        port.
-   **Travel Charger**
    -   5 V 2.0 A USB Power Adapter, [Amazon
        Link](http://www.amazon.co.uk/gp/product/B0065JCIPU/)
-   **Technika**
    -   5 V 1 A USB Power Adapter, model MPASS01 (B)
-   **Tinpec**
    -   5 V 2 A USB Power Adapter model RG-AAC210, sold by Elro as
        AV323S
-   **Trisonic**
    -   TS-CP600T - MICRO USB HOME & TRAVEL CHARGER (5 V, 800 mA) \$3 at
        Daiso U.S. stores.
-   **TruePower**
    -   [U-Socket](http://u-socket.com/) 5 V 2.1 A AC Receptacle with
        Built-in USB ports (2.1 A per USB port) model ACE-7169
-   **Turnigy**
    -   TURNIGY [3A
        UBEC](http://hobbyking.com/hobbyking/store/__4319__TURNIGY_3A_UBEC_w_Noise_Reduction.html)
        w/ Noise Reduction, connected to GPIO Pins
-   **Voltcraft**
    -   SPS5-12W, 2500 mA, requires additional USB \<-\> miniUSB
        adapter/cable, works perfectly (bought from [Conrad
        Shop](http://www.conrad.de/ce/de/product/512660/VOLTCRAFT-SPS5-12W-Steckernetzteil-Steckernetzgeraet-5-VDC-2500-mA-12-Watt))
-   **ZTE**
    -   ZTE Blade charger STC-A22O501700USBA-A 5 V 700 mA

### Problem power Adapters

-   **Nokia**
    -   5 V 1.2 A AC-10A & AC-10E Chargers only provide 4.8V at TP1 &
        TP2
    -   [5 V 1 A AC-16E
        Charger](http://accessories.nokia.com/products/nokia-fast-usb-charger-ac-16/)
        Provides only 4.7V across TP1 & TP2 when at idle

-   **Masterplug**
    -   Masterplug Surge Protected USB Adaptor 2 x 1 A USB Polished
        Black - USB ports and Ethernet don't work with this adapter and
        some screen artifacts using HDMI.
-   **Monoprice**
    -   5 V, 2 A 3 Outlet Power Surge Protector Wall Tap with 2 Built-In
        USB Charger - some display artifacts, sometimes unable to find
        mouse, some failures to boot. Measured to less than 4.75 V
        between TP1 and TP2 when used with a Monoprice cable.
-   **Sony Ericsson**
    -   5 V, 850 mA EP800. Some failures to boot, Ethernet loops at
        boot.

### Working external Battery packs (with 5 V regulated output)

-   **Anker Astro3**
    -   Anker Astro3 10000 mAh with dual 2 A USB output
-   **Duracell**
    -   PPS2 Instant USB Charger
-   **EasyAcc**
    -   PB12000A 12000 mAh battery with 2.1 A USB output
-   **Energizer/XPAL**
    -   XP18000 18000 mAh Power Pack
-   **Generic - eBay no brand**
    -   6000T Pocket Power 5000 mAh - eBay item 271009959140
    -   Power Bank for iPad/iPhone 5000 mAh (looks the same as a New
        Trent IMP50D or TeckNet iEP380) - eBay item 280914455938
-   **Mophie**
    -   38113BBR Juice Pack Powerstation 4000 mAh: output 2.1 A max:
        included charging cable powers RPi, 7.5 hrs light use w/keyboard
        and mini-Wifi on RPi ports
-   **iEnjoy**
    -   MyBolt 2600mAh
-   **New Trent**
    -   iCurve IMP70D 7000 mAh (Approx 12 hours from full charge)
    -   IMP120D 12000 mAh
-   **Sinoele**
    -   Movpower - Power Bank 5200 mAh (8 hours with Wi-Fi active)
-   **TeckNet**
    -   iEP387 Dual-Port 7000 mAh External Power Bank (The charging lead
        can be used to connect the Tecknet to the Raspberry Pi. Ran the
        Raspberry Pi with Wi-Fi dongle and wireless keyboard receiver
        for over 9 hours of light use.)
    -   iEP392 Dual-Port 12000 mAh External Power Bank (1 A port, \~16.5
        hours)
    -   Rayovac PS60 5 V 800 mAh
-   **VINZO**
    -   Power Bank 5000 mAh Grey Output 5 V 1000 mA
-   **Kodak Power Pack KP1000**
    -   1 A USB rechargeable battery pack - see [Shea Silverman's
        blog](http://blog.sheasilverman.com/2012/09/its-alive/)
-   **Swees**
    -   Swees® 12000mAh Smart Power Bank (Output: 5V / 4.2A max)

## LCD touch screen add-ons

## Display adapters

Note that active converter boxes may draw power through the HDMI port,
and thus will put an extra load on your PSU, and also increase the
current running through the Raspberry Pi's primary input fuse. HDMI
ports (and the raspberry PI) are designed so that they deliver a very
limited amount of power (50 mA) to the TV/Monitor/display-adapter and
much more isn't in theory allowed. In fact there is a diode (D1) in
series with the power line which can only handle 200 mA, if the adapter
tries to draw much more than that the diode might fail. Therefore only
externally powered adapters are to be recommended. Despite this, many
people report success with non externally powered devices. If you have
bought a non externally powered HDMI to VGA adapter, and you experience
problems with it (It behaves badly, D1 burns out, F3 "blows", or your
PSU overloads), then not all is lost, there are cheap (a few dollars)
adapters that allow you to add external power to the HDMI cable! An
example can be found here:
[[13]](http://dx.com/p/hdmi-male-to-hdmi-female-adapter-w-power-input-port-black-155361).

### HDMI-\>DVI-D cables

HDMI to DVI-D cables, or HDMI cables with an DVI-D adapters should work,
connected to a DVI-D monitor, that is because both HDMI and DVI use the
same kind of digital signaling (LVDS). The only limitation being that
DVI-D misses the signal channel for audio.

There are three kinds of DVI. There is DVI-D, a digital signal fully
compatible with HDMI, so a passive cable can be used. There is DVI-I,
which is a connector with both analog pins and digital pins. An HDMI to
DVI-D adapter fits in a DVI-I female connector. Finally, there is DVI-A.
This a fairly rare connection, but occasionally it will be found on some
monitors and is an analog interface, in fact the same as VGA! In any
case, you may need to change
[config.txt](http://eLinux.org/RPi_config.txt "RPi config.txt") hdmi\_force\_hotplug=0 to
=1 if your display does not receive DVI signal (the analog output is
likely active).

Some adapters like Farnell part AK-CBHD03-BK are HDMI to DVI-I, which,
while not fitting in a DVI-D monitor, are still compatible. The analog
pins simply must be bent.

The HDMI to DVI-D cable provided by Apple with the 2010 Mac Mini worked.
It does not appear this adapter can be purchased separately.

-   **The Pi Hut**
    -   HDMI to DVI Cable for the Raspberry Pi (from [The Pi Hut's
        Raspberry Pi
        Store](http://thepihut.com/collections/video-output/products/hdmi-to-dvi-cable-for-the-raspberry-pi))
-   **Other Variants**
    -   AmazonBasics HDMI to DVI Adapter Cable (model SK231) works and
        is inexpensive.
    -   [A generic HDMI-to-DVI converter from
        eBay](http://www.ebay.com/itm/DVI-Female-to-HDMI-Male-Adapter-Converter-Adaptor-Gold-for-HDTV-Full-HD-/320946033059?pt=US_Video_Cables_Adapters&hash=item4ab9dfd1a3).
        Works well, but it's probably the cause of some power loss
        between the Raspberry Pi and the monitor, causing
        [this](http://elinux.org/R-Pi_Troubleshooting#Interference_visible_on_a_HDMI_or_DVI_monitor)
        problem. A setting of config\_hdmi\_boost=**5** in /etc/boot
        solved this. Note that config\_hdmi\_boost=**4**, as suggested
        in the troubleshooting guide, helped, but it did not solve the
        problem completely.

### HDMI-\>VGA Cables

HDMI to VGA cables **do not work!** They rely on logic incorporated in a
video card that isn't available in a PI. Somehow such a video card
outputs analog signal on the otherwise purely digital HDMI connector,
that seems to be the only way for it to work. But normally HDMI cables
**never** carry analog signals and the PI surely doesn't output analog
signals either, almost no HDMI output device does, as its completely
against HDMI specifications.

### HDMI-\>VGA converter boxes

HDMI to VGA **converters** do work, they convert the digital serial data
streams from HDMI and using complex logic, and digital to analog
converters they convert the HDMI signal to the analog signals needed for
VGA, and sometimes also convert HDMI audio to an analog stereo signal.
But note that if they feed off the PI it can cause a problem, as the PI
only is designed to provide about 50mA to the (HDMI or DVI-D) monitor,
and these adapters use \>200mA, while the absolute maximum the PI can
let through is 200mA. These adapters also thus use about half the energy
that the PI (without USB devices) uses. Therefore its much better to use
an adapter that has an external power input. Alternatively there are
HDMI dongles (male to female HDMI adapters) that have a barrel input
connector to feed the adapter with.

It seems unlikely any of these HDMI-\>VGA converters could be used for
driving a SCART RGB SD CRT TV with a suitable lead (as shown here for
ATI/Nvidia PC output
[http://www.mythtv.org/wiki/RGB\_Scart](http://www.mythtv.org/wiki/RGB_Scart))
because they only output preset progressive resolutions, whereas the TV
will need an interlaced resolution and probably custom timings.

Most will require use
[RPi\_config.txt](http://eLinux.org/RPi_config.txt "RPi config.txt"). Start off with
hdmi\_safe=1.

**HDMI to VGA + audio adapter from DHgate**

-   Under six pounds with free international shipping
    [[14]](http://www.dhgate.com/product/hdmi-to-vga-output-projector-monitors-adapter/170509392.html)
    makes this worth the delivery time of just under 3 weeks. Works out
    of the box at 1024x768 without editing config.txt (I'll try editing
    for full HD later). Spec. says upto UXGA and 1080p with 10-bit DAC
    at 165MHz/1.65Gbps. Raspberry "tvservice -a" reports that it
    supports audio up to 192k at 24-bit. Sounded fine on my tiny
    speaker. Comes with 3.5mm stereo plug-to-plug cable and USB to mini
    barrel jack power cable which it doesn't need on the Pi. Ran mine
    for ages without the external power and the Pi's HDMI regulator
    never got more than 34 degrees C. Adapter weighs only 14.8g and can
    plug directly into the Pi or even via a 90-degree 'elbow' which I
    prefer to use. VGA signal is good enough to run 2 displays at once
    using a cheap splitter cable. After brief testing with good
    headphones, it seems there's some definite noise on a signal of
    17,500Hz and 18,500Hz is distorted. In contrast, the RPi's own
    analogue sounds clean at 17,500Hz. So you couldn't consider this an
    alternative to a good USB DAC.

**HDMI to VGA Cable adaptor from amazon**

-   At under ten pounds this one
    [[15]](http://www.amazon.co.uk/gp/product/B0088K7QUQ) is one of the
    cheapest, but perhaps due to a more advanced design is seems power
    frugal enough to most often work well with a Pi, it has many
    comments saying it works well with the Pi, and gives tips on how to
    edit config.txt.

**HDMI to VGA adapter from amazon - USA**

-   This one works with Pi, but does require config.txt edit.

[http://www.amazon.com/gp/product/B00JLRHMZE/ref=oh\_aui\_detailpage\_o00\_s00?ie=UTF8&psc=1](http://www.amazon.com/gp/product/B00JLRHMZE/ref=oh_aui_detailpage_o00_s00?ie=UTF8&psc=1)
Ableconn HDMI2VGAD Active HDMI to VGA Adapter Converter Dongle for
Desktop PC/Notebook up to 1920x1200 / 1920x1080 - HDMI to VGA HD15
monitor Price: \$17.99 (Mar. 13, 2015). One photo shows three Pi models
connected to VGA monitors. The AbleComm logo is on clear tape wrapped
around the adapter, apparently made for "private labeling". So, the item
is probably sold by other suppliers too. The adapter is very compact and
low-power, unlike some of the other adapters. My ViewSonic VA702b
monitor required: hdmi\_group=2 -- indicates VGA hdmi\_mode=35 -- 1280 x
1024, 60 Hz Prior to those changes, the picture color was mostly red,
but readable enough to log in and edit config.txt.

**Sanoxy HDMI to VGA converter**

-   [Sanoxy HDMI to VGA
    converter](http://www.element14.com/community/groups/raspberry-pi/blog/2012/08/16/raspberry-pi-hdmi-to-vga-converter)*,
    \$27 from Amazon, no changes required with official Raspbian Wheezy
    image (2012-Jul-15), note: had already disabled overscan previously*

**"Neewer" HDMI to VGA**

-   [http://www.amazon.co.uk/gp/product/B007KEIRNG](http://www.amazon.co.uk/gp/product/B007KEIRNG)
    -- "Neewer" HDMI to VGA -- some issues discussed below:

According to user "Tom1989" the same Neewer HDMI to VGA adapter burned
out BAT54 Schottky diode D1 on the Raspberry Pi and broke its HDMI
output: [Serious HDMI Problems. What's that smell? Burning
Raspberry!](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=28&t=9819).
On that thread, "mahjongg" suggested the NXP (or equivalent) PMEG2010AET
as a high-current replacement for D1. The PMEG2010AET has 1 A max
forward current, much greater than the BAT54's 200 mA limit which may be
exceeded by your HDMI -\> VGA converter. Remember that the converter's
current must come from your Raspberry Pi power supply and go through the
Micro USB cable and polyfuse F3, so you may get extra voltage drops
and/or cause F3 to trip depending on how much current the converter
uses. As always with board modifications, YMMV. Also on the same"
thread, user "pwinwood" reported the Neewer's current to be 400 mA,
which is twice the limit of BAT54 diode D1. "pwinwood" also took the
Neewer apart and added its own +5 V connection adapted from a USB cable,
which bypasses Raspberry Pi's Micro USB cable and polyfuse F3. Link to a
gallery with detailed images & steps of the same adapter modification:
[HERE](http://imgur.com/a/sLogs/all) --*by
[Pinoccio](http://eLinux.org/User:Pinoccio "User:Pinoccio")*

**"Kanaan" HDMI-VGA**

-   [http://www.amazon.co.uk/KanaaN-Adapter-Converter-Cable-Resolutions/dp/B007QT0NNW](http://www.amazon.co.uk/KanaaN-Adapter-Converter-Cable-Resolutions/dp/B007QT0NNW)
    -- "Kanaan" HDMI-VGA

**HDMI Male to VGA RGB Female HDMI to VGA Video Converter adapter**

-   [http://www.ebay.com/itm/ws/eBayISAPI.dll?ViewItem&item=130699741793](http://www.ebay.com/itm/ws/eBayISAPI.dll?ViewItem&item=130699741793)
    -- eBay is swarming with \$16 converters all like this one.

**HDMI to VGA 3.5mm Audio HDTV HD Video Converter**

-   This adapter --
    [http://www.ebay.co.uk/itm/300692770623](http://www.ebay.co.uk/itm/300692770623)
    -- works from 640x480 up to 1920x1080, audio over HDMI works too.

Sadly the IC's on the PCB have all been scrubbed. In-depth review
[http://raspi.tv/2013/hdmi-to-vga-video-converter-with-sound-for-raspberry-pi-review](http://raspi.tv/2013/hdmi-to-vga-video-converter-with-sound-for-raspberry-pi-review).
Requires HDMI boost and overscan,
[config.txt](http://eLinux.org/RPi_config.txt "RPi config.txt") settings for 640x480
@60 Hz:

    hdmi_drive=2
    hdmi_group=2
    hdmi_mode=4
    config_hdmi_boost=4
    overscan_top=-30
    overscan_bottom=-30
    overscan_left=-30
    overscan_right=-30

**HDFuryPro HDMI to YPbBr/VGA Converter**

-   HDFuryPro HDMI to YPbBr/VGA Converter found on Amazon --
    [[16]](http://www.amazon.co.uk/Inputs-Component-Video-YPbPr-Converter/dp/B00797ZZ4S/)
    -- Works with Raspberry Pi. Tested against a Philips 170B 1280x1024
    LCD monitor, producing a full native resolution image. Not tested
    against a Component Video TV yet, and audio has yet to be got
    working.

The [config.txt](http://eLinux.org/RPi_config.txt "RPi config.txt") settings used are:

    hdmi_drive=2
    hdmi_group=2
    hdmi_mode=36
    disable_overscan=1

**HDFury1 1080p HDMI to VGA Converter**

-   HDFury1 1080p HDMI to VGA Converter from HDFury.com. I'm not sure
    the HDFury1 can be got a hold of easily nowadays, I happened to have
    access to one to try out. HDFury2, 3 and 4 are available as far as I
    can tell, but it is very pricey compared to the alternatives.
    HDFury1 was around £80 when we bought one for a project at work.
    HDFury2 seems to be around £130, 3 and 4 are getting on towards £200
    or more. So not to be recommended as a solution unless you happen to
    have one lying around. I don't believe there is any relationship
    between the company that produces these and the HDFuryPro I bought
    for myself (See above). I didn't alter any config settings, just
    plugged it in. It doesn't work without having its external power
    supply connected, as it requires 0.4 A, which is too much draw for
    the 5 V supply available from the HDMI socket on the Raspberry Pi.
    Its power LED lights, but no picture is produced. In comparison to
    the HDFuryPro this picture from this device is sharper, but it is
    not enough to justify the extra cost.

The [config.txt](http://eLinux.org/RPi_config.txt "RPi config.txt") settings used are:

    hdmi_drive=2
    hdmi_group=2
    hdmi_mode=36
    disable_overscan=1

**Cable Matters Gold Plated Premium HDMI to VGA**

-   [http://www.amazon.co.uk/gp/product/B007SM7O2U/](http://www.amazon.co.uk/gp/product/B007SM7O2U/)
    - "Cable Matters"

Or in the US:

-   [http://www.amazon.com/gp/product/B00879DM56](http://www.amazon.com/gp/product/B00879DM56)
    - "Cable Matters Active HDMI to VGA Adapter" I've seen mixed results
    with this one; it seems to work the very first time I try it on a
    given monitor, but then I can't seem to get it to work afterwards.
    I've tried various combinations of the other settings shown in this
    section with no success.

How to get working if no output: edit config.txt

    hdmi_drive=2
    hdmi_group=2
    hdmi_mode=36 #1280x1024 - change to desired resolution
    hdmi_force_hotplug=1

Turn on the RaspberryPi with the adapter plugged into the HDMI port and
the microUSB cord plugged into the adapter. Having the microUSB cord
plugged in is critical for it to work. With the Pi still on, unplug the
adapter from the HDMI port and remove the VGA cable from the adapter.
Now unplug usb cord from the adapter and immediately plug back in. Only
the microUSB power cord should be plugged in. Now plug the VGA cord back
into the adapter. Both the power cord and the VGA cord should be plugged
into the adapter. Plug the adapter back into the HDMI port. Now it
should be working. From playing around with the device on my laptop I
found that the adapter needs power to be able to tell what the
resolution of the VGA monitor is. If it is unable to find the VGA
resolution it will not work. Unplugging the HDMI, VGA, and power cord
seems to reset the device. Plugging the microUSB cable in seems to turn
on the device, allowing VGA resolution detection to work. This method
will probably work by just starting the Pi with no adapter plugged in,
then just plug in the microUSB, VGA, and HDMI cable in that order.

**HDMI V1.4 Male to VGA Female Converter Adapter**

-   [http://www.dealextreme.com/p/hdmi-v1-4-male-to-vga-female-converter-adapter-cable-white-15cm-130458](http://www.dealextreme.com/p/hdmi-v1-4-male-to-vga-female-converter-adapter-cable-white-15cm-130458),
    is cheap (it's free shipping from china) and works perfectly, I
    tested it with an Acer VGA monitor (AL1511), without no change in my
    XBMC distribution.

The config.txt for Raspbian (Flatron VGA monitor 1024 \* 768):

    hdmi_drive=2
    hdmi_group=2
    hdmi_mode=16
    hdmi_force_hotplug=1
    disable_overscan=0

**HDMI - VGA [lontium chip]**

-   [http://cgi.ebay.pl/ws/eBayISAPI.dll?ViewItem&item=251086464644](http://cgi.ebay.pl/ws/eBayISAPI.dll?ViewItem&item=251086464644).
    It is very cheap, but it works perfectly. No config.txt changes was
    needed at all. I've booted Raspbian and OpenELEC. Monitor is
    detected correctly and the optimal resolution is set (Raspbian) or
    you can change the res in the menu (OpenELEC). The
    /opt/vc/bin/tvservice is able to read monitor edid data. I tested
    the adapter using NEC 72VM 15" LCD. (1280x1024 60 Hz, 1024x768
    60 Hz, 640x480 works) The adapter is based on Lontium LT8511A chip,
    but I was unable to get the specification for it. The D1 diode is
    getting very hot though. Most likely the adapter drives more than
    200 mA. The standard RS Components 1.2 A USB power supply is able to
    provide enough power for the Raspberry Pi and the adapter. I'll try
    to modify the adapter to connect external power to bypass D1.

**Pi-View HDMI-VGA converter**

-   The "Pi-View" was designed specifically for use with the Raspberry
    Pi. It does work although the small box gets warm and the video
    output isn't great (slightly fuzzy text, smaller screen area even
    with overscan enabled)
    [[17]](http://canada.newark.com/element14/piview/cable-assembly-hdmi-to-vga-adapter/dp/07W8937)

### DVI-D -\> VGA active adapters

None are currently listed

### Composite-\>SCART

SCART adapters (SCART plugs with three RCA connectors in the back), will
probably work when used with the yellow RCA plug connected to the
Raspberry Pi's RCA video output. Additionally using a splitter cable
(3.5 mm jack plug on one end, and red-white RCA plugs on the other end)
will probably work when plugged into the red and white (left and right
audio channels) of the SCART adapter.

-   Generic - works

### Composite-\>VGA converter boxes

-   [Extron
    DVS-204](http://www.extron.com/product/product.aspx?id=dvs204) -
    works no problem!

## Boblight hardware

**Lightberry**

-   [http://lightberry.eu](http://lightberry.eu) it's the first (I
    think), dedicated hardware for Raspberry Pi that can produce
    colorful effects behind your TV, when you watch movies or even
    pictures. It uses GPIO pins (not USB). It is easy to configure - you
    can even download configured system image from the producer website.
    Works perfectly :)

## SD cards

The SD card section has been moved to a separate page. See [RPi SD
cards](http://eLinux.org/RPi_SD_cards "RPi SD cards")

## Foreign Language Translations

-   [Ru:RaspberryPiBoardVerifiedPeripherals](http://eLinux.org/Ru:RaspberryPiBoardVerifiedPeripherals "Ru:RaspberryPiBoardVerifiedPeripherals")

## References

1.  [↑](#cite_ref-1)
    [http://www.cpmspectrepi.webspace.virginmedia.com/raspberry\_pi/MoinMoinExport/USBPowerSupplies.html](http://www.cpmspectrepi.webspace.virginmedia.com/raspberry_pi/MoinMoinExport/USBPowerSupplies.html)
2.  [↑](#cite_ref-2)
    [http://www.cpmspectrepi.webspace.virginmedia.com/raspberry\_pi/MoinMoinExport/OtherTestedPSUs.html\#FX\_Factory\_Dual\_Charger\_TR9202-MICRO](http://www.cpmspectrepi.webspace.virginmedia.com/raspberry_pi/MoinMoinExport/OtherTestedPSUs.html#FX_Factory_Dual_Charger_TR9202-MICRO)
3.  [↑](#cite_ref-3)
    [http://www.cpmspectrepi.webspace.virginmedia.com/raspberry\_pi/MoinMoinExport/USBPowerSupplies.html](http://www.cpmspectrepi.webspace.virginmedia.com/raspberry_pi/MoinMoinExport/USBPowerSupplies.html)

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
- **Other Peripherals (Keyboard, mouse, hub, wifi...)**

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

♦ nbsp;V 1nbsp;V 1000


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [ARM Development
    Boards](http://eLinux.org/Category:ARM_Development_Boards "Category:ARM Development Boards")
-   [Broadcom](http://eLinux.org/index.php?title=Category:Broadcom&action=edit&redlink=1 "Category:Broadcom (page does not exist)")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")
-   [Education](http://eLinux.org/Category:Education "Category:Education")

