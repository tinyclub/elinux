> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge "http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge")


# LeapFrog Pollux Platform: Cartridge



## Contents

-   [1 Details](#details)
-   [2 Pinout](#pinout)
-   [3 LeapFrog Cartridge](#leapfrog-cartridge)
    -   [3.1 LeapFrog OEM game
        cartridges](#leapfrog-oem-game-cartridges)
    -   [3.2 Hack an Original Cart](#hack-an-original-cart)
-   [4 Buy a Custom Cartridge](#buy-a-custom-cartridge)
    -   [4.1 DJHI "Did Ja Hack It?](#djhi-22did-ja-hack-it-3f)
-   [5 DIY Custom Cartridges](#diy-custom-cartridges)
    -   [5.1 All Pins Broken Out](#all-pins-broken-out)
    -   [5.2 SD, USB Serial, and NAND
        Cartridge](#sd-usb-serial-and-nand-cartridge)
    -   [5.3 SD and USB Serial Cart](#sd-and-usb-serial-cart)
-   [6 UART With Out Cartridge](#uart-with-out-cartridge)
    -   [6.1 Connecting w/o Cartridge](#connecting-w-o-cartridge)

## Details

The cartridge connector of the [LeapFrog Pollux
Platform](http://eLinux.org/LeapFrog_Pollux_Platform "LeapFrog Pollux Platform") family
of devices makes available two very useful set of pins. There is a TTL
level UART connection, and connections for an SD card. With a MAX232
level converter the UART can be connected to a terminal, to give you
console access to your device. While hooking up an SD card can allow for
extra storage or with some additional software, contain a bootable
operating system.

## Pinout

The cartridge connector has fairly easy access, once the case is
removed, to solder wires on to it. A warning, it is tight, so you should
be moderately experienced with soldering at least. You can use these
pinouts to break out what connections you need, using this method.

[Cartridge Connector
Pinout](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge_Pinout "LeapFrog Pollux Platform: Cartridge Pinout")

[Hardwire Serial
Connection](http://eLinux.org/LeapFrog_Pollux_Platform:_Hardwire_Serial_Connection "LeapFrog Pollux Platform: Hardwire Serial Connection")

## LeapFrog Cartridge

### LeapFrog OEM game cartridges

Are usable on any iteration of LeapFrog Pollux Platform devices as they
all use the same form factor. As for content each device is backwards
compatible with the software. Manufactured by Sandisk

-   s740878-1
-   4620329
-   0621
-   151-10043-07-a

-   [![](http://eLinux.org/images/thumb/3/3e/Cartfront.jpg/157px-Cartfront.jpg)](http://eLinux.org/File:Cartfront.jpg)

    LeapFrog Cartridge Front

-   [![](http://eLinux.org/images/thumb/1/19/Cartback.jpg/191px-Cartback.jpg)](http://eLinux.org/File:Cartback.jpg)

    LeapFrog Cartridge Back



### Hack an Original Cart

-   Features
    -   Cheap and easy if you have the parts already.
    -   Much easier than soldering to the connector in the device.
-   USB adapter pictured for UART access.

-   [![](http://eLinux.org/images/thumb/7/77/Hacked.jpg/183px-Hacked.jpg)](http://eLinux.org/File:Hacked.jpg)

    Modified original cartridge



## Buy a Custom Cartridge

#### DJHI "Did Ja Hack It?

-   Features
    -   Completely built and ready to use, requires only USB to Serial
        adapter.
    -   microSD socket

-   Buy one at [JerTechOnline.com](http://www.jertechonline.com)

-   [![](http://eLinux.org/images/thumb/9/95/DJHIbrdV28.png/130px-DJHIbrdV28.png)](http://eLinux.org/File:DJHIbrdV28.png)

    Rendering of the board currently being shipped

-   [![](http://eLinux.org/images/thumb/d/d7/DJHIschV28.png/181px-DJHIschV28.png)](http://eLinux.org/File:DJHIschV28.png)

    The schematic of the board currently being shipped

-   [![](http://eLinux.org/images/thumb/9/9d/DjhiBoard.jpg/148px-DjhiBoard.jpg)](http://eLinux.org/File:DjhiBoard.jpg)

    Picture of an unpopulated board

-   [![](http://eLinux.org/images/thumb/0/06/DjhiBoardAndBOBoard.png/81px-DjhiBoardAndBOBoard.png.jpeg)](http://eLinux.org/File:DjhiBoardAndBOBoard.png)

    A fully populated board with a breakout board attached

## DIY Custom Cartridges

These are boards designed by people who provided the necessary files for
you to order your own PCB, or etch one at home. If you have the know
how, or need something special, this is a good place to start.

#### All Pins Broken Out

-   Features
    -   Easy to make at home (can be made with a radioshack kit and a
        dremel)
    -   Allows access to all connector pins.
    -   Cartridge locks in like the OEM version.

-   PCB layout files.
    -   [Eagle board
        file](http://eLinux.org/images/d/d2/Dijibreakoutboard.zip "Dijibreakoutboard.zip")
    -   [Edgecard connector
        library](http://eLinux.org/images/d/dc/LEAPFROG_DIJI_EDGECARD.zip "LEAPFROG DIJI EDGECARD.zip")
    -   [Updated Cartridge
        library](http://alternet.us.com/other/LEAPFROG_DIdj.zip)

-   Building the board.
    -   Requires ability to etch your own PCBs
    -   Superglue a small piece of FR4 in the corner and dremel a notch
        out. (see dimensions below)
    -   You will also need a spacer on the top and bottom and those
        dimensions are also included.

-   [![](http://eLinux.org/images/thumb/f/f1/Awesomenesser01.jpg/160px-Awesomenesser01.jpg)](http://eLinux.org/File:Awesomenesser01.jpg)

    The breakout board

-   [![](http://eLinux.org/images/thumb/c/cd/Awesomenesser02.jpg/160px-Awesomenesser02.jpg)](http://eLinux.org/File:Awesomenesser02.jpg)

    The bottom of the board

-   [![](http://eLinux.org/images/thumb/1/16/Awesomenesser03.jpg/160px-Awesomenesser03.jpg)](http://eLinux.org/File:Awesomenesser03.jpg)

    The breakout board clicked into the Didj

-   [![](http://eLinux.org/images/thumb/5/5d/Awesomenesser04.jpg/160px-Awesomenesser04.jpg)](http://eLinux.org/File:Awesomenesser04.jpg)

    The board hooked up to a sd card and FTDI cable (same as Claudes
    board)

-   [![](http://eLinux.org/images/thumb/d/d6/Awesomenesser05.jpg/158px-Awesomenesser05.jpg.png)](http://eLinux.org/File:Awesomenesser05.jpg)

    The dimensions of the basic cartridge

-   [![](http://eLinux.org/images/thumb/d/d3/Awesomenesser06.jpg/160px-Awesomenesser06.jpg)](http://eLinux.org/File:Awesomenesser06.jpg)

    The laser printout for the toner transfer (Remember to mirror your
    printout and turn off the unused layers)



#### SD, USB Serial, and NAND Cartridge

-   Features
    -   Jumpers (For custom bootloader)
    -   SD Card (Enabled through the custom bootloader)
    -   USB through a FTDI chip
    -   Optional NAND
-   PCB layout files.
    -   [Claudes
        Website](http://sites.google.com/site/claudeschwarz/didjhacking2)
    -   [Claudes
        Schematic](http://eLinux.org/images/9/94/ClaudesSchematic.pdf "ClaudesSchematic.pdf")
    -   [Claudes Gerber
        Files](http://eLinux.org/images/0/05/ClaudesGerberFiles.zip "ClaudesGerberFiles.zip")

-   [![](http://eLinux.org/images/thumb/8/85/Claudesboardrendered.jpg/109px-Claudesboardrendered.jpg)](http://eLinux.org/File:Claudesboardrendered.jpg)

    Rendering

-   [![](http://eLinux.org/images/thumb/5/5b/Claudesboardpopulated.jpg/160px-Claudesboardpopulated.jpg)](http://eLinux.org/File:Claudesboardpopulated.jpg)

    Populated Cartridge



#### SD and USB Serial Cart

-   Board untested, use at your own risk.
-   Features
    -   Fits (mostly) within the Didj
    -   Includes an FTDI FT232RL USB-Serial adaptor for Bootloader and
        Serial Console
    -   Includes SD card slot
    -   Includes solder jumpers for custom bootloader
    -   Open Eagle source files (CC Attribution, Non-Commercial, Share
        Alike)
-   PCB layout files.
    -   [Front and Back PDF](http://alternet.us.com/other/SD_UART-2.pdf)
    -   [Eagle files](http://alternet.us.com/other/SD_UART-2.zip)
    -   [BatchPCB public
        design](http://batchpcb.com/index.php/Products/27971)

## UART With Out Cartridge

It is possible to directly solder wires to the back of the cartridge
connector.

#### Connecting w/o Cartridge

If you don't have a cartridge that breaks out the necessary connections,
and you're good with a soldering iron, you can carefully solder on the
necessary wires to the internal connections. Then bring the wires out to
your serial adapter of choice.



[![](http://eLinux.org/images/thumb/b/b8/Didj-uart.jpg/350px-Didj-uart.jpg)](http://eLinux.org/File:Didj-uart.jpg)

[](http://eLinux.org/File:Didj-uart.jpg "Enlarge")

TX, RX, GND, and VCC soldered directly to the pins.

-   Green UART-TX
-   Grey UART-RX
-   Black GROUND
-   Red +3.3V

[![](http://eLinux.org/images/thumb/7/76/Didj-cart-pinout.jpg/350px-Didj-cart-pinout.jpg)](http://eLinux.org/File:Didj-cart-pinout.jpg)

[](http://eLinux.org/File:Didj-cart-pinout.jpg "Enlarge")

Picture of the pinout of the LeapFrog Pollux Platform cartridge slot
(Underside).


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

