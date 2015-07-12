> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_TV_Out "http://eLinux.org/LeapFrog_Pollux_Platform:_TV_Out")


# LeapFrog Pollux Platform: TV Out



[![DidjTVOutPlasma.JPG](http://eLinux.org/images/thumb/e/e7/DidjTVOutPlasma.JPG/350px-DidjTVOutPlasma.JPG)](http://eLinux.org/File:DidjTVOutPlasma.JPG)

[](http://eLinux.org/File:DidjTVOutPlasma.JPG "Enlarge")

## Contents

-   [1 Introduction](#introduction)
-   [2 Requirements](#requirements)
-   [3 Didj Hardware Setup](#didj-hardware-setup)
-   [4 Leapster Explorer Hardware
    Setup](#leapster-explorer-hardware-setup)
-   [5 Filter Circuit](#filter-circuit)
-   [6 Didj Software Setup](#didj-software-setup)
-   [7 Leapster Explorer Software
    Setup](#leapster-explorer-software-setup)
-   [8 To-dos](#to-dos)

## Introduction

This how-to outlines the basic steps to enabling your LeapFrog Pollux
Platform device to send a composite video signal to your television.



## Requirements

-   A Didj or Leapster Explorer you are willing to disassemble and
    solder parts to.
-   [Toolchain and Build
    Environment](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#Toolchains "LeapFrog Pollux Platform: Source Code")
-   [[LeapFrog\_Pollux\_Platform:\_Cartridge| Custom Cartridge] for UART
    boot or SD Card boot.
-   Breadboard or protoboard
-   75 Ohm resistor
-   220pF capacitor (may be optional. this has been known to work with
    just the 75 Ohm resistor)
-   Composite jacks and or plugs



## Didj Hardware Setup

The [LF1000 Processor](http://eLinux.org/Pollux "Pollux") contains a current-driven
digital-to-analog converter that can drive an external screen via CVBS
(composite video).

On the LeapFrog Pollux Platform, the DAC connection is exposed via Test
Pad 6 (TP6) which can be found on the CPU side of the board.



[![Bga-closeup.jpg](http://eLinux.org/images/thumb/5/51/Bga-closeup.jpg/350px-Bga-closeup.jpg)](http://eLinux.org/File:Bga-closeup.jpg)


 To access TP6, you will need to remove the Didj main-board from the
case. You may also find it more comfortable to work on TP6 with the LCD
panel ribbon cable disconnected (its delicate, so be gentle as you
release the ribbon cable)


 [![Didj Mainboard
Front.jpg](http://eLinux.org/images/thumb/d/db/Didj_Mainboard_Front.jpg/350px-Didj_Mainboard_Front.jpg)](http://eLinux.org/File:Didj_Mainboard_Front.jpg)


 Solder a strand of Kynar, or an IDE strand, or similar small-gauge wire
to TP6. (Make sure the wire is long enough to exit the case where
desired.)



[![SolderingToTP6.jpg](http://eLinux.org/images/thumb/a/ae/SolderingToTP6.jpg/350px-SolderingToTP6.jpg)](http://eLinux.org/File:SolderingToTP6.jpg)


 Solder another strand of wire to ground. (ex: The metal on the
cartridge socket is grounded.) (Make sure the wire is long enough to
exit the case where desired)


 Solder the end of the wire connected to TP6 to the middle pin of an RCA
plug


 Solder the end of the wire connected to GND to the outer ring of the
RCA plug


 Reassemble your Didj, routing the additional wires appropriately.



## Leapster Explorer Hardware Setup

The [LF1000 Processor](http://eLinux.org/Pollux "Pollux") contains a current-driven
digital-to-analog converter that can drive an external screen via CVBS
(composite video).

On the Leapster Explorer, the DAC connection is exposed via Test Pad
30-Right (the pad to the right of the label marked TP30) which can be
found on the CPU side of the board.



[![LX-TVout-Trace.jpg](http://eLinux.org/images/thumb/4/49/LX-TVout-Trace.jpg/350px-LX-TVout-Trace.jpg)](http://eLinux.org/File:LX-TVout-Trace.jpg)

To access TP30, you will need to remove the LX main-board from the case.
You may also find it more comfortable to work on TP30 with the LCD panel
ribbon cable disconnected (its delicate, so be gentle as you release the
ribbon cable)


 [![Leapster
Explorer-Mainboard-front.jpg](http://eLinux.org/images/thumb/0/07/Leapster_Explorer-Mainboard-front.jpg/350px-Leapster_Explorer-Mainboard-front.jpg)](http://eLinux.org/File:Leapster_Explorer-Mainboard-front.jpg)


 Solder a strand of Kynar, or an IDE strand, or similar small-gauge wire
to TP30R. (Make sure the wire is long enough to exit the case where
desired.)


 Solder another strand of wire to ground. (ex: The metal on the
cartridge socket is grounded.) (Make sure the wire is long enough to
exit the case where desired)


 Solder the end of the wire connected to TP30 to the middle pin of an
RCA plug


 Solder the end of the wire connected to GND to the outer ring of the
RCA plug


 Reassemble your LX, routing the additional wires appropriately.



## Filter Circuit

Build the filter circuit as follows:

(Note the capacitor may be optional. This hack has been known to work
with just the 75 Ohm resistor)

[![DidjTVOutSchematic.png](http://eLinux.org/images/3/3f/DidjTVOutSchematic.png)](http://eLinux.org/File:DidjTVOutSchematic.png)


 **Connecting**

Connect the side of the circuit with the resistor to the Didj or LX, and
the other side to your TV's Composite input jack.



## Didj Software Setup

The LF Kernel sources already contains all the code necessary to enable
you to connect your Didj to a TV via a Composite Video (RCA-style)
connection.


 To enable this capability, you must first have a kernel cross
compilation environment set up (see Requirements).


 The adjustment itself is simple. If you have just set up your kernel
compilation environment and are compiling for the first time, set up
your kernel by running make menuconfig. This generates a file called
.config .


 Edit .config and toggle (or if its not present, add) the
CONFIG\_LF1000\_DPC\_DUAL\_DISPLAY directive as follows:

    CONFIG_LF1000_DPC_DUAL_DISPLAY=y

Make any other adjustments you want and then build your kernel.

Take the resulting zImage and load it onto the Didj using Uart boot (or
if toy have LB1.4 set up, an SD card)

-   [Boot Didj from UART Connection -
    Linux](http://eLinux.org/Didj_UART_Boot_with_Linux_Host "Didj UART Boot with Linux Host")
-   [Boot Didj from UART Connection -
    Windows](http://eLinux.org/Didj_Boot_From_UART "Didj Boot From UART")

Thats it! Shortly after rebooting, you should see an image on both the
LCD and your TV.

(Note: This has been tested with a NTSC television. It is likely that
some driver reconfiguration may be necessary to enable PAL.)



## Leapster Explorer Software Setup

The Software setup for LX is a bit more involved. The code that
activates tv-out seems to be toggled based on a GPIO, so it may not be
as simple as setting a compile flag as mentioned above. Instead, the
fbdev driver mentioned
[here](http://eLinux.org/Leapster_Explorer_Framebuffer_Driver "Leapster Explorer Framebuffer Driver")
is set up to support TV-out mode using the same configuration directive
as is used for Didj.

Edit .config and toggle (or if its not present, add) the
CONFIG\_LF1000\_DPC\_DUAL\_DISPLAY directive as follows:

    CONFIG_LF1000_DPC_DUAL_DISPLAY=y

Make any other adjustments you want and then build your kernel. Take the
resulting zImage, make a cbf file, and load it onto the LX using [USB
boot](http://eLinux.org/Leapster_Explorer:_Testing_Kernels_via_USB_Boot "Leapster Explorer: Testing Kernels via USB Boot").

Thats it! Shortly after rebooting, you should see an image on both the
LCD and your TV.

(Note: This has been tested with a NTSC television. It is likely that
some driver reconfiguration may be necessary to enable PAL.)



## To-dos

-   Add user-space dual-screen support.
-   Add user-space external screen control.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

