> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge_Settings "http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge_Settings")


# LeapFrog Pollux Platform: Cartridge Settings



## Summary

This is a list of the jumper settings for gpiob[2:5] on an [LeapFrog
Pollux Platform](http://eLinux.org/LeapFrog_Pollux_Platform "LeapFrog Pollux Platform")
cartridge's. These are settings found on the actual cartridge and
dictate what type of cart it is, ie read only, ECC, writable, etc.

## Settings

Cart type jumpers:



<table>
<tbody>
<tr class="odd">
<td align="left">GPIOB[n]</td>
<td align="left">High</td>
<td align="left">Low</td>
</tr>
<tr class="even">
<td align="left">GPIOB4</td>
<td align="left">Didj</td>
<td align="left">Explorer</td>
</tr>
<tr class="odd">
<td align="left">GPIOB5</td>
<td align="left">R/W</td>
<td align="left">OTP</td>
</tr>
</tbody>
</table>


 Leapster Explorer specific cart types:

     #define NAND_CART_DEVELOPMENT   0xF     /* 1111 : Development = NAND, writable, ECC on */
     #define NAND_CART_MANUFACTURING 0xB     /* 1011 */
     #define NAND_CART_PRODUCTION    0x7     /* 0111 : Production = OTP, ECC off */

More info can be found here:

    LF-Linux-6905-20100610-0915\linux-2.6\arch\arm\mach-lf1000\include\mach\nand.h


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

