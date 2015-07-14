> From: [eLinux.org](http://eLinux.org/DHT-Walnut_GPIO "http://eLinux.org/DHT-Walnut_GPIO")


# DHT-Walnut GPIO



## Contents

-   [1 Warning](#warning)
-   [2 Playing with the Media LED](#playing-with-the-media-led)
    -   [2.1 Memory Locations](#memory-locations)
    -   [2.2 Playing with the LED](#playing-with-the-led)
    -   [2.3 Example using U-Boot 1.1.4](#example-using-u-boot-1-1-4)
    -   [2.4 The J5 Header](#the-j5-header)
    -   [2.5 Linux and the GPIOs](#linux-and-the-gpios)
        -   [2.5.1 Module for 2.6.16](#module-for-2-6-16)

## Warning

The GPIO registers are quite fickle things. Not only are they for the
Media LED and J5 header, they also manage the IRQs and Peripheral Chip
selects. Hitting a wrong bit in Linux will cause problems, kernel
panics, total lockups, bad things, 'plagues of locusts', you get the
idea. When using the PPC405 GPIO driver below(or the 405\_ocp\_gpio
driver in DENX [Linux
PPC](http://eLinux.org/index.php?title=Linux_PPC&action=edit&redlink=1 "Linux PPC (page does not exist)")
2.4, use a mask of 0xFFC00000, that way you don't manage to hit
something you really don't want to.

## Playing with the Media LED

The Media LED on the DHT-Walnut is wired to the processor by the GPIO
pins. However its behind a 74VHC14 Schmitt Inverter. So you have to send
it low in order to turn it on. This top section only covers the Media
LED and the U-Boot/[PPCBoot](http://eLinux.org/PPCBoot "PPCBoot") ROM Monitor.

### Memory Locations

0xef600700 is the memory location of the GPIO output register. It's 4
bytes wide. It turns on and off the GPIO pins on the PPC405GP.

0xef600704 is the location of the Tri-State register. Also 4 bytes wide.
Controls if the GPIO pin is active when high.

0xef600718 is the location of the Open Drain register. Also 4 bytes
wide. Controls if the GPIO pin is an open drain or active output.

0xef60071c is the location of the GPIO Input register. Also 4 bytes
wide. The state of each pin is reflected in the correspondig value in
this register. (synchronized with
[OPBClk](http://eLinux.org/index.php?title=OPBClk&action=edit&redlink=1 "OPBClk (page does not exist)"))

### Playing with the LED

By having all the bits in the Tri-State register high and the Output
register all low, The pins are driven low. Because the Media LED is
behind the inverter it glows when low. Setting it high in the Output
register will turn it off.

### Example using U-Boot 1.1.4

Setting the Tri-State Register to drive all usable
[GPIOs](http://eLinux.org/GPIO "GPIO").

    => nm 0xef600704
    ef600704: 00000000 ? ffc00000
    ef600704: ffc00000 ?

The LED should be lit now as its pin is driven low.


 Turning the LED on and off with the Output Register

    => nm 0xef600700
    ef600700: 00000000 ? 20000000  //LED should be off.
    ef600700: 20000000 ? 00000000  //LED goes on.
    ef600700: 00000000 ?

### The J5 Header

The J5 header located to the left of the RAM slot actually has 9 GPIO
pins wired to it. [GPIOs](http://eLinux.org/GPIO "GPIO") 1 to 9 to be exact. That header
also has the Power and Media [LEDs](http://eLinux.org/LED "LED") wired to it, so using
the first 2 pins will look awkward if your bit-banging to say a SD/MMC
card or LCD display. The J5 header has the following layout. As things
are developed they will be added.

[![Gpio-J5.jpg](http://eLinux.org/images/8/86/Gpio-J5.jpg)](http://eLinux.org/File:Gpio-J5.jpg)

### Linux and the [GPIOs](http://eLinux.org/GPIO "GPIO")

#### Module for 2.6.16

Using a module from a Monta Vista 2.4 kernel, I did the slight editing
so that it will compile with 2.6.16. I have made a patch file that can
be applied to a vanilla 2.6.16(possibly any 2.6) kernel. You can also
use Ken's 2.6.16-pre3 config on the [wiki:DHT-WalnutUsefullProjects
DHT-WalnutUsefullProjects] page as a base config.

Also included is a small bit of test code to show how to operate the
gpio driver.

Module patch and test code here:
[Media:ppc405\_gpio.tar.gz](http://eLinux.org/images/8/8c/Ppc405_gpio.tar.gz "Ppc405 gpio.tar.gz")(Version
1) **(Version 2 will be up once I clean some little problems out of the
test code, possibly tonight)**

Any errors or things you want to see, don't hesitate to let me know.
I'll be slowly adding little things to the module as helpers.

Once you have your module installed and modprobe/insmoded, just run
'make' to built the test app. If you don't have a /dev/ entry yet just
'make dev' and it'll do it for you. [Dev
FS](http://eLinux.org/index.php?title=Dev_FS&action=edit&redlink=1 "Dev FS (page does not exist)")
isn't supported yet, I'm working on that now.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")

