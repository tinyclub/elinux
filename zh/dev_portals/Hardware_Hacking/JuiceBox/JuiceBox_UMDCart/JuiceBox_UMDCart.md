> From: [eLinux.org](http://eLinux.org/JuiceBox_UMDCart "http://eLinux.org/JuiceBox_UMDCart")


# JuiceBox UMDCart



Project by [prpplague](http://eLinux.org/User:Prpplague "User:Prpplague")

This page is to document the creation of a Juicebox cartridge that
contains a custom bootloader, uclinux kernel, and ramdisk which can be
used with any unmodified juicebox.

after doing some initial [tests](http://eLinux.org/JuiceBox_Dev_Cart "JuiceBox Dev Cart")
with a smartmedia card, i had enough info to build a usable cartridge.

this modification is based on the [SD/MMC Cartridge, aka
MP3-kit](http://eLinux.org/JuiceBox_MMC "JuiceBox MMC")], however it also can be done
with standalone components.

first step is the open the [JuiceBox MMC](http://eLinux.org/JuiceBox_MMC "JuiceBox MMC")
cartridge are remove the pcb. after removable you will need to cut three
traces(in red) and solder across two resistors(in blue).

-   cut ground trace to R2 - Red
-   solder from R2 to R3 -Blue
-   cut pin 12 trace - Red
-   cut pin 18 trace - Red
-   clean copper from pin 1 - Yellow
-   clean ground area at top of card - Yellow second photo

[![Mmc-mod.jpg](http://eLinux.org/images/b/be/Mmc-mod.jpg)](http://eLinux.org/File:Mmc-mod.jpg)

pin 12 of the card edge normally connects to pin 2 of the sd/mmc card,
however we have cut this trace as it is used with the flash. pin 2 of
the sd/mmc will need to be connect to pin 6 of the card edge.

pin 18 of the card edge normally connects to pin 7 of the sd/mmc card,
however we have cut this trace as it is used with the flash. pin 7 of
the sd/mmc will need to be connect to pin 2 of the card edge.

these reconnections can be done by either soldering to the cut trace on
the back side or using a small wire to go around to the front. soldering
a wire to the front is easier and there is enough room along the sides
of the case for the wires.

normally the mp3 cartridge has pin 20 pulled down to ground(Vss) with a
resistor, and the juiceware carts have pin 20 pulled up to Vcc(3.3) with
a resistor. in order for the mp3 cart to now look like a juiceware cart
we need to cut the ground trace that leads to R2(see photo) and then
solder across R2 to R3. this then configures the custom cart to appear
as a juiceware cart.

since pin 1 on the pcb is so close the plastic enclosure, you'll need to
make the connection further out on the pcb, so you will need to scrap
clean some copper at the via hole just above pin 1 as noted in yellow on
the photo. the ground on the other side , pins 19 and 21 have the same
problem, so a copper area at the top of the pcb needs to be cleaned as
well( see photo below).

you will need an xD card for the next step.

[![Xdcard.jpg](http://eLinux.org/images/0/0e/Xdcard.jpg)](http://eLinux.org/File:Xdcard.jpg)


 you will need to trim the edges of the card slightly so that it will
fit inside the case. the plastic on each side is strictly for the socket
guides and can be removed with a box cutter or xacto knife. you will
need to mix up some epoxy to glue the xD card to the back side of the
pcb. the picture has red markers for alignment. the pcb has small
holes(via's), so when you glue the xD to the back let the epoxy dry a
little before application and turn the pcb on its back during drying so
that the epoxy does not go through the holes. failure to be careful with
the epoxy will cause the epoxy to go through to the sd/mmc socket and
make it unusable(doh and yes I'm speaking from experience). another
option is to desolder the sd/mmc socket before doing the epoxy but thats
only if you have the time and equipment handy.


 [![Mmc-mod1.jpg](http://eLinux.org/images/2/25/Mmc-mod1.jpg)](http://eLinux.org/File:Mmc-mod1.jpg)


 the contacts on the xD card are very close together and can be
difficult to solder to due to solder bridges. before beginning to solder
to the xD, use a box cutter or xacto knife to scrap in between the
contacts to widen the space.you will need to tin the card edge contacts
as well as the copper area that you cleaned earlier for pin 1 and for
the ground area at the top of the pcb. the Vcc line ( pin 1 on the xD
and pin 1 the card edge) needs to be soldered first as there is little
room afterwards(doh doh). i used wire from an 80 conductor IDE cable,
but tested with 40 conductor IDE cable and found that the wire was too
big.

[![Mmc-mod2.jpg](http://eLinux.org/images/6/6b/Mmc-mod2.jpg)](http://eLinux.org/File:Mmc-mod2.jpg)

<table>
<tbody>
<tr class="odd">
<td align="left">CARDEDGE</td>
<td align="left">FUNCTION</td>
<td align="left">XDPADS</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">Vcc</td>
<td align="left">1</td>
</tr>
<tr class="odd">
<td align="left">2</td>
<td align="left">MMC RX</td>
<td align="left">N/C</td>
</tr>
<tr class="even">
<td align="left">3</td>
<td align="left">DATA0</td>
<td align="left">9</td>
</tr>
<tr class="odd">
<td align="left">4</td>
<td align="left">MMC CS</td>
<td align="left">N/C</td>
</tr>
<tr class="even">
<td align="left">5</td>
<td align="left">DATA1</td>
<td align="left">8</td>
</tr>
<tr class="odd">
<td align="left">6</td>
<td align="left">MMC TX</td>
<td align="left">N/C</td>
</tr>
<tr class="even">
<td align="left">7</td>
<td align="left">DATA2</td>
<td align="left">7</td>
</tr>
<tr class="odd">
<td align="left">8</td>
<td align="left">nOE</td>
<td align="left">16</td>
</tr>
<tr class="even">
<td align="left">9</td>
<td align="left">DATA3</td>
<td align="left">6</td>
</tr>
<tr class="odd">
<td align="left">10</td>
<td align="left">nWE</td>
<td align="left">12</td>
</tr>
<tr class="even">
<td align="left">11</td>
<td align="left">DATA4</td>
<td align="left">5</td>
</tr>
<tr class="odd">
<td align="left">12</td>
<td align="left">CLE</td>
<td align="left">14</td>
</tr>
<tr class="even">
<td align="left">13</td>
<td align="left">DATA5</td>
<td align="left">4</td>
</tr>
<tr class="odd">
<td align="left">14</td>
<td align="left">ALE</td>
<td align="left">13</td>
</tr>
<tr class="even">
<td align="left">15</td>
<td align="left">DATA6</td>
<td align="left">3</td>
</tr>
<tr class="odd">
<td align="left">16</td>
<td align="left">MMC CLK</td>
<td align="left">N/C</td>
</tr>
<tr class="even">
<td align="left">17</td>
<td align="left">DATA7</td>
<td align="left">2</td>
</tr>
<tr class="odd">
<td align="left">18</td>
<td align="left">nRDY</td>
<td align="left">17</td>
</tr>
<tr class="even">
<td align="left">19</td>
<td align="left">Vss</td>
<td align="left">N/C</td>
</tr>
<tr class="odd">
<td align="left">20</td>
<td align="left">100k Pull Up</td>
<td align="left">N/C</td>
</tr>
<tr class="even">
<td align="left">21</td>
<td align="left">Vss</td>
<td align="left">N/C</td>
</tr>
<tr class="odd">
<td align="left">22</td>
<td align="left">100k Pull Up</td>
<td align="left">N/C</td>
</tr>
<tr class="even">
<td align="left">GND</td>
<td align="left">GND</td>
<td align="left">10</td>
</tr>
<tr class="odd">
<td align="left">GND</td>
<td align="left">nCE</td>
<td align="left">15</td>
</tr>
<tr class="even">
<td align="left">GND</td>
<td align="left">GND</td>
<td align="left">18</td>
</tr>
</tbody>
</table>

to program the cartridge you will need a
[JuiceBox](http://eLinux.org/JuiceBox "JuiceBox") wired for the [JTAG
Interface](http://eLinux.org/JuiceBox_JTAG "JuiceBox JTAG")] and [Serial
Console](http://eLinux.org/JuiceBox_Serial "JuiceBox Serial")]. you copy the bootloader,
kernel and ramdisk to the sd/mmc card. load the program\_flash
application into ram on the juicebox and execute it. this will copy the
bootloader, kernel and ramdisk from the sd/mmc card and copy it to the
flash. when finished, the cartridge is ready to use on any unmodified
Juicebox.

the program\_flash application is currently being cleaned up for posting
and will be GPL licensed. its based on the work of Joe Bleau with his
[JuiceBox Code Test](http://eLinux.org/JuiceBox_Code_Test "JuiceBox Code Test").


 Common Questions:

1- Is the [JuiceBox](http://eLinux.org/JuiceBox "JuiceBox") basically an SD/MMC +
smartmedia/xD combined interface?

the Juicebox has an cartridge slot that has enough address and gpio
lines to operate a sd/mmc interface and a nand flash interface. there
are two types of cartridges available(until now), one is a cartridge
with nand flash known as a juiceware cartridge. the other is a sd/mmc
adapter cartridge known as the MP3 kit. smartmedia and xD cards are
nothing more than nand flash in a removable package. all i have done is
combine the two cartridges into one that has both nand flash and the
sd/mmc interfaces.

2- Does the ROM bootloader in the [JuiceBox](http://eLinux.org/JuiceBox "JuiceBox") first
check to see if there is a XD/smartmedia cart inserted, and if so, tries
to boot from it?

technically it checks to see if a juiceware cartridge is present by
checking a gpio line. the ROM bootloader doesn't really know anything
about xD/Smartmedia its basically looking for nand flash. if the
contents of the nand flash meet certain requirements its copies the
contents to ram and jumps to that location to begin executing the
program.

3- Why is the [JuiceBox](http://eLinux.org/JuiceBox "JuiceBox") itself necessary to
prepare the boot XD? Whatever it writes to the XD sure can be done from
a PC with a standard xD/Smartmedia card reader.

unlike SD,MMC and CF cards, smartmedia and xD do not contain controller
chips to perform wear leveling, bad block management and error
detection(ECC), therefor as part of the Smartmedia and xD specifications
the device that it is connected to must do these. almost all USB-\>SM/xD
card readers have implemented these in the internal chips. what this
does is prevent you from having raw access to the nand flash, including
block 0 which is where the initial bootcode is stored. there are several
methods you could use to program the SM/xD card:

-   use a [JuiceBox](http://eLinux.org/JuiceBox "JuiceBox") to program the card since it
    already has the nand flash interface.
-   use a USB-\>SM/xD device that provides raw access. the only two
    known devices available currently are listed here -
    [http://alauda.sourceforge.net/wikka.php?wakka=SupportedDevices](http://alauda.sourceforge.net/wikka.php?wakka=SupportedDevices)
    , i've already modified the driver to program the SM/xD for use with
    the Juicebox, but as not everyone has one of these devices, i felt
    it was better to describe the process using the juicebox.
-   modify some existing hardware to do the job. the hardware i found to
    be easiest to modify for this job are products based on the EZ-USB
    chips. i've modified the flash2advance usb writer device to program
    SM/xD cards for the juicebox -
    [http://www.elinux.org/wiki/EzUsb](http://www.elinux.org/wiki/EzUsb)
-   build custom hardware. there are several schematics available on the
    net to build nand flash interfaces via the parallel port. these are
    rather cumbersome and the least desirable.

4 - I have inserted the modified cartridge into the
[JuiceBox](http://eLinux.org/JuiceBox "JuiceBox") and started it up in test mode. With a
32MB SD card in the socket and a 256MB xD card, the memory test shows no
SD card and 4 cartridges of 256MB each. Is that what I should expect
with the modification, or have I miswired something?

yes that is correct. because the sd/mmc card lines have changed and the
diagnostic program is still looking for the sd/mmc card on those lines
it will not detect them. the main point of interest in this test, is the
fact that the diagnostic program sees the NAND flash (xD/SM card). the
diagnostic program is rather intensive in its tests for the NAND flash,
so if it shows up in the diagnostic program, you probably have wired it
up properly and are ready to do some development


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [JuiceBox](http://eLinux.org/Category:JuiceBox "Category:JuiceBox")

