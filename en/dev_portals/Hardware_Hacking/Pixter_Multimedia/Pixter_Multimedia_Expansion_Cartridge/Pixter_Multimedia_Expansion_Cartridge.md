> From: [eLinux.org](http://eLinux.org/Pixter_Multimedia_Expansion_Cartridge "http://eLinux.org/Pixter_Multimedia_Expansion_Cartridge")


# Pixter Multimedia Expansion Cartridge



Here's a quick and dirty table describing a pixter multimedia game
cartridge that didnt use [Chip On Board](http://eLinux.org/Chip_On_Board "Chip On Board")
technology. Hopefully I (or someone else) will clean it up later.

[![Pixtercart-composite.jpg](http://eLinux.org/images/d/d3/Pixtercart-composite.jpg)](http://eLinux.org/File:Pixtercart-composite.jpg)

    -=- NET/FUNCTION LIST FOR PIXTER MULTIMEDIA GAME CARTRIDGE -=-

**NAND MEMORY ('rom'): Matrix Memory 11247-01**
[http://www.matrixsemi.com/products-and-applications/documents/DS0043DMTSOPR1.11\_062405.pdf](http://www.matrixsemi.com/products-and-applications/documents/DS0043DMTSOPR1.11_062405.pdf)
Note that the PDF is a different part number. It was chosen because its
the same product line and likely has the same pin interface. This is the
same IC used in the [JuiceBox](http://eLinux.org/JuiceBox "JuiceBox").

<table>
<tbody>
<tr class="odd">
<td align="left">net1</td>
<td align="left">net2</td>
<td align="left">function</td>
<td align="left">flash function</td>
<td align="left">wiki pin</td>
</tr>
<tr class="even">
<td align="left">crt:2</td>
<td align="left">rom:20</td>
<td align="left">DATA0</td>
<td align="left">IO1</td>
<td align="left">30</td>
</tr>
<tr class="odd">
<td align="left">crt:4</td>
<td align="left">rom:21</td>
<td align="left">DATA1</td>
<td align="left">IO2</td>
<td align="left">29</td>
</tr>
<tr class="even">
<td align="left">crt:6</td>
<td align="left">rom:22</td>
<td align="left">DATA2</td>
<td align="left">IO3</td>
<td align="left">28</td>
</tr>
<tr class="odd">
<td align="left">crt:8</td>
<td align="left">rom:23</td>
<td align="left">DATA3</td>
<td align="left">IO4</td>
<td align="left">27</td>
</tr>
<tr class="even">
<td align="left">crt:10</td>
<td align="left">rom:27</td>
<td align="left">DATA4</td>
<td align="left">IO5</td>
<td align="left">26</td>
</tr>
<tr class="odd">
<td align="left">crt:12</td>
<td align="left">rom:28</td>
<td align="left">DATA5</td>
<td align="left">IO6</td>
<td align="left">25</td>
</tr>
<tr class="even">
<td align="left">crt:14</td>
<td align="left">rom:29</td>
<td align="left">DATA6</td>
<td align="left">IO7</td>
<td align="left">24</td>
</tr>
<tr class="odd">
<td align="left">crt:16</td>
<td align="left">rom:30</td>
<td align="left">DATA7</td>
<td align="left">IO8</td>
<td align="left">23</td>
</tr>
</tbody>
</table>

**Logic: Hitachi 74HC32D ('H32') quad 2-input OR gate**

           (I cheated and used a local copy of a Fairchild Semi DM74LS32 pdf)

<table>
<tbody>
<tr class="odd">
<td align="left">net1</td>
<td align="left">net2</td>
<td align="left">function</td>
<td align="left">flash function</td>
<td align="left">wiki pin</td>
</tr>
<tr class="even">
<td align="left">crt:40</td>
<td align="left">H32:1</td>
<td align="left">1a</td>
<td align="left">nOE</td>
<td align="left">10</td>
</tr>
<tr class="odd">
<td align="left">crt:40</td>
<td align="left">H32:4</td>
<td align="left">2a</td>
<td align="left">nOE</td>
<td align="left">10</td>
</tr>
<tr class="even">
<td align="left">crt:42</td>
<td align="left">H32:2</td>
<td align="left">1b</td>
<td align="left">nCS3</td>
<td align="left">11</td>
</tr>
<tr class="odd">
<td align="left">crt:44</td>
<td align="left">H32:5</td>
<td align="left">2b</td>
<td align="left">nCS2</td>
<td align="left">12</td>
</tr>
<tr class="even">
<td align="left">H32:3</td>
<td align="left">rom:5</td>
<td align="left">1y</td>
<td align="left">RE#</td>
<td align="left">[internal net]</td>
</tr>
<tr class="odd">
<td align="left">H32:6</td>
<td align="left">rom:14</td>
<td align="left">2y</td>
<td align="left">WE#</td>
<td align="left">[internal net]</td>
</tr>
</tbody>
</table>

**More rom / misc lines**

<table>
<tbody>
<tr class="odd">
<td align="left">net1</td>
<td align="left">net2</td>
<td align="left">function</td>
<td align="left">flash function</td>
<td align="left">wiki pin</td>
</tr>
<tr class="even">
<td align="left">crt:51</td>
<td align="left">rom:12</td>
<td align="left">-</td>
<td align="left">CLE</td>
<td align="left">*</td>
</tr>
<tr class="odd">
<td align="left">crt:53</td>
<td align="left">rom:13</td>
<td align="left">-</td>
<td align="left">ALE</td>
<td align="left">*</td>
</tr>
<tr class="even">
<td align="left">crt:56</td>
<td align="left">crt:58</td>
<td align="left">-</td>
<td align="left">-</td>
<td align="left">*</td>
</tr>
<tr class="odd">
<td align="left">crt:57</td>
<td align="left">rom:3</td>
<td align="left">-</td>
<td align="left">R/B#</td>
<td align="left">*</td>
</tr>
<tr class="even">
<td align="left">crt:58</td>
<td align="left">crt:56</td>
<td align="left">vcc</td>
<td align="left">-</td>
<td align="left">*</td>
</tr>
<tr class="odd">
<td align="left">crt:59</td>
<td align="left">GND</td>
<td align="left">GND</td>
<td align="left">-</td>
<td align="left">*</td>
</tr>
</tbody>
</table>

*\* I'm honestly confused about these;
[prpplague](http://eLinux.org/User:Prpplague "User:Prpplague") pinned the [Pixter
Expansion Slot](http://eLinux.org/Pixter_Expansion_Slot "Pixter Expansion Slot") without
any knowledge for pin1 from the hardware, and had to guess pin numbers.*

Keys:

-   crt Cartridge port on the pixter MM (numbered odd pins on front;
    even pints on back as determined by cart PCB)
-   rom ROM pin (u-shaped numbering pattern as normal for DIP ic's)
-   H32 7432 pin (u-shaped numbering pattern as normal for DIP IC's)\`

* * * * *


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Pixter](http://eLinux.org/Category:Pixter "Category:Pixter")

