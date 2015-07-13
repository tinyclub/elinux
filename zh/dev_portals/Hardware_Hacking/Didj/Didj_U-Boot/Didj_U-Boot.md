> From: [eLinux.org](http://eLinux.org/Didj_U-Boot "http://eLinux.org/Didj_U-Boot")


# Didj U-Boot





## Contents

-   [1 Downloads](#downloads)
-   [2 NAND Command Reference](#nand-command-reference)
    -   [2.1 nand dump](#nand-dump)
    -   [2.2 nand read](#nand-read)
    -   [2.3 nand erase](#nand-erase)
    -   [2.4 nand write](#nand-write)

## Downloads

[u-boot](http://files.poxlib.org/LeapFrog/elinux_downloads/u-boot.bin)

## NAND Command Reference

U-Boot provides a single command for interfacing with your NAND storage.
It is important to keep in mind when using these commands that '**all
values are given in hex, not decimal** The general format of the nand
command is:

    nand <command> [options]

Some of the commands whose functions are understood are listed below.

### nand dump

You can dump pages (2K of data) using the nand dump command. The format
of the command is

`nand dump <page>`

Here is an example of using nand dump:

    LF1000 # nand dump 0
    Page 00000000 dump:
        04 d0 9f e5 01 00 00 eb  6c 0b 00 ea 00 80 22 00
        34 c0 9f e5 01 30 a0 e3  00 30 8c e5 08 30 9c e5
        02 0b a0 e3 04 e0 2d e5  80 30 83 e3 00 e0 a0 e3

### nand read

You can read data from the nand into memory using the nand read command.
The format of the command is

    nand read <address> <nand offset> <size>

Example:

    LF1000 # nand read 1800000 0 800

    NAND read: device 0 offset 0x0, size 0x800
     2048 bytes read: OK
    LF1000 # md 1800000 10
    01800000: e59fd004 eb000001 ea000b6c 00228000    ........l.....".
    01800010: e59fc034 e3a03001 e58c3000 e59c3008    4....0...0...0..
    01800020: e3a00b02 e52de004 e3833080 e3a0e000    ......-..0......
    01800030: e1a01000 e3a02b7e e58c3008 e58ce008    ....~+...0......

Comparison of this to the nand dump command above will show that these
are the same data. Not that md has dumped the data in little endian
format.

### nand erase

**Disclaimer:** This will *really* erase one or more pages of your nand.
Make sure you think this through before doing it.

The nand erase command will reset a range of your nand to its unwritten
state. In flash parts, such as Didj, this means all data within an
erased page will become `0xFF`. The format of the command is:

    nand erase <offset> <size>

Example:

    LF1000 # nand erase 0 4000

    NAND erase: device 0 offset 0x0, size 0x4000
    Erasing at 0x0 -- 800% complete.
    OK
    LF1000 # nand dump 0
    Page 00000000 dump:
        ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
        ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff

It is also important to understand that flash parts cannot erase less
than one page. Either the whole page will be erased, or it will not. the
size of your erasure should be a multiple of 0x800. In this case I have
erased the first 16K of nand, which is where the bootstrap lives.

### nand write

**Disclaimer:** This will write one or more pages to your nand. If those
pages have not been erased first, the results will not be what you
expect. See disclaimer in the erase nand section.

The nand write command will write a range of pages to your Didj's nand.
In flash parts, bits can only be changed from 1 to 0. Therefore it is
important to erase the block before you write it. The format of the
command is

    nand write <memory address> <offset> <size>

Example:

    LF1000 # nand write 1800000 0 4000

    NAND write: device 0 offset 0x0, size 0x4000
     16384 bytes written: OK

Note that you need to have the data you wish to write already in memory.
In the example this data is 16Kbytes starting at physical address
0x1800000.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

