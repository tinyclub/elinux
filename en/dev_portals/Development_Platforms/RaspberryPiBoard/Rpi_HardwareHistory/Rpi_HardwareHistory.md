> From: [eLinux.org](http://eLinux.org/Rpi_HardwareHistory "http://eLinux.org/Rpi_HardwareHistory")


# RPi HardwareHistory


(Redirected from [Rpi
HardwareHistory](http://eLinux.org/index.php?title=Rpi_HardwareHistory&redirect=no "Rpi HardwareHistory"))




<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Board_Revision_History">1 Board Revision History</a>
<ul>
<li><a href="#ECN0001">1.1 ECN0001</a>
<ul>
<li><a href="#D14_Removal">1.1.1 D14 Removal</a></li>
<li><a href="#F1_.26_F2_Replacement.2FRemoval">1.1.2 F1 &amp; F2 Replacement/Removal</a></li>
</ul></li>
<li><a href="#Model_B_Revision_2.0">1.2 Model B Revision 2.0</a></li>
<li><a href="#Colour_Variations">1.3 Colour Variations</a></li>
</ul></li>
<li><a href="#Raspberry_Pi_2_Model_B">2 Raspberry Pi 2 Model B</a></li>
<li><a href="#Raspberry_Pi_Model-B.2B_Full_Production_Board">3 Raspberry Pi Model-B+ Full Production Board</a></li>
<li><a href="#Raspberry_Pi_Compute_Module">4 Raspberry Pi Compute Module</a></li>
<li><a href="#Raspberry_Pi_Model-A_Full_Production_Board">5 Raspberry Pi Model-A Full Production Board</a></li>
<li><a href="#Raspberry_Pi_Model-B_Full_Production_Board">6 Raspberry Pi Model-B Full Production Board</a></li>
<li><a href="#Raspberry_Pi_1st_Production_Board">7 Raspberry Pi 1st Production Board</a></li>
<li><a href="#Raspberry_Pi_Beta_Production_Board">8 Raspberry Pi Beta Production Board</a>
<ul>
<li><a href="#eBay_Auction">8.1 eBay Auction</a></li>
</ul></li>
<li><a href="#Raspberry_Pi_Alpha_Board">9 Raspberry Pi Alpha Board</a></li>
<li><a href="#Raspberry_Pi_USB_Prototype_Board">10 Raspberry Pi USB Prototype Board</a></li>
<li><a href="#Raspberry_Pi_Concept_2006_edition">11 Raspberry Pi Concept 2006 edition</a></li>
<li><a href="#See_Also">12 See Also</a>
<ul>
<li><a href="#Video">12.1 Video</a></li>
<li><a href="#Audio">12.2 Audio</a></li>
</ul></li>
<li><a href="#References">13 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Hardware & Peripherals:**

*[Hardware](http://eLinux.org/RPi_Hardware "RPi Hardware") and **Hardware History**.*

*[Low-level
Peripherals](http://eLinux.org/RPi_Low-level_peripherals "RPi Low-level peripherals") and
[Expansion Boards](http://eLinux.org/RPi_Expansion_Boards "RPi Expansion Boards").*

*[Screens](http://eLinux.org/RPi_Screens "RPi Screens"), [Cases](http://eLinux.org/RPi_Cases "RPi Cases")
and [Other
Peripherals](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals").*

## Board Revision History

Find out your board revision with the following command:

    cat /proc/cpuinfo

You will see your device data including:

     Hardware  : BCM2708
     Revision   : 0003

If you see a "1000" at the front of the Revision, e.g. 10000002 then it
indicates<sup>[[1]](#cite_note-1)</sup> that your Raspberry Pi has been
[over-volted](http://eLinux.org/RPiconfig#Overclocking "RPiconfig"), and your board
revision is simply the last 4 digits (i.e. 0002 in this example).



<table>
<thead>
<tr class="header">
<th align="left">Revision</th>
<th align="left">Release Date</th>
<th align="left">Model</th>
<th align="left">PCB Revision</th>
<th align="left">Memory</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Beta</td>
<td align="left">Q1 2012</td>
<td align="left">B (Beta)</td>
<td align="left"> ?</td>
<td align="left">256MB</td>
<td align="left">Beta Board</td>
</tr>
<tr class="even">
<td align="left">0002</td>
<td align="left">Q1 2012</td>
<td align="left">B</td>
<td align="left">1.0</td>
<td align="left">256MB</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">0003</td>
<td align="left">Q3 2012</td>
<td align="left">B (ECN0001)</td>
<td align="left">1.0</td>
<td align="left">256MB</td>
<td align="left">Fuses mod and D14 removed</td>
</tr>
<tr class="even">
<td align="left">0004</td>
<td align="left">Q3 2012</td>
<td align="left">B</td>
<td align="left">2.0</td>
<td align="left">256MB</td>
<td align="left">(Mfg by Sony)</td>
</tr>
<tr class="odd">
<td align="left">0005</td>
<td align="left">Q4 2012</td>
<td align="left">B</td>
<td align="left">2.0</td>
<td align="left">256MB</td>
<td align="left">(Mfg by Qisda)</td>
</tr>
<tr class="even">
<td align="left">0006</td>
<td align="left">Q4 2012</td>
<td align="left">B</td>
<td align="left">2.0</td>
<td align="left">256MB</td>
<td align="left">(Mfg by Egoman)</td>
</tr>
<tr class="odd">
<td align="left">0007</td>
<td align="left">Q1 2013</td>
<td align="left">A</td>
<td align="left">2.0</td>
<td align="left">256MB</td>
<td align="left">(Mfg by Egoman)</td>
</tr>
<tr class="even">
<td align="left">0008</td>
<td align="left">Q1 2013</td>
<td align="left">A</td>
<td align="left">2.0</td>
<td align="left">256MB</td>
<td align="left">(Mfg by Sony)</td>
</tr>
<tr class="odd">
<td align="left">0009</td>
<td align="left">Q1 2013</td>
<td align="left">A</td>
<td align="left">2.0</td>
<td align="left">256MB</td>
<td align="left">(Mfg by Qisda)</td>
</tr>
<tr class="even">
<td align="left">000d</td>
<td align="left">Q4 2012</td>
<td align="left">B</td>
<td align="left">2.0</td>
<td align="left">512MB</td>
<td align="left">(Mfg by Egoman)</td>
</tr>
<tr class="odd">
<td align="left">000e</td>
<td align="left">Q4 2012</td>
<td align="left">B</td>
<td align="left">2.0</td>
<td align="left">512MB</td>
<td align="left">(Mfg by Sony)</td>
</tr>
<tr class="even">
<td align="left">000f</td>
<td align="left">Q4 2012</td>
<td align="left">B</td>
<td align="left">2.0</td>
<td align="left">512MB</td>
<td align="left">(Mfg by Qisda)</td>
</tr>
<tr class="odd">
<td align="left">0010</td>
<td align="left">Q3 2014</td>
<td align="left">B+</td>
<td align="left">1.0</td>
<td align="left">512MB</td>
<td align="left">(Mfg by Sony)</td>
</tr>
<tr class="even">
<td align="left">0011</td>
<td align="left">Q2 2014</td>
<td align="left">Compute Module</td>
<td align="left">1.0</td>
<td align="left">512MB</td>
<td align="left">(Mfg by Sony)</td>
</tr>
<tr class="odd">
<td align="left">0012</td>
<td align="left">Q4 2014</td>
<td align="left">A+</td>
<td align="left">1.0</td>
<td align="left">256MB</td>
<td align="left">(Mfg by Sony)</td>
</tr>
<tr class="even">
<td align="left">a21041</td>
<td align="left">Q1 2015</td>
<td align="left">2 Model B</td>
<td align="left">1.1</td>
<td align="left">1GB</td>
<td align="left">(Mfg by Embest, China)</td>
</tr>
</tbody>
</table>

### ECN0001

ECN0001 is the request to not fit D14 and replace F1 and F2 with 0 ohm.

#### D14 Removal

D14 can interfere with some CEC devices if the Pi is left plugged in and
unpowered. The benefits of having it are minimal so it was
removed.<sup>[[2]](#cite_note-D14-2)</sup>

#### F1 & F2 Replacement/Removal

F1 & F2 can cause problems with some USB devices which draw high
current. In particular due to the recovery characteristics of the
Poly-fuses, it can take a while to recover their low resistance state
afterwards, adding additional problems for other devices (lower voltage
on the USB bus).

### Model B Revision 2.0

Based on a new PCB layout that includes previous build fixes from
ECN0001 such us removal of the poly-fuses in series with the +5V power
for USB devices, and other fixes reported by the community such as the
erroneous connection of the LAN9512 VDD18CORE pins to the +1V8 power
plane, addition of the 8-pin P5 header (non-populated) for extra GPIO
pins, addition to the 2-pin P6 header (non-populated) for a RESET
button, and other changes and improvements reported in more detail
<sup>[[3]](#cite_note-REV2.0-3)</sup>.

### Colour Variations

[![](http://eLinux.org/images/thumb/b/b7/RedPi.jpg/250px-RedPi.jpg)](http://eLinux.org/File:RedPi.jpg)

[](http://eLinux.org/File:RedPi.jpg "Enlarge")

A Chinese (Non-FCC) RPi variant full production board (Model B Rev 2.0)

The vast majority of the Raspberry Pis produced have a **Green** PCB,
but Pis produced by
[Egoman\_Technology\_Corp](http://eLinux.org/RPi_Buying_Guide#Egoman_Technology_Corp "RPi Buying Guide")
(only available in the Far East) have a
**Red**<sup>[[4]](#cite_note-4)</sup> PCB, and RS Components produced a
limited edition of anniversary Pis in
**Blue**<sup>[[5]](#cite_note-5)</sup>.

## Raspberry Pi 2 Model B

[![](http://eLinux.org/images/thumb/7/79/Raspberry_Pi_2_Model_B.jpg/250px-Raspberry_Pi_2_Model_B.jpg)](http://eLinux.org/File:Raspberry_Pi_2_Model_B.jpg)

[](http://eLinux.org/File:Raspberry_Pi_2_Model_B.jpg "Enlarge")

Raspberry Pi 2 Model B

Announced on 2nd Feb 2015 [Full announcement from the Raspberry Pi
Foundation](http://www.raspberrypi.org/raspberry-pi-2-on-sale/).

The Raspberry Pi 2 features a Broadcom BCM2836 SoC, with a quad-core ARM
Cortex-A7 CPU and a VideoCore IV dual-core GPU; 1 GB of RAM with
remaining specifications being similar to those of the previous
generation model B+. The Raspberry Pi 2 retains the same US\$35 price
point of the model B+.

## Raspberry Pi Model-B+ Full Production Board

[![](http://eLinux.org/images/thumb/9/94/Raspi-bplus.jpg/250px-Raspi-bplus.jpg)](http://eLinux.org/File:Raspi-bplus.jpg)

[](http://eLinux.org/File:Raspi-bplus.jpg "Enlarge")

The RPi full production board (Model B+)

Announced on 14th July 2014 [Full announcement from the Raspberry Pi
Foundation](http://www.raspberrypi.org/introducing-raspberry-pi-model-b-plus/)

## Raspberry Pi Compute Module

[![](http://eLinux.org/images/thumb/8/83/Compute-module.png/250px-Compute-module.png)](http://eLinux.org/File:Compute-module.png)

[](http://eLinux.org/File:Compute-module.png "Enlarge")

The RPi compute module

Announced on 7th Apr 2014 [Full announcement from the Raspberry Pi
Foundation](http://www.raspberrypi.org/raspberry-pi-compute-module-new-product/)

The compute module contains the guts of a Raspberry Pi (the BCM2835
processor and 512Mbyte of RAM) as well as a 4Gbyte eMMC Flash device.

This is integrated on to a small 67.6x30mm board which fits into a
standard DDR2 SODIMM connector

## Raspberry Pi Model-A Full Production Board

-   As of Feb 2013, available from distributors in Europe but not North
    America
-   Board has 256Mb of RAM rather than the originally planned
    128Mb<sup>[[6]](#cite_note-postSale-6)</sup>
-   The Foundation produced a small Beta batch before handing
    manufacturing over to RS and Farnell
-   The ModelA boards actually use the identical Revision2.0 PCB as
    ModelB boards, just with a different selection of components fitted
    (full details available from the
    [schematics](http://eLinux.org/RPi_Hardware#Schematic_.2F_Layout "RPi Hardware")).
    AFAIK no ModelA boards using the Revision1.0 PCBs were ever publicly
    available (or indeed ever made?).

## Raspberry Pi Model-B Full Production Board

[![](http://eLinux.org/images/thumb/f/f4/RaspiFront.JPG/250px-RaspiFront.JPG)](http://eLinux.org/File:RaspiFront.JPG)

[](http://eLinux.org/File:RaspiFront.JPG "Enlarge")

The RPi full production board (Model B Rev 2.0)

-   Announced: April 2012, first orders sent out June 2012.
-   Manufacturing and Orders will be made through RS and Farnell
-   This means a much higher volume of units will be produced and made
    available.
-   Additional detail is available about the manufacturing and
    distribution agreement here [video interview between Eben Upton and
    SlashDot here
    (28/02/12)](http://hardware.slashdot.org/story/12/02/28/2347222/raspberry-pi-now-has-distributors----and-will-soon-have-boards-for-all-video).
-   Announced: September 2012, Raspberry Pi Model B Rev 2.0 is now
    manufactured at Sony's manufacturing plant on Pencoed, South Wales.
    [Full announcement from the Raspberry Pi
    Foundation](http://www.raspberrypi.org/archives/1925), [Element14
    announcement on Raspberry Pi discussion
    board](http://www.element14.com/community/thread/19738?tstart=0).

## Raspberry Pi 1st Production Board

-   Announced: 29th Feb 2012 - Start of Sale
    Only<sup>[[6]](#cite_note-postSale-6)</sup>
-   Credit-card Format
-   Initial 10k Batch (All Model-B's) Manufactured in China (Jan/Feb
    2012)<sup>[[7]](#cite_note-firstProduction-7)</sup>
-   Should look identical to the Raspberry Pi Beta Board below (except
    different SDCard holder).
-   The board has a yellow RCA connector, rather than the black one used
    in the Beta's.
-   Nokia/Qt Development group has donated vouchers for 400 RPi units
    for developers<sup>[[8]](#cite_note-nokiaDonate-8)</sup>
-   The batch was delayed several weeks due to the RJ45 network
    connector being substituted for the wrong
    part<sup>[[9]](#cite_note-9)</sup> and also so the board could
    undergo compliance testing<sup>[[10]](#cite_note-10)</sup>

## Raspberry Pi Beta Production Board

-   Announced: December 2011<sup>[[11]](#cite_note-.23Beta-11)</sup>
-   Credit-Card Format
-   Manufactured in UK
-   Produced 100<sup>[[12]](#cite_note-betapcb-12)</sup> PCBs
-   Characteristic feature of hand-modded correction to PCB
    <sup>[[13]](#cite_note-betaError-13)</sup>
-   See the [blog post](http://www.raspberrypi.org/archives/482) which
    includes a video explaining how the production units will differ
    from the beta boards.



-   [Pre-production board (beta board) PCB,
    topside](http://www.raspberrypi.org/wp-content/uploads/2011/12/Picture-002-copy2-e1322775411416.jpg)
-   [Pre-production board (beta board) PCB,
    underside](http://www.raspberrypi.org/wp-content/uploads/2011/12/Picture-003-copy2.jpg)
-   [Pre-production board vs
    credit-card](http://www.raspberrypi.org/wp-content/uploads/2011/12/Picture-001-copy.jpg)



### eBay Auction

10 of the completed Model-B boards were auctioned on eBay (Started on
1st Jan 2012) <sup>[[14]](#cite_note-betaebay-14)</sup>)

<table>
<tbody>
<tr class="odd">
<td align="left">SerialNo:</td>
<td align="left">#1</td>
<td align="left">#2</td>
<td align="left">#3</td>
<td align="left">#4</td>
<td align="left">#5</td>
<td align="left">#6</td>
<td align="left">#7<sup><a href="#cite_note-.237Donated-15">[15]</a></sup></td>
<td align="left">#8<sup><a href="#cite_note-.238PaulMaunders-16">[16]</a></sup></td>
<td align="left">#9</td>
<td align="left">#10</td>
</tr>
<tr class="even">
<td align="left">Date:</td>
<td align="left">11-Jan-2012</td>
<td align="left">11-Jan-2012</td>
<td align="left">10-Jan-2012</td>
<td align="left">10-Jan-2012</td>
<td align="left">09-Jan-2012</td>
<td align="left">09-Jan-2012</td>
<td align="left">08-Jan-2012</td>
<td align="left">08-Jan-2012</td>
<td align="left">07-Jan-2012</td>
<td align="left">07-Jan-2012</td>
</tr>
<tr class="odd">
<td align="left">Sold For:</td>
<td align="left">£3,500</td>
<td align="left">£2,150</td>
<td align="left">£2,257</td>
<td align="left">£1,550</td>
<td align="left">£1,040</td>
<td align="left">£1,000</td>
<td align="left">£989</td>
<td align="left">£1,020</td>
<td align="left">£930</td>
<td align="left">£1,900</td>
</tr>
</tbody>
</table>

Board \#7 was anonymously (and generously) donated to [Centre for
Computing
History](http://www.computinghistory.org.uk/)<sup>[[15]](#cite_note-.237Donated-15)</sup>
(also spotted [here..](http://twitpic.com/86trra))!

Board \#8 Owned by Tech Blogger, Paul Maunders, see his
[blog](http://www.pyrosoft.co.uk/blog) for
details<sup>[[16]](#cite_note-.238PaulMaunders-16)</sup>

## Raspberry Pi Alpha Board

[![](http://eLinux.org/images/thumb/6/65/RPi-alpha.jpg/250px-RPi-alpha.jpg)](http://eLinux.org/File:RPi-alpha.jpg)

[](http://eLinux.org/File:RPi-alpha.jpg "Enlarge")

RPi Alpha Board

-   Announced: August 2011<sup>[[17]](#cite_note-.23Alpha-17)</sup>
-   Large Format for debugging (Model-B)
-   Populated with headers for GPIO, JTAG, DSI, CSI, as well as switches
    and LEDs for I/O testing.



-   [Alpha prototype board,
    underside](http://www.raspberrypi.org/wp-content/uploads/2011/08/DSCF1809.jpg)

## Raspberry Pi USB Prototype Board

[![](http://eLinux.org/images/thumb/0/0e/Rpi-usbproto.jpg/250px-Rpi-usbproto.jpg)](http://eLinux.org/File:Rpi-usbproto.jpg)

[](http://eLinux.org/File:Rpi-usbproto.jpg "Enlarge")

RPi USB Prototype Board

-   Announced: May 2011
-   The "Computer On A USB Stick" Format
-   Included built-in camera
-   HDMI one end and single USB the other
-   Introduced the RPi Foundation to the world (any earlier links
    appreciated), featured by [BBC Online
    Video](http://www.bbc.co.uk/news/technology-13292450).
-   Known internally at Broadcom as the **MicroDB**
    <sup>[[18]](#cite_note-18)</sup> <sup>[[19]](#cite_note-19)</sup>


 ‎

## Raspberry Pi Concept 2006 edition

[![](http://eLinux.org/images/thumb/2/25/RPi-atmel2006Ed.jpg/250px-RPi-atmel2006Ed.jpg)](http://eLinux.org/File:RPi-atmel2006Ed.jpg)

[](http://eLinux.org/File:RPi-atmel2006Ed.jpg "Enlarge")

Raspberry Pi Concept 2006 edition

-   Vero-board Prototype & PCB Version
-   Atmel ATmega644 microcontroller clocked at
    22.1MHz<sup>[[20]](#cite_note-2006ed-20)</sup>

## See Also

### Video

-   [BBC iClick's Peter Price asks whether a £15 computer can solve the
    programming
    gap](http://news.bbc.co.uk/1/hi/programmes/click_online/9504208.stm)
    (6 minutes, 3 June 2011)
-   [Raspberry Pi's David Braben talks to BBC's Rory
    Cellan-Jones](http://www.youtube.com/watch?v=pQ7N4rycsy4) (2:28
    minutes, 5 May 2011)
-   [Raspberry Pi community tutorials on
    YouTube](http://www.youtube.com/RaspberryPiTutorials)

### Audio

-   [Podcast of a phone interview with Eben about the project and the
    motivations behind
    it](http://foundationlibraries.blogspot.com/2011/06/cfl-podcast-eben-upton-raspberry-pi.html)
    (15 minutes long.) (3 June 2011) Transcription
    [here](http://tomhannen.posterous.com/raspberry-pi-podcast-transcript).

## References

1.  [↑](#cite_ref-1)
    [http://www.raspberrypi.org/phpBB3/viewtopic.php?f=32&t=18133\#p181069](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=32&t=18133#p181069)
2.  [↑](#cite_ref-D14_2-0) [New Pi missing
    D14](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=63&t=16365)
3.  [↑](#cite_ref-REV2.0_3-0) [Upcoming Board
    Revision](http://www.raspberrypi.org/archives/1929)
4.  [↑](#cite_ref-4)
    [http://www.raspberrypi.org/archives/3195](http://www.raspberrypi.org/archives/3195)
5.  [↑](#cite_ref-5)
    [http://www.raspberrypi.org/archives/3422](http://www.raspberrypi.org/archives/3422)
6.  ↑ <sup>[6.0](#cite_ref-postSale_6-0)</sup>
    <sup>[6.1](#cite_ref-postSale_6-1)</sup> [Post-Launch - And
    breathe…](http://www.raspberrypi.org/archives/723)
7.  [↑](#cite_ref-firstProduction_7-0) [We’ve started
    manufacture!](http://www.raspberrypi.org/archives/509)
8.  [↑](#cite_ref-nokiaDonate_8-0) [Nokia has Raspberry Pi vouchers for
    400 Qt developers](http://www.raspberrypi.org/archives/369)
9.  [↑](#cite_ref-9) [Manufacturing
    Hiccup](http://www.raspberrypi.org/archives/781)
10. [↑](#cite_ref-10) [Compliance
    testing](http://www.raspberrypi.org/archives/852)
11. [↑](#cite_ref-.23Beta_11-0) [Populated boards: an update on where we
    are](http://www.raspberrypi.org/archives/422)
12. [↑](#cite_ref-betapcb_12-0) [We have PCBs!
    BETA](http://www.raspberrypi.org/archives/389)
13. [↑](#cite_ref-betaError_13-0) [(hand-mod) More on the beta
    boards](http://www.raspberrypi.org/archives/470)
14. [↑](#cite_ref-betaebay_14-0) [We’re auctioning ten beta Raspberry
    Pis!](http://www.raspberrypi.org/archives/482)
15. ↑ <sup>[15.0](#cite_ref-.237Donated_15-0)</sup>
    <sup>[15.1](#cite_ref-.237Donated_15-1)</sup> [Beta board bought by
    anonymous bidder and donated to
    museum](http://www.raspberrypi.org/archives/503)
16. ↑ <sup>[16.0](#cite_ref-.238PaulMaunders_16-0)</sup>
    <sup>[16.1](#cite_ref-.238PaulMaunders_16-1)</sup> [Paul Maunders -
    Raspberry Pi \#8 First
    Photoshoot](http://www.pyrosoft.co.uk/blog/2012/01/13/raspberry-pi-8-first-photoshoot/)
17. [↑](#cite_ref-.23Alpha_17-0) [The alpha boards are
    here!](http://www.raspberrypi.org/archives/78)
18. [↑](#cite_ref-18)
    [http://www.raspberrypi.org/archives/3375](http://www.raspberrypi.org/archives/3375)
19. [↑](#cite_ref-19)
    [http://www.raspberrypi.org/archives/3376](http://www.raspberrypi.org/archives/3376)
20. [↑](#cite_ref-2006ed_20-0) [Raspberry Pi – 2006
    edition](http://www.raspberrypi.org/archives/264)



-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

[Raspberry Pi](http://eLinux.org/R-Pi_Hub "R-Pi Hub")

**Startup**

[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - [SD Card
Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") - [Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") - [Advanced
Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") - [Beginners
Guide](http://eLinux.org/RPi_Beginners "RPi Beginners") -
[Troubleshooting](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting")

[![RpiFront.jpg](http://eLinux.org/images/thumb/9/96/RpiFront.jpg/167px-RpiFront.jpg)](http://eLinux.org/File:RpiFront.jpg)

**Hardware**

[Hardware](http://eLinux.org/RPi_Hardware "RPi Hardware") - **Hardware History** -
[Low-level
peripherals](http://eLinux.org/RPi_Low-level_peripherals "RPi Low-level peripherals") -
[Expansion Boards](http://eLinux.org/RPi_Expansion_Boards "RPi Expansion Boards")

**Peripherals**

[Screens](http://eLinux.org/RPi_Screens "RPi Screens") - [Cases](http://eLinux.org/RPi_Cases "RPi Cases")
- [Other Peripherals (Keyboard, mouse, hub,
wifi...)](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals")

**Software**

[Software](http://eLinux.org/RPi_Software "RPi Software") -
[Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") -
[Kernel](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation") -
[Performance](http://eLinux.org/RPi_Performance "RPi Performance") -
[Programming](http://eLinux.org/RPi_Programming "RPi Programming") - [VideoCore
APIs](http://eLinux.org/RPi_VideoCore_APIs "RPi VideoCore APIs") -
[Utilities](http://eLinux.org/RPi_Utilities "RPi Utilities")

**Projects**

[Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") -
[Guides](http://eLinux.org/RPi_Guides "RPi Guides") -
[Projects](http://eLinux.org/RPi_Projects "RPi Projects") -
[Tasks](http://eLinux.org/RPi_Tasks "RPi Tasks") -
[DataSheets](http://eLinux.org/RPi_DatasheetCategories "RPi DatasheetCategories") -
[Education](http://eLinux.org/RPi_Education "RPi Education") -
[Communities](http://eLinux.org/RPi_Community "RPi Community")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")

