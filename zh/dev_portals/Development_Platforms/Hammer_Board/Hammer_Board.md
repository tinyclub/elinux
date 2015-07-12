> From: [eLinux.org](http://eLinux.org/Hammer_Board "http://eLinux.org/Hammer_Board")


# Hammer Board



## Contents

-   [1 Hammer Board Specifications](#hammer-board-specifications)
-   [2 Interface Options](#interface-options)
-   [3 Resources](#resources)
-   [4 Hammer Details](#hammer-details)
-   [5 Hammer Board Pinouts](#hammer-board-pinouts)
-   [6 Related Products](#related-products)
-   [7 Hammer Project pages](#hammer-project-pages)

## Hammer Board Specifications

[![Hammer4.jpg](http://eLinux.org/images/c/c6/Hammer4.jpg)](http://eLinux.org/File:Hammer4.jpg)

[TinCanTools Website](http://www.tincantools.com)

The Hammer CPU board from [TinCanTools](http://www.tincantools.com),is
based upon Samsung’s [S3C2410](http://eLinux.org/S3C2410 "S3C2410") ARM920T processor. It
gives you the power of an ARM9 processor in an easy to use modular
package. The Hammer CPU board fits into a standard 40 pin DIP socket. It
is an ideal platform for code development and prototyping in an embedded
environment. You can quickly interface to the Hammer using your standard
prototyping tools that are based upon 0.1 inch centers.

       * 100 MIPS Microprocessor ( CPU ): S3C2410 - Samsung (200 MHz)
       * ARM 920T core with Cache (16K+16K) and MMU
       * Main Memory: 32MB SDRAM (16M x 16 bit, 100MHz)
       * FLASH : 16MB NOR Flash
       * Peripherals available:
             o 2 UART’s (also supports IrDA)
             o 1 I2C
             o 2 SPI’s
             o 2 16-bit Timers/PWM’s
             o 1 8-bit LCD Interface + control signals
             o 1 USB Host Port
             o 1 USB Slave Port
             o 2 ADC’s (10 bit )
             o 4 External Interrupt pins
             o 1 Up to 30 pins of GPIO’s
       * JTAG Interface: 2 x 7 Header – standard ARM JTAG interface
       * Size: 0.75 inches (width) X 2.25 inches (length)
       * Package: Fits a standard 40-pin DIP socket (0.1 inch lead spacing)
       * Power Requirements: +5VDC @ 120 mA (typical)

## Interface Options

I want to use the Hammer with:

-   [Ethernet](http://eLinux.org/Hammer_Ethernet "Hammer Ethernet")
-   [BlueTooth](http://eLinux.org/Hammer_Bluetooth "Hammer Bluetooth")
-   Zigbee
-   [802.11b/g](http://eLinux.org/Hammer_WiFi "Hammer WiFi")
-   [WebCam](http://eLinux.org/Hammer_Webcam "Hammer Webcam")

## Resources

-   [HOWTOs and Tutorials](http://eLinux.org/Hammer_Board_HOWTOS "Hammer Board HOWTOS")
-   [Software](http://eLinux.org/Hammer_Board_Software "Hammer Board Software")
-   [Hardware](http://eLinux.org/Hammer_Board_Hardware "Hammer Board Hardware")
-   [Application
    Notes](http://eLinux.org/Hammer_Board_Application_Notes "Hammer Board Application Notes")

## Hammer Details

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

[![Hammer1.jpg](http://eLinux.org/images/5/5e/Hammer1.jpg)](http://eLinux.org/File:Hammer1.jpg)

[![Hammer2.jpg](http://eLinux.org/images/7/7b/Hammer2.jpg)](http://eLinux.org/File:Hammer2.jpg)

[![Hammer3.jpg](http://eLinux.org/images/b/bc/Hammer3.jpg)](http://eLinux.org/File:Hammer3.jpg)

## Hammer Board Pinouts

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

## Related Products

[Hammer Carrier Board](http://eLinux.org/Hammer_Board_Carrier "Hammer Board Carrier") -
the original carrier board for Hammer

[Nail Kit](http://eLinux.org/Nail_Board "Nail Board") - Great development system for
Hammer to take where ever you go.

[Hammer-RDP](http://eLinux.org/Hammer_RDP "Hammer RDP") - the Robotics Development
Platform

## Hammer Project pages

[Christmas Lights Controller](http://eLinux.org/Xmas_Video "Xmas Video")
 [Audio Mixer Project](http://eLinux.org/Drink_Mixer "Drink Mixer")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [TCT-Hammer](http://eLinux.org/Category:TCT-Hammer "Category:TCT-Hammer")
-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")
-   [ARM Development
    Boards](http://eLinux.org/Category:ARM_Development_Boards "Category:ARM Development Boards")

