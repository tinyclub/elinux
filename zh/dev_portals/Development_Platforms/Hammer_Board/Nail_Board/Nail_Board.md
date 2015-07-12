> From: [eLinux.org](http://eLinux.org/Nail_Board "http://eLinux.org/Nail_Board")


# Nail Board



[![Nail
profile.jpg](http://eLinux.org/images/3/37/Nail_profile.jpg)](http://eLinux.org/File:Nail_profile.jpg)

The Nail Kit is ideal for taking your Hammer projects on the go with
you! You get everything in one small package. That includes the Hammer
Board module, on board JTAG, USB slave port for connecting to any Linux
PC or Laptop (JTAG, serial console, and Gadget interface), and a USB
Host port for plugging one peripheral into. You don't have to worry
about carrying a Flywatter JTAG board because the Nail Board has it
built in!



## Contents

-   [1 Specs](#specs)
-   [2 Schematic](#schematic)
-   [3 JTAG OpenOCD setup](#jtag-openocd-setup)
-   [4 Images](#images)

## Specs

-   3 User LEDs available
    -   DS2 and DS3 on the Nail Board
    -   User LED on the [Hammer Board](http://eLinux.org/Hammer_Board "Hammer Board")
-   2 interrupt driven pushbuttons
-   PWM Buzzer
-   Reset Button
-   Power LED
-   USB powered
-   USBserial port console (via internal FT2232) see [USB Device
    Listing](http://eLinux.org/Nail_Board_Devices "Nail Board Devices")
-   USB jtag interface (via internal FT2232) see [USB Device
    Listing](http://eLinux.org/Nail_Board_Devices "Nail Board Devices")
-   USB controlled gpios (4 via internal FT2232) see [USB Device
    Listing](http://eLinux.org/Nail_Board_Devices "Nail Board Devices")
-   USB gadget interface (via the
    [Hammer\_Board](http://eLinux.org/Hammer_Board "Hammer Board")) see [USB Device
    Listing](http://eLinux.org/Nail_Board_Devices "Nail Board Devices")
    -   Ethernet Gadget Driver (default)
    -   Serial Port Gadget Driver
    -   Mass Storage Driver
-   USB host interface (via the
    [Hammer\_Board](http://eLinux.org/Hammer_Board "Hammer Board"))
    -   USB 1.1 Compliant
    -   Low Speed Support (2mb)
    -   Full Speed Support (12mb)
-   2x10 expansion connector
    -   +5v available
    -   +3.3v available
    -   Headers can be jumper configured
    -   2 wire Serial Port
    -   SPI Port
    -   I2C
    -   GPIOS
    -   External Interrupts
-   [Hammer Board](http://eLinux.org/Hammer_Board "Hammer Board") Breakout Header
    -   0.1" headers
    -   All 40 pins available
    -   Solder Pads available for adding external 20 position pin
        headers or sockets



## Schematic

[Schematic](http://eLinux.org/images/d/d7/Nail_schematic.pdf "Nail schematic.pdf")

[![Nail block.jpg](http://eLinux.org/images/3/3a/Nail_block.jpg)](http://eLinux.org/File:Nail_block.jpg)



## JTAG OpenOCD setup

Coming soon, It is the same as for the fly swatter. For Ubuntu Lucid
(9.10) 64 bit version i used the openocd version from the repository

-   sudo apt-get install libftdi1
-   sudo apt-get install openocd

There are some changes in the hammer.cfg and hammer.ocd file for the
different versions of OpenOCD.

    *Media:Hammer-0.3.1.cfg‎ and Media:Hammerflash_all-0.3.1.ocd both needed to flash the Hammer through the Nailkit.
    *Media:Hammerconsole-0.3.1.cfg used to play with OpenOCD.

## Images

[![Nail-side.jpg](http://eLinux.org/images/b/b8/Nail-side.jpg)](http://eLinux.org/File:Nail-side.jpg)

[![Nail-top.jpg](http://eLinux.org/images/a/a9/Nail-top.jpg)](http://eLinux.org/File:Nail-top.jpg)

[![Case-a.jpg](http://eLinux.org/images/8/8a/Case-a.jpg)](http://eLinux.org/File:Case-a.jpg)

[![Case-b.jpg](http://eLinux.org/images/e/ea/Case-b.jpg)](http://eLinux.org/File:Case-b.jpg)

[![Case-c.jpg](http://eLinux.org/images/a/a1/Case-c.jpg)](http://eLinux.org/File:Case-c.jpg)

[![Case-d.jpg](http://eLinux.org/images/8/8b/Case-d.jpg)](http://eLinux.org/File:Case-d.jpg)

Case with small 96x64 TFT display


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware](http://eLinux.org/Category:Hardware "Category:Hardware")
-   [TCT-Hammer](http://eLinux.org/Category:TCT-Hammer "Category:TCT-Hammer")
-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")
-   [ARM Development
    Boards](http://eLinux.org/Category:ARM_Development_Boards "Category:ARM Development Boards")

