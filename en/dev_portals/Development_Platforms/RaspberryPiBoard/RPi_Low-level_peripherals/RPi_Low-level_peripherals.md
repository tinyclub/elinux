> From: [eLinux.org](http://eLinux.org/RPi_Low-level_peripherals "http://eLinux.org/RPi_Low-level_peripherals")


# RPi Low-level peripherals





<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Introduction">1 Introduction</a>
<ul>
<li><a href="#Links">1.1 Links</a></li>
</ul></li>
<li><a href="#General_Purpose_Input.2FOutput_.28GPIO.29">2 General Purpose Input/Output (GPIO)</a>
<ul>
<li><a href="#Model_A_and_B_.28Original.29">2.1 Model A and B (Original)</a>
<ul>
<li><a href="#P1_Header">2.1.1 P1 Header</a></li>
<li><a href="#P2_header">2.1.2 P2 header</a></li>
<li><a href="#P3_header">2.1.3 P3 header</a></li>
<li><a href="#P5_header">2.1.4 P5 header</a></li>
<li><a href="#P5_Header_pinout.2C_top_row">2.1.5 P5 Header pinout, top row</a></li>
<li><a href="#P5_Header_pinout.2C_bottom_row">2.1.6 P5 Header pinout, bottom row</a></li>
<li><a href="#P6_header">2.1.7 P6 header</a></li>
<li><a href="#P6_Pinout">2.1.8 P6 Pinout</a></li>
</ul></li>
<li><a href="#Model_A.2B.2C_B.2B_and_B2">2.2 Model A+, B+ and B2</a></li>
<li><a href="#Interfacing_with_GPIO_pins">2.3 Interfacing with GPIO pins</a>
<ul>
<li><a href="#P1_Header_pinout.2C_top_row">2.3.1 P1 Header pinout, top row</a></li>
<li><a href="#P1_Header_pinout.2C_bottom_row">2.3.2 P1 Header pinout, bottom row</a></li>
<li><a href="#Referring_to_pins_on_the_Expansion_header">2.3.3 Referring to pins on the Expansion header</a></li>
<li><a href="#Power_pins">2.3.4 Power pins</a></li>
<li><a href="#GPIO_hardware_hacking">2.3.5 GPIO hardware hacking</a></li>
<li><a href="#Internal_Pull-Ups_.26_Pull-Downs">2.3.6 Internal Pull-Ups &amp; Pull-Downs</a></li>
<li><a href="#Driver_support">2.3.7 Driver support</a></li>
</ul></li>
<li><a href="#SPI">2.4 SPI</a></li>
<li><a href="#I.C2.B2C">2.5 I²C</a></li>
<li><a href="#MIPI_CSI-2">2.6 MIPI CSI-2</a></li>
<li><a href="#DSI">2.7 DSI</a></li>
<li><a href="#CEC">2.8 CEC</a></li>
<li><a href="#References">2.9 References</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Hardware & Peripherals:**

*[Hardware](http://eLinux.org/RPi_Hardware "RPi Hardware") and [Hardware
History](http://eLinux.org/RPi_HardwareHistory "RPi HardwareHistory").*

***Low-level Peripherals** and [Expansion
Boards](http://eLinux.org/RPi_Expansion_Boards "RPi Expansion Boards").*

*[Screens](http://eLinux.org/RPi_Screens "RPi Screens"), [Cases](http://eLinux.org/RPi_Cases "RPi Cases")
and [Other
Peripherals](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals").*



## Introduction

In addition to the familiar USB, Ethernet and HDMI ports, the Raspberry
Pi offers the ability to connect directly to a variety of electronic
devices. These include:

-   Digital outputs: turn lights, motors, or other devices on or off
-   Digital inputs: read an on or off state from a button, switch, or
    other sensor
-   Communication with chips or modules using low-level protocols:
    [SPI](http://www.corelis.com/education/SPI_Tutorial.htm),
    [I²C](http://i2c.info/), or [serial
    UART](https://learn.sparkfun.com/tutorials/serial-communication)

Connections are made using GPIO (["General Purpose
Input/Output"](https://en.wikipedia.org/wiki/General-purpose_input/output))
pins. Unlike USB, etc., these interfaces are not "plug and play" and
require care to avoid miswiring. The Raspberry PI GPIOs use 3.3V [logic
levels](https://learn.sparkfun.com/tutorials/logic-levels/all), and can
be damaged if connected directly to 5V levels (as found in many older
digital systems) without level-conversion circuitry.

Note that no analogue input or output is available. However, add-on
boards such as the [Rpi Gertboard](http://eLinux.org/Rpi_Gertboard "Rpi Gertboard")
provide this capability.

### Links

-   For further specific information about the Raspberry Pi's BCM2835
    GPIOs, see: [RPi BCM2835
    GPIOs](http://eLinux.org/RPi_BCM2835_GPIOs "RPi BCM2835 GPIOs").
-   Sample code in many different languages is on the [RPi GPIO Code
    Samples](http://eLinux.org/RPi_GPIO_Code_Samples "RPi GPIO Code Samples") page
-   To connect devices to the serial port (UART), see the [RPi Serial
    Connection](http://eLinux.org/RPi_Serial_Connection "RPi Serial Connection") page.
-   Sample circuits for interfacing the GPIOs with other electronics are
    shown on the [RPi GPIO Interface
    Circuits](http://eLinux.org/RPi_GPIO_Interface_Circuits "RPi GPIO Interface Circuits")
    page.



# General Purpose Input/Output (GPIO)

## Model A and B (Original)

### P1 Header

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><a href="http://elinux.org/File:Pi-GPIO-header-26-sm.png" title="thumb 26-pin GPIO header layout. Note that Rev 1 PCBs had different assignments for pins 3, 5, and 13"><img src="http://elinux.org/images/8/80/Pi-GPIO-header-26-sm.png" alt="thumb 26-pin GPIO header layout. Note that Rev 1 PCBs had different assignments for pins 3, 5, and 13" /></a>. |
<a href="http://elinux.org/File:RPi_P1_header.png"><img src="http://elinux.org/images/6/61/RPi_P1_header.png" alt="RPi P1 header.png" /></a>
<a href="http://elinux.org/File:RPi_P1_header.png" title="Enlarge"></a></td>
</tr>
</tbody>
</table>

The Raspberry Pi Model A and B boards have a 26-pin 2.54 mm
(100 mil)<sup>[[1]](#cite_note-1)</sup> expansion header, marked as P1,
arranged in a 2x13 strip. They provide 8 GPIO pins plus access to I²C,
SPI, UART), as well as +3.3 V, +5 V and GND supply lines. Pin one is the
pin in the first column and on the bottom row.
<sup>[[2]](#cite_note-2)</sup>

**Revision 1 PCBs:** Raspberry Pis with a revision 1 PCB (September 2012
or earlier) have a different pin assignment on the P1 connector:

-   P1 pin 3 is GPIO 0 / SDA0 (not GPIO 2)
-   P1 pin 5 is GPIO 1 / SCL0 (not GPIO 3)
-   P1 pin 13 is GPIO 21 (not GPIO 27)

Revision 1 PCBs also do not have the P5 header (see below). See [this
discussion](http://www.raspberrypi.org/archives/1929#comment-31646) for
more details of the changes between Rev 1 and Rev 2 PCBs.

### P2 header

The P2 header is the VideoCore JTAG and used only during the production
of the board. It cannot be used as the ARM JTAG
<sup>[[3]](#cite_note-3)</sup>. This connector is unpopulated in Rev 2.0
boards.

[![RPi P2
header.png](http://eLinux.org/images/5/53/RPi_P2_header.png)](http://eLinux.org/File:RPi_P2_header.png)

Useful P2 pins:

-   Pin 1 - 3.3V (same as P1-01, 50 mA max current draw across both of
    them)
-   Pin 7 - GND
-   Pin 8 - GND

### P3 header

The P3 header, unpopulated, is the LAN9512 JTAG
<sup>[[4]](#cite_note-4)</sup>.

[![RPi P3
header.png](http://eLinux.org/images/b/b5/RPi_P3_header.png)](http://eLinux.org/File:RPi_P3_header.png)

Useful P3 pins:

-   Pin 7 - GND

### P5 header

The P5 header was added with the release of the Revision 2.0 PCB design.

[![RPi P5
header.png](http://eLinux.org/images/c/c4/RPi_P5_header.png)](http://eLinux.org/File:RPi_P5_header.png)

### P5 Header pinout, top row

As seen from the back of the board:

**Pin Number**

**Pin Name Rev2**

**Hardware Notes**

**Alt 0 Function**

**Other Alternative Functions**

P5-01

5V0

Supply through input poly fuse

P5-03

GPIO28

I2C0\_SDA

ALT2 = PCM\_CLK

P5-05

GPIO30

ALT2 = PCM\_DIN ALT3 = UART0\_CTS ALT5 = UART1\_CTS

P5-07

GND

### P5 Header pinout, bottom row

As seen from the back of the board:

**Pin Number**

**Pin Name Rev2**

**Hardware Notes**

**Alt 0 Function**

**Other Alternative Functions**

P5-02

3.3 V

50 mA max (combined with P1)

P5-04

GPIO29

I2C0\_SCL

ALT2 = PCM\_FS

P5-06

GPIO31

ALT2 = PCM\_DOUT ALT3 = UART0\_RTS ALT5 = UART1\_RTS

P5-08

GND

[![](http://eLinux.org/images/thumb/7/72/Male-slanted2small.jpg/150px-Male-slanted2small.jpg)](http://eLinux.org/File:Male-slanted2small.jpg)

[](http://eLinux.org/File:Male-slanted2small.jpg "Enlarge")

Slanted P5 header

Note that the connector is intended to be mounted on the bottom of the
PCB, so that for those who put the connector on the top side, the pin
numbers are mirrored. Pin 1 and pin 2 are swapped, pin 3 and 4, etc.

An alternative way to attach this header is on top, [at a slant away
from the P1
header.](http://raspi.tv/2013/the-leaning-header-of-pi5a-how-best-to-solder-a-header-on-p5)

The new header can provide a second I²C channel (SDA + SCL) and
handshake lines for the existing UART (TxD and RxD), or it can be used
for an I2S (audio codec chip) interface using the PCM signals CLK, FS
(Frame Sync), Din and Dout.

Note that the connector is placed JUST off-grid with respect to the P1
connector.

### P6 header

The P6 header was added with the release of the Revision 2.0 PCB design.

[![RPi P6
header.png](http://eLinux.org/images/4/48/RPi_P6_header.png)](http://eLinux.org/File:RPi_P6_header.png)

### P6 Pinout

**Pin Number**

**Pin Name Rev2**

**Hardware Notes**

P6-01

RUN

Short to ground to reset the BCM2835

P6-02

GND

A reset button can be attached to the P6
header.<sup>[[5]](#cite_note-5)</sup> Momentarily shorting the two pins
of P6 together will cause a soft reset of the CPU (which can also 'wake'
the Pi from halt/shutdown state).

## Model A+, B+ and B2

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<tbody>
<tr class="odd">
<td align="left"><a href="http://elinux.org/File:A_plus_hdr_sm.jpg"><img src="http://elinux.org/images/thumb/f/fc/A_plus_hdr_sm.jpg/300px-A_plus_hdr_sm.jpg" /></a>
<a href="http://elinux.org/File:A_plus_hdr_sm.jpg" title="Enlarge"></a>
Model A+</td>
<td align="left"><a href="http://elinux.org/File:B_plus_hdr_sm.jpg"><img src="http://elinux.org/images/thumb/3/30/B_plus_hdr_sm.jpg/300px-B_plus_hdr_sm.jpg" /></a>
<a href="http://elinux.org/File:B_plus_hdr_sm.jpg" title="Enlarge"></a>
Models B+, B2</td>
<td align="left"><a href="http://elinux.org/File:Pi-GPIO-header.png"><img src="http://elinux.org/images/thumb/5/5c/Pi-GPIO-header.png/300px-Pi-GPIO-header.png" /></a>
<a href="http://elinux.org/File:Pi-GPIO-header.png" title="Enlarge"></a>
Connector pinout</td>
</tr>
</tbody>
</table>


The Raspberry Pi Model A+ and B+ boards, and the Pi 2 Model B, have a
40-pin header marked J8, arranged as 2x20 pins. The first 26 pins are
the same as P1 on the A/B boards, with the remaining 14 pins providing
additional GPIO and ground pins, and an EEPROM ID feature for
auto-configuration with add-on "HAT"
boards.<sup>[[6]](#cite_note-6)</sup>

## Interfacing with GPIO pins

**GPIO voltage levels are 3.3 V and are not 5 V tolerant. There is no
over-voltage protection on the board** - the intention is that people
interested in serious interfacing will use an external board with
buffers, level conversion and analog I/O rather than soldering directly
onto the main board.

All the GPIO pins can be reconfigured to provide alternate functions,
SPI, [PWM](http://en.wikipedia.org/wiki/Pulse-width_modulation), I²C and
so. At reset only pins GPIO 14 & 15 are assigned to the alternate
function UART, these two can be switched back to GPIO to provide a total
of 17 GPIO pins<sup>[[7]](#cite_note-7)</sup>. Each of their functions
and full details of how to access are detailed in the chipset datasheet
<sup>[[8]](#cite_note-8)</sup>.

Each GPIO can interrupt,
high/low/rise/fall/change.<sup>[[9]](#cite_note-9)</sup><sup>[[10]](#cite_note-10)</sup>
There is currently no support for GPIO interrupts in the official
kernel, however a patch exists, requiring compilation of modified source
tree.<sup>[[11]](#cite_note-11)</sup> The 'Raspbian "wheezy"'
<sup>[[12]](#cite_note-12)</sup> version that is currently recommended
for starters already includes GPIO interrupts.

GPIO input hysteresis (Schmitt trigger) can be on or off, output slew
rate can be fast or limited, and source and sink current is configurable
from 2 mA up to 16 mA. Note that chipset GPIO pins 0-27 are in the same
block and these properties are set per block, not per pin. See [GPIO
Datasheet Addendum - GPIO Pads
Control](http://www.scribd.com/doc/101830961/GPIO-Pads-Control2).
Particular attention should be applied to the note regarding SSO
(Simultaneous Switching Outputs): to avoid interference, driving
currents should be kept as low as possible.

The available [alternative
functions](http://eLinux.org/RPi_BCM2835_GPIOs "RPi BCM2835 GPIOs") and their
corresponding pins are detailed below. These numbers are in reference to
the chipset documentation and may not match the numbers exposed in
Linux. Only fully usable functions are detailed, for some alternative
functions not all the necessary pins are available for the funtionality
to be actually used.

There is also some information on the [Tutorial on Easy GPIO Hardware &
Software](http://eLinux.org/RPi_Tutorial_Easy_GPIO_Hardware_%26_Software "RPi Tutorial Easy GPIO Hardware & Software").

Kernel boot messages go to the UART at 115200 bit/s - there are more
details on the [serial
port](http://eLinux.org/RPi_Serial_Connection "RPi Serial Connection") page.



### P1 Header pinout, top row

**Pin Number**

**Pin Name Rev1**

**Pin Name Rev2**

**Hardware Notes**

**Alt 0 Function**

**Other Alternative Functions**

P1-02

5V0

Supply through input poly fuse

 

 

P1-04

5V0

Supply through input poly fuse

 

 

P1-06

GND

 

 

 

P1-08

GPIO 14

Boot to Alt 0 -\>

UART0\_TXD

ALT5 = UART1\_TXD

P1-10

GPIO 15

Boot to Alt 0 -\>

UART0\_RXD

ALT5 = UART1\_RXD

P1-12

GPIO 18

 

PCM\_CLK

ALT4 = SPI1\_CE0\_N ALT5 = PWM0

P1-14

GND

 

 

 

P1-16

GPIO23

ALT3 = SD1\_CMD ALT4 = ARM\_RTCK

P1-18

GPIO24

ALT3 = SD1\_DAT0 ALT4 = ARM\_TDO

P1-20

GND

 

 

 

P1-22

GPIO25

ALT3 = SD1\_DAT1 ALT4 = ARM\_TCK

P1-24

GPIO08

SPI0\_CE0\_N

P1-26

GPIO07

SPI0\_CE1\_N

### P1 Header pinout, bottom row

**Pin Number**

**Pin Name Rev1**

**Pin Name Rev2**

**Hardware Notes**

**Alt 0 Function**

**Other Alternative Functions**

P1-01

3.3 V

50 mA max (01 & 17)

 

 

P1-03

GPIO 0

**GPIO 2**

1K8 pull up resistor

I2C0\_SDA / **I2C1\_SDA**

P1-05

GPIO 1

**GPIO 3**

1K8 pull up resistor

I2C0\_SCL / **I2C1\_SCL**

P1-07

GPIO 4

GPCLK0

ALT5 = ARM\_TDI

P1-09

GND

 

 

 

P1-11

GPIO17

ALT3 = UART0\_RTS ALT4 = SPI1\_CE1\_N ALT5 = UART1\_RTS

P1-13

GPIO21

**GPIO27**

PCM\_DOUT / **reserved**

ALT4 = SPI1\_SCLK ALT5 = GPCLK1 / **ALT3 = SD1\_DAT3 ALT4 = ARM\_TMS**

P1-15

GPIO22

ALT3 = SD1\_CLK ALT4 = ARM\_TRST

P1-17

3.3 V

50 mA max (01 & 17)

 

 

P1-19

GPIO10

SPI0\_MOSI

P1-21

GPIO9

SPI0\_MISO

P1-23

GPIO11

SPI0\_SCLK

P1-25

GND

 

 

 



<table>
<thead>
<tr class="header">
<th align="left">Colour legend</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">+5 V</td>
</tr>
<tr class="even">
<td align="left">+3.3 V</td>
</tr>
<tr class="odd">
<td align="left">Ground, 0V</td>
</tr>
<tr class="even">
<td align="left">UART</td>
</tr>
<tr class="odd">
<td align="left">GPIO</td>
</tr>
<tr class="even">
<td align="left">SPI</td>
</tr>
<tr class="odd">
<td align="left">I²C</td>
</tr>
</tbody>
</table>

KiCad symbol:
[File:Conn-raspberry.lib](http://eLinux.org/File:Conn-raspberry.lib "File:Conn-raspberry.lib")<sup>[[13]](#cite_note-13)</sup>

Pin 3 (SDA0) and Pin 5 (SCL0) are preset to be used as an I²C interface.
So there are 1.8 kohm pulls up resistors on the board for these
pins.<sup>[[14]](#cite_note-14)</sup>

Pin 12 supports
[PWM](http://en.wikipedia.org/wiki/Pulse-width_modulation).

It is also possible to reconfigure GPIO connector pins P1-7, 15, 16, 18,
22 (chipset GPIOs 4 and 22 to 25) to provide an ARM JTAG
interface.<sup>[[15]](#cite_note-15)</sup> However ARM\_TMS is not
available on the GPIO connector (chipset pin 12 or 27 is needed).
Chipset pin 27 is available on S5, the CSI camera interface however.

It is also possible to reconfigure GPIO connector pins P1-12 and 13
(chipset GPIO 18 and 21) to provide an I2S (a hardware modification may
be required<sup>[[16]](#cite_note-I2S-16)</sup>) or PCM
interface.<sup>[[17]](#cite_note-17)</sup> However, PCM\_FS and PCM\_DIN
(chipset pins 19 and 20) are needed for I2S or PCM.

A second I²C interface (GPIO02\_ALT0 is SDA1 and GPIO03\_ALT0 is SCL1)
and two further GPIOs (GPIO05\_ALT0 is GPCLK1, and GPIO27) are available
on S5, the CSI camera interface.

### Referring to pins on the Expansion header

The header is referred to as "The GPIO Connector (P1)". To avoid
nomenclature confusion between Broadcom signal names on the SoC and pin
names on the expansion header, the following naming is highly
recommended:

-   The expansion header is referred to as "Expansion Header" or "GPIO
    Connector (P1)"
-   Pins on the GPIO connector (P1) are referred to as P1-01, etc.
-   Names GPIO0, GPIO1, GPIOx-ALTy, etc. refer to the signal names on
    the SoC as enumerated in the Broadcom datasheet, where "x" matches
    BCM2835 number (without leading zero) and "y" is the alternate
    number column 0 to 5 on page 102-103 of the Broadcom document. For
    example, depending on what you are describing, use either "GPIO7" to
    refer to a row of the table, and "GPIO7-ALT0" would refer to a
    specific cell of the table.
-   When refering to signal names, the Broadcom name should be modified
    slightly to minimize confusion. The Broadcom SPI bus pin names are
    fine, such as "SPI0\_\*" and "SPI1\_\*", but they did not do the
    same on the I²C and UART pins. Instead of using "SDA0" and "SCL0",
    "I2C0\_SDA" and "I2C0\_SCL" should be used; and "UART0\_TXD" and
    "UART0\_RXD" instead of "TX" or "TXD" and "RX" or "RXD".

### Power pins

The maximum permitted current draw from the 3.3 V pins is 50 mA.

Maximum permitted current draw from the 5 V pin is the USB input current
(usually 1 A) minus any current draw from the rest of the
board.<sup>[[18]](#cite_note-18)</sup>

-   Model A: 1000 mA - 500 mA -\> max current draw: 500 mA
-   Model B: 1000 mA - 700 mA -\> max current draw: 300 mA

Be very careful with the 5 V pins P1-02 and P1-04, because if you short
5 V to any other P1 pin you may permanently damage your RasPi. Before
probing P1, it is a good idea to strip short pieces of insulation off a
wire and push them over the 5 V pins are not accidentally shorted with a
probe.

### GPIO hardware hacking

The complete list of [chipset GPIO
pins](http://eLinux.org/RPi_BCM2835_GPIOs "RPi BCM2835 GPIOs") which are available on the
GPIO connector is:

> [0](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO0 "RPi BCM2835 GPIOs"),
> [1](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO1 "RPi BCM2835 GPIOs"),
> [4](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO4 "RPi BCM2835 GPIOs"),
> [7](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO7 "RPi BCM2835 GPIOs"),
> [8](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO8 "RPi BCM2835 GPIOs"),
> [9](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO9 "RPi BCM2835 GPIOs"),
> [10](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO10 "RPi BCM2835 GPIOs"),
> [11](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO11 "RPi BCM2835 GPIOs"),
> [14](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO14 "RPi BCM2835 GPIOs"),
> [15](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO15 "RPi BCM2835 GPIOs"),
> [17](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO17 "RPi BCM2835 GPIOs"),
> [18](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO18 "RPi BCM2835 GPIOs"),
> [21](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO21 "RPi BCM2835 GPIOs"),
> [22](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO22 "RPi BCM2835 GPIOs"),
> [23](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO23 "RPi BCM2835 GPIOs"),
> [24](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO24 "RPi BCM2835 GPIOs"),
> [25](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO25 "RPi BCM2835 GPIOs")

(on the Revision2.0 RaspberryPis, this list changes to:
[2](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO2 "RPi BCM2835 GPIOs"),
[3](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO3 "RPi BCM2835 GPIOs"),
[4](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO4 "RPi BCM2835 GPIOs"),
[7](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO7 "RPi BCM2835 GPIOs"),
[8](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO8 "RPi BCM2835 GPIOs"),
[9](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO9 "RPi BCM2835 GPIOs"),
[10](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO10 "RPi BCM2835 GPIOs"),
[11](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO11 "RPi BCM2835 GPIOs"),
[14](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO14 "RPi BCM2835 GPIOs"),
[15](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO15 "RPi BCM2835 GPIOs"),
[17](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO17 "RPi BCM2835 GPIOs"),
[18](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO18 "RPi BCM2835 GPIOs"),
[22](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO22 "RPi BCM2835 GPIOs"),
[23](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO23 "RPi BCM2835 GPIOs"),
[24](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO24 "RPi BCM2835 GPIOs"),
[25](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO25 "RPi BCM2835 GPIOs"),
[27](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO27 "RPi BCM2835 GPIOs"), with
[28](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO28 "RPi BCM2835 GPIOs"),
[29](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO29 "RPi BCM2835 GPIOs"),
[30](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO30 "RPi BCM2835 GPIOs"),
[31](http://eLinux.org/RPi_BCM2835_GPIOs#GPIO31 "RPi BCM2835 GPIOs") additionally
available on the [P5 header](#P5_header))

As noted above, P1-03 and P1-05 (SDA0 and SCL0 / SDA1 and SCL1) have
1.8 kohm pull-up resistors to 3.3 V.

If 17 GPIOs are not sufficient for a project, there are a few other
signals potentially available, with varying levels of software and
hardware (soldering iron) hackery skills:

GPIO02, 03, 05 and 27 are available on S5 (the CSI interface) when a
camera peripheral is not connected to that socket, and are configured by
default to provide the functions SDA1, SCL1, CAM\_CLK and CAM\_GPIO
respectively. SDA1 and SCL1 have 1K6 pull-up resistors to 3.3 V.

GPIO06 is LAN\_RUN and is available on pad 12 of the footprint for IC3
on the Model A. On Model B, it is in use for the Ethernet function.

There are a few other chipset GPIO pins accessible on the PCB but are in
use:

-   GPIO16 drives status LED D5 (usually SD card access indicator)
-   GPIO28-31 are used by the board ID and are connected to resistors R3
    to R10 (only on Rev1.0 boards).
-   GPIO40 and 45 are used by analogue audio and support
    [PWM](http://en.wikipedia.org/wiki/Pulse-width_modulation). They
    connect to the analogue audio circuitry via R21 and R27
    respectively.
-   GPIO46 is HDMI hotplug detect (goes to pin 6 of IC1).
-   GPIO47 to 53 are used by the SD card interface. In particular,
    GPIO47 is SD card detect (this would seem to be a good candidate for
    re-use). GPIO47 is connected to the SD card interface card detect
    switch; GPIO48 to 53 are connected to the SD card interface via
    resistors R45 to R50.



### Internal Pull-Ups & Pull-Downs

The GPIO ports include the ability to enable and disable internal
pull-up or pull-down resistors (see below for code examples/support of
this):

-   Pull-up is 50 kOhm - 65 kOhm
-   Pull-down is 50 kOhm - 60 kOhm

### Driver support

The Foundation will not include a GPIO driver in the initial release,
standard Linux GPIO drivers should work with minimal
modification.<sup>[[19]](#cite_note-19)</sup>

The community implemented SPI and I²C drivers
<sup>[[20]](#cite_note-20)</sup>, which will be integrated with the new
Linux pinctrl concept in a later version of the kernel. (On Oct. 14
2012, it was already included in the latest raspbian image.) A first
compiled version as Linux modules is available to install on the
19/04/2012 Debian image, including 1-wire
support<sup>[[21]](#cite_note-21)</sup>. The I²C and SPI driver uses the
hardware modules of the microcontroller and interrupts for low CPU
usage, the 1-wire support uses bitbanging on the GPIO ports, which
results in higher CPU usage.

GordonH<sup>[[22]](#cite_note-22)</sup> wrote a (mostly) Arduino
compatible/style [WiringPi
library](https://projects.drogon.net/raspberry-pi/wiringpi/) in C for
controlling the GPIO pins.

A useful tutorial on setting up I²C driver support can be found at
[Robot
Electronics](http://www.robot-electronics.co.uk/htm/raspberry_pi_examples.htm)
- look for the downloadable document rpi\_i2c\_setup.doc

## SPI

There is one SPI bus brought out to the header:
[RPi\_SPI](http://eLinux.org/RPi_SPI "RPi SPI")

## I²C

There are two I²C-buses on the Raspberry Pi: One on P1, and one on P5.

Note that there's a bug concerning I²C-clock-stretching, so don't use
I²C-devices which use clock-stretching directly with the Raspberry Pi,
or use a workaround. Details about this bug can be found at:

-   [http://www.raspberrypi.org/phpBB3/viewtopic.php?f=44&t=13771](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=44&t=13771)
-   [http://www.advamation.com/knowhow/raspberrypi/rpi-i2c-bug.html](http://www.advamation.com/knowhow/raspberrypi/rpi-i2c-bug.html)

## MIPI CSI-2

On the production board<sup>[[23]](#cite_note-23)</sup>, the Raspberry
Pi Foundation design brings out the MIPI CSI-2 (Camera Serial
Interface<sup>[[24]](#cite_note-24)</sup>) to a 15-way flat flex
connector S5, between the Ethernet and HDMI connectors. A compatible
camera<sup>[[25]](#cite_note-25)</sup> with 5 Megapixels and 1080p video
resolution was released in May 2013.

## DSI

On the production board, the Raspberry Pi Foundation design brings out
the DSI (Display Serial Interface<sup>[[26]](#cite_note-26)</sup>) to a
15-way flat flex connector labelled S2, next to Raspberry Pi logo. It
has two data lanes and a clock lane, to drive a possible future LCD
screen device. Some smart phone screens use
DSI<sup>[[27]](#cite_note-27)</sup>.

## CEC

[HDMI-CEC (Consumer Electronics Control for
HDMI)](http://eLinux.org/CEC_(Consumer_Electronics_Control)_over_HDMI "CEC (Consumer Electronics Control) over HDMI")
is supported by hardware but some driver work will be needed and
currently isn't exposed into Linux userland. Eben notes that he has seen
CEC demos on the Broadcom SoC they are using.

libCEC with Raspberry Pi support has been included in OpenELEC and will
be included in Raspbmc RC4.<sup>[[28]](#cite_note-28)</sup>

For more information about HDMI-CEC and what you could do with it on the
Raspberry Pi please see the [CEC (Consumer Electronics Control) over
HDMI](http://eLinux.org/CEC_(Consumer_Electronics_Control)_over_HDMI "CEC (Consumer Electronics Control) over HDMI")
article.

## References

1.  [↑](#cite_ref-1)
    [raspberrypi.org](http://www.raspberrypi.org/forum/features-and-requests/easy-gpio-hardware-software/page-3/#p31907)
2.  [↑](#cite_ref-2)
    [raspberrypi.org](http://www.raspberrypi.org/archives/384)
3.  [↑](#cite_ref-3)
    [http://www.raspberrypi.org/phpBB3/viewtopic.php?f=24&t=5894](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=24&t=5894)
4.  [↑](#cite_ref-4)
    [http://www.raspberrypi.org/phpBB3/viewtopic.php?f=24&t=5894](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=24&t=5894)
5.  [↑](#cite_ref-5)
    [raspi.tv](http://raspi.tv/2012/making-a-reset-switch-for-your-rev-2-raspberry-pi)
6.  [↑](#cite_ref-6)
    [raspberrypi.org](http://www.raspberrypi.org/wp-content/uploads/2014/04/bplus-gpio.png)
7.  [↑](#cite_ref-7)
    [raspberrypi.org](http://www.raspberrypi.org/archives/384)
8.  [↑](#cite_ref-8)
    [raspberrypi.org](http://www.raspberrypi.org/wp-content/uploads/2012/02/BCM2835-ARM-Peripherals.pdf)
9.  [↑](#cite_ref-9)
    [http://www.raspberrypi.org/archives/384\#comment-5217](http://www.raspberrypi.org/archives/384#comment-5217)
10. [↑](#cite_ref-10)
    [http://www.raspberrypi.org/wp-content/uploads/2012/02/BCM2835-ARM-Peripherals.pdf](http://www.raspberrypi.org/wp-content/uploads/2012/02/BCM2835-ARM-Peripherals.pdf)
11. [↑](#cite_ref-11)
    [http://www.raspberrypi.org/phpBB3/viewtopic.php?f=44&t=7509](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=44&t=7509)
12. [↑](#cite_ref-12)
    [http://www.raspberrypi.org/downloads](http://www.raspberrypi.org/downloads)
13. [↑](#cite_ref-13)
    [http://www.raspberrypi.org/forum/projects-and-collaboration-general/gpio-header-pinout-clarification/page-2](http://www.raspberrypi.org/forum/projects-and-collaboration-general/gpio-header-pinout-clarification/page-2)
14. [↑](#cite_ref-14)
    [http://www.raspberrypi.org/forum/features-and-requests/easy-gpio-hardware-software/page-6/\#p56480](http://www.raspberrypi.org/forum/features-and-requests/easy-gpio-hardware-software/page-6/#p56480)
15. [↑](#cite_ref-15)
    [http://www.raspberrypi.org/forum?mingleforumaction=viewtopic&t=1288.1](http://www.raspberrypi.org/forum?mingleforumaction=viewtopic&t=1288.1)
16. [↑](#cite_ref-I2S_16-0) [Forum:Sad about removal of I2S. Why was
    this change
    made?](http://www.raspberrypi.org/forum/features-and-requests/sad-about-removal-of-i2s-why-was-this-change-made)
17. [↑](#cite_ref-17)
    [http://www.raspberrypi.org/forum?mingleforumaction=viewtopic&t=1288.2](http://www.raspberrypi.org/forum?mingleforumaction=viewtopic&t=1288.2)
18. [↑](#cite_ref-18)
    [http://www.raspberrypi.org/forum?mingleforumaction=viewtopic&t=1536\#postid-21841](http://www.raspberrypi.org/forum?mingleforumaction=viewtopic&t=1536#postid-21841)
19. [↑](#cite_ref-19)
    [http://www.raspberrypi.org/forum?mingleforumaction=viewtopic&t=1278.0](http://www.raspberrypi.org/forum?mingleforumaction=viewtopic&t=1278.0)
20. [↑](#cite_ref-20)
    [http://www.bootc.net/projects/raspberry-pi-kernel/](http://www.bootc.net/projects/raspberry-pi-kernel/)
21. [↑](#cite_ref-21)
    [http://www.raspberrypi.org/phpBB3/viewtopic.php?p=86172\#p86172](http://www.raspberrypi.org/phpBB3/viewtopic.php?p=86172#p86172)
22. [↑](#cite_ref-22)
    [http://www.raspberrypi.org/forum/general-discussion/wiring-for-the-raspberry-pis-gpio](http://www.raspberrypi.org/forum/general-discussion/wiring-for-the-raspberry-pis-gpio)
23. [↑](#cite_ref-23)
    [http://www.raspberrypi.org/wp-content/uploads/2012/04/Raspberry-Pi-Schematics-R1.0.pdf](http://www.raspberrypi.org/wp-content/uploads/2012/04/Raspberry-Pi-Schematics-R1.0.pdf)
24. [↑](#cite_ref-24)
    [http://www.mipi.org/specifications/camera-interface](http://www.mipi.org/specifications/camera-interface)
25. [↑](#cite_ref-25)
    [http://elinux.org/Rpi\_Camera\_Module](http://elinux.org/Rpi_Camera_Module)
26. [↑](#cite_ref-26)
    [http://www.mipi.org/specifications/display-interface](http://www.mipi.org/specifications/display-interface)
27. [↑](#cite_ref-27)
    [http://en.wikipedia.org/wiki/Display\_Serial\_Interface](http://en.wikipedia.org/wiki/Display_Serial_Interface)
28. [↑](#cite_ref-28)
    [http://blog.pulse-eight.com/2012/08/01/libcec-1-8-0-a-firmware-upgrade-and-raspberry-pi-support/](http://blog.pulse-eight.com/2012/08/01/libcec-1-8-0-a-firmware-upgrade-and-raspberry-pi-support/)



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
History](http://eLinux.org/RPi_HardwareHistory "RPi HardwareHistory") - **Low-level
peripherals** - [Expansion
Boards](http://eLinux.org/RPi_Expansion_Boards "RPi Expansion Boards")

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

