> From: [eLinux.org](http://eLinux.org/Literati:Serial_Port "http://eLinux.org/Literati:Serial_Port")


# Literati:Serial Port



## Contents

-   [1 Location](#location)
-   [2 Easy Serial Port Access](#easy-serial-port-access)
-   [3 Using CA-42 Serial Cable](#using-ca-42-serial-cable)
-   [4 Boot Loader](#boot-loader)
-   [5 Boot CMD's](#boot-cmd-s)

## Location

[![](http://eLinux.org/images/thumb/8/87/Literati-w-1637287.gif/300px-Literati-w-1637287.gif)](http://eLinux.org/File:Literati-w-1637287.gif)

[](http://eLinux.org/File:Literati-w-1637287.gif "Enlarge")

White model \#1637287

The Serial port on the White literati model \#1637287 is located on the
right side of the device seen in the picture on the right. this is also
true on the older black models.

currently we do not know where they are on the newer models a picture of
a newer model is also on the right and circled is what is believed to be
the serial port.

[![](http://eLinux.org/images/thumb/6/6d/Literati-w-new.jpg/300px-Literati-w-new.jpg)](http://eLinux.org/File:Literati-w-new.jpg)

[](http://eLinux.org/File:Literati-w-new.jpg "Enlarge")

White Model new

the serial port header has the follow pinout from top to bottom:

<table>
<thead>
<tr class="header">
<th align="left">Number</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left">5V</td>
</tr>
<tr class="even">
<td align="left">2</td>
<td align="left">TX</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left">RX</td>
</tr>
<tr class="even">
<td align="left">4</td>
<td align="left">GND</td>
</tr>
</tbody>
</table>

The UART TX and RX signals are at +3.3v TTL level which requires a
[RS232\_Level\_Shifter](http://eLinux.org/RS232_Level_Shifter "RS232 Level Shifter") if
connecting to a standard RS-232 interface or to a standard USB-to-RS232
adapter. A wide range of USB-to-TTLUART adapters are available including
the following:

-   [Nokia CA-42 Data
    Cable](http://www.dealextreme.com/p/data-cable-compatible-with-nokia-ca-42-446)
-   [DLP Design FT232R Based
    Adapter](http://www.dlpdesign.com/usb/usb232r.shtml)
-   [Sparkfun FT232R Based
    Adapter](http://www.sparkfun.com/products/718)

Once connected this will enable access the bootloader and start up
processes of the linux kernel.



## Easy Serial Port Access

[![](http://eLinux.org/images/thumb/7/79/Literati_serial_open.jpg/300px-Literati_serial_open.jpg)](http://eLinux.org/File:Literati_serial_open.jpg)

[](http://eLinux.org/File:Literati_serial_open.jpg "Enlarge")

View of the serial port access

[![](http://eLinux.org/images/thumb/e/e4/Literati_serial_closed.jpg/300px-Literati_serial_closed.jpg)](http://eLinux.org/File:Literati_serial_closed.jpg)

[](http://eLinux.org/File:Literati_serial_closed.jpg "Enlarge")

Serial port with back on

[![](http://eLinux.org/images/thumb/2/23/Literati_serial_connected.jpg/300px-Literati_serial_connected.jpg)](http://eLinux.org/File:Literati_serial_connected.jpg)

[](http://eLinux.org/File:Literati_serial_connected.jpg "Enlarge")

Serial cable connected

Use the following items to expose the serial port in a handy way that
does not require reopening of the literati to access the serial port:

-   a bit of ribbon cable
-   male header pins
-   female socket


 another option includes the use of a [1/8" audio
jack](http://search.digikey.com/scripts/DkSearch/dksus.dll?Detail&name=CP1-3513-ND)
which can be easily mounted by drilling a hole in the back cover.

## Using CA-42 Serial Cable

[![](http://eLinux.org/images/thumb/0/03/Literati_CA-42-small.jpg/300px-Literati_CA-42-small.jpg)](http://eLinux.org/File:Literati_CA-42-small.jpg)

[](http://eLinux.org/File:Literati_CA-42-small.jpg "Enlarge")

CA-42 USB Serial Cable

[![](http://eLinux.org/images/thumb/e/ee/Literati_CA-42_DKU-5_pinout.jpg/300px-Literati_CA-42_DKU-5_pinout.jpg)](http://eLinux.org/File:Literati_CA-42_DKU-5_pinout.jpg)

[](http://eLinux.org/File:Literati_CA-42_DKU-5_pinout.jpg "Enlarge")

CA-42 Pinout

[![](http://eLinux.org/images/thumb/e/e1/Literati_CA-42_and_DKU-5_disassembled.jpg/300px-Literati_CA-42_and_DKU-5_disassembled.jpg)](http://eLinux.org/File:Literati_CA-42_and_DKU-5_disassembled.jpg)

[](http://eLinux.org/File:Literati_CA-42_and_DKU-5_disassembled.jpg "Enlarge")

CA-42 Cut Open

One of the simplest way to connect your PC to the Literati serial port
is to order a [Nokia CA-42 Data
Cable](http://www.dealextreme.com/p/data-cable-compatible-with-nokia-ca-42-446)
from [DealExtreme](http://www.dealextreme.com). When you receive it, you
can cut it open to find 3 or 4 wires depending on the revision. If you
have three wires, then you will find GND, RX, and TX. If you have four
wires, then the fourth wire is +3.3V. The example CA-42 only has three.
The cable can be soldered to a female pin header so it can connect to
the male pins used to expose the serial port to the outside.

## Boot Loader

during the boot process there is a 3 second count down to allow a user
to enter the bootloader before booting the kernel.

To get out of the bootloader right now you type "reset" and the device
will reboot allowing you to get out of the bootcmd line there is a way
to boot from nand but iv forgot to log the offsets.

## Boot CMD's

    boot zImage from sd that fat32 part
    boot zImage from sd that fat32 part
    boot zImage from sd that fat32 part
    boot zImage from sd that fat32 part
    ?       - alias for 'help'
    base    - print or set address offset
    bdinfo  - print Board Info structure
    bootm   - boot application image from memory
    branch  - enable or disable branch prediction
    TestMemory      - start application at address 'addr'
    cmp     - memory compare
    cp      - memory copy
    crc32   - checksum calculation
    dcache  - enable or disable data cache
    dnw     - initialize USB device and ready to receive for Windows server (specific)
    echo    - echo args to console
    erase   - erase FLASH memory
    exit    - exit script
    flinfo  - print FLASH memory information
    go      - start application at address 'addr'
    help    - print online help
    icache  - enable or disable instruction cache
    imls    - list all images found in flash
    itest   - return true/false on integer compare
    loadb   - load binary file over serial line (kermit mode)
    loads   - load S-Record file over serial line
    loady   - load binary file over serial line (ymodem mode)
    loop    - infinite loop on address range
    md      - memory display
    mm      - memory modify (auto-incrementing)
    movi    - moviNAND sub-system
    mtest   - simple RAM test
    mw      - memory write (fill)
    nand    - NAND sub-system
    nboot   - boot from NAND device
    nm      - memory modify (constant address)
    printenv- print environment variables
    protect - enable or disable FLASH write protection
    reset   - Perform RESET of the CPU
    saveenv - save environment variables to persistent storage
    setenv  - set environment variables
    sleep   - delay execution for some time
    test    - minimal test like /bin/sh
    version - print monitor version
    1 update boot from sd
    2 update kernel from sd
    3 update resource from sd
    4 update all


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Literati](http://eLinux.org/index.php?title=Category:Literati&action=edit&redlink=1 "Category:Literati (page does not exist)")

