> From: [eLinux.org](http://eLinux.org/DHT-Walnut_U_Boot "http://eLinux.org/DHT-Walnut_U_Boot")


# DHT-Walnut U Boot



## U-Boot 1.1.4

Information on U-Boot can be found at
[[1]](http://u-boot.sourceforge.net/)

The source for U-Boot 1.1.4 is downloadable from
[ftp://ftp.denx.de/pub/u-boot/u-boot-1.1.4.tar.bz2](ftp://ftp.denx.de/pub/u-boot/u-boot-1.1.4.tar.bz2)

Here is a patch that makes it work on the DHT-Walnut:
[u-boot-dht-walnut-df2.patch](http://www.farnsworth.org/linuxppc/u-boot-dht-walnut-df2.patch).

A binary that can be copied to the DHT-Walnut flash at 0xfffc0000 is
available here:
[u-boot-1.1.4-df2.bin](http://www.farnsworth.org/linuxppc/u-boot-1.1.4-df2.bin)

Changes since u-boot-1.1.4-df1.bin:

-   A default ethaddr is now set: de:ad:be:ef:00:00
-   The ethaddr can be changed as often as you like. Use: *setenv
    ethaddr be:ef:be:ef:be:ef ; saveenv*
-   Only the first two memory banks of a DIMM are used. This allows us
    to use (half of) double-sided DIMMS.

Some things to note when changing from ppcboot to U-Boot:

-   Default baudrate is 115200.
-   Occupies flash addresses 0xfffc0000-0xffffffff (256MB).
-   Maintains two copies of environment data, primary copy at
    0xfffb0000, backup copy at 0xfffa0000.

## Installing U-Boot 1.1.4 on the DHT Walnut

-   Boot the board and bring it to the ppcboot (or U-Boot) console
    prompt.

-   Download the new bootloader [[[Media:u-boot-1.1.4-df2.bin]]
    u-boot-1.1.4-df2.bin] into RAM:
    -   Using Kermit (you'll need a terminal emulator that supports the
        kermit file transfer mode):

<!-- -->

     => loadb 800000 115200

    ## Switch baudrate to 115200 bps and press ENTER ...
    ## Ready for binary (kermit) download ...
    ## Start Addr      = 0x00800000
    ## Switch baudrate to 9600 bps and press ESC ...

-   -   or tftpboot (requires a tftp server and setting the environment
        variables ethaddr, ipaddr and serverip)

<!-- -->

     => tftpboot 800000 u-boot-1.1.4-df2.bin

    Using ppc_4xx_eth0 device
    TFTP from server 192.168.1.1; our IP address is 192.168.1.44
    Filename 'u-boot.bin'.
    Load address: 0x800000
    Loading: ####################################################
    done
    Bytes transferred = 262144 (40000 hex)

-   Verify that the download was received correctly (crc should be
    0xd3cef189):

<!-- -->

    => crc 800000 40000

    CRC32 for 00800000 ... 0083ffff ==> d3cef189

-   Unprotect the last 4 sectors:

<!-- -->

    => protect off fffc0000 ffffffff

    Un-Protected 4 sectors


 **From this point on, do \*not\* power down the board, and type
\*very\* carefully.** This is the critical section.

-   Erase the last four sectors:

<!-- -->

    => erase fffc0000 ffffffff

    Erase Flash from 0xfffc0000 to 0xffffffff
    Erasing sector fffc0000
    .Erasing sector fffd0000
    .Erasing sector fffe0000
    .Erasing sector ffff0000
    . done
    Erased 4 sectors

-   Copy the new bootloader into flash:

<!-- -->

    => cp.b 800000 fffc0000 40000

    Copy to Flash... done

-   Verify that the image is correct (crc of u-boot-1.1.4-df2.bin is
    0xd3cef189).

<!-- -->

    => crc fffc0000 40000

    CRC32 for fffc0000 ... ffffffff ==> d3cef189

**End of critical section. Congratulations**

-   Reset the board and see that the new version booted
    -   -   Don't forget to change your baud rate to 115200

<!-- -->

    => reset

    U-Boot 1.1.4 (Feb 16 2006 - 17:15:06)

    CPU:   AMCC PowerPC 405GP Rev. E at 266.640 MHz (PLB=66, OPB=33, EBC=33 MHz)
           Internal PCI arbiter enabled, PCI async ext clock used
           16 kB I-Cache 8 kB D-Cache
    Board: DHT Walnut
    I2C:   ready
    DRAM:  128 MB
    FLASH: 512 kB
    PCI:   Bus Dev VenId DevId Class Int
            00  04  105a  0d30  0101  1d
    In:    serial
    Out:   serial
    Err:   serial
    Net:   ppc_4xx_eth0
    IDE:   Bus 0: OK
      Device 0: not available
      Device 1: not available
    BEDBUG:ready


 You will see a message like : \*\*\* Warning - bad CRC, using default
environment That's normal. It will go away after you issue a *saveenv*
command.

This bootloader works well with the 2.6 Linux kernel available
[wiki:DHT-Walnut2.6LinuxKernel here].

Please let me know of any success or issues you encounter.
[dale-elinux@farnsworth.org](mailto:dale-elinux@farnsworth.org)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")
-   [U-Boot](http://eLinux.org/Category:U-Boot "Category:U-Boot")

