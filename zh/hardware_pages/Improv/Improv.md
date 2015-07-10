> From: [eLinux.org](http://eLinux.org/Improv "http://eLinux.org/Improv")


# Improv



The Improv is a modular engineering kit that comes with a CPU card and a
separate feature card to connect it to. The CPU card powers the device
while the feature card provides convenient access to the on-board
capabilities of the CPU card through a variety of ports and pins on it.

This unique design allows one to have multiple CPU cards for different
projects, upgrade the kit by ordering new CPU cards for additional
features or feature cards for different sets of ports and off-board
components.

Improv comes pre-installed with the Linux-based Mer operating system. We
chose Mer because it has been designed specifically for device
development, has a thriving community of both companies and enthusiasts
and has a proven open governance model directing development. You aren't
locked into this, however: you can install the operating system of your
choice.

## Contents

-   [1 Hardware](#hardware)
-   [2 Availability](#availability)
-   [3 I/O interfaces](#i-o-interfaces)
    -   [3.1 Serial connection on the 44 pin
        DIL](#serial-connection-on-the-44-pin-dil)
-   [4 Operating system](#operating-system)
-   [5 Recovery](#recovery)
-   [6 Links](#links)

# Hardware

# Availability

# I/O interfaces

## Serial connection on the 44 pin DIL

[![](http://eLinux.org/images/4/44/Improw-44pin-serial.png)](http://eLinux.org/File:Improw-44pin-serial.png)

[](http://eLinux.org/File:Improw-44pin-serial.png "Enlarge")

Ubication of the pin for a uart serial connection on the 44 pin DIL of
an improv board

With an usb-serial adaptor, it's possible to connect to the Improv with
software such as Minicom to obtain a serial console with debug messages
and a terminal.

To configure minicom to connect, simply do:

-   Run minicom: minicom -s
-   Scroll down to Serial port setup and hit enter
-   Select option A to set the serial device to /dev/ttyUSB0 and then
    hit return.
-   Select option E and change to 115200 N81 to set speed, parity,
    number of bits and number of stop bits.
-   Select option F and set to No to indicate no hardware flow control
    is needed.
-   Select option G and set to No to indicate no software flow control
    is not required.
-   Hit return again to leave the menu.
-   Scroll down to Exit and hit enter - this will exit the menu and
    start up the minicom software.

# Operating system

Improv comes with a Linux distribution based upon the [Mer
operating](http://merproject.org) system preinstalled. The full image
can be found [here
[http://makeplaylive.com/files/improv-images/plasma-active-armv7hl-sunxi-eoma68-improv-nand-latest.raw.bz2](http://makeplaylive.com/files/improv-images/plasma-active-armv7hl-sunxi-eoma68-improv-nand-latest.raw.bz2)]
and can be re-flashed any time on the device.

On this [site](http://makeplaylive.com/files/improv-images/), there are
several ready to use, nand and microsd based images, that are described
[here](http://linux-sunxi.org/Mer_and_Plasma_Active#Ready_to_use_images).
On the same [Linux-sunxi
wiki](http://linux-sunxi.org/Mer_and_Plasma_Active) page, there is
described the procedure on how to generate operating system images based
upon [Mer](http://merproject.org) and [Plasma
Active](http://plasma-active.org/).

It's possible to install any different operating system on the board, or
to boot from the microSD card.

On the Linux-sunxi wiki, you can find a
[tutorial](http://linux-sunxi.org/Installing_to_NAND_from_SD_card) on
installing a generic operating system in the nand, from a system running
on top of a microSD.

# Recovery

# Links


