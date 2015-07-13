> From: [eLinux.org](http://eLinux.org/Hammer_Board "http://eLinux.org/Hammer_Board")


# Hammer Board



## Contents

-   [1 Hammer Board Specifications](#hammer-board-specifications)
-   [2 Interface Options](#interface-options)
-   [3 Resources](#resources)
-   [4 Hammer Details](#hammer-details)
-   [5 Hammer Board Pinouts](#hammer-board-pinouts)
-   [6 Related Products](#related-products)
-   [7 Hammer Project pages](#hammer-project-pages)

## Hammer Board Specifications

[![Hammer4.jpg](http://eLinux.org/images/c/c6/Hammer4.jpg)](http://eLinux.org/File:Hammer4.jpg)

[TinCanTools Website](http://www.tincantools.com)

The Hammer CPU board from [TinCanTools](http://www.tincantools.com),is
based upon Samsung’s [S3C2410](../../.././dev_portals/Development_Platforms/S3C2410/S3C2410.md "S3C2410") ARM920T processor. It
gives you the power of an ARM9 processor in an easy to use modular
package. The Hammer CPU board fits into a standard 40 pin DIP socket. It
is an ideal platform for code development and prototyping in an embedded
environment. You can quickly interface to the Hammer using your standard
prototyping tools that are based upon 0.1 inch centers.

       * 100 MIPS Microprocessor ( CPU ): S3C2410 - Samsung (200 MHz)
       * ARM 920T core with Cache (16K+16K) and MMU
       * Main Memory: 32MB SDRAM (16M x 16 bit, 100MHz)
       * FLASH : 16MB NOR Flash
       * Peripherals available:
             o 2 UART’s (also supports IrDA)
             o 1 I2C
             o 2 SPI’s
             o 2 16-bit Timers/PWM’s
             o 1 8-bit LCD Interface + control signals
             o 1 USB Host Port
             o 1 USB Slave Port
             o 2 ADC’s (10 bit )
             o 4 External Interrupt pins
             o 1 Up to 30 pins of GPIO’s
       * JTAG Interface: 2 x 7 Header – standard ARM JTAG interface
       * Size: 0.75 inches (width) X 2.25 inches (length)
       * Package: Fits a standard 40-pin DIP socket (0.1 inch lead spacing)
       * Power Requirements: +5VDC @ 120 mA (typical)

## Interface Options

I want to use the Hammer with:

-   [Ethernet](http://eLinux.org/Hammer_Ethernet "Hammer Ethernet")
-   [BlueTooth](http://eLinux.org/Hammer_Bluetooth "Hammer Bluetooth")
-   Zigbee
-   [802.11b/g](http://eLinux.org/Hammer_WiFi "Hammer WiFi")
-   [WebCam](http://eLinux.org/Hammer_Webcam "Hammer Webcam")

## Resources

-   [HOWTOs and Tutorials](http://eLinux.org/Hammer_Board_HOWTOS "Hammer Board HOWTOS")
-   [Software](http://eLinux.org/Hammer_Board_Software "Hammer Board Software")
-   [Hardware](http://eLinux.org/Hammer_Board_Hardware "Hammer Board Hardware")
-   [Application
    Notes](http://eLinux.org/Hammer_Board_Application_Notes "Hammer Board Application Notes")

## Hammer Details

The Hammer comes preloaded with an open source bootloader, Linux 2.6
kernel, and a uClibc/Busybox based root file system. Board schematics,
application notes, and source code are also included on the CD. The
Hammer Board is a 40 pin DIP modules that can run full standard
GNU/Linux.

The [Hammer Kit](http://eLinux.org/Hammer_Kit "Hammer Kit") comes with everything you
will need to begin developing for the Hammer Board, and is **strongly
recommended** for first time Hammer Board users. All development tools
have been created for use with Linux, so you will need a working Linux
system to use the Hammer Board and develop applications for it.

[![Hammer1.jpg](http://eLinux.org/images/5/5e/Hammer1.jpg)](http://eLinux.org/File:Hammer1.jpg)

[![Hammer2.jpg](http://eLinux.org/images/7/7b/Hammer2.jpg)](http://eLinux.org/File:Hammer2.jpg)

[![Hammer3.jpg](http://eLinux.org/images/b/bc/Hammer3.jpg)](http://eLinux.org/File:Hammer3.jpg)

## Hammer Board Pinouts

[![Hammer-pinouts.jpg](http://eLinux.org/images/1/13/Hammer-pinouts.jpg)](http://eLinux.org/File:Hammer-pinouts.jpg)

Pinout with more explanations and links.

<table border="3">
<caption>Pinout with more explanations and links.
</caption>
<tr>
<th>Pin number</th>
<th>Main Function</th>
<th>Note</th>
<th>Alt Function</th>
<th>Note
</th></tr>
<tr>
<td> 1</td>
<td style="background:#80FF80">RXD0 </td>
<td style="background:#80FF80">RS232 Receive</td>
<td style="background:#FFFF80">GPH3</td>
<td style="background:#FFFF80">GPIO port H bit 3
</td></tr>
<tr>
<td> 2</td>
<td style="background:#80FF80">TXD0</td>
<td style="background:#80FF80">RS232 Transmit</td>
<td style="background:#FFFF80">GPH2</td>
<td style="background:#FFFF80">GPIO port H bit 2
</td></tr>
<tr>
<td> 3</td>
<td style="background:#99FF00">IICSDA</td>
<td style="background:#99FF00">I2C SDA <a rel="nofollow" class="external text" href="http://en.wikipedia.org/wiki/I2c">Wikipedia explains I2C</a> </td>
<td style="background:#FFFF80">GPE15</td>
<td style="background:#FFFF80">GPIO port E bit 15
</td></tr>
<tr>
<td> 4</td>
<td style="background:#99FF00">IICSCL</td>
<td style="background:#99FF00">I2C SCL</td>
<td style="background:#FFFF80">GPE14</td>
<td style="background:#FFFF80">GPIO port E bit 14
</td></tr>
<tr>
<td> 5</td>
<td style="background:#FFAA00">SPIMISO0</td>
<td style="background:#FFAA00">SPI port 0 MISO <a rel="nofollow" class="external text" href="http://en.wikipedia.org/wiki/Spi">Wikipedia explains SPI</a></td>
<td style="background:#FFFF80">GPE11</td>
<td style="background:#FFFF80">GPIO port E bit 11
</td></tr>
<tr>
<td> 6</td>
<td style="background:#FFAA00">SPIMOSI0</td>
<td style="background:#FFAA00">SPI port 0 MOSI</td>
<td style="background:#FFFF80">GPE12</td>
<td style="background:#FFFF80">GPIO port E bit 12
</td></tr>
<tr>
<td> 7</td>
<td style="background:#FFAA00">SPICLK0</td>
<td style="background:#FFAA00">SPI port 0 clock</td>
<td style="background:#FFFF80">GPE13</td>
<td style="background:#FFFF80">GPIO port E bit 13
</td></tr>
<tr>
<td> 8</td>
<td style="background:#FFAA00">nSS0</td>
<td style="background:#FFAA00">SPI port 0 select</td>
<td style="background:#FF80FF">EINT10</td>
<td style="background:#FF80FF">External Interrupt 10 (Wakeup capable?)
</td></tr>
<tr>
<td>9</td>
<td>nRESET</td>
<td>CPU reset.
</td></tr>
<tr>
<td>10</td>
<td style="background:#80FF80">nRTS0</td>
<td style="background:#80FF80">RS232 RTS (Ready to send)</td>
<td style="background:#FFFF80">GPH1</td>
<td style="background:#FFFF80">GPIO port H bit 1
</td></tr>
<tr>
<td>11</td>
<td style="background:#80FF80">nCTS0</td>
<td style="background:#80FF80">RS232 CTS (Clear to send)</td>
<td style="background:#FFFF80">GPH0</td>
<td style="background:#FFFF80">GPIO port H bit 0
</td></tr>
<tr>
<td>12</td>
<td style="background:#2099FF">TOUT0</td>
<td style="background:#2099FF">PWM timer 0 out</td>
<td style="background:#FFFF80">GPB0</td>
<td style="background:#FFFF80">GPIO port B bit 0
</td></tr>
<tr>
<td>13</td>
<td style="background:#2099FF">TOUT2</td>
<td style="background:#2099FF">PWM timer 2 out</td>
<td style="background:#FFFF80">GPB2</td>
<td style="background:#FFFF80">GPIO port B bit 2
</td></tr>
<tr>
<td>14</td>
<td style="background:#80FF80">RXD2</td>
<td style="background:#80FF80">RS232 port 2 receive (Note, Port 1 isn't accessible) </td>
<td style="background:#FFFF80">GPH7</td>
<td style="background:#FFFF80">GPIO port H bit 7
</td></tr>
<tr>
<td>15</td>
<td style="background:#80FF80">TXD2</td>
<td style="background:#80FF80">RS232 port 2 transmit</td>
<td style="background:#FFFF80">GPH6</td>
<td style="background:#FFFF80">GPIO port H bit 6
</td></tr>
<tr>
<td>16</td>
<td style="background:#FFFF40">VM</td>
<td style="background:#FFFF40">LCD AC bias </td>
<td style="background:#FFFF80">GPC4</td>
<td style="background:#FFFF80">GPIO port C bit 4
</td></tr>
<tr>
<td>17</td>
<td style="background:#FFFF40">VFRAME</td>
<td style="background:#FFFF40">LCD Vertical sync</td>
<td style="background:#FFFF80">GPC3</td>
<td style="background:#FFFF80">GPIO port C bit 3
</td></tr>
<tr>
<td>18</td>
<td style="background:#FFFF40">VLINE</td>
<td style="background:#FFFF40">LCD Horizontal sync</td>
<td style="background:#FFFF80">GPC2</td>
<td style="background:#FFFF80">GPIO port C bit 2
</td></tr>
<tr>
<td>19</td>
<td style="background:#FFFF40">VCLK</td>
<td style="background:#FFFF40">LCD pixel clock</td>
<td style="background:#FFFF80">GPC1</td>
<td style="background:#FFFF80">GPIO port C bit 1
</td></tr>
<tr>
<td>20</td>
<td style="background:#8080FF">GND</td>
<td style="background:#8080FF">Ground - supply voltage return.
</td></tr>
<tr>
<td>21</td>
<td style="background:#FFFF40">LCD_VD0</td>
<td style="background:#FFFF40">LCD data bit 0</td>
<td style="background:#FFFF80">GPC8</td>
<td style="background:#FFFF80">GPIO port C bit 8
</td></tr>
<tr>
<td>22</td>
<td style="background:#FFFF40">LCD_VD1</td>
<td style="background:#FFFF40">LCD data bit 1</td>
<td style="background:#FFFF80">GPC9</td>
<td style="background:#FFFF80">GPIO port C bit 9
</td></tr>
<tr>
<td>23</td>
<td style="background:#FFFF40">LCD_VD2</td>
<td style="background:#FFFF40">LCD data bit 2</td>
<td style="background:#FFFF80">GPC10</td>
<td style="background:#FFFF80">GPIO port C bit 10
</td></tr>
<tr>
<td>24</td>
<td style="background:#FFFF40">LCD_VD3</td>
<td style="background:#FFFF40">LCD data bit 3</td>
<td style="background:#FFFF80">GPC11</td>
<td style="background:#FFFF80">GPIO port C bit 11
</td></tr>
<tr>
<td>25</td>
<td style="background:#FFFF40">LCD_VD4</td>
<td style="background:#FFFF40">LCD data bit 4</td>
<td style="background:#FFFF80">GPC12</td>
<td style="background:#FFFF80">GPIO port C bit 12
</td></tr>
<tr>
<td>26</td>
<td style="background:#FFFF40">LCD_VD5</td>
<td style="background:#FFFF40">LCD data bit 5</td>
<td style="background:#FFFF80">GPC13</td>
<td style="background:#FFFF80">GPIO port C bit 13
</td></tr>
<tr>
<td>27</td>
<td style="background:#FFFF40">LCD_VD6</td>
<td style="background:#FFFF40">LCD data bit 6</td>
<td style="background:#FFFF80">GPC14</td>
<td style="background:#FFFF80">GPIO port C bit 14
</td></tr>
<tr>
<td>28</td>
<td style="background:#FFFF40">LCD_VD7</td>
<td style="background:#FFFF40">LCD data bit 7</td>
<td style="background:#FFFF80">GPC15</td>
<td style="background:#FFFF80">GPIO port C bit 15
</td></tr>
<tr>
<td>29</td>
<td style="background:#FF80FF">EINT11</td>
<td style="background:#FF80FF">External interrupt 11</td>
<td style="background:#AAA0FF">nSS 1</td>
<td style="background:#AAA0FF"> SPI port 1 select
</td></tr>
<tr>
<td>30</td>
<td style="background:#FF80FF">EINT15</td>
<td style="background:#FF80FF">External interrupt 15</td>
<td style="background:#AAA0FF">SPICLK1</td>
<td style="background:#AAA0FF">SPI port 1 Clock
</td></tr>
<tr>
<td>31</td>
<td style="background:#FF80FF">EINT14</td>
<td style="background:#FF80FF">External interrupt 14</td>
<td style="background:#AAA0FF">SPIMOSI1</td>
<td style="background:#AAA0FF">SPI port 1 MOSI
</td></tr>
<tr>
<td>32</td>
<td style="background:#FF80FF">EINT13</td>
<td style="background:#FF80FF">External interrupt 13</td>
<td style="background:#AAA0FF">SPIMISO1</td>
<td style="background:#AAA0FF">SPI port 1 MISO
</td></tr>
<tr style="background:red">
<td>33</td>
<td> AIN1</td>
<td>ADC input 1</td>
<td> </td>
<td>(Note - these ADCs are independant, and do not support differential mode)
</td></tr>
<tr style="background:red">
<td>34</td>
<td> AIN0</td>
<td>ADC input 0
</td></tr>
<tr style="background:#30FFFF">
<td>35</td>
<td> DP1</td>
<td>USB 1 Slave +
</td></tr>
<tr style="background:#30FFFF">
<td>36</td>
<td> DN1</td>
<td>USB 1 Slave -
</td></tr>
<tr style="background:#80FFFF">
<td>37</td>
<td> DP0</td>
<td>USB 0 Host +
</td></tr>
<tr style="background:#80FFFF">
<td>38</td>
<td> DN0</td>
<td>USB 0 Host -
</td></tr>
<tr style="background:#8080FF">
<td>39</td>
<td>+3.3VDC</td>
<td>Internal regulator output. Can supply 100mA(?) safely. Overloading this may cause irreparable damage.
</td></tr>
<tr style="background:#8080FF">
<td>40</td>
<td>+5V</td>
<td>5V input.
</td></tr></table>

## Related Products

[Hammer Carrier Board](http://eLinux.org/Hammer_Board_Carrier "Hammer Board Carrier") -
the original carrier board for Hammer

[Nail Kit](http://eLinux.org/Nail_Board "Nail Board") - Great development system for
Hammer to take where ever you go.

[Hammer-RDP](http://eLinux.org/Hammer_RDP "Hammer RDP") - the Robotics Development
Platform

## Hammer Project pages

[Christmas Lights Controller](http://eLinux.org/Xmas_Video "Xmas Video")
 [Audio Mixer Project](http://eLinux.org/Drink_Mixer "Drink Mixer")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [TCT-Hammer](http://eLinux.org/Category:TCT-Hammer "Category:TCT-Hammer")
-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")
-   [ARM Development
    Boards](http://eLinux.org/Category:ARM_Development_Boards "Category:ARM Development Boards")

