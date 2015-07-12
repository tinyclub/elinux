> From: [eLinux.org](http://eLinux.org/SparkfunCameraFPGA "http://eLinux.org/SparkfunCameraFPGA")


# SparkfunCameraFPGA



Project by: David Carne

## Structure

    * Top.v
    * capture_block.v
    * freq_count.v
    * cons.ucf - Constraint file. This will only make sense if you're deploying to a startan 3 starter kit.
    * cam_code.psm - assembler source for the program rom. use picoblaze compiler.
    * kcpsm3.v - NOT INCLUDED
    * uart_tx.v - NOT INCLUDED
    * kcuart_tx.v - NOT INCLUDED
    * bbfifo_16x8.v - NOT INCLUDED
    * uart_rx.v - NOT INCLUDED
    * kcuart_tx.v - NOT INCLUDED
    * bbfifo_16x7.v - NOT INCLUDED
    * cam_code.v - NOT INCLUDED, program rom. Generated file may not be able to distribute as it contains boundary scan code under xilinx license. I'll make a stripped versiosn shortly - or just build from source file.


 All the missing files can be downloaded from
[Xilinx](http://www.xilinx.com/ipcenter/) picoblaze lounge. Registration
and click through license are required. I'm currently working on porting
the code to an open source reimplementation of the picoblaze, so you
also could just wait for that to happen.


 Connections:


 Camera Pinout:

<table>
<tbody>
<tr class="odd">
<td align="left">ENB</td>
<td align="left">Y0</td>
</tr>
<tr class="even">
<td align="left">RST</td>
<td align="left">Y1</td>
</tr>
<tr class="odd">
<td align="left">GND</td>
<td align="left">Y2</td>
</tr>
<tr class="even">
<td align="left">VCC</td>
<td align="left">Y3</td>
</tr>
<tr class="odd">
<td align="left">SCL</td>
<td align="left">Y4</td>
</tr>
<tr class="even">
<td align="left">SDA</td>
<td align="left">Y5</td>
</tr>
<tr class="odd">
<td align="left">VSYNC</td>
<td align="left">Y6</td>
</tr>
<tr class="even">
<td align="left">HSYNC</td>
<td align="left">Y7</td>
</tr>
<tr class="odd">
<td align="left">VCLK</td>
<td align="left">VCC</td>
</tr>
<tr class="even">
<td align="left">MCLK</td>
<td align="left">GND</td>
</tr>
</tbody>
</table>



NOTE - only valid if you use my cons.ucf on a spartan 3 starter kit [not
3e]

<table>
<tbody>
<tr class="odd">
<td align="left">Camera</td>
<td align="left">Description</td>
<td align="left">S3SK</td>
</tr>
<tr class="even">
<td align="left">ENB</td>
<td align="left">Pullup via 1k</td>
<td align="left">VCC</td>
</tr>
<tr class="odd">
<td align="left">RST</td>
<td align="left">Pullup via 1k</td>
<td align="left">VCC</td>
</tr>
<tr class="even">
<td align="left">GND</td>
<td align="left">Ground</td>
<td align="left">GND</td>
</tr>
<tr class="odd">
<td align="left">VCC</td>
<td align="left">2.8V</td>
<td align="left">VCC</td>
</tr>
<tr class="even">
<td align="left">SCL</td>
<td align="left"></td>
<td align="left">N/C</td>
</tr>
<tr class="odd">
<td align="left">SDA</td>
<td align="left"></td>
<td align="left">N/C</td>
</tr>
<tr class="even">
<td align="left">VSYNC</td>
<td align="left">Vertical Sync</td>
<td align="left">PortB-Pin 5</td>
</tr>
<tr class="odd">
<td align="left">HSYNC</td>
<td align="left">Horizontal Sync</td>
<td align="left">PortB-Pin 6</td>
</tr>
<tr class="even">
<td align="left">VCLK</td>
<td align="left">Verticle Clock</td>
<td align="left">PortB-Pin 4</td>
</tr>
<tr class="odd">
<td align="left">MCLK</td>
<td align="left">2.8V PtP 4 Mhz clock</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">Y7</td>
<td align="left">Data7</td>
<td align="left">PortB-Pin7</td>
</tr>
<tr class="odd">
<td align="left">Y6</td>
<td align="left">Data6</td>
<td align="left">PortB-Pin8</td>
</tr>
<tr class="even">
<td align="left">Y5</td>
<td align="left">Data5</td>
<td align="left">PortB-Pin9</td>
</tr>
<tr class="odd">
<td align="left">Y4</td>
<td align="left">Data4</td>
<td align="left">PortB-Pin10</td>
</tr>
<tr class="even">
<td align="left">Y3</td>
<td align="left">Data3</td>
<td align="left">PortB-Pin11</td>
</tr>
<tr class="odd">
<td align="left">Y2</td>
<td align="left">Data2</td>
<td align="left">PortB-Pin12</td>
</tr>
<tr class="even">
<td align="left">Y1</td>
<td align="left">Data1</td>
<td align="left">PortB-Pin13</td>
</tr>
<tr class="odd">
<td align="left">Y0</td>
<td align="left">Data0</td>
<td align="left">PortB-Pin14</td>
</tr>
</tbody>
</table>

NOTES:

    * Y7 is the lsb
    * Y0 is the MSB
    * VCC = 2.8-3V
    * VDD = 5V
    * S3SK PortB Pin 1 - to GND - to increase grounding connection
    * S3SK PortA Pin 1 - to GND - to increase grounding connection
    * RST pull low after powerup(short to ground once at power on)
    * VCC decouple with a small cap, if possible also use a ferrite bead
    * MCLK needs to be a 2.8V Peak-To-Peak 4 Mhz clock - I used an avr as an oscillator and ran it through a voltage divider.
    * BEFORE POWERING UP DESIGN - PROGRAM THE FPGA. Either power up while holding the prog button - and then download via jtag, or preprogram it. If you don't, some of those lines will be outputs!

Power: If you're going to power the S3SK from a 5V bench supply, DO NOT
CONNECT THE STANDARD POWER ADAPTER, and connect S3SK PortA Pin 2 to 5V.
Otherwise just use the standard adapter and leave this connection off.

When all is properly connected, you'll see about 10-20ma on the 2.8v
rail to the camera, and 150ma on the 5V rail to the fpga + avr.


 [![Capture.jpg](http://eLinux.org/images/4/4a/Capture.jpg)](http://eLinux.org/File:Capture.jpg)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware](http://eLinux.org/Category:Hardware "Category:Hardware")

