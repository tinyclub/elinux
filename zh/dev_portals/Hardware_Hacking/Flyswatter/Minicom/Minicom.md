> From: [eLinux.org](http://eLinux.org/Minicom "http://eLinux.org/Minicom")


# Minicom



## Contents

-   [1 Overview](#overview)
-   [2 Tips](#tips)
    -   [2.1 line wrapping](#line-wrapping)
    -   [2.2 location of configuration
        files](#location-of-configuration-files)
    -   [2.3 turning off modem initialization
        strings](#turning-off-modem-initialization-strings)

## Overview

Minicom is a menu driven communications program. It emulates ANSI and
VT102 terminals. It has a dialing directory and auto zmodem download. It
is included with almost all Linux distributions, so it should be readily
available.

[Minicom Project Page](http://alioth.debian.org/projects/minicom/)

A very common use of Minicom during embedded Linux development, is to
communicate from the host machine to the kernel console, on the target's
serial port.

See [serial console](http://eLinux.org/Serial_console "Serial console") for information
on configuring the kernel for serial console support.

## Tips

### line wrapping

By default, minicom will not wrap longs lines of text, which causes them
to run off the edge of your terminal screen. To avoid this, use the '-w'
command line option. See 'man minicom' for more information.

### location of configuration files

The configuration files for minicom are located in /etc, with a name
prefix of 'minirc.'. You can have several minicom configuration files,
for different serial hardware on your machine. This is handy if you have
different targets connected to your host and need to refer to different
serial connections by name. Each config can have the port and settings
for the different connections, and you can refer to them by name.

For example, if you have an arm development board and a mips development
board, and one is connected to the first serial port (UART) of the host,
and the other is connected to the host via a USB/serial converter, then
you can have different minicom config files to use them. For example,
you can have /etc/minirc.arm which has the settings for the ARM serial
connection, and /etc/minirc.mips which has the settings for the serial
connection to the mips board. To access these, you would use 'minicom
arm' or 'minicom mips' at the command line, respectively.

### turning off modem initialization strings

Besides serial port settings (the most common being 115200,N,8,1), it is
often necessary to turn off the modem initialization strings for
minicom. By default, minicom is intended to create a serial connection
over a modem. But when using minicom with a kernel serial console, if
modem initialization strings are used, this may confuse the kernel
console initialization routines. (Which can result in gibberish being
output on the serial line). To disable the modem initialization strings,
set the variables 'minit', 'mreset', and 'mhangup' to be emtpy. You can
do this with the following lines in a minicom config file:

    pu minit
    pu mreset
    pu mhangup


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

