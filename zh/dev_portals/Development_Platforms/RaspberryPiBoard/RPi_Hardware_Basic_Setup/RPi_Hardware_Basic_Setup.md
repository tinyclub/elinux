> From: [eLinux.org](http://eLinux.org/RPi_Hardware_Basic_Setup "http://eLinux.org/RPi_Hardware_Basic_Setup")


# RPi Hardware Basic Setup



<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Typical_Hardware_You_Will_Need">1 Typical Hardware You Will Need</a>
<ul>
<li><a href="#Power_Supply">1.1 Power Supply</a>
<ul>
<li><a href="#Power_Switch">1.1.1 Power Switch</a></li>
</ul></li>
<li><a href="#Prepared_Operating_System_SD_Card">1.2 Prepared Operating System SD Card</a></li>
<li><a href="#Keyboard_.26_Mouse">1.3 Keyboard &amp; Mouse</a></li>
<li><a href="#Display">1.4 Display</a></li>
<li><a href="#Cables">1.5 Cables</a></li>
<li><a href="#Network_.2F_Internet_Connectivity">1.6 Network / Internet Connectivity</a></li>
<li><a href="#USB-Hub">1.7 USB-Hub</a></li>
<li><a href="#Real_Time_Clock">1.8 Real Time Clock</a></li>
<li><a href="#Another_PC">1.9 Another PC</a></li>
</ul></li>
<li><a href="#Connecting_Together">2 Connecting Together</a></li>
<li><a href="#Additional_Peripherals">3 Additional Peripherals</a>
<ul>
<li><a href="#Heatsink">3.1 Heatsink</a></li>
<li><a href="#Case">3.2 Case</a></li>
<li><a href="#SD_card_reader">3.3 SD card reader</a></li>
<li><a href="#Expansion_.26_Low_Level_Peripherals">3.4 Expansion &amp; Low Level Peripherals</a></li>
</ul></li>
<li><a href="#External_Links">4 External Links</a></li>
<li><a href="#References">5 References</a></li>
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

***Basic Setup** - for help with buying / selecting other hardware and
setting it up.*

*[Beginners Guide](http://eLinux.org/RPi_Beginners "RPi Beginners") - you are up and
running, now what can you do?*

*[Advanced Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") - for more
extensive information on setting up.*

*[Trouble Shooting](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting") - some
things to check if things don't work as expected.*

# Typical Hardware You Will Need

You may have decided to buy a Raspberry Pi because you think it is
great, it helps if you have an idea of what you want to do with it. You
buy the board, but you will need some extra parts to be able to use it.
Some of those parts you may have around so you can use them, some you
might buy that others have given away or sold, and some you buy
yourself. Consider what you buy; you might get very little benefit from
an expensive item over a cheap one.

The Raspberry Pi can be used in the conventional computer configuration,
with a keyboard, mouse and display, or in a "headless" configuration
where it is available on a network and is controlled from another
computer on that network. You can add a range of additional peripherals
to the Pi; the first section of this page covers setting up the Pi with
the minimum number of peripherals to make sure that you can get it
working. Additional peripherals are covered in the second section.

<table>
<thead>
<tr class="header">
<th align="left">Item</th>
<th align="left">Conventional</th>
<th align="left">Headless</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><a href="http://elinux.org/RPi_Buying_Guide" title="RPi Buying Guide">Raspberry Pi board</a></td>
<td align="left">Yes</td>
<td align="left">Yes</td>
</tr>
<tr class="even">
<td align="left"><a href="#Power_Supply">Power Supply</a></td>
<td align="left">Yes</td>
<td align="left">Yes</td>
</tr>
<tr class="odd">
<td align="left"><a href="#Prepared_Operating_System_SD_Card">SD Card + OS</a></td>
<td align="left">Yes</td>
<td align="left">Yes</td>
</tr>
<tr class="even">
<td align="left"><a href="#Keyboard_.26_Mouse">USB keyboard</a></td>
<td align="left">Yes</td>
<td align="left">No</td>
</tr>
<tr class="odd">
<td align="left"><a href="#Keyboard_.26_Mouse">USB mouse</a></td>
<td align="left">If using a GUI desktop</td>
<td align="left">No</td>
</tr>
<tr class="even">
<td align="left"><a href="#Display">Display</a></td>
<td align="left">Yes</td>
<td align="left">No</td>
</tr>
<tr class="odd">
<td align="left"><a href="#Cables">Display cable</a></td>
<td align="left">Yes</td>
<td align="left">No</td>
</tr>
<tr class="even">
<td align="left"><a href="#Cables">Network cable</a></td>
<td align="left">If network / internet</td>
<td align="left">Not possible if Model A; Yes if not WiFi</td>
</tr>
<tr class="odd">
<td align="left"><a href="#Network_Connectivity">WiFi USB adapter</a></td>
<td align="left">If network / internet</td>
<td align="left">If model A, Yes; Yes if not cabled</td>
</tr>
<tr class="even">
<td align="left"><a href="#USB_Hub">Powered USB hub</a></td>
<td align="left">If High Power USB device</td>
<td align="left">No</td>
</tr>
<tr class="odd">
<td align="left"><a href="#Another_PC">Another PC / laptop, etc</a></td>
<td align="left">No</td>
<td align="left">Yes</td>
</tr>
</tbody>
</table>


 **IMPORTANT** For USB devices other than a mouse and a simple wired
keyboard (for USB devices drawing more than 100mA) a powered USB hub is
strongly recommended. A technical discussion as to why can be found
[here](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=24&t=5830).
Specifically the RPi's built in USB hub is designed only for "Single
current unit" USB devices. Note that when using Revision 2 (or later)
boards the problem has been mitigated somewhat with the removal of the
USB polyfuses, still due to the limited current the PI can provide to
USB devices, due to its main polyfuse, its still recommended to use a
hub for all USB peripherals requiring more than 100mA.

Other, optional equipment includes:

-   [Case](#Additional_Peripherals)
-   [SD card reader](#Additional_Peripherals) - if you need to prepare
    your own SD card
-   [Power Supply Switch](#Power_Supply) - if you want an easy way to
    cycle power

## Power Supply

The unit uses a Micro USB connection to power itself (only the power
pins are connected - so it will not transfer data over this connection).
A standard modern phone charger with a micro-USB connector will do, but
needs to produce at least 700mA at 5 volts (Model B). Check your power
supply's ratings carefully, and [beware cheap
knock-offs!](http://www.raspberrypi.org/forum/general-discussion/power-supply-warning).

**Pi Specific power supplies**

A few power supplies have been manufactured *specially* for the
Raspberry Pi to account for voltage drop due to the high current draw of
the Raspberry Pi when compared to typical (phone charging etc.) duties.

-   A 5V 2A supply available in UK, EU and USA varieties from [The Pi
    Hut](http://thepihut.com/collections/raspberry-pi-power-supplies)

-   A 5V 2A supply designed specifically for use with the Raspberry Pi
    is also available from
    [ModMyPi](http://www.modmypi.com/raspberry-pi-accessories/5v-2A-modmypi-raspberry-pi-power-supply)


 You can alternatively use a range of other power sources (assuming they
are able to provide enough current \~700mA):

-   Computer USB Port or powered USB hub (will depend on power output)
-   Special wall warts with USB ports
-   Mobile Phone Backup Battery (will depend on power output) (in theory
    - needs confirmation)
-   Modern TV with built-in USB (for example, it has been shown to work
    with the Sony KDL-40HX723 and KDL-55NX813)
-   Internet Routers with USB Ports (the BT Home Hub 3 seems to run the
    Pi nicely)

To use the above, you'll need a USB A 'male' to USB micro 'male' cable -
these are often shipped as data cables with mobile phones, So you should
have a lot. Unless you use iPhones and only iPhones.

### Power Switch

Additionally, the Raspberry Pi does not have the functionality of an
on/off switch like traditionally seen on a PC. [Pi
Supply](http://www.pi-supply.com) have for sale an [add on
board](http://www.pi-supply.com/product/pi-supply-raspberry-pi-power-switch/)
that introduces this functionality, allowing you to easily manage power
on your Raspberry Pi, without wearing out your back, or the micro-USB
socket on the Pi. It also includes a safe shutdown switch to avoid
corruption of your SD card. (Also, you can use the built in switch in
your power outlet if you have it.)

*For detailed information about power requirements see [RPi Hardware -
Power](http://eLinux.org/Rpi_Hardware#Power "Rpi Hardware").*

## Prepared Operating System SD Card

The RPi has no internal storage or built-in boot code, so it requires an
SD-Card that is set up to boot the RPi. You should look at the [RPi Easy
SD Card Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") page
for instructions about buying a preinstalled card or creating your own
loaded SD Card. A USB Device can take over after the initial bootup.
(BerryBoot)

## Keyboard & Mouse

Most standard USB keyboards and mice will work with the RPi. Wireless
keyboard/mice should also function, and only require a single USB port
for an RF dongle. In order to use a Bluetooth keyboard or mouse you
would need to use a Bluetooth dongle, which again uses a single port.

Remember that the Model A has a single USB port and the Model B only has
two (typically a keyboard and mouse will use a USB port each) - see [USB
Hub](http://eLinux.org/RPi_Hardware_Basic_Setup#USB-Hub "RPi Hardware Basic Setup")
below.

*To check your mouse and keyboard are compatible with Linux, see [RPi
Verified
Peripherals](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals").*

## Display

There are two connection options for the RPi display, *HDMI* (high
definition) and *composite* (low definition).

-   HD TVs and most LCD Monitors can be connected using a standard HDMI
    cable. (A cable with a "male"/"plug" connection on the Raspberry Pi
    end and whatever your display uses on the other end). HDMI versions
    1.3 and 1.4 are supported, and a version 1.4 cable is recommended.
    The RPi outputs audio and video via HDMI, but does not have an HDMI
    input.

-   Most older TVs can be connected using composite (a yellow-to-yellow
    cable). PAL and NTSC TVs are supported. Note that the RCA output is
    composite video, not RF, so it cannot be connected directly to the
    antenna input of a TV. You need to connected it to the yellow video
    input connector, or to the SCART input using a RCA to SCART plug
    (adapter). Note that on the model A+ and B+ Raspberry Pi's the
    composite video output has been combined with the audio connector so
    you will need a special cable to allow access to the video output.
    See
    [http://www.raspberrypi-spy.co.uk/2014/07/raspberry-pi-model-b-3-5mm-audiovideo-jack/](http://www.raspberrypi-spy.co.uk/2014/07/raspberry-pi-model-b-3-5mm-audiovideo-jack/)
    for details of the exact cable required.

It is possible to use a monitor with a DVI input by using an HDMI to DVI
adapter or adapter cable. The Raspberry Pi can also be connected to a
display with a VGA input through the use of an HDMI to VGA converter.
Note however that a simple HDMI to VGA cable will not work - it needs to
be an "active" converter.

The Raspberry Pi will normally output sound on either the HDMI
connection or the 3.5mm analogue output. You can send the sound output
from the analogue output of the Raspberry Pi to your TV using a cable
that adapts from 3.5mm TRS to double (red and white) RCA connectors.
These red and white can go into the red and white RCA plug inputs of a
TV, or a stereo set, or to the above mentioned RCA to SCART plug. On the
model A+ and B+ Raspberry Pi's you will need a special TRRS cable to
connect the audio if you also want access to the composite video output.
A 3.5mm TRS to dual (red and white) RCA cable will work for the audio if
you don't need the composite video output. See
[http://www.raspberrypi-spy.co.uk/2014/07/raspberry-pi-model-b-3-5mm-audiovideo-jack/](http://www.raspberrypi-spy.co.uk/2014/07/raspberry-pi-model-b-3-5mm-audiovideo-jack/)
for details of the exact cable required. Another option for analogue
audio is to connect the 3.5mm jackplug to an amplified speakerset. Do
not connect the 3.5 mm jack directly to a headset, as the 3.5 mm audio
output isn't suitable to drive headsets, only amplifier inputs.
Attaching a low impedance load, (such as a headset) to the stereo audio
output may lead to distorted sound.

Using an HDMI to DVI-D (digital) adaptor plus a DVI to VGA adaptor will
not work. HDMI does not supply the DVI-A (analogue) needed to convert to
VGA - converting an HDMI or DVI-D source to VGA (or component) needs an
active converter. (It can work out cheaper to buy a new monitor).
Problems have been reported with converters if the power supply is not
adequate and the converter is not powered from its own power supply.

The Pi Hut offer two adapters that will allow the Raspberry Pi to be
used with multiple monitor formats

-   [Standard HDMI](http://thepihut.com/products/1-8m-hdmi-cable)
-   [VGA
    adapter](http://thepihut.com/products/pi-view-official-raspberry-pi-hdmi-to-vga-convertor)
-   [DVI
    adapter](http://thepihut.com/products/hdmi-to-dvi-cable-for-the-raspberry-pi)

*For detailed information see [Rpi
Screens](http://eLinux.org/Rpi_Screens "Rpi Screens").*

## Cables

You will probably need a number of cables in order to connect your RPi
up.

1.  Micro-B USB Power Cable (see above)
    [picture](http://en.wikipedia.org/wiki/File:MicroB_USB_Plug.jpg).
    This has to be a [high quality
    one](http://eLinux.org/On_the_RPi_usb_power_cable "On the RPi usb power cable").
2.  HDMI-A [picture](http://en.wikipedia.org/wiki/File:HDMI.jpg) or
    Composite cable
    [picture](http://en.wikipedia.org/wiki/File:Composite-video-cable.jpg),
    plus DVI adaptor
    [picture](http://en.wikipedia.org/wiki/File:Adapter_dvi_hdmi_S7302224_wp.jpg)
    or SCART adaptor
    [picture](http://en.wikipedia.org/wiki/File:Multiconnector-scart-chti.jpg)
    if required, to connect your RPi to the Display/Monitor/TV of your
    choice.
3.  Audio cable
    [picture](http://en.wikipedia.org/wiki/File:Audio-TRS-Mini-Plug.jpg),
    this is not needed if you use a HDMI TV/monitor.
4.  Ethernet/LAN Cable (see below)
    [picture](http://en.wikipedia.org/wiki/File:Ethernet_RJ45_connector_p1160054.jpg).

The price you pay for an HDMI cable can vary wildly and under most
circumstances a low-cost cable from a reputable online or local supplier
will be absolutely fine, but the definition of what constitutes 'low
cost' can vary wildly - for example, in the UK, a 1m cable can be
purchased for anything between £1 and £24.99. If, however, you want to
drive a display some distance from the RPi (say greater than the
ubiquitous 1.8m/6ft), or you are using a video switch to share a display
between several devices, then higher quality cables might be wise - for
example, a pair of 1m HDMI cables purchased in a UK 'pound shop' worked
fine when directly connected between the RPi and a display, but would
not give a stable picture when used via an HDMI switch. Replacing the £1
1m cable with a 1.5m cable bought online for £1.30 fixed the problem.
For more insight: [Why you don't need to spend more than £2 on an HDMI
cable](http://www.techradar.com/news/video/why-you-dont-need-to-spend-more-than-2-on-an-hdmi-cable-1071343)

Fully tested cables are available from [Pi
Supply](http://www.pi-supply.com), [The Pi Hut's Raspberry Pi
Store](http://thepihut.com/collections/cables), and [ModMyPi's Raspberry
Pi Shop](https://www.modmypi.com/raspberry-pi-accessories) offers a
range of High Quality coloured 'Noodle' cables.

## Network / Internet Connectivity

This may be an Ethernet/LAN cable (standard RJ45 connector) or a USB
WiFi adaptor. The RPi ethernet port is auto-sensing which means that it
may be connected to a router or directly to another computer (without
the need for a crossover cable<sup>[[1]](#cite_note-autoMDIX-1)</sup>).

*Support for USB WiFi adaptors will vary - see [RPi Verified
Peripherals](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals").*

Note: If a Netgear router has a blank in the fourth box of the subnet
mask, raspbian will interpret that as a 255, not as a '0' like Ubuntu.
This will give you a subnet mask of 255.255.255.255 and a useless
network connection. Changing the router's setting to put a '0' in the
last field and reinitializing the network will fix this.

## USB-Hub

In order to connect additional devices to the RPi, you may want to
obtain a USB Hub, which will allow multiple devices to be used.

It is recommended that a **powered** hub is used - this will provide any
additional power to the devices without affecting the RPi itself. The
USB ports are fused at about 140ma each without an additional external
power source. This is not enough to power a hard drive, and you may even
have trouble powering wireless adapters and other peripherals. There is
enough current out there, however, for mice and most keyboards. (see
[RPi Hardware - Power](http://eLinux.org/Rpi_Hardware#Power "Rpi Hardware") section).

USB version 2.0 is recommended. USB version 1.1 is fine for keyboards
and mice, but may not be fast enough for other accessories.

## Real Time Clock

Laptops and computers keep time when the power is off by using a
pre-installed, battery powered 'Real Time Clock' (RTC). However, this
Real Time Clock module is not included with the Raspberry Pi. To keep
time, the Raspberry Pi updates the date and time automatically over the
internet via Ethernet or WiFi. For projects which have no internet
connection, you may want to add a low cost battery powered RTC to help
your Pi keep time!

Afterthought Software have released a 'Plug and Play' Real Time Clock
designed specifically for the Raspberry Pi which, unlike other RTC's
available, plugs directly in to the Raspberry Pi's GPIO Ports. The unit
is available from
[ModMyPi](https://www.modmypi.com/raspberry-pi-expansion-boards/rasclock-raspberry-pi-real-time-clock-module)
and comes complete with an easy to follow [Installation
Guide](https://www.modmypi.com/blog/installing-the-rasclock-raspberry-pi-real-time-clock).

## Another PC

If you need to install the Operating System on your own SD Card you will
need another PC, Laptop or Mac to do so (or get a friend or local group
to do it for you). If you are running headless, you also need one,
though for a lot of uses (but not all) you can use a tablet or smart
phone. This does include another Pi!

# Connecting Together

[![](http://eLinux.org/images/thumb/0/09/Raspi-Model-AB-Mono-1-699x1024.png/200px-Raspi-Model-AB-Mono-1-699x1024.png)](http://eLinux.org/File:Raspi-Model-AB-Mono-1-699x1024.png)

[](http://eLinux.org/File:Raspi-Model-AB-Mono-1-699x1024.png "Enlarge")

A diagram denoting the places of the different components on the Rpi,
made by Paul Beech. Click to enlarge.

You can use the diagram to connect everything together using the
following instructions:

1.  Plug the SD Card loaded with the Operating System into the Pi.
2.  If required, plug the USB keyboard and mouse into the Pi, perhaps
    via a USB Hub. Connect the Hub to power, if necessary.
3.  If required, plug the video cable into the display and into the Pi.
4.  Plug in your Network cable, or WiFi dongle, if required.
5.  Ensure that your USB Hub (if any) and display are working.
6.  With your screen on, plug the other end of the power source into the
    Pi.
7.  Plug the power source into the main socket, and switch it on.
8.  If connected to a display, the Pi should boot up and display
    messages on the screen.
9.  If running headless, it should boot up. When the leds have stopped
    flashing, connect to the Pi from the remote computer. Whether this
    works will depend on the operating system you are using; the Raspian
    Linux operating system is configured to allow SSH connections by
    default.

It is always recommended to connect the MicroUSB Power to the unit last
(while most connections can be made live, it is best practice to connect
items such as displays and other connections with the power turned off).

If you use both a R-PI power supply and a powered hub, its recommended
you connect them to the same switched power bar, and use the switch on
the power bar to switch off both the R-PI and hub at the exact same
time.

Also, always shutdown using the software shutdown function, not by
pulling the plug. When not using a GUI, (with a GUI use the GUI command)
you can use the command "sudo halt -h", and power off when all the LED's
on the board (except the power LED) go off. This is especially important
the first time you boot, as in the process the R-PI modifies the content
of the SD-card, without a clean shutdown the contents of the card may be
damaged.

The RPi may take a long time to boot when powered-on for the first time,
so be patient, and cleanly shutdown afterwards, as described above!

# Additional Peripherals

You may decide you want to use various other devices with your RPi, such
as Flash Drives/Portable Hard Drives, Speakers etc.

*For detailed information see [RPi Verified
Peripherals](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals").*

## Heatsink

Not a vital accessory for your RPi, but will help to reduce the CPU's
temperature whilst under load. Available from [The Pi Hut's Raspberry Pi
Store](http://thepihut.com/collections/heatsinks),
[Etsy](http://www.etsy.com/shop/nhslzt),
[ModMyPi](https://www.modmypi.com/shop/raspberry-pi-heat-sink-kit) (with
lots of tips and tricks for reducing temperature in the reviews) or
[eBay](http://www.ebay.co.uk/itm/330758220781)

## Case

Since the RPi is supplied without a case, it will be important to ensure
that you do not use it in places where it will come into contact with
conductive metal or liquids, unless suitably protected. Some form of
[case](http://eLinux.org/Rpi_Cases "Rpi Cases") should be considered, and there is a [Rpi
case
thread](http://www.raspberrypi.org/forum/general-discussion/cases-for-the-raspberry-pi)
on the forum. Cases are also available from [The Pi Hut's Raspberry Pi
Store](http://thepihut.com/collections/cases),[ModMyPi's Raspberry Pi
Shop](https://www.modmypi.com/raspberry-pi-cases) and [MobileApp
Systems](http://store.mobileappsystems.com).

*For detailed information see [Rpi Cases](http://eLinux.org/Rpi_Cases "Rpi Cases").*

## SD card reader

You may need an SD card reader to prepare an SD card, or read a second
one, both for the Pi or the other computer if it does not have an
integral SD card reader.

[ModMyPi's Raspberry Pi
Shop](https://www.modmypi.com/raspberry-pi-accessories/plexus-single-slot-usb2.0-card-reader)
stocks a low cost (99p) SD Card Reader.

## Expansion & Low Level Peripherals

If you plan on making use of the low level interfaces available on the
RPi, then ensure you have suitable header pins for the GPIO (and if
required JTAG) suitable for your needs.

Also if you have a particular low-level project in mind, then ensure you
design in suitable protection circuits to keep your RPi safe (details
will be made available within the [RPi Projects, Guides &
Tutorials](http://eLinux.org/RaspberryPiBoardProjects "RaspberryPiBoardProjects")
section).

*For detailed information see [Rpi Low-level
Peripherals](http://eLinux.org/Rpi_Low-level_peripherals "Rpi Low-level peripherals").*

# External Links

For a verbose guide aimed at absolute beginners, see [Peripherals You'll
Need](http://h2g2.com/A13413584) and [Getting
Started](http://h2g2.com/A9143796) in h2g2's 'Introducing the Raspberry
Pi'.

For a cautionary tale of '7 gotchas' to be on the lookout for
(especially concerning the re-use of old monitors, keyboards, etc), see
[Raspbery Pi 'Gotchas' and new buyer
tips](http://www.keyboardmaven.com/2013/04/raspberry-pi-gotchas-and-newbiebuyer.html)

# References

1.  [↑](#cite_ref-autoMDIX_1-0)
    [Wikipedia:Auto-MDIX](http://en.wikipedia.org/wiki/Medium_dependent_interface#Auto-MDIX)

-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

[Raspberry Pi](http://eLinux.org/R-Pi_Hub "R-Pi Hub")

**Startup**

[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - [SD Card
Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") - **Basic
Setup** - [Advanced Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") -
[Beginners Guide](http://eLinux.org/RPi_Beginners "RPi Beginners") -
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

