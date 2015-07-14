> From: [eLinux.org](http://eLinux.org/Pixter_Dev_Board "http://eLinux.org/Pixter_Dev_Board")


# Pixter Dev Board



This is a Pixter taken apart and placed on a board for development.
Currently this includes just the basics of touchscreen interface, power,
calibrate button(GPIO), audio (PWM), and [JTAG](http://eLinux.org/JTAG "JTAG"). On the
todolist will be a duplication of the i/o pins (using a [Pixter Dev
Cart](http://eLinux.org/Pixter_Dev_Cart "Pixter Dev Cart")) available on the [Pixter
Expansion Slot](http://eLinux.org/Pixter_Expansion_Slot "Pixter Expansion Slot") which
will give rise to the addition of items such as [mmc
interface](http://eLinux.org/index.php?title=Pixter_MMC&action=edit&redlink=1 "Pixter MMC (page does not exist)"),
10baseT nic, and rs-232 interfaces.


 [![Pixdev.jpg](http://eLinux.org/images/a/ad/Pixdev.jpg)](http://eLinux.org/File:Pixdev.jpg)


 the opposite side of the main pixter board has a pair of solder pads
which appear to be for a 0 ohm resistor. the pads have a pcb trace
between the pads. this pad pair is stenciled "NCS0", which is the chip
select for the onboard ROM. by cutting the trace between the pads the
onboard ROM can be disabled. might be possible to find an unused or
duplicate pin on the [Pixter Expansion
Slot](http://eLinux.org/Pixter_Expansion_Slot "Pixter Expansion Slot") that can be
replaced with the NCS0 line.



there are several other unidentified three pad areas with traces between
two of the pads:

P100 P101 P102 P103

as well as one single pair marked "option"


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Pixter](http://eLinux.org/Category:Pixter "Category:Pixter")

