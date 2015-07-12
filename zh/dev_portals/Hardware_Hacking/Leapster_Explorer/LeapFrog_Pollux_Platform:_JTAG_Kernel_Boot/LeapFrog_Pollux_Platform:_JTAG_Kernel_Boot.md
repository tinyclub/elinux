> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_JTAG_Kernel_Boot "http://eLinux.org/LeapFrog_Pollux_Platform:_JTAG_Kernel_Boot")


# LeapFrog Pollux Platform: JTAG Kernel Boot



## Contents

-   [1 Disclaimer](#disclaimer)
-   [2 Introduction](#introduction)
-   [3 Connect your JTAG Dongle](#connect-your-jtag-dongle)
-   [4 Build openocd](#build-openocd)
-   [5 Launch openocd](#launch-openocd)
-   [6 Build a suitable binary](#build-a-suitable-binary)
-   [7 Launch GDB](#launch-gdb)

# Disclaimer

You know the drill: absolutely no warranty on this information
whatsoever. You might fry your Didj following these instructions. I'll
also add that I barely know how openocd and JTAG work. But my JTAG setup
seems to work okay.

# Introduction

The goal here is to be able to debug early boot code like lightning-boot
and u-boot. The plan is to get the JTAG on the Didj hooked up to my
[Olimex ARM-USB-OCD
dongle](http://www.sparkfun.com/commerce/product_info.php?products_id=7834)
or [Flyswatter](http://eLinux.org/Flyswatter "Flyswatter") talking to
[openocd](http://openocd.berlios.de/doc/html/index.html), which works
with gdb. Here we go.

# Connect your JTAG Dongle

[LeapFrog Pollux Platform JTAG
Pinouts](http://eLinux.org/LeapFrog_Pollux_Platform:_JTAG_Pinouts "LeapFrog Pollux Platform: JTAG Pinouts")

The connection between the device and your JTAG adapter may vary, please
consult your adapters documentation.

**NOTE: if you don't have a usb JTAG device, you can purchase a
[Flyswatter](http://eLinux.org/Flyswatter "Flyswatter") from
[TinCanTools](http://www.tincantools.com) for \$49.95**

# Build openocd

I'm using Ubuntu 9.04, which has a version of openocd. But I couldn't
get that version to talk to my Olimex dongle. So I built from source.
Note that I also had to build libftdi from source because the
Ubuntu/9.04 version was not current enough:

1.  Build libftdi:

<!-- -->

    wget http://www.intra2net.com/en/developer/libftdi/download/libftdi-0.17.tar.gz
    tar xvzf libftdi-0.17.tar.gz
    cd libftdi-0.17/
    ./configure --prefix /your/prefix
    make
    make install

1.  Grab and build openocd:

<!-- -->

    git clone git://openocd.git.sourceforge.net/gitroot/openocd/openocd
    cd openocd
    ./bootstrap
    ./configure --prefix=/your/prefix --enable-maintainer-mode --enable-ft2232_libftdi
    make
    make install

# Launch openocd

I used this config file, which I named openocd.cfg in my favorite
working directory. I put this together based on the openocd
documentation and examples in the source tree.

    source [find interface/olimex-arm-usb-ocd.cfg]
    # length of reset signal: [ms]
    jtag_nsrst_assert_width 100
    # don't talk to JTAG after reset for: [ms]
    jtag_nsrst_delay 250
    reset_config trst_and_srst separate
    # end reset config
    # reset_config trst_only
    if { [info exists CHIPNAME] } {
      set  _CHIPNAME $CHIPNAME
    } else {
      set  _CHIPNAME pollux
    }
    if { [info exists ENDIAN] } {
      set  _ENDIAN $ENDIAN
    } else {
      set  _ENDIAN little
    }
    if { [info exists CPUTAPID ] } {
      set _CPUTAPID $CPUTAPID
    } else {
      # force an error till we get a good number
      set _CPUTAPID 0x07926f0f
    }
    #jtag scan chain
    jtag newtap $_CHIPNAME cpu -irlen 4 -expected-id $_CPUTAPID
    set _TARGETNAME $_CHIPNAME.cpu
    target create $_TARGETNAME arm926ejs -endian $_ENDIAN -chain-position $_TARGETNAME -variant arm926ejs

Now you can launch it:

    LD_LIBRARY_PATH=/your/prefix/lib sudo /path/to/openocd -s /path/to/openocd/tcl/

Expect output something like this:

    Open On-Chip Debugger 0.5.0-dev-00257-gf40faeb (2010-05-26-17:39)
    Licensed under GNU GPL v2
    For bug reports, read
        http://openocd.berlios.de/doc/doxygen/bugs.html
    trst_only separate trst_push_pull
    Info : clock speed 6000 kHz
    Info : JTAG tap: pollux.cpu tap/device found: 0x07926f0f (mfg: 0x787, part: 0x7926, ver: 0x0)
    Info : Embedded ICE version 6
    Info : pollux.cpu: hardware has 2 breakpoint/watchpoint units

# Build a suitable binary

I built the vanilla lightning-boot from the leapfrog distribution adding
the -g option and disabling the -DSELF\_BOOTSTRAP and enabling -DDEBUG.
I happen to be using "gcc version 4.4.1 (Sourcery G++ Lite 2009q3-68)"
from [Code
Sourcery](http://www.codesourcery.com/sgpp/lite/arm/portal/release1033)

# Launch GDB

Now you should be able to launch gdb, load your image, set a break
point, and continue. First of all, here's the .gdbinit file that I'm
using:

    target remote localhost:3333
    exec-file /path/to/your/image
    symbol-file /path/to/your/image
    define reload
      monitor halt
      monitor soft_reset_halt
      load
    end

And now here's a transcript of how I launch gdb, load the image, set a
break point, step through a few lines of code, then continue:

    $ arm-none-eabi-gdb
    GNU gdb (Sourcery G++ Lite 2009q3-68) 6.8.50.20090630-cvs
    Copyright (C) 2009 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
    and "show warranty" for details.
    This GDB was configured as "--host=i686-pc-linux-gnu --target=arm-none-eabi".
    For bug reporting instructions, please see:
    <https://support.codesourcery.com/GNUToolchain/>.
    0x00000000 in ?? ()
    (gdb) reload
    requesting target halt and executing a soft reset
    target state: halted
    target halted in ARM state due to debug-request, current mode: Supervisor
    cpsr: 0x600000d3 pc: 0x00000000
    MMU: disabled, D-Cache: disabled, I-Cache: disabled
    Loading section .text, size 0x1528 lma 0x0
    Loading section .rodata, size 0x430 lma 0x1528
    Loading section .rodata.str1.1, size 0x69e lma 0x1958
    Start address 0x0, load size 8182
    Transfer rate: 31 KB/sec, 2727 bytes/write.
    (gdb) break main
    Breakpoint 1 at 0x1170: file main.c, line 278.
    (gdb) c
    Continuing.

    Breakpoint 1, main () at main.c:278
    278     BIT_SET(REG16(LF1000_UDC_BASE+UDC_PCR), PCE);
    (gdb) n
    267 {
    (gdb)
    278     BIT_SET(REG16(LF1000_UDC_BASE+UDC_PCR), PCE);
    (gdb)
    280     adc_init();
    (gdb) c
    Continuing.

...And on the serial console, you can see the debug lines, which
strongly suggests that I'm not simply booting from NAND:

    lightning-boot 1.0
    tfs: loaded summary 0x00000002 files
    Starting the kernel...
    Uncompressing Linux....................................................... done, booting the kernel.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

