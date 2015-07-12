> From: [eLinux.org](http://eLinux.org/DHT-Walnut_PPCBoot "http://eLinux.org/DHT-Walnut_PPCBoot")


# DHT-Walnut PPCBoot



Quick notes on updating from stock ppcboot v1.1.2 to GPSFan's ppcboot
v1.1.6

-   Boot the board and bring it to the ppcboot console prompt.
-   Check current flash configuration:

=\> *flinfo*

    Bank # 1: AMD AM29F040 (512 Kbit, uniform sector size)
      Size: 512 KB in 8 Sectors
      Sector Start Addresses:
        FFF80000  RO  FFF90000  RO  FFFA0000  RO  FFFB0000      FFFC0000
        FFFD0000      FFFE0000      FFFF0000


 Note that the bottom three sectors, containing the existing 1.1.2
bootloader, are protected. We also want to protect the last sector,
which contains the initial jump instruction, so:

=\> *protect on ffff0000 ffffffff*

    Protected 1 sectors

-   Now download the new bootloader into ram:

=\> *loadb 400000 115200*

    ## Switch baudrate to 115200 bps and press ENTER ...
    ## Ready for binary (kermit) download ...
    ## Start Addr      = 0x00400000
    ## Switch baudrate to 9600 bps and press ESC ...

-   Erase the three spare sectors, which we'll use to backup the 1.1.2
    bootloader:

=\> *erase fffc0000 fffeffff*

    Erase Flash from 0xfffc0000 to 0xfffeffff
    Erasing sector fffc0000
    .Erasing sector fffd0000
    .Erasing sector fffe0000
    . done
    Erased 3 sectors

-   (Optional: erase the 0xfffb0000 sector, which will be used for
    non-volatile environment storage.)

=\> *erase fffb0000 fffbffff*

    Erase Flash from 0xfffb0000 to 0xfffbffff
    Erasing sector fffb0000
    . done
    Erased 1 sectors

-   Check that sectors 0xfffc0000 to 0xfffe0000 are erased, and sector
    0xffff0000 is protected:

=\> *flinfo*

    Bank # 1: AMD AM29F040 (512 Kbit, uniform sector size)
      Size: 512 KB in 8 Sectors
      Sector Start Addresses:
        FFF80000  RO  FFF90000  RO  FFFA0000  RO  FFFB0000 E    FFFC0000 E
        FFFD0000 E    FFFE0000 E    FFFF0000  RO

-   Now we're ready to backup the 1.1.2 bootloader. Copy three sectors
    from 0xfff80000 to 0xfffc0000:

=\> *cp.b fff80000 fffc0000 30000*

    Copy to Flash... done

-   Easy enough, right? Compare just to be sure it went ok:

=\> *cmp.b fff80000 fffc0000 30000*

    Total of 196608 bytes were the same

-   Now we're ready to modify the bootsectors. We'll turn off
    protection, erase the three bottom sectors, and copy the new 1.1.6
    bootloader from ram.

-   Unprotect the bottom three sectors:

=\> *protect off fff80000 fffaffff*

    Un-Protected 3 sectors

**From this point on, do \*not\* power down the board. This is the
critical section.**

-   Erase the bottom three sectors with the original 1.1.2 bootloader:

=\> *erase fff80000 fffaffff*

    Erase Flash from 0xfff80000 to 0xfffaffff
    Erasing sector fff80000
    .Erasing sector fff90000
    .Erasing sector fffa0000
    . done
    Erased 3 sectors

-   Copy the new bootloader into flash:

=\> *cp.b 400000 fff80000 30000*

    Copy to Flash... done

-   Verify the copy:

=\> *cmp.b 400000 fff80000 30000*

    Total of 196608 bytes were the same

**End of critical section. Congratulations'**

-   We've finished modifying flash, so turn the write protection back
    on:

=\> *protect on fff80000 fffaffff*

    Protected 3 sectors


 To sum up, you'll end up executing 10 commands:

=\> *protect on ffff0000 ffffffff*

=\> *loadb 400000 115200*

=\> *erase fffc0000 fffeffff*

=\> *cp.b fff80000 fffc0000 30000*

=\> *cmp.b fff80000 fffc0000 30000*

=\> *protect off fff80000 fffaffff*

=\> *erase fff80000 fffaffff*

=\> *cp.b 400000 fff80000 30000*

=\> *cmp.b 400000 fff80000 30000*

=\> *protect on fff80000 fffaffff*


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")

