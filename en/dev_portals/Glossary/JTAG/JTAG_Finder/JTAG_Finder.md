> From: [eLinux.org](http://eLinux.org/JTAG_Finder "http://eLinux.org/JTAG_Finder")


# JTAG Finder



**[User:Hunz](http://eLinux.org/User:Hunz "User:Hunz") is searching a maintainer for this
project!** Since he currently doesn't have the time/will to realize the
further plans.

Due to his talk held at the [ph-neutral](http://ph-neutral.org), this
article is undergoing a major rework.



## Contents

-   [1 (How) Does this work?](#-how-does-this-work-3f)
-   [2 What does it look like?](#what-does-it-look-like-3f)
-   [3 Further plans / What's
    missing?](#further-plans-what-s-missing-3f)
    -   [3.1 Better methods](#better-methods)
        -   [3.1.1 IDCODE](#idcode)
        -   [3.1.2 shift DR](#shift-dr)
    -   [3.2 Better software](#better-software)
    -   [3.3 Better hardware](#better-hardware)
    -   [3.4 Better firmware (AVR)](#better-firmware-avr)
-   [4 The Hardware](#the-hardware)
    -   [4.1 Explanations](#explanations)
-   [5 The Software](#the-software)
    -   [5.1 Explanations](#explanations-2)
        -   [5.1.1 Output](#output)
-   [6 If it doesn't work](#if-it-doesn-t-work)
    -   [6.1 JTAG might be disabled](#jtag-might-be-disabled)
-   [7 Comment from user of many JTAG
    tools](#comment-from-user-of-many-jtag-tools)
-   [8 Links and related projects](#links-and-related-projects)
-   [9 Contact](#contact)

## (How) Does this work?

-   The slides from my talk at [ph-neutral](http://ph-neutral.org) 0x7d6
    are [here](http://eLinux.org/images/d/d6/Jtag.pdf "Jtag.pdf")
    [odp](http://hunz.org/jtag.odp).

(hunz.org seems dead so pdf version now uploaded to elinux, enjoy)

-   It did work with
    -   my fpga board (2 chips in one test chain) from
        [http://www.fpga-dev.de](http://www.fpga-dev.de)
    -   the blackberry from the slides

-   It didn't work with
    -   a grandstream SIP phone yet (maybe some (n)TRST) problem or JTAG
        disabled
    -   some kind of D-Link VPN gateway? (didn't ask for the exact name)

## What does it look like?

-   [![](http://eLinux.org/images/thumb/9/9d/Jtagscan-gtk.png/120px-Jtagscan-gtk.png)](http://eLinux.org/File:Jtagscan-gtk.png)

    GTK GUI screenshot

-   [![](http://eLinux.org/images/thumb/c/ce/Avr-jtscan.jpg/120px-Avr-jtscan.jpg)](http://eLinux.org/File:Avr-jtscan.jpg)

    Atmel AVR based JTAG scanner

-   [![](http://eLinux.org/images/thumb/d/d7/Bberry-7290.jpg/81px-Bberry-7290.jpg)](http://eLinux.org/File:Bberry-7290.jpg)

    Closer view at the jtagscan output for a blackberry

scroll down to understand the meaning of the output

## Further plans / What's missing?

### Better methods

#### IDCODE

**One should be able to reduce the number of necessary tries to (n \*
(n-1)) + (n-2)** by reading the IDCODE from the Data Register:
 Only TCK and TMS should be necessary for this, so one can look for TDO
afterwards.
 This method is described here:
[http://www.xilinx.com/xlnx/xil\_ans\_display.jsp?iLanguageID=1&iCountryID=1&getPagePath=11857](http://www.xilinx.com/xlnx/xil_ans_display.jsp?iLanguageID=1&iCountryID=1&getPagePath=11857)
 Possible problems:

-   This doesn't work if a devices uses Bypass as default instruction,
    does it?
-   One doesn't know the IDCODE in advance, thus detecting this pattern
    it is harder.

#### shift DR

shifting DR instead of IR might be faster? This is the case when the DR
is smaller than IR.
 The IDCODE must be 32 bits long, thus the DR register is 32 bits long
if the IDCODE is loaded.
 The IR length is usually about 36bits?



### Better software

-   retry on timeout
-   live display for the status of each pin (at least while not
    scanning)
-   IO entry field (to disable single pins or assign const values to
    them)
-   (n)TRST support is missing (low active and with high active pulldown
    transistor)
-   detect hi impedance pins by looking for pins that change their state
    with pullups (100k) on/off
-   warn that hi impedance pins might be disconnected from the jtag!
-   try the Hi + hi impedance pins for TMS, TCK, TDI first and
-   the Low ones for nTRST first
-   read IDCODE?
-   assist the user in creating the relocations file (pullups on for all
    pins, user shall put cable between gnd and pin 1..30, one pin at a
    time)



### Better hardware

-   Arduino / Freeduino based hardware?
    -   Enable easy / fast deployment of the jtag finder
    -   USB connected or not (standalone) operation mode
-   1.8V support( needed for xbox 360 for example)
    -   AVR alone won't do here (except for tiny2313 but it doesn't have
        that much pins)
    -   thus I'm thinking about a cpld
    -   could use a whole gang of tiny2313's perhaps

-   The **current hardware** is just a **proof of concept**. Let's build
    something **fiddle-free**.

-   I'd like to design a **circuit board** for this - **if you want
    one** as well please add yourself to this **list**:
    -   Hunz
    -   Obsidian

-   Let's collect some **suggestions for the hardware** here as well. My
    current suggestion is:
    -   **USB powered, USB-to-Serial** interface (115200 baud)
    -   socket for an **ATMega16L or 32L**? running at **7.3728 MHz**
        (for the 115200 baud)
        -   DIL or SMD? (TODO: compare the costs)
        -   Obsidian: Wouldn't DIL make it easier for people to build
            their own boards?
    -   bootloader for **firmware updates**
    -   **floppy connector** compatible 2x17 pin header for the cable to
        the testpins
    -   **extra**
        [STK500](http://atmel.com/dyn/products/tools_card.asp?tool_id=2735)
        compatible **pinheaders** (maybe unpopulated) without the 330
        Ohm resistors for other applications
    -   costs: about 15-20 Euros

-   **PLEASE add your comments/suggestions!**
    -   are **30 IOs** enough or do you want more?
        -   Certainly sounds enough for me for the first design.
    -   the ATmega16/32 got **1/2kbyte of SRAM** - it's enough for the
        JTAG scanner but maybe you'd like to do some other things with
        the board as well?
    -   do you want **more processing power?** again it's enough for the
        JTAG scanner but one might want to do other things which need
        more processing power
    -   or would you prefer to [keep it simple,
        stupid](http://en.wikipedia.org/wiki/KISS_principle)?

### Better firmware (AVR)

-   assembler for the scanning function -\> speedup
-   TX buffer, interrupt based TX while doing sth. other
-   full duplex for uart? scan new pair while TX for old one running?
-   TX only interesting pins?
-   access the current TCK/TMS/TDI lines via RAM (ld/st) instead of IO
    (in/out) -\> no case/if needed - just add the port offset
-   better delay
-   shift TMS/TDI, read TDO support - to use it as openwince-jtag cable
-   autonomous scanning?
-   7.x MHz support

## The Hardware

### Explanations

not much to explain - had an ATmega32 lying around...



## The Software

-   the current sourcecode is here:
    [jtagscan.tar.bz2](http://eLinux.org/images/a/a1/Jtagscan.tar.bz2 "Jtagscan.tar.bz2")

### Explanations

-   there's a file named relocations.avr
    -   it maps floppy connector / cable pin number to AVR port/pin
    -   AVR port A = 0, B = 1, C = 2, D = 3
    -   each AVR port got 8 pins
    -   first line in the relocations file is pin 1, 2nd is pin 2, etc.
    -   if there's a 13 in line 5 it means: cable pin 5 = avr port 13/8
        (=1 = port B), AVR pin 13 mod 8 = pin 5

-   use pullups
    -   should be useful for nearly any device to avoid thrashing input
        lines
    -   disabling it leads to false positives

-   delay
    -   currently (1.8MHz), 0 is safe (about 100kHz)
    -   higher values will slow down the scanning process

-   shift pattern
    -   you can leave this alone

-   \# shifts
    -   often you can reduce this to speed up the scanning process
    -   number of times the 8bit-pattern is shifted into current TDI pin
    -   so the number of bits shifted is \#shifts \* 8
    -   detection fails if the value is too small - retry with a bigger
        value if necessary
    -   15 should be ok for most devices

#### Output

-   4/3/2: TDO=6:11/20 means:
    -   for TCK pin 4,
    -   TMS pin 3,
    -   TDI pin 2,
    -   pin 6 ist a TDO suspect - the pattern was shifted in 20 times in
        at pin 2 (TDI) and found 11 times at pin 6
-   more advanced: output while scanning a blackberry 7290
    -   scroll upwards and use the gallery

## If it doesn't work

-   have you tried a higher number of shifts?
-   have you tried increasing the delay?
-   have you run the scan a 2nd and a 3rd time?
-   nTRST might be pulled low - the current software doesn't yet support
    this
    -   enhance the software ;) (ask me if you need help - scroll down
        for contact)

### JTAG might be disabled

-   by removing some 0-Ohm resistors on the circuit board (look for a
    connection to the testpins at missing resistors)
-   by adding additional resistors to set pins to a constant value
    -   if you can't pullup/down a pin with 330 Ohm it's either Vcc/GND
        or disabled using this method
    -   look for a connected resistor and try removing it
-   by a burned fuse directly in the chip
    -   bad luck for mortals like us ;-(
-   by software
    -   maybe keeping the cpu in reset state might help?

## Comment from user of many JTAG tools

I think this tool can be quite dangerous when used on some JTAG ports,
if you look at [[1]](http://www.jtagtest.com/pinouts/), for example MPC
BDM port (also usable as a JTAG connection) is bad one. If the port has
only TCK/TDO/TMS/TDI/nTRST/nSRST pins, then nothing wrong \*should\*
happen, but if there are other signals, be very careful.

Also if you just try random IR/DR scans on a JTAG-enabled chip you may
destroy it. For example some CPLDs have special IR command that erases
internal flash memory, but this command requires clocking and some
termination. When run improperly it can destroy the flash.

## Links and related projects

-   [http://en.wikipedia.org/wiki/JTAG](http://en.wikipedia.org/wiki/JTAG)
-   The [jrev](http://nsa.unaligned.org/jrev.php) tool by Stanislaw
    Skowronek tries to automate the process of reverse-engineering the
    board connectivity.
-   [http://www.asset-intertech.com/products/free\_resources.htm](http://www.asset-intertech.com/products/free_resources.htm)
    - various resources
-   [http://www.openjtag.net/wiki/](http://www.openjtag.net/wiki/)
-   [Common JTAG
    Pinouts](http://eLinux.org/images/e/ea/JTAGpinouts.pdf "JTAGpinouts.pdf")

## Contact

-   **Jabber**: hunz at jabber.berlin.ccc.de
-   **silcnet** channel: c3a


