> From: [eLinux.org](http://eLinux.org/Flyswatter_Windows_How_To "http://eLinux.org/Flyswatter_Windows_How_To")


# Flyswatter Windows How To



This guide will walk you through connecting the
[Flyswatter](http://www.tincantools.com/product.php?productid=16134&cat=249&page=1)
and the Beagleboard to your Windows PC, and installing and running
[OpenOCD](http://eLinux.org/OpenOCD "OpenOCD"). This guide was tested with Windows XP and
Windows 7. Instructions are identical on 32-bit and 64-bit versions of
Windows unless otherwise noted.



## Contents

-   [1 Connecting the Flyswatter and the
    Beagleboard](#connecting-the-flyswatter-and-the-beagleboard)
    -   [1.1 Connect the RS-232 adapter board to the
        Flyswatter.](#connect-the-rs-232-adapter-board-to-the-flyswatter)
    -   [1.2 Connect the 10-pin cable to the
        Flyswatter.](#connect-the-10-pin-cable-to-the-flyswatter)
    -   [1.3 Connect the other end of the cable to the
        Beagleboard.](#connect-the-other-end-of-the-cable-to-the-beagleboard)
    -   [1.4 Connect the JTAG adapter board to the
        Flyswatter.](#connect-the-jtag-adapter-board-to-the-flyswatter)
    -   [1.5 Connect the Flyswatter and the Beagleboard with the JTAG
        cable.](#connect-the-flyswatter-and-the-beagleboard-with-the-jtag-cable)
    -   [1.6 Connect the USB cable to the
        Flyswatter.](#connect-the-usb-cable-to-the-flyswatter)
    -   [1.7 Connect the power supply to the
        Beagleboard.](#connect-the-power-supply-to-the-beagleboard)
    -   [1.8 Plug the power cable into a surge protector or wall
        outlet.](#plug-the-power-cable-into-a-surge-protector-or-wall-outlet)
    -   [1.9 Plug the USB cable into your PC's USB
        port.](#plug-the-usb-cable-into-your-pc-s-usb-port)
-   [2 Installing OpenOCD](#installing-openocd)
    -   [2.1 Windows 7](#windows-7)
    -   [2.2 Windows XP](#windows-xp)
-   [3 Running OpenOCD](#running-openocd)
    -   [3.1 JTAG-DP\-STICKY\-ERROR on
        startup](#jtag-dp-sticky-error-on-startup)
    -   [3.2 JTAG Tap Unexpected Errors](#jtag-tap-unexpected-errors)
    -   [3.3 Troubleshooting](#troubleshooting)
    -   [3.4 Telnet Connection](#telnet-connection)
-   [4 Common OpenOCD Commands](#common-openocd-commands)
    -   [4.1 reset](#reset)
    -   [4.2 halt](#halt)
    -   [4.3 halt *[timeout]*](#halt-timeout)
    -   [4.4 resume](#resume)
    -   [4.5 reg](#reg)
    -   [4.6 reg *[entry]*](#reg-entry)
    -   [4.7 reg *[entry] [value]*](#reg-entry-value)
-   [5 GDB Debugger](#gdb-debugger)

# Connecting the Flyswatter and the Beagleboard

To hook up the Flyswatter and the Beagleboard, you will need:

-   **Flyswatter**
    -   USB Male A/Male B cable
    -   14-pin JTAG Ribbon Cable
-   **Beagleboard**
    -   5V1A Power Supply
-   **Beagleboard Adapter Kit** ([product
    link](http://www.tincantools.com/product.php?productid=16144&cat=249&page=1))
    -   JTAG Adapter Board
    -   RS-232 Adapter Board
    -   10-pin Ribbon Cable

The cables listed under the Flyswatter ship with the
[Flyswatter](http://www.tincantools.com/product.php?productid=16134&cat=249&page=1).



## Connect the RS-232 adapter board to the Flyswatter.

Take the RS-232 adapter board provided in the Beagleboard adapter kit,
and connect it to the Flyswatter's serial UART interface.

[![Flyswatter
RS232adapter.png](http://eLinux.org/images/d/d2/Flyswatter_RS232adapter.png)](http://eLinux.org/File:Flyswatter_RS232adapter.png)



## Connect the 10-pin cable to the Flyswatter.

The adapter board above allows you to connect the 10-pin ribbon cable in
the Beagleboard adapter kit to the Flyswatter. Do that now. Pay careful
attention to the position of the red stripe. The red stripe should line
up with the "1" printed on the adapter board, as in the picture below.

[![Flyswatter
RS232cable.png](http://eLinux.org/images/1/19/Flyswatter_RS232cable.png)](http://eLinux.org/File:Flyswatter_RS232cable.png)



## Connect the other end of the cable to the Beagleboard.

Connect the 10-pin RS-232 cable to the pins to the side of the
Beagleboard, the ones next to the power adapter. Make sure the cable is
correctly centered over the pins, and again pay attention to the red
stripe. It should match up with the "1" printed on the Beagleboard.

[![Both RS232.png](http://eLinux.org/images/1/11/Both_RS232.png)](http://eLinux.org/File:Both_RS232.png)



## Connect the JTAG adapter board to the Flyswatter.

Find the JTAG adapter board included in the Beagleboard adapter kit, and
plug it into the Flyswatter's JTAG interface. The adapter board should
hang out over the edge of the Flyswatter.

[![Flyswatter
jtagadapter.png](http://eLinux.org/images/7/77/Flyswatter_jtagadapter.png)](http://eLinux.org/File:Flyswatter_jtagadapter.png)



## Connect the Flyswatter and the Beagleboard with the JTAG cable.

Find the 14-pin JTAG ribbon cable that comes with the Flyswatter.
Connect one end to the JTAG adapter board, and the other end to the
diagonal pins on the Beagleboard. Make sure the red stripe lines up with
the "1" printed next to the pins on the Beagleboard, like in the
picture.

[![Bothcables.png](http://eLinux.org/images/3/3e/Bothcables.png)](http://eLinux.org/File:Bothcables.png)



## Connect the USB cable to the Flyswatter.

Find the USB cable that comes with the Flyswatter. Connect the B end
(the square end, not the flat end) to the Flyswatter.

[![Flyswatter
usb.png](http://eLinux.org/images/2/2a/Flyswatter_usb.png)](http://eLinux.org/File:Flyswatter_usb.png)



## Connect the power supply to the Beagleboard.

Connect the 5V1A power supply to the Beagleboard. (Your power supply may
not look exactly like the one pictured.)

[![Beagle
power.png](http://eLinux.org/images/2/20/Beagle_power.png)](http://eLinux.org/File:Beagle_power.png)



## Plug the power cable into a surge protector or wall outlet.

Green LEDs should light up on the Beagleboard to indicate that it is
receiving power.

[![Both
beaglelit.png](http://eLinux.org/images/b/b1/Both_beaglelit.png)](http://eLinux.org/File:Both_beaglelit.png)



## Plug the USB cable into your PC's USB port.

You should see the green outermost LED on the Flyswatter light up, to
indicate that the Flyswatter is receiving power through the USB
connection.

[![Both lit.png](http://eLinux.org/images/e/e3/Both_lit.png)](http://eLinux.org/File:Both_lit.png)



# Installing OpenOCD

[OpenOCD](http://eLinux.org/OpenOCD "OpenOCD") (Open On-Chip Debugger) is open-source
software that interfaces with the Flyswatter. OpenOCD provides debugging
and in-system programming for embedded target devices. You will need to
compile OpenOCD yourself by following one of these guides.

### Windows 7

[Compiling OpenOCD
Win7](http://eLinux.org/Compiling_OpenOCD_Win7 "Compiling OpenOCD Win7")

[Compiling OpenOCD Win7
D2XX](http://eLinux.org/Compiling_OpenOCD_Win7_D2XX "Compiling OpenOCD Win7 D2XX")

Also use one of these guides for Windows Vista.

### Windows XP

[Compiling OpenOCD
WinXP](http://eLinux.org/Compiling_OpenOCD_WinXP "Compiling OpenOCD WinXP")

[Compiling OpenOCD WinXP
D2XX](http://eLinux.org/Compiling_OpenOCD_WinXP_D2XX "Compiling OpenOCD WinXP D2XX")


 The first set of instructions uses libFTDI, an open-source driver
library for FTDI devices. The second set uses FTD2XX, a closed-source
driver library from [Future Technology Devices
International](http://www.ftdichip.com/).



# Running OpenOCD

Now you are ready to run OpenOCD. Open a command line window; if you're
not sure how to do this, see [Running OpenOCD on
Windows](http://eLinux.org/Running_OpenOCD_on_Windows "Running OpenOCD on Windows").
Navigate to the folder containing **openocd.exe** (the **openocd-bin**
folder you created in the compile guide) and type:

    cd C:\openocd-bin
    openocd -f interface/flyswatter.cfg -f board/ti_beagleboard.cfg -c init -c "reset init"


 For more information, see [Running OpenOCD on
Windows](http://eLinux.org/Running_OpenOCD_on_Windows "Running OpenOCD on Windows"). When
you start OpenOCD, its output should look like this:

[![Beagle startup
win.png](http://eLinux.org/images/6/6e/Beagle_startup_win.png)](http://eLinux.org/File:Beagle_startup_win.png)



## JTAG-DP\_STICKY\_ERROR on startup

The *-c init -c "reset init"* commands in the OpenOCD startup are a
workaround for a bug in OpenOCD that affects the Beagleboard and [TI
Beagleboard XM](http://beagleboard.org/static/BBxMSRM_latest.pdf). If
you start OpenOCD without these commands, you will see errors like this:

[![Beagle startup err
win.png](http://eLinux.org/images/d/dd/Beagle_startup_err_win.png)](http://eLinux.org/File:Beagle_startup_err_win.png)

If you see these errors, then the next time you try to start OpenOCD it
will give an error the next time it tries to communicate with the
Beagleboard. When you exit OpenOCD you will need to disconnect and
reconnect the power cable to the Flyswatter before OpenOCD will be able
to communicate with the Beagleboard again.


## JTAG Tap Unexpected Errors

On startup you may sometimes encounter this error:

    Info : JTAG tap: omap3530.jrc tap/device found: 0x000000ff (mfg: 0x07f, part: 0x0000, ver: 0x0)
    Warn : JTAG tap: omap3530.jrc       UNEXPECTED: 0x000000ff (mfg: 0x07f, part: 0x0000, ver: 0x0)
    Error: JTAG tap: omap3530.jrc  expected 1 of 1: 0x0b7ae02f (mfg: 0x017, part: 0xb7ae, ver: 0x0)

This output means OpenOCD has failed to initialize the JTAG chain. The
*-c init -c "reset init"* commands are a partial workaround for this
error. Look for the following line later in the output:

     Info : JTAG tap: omap3530.jrc tap/device found: 0x0b7ae02f (mfg: 0x017, part: 0xb7ae, ver: 0x0)

If you see this line, everything is fine.


## Troubleshooting

Getting OpenOCD to initialize JTAG correctly with the Beagleboard is
sometimes difficult. If you are having difficulties beyond those
described above, consult the troubleshooting page below.

**[Beagleboard Troubleshooting: JTAG Tap
Unexpected](http://eLinux.org/Beagleboard_Troubleshooting:_JTAG_Tap_Unexpected "Beagleboard Troubleshooting: JTAG Tap Unexpected")**



## Telnet Connection

You cannot enter commands directly to OpenOCD. Open a new command window
and type:

    telnet localhost 4444

You will should see this prompt:

[![Telnet win.png](http://eLinux.org/images/2/29/Telnet_win.png)](http://eLinux.org/File:Telnet_win.png)

You can give commands to OpenOCD through this prompt. If you don't see
the prompt on Windows 7, you may need to enable the Telnet client. See
[Configuring Windows 7 for
OpenOCD](http://eLinux.org/Configuring_Windows_7_for_OpenOCD "Configuring Windows 7 for OpenOCD").



# Common OpenOCD Commands

To see a full list of OpenOCD commands, enter *help* in the telnet
window.

## reset

Resets the Beagleboard. The output of the Reset command should look like
this:

[![Beagle reset
win.png](http://eLinux.org/images/f/f3/Beagle_reset_win.png)](http://eLinux.org/File:Beagle_reset_win.png)

## halt

Sends a halt request to the Beagleboard. If the Beagleboard halts, you
will see text output in the telnet window. (If the Beagleboard is
already halted, you will see no output.)

[![Beagle halt
win.png](http://eLinux.org/images/b/bb/Beagle_halt_win.png)](http://eLinux.org/File:Beagle_halt_win.png)

## halt *[timeout]*

You can also use *halt* followed by a time in milliseconds. OpenOCD
waits for the target to halt the specified amount of time, then gives up
if the target has not halted. You can use this to avoid OpenOCD hanging
because the Beagleboard fails to halt. For example, to send a *halt*
command with a timeout of one second, type:

    halt 1000

## resume

Enter *resume* to end a halt. You will not see any text output in the
telnet window.

## reg

Displays a numbered list of all of the Beagleboard's registers.

[![Beagle reg
win.png](http://eLinux.org/images/9/98/Beagle_reg_win.png)](http://eLinux.org/File:Beagle_reg_win.png)

## reg *[entry]*

Run *reg* with a register number to display the contents of a register,
in hexadecimal. The register number corresponds to the output of the
*reg* command with no arguments, above. You must run the *halt* command
before reading registers.

[![Beagle reg0
win.png](http://eLinux.org/images/d/d9/Beagle_reg0_win.png)](http://eLinux.org/File:Beagle_reg0_win.png)

If you run *reg* while the Beagleboard is not halted, you will still see
the value stored in the register. However, registers change contents
very quickly while the device is running; by the time you see the value,
the value actually in the register may be different. If you try to run
*reg* while the device is not halted, you will see this:

[![Beagle reg0 nothalted
win.png](http://eLinux.org/images/1/18/Beagle_reg0_nothalted_win.png)](http://eLinux.org/File:Beagle_reg0_nothalted_win.png)



## reg *[entry] [value]*

Sets the value of a register. The register number corresponds to the
output of the *reg* command with no arguments, above. Make sure the
Beagleboard is halted (with the *halt* command) before you change the
value of a register!

You can enter registry values in either decimal, by typing a number by
itself, or in hexadecimal, by prefacing the value with *0x*.

[![Beagle regset
win.png](http://eLinux.org/images/8/8c/Beagle_regset_win.png)](http://eLinux.org/File:Beagle_regset_win.png)



# GDB Debugger

GDB, the GNU Project Debugger is a debugging tool provided with the GNU
Compiler Collection (GCC). GDB allows you to stop and start a running
program, examine its functioning, and make changes. To install and use
GDB with OpenOCD, follow the instructions on the [Windows GDB
Debugger](http://eLinux.org/Windows_GDB_Debugger "Windows GDB Debugger") page below.

[Windows GDB Debugger](http://eLinux.org/Windows_GDB_Debugger "Windows GDB Debugger")

The GDB debugger page will walk you through installing GDB for use with
OpenOCD, and loading and testing a simple program.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [OpenOCD](http://eLinux.org/Category:OpenOCD "Category:OpenOCD")
-   [BeagleBoard](http://eLinux.org/Category:BeagleBoard "Category:BeagleBoard")
-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")

