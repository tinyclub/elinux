> From: [eLinux.org](http://eLinux.org/Panda_How_to_add_2_USBs "http://eLinux.org/Panda_How_to_add_2_USBs")


# Panda How to add 2 USBs



## Contents

-   [1 Introduction](#introduction)
-   [2 Materials](#materials)
-   [3 Pinout](#pinout)
-   [4 Assembly](#assembly)
-   [5 Notes](#notes)

## Introduction

-   The J6 expansion header on the PandaBoard allows for the addition of
    two USB host ports.
-   The pinouts for the USB host ports match that of a standard PC USB
    host expansion connector.



## Materials

These are the materials you will need in addition to your Pandaboard.

-   PC Style USB Expansion cable
-   Available from:
    -   [Fry's](http://www.frys.com/product/1341296?site=sr:SEARCH:MAIN_RSLT_PG)
    -   [AVA
        Direct](http://www.avadirect.com/product_details_parts.asp?PRID=11389)
    -   [CompUSA](http://www.compusa.com/applications/SearchTools/item-details.asp?EdpNo=6366115)
    -   [Microcenter](http://www.microcenter.com/single_product_results.phtml?product_id=0321594)

[![Thingy.jpg](http://eLinux.org/images/thumb/f/f1/Thingy.jpg/240px-Thingy.jpg)](http://eLinux.org/File:Thingy.jpg)





-   A 2 x 4 pin header .1" centers
-   Available from:
    -   [Fry's](http://www.frys.com/product/2069003?site=sr:SEARCH:MAIN_RSLT_PG)
    -   [Sparkfun Electronics](http://www.sparkfun.com/products/116)
    -   [Digikey](http://search.digikey.com/scripts/DkSearch/dksus.dll?Detail&name=SAM1034-50-ND)

[![Header.jpg](http://eLinux.org/images/thumb/5/5e/Header.jpg/240px-Header.jpg)](http://eLinux.org/File:Header.jpg)

## Pinout

-   Detail of one of the PC style USB expansion cable

[![Conn.jpg](http://eLinux.org/images/thumb/9/90/Conn.jpg/240px-Conn.jpg)](http://eLinux.org/File:Conn.jpg)



-   Red (VCC) wire will connect to J6 Pin 1 (USB Port 3) or 2 (USB Port
    4)
-   White (D-) wire will connect to J6 Pin 3 (USB Port 3) or 4 (USB Port
    4)
-   Green (D+) wire will connect to J6 Pin 5 (USB Port 3) or 6 (USB Port
    4)
-   Black (Gnd) wire will connect to J6 Pin 7 (USB Port 3) or 8 (USB
    Port 4)
-   The fifth pin (shield) is not connected.


 NOTE: Earlier versions of the Pandaboard had connections for the
shield, but they were dropped in favor of some additional GPIOs.

-   J6 Pinout

[![J6
detail1.jpg](http://eLinux.org/images/thumb/c/c5/J6_detail1.jpg/600px-J6_detail1.jpg)](http://eLinux.org/File:J6_detail1.jpg)

## Assembly

Here is what the header will look like when soldered to J6 of the
Pandaboard.

-   Solder the header into the J6 pins closest to the WIFI module
-   Detail of the header soldered into J6

[![Board1.jpg](http://eLinux.org/images/thumb/c/c3/Board1.jpg/320px-Board1.jpg)](http://eLinux.org/File:Board1.jpg)



-   Plug in the PC style USB expansion cable, making sure that the RED
    wire end of the connectors are plugged into the pins nearest the
    WIFI module
-   Detail of the Thingy plugged into the Header at J6

[![Board2a.jpg](http://eLinux.org/images/thumb/4/4b/Board2a.jpg/320px-Board2a.jpg)](http://eLinux.org/File:Board2a.jpg)



## Notes

Most PC USB Thingies have a standard pinout that is compatible with J6

-   First few pins of J6

[![600x](http://eLinux.org/images/3/3d/J6_detail2.jpg)](http://eLinux.org/File:J6_detail2.jpg "600x")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

