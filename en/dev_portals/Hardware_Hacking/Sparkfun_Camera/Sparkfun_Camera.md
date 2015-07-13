> From: [eLinux.org](http://eLinux.org/Sparkfun_Camera "http://eLinux.org/Sparkfun_Camera")


# Sparkfun Camera



[MagnaChip](http://www.magnachip.com) HV7131GP CMOS Camera Module

-   640x480 (actual 652 x 488 )
-   [datasheet](http://eLinux.org/images/6/6b/HV171GP.pdf "HV171GP.pdf")
-   on sale at
    [Sparkfun](http://www.sparkfun.com/commerce/product_info.php?products_id=637)
    for \$19.95
-   SMD Connector is a [DF18 Hirose
    Connector](http://eLinux.org/images/0/0d/Df18.pdf "Df18.pdf")
-   SMD Connect available from
    [Sparkfun](http://www.sparkfun.com/commerce/product_info.php?products_id=638)
    for \$0.95
-   [Break out
    Board](http://www.sparkfun.com/commerce/product_info.php?products_id=7904)
-   [SparkfunCameraFPGA](http://eLinux.org/SparkfunCameraFPGA "SparkfunCameraFPGA")
-   AVR project based on a similiar cameras -
    [http://www.jrobot.net/Projects/AVRcam.html](http://www.jrobot.net/Projects/AVRcam.html)

8-Bit Output Format Support:

-   `YCbCr 4:2:2`
-   `Bayer`

the [libdc1394 howto](http://eLinux.org/images/b/b1/Libdc1394.pdf "Libdc1394.pdf")
provides an excellent introduction to the Bayer format.

the starting row and column determine the Bayer format

-   even `BGGR`
-   odd `GRBG`

basically because the camera is slightly larger than 640x480 you can set
the window for usage:

-   Row 2 and Column 2 with Window Heigh 640 and Width 480 produces
    `Bayer BGGR`
-   Row 1 and Column 1 with Window Heigh 640 and Width 480 produces
    `Bayer GRBG`

the odd/even are dependent on the orientation of the scan.


 *Information gathered from the Sparkfun Forums*

although the camera does support a 16-bit mode, the ribbon cable only
provides support for the 8-bit mode.



              ------------
         ENB  | 11     1 |    Y0
         RST  | 12     2 |    Y1
         GND  | 13     3 |    Y2
         VDD  | 14     4 |    Y3
         SCL  | 15     5 |    Y4
         SDA  | 16     6 |    Y5
      FVALID  | 17     7 |    Y6
      LVALID  | 18     8 |    Y7
        PCLK  | 19     9 |    VDD
        MCLK  | 20    10 |    GND
              ------------

    NOTE: Pins 14 + 9 are connected to VDD :
    V+ --|
         |
         |----[B1]--------------#--------- Pin 9
         |                      |
         |                      |
         |----[B2]-------#------)--------- Pin 14
                         |      |
                         |      |
                        [C1]   [C2]
                         |      |
                       -----  -----
                        ---    ---
                         -      -

    busonerd states - "My guess for the parts values would be a ~600ohm @ 100MHZ ferrite bead (B1 and B2), current capacity ~100-200 ma, and a 0.1uf caps(C1 and C2). You really can't go wrong with the ferrite bead - just get a higher impedance + higher current capacity one if in doubt. For the caps(C1 and C2) - if you really want to be paranoid, use an 0.47uf, an 0.1uf and an 0.01uf - with the smaller values nearer the connector - but that is guaranteed overkill."

-   the i2c interface needs to be level shifted from the 2.8v to either
    3.3v or 5v depending on your host device
-   [http://www.standardics.philips.com/support/documents/i2c/pdf/an97055.pdf](http://www.standardics.philips.com/support/documents/i2c/pdf/an97055.pdf)
    - application note on i2c level shifting


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware](http://eLinux.org/Category:Hardware "Category:Hardware")

