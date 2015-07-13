> From: [eLinux.org](http://eLinux.org/RPi_Hardware "http://eLinux.org/RPi_Hardware")


# RPi Hardware





<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Introduction">1 Introduction</a></li>
<li><a href="#Rpi_Hardware_History">2 Rpi Hardware History</a></li>
<li><a href="#Specifications">3 Specifications</a></li>
<li><a href="#Components">4 Components</a></li>
<li><a href="#Schematic_.2F_Layout">5 Schematic / Layout</a></li>
<li><a href="#Power">6 Power</a>
<ul>
<li><a href="#Power_Supply_Problems">6.1 Power Supply Problems</a>
<ul>
<li><a href="#How_Can_I_tell_if_the_power_supply_is_inadequate.3F">6.1.1 How Can I tell if the power supply is inadequate?</a></li>
<li><a href="#Things_that_can_cause_problems">6.1.2 Things that can cause problems</a></li>
<li><a href="#Summary">6.1.3 Summary</a></li>
</ul></li>
<li><a href="#Capacitor_C6">6.2 Capacitor C6</a></li>
</ul></li>
<li><a href="#References">7 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Hardware & Peripherals:**

***Hardware** and [Hardware
History](http://eLinux.org/RPi_HardwareHistory "RPi HardwareHistory").*

*[Low-level
Peripherals](http://eLinux.org/RPi_Low-level_peripherals "RPi Low-level peripherals") and
[Expansion Boards](http://eLinux.org/RPi_Expansion_Boards "RPi Expansion Boards").*

*[Screens](http://eLinux.org/RPi_Screens "RPi Screens"), [Cases](http://eLinux.org/RPi_Cases "RPi Cases")
and [Other
Peripherals](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals").*



## Introduction

[![](http://eLinux.org/images/thumb/3/31/Rpi_unpopulated_pcb.jpg/300px-Rpi_unpopulated_pcb.jpg)](http://eLinux.org/File:Rpi_unpopulated_pcb.jpg)

[](http://eLinux.org/File:Rpi_unpopulated_pcb.jpg "Enlarge")

The unpopulated Rpi bèta board

The first product introduced from the Raspberry Pi foundation was the
size of a credit card, and was designed to plug into a TV or HDMI
monitor. The foundation has kept this form factor over the revisions but
have increased the performace while keeping the relavively low price
point. The [GPIO
pins](http://eLinux.org/Rpi_Low-level_peripherals "Rpi Low-level peripherals") on each
board allow the use of optional [expansion
boards](http://eLinux.org/Rpi_expansion_boards "Rpi expansion boards"). The current price
for the the model A+ is \$20, while the model B+ and Raspberry Pi 2 are
both \$35 each.

Several different minor hardware versions/revisions [RaspberryPi
Boards](http://eLinux.org/RaspberryPi_Boards "RaspberryPi Boards") have been found
probably from different assembly lines. Try to identify your board for
better troubleshooting and update it if you have one which is not
mentioned.

Those who are looking to set up a Raspberry Pi for the first time, see
[RPi Hardware Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup").

## Rpi Hardware History

There have been five major [board
revisions](http://eLinux.org/Board_revisions "Board revisions") of the Raspberry Pi
board.

To view the full history on the hardware of the Raspberry Pi check out
the [Rpi Hardware History](http://eLinux.org/Rpi_HardwareHistory "Rpi HardwareHistory").

## Specifications

Model A

Model B

Model A+

Model B+

Raspberry Pi 2

Target price:<sup>[[1]](#cite_note-faq-1)</sup>

US\$25 Ext tax (GBP £16 Exc VAT)

US\$35 Ext tax (GBP £22 Exc VAT)

US\$20 Ext tax (GBP £16 Exc VAT)
<sup>[[2]](#cite_note-aplus_anouncement-2)</sup>

US\$35 Ext tax (GBP £22 Exc VAT)

US\$35 Ext tax (GBP £22 Exc VAT)
<sup>[[3]](#cite_note-rpi2_anouncement-3)</sup>

System-on-a-chip (SoC):<sup>[[1]](#cite_note-faq-1)</sup>

Broadcom BCM2835 (CPU + GPU. SDRAM is a separate chip stacked on top)

Broadcom BCM2836

CPU:

700 MHz ARM11 ARM1176JZF-S core

900MHz quad-core ARM Cortex-A7

GPU:

Broadcom VideoCore IV,OpenGL ES 2.0,OpenVG 1080p30 H.264 high-profile
encode/decode

Memory (SDRAM)iB

256 MiB (planned with 128 MiB, upgraded to 256 MiB on 29 Feb 2012)

256 MiB (until 15 Oct 2012); 512 MiB (since 15 Oct 2012)

256 MiB

512 MiB

1024 MiB

USB 2.0 ports:

1 (provided by the BCM2835)

2 (via integrated USB hub)

1 (provided by the BCM2835)

4 (via intergrated USB hub and LAN9512)

Video outputs:<sup>[[1]](#cite_note-faq-1)</sup>

Composite video | Composite RCA, HDMI (not at the same time)

HDMI | Composite video requires 4 Pole Adapter

Audio outputs:<sup>[[1]](#cite_note-faq-1)</sup>

TRS connector | 3.5 mm jack, HDMI

Audio inputs:

None, but a USB mic or sound-card could be added

Onboard Storage:

Secure Digital|SD / MMC / SDIO card slot

Micro Secure Digital / MicroSD slot

Onboard Network:<sup>[[1]](#cite_note-faq-1)</sup>

None

10/100 wired Ethernet RJ45

None

10/100 wired Ethernet RJ45

Low-level peripherals:

26 General Purpose Input/Output (GPIO) pins, Serial Peripheral Interface
Bus (SPI), I²C, I²S<sup>[[4]](#cite_note-i2s-4)</sup>, Universal
asynchronous receiver/transmitter (UART)

40 General Purpose Input/Output (GPIO) pins, Serial Peripheral Interface
Bus (SPI), I²C, I²S,<sup>[[4]](#cite_note-i2s-4)</sup> I2C IDC Pins,
Universal asynchronous receiver/transmitter (UART)

Real-time clock:<sup>[[1]](#cite_note-faq-1)</sup>

None

Power ratings:

300 mA, (1.5 W) <sup>[[1]](#cite_note-faq-1)</sup>

700 mA, (3.5 W)

600mA up to 1.2A @ 5V

\~650 mA, (3.0 W)<sup>[[5]](#cite_note-e14bp-5)</sup>

Power source:<sup>[[1]](#cite_note-faq-1)</sup>

5 V (DC) via Micro USB type B or GPIO header

Size:

85.0 x 56.0 mm x 15mm

85.0 x 56.0 mm x 17mm

65.0 x 56.0 mm x 12mm

85.0 x 56.0 mm x 17mm

85.0 x 56.0 mm x 17mm

Weight:

31g

40g

23g

40g

40g

## Components

[![](http://eLinux.org/images/thumb/c/cf/Raspi-Model-AB-Mono-2-699x1024.png/400px-Raspi-Model-AB-Mono-2-699x1024.png)](http://eLinux.org/File:Raspi-Model-AB-Mono-2-699x1024.png)

[](http://eLinux.org/File:Raspi-Model-AB-Mono-2-699x1024.png "Enlarge")

A diagram denoting the places of the different components on the Rpi,
made by Paul Beech, edited to show 256MB ram for both boards

(Provisional - some of the expansion interfaces won't be available on
production boards) (PCB IDs are those of the Model B Beta board)

-   SoC: [Broadcom BCM2835 media
    processor](http://www.broadcom.com/products/BCM2835)
    ([datasheet](http://www.raspberrypi.org/wp-content/uploads/2012/02/BCM2835-ARM-Peripherals.pdf),
    [BCM2835 datasheet
    errata](http://eLinux.org/BCM2835_datasheet_errata "BCM2835 datasheet errata"),
    [unofficial pinout](http://eLinux.org/RPi_BCM2835_Pinout "RPi BCM2835 Pinout"),
    [BCM2835 Register documentation - based on GPU source
    code](http://eLinux.org/BCM2835_registers "BCM2835 registers")) system-on-chip
    featuring:
    -   CPU core:
        [ARM1176JZF-S](http://infocenter.arm.com/help/topic/com.arm.doc.ddi0301h/DDI0301H_arm1176jzfs_r0p7_trm.pdf)
        ARM11 core clocked at 700MHz; ARM VFP. The ARM11 core implements
        the ARMv6 Architecture. For details on ARM instruction sets and
        naming conventions, see [ARM
        architecture](http://en.wikipedia.org/wiki/ARM_architecture) and
        [List of ARM microprocessor
        cores](http://en.wikipedia.org/wiki/List_of_ARM_microprocessor_cores).
    -   GPU core: a Broadcom
        [VideoCore](http://en.wikipedia.org/wiki/Videocore) IV GPU
        providing OpenGL ES 1.1, OpenGL ES 2.0, hardware-accelerated
        OpenVG 1.1, Open EGL, OpenMAX and 1080p30 H.264 high-profile
        decode. There are 24 GFLOPS of general purpose compute and a
        bunch of texture filtering and DMA infrastructure. Eben worked
        on the architecture team for this and the Raspberry Pi team are
        looking at how they can make some of the proprietary features
        available to application programmers
    -   DSP core: There is a DSP, but there isn't currently a public API
        (Liz thinks the BC team are keen to make one available at some
        point)
        [thread](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=24&t=15474)
    -   256MiB of ([Hynix
        MobileDDR2](http://www.hynix.com/products/mobile/view.jsp?info.ramKind=28&info.serialNo=H9TKNNN2GDMPLR&posMap=MobileDDR2)
        or [Samsung Mobile
        DRAM](http://www.samsung.com/global/business/semiconductor/product/mobile-dram/detail?productId=7611&iaId=747))
        SDRAM (or 512MB [Mobile
        DRAM](http://www.samsung.com/global/business/semiconductor/product/mobile-dram/detail?iaId=747&productId=7609)
        on later boards). The RAM is physically stacked on top of the
        Broadcom media processor ([package-on-package
        technology](http://en.wikipedia.org/wiki/Package_on_package)).
        Here is a photo of the [SDRAM (left) and BCM2835
        (right)](http://www.raspberrypi.org/wp-content/uploads/2012/01/brcm2835plusmemory.jpg)
        ball grid arrays on JamesH's finger. You are looking at the
        bottom side. The BCM2835 top side has a land grid array which
        matches the SDRAM ball grid array. Here is a highly magnified
        side view of the SDRAM stacked on top of the BCM2835 stacked on
        top of the PCB [PoP
        stack](http://www.raspberrypi.org/wp-content/uploads/2012/09/2012-09-21-10.58.22.jpg)
        (you can see why it's job that can only be done by robots!).
-   LAN9512 ([Data
    Brief](http://ww1.microchip.com/downloads/en/DeviceDoc/9512db.pdf) |
    [Data
    Sheet](http://ww1.microchip.com/downloads/en/DeviceDoc/9512.pdf))
    **(Model B)** providing:
    -   10/100Mb Ethernet
        (Auto-MDIX)<sup>[[6]](#cite_note-autoMDIX-6)</sup>
    -   2x USB 2.0
-   S1: Micro USB power jack (5v - Power Only)
-   S2: [DSI](http://www.mipi.org/specifications/display-interface)
    interface. 15-pin surface mounted flat flex connector, providing two
    data lanes, one clock lane, 3.3V and GND.
-   S3: HDMI connector providing type A HDMI 1.3a out
-   S4: Composite Video connector: RCA
-   S5: MIPI
    [CSI-2](http://www.mipi.org/specifications/camera-interface)
    interface. 15-pin surface mounted flat flex connector.
-   S6: Audio connector: 3.5mm stereo jack (output only)
-   S8: SD/MMC/SDIO memory card slot (underside)
-   S7: Either 1x USB 2.0 **(Model A)** 2x USB 2.0 **(Model B)**
-   P1: 26-pin (2x13) 2.54 mm header expansion, providing: see
    [Low-level
    peripherals](http://eLinux.org/Rpi_Low-level_peripherals "Rpi Low-level peripherals")
    -   8
        [GPIOs](http://eLinux.org/Rpi_Low-level_peripherals#General_Purpose_Input.2FOutput_.28GPIO.29 "Rpi Low-level peripherals")
        at 3v3
    -   2-pin UART serial console, 3v3 TTL (debug); or 2 GPIOs at 3v3
    -   I²C interface (3v3); or 2 GPIOs at 3v3
    -   SPI interface (3v3); or 5 GPIOs at 3v3
    -   3v3, 5v and GND supply pins
    -   ARM JTAG (if pins are reconfigured in software - on Revision1.0
        boards one signal would also need to be taken from S5)
    -   I²S interface (if pins are reconfigured in software, hardware
        hack may be required<sup>[[4]](#cite_note-i2s-4)</sup>)
-   P2: 8-pin 2.54 mm header expansion (header not fitted on Revision
    2.0 boards), providing GPU JTAG (ARM11 pinout, pin 7 is nofit for
    locating)
-   P3: 7-pin 2.54 mm header expansion (header not fitted), providing
    LAN9512 JTAG (pin 6 is nofit for locating)
-   P4: 10/100Mb RJ45 Ethernet jack **(Model B)**
-   P5: 8-pin (2x4) 2.54 mm header expansion (header not fitted), on the
    *bottom* of the board, providing: see [Low-level
    peripherals](http://eLinux.org/Rpi_Low-level_peripherals "Rpi Low-level peripherals")
    **(Model B Revision 2.0 and Model A boards only)**
    -   4
        [GPIOs](http://eLinux.org/Rpi_Low-level_peripherals#P5_header "Rpi Low-level peripherals")
        at 3v3
    -   3v3, 5v and GND supply pins
    -   Second I²C interface (3v3) (if pins are reconfigured in
        software)
    -   I²S interface (if pins are reconfigured in software)
    -   Handshake signals for the UART on the P1 header (if pins are
        reconfigured in software)
-   P6: 2-pin 2.54 mm header expansion (header not fitted), providing an
    option to connect a hardware-reset button **(Revision 2.0 boards
    only)**
-   TP1 and TP2: Test Points giving access to +5V and GND respectively
-   5 Status
    LEDs<sup>[[7]](#cite_note-PCBs-7)</sup><sup>[[8]](#cite_note-LEDs-8)</sup><sup>[[9]](#cite_note-LEDsGPIO-9)</sup><sup>[[10]](#cite_note-OKGreen-10)</sup><sup>[[11]](#cite_note-Revision2.0-11)</sup>:
    -   D5(Green) - SDCard Access (via GPIO16) - labelled as "OK" on
        Model B Rev1.0 boards and "ACT" on Model B Rev2.0 and Model A
        boards
    -   D6(Red) - 3.3 V Power - labelled as "PWR" on all boards
    -   D7(Green) - Full Duplex (LAN) **(Model B)** - labelled as "FDX"
        on all boards
    -   D8(Green) - Link/Activity (LAN) **(Model B)** - labelled as
        "LNK" on all boards
    -   D9(Yellow) - 10/100Mbit (LAN) **(Model B)** - labelled
        (incorrectly) as "10M" on Model B Rev1.0 boards and "100" on
        Model B Rev2.0 and Model A boards

-   Board size: <s>85.60 mm x 53.98 mm.</s> Overall height expected to
    be less than 25 mm. <sup>[[12]](#cite_note-artwork-12)</sup>
    Production boards measure 85.0 mm x 56.0 mm.
    -   A Model B between the highest points (USB connector to card
        slot) measured 21 mm.
    -   A Model A between the highest points (composite video connector
        to card slot) measured 18mm.
-   Weight: under 40 g?
    -   Alpha board weighs approx. 55 g.<sup>[[13]](#cite_note-13)</sup>
    -   A sample model B weighed 39.45 g.
-   6 layer PCB <sup>[[12]](#cite_note-artwork-12)</sup>

## Schematic / Layout

-   [PCB screenshot, Alpha
    board](http://www.raspberrypi.org/wp-content/uploads/2011/07/raspberry1.png)
-   [PCB screenshot rev
    1.0](http://www.raspberrypi.org/wp-content/uploads/2011/11/gerbers2.png)
-   [PCB screenshot rev 1.0, labelled
    version](http://lh3.googleusercontent.com/-uO4l8pwSLvU/TsQGbth6x6I/AAAAAAAAAkk/5zQMH3uKPiE/s829/Boardlayout.png)
-   [Preliminary power supply schematic, Beta
    board](http://www.raspberrypi.org/wp-content/uploads/2011/12/psu.png)
-   [High-resolution Model B PCB front photo, production board rev
    1.0](http://elinux.org/File:RPi-Front-JPB.jpg)
-   [High-resolution Model B PCB back photo, production board rev
    1.0](http://elinux.org/File:RPi-back-JPB.jpg)
-   [High-resolution Model B PCB front photo, production board rev
    2.0](http://www.raspberrypi.org/wp-content/uploads/2012/09/sony-rasp-pi.jpg)
-   [High-resolution Model A PCB front photo, production board rev
    2.0](http://www.raspberrypi.org/wp-content/uploads/2012/11/2012-11-29-14.48.47-HDR.jpg)
-   [GIMP project containing properly aligned versions of the high-res
    PCB photos and Gerbers on separate layers
    (117MB)](http://www.andrewscheller.co.uk/bare_pcb.xcf)
-   ["Xray style" image of the beta board, created from the above GIMP
    project](http://eLinux.org/images/1/15/RPi_beta_xray.jpg "RPi beta xray.jpg") |
    [desktop wallpapers](http://eLinux.org/RPi_xray_wallpapers "RPi xray wallpapers")
-   [Official Rev 1.0 schematics
    PDF](http://www.raspberrypi.org/wp-content/uploads/2012/04/Raspberry-Pi-Schematics-R1.0.pdf)
    | [Official Rev 2.0 schematics
    PDF](http://www.raspberrypi.org/wp-content/uploads/2012/10/Raspberry-Pi-R2.0-Schematics-Issue2.2_027.pdf)
    |
    [differences](http://eLinux.org/RPi_schematic_differences "RPi schematic differences")
    | [errata](http://eLinux.org/RPi_schematic_errata "RPi schematic errata") |
    [breakdown](http://eLinux.org/RPi_schematics_breakdown "RPi schematics breakdown") |
    [partial
    BOM](http://eLinux.org/RPi_Partial_BOM_Rev2.0_ModelB "RPi Partial BOM Rev2.0 ModelB")
-   ['Module groups' of the PCB
    photos](http://www.andrewscheller.co.uk/rpi_pcb_modules.html)

## Power

The board takes fixed 5V input, (with the 1V2 core voltage generated
directly from the input using the internal switch-mode supply on the
BCM2835 die). This permits adoption of the micro USB form factor, which,
in turn, prevents the user from inadvertently plugging in out-of-range
power inputs; that would be dangerous, since the 5V would go straight to
HDMI and output USB ports, even though the problem should be mitigated
by some protections applied to the input power: The board provides a
polarity protection diode, a voltage clamp, and a self-resetting
semiconductor fuse.

Premier Farnell recommend the following power supplies:

-   Model A: 5V dc, 500-700mA
-   Model B: 5V dc, 700-1500mA

Power consumption of the Raspberry Pi device is

-   Board A: 5V, 500 mA (2.5W) **without any devices connected** (e.g.
    USB, Ethernet, HDMI)
-   Board B: 5V, 700 mA (3.5W) **without any devices connected** (e.g.
    USB, Ethernet, HDMI) (Is this correct? These
    [[1]](http://www.raspberrypi.org/forum/troubleshooting/usb-hub-sending-power-to-raspberry-pi-through-usb-port/#p68382)
    links
    [[2]](http://www.raspberrypi.org/forum/general-discussion/raspberry-pi-power-requirements/page-2/#p68224)
    suggest that the 700mA is only required if "using networking and
    high-current USB peripherals"
    [[3]](http://www.raspberrypi.org/archives/260).)

You will need to provide a power supply that can provide enough current
to power the device plus any connected peripherals, and taking into
account inefficiencies of the supply itself and the cable between the
power supply and Raspberry Pi. The community advises opting for a power
supply that can supply at least 1A if using USB peripherals or Pi plates
that draw more than a few tens of milliamps of current.

-   As the 5V rail is brought out in the [GPIO
    pins](http://eLinux.org/Rpi_Low-level_peripherals "Rpi Low-level peripherals"), you
    can power the Rpi from there too. You should mind however, that
    those are *behind* the power protection circuitry, so you should
    provide your own.
-   It is possible to power the Rpi from a powered USB hub the Rpi
    controls, but only on 'dumb' devices, that allow the port to supply
    the full current without waiting for the usb device to ask for
    it[[4]](http://www.raspberrypi.org/forum/general-discussion/power-pi-from-usb-hub-connected-to-pi).
    As the power input of the Rpi doesn't have its data leads connected,
    there is no chance for a communication loop of some sorts.
-   POE ([power over
    ethernet](http://en.wikipedia.org/wiki/Power_over_Ethernet "wikipedia:Power over Ethernet"))
    is currently not available for the Rpi (but nobody stops you from
    taking your soldering iron and doing it yourself - mind though that
    the Ethernet jack on the board is a 'magjack' -
    [http://www.sparkfun.com/datasheets/Prototyping/MagJack.pdf](http://www.sparkfun.com/datasheets/Prototyping/MagJack.pdf)
    - which means that the usual 'dumb or passive PoE' power pins 47 and
    78 are \*not\* wired through to the board. So this is not an
    entirely trivial exercise).
-   Back-Powering; (powering the Raspberry Pi from a USB hub through the
    uplink/data port, single cable) Back powering is possible on the
    Raspberry Pi, but not advisable. Revision 1.0 boards have to be
    modified to back power, this is due to the 140ma "polyfuses" that
    are installed in the USB port circuit. Revision 1.1 boards do not
    need modifications to back-power, they have replaced the polyfuses
    with 0ohm resistors in their place. Revision 2.0 boards do not need
    modification, they have neither resistors nor polyfuses. It is
    advised that short (12" (.3 meter) or less) USB cables be used for
    back-powering a Raspberry Pi. Cable resistance plus connector
    resistance can quickly reduce operating voltages below the proper
    range(5.25V to 4.75V). But do note that if you do not power the PI
    in the "official manner", that is through it's micro-USB port, but
    use any alternative way (such as through the GPIO header, the test
    points TP1 and TP2), but also by back-powering it, **you are
    actually bypassing the PI's input polyfuse protection device!** This
    can have extreme consequences if ever you manage to put more than 6V
    on the PI, even for a very short period. As this causes the
    overvoltage device D17 on the the PI to trigger and short the 5V
    supply! Without the polyfuse limiting the current through D17, it
    will burn out, probably melting the PI's enclosure with it, (if you
    have any) and possibly causing a fire-hazard. It will probably also
    create a permanent short of the 5V supply! So be warned, and if you
    use back power make sure your hub or its PSU has a fuse to prevent
    this from happening. If not, add your own fuse.

### Power Supply Problems

There have been a number of problems reported that seem to be caused by
inadequate power, this is an attempt to explain what is needed and the
consequences of not having enough power.

The power required by the Pi will vary depending on how busy it is and
what peripherals are connected.

-   Running a GUI will take more power.
-   The USB devices and Ethernet connection will take power.
-   Running the GPU will take extra power.

This means that it's difficult to say exactly how much power is needed.
People have reported current requirements of between 300mA and 550mA.
But it could in reality take more, especially for short periods. A
simple multimeter will not show short surges on the power requirement. A
surge in the power requirement for a few milliseconds will not be
detectable by a meter but will be enough to cause problems. If the board
does not get enough power the voltage will drop. If it drops enough
parts of the system will run unreliably because data can get corrupted.
The USB IC runs on 5V and handles the USB and Ethernet ports so it's
likely that this will be the first thing to fail. Problems seen are
unreliable Ethernet connection and unreliable operation of the Keyboard
and/or mouse.

Each of the two USB ports on the Pi has a polyfuse rated at 140 mA, so
any connected USB devices should draw less than this amount of current.
In addition the polyfuse will cause a significant voltage drop, so that
USB devices get less voltage than is available on the RPI itself,
sometimes up to half a volt less (maybe more if the fuse has recently
been hot). For regular "low power" USB devices this doesn't cause a
problem as they are designed to work with voltages as low as 4.4 Volt.
This isn't the case however with some USB devices such as WiFi dongles
which may need 4.75 Volt, and are also known to draw more than 150 mA
when configured and active. Because of the problems these polyfuses
caused Raspberry PI's produced after August 25, 2012 have the USB
polyfuses F1 & F2 removed (replaced with shorts).

The microUSB input port also has a 1.1 A polyfuse (700mA "hold current")
which may also have enough resistance (although much smaller than the
140mA fuses) to cause a significant voltage drop on the board, even
below its 1.1 A total current.

A extended explanation of the consequences of the use of these polyfuses
can be found here [Polyfuses
explained](http://eLinux.org/Polyfuses_explained "Polyfuses explained")

There are several reasons why the power to the board may be inadequate:

-   The PSU may not deliver enough power. Although the maximum power
    requirement is said to be 700mA, that is with no peripherals
    connected (USB, Ethernet etc), so a 1000mA PSU should be regarded as
    a minimum. This allows some leeway in case the power supply cannot
    deliver its full power without the voltage dropping.
-   The PSU is not regulated.
-   The cable connecting the PSU to the Pi may not be good. People have
    reported cables with 4 ohms resistance on the power connections. At
    500mA drain this would reduce a 5V supply to 3V.
-   If the PSU is unregulated it can also output too high a voltage,
    which may trigger the overvoltage device in the PI, which will
    temporarily short the 5V to ground, this will then "blow" polyfuse
    F3, which will take several days to recover from. Meanwhile
    (possibly with another PSU) the PI might not get enough power
    because the (partly) blown polyfuse is consuming some of the power.
    The solution is when this happens to ways a few days to give the
    polyfuse time to recover before attempting to use the better PSU. If
    you suspect a blow polyfuse, measure the voltage across F3, which
    should be less than 0.05 Volt.

#### How Can I tell if the power supply is inadequate?

Common symptoms of an inadequate power supply are

-   Unreliable Ethernet or keyboard operation, especially if it's OK at
    first but not when the GUI is started.
-   SD card errors at start up seems to be another symptom of poor
    power.

If you think you have a problem with your power supply, it is a good
idea to check the actual voltage on the Raspberry Pi circuit board. Two
test points labelled TP1 and TP2 are provided on the circuit board to
facilitate voltage measurements.

Use a multimeter which is set to the range 20 volts DC (or 20v =). You
should see a voltage between 4.75 and 5.25 volts. Anything outside this
range indicates that you have a problem with your power supply or your
power cable, or the input polyfuse F3. Anything inside, but close to the
limits, of this range *may* indicate a problem.

[![RPI Test
Points.JPG](http://eLinux.org/images/thumb/d/d1/RPI_Test_Points.JPG/400px-RPI_Test_Points.JPG)](http://eLinux.org/File:RPI_Test_Points.JPG)
[![Voltmeter.JPG](http://eLinux.org/images/thumb/8/8c/Voltmeter.JPG/250px-Voltmeter.JPG)](http://eLinux.org/File:Voltmeter.JPG)

#### Things that can cause problems

-   A USB connection on a TV or PC. The USB power supply specification
    is for up to 500mA and if the TV implements this then it can cause
    problems. The system may work initially but be unreliable because as
    it becomes more active the power requirement increases.
-   A single supply from a powered hub. Most hubs seem to deliver more
    than the specified current but there's no guarantee. Check the power
    supply rating, it must be enough to supply everything that's
    connected to the hub.
-   A power supply that is rated for less than 700mA may work some of
    the time.
-   Adding a USB hard disk drive. A HDD will take quite a lot of power
    as it starts, maybe an amp or more. It the power supply for this
    also supplies the Pi then this could overload things and cause
    trouble.
-   Some complex keyboards have been reported to take a considerable
    amount of power, maybe up to 500mA. The Pi cannot deliver this
    amount of power. Simpler budget keyboards may be better. If the
    system works with no keyboard attached but not with a keyboard then
    it's worth trying a different, simpler, keyboard.

#### Summary

-   If you are having unreliable operation the first thing to do is
    check your power supply.
-   Start with a good quality regulated power supply that is rated to
    provide 5V and at least 1A (1000mA).
-   Use a good quality micro USB cable. Cables are notorious for giving
    trouble so be prepared to swap for another one.
-   Not all power supplies will deliver what they claim.

### Capacitor C6

Behind the microUSB power connector on the Model B is a metallic grey
component called a capacitor, marked as C6. This capacitor helps
stabilise the DC power on the board, but for some it has also become a
place for their thumb when removing the RPI's power lead; unfortunately,
this can result in the capacitor breaking off! It has been stated in the
forums that the type of capacitor used for C6 will be changed on later
RPi models for one with sturdier leads. If you do break off your C6
capacitor, it's highly likely that your RPi will still work properly,
unless you have a particularly unstable power supply, but the general
advice is to not use C6 as a leverage point when removing the power
connector and also take care when storing or transporting your RPi if
it's not fitted in a case - try not to stow the board where C6 could be
knocked by other items - for example in a laptop carry case or in
amongst some books.

[![](http://eLinux.org/images/0/04/Rpic6.jpg)](http://eLinux.org/File:Rpic6.jpg)

[](http://eLinux.org/File:Rpic6.jpg "Enlarge")

Capacitor C6 (ringed)

It's unlikely that replacing a broken off C6 capacitor will be covered
under warranty, but fortunately they are easy to replace if you have
average [soldering skills](http://www.raspberrypi.org/archives/1494),
but remember that reworking your RPi will void its warranty too. C6 is a
surface mount electrolytic capacitor with a capacitance of 220
microfarad (μF) and a voltage rating of 16 volt (V). The capacitor is
polarised and so must be fitted the right way round - notice the black
marking on one side in the picture above. A replacement capacitor can be
purchased from numerous sources - for example:

[Farnell](http://uk.farnell.com/jsp/search/browse.jsp?N=202457+110114112+110119850+110141127+110200576&No=0&getResults=true&appliedparametrics=true&locale=en_UK&divisionLocale=en_UK&catalogId=&skipManufacturer=false&skipParametricAttributeId=&prevNValues=202457+110114112+110119850+110141127&mm=1000002%7C110114112%7C110114112,1001880%7C110119850%7C110119850,1002520%7C%7C,1002063%7C%7C,1002999%7C%7C,&filtersHidden=false&appliedHidden=false&autoApply=true&originalQueryURL=%2Fjsp%2Fsearch%2Fbrowse.jsp%3FN%3D202457%26No%3D0%26getResults%3Dtrue%26appliedparametrics%3Dtrue%26locale%3Den_UK%26divisionLocale%3Den_UK%26catalogId%3D%26skipManufacturer%3Dfalse%26skipParametricAttributeId%3D%26prevNValues%3D202457)

[Rapid
Electronics](http://www.rapidonline.com/Electronic-Components/220uf-16v-85deg-Smd-Electro-Capacitor-11-2264)

[RS
Components](http://uk.rs-online.com/web/c/passives/capacitors/aluminium/?sort-by=default&sort-order=default&applied-dimensions=4294884868,%204294884170,%204294672278,4294885140&lastAttributeSelectedBlock=4294955811)


 If you prefer to make your own PSU - see: [Power Supply construction -
HowTo](http://eLinux.org/RPi_5V_PSU_construction "RPi 5V PSU construction")

## References

1.  ↑ <sup>[1.0](#cite_ref-faq_1-0)</sup>
    <sup>[1.1](#cite_ref-faq_1-1)</sup>
    <sup>[1.2](#cite_ref-faq_1-2)</sup>
    <sup>[1.3](#cite_ref-faq_1-3)</sup>
    <sup>[1.4](#cite_ref-faq_1-4)</sup>
    <sup>[1.5](#cite_ref-faq_1-5)</sup>
    <sup>[1.6](#cite_ref-faq_1-6)</sup>
    <sup>[1.7](#cite_ref-faq_1-7)</sup>
    [http://www.raspberrypi.org/faqs](http://www.raspberrypi.org/faqs)
2.  [↑](#cite_ref-aplus_anouncement_2-0)
    [http://www.raspberrypi.org/raspberry-pi-model-a-plus-on-sale/](http://www.raspberrypi.org/raspberry-pi-model-a-plus-on-sale/)
3.  [↑](#cite_ref-rpi2_anouncement_3-0)
    [http://www.raspberrypi.org/raspberry-pi-2-on-sale/](http://www.raspberrypi.org/raspberry-pi-2-on-sale/)
4.  ↑ <sup>[4.0](#cite_ref-i2s_4-0)</sup>
    <sup>[4.1](#cite_ref-i2s_4-1)</sup>
    <sup>[4.2](#cite_ref-i2s_4-2)</sup> [Forum:Sad about removal of I2S.
    Why was this change
    made?](http://www.raspberrypi.org/forum/features-and-requests/sad-about-removal-of-i2s-why-was-this-change-made)
5.  [↑](#cite_ref-e14bp_5-0) [Element 14 Raspberry Pi Model
    B+](http://www.element14.com/community/community/raspberry-pi/raspberry-pi-bplus?ICID=hp-rpibplus-ban)
6.  [↑](#cite_ref-autoMDIX_6-0)
    [Wikipedia:Auto-MDIX](http://en.wikipedia.org/wiki/Medium_dependent_interface#Auto-MDIX)
7.  [↑](#cite_ref-PCBs_7-0) [RPiBlog Post: High-res pics of the
    PCBs](http://www.raspberrypi.org/archives/402)
8.  [↑](#cite_ref-LEDs_8-0) [TwitPic:Photo of Board
    Powered](http://twitpic.com/8edlsf)
9.  [↑](#cite_ref-LEDsGPIO_9-0) [Forum:What do the status indicator LEDs
    indicate the status
    of?](http://www.raspberrypi.org/forum/features-and-requests/what-do-the-status-indicator-leds-indicate-the-status-of)
10. [↑](#cite_ref-OKGreen_10-0)
    [RPi\_schematic\_errata](http://eLinux.org/RPi_schematic_errata "RPi schematic errata")
11. [↑](#cite_ref-Revision2.0_11-0) [RPiBlog Post: A nice shiny photo of
    the rev2 board – and User Guide
    news](http://www.raspberrypi.org/archives/1959)
12. ↑ <sup>[12.0](#cite_ref-artwork_12-0)</sup>
    <sup>[12.1](#cite_ref-artwork_12-1)</sup>
    [http://www.raspberrypi.org/archives/344](http://www.raspberrypi.org/archives/344)
13. [↑](#cite_ref-13)
    [http://www.raspberrypi.org/?page\_id=43&mingleforumaction=viewtopic&t=285.0](http://www.raspberrypi.org/?page_id=43&mingleforumaction=viewtopic&t=285.0)



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

**Hardware** - [Hardware
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

