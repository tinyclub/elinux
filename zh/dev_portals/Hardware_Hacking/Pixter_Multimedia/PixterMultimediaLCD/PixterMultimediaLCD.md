> From: [eLinux.org](http://eLinux.org/PixterMultimediaLCD "http://eLinux.org/PixterMultimediaLCD")


# PixterMultimediaLCD



-   Custom Sharp LQ038B3DD01
-   3.8" square
-   TFT
-   160 x 160
-   8-Bit, 256 colors
-   single panel
-   4-wire bonded touch screen



<table>
<tbody>
<tr class="odd">
<td align="left">Register</td>
<td align="left">Value</td>
</tr>
<tr class="even">
<td align="left">0xFFFF4000</td>
<td align="left">0x0A080824</td>
</tr>
<tr class="odd">
<td align="left">0xFFFF4004</td>
<td align="left">0x0505009F</td>
</tr>
<tr class="even">
<td align="left">0xFFFF4008</td>
<td align="left">0x00A13000</td>
</tr>
<tr class="odd">
<td align="left">0xFFFF401C</td>
<td align="left">0x00000827</td>
</tr>
</tbody>
</table>

-   [Similiar Sharp LCD
    320x320](http://www.sharpsma.com/Page.aspx/americas/en/part/LQ030B7DD01/)
-   [[[Media:lq030b7dd01.pdf]] LQ030B7DD01 Datasheet]

major difference between the the LQ030B7DD01 and the LQ038B3DD01 is the
that the lq038 is a 3.8" and the lq030 is a 3.0" , the only other
obvious difference is the resolution, the LQ030B7DD01 is 320x320 , and
the LQ038B3DD01 is 160x160. from the numbering i can only assume that
sharp uses the B7 and B3 to indicate the resultion.

if anyone has a document describing the numbering scheme Sharp uses for
their lcds please post

LQ-XXX-ABCDEF

XXX is the screen size in inches examples:

<table>
<tbody>
<tr class="odd">
<td align="left">030</td>
<td align="left">3.0&quot;</td>
</tr>
<tr class="even">
<td align="left">031</td>
<td align="left">3.1&quot;</td>
</tr>
<tr class="odd">
<td align="left">035</td>
<td align="left">3.5&quot;</td>
</tr>
<tr class="even">
<td align="left">036</td>
<td align="left">3.6&quot;</td>
</tr>
<tr class="odd">
<td align="left">038</td>
<td align="left">3.8&quot;</td>
</tr>
<tr class="even">
<td align="left">039</td>
<td align="left">3.9&quot;</td>
</tr>
</tbody>
</table>

A is the screen format

<table>
<tbody>
<tr class="odd">
<td align="left">B</td>
<td align="left">Square</td>
</tr>
<tr class="even">
<td align="left">Q</td>
<td align="left">Quarter VGA</td>
</tr>
<tr class="odd">
<td align="left">V</td>
<td align="left">VGA</td>
</tr>
<tr class="even">
<td align="left">S</td>
<td align="left">SVGA</td>
</tr>
<tr class="odd">
<td align="left">X</td>
<td align="left">XGA</td>
</tr>
<tr class="even">
<td align="left">T</td>
<td align="left">16:9</td>
</tr>
</tbody>
</table>

    (sloppy edit)

Breakthrough jbevren managed to switch the lcd into 16bpp mode and
upload a raster image to the lcd. The lcd seems to be pretty good qualty
too. [http://jbevren.net/pixter/](http://jbevren.net/pixter/)

More documentation next week :)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Pixter](http://eLinux.org/Category:Pixter "Category:Pixter")

