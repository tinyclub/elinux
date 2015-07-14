> From: [eLinux.org](http://eLinux.org/EOMA-68 "http://eLinux.org/EOMA-68")


# Embedded Open Modular Architecture/EOMA-68


\< [Embedded Open Modular
Architecture](http://eLinux.org/Embedded_Open_Modular_Architecture "Embedded Open Modular Architecture")


[![EOMA68-CARD00.png](http://eLinux.org/images/a/a5/EOMA68-CARD00.png)](http://eLinux.org/File:EOMA68-CARD00.png)

## Contents

-   [1 EOMA-68 Introduction](#eoma-68-introduction)
-   [2 EOMA-68 Specification](#eoma-68-specification)
    -   [2.1 Background to Interface
        Selection](#background-to-interface-selection)
        -   [2.1.1 Requirements for USB](#requirements-for-usb)
        -   [2.1.2 Requirements for
            Ethernet](#requirements-for-ethernet)
        -   [2.1.3 Requirements for
            RGB/TTL](#requirements-for-rgb-ttl)
        -   [2.1.4 Requirements for I2C](#requirements-for-i2c)
        -   [2.1.5 Requirements for UART](#requirements-for-uart)
        -   [2.1.6 Requirements for SD/MMC and
            SPI](#requirements-for-sd-mmc-and-spi)
-   [3 Pinouts (version 1-0)](#pinouts-version-1-0)
    -   [3.1 Table of EOMA-68 pinouts](#table-of-eoma-68-pinouts)
-   [4 Start-up procedure](#start-up-procedure)
-   [5 Future Versions](#future-versions)
-   [6 Deliberate Mechanical
    Non-interoperability](#deliberate-mechanical-non-interoperability)
-   [7 Physical Dimensions](#physical-dimensions)
    -   [7.1 Type II](#type-ii)
    -   [7.2 Type III](#type-iii)
-   [8 Thermal Considerations](#thermal-considerations)
-   [9 Header Connectors](#header-connectors)
-   [10 Example Motherboards](#example-motherboards)
-   [11 Contact and Discussion](#contact-and-discussion)
-   [12 Slides](#slides)
-   [13 FAQ](#faq)

# EOMA-68 Introduction

The purpose of the EOMA68 specification is to bring simple robust
mass-produced CPU Cards to end-users. To make end-users lives easier,
purchasing decision-making should be made not on technical interface
capabilities, neither should they be expected to have significant
technological expertise. This is the primary reason why EOMA
specifications have no optional interfaces of any kind. For this reason,
for the lifetime of the specification (anticipated to be at least a
decade) *all* CPU Cards compliant with the EOMA68 specification will be
compatible with *all* compliant "Chassis" *(Note: "chassis" is the term
used to describe a product into which a CPU Card is plugged).*

The trade-off between choosing a single-board design or even another
modular form-factor is as follows:

-   EOMA-68 products will not use all of the integrated functions of
    single-board designs, automatically resulting in minor cost
    increases for products.
-   However, single-board designs are typically throw-away products
    where the lifetime of the product is critically dependent on an
    extremely fast-changing market.
-   Single-board designs are typically throw-away hermetically-sealed
    products with neither user-serviceable nor user-replaceable parts
-   EOMA-68 products are user-upgradeable. The Chassis can be kept out
    of landfill - kept in useful service - for the lifetime of its
    components. Only the CPU Card need be upgraded at a much lower cost
    than a single-board design in order to continuously give the product
    a new lease of life.
-   EOMA-68 CPU Cards can be shared by the same end-user across multiple
    products, automatically resulting in a cost saving that far
    outweighs the minor overhead of a single EOMA68 system when compared
    to a single hermetically-sealed throw-away product.
-   Old Chassis and CPU Cards can be re-purposed instead of discarded as
    e-waste.
-   Q-Seven and other similar standards are not realistically
    user-upgradeable (not for the average person) because products
    require tools, technical knowledge in the selection of replacement
    parts, and expert knowledge in the handling of electronics before
    opening the case.
-   EOMA68 products are upgraded by pushing a button and popping out the
    module: it literally takes seconds to install a new CPU Card.

So the benefits for end-users are very clear: EOMA-68 is easily
understandable long-term investment for its end-users with significant
long-term cost savings and reductions in e-waste. The benefits for
factories are very clear: CPU Cards aggregated across multiple products
means much better bulk purchasing power, and Chassis can also continue
to be produced *without* requiring redesigns pretty much until the
components go end-of-life.

No other modular computing standard available today has been designed
with these aims in mind.

# EOMA-68 Specification

This page describes the specification of EOMA-68. The number of pins on
the interface is 68; the physical form-factor is the legacy PCMCIA.

Re-purposing of the PCMCIA interface and form-factor has been chosen to
create portable mass-volume (100 million units and above) Embedded
Computing Modules (Computer on Module). Mass-volume "Lowest Common
Denominator" interfaces have been chosen, all of which have existed for
over a decade, but are low-power enough to be standard across virtually
all mass-produced powerful Embedded CPUs.

The interfaces are:

-   24-pin RGB/TTL (for LCD Panels and DVI/VGA/HDMI or other display
    conversion ICs)
-   I2C
-   1st USB (Low Speed, Full Speed, optionally Hi Speed/480 Mbit/s and
    optionally USB3)
-   2nd USB (Low Speed, Full Speed, optionally Hi Speed/480 Mbit/s)
-   10/100 Ethernet (optionally 1,000 ethernet)
-   8 pins of General-purpose Digital I/O (GPIO) with multiplexing to
    SD/MMC and SPI on 6 pins
-   1 pin "External Interrupt" capable GPIO that will generate a fast
    hardware interrupt to the SoC
-   SD/MMC (and down-level compatibility to SPI) multiplexed with 6 of
    the GPIO pins.
-   TTL-compatible UART (Tx and Rx only).

These interfaces are **NOT OPTIONAL** for CPU Cards. All CPU Cards
**MUST** provide **all** interfaces. I/O Boards on the other hand are
free to implement whichever interfaces are required for the device. For
example: whilst all CPU Cards **must** have an Ethernet interface,
devices such as tablets or laptops into which CPU Cards are plugged are
not *required* to have an ethernet port. The only exception is I2C (due
to the EOMA-68 identification EEPROM): it is mandatory for all I/O
Boards to provide an EOMA-68 identification EEPROM.

Exactly like legacy PCMCIA Cards, EOMA-68 CPU Cards may have absolutely
any functions, any additional connectors, peripherals and so on
*without* limitation, except for compliance with the EOMA-68 pinouts and
physical size constraints. These additional functions, which may include
access ports in the casework, may extend outwards from the user-facing
end of the CPU Card to any practical extent, exactly as with legacy
PCMCIA.

## Background to Interface Selection

The interfaces have been specifically chosen because they are either
essential or they are multi-purpose buses, and surprisingly they are
perfectly adequate despite being Lowest Common Denominator across a wide
range of CPUs for at least a decade. The goal here is not to attain
ultra-high-speed latest-and-greatest performance but to use proven,
long-established interfaces that will be easy to find parts for
mass-volume appliances in potentially hundreds of millions of units and
above.

Also, some graceful degradation through negotiation at the *hardware*
level is not only desirable but is an essential distinctive and unique
feature of the EOMA68 standard, because it dramatically simplifies the
"sales pitch" as well as the engineering design, user card selection
("just get one of these, plug it into any product, it will work") and so
on whilst at the same time ensuring that the range of SoCs that can be
used is significantly diverse and future-proof.

-   **I2C** - I2C is only two wires, is a global bus that can address
    multiple devices, and is a long-established proven Industry Standard
    with thousands of devices available.
-   **USB** - USB2 is only two wires; USB3 is six. USB, like I2C, is a
    global bus that can address multiple devices and is a
    long-established proven Industry Standard.
-   **Ethernet** - 10/100/1,000 Ethernet was chosen because it is
    prevalent on the majority of computing devices. In the case where
    chosen CPUs do not have Ethernet, a USB-to-Ethernet converter IC
    such as the SMSC
    [LAN9500](http://www.smsc.com/index.php?tid=292&pid=137) can be
    deployed.
-   **RGB/TTL** - 24-pin RGB/TTL was chosen over LVDS or MIPI so as to
    keep the cost down, and also to keep the signal speed down. Whilst
    LVDS seems initially to be a good candidate, Single-Channel LVDS is
    unsuitable for driving 1,920×1,080p60 LCD Panels: most 1,920×1,080
    LCD panels require between 2 and 3 LVDS drivers. MIPI also requires
    multiple parallel channels to achieve higher data rates. Any
    low-cost CPU chosen which did not have LVDS or MIPI would be forced
    to add a converter chip, potentially on *both* sides of the
    interface (CPU card as well as motherboard). So it makes sense to
    choose the proven, lower-speed, reliable 24-pin interface, thus
    making the EOMA-68 Standard suitable for use even with
    ultra-low-cost 320×240 RGB/TTL LCD Panels, right the way up to HDTV
    screen sizes.
-   **SD/MMC** - SD/MMC has a 4-pin, 2-pin, 1-pin and SPI mode. Transfer
    speed negotiation is possible at the hardware level. SPI can even be
    implemented as
    ["bitbanging"](http://lxr.free-electrons.com/source/drivers/spi/spi-bitbang.c)

Note however in systems design that with the cost of mass-volume
integrated SoCs dropping so significantly, the cost of deploying a SoC
with USB-based (or other) peripheral ICs to make up for the lack of
EOMA68-compliant interfaces (usually Ethernet or SATA) often *exceeds*
the cost of competitor SoCs that *do* have the full complement of
interfaces. An example is the Allwinner A20 (appx \$7 in volume) vs e.g.
a T.I \$5 SoC or an Allwinner A13, neither of which have SATA or
Ethernet. The addition of a USB-to-SATA Interface can add \$1 to the
BOM, whilst a USB-to-Ethernet IC can add \$2. Given that a 4-port Hub IC
would be required as well (an extra \$1.50), it becomes clear that the
A20 would win against the low-cost T.I SoC as well as against
Allwinner's own low-cost A13 SoC on price, performance, reliability and
power consumption.

### Requirements for USB

All CPU Cards are required to support the full backwards-compatible
auto-negotiation USB device capabilities and speeds of all former
versions of the USB Interface, up to the maximum speed and capabilities
chosen to be provided. Specifically:

-   Providing USB Low Speed (version 1.0 - 1.5 Mbit/s) is acceptable.
-   Providing USB Full Speed (version 1.1 - 12 Mbit/s) is acceptable if
    Low Speed is also provided.
-   Providing USB Hi Speed (version 2.0 - 480 Mbit/s) is acceptable if
    Full Speed and Low Speed are also provided.
-   Over the 1st USB port, providing USB Super Speed (version 3.0 - 5
    Gbit/s) is acceptable if all lower speeds are also provided.
-   Providing a higher version **only** and supporting no lower speeds
    is **not** acceptable.
-   Providing no USB 3.0 is acceptable.

Chassis (devices) must support up to a maximum chosen USB specification
and all speeds below. This guarantees that any CPU Card will work with
any device, with any combination auto-negotiating to the maximum
possible speed.

### Requirements for Ethernet

All CPU Cards are required to support the full auto-negotiation
capabilities of Ethernet, up to the maximum speed chosen to be provided.
Specifically:

-   Providing 10 Mbit/s Ethernet is acceptable
-   Providing 100 Mbit/s Ethernet and down-negotiation to 10 Mbit/s
    Ethernet is acceptable
-   Providing 100 Mbit/s Ethernet **only** is **not** acceptable
-   Providing 1,000 Mbit/s Ethernet is acceptable as long as down-level
    negotiation to both 100 Mbit/s and 10 Mbit/s is also provided
-   Providing 1,000 Mbit/s Ethernet **only** is **not** acceptable.

Chassis (devices) must also support up to a maximum chosen Ethernet
specification and all speeds below. This guarantees that any CPU Card
will work with any device, with any combination auto-negotiating to the
maximum possible speed.

### Requirements for RGB/TTL

The RGB/TTL output is the one point where close attention has to be paid
on the part of the CPU Card designers, because of the variance between
devices in which the CPU Cards will be plugged. This will need careful
monitoring and may warrant a "Certification Programme" to ensure that
CPU Cards are compliant with a wide range of devices.

-   RGB/TTL is a parallel data bus, potentially running at up to 125 or
    even 150mhz. To ensure that the parallel signals are not skewed,
    *both* CPU Cards *and* I/O Boards **MUST** ensure that the length of
    the RGB/TTL tracks (data, HSYNC, VSYNC, CLK and DE) leading to the
    68-pin connector - on either side of the 68-pin connector - are all
    of equal length. It is recommended that both the source (e.g the
    CPU) and the sink (e.g an LVDS IC) are placed as close to the 68-pin
    connector as possible.
-   CPU Cards **must** provide software-programmable support for
    anywhere between 190x120 RGB-TTL resolutions all the way up to the
    maximum that they are capable of, with the maximum resolution being
    clearly marked on both the CPU Card, as well as the retail packaging
    in which it is sold.
-   CPU Cards **should** support up to at least 1920x1080 at at least
    50fps. However, some ultra-low-cost SoCs, especially those designed
    for mobile devices, only support up to XGA or WXGA resolutions. The
    use of such SoCs is not entirely recommended.
-   EOMA-68's RGB/TTL interface is 24-bit-wide. If a particular SoC only
    has e.g. 18-bit or 15-bit RGB/TTL then the LSB (lower) bits **MUST**
    be set to logic output level 0 when the LCD interface is enabled:
    they must **NOT** be left floating or tri-state. This ensures that
    devices which are expecting the full 24-bits do not receive noise on
    the lower bits of each of the R,G and B 8-bit inputs.

Although there is no reason why individual devices should not have more
than one LCD screen, allowing them to be selected, the burden of
complexity for screen selection is placed onto the CPU Card software, so
any company planning such a multi-screen device should contact the
authors of the EOMA-68 specification (lkcl@qimod.com). Realistically,
multi-screen devices *should* consider instead using USB-based screen
driver technology such as that from DisplayLink, or place any number of
additional Display outputs onto the user-facing end of the CPU Card
*(most CPU Cards will at least have a Micro-HDMI output)*.

### Requirements for I2C

These are the requirements for provision of I2C on an EOMA-68 interface.
The summary is that the I2C bus must not be shared with any peripherals
on the CPU Card, and the CPU Card must be able to read an on-board
EEPROM (at address 0x51).

-   The I2C bus that is connected to the EOMA-68 interface will expect
    to have access to an EEPROM that is addressable (readable) at I2C
    address 0x51.
-   Additionally, there **MUST NOT** be *any* devices on the I2C bus on
    the CPU Card side. The reason is that all other addresses (other
    than 0x51) **must** be available for peripherals on the I/O Board.
-   If a CPU Card needs to connect internally to any I2C peripherals on
    the PCB inside the CPU Card, the CPU Card **MUST** use a completely
    separate I2C bus (internally), **NOT** the one that is connected to
    the EOMA-68 Interface. i.e. the I2C bus that is connected to the
    EOMA-68 interface **MUST** remain completely dedicated to EOMA-68,
    and **MUST NOT** be shared with any peripherals on the CPU Card
    itself.
-   The EEPROM **MUST NOT** be used for the storage of user data: it is
    reserved exclusively for EOMA-68.

Please note that there is considerable confusion over the definition of
addresses in I2C. The
[discussion](http://eLinux.org/Talk:Embedded_Open_Modular_Architecture/EOMA-68 "Talk:Embedded Open Modular Architecture/EOMA-68")
page has some clarification over what consititutes an address (7-bit)
and what goes into the first 8 bits (7-bit address plus 1 bit indicating
read or write). Adding to the confusion it is extremely common to find
datasheets even from respectable companies that directly contradict the
I2C specification.

Below is an example circuit showing an AT24C64 with the address set
appropriately to 0x51. **PLEASE NOTE** that the AT24C64 datasheet
**INCORRECTLY** misleads people to believe that the addresses are 0xA2
(for read) and 0xA3 (for write).

[![EOMA68-I2C-EEPROM.png](http://eLinux.org/images/7/7a/EOMA68-I2C-EEPROM.png)](http://eLinux.org/File:EOMA68-I2C-EEPROM.png)

### Requirements for UART

Strange as it may seem to have requirements for UART this section covers
practical issues regarding protection of CPU Cards. When designing I/O
Boards it is important to take into consideration that many embedded
SoCs do not have proper UART buffering. Typically if the SoC is powered
down but the I/O Board continues to be powered up such that it continues
to provide a positive voltage to the UART "RX" line this can potentially
result in power leakage through the SoC and on to other areas of the
PCB. It is therefore critical that I/O Boards ensure that this does not
happen.

As this problem is to be taken care of on the I/O Board it is worth
observing that CPU Cards do not require UART buffering. They may however
require level shifting: the signal levels are, like all other Digital
I/O in EOMA68, expected to be 3.3v.

Below is an example circuit which can be used to protect the UART-RX
line, using MOSFETs.

[![EOMA68-UART-RX-PROTECT.gif](http://eLinux.org/images/7/78/EOMA68-UART-RX-PROTECT.gif)](http://eLinux.org/File:EOMA68-UART-RX-PROTECT.gif)

Here is another example that uses schottky diodes. D1 is to reduce the
voltage slightly so that it will be below the 3.3v level that is
internally supplied to the CPU Card. The same effect could reasonably be
achieved using a resistor-divider bridge.

[![EOMA68-UART-RX-DIODE-PROTECT.png](http://eLinux.org/images/6/61/EOMA68-UART-RX-DIODE-PROTECT.png)](http://eLinux.org/File:EOMA68-UART-RX-DIODE-PROTECT.png)

There are also other options such as the use of a MAX2322 RS232 buffer
IC. Other options can be found
[here](http://www.hobbytronics.co.uk/schottky-logic-level-conversion).

### Requirements for SD/MMC and SPI

SD/MMC is a little strange in that it has hardware
backwards-compatibility down to SPI in most controllers, but even if a
hardware controller does not it is still possible to emulate SPI using
["bitbanging"](http://lxr.free-electrons.com/source/drivers/spi/spi-bitbang.c).
As bit-banging is quite CPU-intensive, and the transfer speed of SPI is
25mhz, designers of CPU Cards as well as designers of I/O Boards need to
take this into consideration. It is therefore *recommended* that CPU
Card designers either provide the full interoperable functionality
(SD/MMC as well as SPI mode) or provide a means by which the hardware
functionality is multiplex-routed to the 6 I/O pins whilst at the same
time ensuring that the same 6 pins can be fully bi-directional as GPIO,
(for example by using a small FPGA). As this latter option would be
quite complex, it is best to provide the full functionality instead.

It is also critical to bear in mind that the pins **MUST** be shared
(multiplexed) with bi-directional GPIO as noted in the EOMA-68 pinouts
table. When designing the hardware, it must be taken into consideration
that the option to switch all or any of the pins from GPIO to SD/MMC or
SPI, including selecting 4-pin, 2-pin or 1-pin mode whilst the remaining
unused pins are made available as GPIO, **MUST** be available at all
times (i.e. not just as a boot-time option but dynamically at run-time).

For most SoCs these requirements are not burdensome: most SoCs already
have multiplexed SD/MMC with bi-directional GPIO, where selection is
programmable dynamically both at boot-time and run-time , and they
support all modes of SD/MMC as well.

# Pinouts (version 1.0)

These pinouts make no attempt to be electrically or electronically
compatible with the legacy PCMCIA standard. 8 GPIO pins, 24-pin RGB/TTL,
USB2, I2C, 10/100/1000 Ethernet and SATA-III interfaces are included in
the Version 1.0 specification. *Note: USB2, SATA-III and Ethernet MUST
support auto-negotiation, and MUST support the lower capabilities (USB
1, USB 1.1, SATA-I, SATA-II, 10/100 Ethernet). Higher speeds and
capabilities are optional*.

Four 5.0 V power inputs must be provided: all pins are rated at 0.5 A,
so the maximum power dissipation is limited to 10 watts. *Design
consideration: please note that to ensure that thermal dissipation in an
enclosed fanless situation is not exceeded, a maximum of 3.5 watts
should be respected, or the card must contain its own fan (not
recommended). Most systems will **not** have active cooling.*

All High-speed signals (USB2, Ethernet, SATA-III) are balanced lines
that are still separated using GND or Power pins. All other pins are low
frequency, with the exception of the LCD Pixel Clock and Pixel Data
pins, which could go as high as 125 MHz for 1,920×1,080 @ 60fps (not
recommended). The eight GPIO pins are available, for general-purpose
bi-directional use of digital data only.

The output from the 24-pin LCD RGB/TTL pins must be electrically
compatible with a Texas Instruments SN75LVDS83B, which has electrical
characteristics of 3.3 V TTL but requires 5 V TTL tolerance. Typical TTL
high-level voltage is 2.0 volts; threshold is 1.4 V; low-level TTL
voltage is 0.8 V.

Also, because the GPIO pins can be reconfigured individually
bi-directional for any digital purposes, they **must** be made to be 5 V
TTL tolerant and tri-state isolated, and Motherboards also must be 5.0 V
TTL tolerant as well as tri-state isolated. Levels when any GPIO pin is
used either as an input or as an output should again operate at nominal
3.3 V TTL levels, thus expect "high" voltage of 2.0 volts, threshold of
1.4 V and "low" voltage of 0.8 V, but must accept voltages from 0–5 V.

The option for a CPU Card to provide Gigabit Ethernet is also available,
if a given system has it. If, however, a particular system does not have
Gigabit Ethernet, the pins **must not** be used for other purposes, and
**must** be left unconnected (floating). This is to ensure that
automatic negotiation of 100/1000 Ethernet occurs correctly.

The option for a CPU Card to provide USB3 is also available, if a given
system has it. If, however, a particular system does not have USB3, the
pins **must not** be used for other purposes, and **must** be left
unconnected (floating). Additionally, I/O Boards **must not** use the
unused pins for any other purpose and must leave them unconnected
(floating). This is to ensure that automatic down-negotiation of USB2
occurs correctly and that damage does not occur to USB3-capable CPU
Cards when plugged into I/O Boards with only USB2 capability.

Pin 22 is available for implementations to use for any special
non-EOMA68-compliant purpose. I/O Boards **MUST NOT** rely on any
specific card implementation providing any specific functionality on pin
22. Examples of appropriate uses for Pin 22 include start-up selection
of a boot mode that is specific to a processor so that it is more
convenient for a factory install to be able to re-flash and test an
Operating System without needing to open up the case. Inappropriate uses
are for example using Pin 22 as a 9th GPIO or as a One-Wire Bus, because
not all I/O Boards will provide this exact same functionality.

Note also: for factory-install purposes, cards are of course permitted
to use all and any pins, ports or methods required to carry out
factory-installs and testing, as long as after factory-install the 68
pins are capable of EOMA-68 compliance. Examples of such uses would
include a test-bench with an SD/MMC interface for first firmware boot, a
JTAG interface and other diagnostics.

## Table of EOMA-68 pinouts

<table>
<thead>
<tr class="header">
<th align="left">Row 1</th>
<th align="left">Row 2</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">* 1 GPIO (12) / SPI_MISO</td>
<td align="left">* 35 GPIO (13) / SPI_MOSI</td>
</tr>
<tr class="even">
<td align="left">* 2 LCD Pixel Data bit 18 (Blue2)</td>
<td align="left">* 36 LCD Pixel Data bit 19 (Blue3)</td>
</tr>
<tr class="odd">
<td align="left">* 3 LCD Pixel Data bit 20 (Blue4)</td>
<td align="left">* 37 LCD Pixel Data bit 21 (Blue5)</td>
</tr>
<tr class="even">
<td align="left">* 4 LCD Pixel Data bit 22 (Blue6)</td>
<td align="left">* 38 LCD Pixel Data bit 23 (Blue7)</td>
</tr>
<tr class="odd">
<td align="left">* 5 GPIO (14) / SPI_SCK</td>
<td align="left">* 39 GPIO (15) / SPI_CS</td>
</tr>
<tr class="even">
<td align="left">* 6 LCD Pixel Data bit 10 (Green2)</td>
<td align="left">* 40 LCD Pixel Data bit 11 (Green3)</td>
</tr>
<tr class="odd">
<td align="left">* 7 LCD Pixel Data bit 12 (Green4)</td>
<td align="left">* 41 LCD Pixel Data bit 13 (Green5)</td>
</tr>
<tr class="even">
<td align="left">* 8 LCD Pixel Data bit 14 (Green6)</td>
<td align="left">* 42 LCD Pixel Data bit 15 (Green7)</td>
</tr>
<tr class="odd">
<td align="left">* 9 GPIO (16) / EINT1</td>
<td align="left">* 43 POWER#</td>
</tr>
<tr class="even">
<td align="left">* 10 LCD Pixel Data bit 2 (Red2)</td>
<td align="left">* 44 LCD Pixel Data bit 3 (Red3)</td>
</tr>
<tr class="odd">
<td align="left">* 11 LCD Pixel Data bit 4 (Red4)</td>
<td align="left">* 45 LCD Pixel Data bit 5 (Red5)</td>
</tr>
<tr class="even">
<td align="left">* 12 LCD Pixel Data bit 6 (Red6)</td>
<td align="left">* 46 LCD Pixel Data bit 7 (Red7)</td>
</tr>
<tr class="odd">
<td align="left">* 13 LCD Pixel Clock</td>
<td align="left">* 47 LCD Vertical Synchronization</td>
</tr>
<tr class="even">
<td align="left">* 14 LCD Horizontal Synchronization</td>
<td align="left">* 48 LCD Pixel data enable (TFT) output</td>
</tr>
<tr class="odd">
<td align="left">* 15 I2C Clock (SCL)</td>
<td align="left">* 49 I2C Data (SDA)</td>
</tr>
<tr class="even">
<td align="left">* 16 GPIO (0) / SDMMC-D3</td>
<td align="left">* 50 GPIO (1) / SDMMC-D2</td>
</tr>
<tr class="odd">
<td align="left">* 17 GPIO (2)</td>
<td align="left">* 51 GPIO (3)</td>
</tr>
<tr class="even">
<td align="left">* 18 GPIO (4) / SDMMC-CMD</td>
<td align="left">* 52 GPIO (5) / SDMMC-CLK</td>
</tr>
<tr class="odd">
<td align="left">* 19 GPIO (6) / SDMMC-D0</td>
<td align="left">* 53 GPIO (7) / SDMMC-D1</td>
</tr>
<tr class="even">
<td align="left">* 20 ---- not used ---- / USB3 StdA_SSRX-</td>
<td align="left">* 54 ---- not used ---- / USB3 StdA_SSRX+</td>
</tr>
<tr class="odd">
<td align="left">* 21 ---- not used ---- / USB3 StdA_SSTX-</td>
<td align="left">* 55 ---- not used ---- / USB3 StdA_SSTX+</td>
</tr>
<tr class="even">
<td align="left">* 22 GPIO (10) / PWM</td>
<td align="left">* 56 Ethernet Feedback (transformer mid-point)</td>
</tr>
<tr class="odd">
<td align="left">* 23 GPIO (8) / UART_TX</td>
<td align="left">* 57 GPIO (9) / UART_RX</td>
</tr>
<tr class="even">
<td align="left">* 24 PWR (5.0 V)</td>
<td align="left">* 58 PWR (5.0 V)</td>
</tr>
<tr class="odd">
<td align="left">* 25 ---- not used ---- / 1000 Eth BI_DD+</td>
<td align="left">* 59 ---- not used ---- / 1000 Eth BI_DD−</td>
</tr>
<tr class="even">
<td align="left">* 26 10/100 Ethernet (RX+) / 1000 Eth BI_DB+</td>
<td align="left">* 60 10/100 Ethernet (RX−) / 1000 Eth BI_DB−</td>
</tr>
<tr class="odd">
<td align="left">* 27 10/100 Ethernet (TX+) / 1000 Eth BI_DA+</td>
<td align="left">* 61 10/100 Ethernet (TX−) / 1000 Eth BI_DA−</td>
</tr>
<tr class="even">
<td align="left">* 28 ---- not used ---- / 1000 Eth BI_DC+</td>
<td align="left">* 62 ---- not used ---- / 1000 Eth BI_DC−</td>
</tr>
<tr class="odd">
<td align="left">* 29 PWR (5.0 V)</td>
<td align="left">* 63 PWR (5.0 V)</td>
</tr>
<tr class="even">
<td align="left">* 30 1st USB2 (Data+)</td>
<td align="left">* 64 1st USB2 (Data−)</td>
</tr>
<tr class="odd">
<td align="left">* 31 GROUND</td>
<td align="left">* 65 GROUND</td>
</tr>
<tr class="even">
<td align="left">* 32 GPIO (11) / EINT0</td>
<td align="left">* 66 VREF-TTL (GPIO TTL Voltage Reference)</td>
</tr>
<tr class="odd">
<td align="left">* 33 GROUND</td>
<td align="left">* 67 GROUND</td>
</tr>
<tr class="even">
<td align="left">* 34 2nd USB2 (Data+)</td>
<td align="left">* 68 2nd USB2 (Data−)</td>
</tr>
</tbody>
</table>

# Start-up procedure

It is required that all pins be disabled (floating tri-state) with the
exception of the I2C Bus, the 5.0v Power and the Ground Pins. I2C Bus
Master is then enabled, to search for an I2C EEPROM at address 0xA2.
This EEPROM contains Linux Kernel "Device Tree" data, which specifies
the devices available on the motherboard, as well as the actual
pin-outs. The exact format of the EEPROM data is yet to be decided.

One important aspect of reading the I2C EEPROM is that the CPU card can
then correctly access and initialise on-board devices. It also defines
the purpose and use of the GPIO pins (if any are required). Also, the
format of the LCD data is specified. For example, the pinout diagram on
this page assumes 24-pin RGB TTL, but some motherboards may have LCD
panels which only have an 18-pin RGB/TTL interface. The data in the I2C
EEPROM therefore provides clear specifications on all the motherboard's
peripherals.

Discussion of the startup procedure is here on
[arm-netbooks](http://lists.phcomp.co.uk/pipermail/arm-netbook/2012-January/001787.html)

# Future Versions

All LCD and GPIO pins must be tri-state floating in order that future
versions of this standard can provide faster (or merely alternative)
interfaces. At the time of writing (2011), the interfaces in the 1.0
Specification are "Lowest Common Denominator" yet are still present
across the majority of 2011's powerful embedded SoCs (OMAP4440,
Enyxos4210, Tegra 3, iMX53, iMX6, Allwinner A10, A20 etc.) However, in
the future, the "Lowest Common Denominator" could well comprise MIPI
instead of RGB/TTL, 2 lane PCI-express (or its successor), and USB-3
instead of USB-2 (perhaps even a faster version of ULPI).

As of 2011 however, the total number of Embedded CPUs supporting all
these newer interfaces and still keeping to a 1.5 watt budget is
precisely zero. Support for these high-speed interfaces will therefore
be re-evaluated in 2 to 3 years time, and a future version of this
standard created when a large proportion of available embedded CPUs have
these or other high-speed interfaces that are available at the time.

# Deliberate Mechanical Non-interoperability

The re-use of the PCMCIA standard pinouts with no electrical or
electronic compatibility requires mechanical means to ensure that newer
cards cannot be inserted into legacy sockets. The proposed solution is
therefore to deploy a fascia plate on the EOMA-68 card that is both
larger in width than the standard 55 mm as well as recessed by some
8 mm, along the length of one of the 85 mm edges. The exact dimensions
are yet to be determined, as specific PCMCIA housings need to be
examined to ensure that one side can take the recessed "edge stop". The
following part, [PCMCIA Ejector
Assembly](http://www.te.com/catalog/pn/en/1717121-1) from Tyco
Electronics, is ideally suited: slimline and nothing at the left side.

# Physical Dimensions

There are two sets of acceptable dimensions: as with the legacy PCMCIA
interface, these must be backwards-compatible.

## Type II

The physical dimensions are a maximum of "Type II" (i.e. 5mm maximum
height). Cards should typically have all user-facing connectors "flush"
with the standard PCMCIA size. This will ensure that when a Card is
inserted into a device, the connectors of the CPU Card appear to be part
of the actual device. However: devices should cater for the possibility
that an EOMA-68 Card may have connectors sticking out of the end, to any
practical height.

As the EOMA-68 pinouts have been designed to avoid matching the power
lines of PCMCIA, there is no need for mechanical blocking.

## Type III

Type III Cards have a maximum height of 8mm: this is typically reserved
for x86-based CPUs which require up to 10 watts to operate. Motherboards
that take the Type III cards **must** also accept the Type II
lower-power cards.

TBC: Type III Cards should not assume that there will be fans available
in the devices in which the cards are inserted, and should make
arrangements for the removal of heat.

# Thermal Considerations

In order to reduce the cost of Motherboards and system design, Type II
Cards should not exceed an average of 3.5 watts power consumption for
prolonged periods of time, despite there being provision for up to 10
watts on the EOMA-68 connector.

CPU Cards and Motherboards that support the Type III 8mm-high cards
**must** be designed with a Thermal Dissipation capability that takes
the 10 watt TDP into consideration, as well as taking into consideration
the power consumption and heat generation of the devices used on the
Motherboard as well. Whilst fan-based solutions are acceptable, the use
of thermally-conductive copolymer plastics (some of which have thermal
dissipation capabilities exceeding that of Aluminium) are recommended.

# Header Connectors

Within the physical dimensions, there is absolutely no restriction on
the number of connectors, interfaces, headers, expansion headers or
antenna protruding from the end of the device. For example: a PCMCIA CPU
card may typically have, for best useability, a Micro-HDMI, a USB-OTG, a
5-pin Audio Jack and a Micro-SD Card Slot. These four interfaces fit
neatly within the 54 mm × 5.5 mm fascia plate size limit, as long as
mid-mount connectors are used.

Also, on the actual EOMA-68 CPU Card PCB itself, there is no restriction
on the number of expansion headers (populated or unpopulated) - the only
consideration being that the EOMA-68 CPU card clearly cannot have
expansion headers except for Engineers and Embedded Device Designers,
and also have a metal shield installed around the EOMA-68 CPU card at
the same time. However, there is no reason why the expansion headers
should be unpopulated, supplied without a metal shield to Embedded
Engineers, yet the exact same device shipped in mass-volume with a metal
shield installed, for the average user.

The only issue to note is that there is a maximum power budget of about
10 watts (although there are four 5.0V 0.5A pins) but also that there is
a practical maximum power dissipation of EOMA-68 cards of about 4 watts.
There is no provision in the standard for air-cooling (fans) in the
cases: most devices will be a passive-cooled layout.

If however the EOMA-68 card is designed to operate "stand-alone", for
example by being provided with a Power Connector on its user-facing edge
or by making use of USB-OTG, then of course the designers are free to
disregard these constraints. If however the CPU card is also expected to
operate inside a conformant device, then it must adjust accordingly and
stick within the 4 watt heat dissipation budget.

# Example Motherboards

Here is a list of example designs which conform the EOMA-68 Standard:

-   [Mini Engineering
    Board](http://eLinux.org/Embedded_Open_Modular_Architecture/EOMA-68/MiniEngineeringBoard "Embedded Open Modular Architecture/EOMA-68/MiniEngineeringBoard")
    - suitable for Free Software Developers, ODM Development, SoC "Board
    Support Packages", Experimentation, Prototyping, Electrical
    Engineers, Training and R&D purposes.
-   [Monster Engineering
    Board](http://eLinux.org/Embedded_Open_Modular_Architecture/EOMA-68/EngineeringBoard "Embedded Open Modular Architecture/EOMA-68/EngineeringBoard")
    - suitable for ODM Development "Demonstration" Purposes: designed to
    be "cut down to size", requiring the minimum amount of CAD/CAM
    Development effort and maximising return on investment.
-   [The Obligatory
    Tablet](http://eLinux.org/Embedded_Open_Modular_Architecture/EOMA-68/Tablet "Embedded Open Modular Architecture/EOMA-68/Tablet")
    - a simple tablet motherboard which could potentially be developed
    as a very low cost single-sided 2-layer PCB. Components are chosen
    to reduce development cost and risk, as well as reduce manufacturing
    cost.
-   [Laptop](http://eLinux.org/Embedded_Open_Modular_Architecture/EOMA-68/Laptop "Embedded Open Modular Architecture/EOMA-68/Laptop")
    - a laptop motherboard which could potentially be developed as a
    very low cost single-sided 2-layer PCB, through the use of modular
    and optional components for WIFI and 3G.
-   [LCD
    (TV)](http://eLinux.org/Embedded_Open_Modular_Architecture/EOMA-68/LCD-TV "Embedded Open Modular Architecture/EOMA-68/LCD-TV")
    - an LCD Monitor (or Picture Frame) which can be upgraded into a TV
    or an All-in-One Computer or an Internet TV or Personal Video
    Recorder or Media Centre. very versatile yet simple to do.
-   [Passthrough or "Blank"
    Card](http://eLinux.org/Embedded_Open_Modular_Architecture/EOMA-68/Passthrough "Embedded Open Modular Architecture/EOMA-68/Passthrough")
    - a special type of card which simply passes through the connectors,
    with little or no signal conversion.

# Contact and Discussion

For questions, comments and general discussion, please use [arm-netbook
mailing list](http://lists.phcomp.co.uk/mailman/listinfo/arm-netbook)

# Slides

[Introduction of EOMA](http://eLinux.org/images/9/9e/Eoma68.pdf "Eoma68.pdf")

# FAQ

The
[FAQ](http://eLinux.org/Embedded_Open_Modular_Architecture/EOMA-68/FAQ "Embedded Open Modular Architecture/EOMA-68/FAQ")
is now on its own page.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Embedded Open Modular
    Architecture](http://eLinux.org/Category:Embedded_Open_Modular_Architecture "Category:Embedded Open Modular Architecture")
-   [ARM processors](http://eLinux.org/Category:ARM_processors "Category:ARM processors")

