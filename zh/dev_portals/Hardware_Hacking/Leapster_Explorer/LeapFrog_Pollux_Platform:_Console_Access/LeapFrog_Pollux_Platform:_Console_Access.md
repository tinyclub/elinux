> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access")


# LeapFrog Pollux Platform: Console Access



## Contents

-   [1 Description](#description)
-   [2 Software Needed](#software-needed)
-   [3 Hardware Needed](#hardware-needed)
-   [4 Configure Terminal](#configure-terminal)
-   [5 Configure Hardware](#configure-hardware)

## Description

Console access is a fundamental building block when working with the
[LeapFrog Pollux
Platform](http://eLinux.org/LeapFrog_Pollux_Platform "LeapFrog Pollux Platform") and
[[LeapFrog\_NXP3200\_Platform] family of devices. It gives you the
ability to list files, run scripts and programs, and generally look
around inside the Linux operating system running on the device. A few
items are needed, most notably an RS232 to TTL level shifter (MAX232) if
you want to use the serial port on your PC to connect to the device, or,
since those are getting scarce these days, a USB to Serial converter,
something like an FTDI cable.

## Software Needed

Terminal - TeraTerm, Minicom, Hyperterminal, Cutecom, etc will do.

## Hardware Needed

[Cartridge](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge "LeapFrog Pollux Platform: Cartridge")

[RS232\_Level\_Shifter](http://eLinux.org/RS232_Level_Shifter "RS232 Level Shifter") or
FTDI type USB to TTL serial adapter. 3.3v versions are preferred.

-   [FT232R from DLPDESIGN](http://www.dlpdesign.com/usb/usb232r.shtml)
-   [FT232R from
    Sparkfun](http://www.sparkfun.com/commerce/product_info.php?products_id=718)
-   [CP2102 from
    Sparkfun](http://www.sparkfun.com/commerce/product_info.php?products_id=8531)

## Configure Terminal

-   Open your terminal program, and go to the connection configuration
    section.
    -   Baudrate: 115200
    -   Parity: None
    -   Stop Bits: 1
    -   Flow Control: None
    -   Com Port/Serial Device:
        -   Linux its going to be something like /dev/ttyUSB0 check
            dmesg after plugging it in to find it.
        -   Windows it will be something like Com0 look in Device
            Manager after plugging it in to find it.

Do not connect to the device yet.

## Configure Hardware

You'll need to hook up the hardware, which includes connecting your
adapter to your cartridge or cartridge connector pins. Connect adapter
Rx to device Tx and adapter Tx to device Rx along with Ground to Ground.
Then connect the adapter to your PC.

The +3.3V isn't needed for all Uart connections, however some of the
USB-\>RS-232 breakout boards may require a +3.3V reference voltage..

With everything connected, and your terminal program connected on the
right port. Start up your device, you should start seeing quite a bit of
text on to the screen. This is the boot up messages, after 20 seconds or
so, you should end up at a familiar command prompt, if not, trying
hitting return to show it. Once you get the command line, type in ls,
you should see a list of folders displayed. If you are not familiar with
Linux, this is a good time to familiarize yourself, as you will need to
be comfortable on a Linux command line.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

