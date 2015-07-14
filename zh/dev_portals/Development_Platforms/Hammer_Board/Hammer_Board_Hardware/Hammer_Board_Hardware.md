> From: [eLinux.org](http://eLinux.org/Hammer_Board_Hardware "http://eLinux.org/Hammer_Board_Hardware")


# Hammer Board Hardware



## Contents

-   [1 Hammer Board](#hammer-board)
    -   [1.1 Description](#description)
    -   [1.2 Photos](#photos)
    -   [1.3 Pinouts](#pinouts)
-   [2 Hammer-RDP](#hammer-rdp)
-   [3 Hammer Carrier Board](#hammer-carrier-board)

## Hammer Board

### Description

The Hammer comes preloaded with an open source bootloader, Linux 2.6
kernel, and a uClibc/Busybox based root file system. Board schematics,
application notes, and source code are also included on the CD. The
Hammer Board is a 40 pin DIP modules that can run full standard
GNU/Linux.

The [Hammer Kit](http://eLinux.org/Hammer_Kit "Hammer Kit") comes with everything you
will need to begin developing for the Hammer Board, and is **strongly
recommended** for first time Hammer Board users. All development tools
have been created for use with Linux, so you will need a working Linux
system to use the Hammer Board and develop applications for it.

### Photos

[![Hammer1.jpg](http://eLinux.org/images/5/5e/Hammer1.jpg)](http://eLinux.org/File:Hammer1.jpg)

[![Hammer2.jpg](http://eLinux.org/images/7/7b/Hammer2.jpg)](http://eLinux.org/File:Hammer2.jpg)

[![Hammer3.jpg](http://eLinux.org/images/b/bc/Hammer3.jpg)](http://eLinux.org/File:Hammer3.jpg)

### Pinouts

[![Hammer-pinouts.jpg](http://eLinux.org/images/1/13/Hammer-pinouts.jpg)](http://eLinux.org/File:Hammer-pinouts.jpg)

Pinout with more explanations and links.

Pin number

Main Function

Note

Alt Function

Note

1

RXD0

RS232 Receive

GPH3

GPIO port H bit 3

2

TXD0

RS232 Transmit

GPH2

GPIO port H bit 2

3

IICSDA

I2C SDA [Wikipedia explains I2C](http://en.wikipedia.org/wiki/I2c)

GPE15

GPIO port E bit 15

4

IICSCL

I2C SCL

GPE14

GPIO port E bit 14

5

SPIMISO0

SPI port 0 MISO [Wikipedia explains
SPI](http://en.wikipedia.org/wiki/Spi)

GPE11

GPIO port E bit 11

6

SPIMOSI0

SPI port 0 MOSI

GPE12

GPIO port E bit 12

7

SPICLK0

SPI port 0 clock

GPE13

GPIO port E bit 13

8

nSS0

SPI port 0 select

EINT10

External Interrupt 10 (Wakeup capable?)

9

nRESET

CPU reset.

10

nRTS0

RS232 RTS (Ready to send)

GPH1

GPIO port H bit 1

11

nCTS0

RS232 CTS (Clear to send)

GPH0

GPIO port H bit 0

12

TOUT0

PWM timer 0 out

GPB0

GPIO port B bit 0

13

TOUT2

PWM timer 2 out

GPB2

GPIO port B bit 2

14

RXD2

RS232 port 2 receive (Note, Port 1 isn't accessible)

GPH7

GPIO port H bit 7

15

TXD2

RS232 port 2 transmit

GPH6

GPIO port H bit 6

16

VM

LCD AC bias

GPC4

GPIO port C bit 4

17

VFRAME

LCD Vertical sync

GPC3

GPIO port C bit 3

18

VLINE

LCD Horizontal sync

GPC2

GPIO port C bit 2

19

VCLK

LCD pixel clock

GPC1

GPIO port C bit 1

20

GND

Ground - supply voltage return.

21

LCD\_VD0

LCD data bit 0

GPC8

GPIO port C bit 8

22

LCD\_VD1

LCD data bit 1

GPC9

GPIO port C bit 9

23

LCD\_VD2

LCD data bit 2

GPC10

GPIO port C bit 10

24

LCD\_VD3

LCD data bit 3

GPC11

GPIO port C bit 11

25

LCD\_VD4

LCD data bit 4

GPC12

GPIO port C bit 12

26

LCD\_VD5

LCD data bit 5

GPC13

GPIO port C bit 13

27

LCD\_VD6

LCD data bit 6

GPC14

GPIO port C bit 14

28

LCD\_VD7

LCD data bit 7

GPC15

GPIO port C bit 15

29

EINT11

External interrupt 11

nSS 1

SPI port 1 select

30

EINT15

External interrupt 15

SPICLK1

SPI port 1 Clock

31

EINT14

External interrupt 14

SPIMOSI1

SPI port 1 MOSI

32

EINT13

External interrupt 13

SPIMISO1

SPI port 1 MISO

33

AIN1

ADC input 1

(Note - these ADCs are independant, and do not support differential
mode)

34

AIN0

ADC input 0

35

DP1

USB 1 Slave +

36

DN1

USB 1 Slave -

37

DP0

USB 0 Host +

38

DN0

USB 0 Host -

39

+3.3VDC

Internal regulator output. Can supply 100mA(?) safely. Overloading this
may cause irreparable damage.

40

+5V

5V input.

## Hammer-RDP

Hammer-RDP stands for Hammer **R**obotics **D**evelopment **P**latform.
This is a new carrier board for Hammer being developed by TinCanTools
for the Robotics, Process Control, and the general interfacing and
hobbiest market. The Hammer-RDP is ideal for tinkering with sensors,
servos, and whatever else you might want to connect to Hammer, since it
provides both 3.3V and 5V selectable pin sections.

**Please NOTE:** You must jumper select each four pin section on
Hammer-RDP for either 3.3V or 5V operation, and connecting a 5V device
to a pin jumpered for 3.3V operation will most likely damage the [Hammer
Board](http://eLinux.org/Hammer_Board "Hammer Board").

Main Features:

    * Small size - just 3" x 3", ideal for space constrained applications.
    * Stackable add on boards can be created for custom applications such as process control, home automation, robotics, etc.
    * Three pin headers for all GPIO connections, allowing easy interfacing to sensors, servos, and other devices using this pin arrangement.
    * Jumperable dual voltage selection for all GPIO connections - 3.3V or 5V. Pins can be jumpered for either voltage in sets of four.
    * Dual voltage (3.3V and 5V) I2C bus.
    * 8 channel, 12 bit analog inputs via SPI
    * Most Hammer signals, including I2C and USB, are available on the stacking connector.

Possible add on boards you might create for the Hammer-RDP:

    * Prototyping Board
    * Single USB Host 4 port Hub with on board Flyswatter JTAG
    * Sound Board with additional analog inputs and GPIOs
    * Your application specific interface board

The only limitation is your imagination!

## [Hammer Carrier Board](http://eLinux.org/Hammer_Board_Carrier "Hammer Board Carrier")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [TCT-Hammer](http://eLinux.org/Category:TCT-Hammer "Category:TCT-Hammer")
-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")
-   [ARM Development
    Boards](http://eLinux.org/Category:ARM_Development_Boards "Category:ARM Development Boards")

