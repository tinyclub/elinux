> From: [eLinux.org](http://eLinux.org/Peek "http://eLinux.org/Peek")


# Peek



[![Peek.jpg](http://eLinux.org/images/a/a7/Peek.jpg)](http://eLinux.org/File:Peek.jpg)

## Contents

-   [1 The Device](#the-device)
    -   [1.1 In The News](#in-the-news)
    -   [1.2 Basic Specifications](#basic-specifications)
    -   [1.3 Discussions about the Current
        OS](#discussions-about-the-current-os)
    -   [1.4 Wireless Network and FCC
        stuff](#wireless-network-and-fcc-stuff)
    -   [1.5 Mail Handling](#mail-handling)
    -   [1.6 Chip List](#chip-list)
    -   [1.7 Battery](#battery)
    -   [1.8 Peek Accessories](#peek-accessories)
    -   [1.9 Opening the Case](#opening-the-case)
    -   [1.10 Debugging/Programming
        Tools](#debugging-programming-tools)
    -   [1.11 External MicroUSB Charge/Upgrade
        port](#external-microusb-charge-upgrade-port)
    -   [1.12 Internal UART Header](#internal-uart-header)
    -   [1.13 JTAG Pads (vias)](#jtag-pads-vias)
-   [2 uClinux](#uclinux)
    -   [2.1 Bootloader](#bootloader)
    -   [2.2 Kernel](#kernel)
    -   [2.3 Root Filesystem](#root-filesystem)
    -   [2.4 Tools](#tools)
-   [3 References](#references)
    -   [3.1 Other Peek Hacking Sites](#other-peek-hacking-sites)
    -   [3.2 Core Chipset Tools and
        Diagrams](#core-chipset-tools-and-diagrams)
    -   [3.3 Similar board bringups](#similar-board-bringups)
    -   [3.4 TI documents](#ti-documents)
    -   [3.5 Watch a Peek being
        assembled](#watch-a-peek-being-assembled)

## The Device

### In The News

-   [Company Website](http://www.getpeek.com/index2.html)
-   [Linux
    Devices](http://www.linuxfordevices.com/c/a/News/Peek-Pronto/)
-   [Geeky Peek Linux Challenge](http://www.geekypeek.com/?p=344)
-   [Amazon.com](http://www.amazon.com/Peek-Mobile-E-mail-Device-Gray/dp/B001FC0BWE/ref=sr_1_1?ie=UTF8&s=electronics&qid=1247192879&sr=1-1)
-   Peek teardown photos [Maushammer on
    Flickr](http://www.flickr.com/photos/8728129@N05/sets/72157607274454694/)
-   Discussion on irc.freenode.net channel \#edev
-   Specific discussion of Linux on the Peek on irc.freenode.net channel
    \#\#peek

### Basic Specifications

-   320x240 TFT LCD with backlight
-   47 Key QWERTY keyboard
-   360 degree jogwheel with button
-   Vibrator Motor
-   Small Speaker
-   Side Push Button
-   Top Power Button
-   Standard SIM Socket
-   Micro-B USB Charging Socket ( USB connectivity is **not** supported,
    this is really just a TTL Serial port and a charging socket.)
-   Internal Coin Backup Battery
-   E-Mail Notification LED
-   Battery Door Contacts Switch

### Discussions about the Current OS

-   It's a lightweight, purpose-built OS called PeekUX.
    [[1]](http://www.geekypeek.com/?p=13)
    -   Starts with TI's very own version of the real-time OS called
        Nucleus ( by
        [Mentor](http://www.mentor.com/products/embedded_software/nucleus_rtos/)
        )
    -   TI has compiled in device drivers, and other stacks and turned
        it into their own platform.
    -   Peek SW developers then took what TI gave them and wrap it with
        their own proprietary GUI and network libraries to create
        Peekux.
    -   The email application then runs on top of that.
    -   The whole thing is built as a single image. Thus the distinction
        between OS and App is blurred.
-   "Hacking maybe difficult" article at Peek Forums.
    [[2]](http://www.peekforums.com/viewtopic.php?f=25&t=38)

### Wireless Network and FCC stuff

-   Uses [T-Mobile's](http://www.t-mobile.com/coverage/pcc.aspx)
    nationwide GSM network.
-   Also can use AT&T's GSM network as a secondary network.
-   [FCC ID](http://www.fcc.gov/oet/ea/fccid/) is listed as: V6LPEEK0001
-   Uses the GSM850 band. TX: 824-848MHz RX: 869-893MHz
-   Maximum RF Radiated Power (GPRS850): 26dBm EIRP
-   RX Sensitivity: -109dBm ?
-   Antenna: PIFA type

### Mail Handling

-   Currently, the very large computing resources at [Amazon
    AWS](http://aws.amazon.com/what-is-aws/) (Seattle, WA) is being used
    to handle the mail polling and forwarding for the Peek users. The
    mail handler was worked out at Peek HQ and then unleashed at AWS.
    AWS's "EC2 Service" is immensely flexible and allows Peek to keep up
    with the growing user base.

### Chip List

-   [Spansion](http://www.spansion.com) 71NS128NB0BJWRN 32Mb Psram +
    128Mb NOR Flash
    [datasheet](http://spansion.com/Products/Support/Datasheets/s71ns-n_00_a9_e.pdf)
    [Additional flash
    info](http://spansion.com/Products/Support/Datasheets/s29ns-n_00_a13_e.pdf)
-   [TI](http://www.ti.com) D6591BQA -
    [TCS2310](http://focus.ti.com/general/docs/wtbu/wtbuproductcontent.tsp?templateId=6123&navigationId=12658&contentId=15407)
    - The original TI link is dead, but there's a snapshot on the
    [Internet
    Archive](http://web.archive.org/web/20090212061841/http://focus.ti.com/general/docs/wtbu/wtbuproductcontent.tsp?templateId=6123&navigationId=12774&contentId=15407)
-   [TI](http://www.ti.com) T3031FZH - TWL3031 power management and IO
    control
-   [RFMD](http://www.rfmd.com) RF7115 Quad Band GSM850/GSM900/DCS/PCS
    TRANSMIT MODULE [datasheet](http://www.rfmd.com/pdfs/7115DS.pdf)
-   [ST](http://www.st.com) STMPE2401 - Port expander with Keypad and
    PWM controller
    [Datasheet](http://www.st.com/stonline/products/literature/ds/13018/stmpe2401.pdf)
-   26.00 MHz XTAL for the TCS2310
-   32.768 kHz XTAL for the TWL3031

### Battery

-   Model: PK-BAT-001
-   Voltage: 3.7V
-   Capacity: 700mAh
-   Maximum Charge Voltage:4.2V
-   Standard: GB/T18287-2000

### Peek Accessories

-   Upgrade Cable for upgrade/hacking (No longer available).
-   Replacement Battery (No longer available).

### Opening the Case

-   The case has 4 tiny "torx" style screws. The size is T6. You will
    need a [Precision Torx Screwdriver](http://amzn.com/B000FGQ1G6) set.
-   Obviously, opening your Peek **voids the warranty**.
-   There are 3 tiny screws immediately visible when you take off
    battery cover. And the fourth screw is hidden under the red "Do not
    remove" sticker.
-   After the screws are removed, start from bottom of unit and
    carefully pry the top and bottom housings apart.
-   To understand what I mean, see this picture from [Maushammer on
    Flickr.](http://www.flickr.com/photos/8728129@N05/2855253340/sizes/l/in/set-72157607274454694/)
    On the left side of image is the bottom housing. Notice the four
    screw holes. The rest of the housing attaches with tabs that easily
    pry apart.

### Debugging/Programming Tools

-   [Micro to Mini USB
    Adapter](http://www.gsm-support.net/mini-usb----micro-usb-converter-p1298.en.html)
    (does not convert the UART to USB)
-   [Flyswatter USB JTAG Debugger](../../.././dev_portals/Hardware_Hacking/Flyswatter/Flyswatter.md "Flyswatter") for
    upgrade/hacking
-   [OpenOCD JTAG Debugger Software](http://eLinux.org/Openocd-Redux "Openocd-Redux") --
    currently doenst know anything about the LoCosto chips.
-   [UART TTL to USB
    Adapter](http://www.sparkfun.com/commerce/product_info.php?products_id=718)
    for upgrade/hacking
-   [J-Link USB JTAG/SWD
    debugger](http://iar.com/website1/1.0.1.0/369/1/) from IAR Systems.
    [User's
    Guide](http://ftp.iar.se/WWWfiles/jlink/J-Link_J-TraceARM-2.pdf)
-   Same J-Link product from [Segger
    USA](http://www.segger.com/cms/jlink.html)
-   [Cheap but decent Benchtop DC Power
    Supply](http://mouser.com/Search/ProductDetail.aspx?qs=ah0KxwAvRCGaWslNAMTDfg%3d%3d)
    from Extech Instruments. This will save you from needing to keep
    charged batteries around.

### External MicroUSB Charge/Upgrade port

This is the MicroUSB port that is exposed on the left side of the
peek.
 It's used for both charging and upgrading the Peek. The upgrade cable
uses
 a serial TTL to USB level shifter to convert the serial TTL into a USB
com port.
 a bootlog can be viewed using serial settings 115200,n,8,1

<table>
<thead>
<tr class="header">
<th align="left">Pin</th>
<th align="left">Function</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left">+5V(USB Standard)</td>
</tr>
<tr class="even">
<td align="left">2</td>
<td align="left">TXD +1.8V TTL</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left">RXD +1.8V TTL</td>
</tr>
<tr class="even">
<td align="left">4</td>
<td align="left">N/C</td>
</tr>
<tr class="odd">
<td align="left">5</td>
<td align="left">GND</td>
</tr>
<tr class="even">
<td align="left">Shield</td>
<td align="left">Drain wire</td>
</tr>
</tbody>
</table>

### Internal UART Header

This is on the inside of the Peek under the SIM (this is also covered by
the warranty sticker).
 a bootlog can be viewed using serial settings 115200,n,8,1
 **Note:** This is not a new, hidden serial port. This port is
electrically the same as the External Charger/Upgrade port shown
above.

<table>
<thead>
<tr class="header">
<th align="left">Pin</th>
<th align="left">Function</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left">Ground</td>
</tr>
<tr class="even">
<td align="left">2</td>
<td align="left">nPowerButton (active low)</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left">UART_RX +1.8V TTL (input to Peek)</td>
</tr>
<tr class="even">
<td align="left">4</td>
<td align="left">USB_PWR +5V</td>
</tr>
<tr class="odd">
<td align="left">5</td>
<td align="left">UART_TX +1.8V TTL (output from Peek)</td>
</tr>
<tr class="even">
<td align="left">6</td>
<td align="left">Bat+ 4.2V</td>
</tr>
</tbody>
</table>

[![Peek-header.jpg](http://eLinux.org/images/3/36/Peek-header.jpg)](http://eLinux.org/File:Peek-header.jpg)
 Picture from [Maushammer on
Flickr](http://www.flickr.com/photos/8728129@N05/2861989140/in/set-72157607274454694/)

### JTAG Pads (vias)

These vias are found on the bottom side of printed circuit board just
below the white antenna strip.
 **\*Note: You will need to remove the solder mask and solder small wire
to the vias. 26AWG or 30AWG is best.
** Obviously, the four signals TDO, TMS, TCK, and TDI are the most
important ones. Connect these signals straight to your JTAG dongle.
 You should also pick up a Ground signal somewhere near the DC Power
circuity on the lower left section of PCB.
 Perhaps, depending on your JTAG dongle, you could also power the Peek
from the dongle itself.  ;-)
 [![Peekjtag3.png](http://eLinux.org/images/1/10/Peekjtag3.png)](http://eLinux.org/File:Peekjtag3.png)
 Thanks to "codeman" and "prpplague" for this (these pinouts may be
wrong!).

## uClinux

### Bootloader

-   a bootloader, such as [U-Boot](../../.././dev_portals/Development_Platforms/Tegra/Mainline_SW/U-Boot/Tegra/Mainline_SW/U-Boot.md "U-Boot") or
    [APEX](http://eLinux.org/APEX "APEX"), will be needed to facilitate booting uClinux
-   low level access to Flash memory via JTAG is now doable. ( see above
    )
-   U-Boot could be used, but is pretty large
-   APEX is small, configurable, and easily adapted for ARM7TDMI

### Kernel

-   mainline kernel has the [basic support for
    ARM7TDMI](http://opensrc.sec.samsung.com/) core
-   need basic support for the TCS2310
-   [STMPE2401 keypad
    driver](http://eLinux.org/images/6/62/Stmpe2401-20090923.patch "Stmpe2401-20090923.patch")
    for linux-2.6 git (20090923) posted by Cfriedt
-   [stmpe24xx project page](http://sourceforge.net/projects/stmpe24xx)
    on SourceForge.net

### Root Filesystem

-   use [Buildroot](http://buildroot.busybox.net/) for initial testing
-   use [uClibc](http://www.uclibc.org/) as core C library
-   use [BusyBox](../../.././dev_portals/Boot_Time/BusyBox/BusyBox.md "BusyBox") as basic utilities for testing

### Tools

-   use CSST ( Cellular Systems Software Tools ) from TI for loading
    Flash with bootloader etc. This is the [Release
    Notes](http://focus.ti.com/download/wtbu/csst_sdp2430_releasenotes_v1_2.pdf)
    for the CSST included in SDP2430 (OMAP2430). There is a CSST for the
    TI LoCosto chips included with the [Peek
    Upgrader](http://drop.io/PeekFiles) software from Peek. More
    detailed info on CSST can be found
    [here.](http://wiki.davincidsp.com/index.php/CSST)

The Peek update program calls a command line CSST app to actually load
the new firmware to flash. In my case, the command line was:

     D:\apps\Peek\CSST\csstcli.exe -t 1 -op download -i D:\apps\Peek\software\Rel_01_09_10.m0 -dt NOR -p COM5

This command can be executed from a command prompt. You will be prompted
to reset the Peek (remove and replace the battery, then hit the power
button) and the download will begin!

-   use TMSH to execute commands on the Peek itself
    ([source](http://peek.jr9.org/TMSH-and-accessing-you-Peek-internal-memory-td1724226.html)):

Your Peek must remain active during the processing of each command so
you may need to move the scroll wheel or press a button intermittently
during the process to keep it on. You must also have the Peek cable and
Peek upgrade software installed on your computer before you start.

Power on Peek and connect Peek to PC using the Peek Upgrade cable.
Determine wich port the Peek is connected to. Either Check Device
Manager - Start \> Run \> devmgmt.msc OR right click My Computer \>
Properties \> Hardware Tab and Look at LPT&COMM, expand + sign and you
should see what COMM port your cable is on

Open a command prompt. If you plan on copying files to the computer you
must right click "Command prompt" and run it as an administrator even if
you are already logged on as an administrator. It should be located
under "Accessories" in the start menu.

Type in:

    cd "C:\Program Files (x86)\Peek.1.10.00\tmsh" (or whatever your Peek directory is called)

Then type:

    tmsh -psX -ttlocosto

Where X = your COMM port \# from earlier.

Here's a list of TMSH commands:

<table>
<thead>
<tr class="header">
<th align="left">Command</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">help</td>
<td align="left">Print help for the command name on stdout Arguments</td>
</tr>
<tr class="even">
<td align="left">run</td>
<td align="left">Run the script file named filename. Arguments</td>
</tr>
<tr class="odd">
<td align="left">use</td>
<td align="left">Load the ETM module represented by the DLL “name.dll” Arguments</td>
</tr>
<tr class="even">
<td align="left">ping</td>
<td align="left">ping target Arguments [options]</td>
</tr>
<tr class="odd">
<td align="left">quit</td>
<td align="left">Quit the shell</td>
</tr>
<tr class="even">
<td align="left">auw</td>
<td align="left">Write audio parameters</td>
</tr>
<tr class="odd">
<td align="left">aur</td>
<td align="left">Read audio parameters</td>
</tr>
<tr class="even">
<td align="left">aul</td>
<td align="left">Load audio parameters from FFS file</td>
</tr>
<tr class="odd">
<td align="left">aul</td>
<td align="left">Save audio parameters to FFS file</td>
</tr>
<tr class="even">
<td align="left">mkfs</td>
<td align="left">Format flash</td>
</tr>
<tr class="odd">
<td align="left">fwr</td>
<td align="left">File write from PC to target</td>
</tr>
<tr class="even">
<td align="left">frd</td>
<td align="left">File read from target to PC</td>
</tr>
<tr class="odd">
<td align="left">cd</td>
<td align="left">Change current working directory</td>
</tr>
<tr class="even">
<td align="left">mkdir</td>
<td align="left">Make a new directory</td>
</tr>
<tr class="odd">
<td align="left">rm</td>
<td align="left">Delete a file or directory</td>
</tr>
<tr class="even">
<td align="left">mv</td>
<td align="left">Move or rename a file</td>
</tr>
<tr class="odd">
<td align="left">pwd</td>
<td align="left">Print working directory</td>
</tr>
<tr class="even">
<td align="left">ls</td>
<td align="left">List files in directory</td>
</tr>
<tr class="odd">
<td align="left">cat</td>
<td align="left">View of text files</td>
</tr>
<tr class="even">
<td align="left">ln</td>
<td align="left">Make a link between files</td>
</tr>
<tr class="odd">
<td align="left">chmod</td>
<td align="left">Change files/directories permissions</td>
</tr>
<tr class="even">
<td align="left">touch</td>
<td align="left">Create an empty file</td>
</tr>
<tr class="odd">
<td align="left">df</td>
<td align="left">Show the amount of free space</td>
</tr>
<tr class="even">
<td align="left">fsq</td>
<td align="left">Query ffs parameters and values</td>
</tr>
<tr class="odd">
<td align="left">rfe</td>
<td align="left">Enable RF – transmit and receive</td>
</tr>
<tr class="even">
<td align="left">se</td>
<td align="left">Enable special customer task</td>
</tr>
<tr class="odd">
<td align="left">scw</td>
<td align="left">Setup the statistics configuration</td>
</tr>
<tr class="even">
<td align="left">scr</td>
<td align="left">Read the statistics configuration</td>
</tr>
<tr class="odd">
<td align="left">sr</td>
<td align="left">Get statistics results</td>
</tr>
<tr class="even">
<td align="left">rfpw</td>
<td align="left">Write RF parameters for receive mode</td>
</tr>
<tr class="odd">
<td align="left">rfpr</td>
<td align="left">Read RF parameters for receive mode</td>
</tr>
<tr class="even">
<td align="left">rxpw</td>
<td align="left">Write RX parameter for receive mode</td>
</tr>
<tr class="odd">
<td align="left">rxpr</td>
<td align="left">Read RX parameters for receive mode</td>
</tr>
<tr class="even">
<td align="left">txpw</td>
<td align="left">Set parameters for transmit mode</td>
</tr>
<tr class="odd">
<td align="left">txpr</td>
<td align="left">Read parameters for transmit mode</td>
</tr>
<tr class="even">
<td align="left">spw</td>
<td align="left">Write customer special parameter</td>
</tr>
<tr class="odd">
<td align="left">spr</td>
<td align="left">Read customer special parameter</td>
</tr>
<tr class="even">
<td align="left">rftw</td>
<td align="left">Write a RF table</td>
</tr>
<tr class="odd">
<td align="left">rftr</td>
<td align="left">Read a RF table</td>
</tr>
<tr class="even">
<td align="left">ttw</td>
<td align="left">Write a ramp template to transmitter</td>
</tr>
<tr class="odd">
<td align="left">ttr</td>
<td align="left">Read a ramp template from transmitter</td>
</tr>
<tr class="even">
<td align="left">stw</td>
<td align="left">Write a customer special table</td>
</tr>
<tr class="odd">
<td align="left">str</td>
<td align="left">Read a customer special table</td>
</tr>
<tr class="even">
<td align="left">mr</td>
<td align="left">Read value from memory address</td>
</tr>
<tr class="odd">
<td align="left">mw</td>
<td align="left">Write value to memory address</td>
</tr>
<tr class="even">
<td align="left">cr</td>
<td align="left">Read value from codec register</td>
</tr>
<tr class="odd">
<td align="left">cw</td>
<td align="left">Write value to codec register</td>
</tr>
<tr class="even">
<td align="left">me</td>
<td align="left">Enable miscellaneous parameter</td>
</tr>
<tr class="odd">
<td align="left">mpr</td>
<td align="left">Read miscellaneous parameter</td>
</tr>
<tr class="even">
<td align="left">mpw</td>
<td align="left">Write miscellaneous parameter</td>
</tr>
<tr class="odd">
<td align="left">vg</td>
<td align="left">Get hardware or software version</td>
</tr>
</tbody>
</table>

Email is kept in a database. Location Peek/peek.db Attachments are kept
in location Peek/Attach The attachment will be named with a string of
numbers\_filename.extension\_more numbers example
9585785\_yourpic.jpg\_552694 Pictures will be re-sized by Peek servers
before they are delivered to your Peek. As an example a picture I sent
to my Peek started at 998x1274 the picture downloaded from my Peek was
only 152x195.

## References

### Other Peek Hacking Sites

-   [The official blog started by Peek's founder to help people get
    started in hacking the Peek](http://peekhack.posterous.com/)

-   [PeekLinux.com](http://www.peeklinux.com/)

### Core Chipset Tools and Diagrams

-   [ZIP file released by Peek containing the files you
    need](http://sharing.getpeek.com/chipset.zip)

### Similar board bringups

-   [OMAP2420 with
    U-Boot](https://agora.cs.illinois.edu/display/SRG/OMAP2420+Software+Development+Platform+Bringup)

### TI documents

-   [TI Wireless Solutions
    Guide](http://focus.ti.com/pdfs/wtbu/ti_wireless_solutions_guide.pdf).
    the TCS2310 appears on Page 17.

### Watch a Peek being assembled

-   Watch Gabe Fabius and Dan Morel of PEEK, Inc. discuss the inner guts
    of the Peek [device.](http://www.geekypeek.com/?p=167)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware
    Hacking](http://eLinux.org/Category:Hardware_Hacking "Category:Hardware Hacking")

