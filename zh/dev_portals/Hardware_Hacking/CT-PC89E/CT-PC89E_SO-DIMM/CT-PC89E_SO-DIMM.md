> From: [eLinux.org](http://eLinux.org/CT-PC89E_SO-DIMM "http://eLinux.org/CT-PC89E_SO-DIMM")


# CT-PC89E SO-DIMM



Notes:

-   Found: DEP9000 data lines 0-15
-   Found: TI LVDS83B data lines
-   left hand side of LVDS83B pins, TI datasheet marks pin 2 as D5. on
    CT-PC89E this is connected to Ground! apparently this is correct
    according to TI datasheet...
-   Found: RIGHT GL850G
-   LEFT GL850G is chained to RIGHT GL850G, via DP0,DP1,DM0,DM1
-   Pin 93 goes to 10k resistor, which then goes to ground, but under
    the 10k resistor, does it go anywhere else? how do we find out??!

<!-- -->

    Pin 1  Ground (joined 1, 3,5)
    Pin 3  Ground (joined 1, 3,5)
    Pin 5 - Ground (joined 1, 3,5)
    Pin 7 - Power ? (joined to 9)
    Pin 8  Ground
    Pin 9 - Power ? (joined to 7)

    Pin 10  Ground
    Pin 14  Ground
    Pin 52 - SDATAOUT of WM9715G (Pin 5)
    PinO 53 Ground
    Pin 54 - SDATAIN of WM9715G (Pin 8)
    Pin 56 - SYNC of WM9715G (Pin 10)
    Pin 58 - RESETB of WM9715G (Pin 11)
    Pin 60 - BITCLK of WM9715G (Pin 6)
    Pin 62 Ground
    PinO 79 - Ground
    PinO 81 - DP0 of RIGHT GL850G (Pin 26)
    PinO 83 - DM0 of RIGHT GL850G (Pin 25)
    PinO 85 - V5 of RIGHT GL850G (Pin 23) but it is 110 on the 2000 scale of multimeter.
    PinO 91 - V5 of LEFT GL850G (Pin 23) but it is near 0 on the 2000 scale of multimeter.
    PinO 93 - pulled to GND via a 10k resistor.
    Pin NN - SD5 of DM9000 (Pin 12)
    Pin 102 Ground
    Pin 104 !SHTDN of LVDS83B (Pin 32)
    Pin 106 CLKIN of LVDS83B (Pin 31)
    Pin 108 D25 of LVDS83B (Pin 28)
    Pin 110 D26 of LVDS83B (Pin 30)
    Pin 112 Ground
    Pin 114 D6 of LVDS83B (Pin 3)
    PinO 115 IOR# of DEP9000 (Pin 35)
    Pin 116 D4 of LVDS83B (Pin 56)
    PinO 117 IOW# of DEP9000 (Pin 36)
    Pin 118 D3 of LVDS83B (Pin 55)
    PinO 119 Ground
    Pin 120 D2 of LVDS83B (Pin 54)
    PinO 121 CS of DEP9000 (Pin 37)
    Pin 122 D1 of LVDS83B (Pin 52)
    PinO 123
    Pin 124 D0 of LVDS83B (Pin 51)
    Pin 126
    Pin 128
    Pin 130 D14 of LVDS83B (Pin 14)
    Pin 132 D13 of LVDS83B (Pin 12)
    PinO 133 SD0 of DEP9000 (Pin 18)
    Pin 134 D12 of LVDS83B (Pin 11)
    PinO 135 SD1 of DEP9000 (Pin 17)
    Pin 136 D9 of LVDS83B (Pin 7)
    PinO 137 SD2 of DEP9000 (Pin 16)
    Pin 138 D8 of LVDS83B (Pin 6)
    PinO 139 SD3 of DEP9000 (Pin 14)
    Pin 140 D7 of LVDS83B (Pin 4)
    PinO 141 SD4 of DEP9000 (Pin 13)
    Pin 142
    PinO 143 SD5 of DEP9000 (Pin 12)
    Pin 144
    PinO 145 SD6 of DEP9000 (Pin 11)
    Pin 146 D22 of LVDS83B (Pin 24)
    PinO 147 SD7 of DEP9000 (Pin 10)
    Pin 148 D21 of LVDS83B (Pin 23)
    PinO 149 SD8 of DEP9000 (Pin 31)
    Pin 150
    PinO 151 SD9 of DEP9000 (Pin 29)
    Pin 152
    PinO 153 SD10 of DEP9000 (Pin 28)
    Pin 154
    PinO 155 SD11 of DEP9000 (Pin 27)
    Pin 156
    PinO 157 SD12 of DEP9000 (Pin 26)
    Pin 158
    PinO 159 SD13 of DEP9000 (Pin 25)
    Pin 160
    PinO 161 SD14 of DEP9000 (Pin 24)
    Pin 162 D16 of LVDS83B (Pin 16)
    PinO 163 SD15 of DEP9000 (Pin 22)
    Pin 164
    Pin 168
    Pin 170
    Pin 172
    Pin 174
    Pin 176
    Pin 178
    Pin 180
    Pin 182
    Pin 184
    Pin 186
    Pin 188
    Pin 190
    Pin 192
    Pin 194
    Pin 196
    Pin 198
    PinO 199 - 50k resistor to W_DISABLE of RIGHT PCI-e socket
    Pin 200 Ground






[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CT-PC89E](http://eLinux.org/index.php?title=Category:CT-PC89E&action=edit&redlink=1 "Category:CT-PC89E (page does not exist)")

