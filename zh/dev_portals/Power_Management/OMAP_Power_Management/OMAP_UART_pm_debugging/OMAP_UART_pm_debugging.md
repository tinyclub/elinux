> From: [eLinux.org](http://eLinux.org/OMAP_UART_pm_debugging "http://eLinux.org/OMAP_UART_pm_debugging")


# OMAP UART pm debugging



## Contents

-   [1 OMAP UART PM Debugging/Test
    Techniques](#omap-uart-pm-debugging-test-techniques)
    -   [1.1 HW Test setup](#hw-test-setup)
    -   [1.2 Required SW](#required-sw)
    -   [1.3 Test Application](#test-application)
    -   [1.4 Preparation for test](#preparation-for-test)
    -   [1.5 Testing Without PM](#testing-without-pm)
    -   [1.6 Testing with PM](#testing-with-pm)

# OMAP UART PM Debugging/Test Techniques

The onboard UART-controller can usually be tested via a loop-back
connection using a cable. However, when testing the behavior during
suspend/resume this is not feasible and an external platform having a
UART device is needed as a test stub.

The following describes such a setup and how it can be used for testing
UART HW flow control and wake-up.

Specifically this test setup was created to test the omap-serial UART
driver which was introduced in the kernel to enable some OMAP specific
features as eg. DMA and Power Management without cluttering the
previously used 8250 UART driver.

As of writing, the omap-serial driver configures the OMAP UART CTS pins
as wakeup-enabled.

## HW Test setup

[![Figure
1](http://eLinux.org/images/thumb/4/44/UART_pm_debugging_fig1.JPG/500px-UART_pm_debugging_fig1.JPG)](http://eLinux.org/File:UART_pm_debugging_fig1.JPG "Figure 1")
 **Figure 1**

Refer to [Figure
1](http://eLinux.org/File:UART_pm_debugging_fig1.JPG "File:UART pm debugging fig1.JPG").
The board on the left is a Zoom2, and the board on the right is a Zoom1.
The Zoom2 is the device we want to test. The Zoom1 is merely acting as a
test device and could in principle be replaced with any other platform
on which it is possible to control the UARTs RX/TX and RTS/CTS pins (eg.
a PC). Going forward, this guide will assume a Zoom1 is used.

An expansion card is plugged into the 200-pin expansion connector on
each of the 2 boards (see [Figure
2](http://eLinux.org/File:UART_pm_debugging_fig2.JPG "File:UART pm debugging fig2.JPG") -
the Zoom2 has been flipped upside-down). The reason for this is to
expose UART1 on the boards, which is otherwise not easily accessible.
The expansion boards are modified modem test boards, which have the
200-pin connector's UART1 RX/TX and RTS/CTS lines routed through an
RS232 driver and level converter. This exposes the UART1 as any normal
RS-232 interface.

[![Figure
2](http://eLinux.org/images/thumb/f/f6/UART_pm_debugging_fig2.JPG/600px-UART_pm_debugging_fig2.JPG)](http://eLinux.org/File:UART_pm_debugging_fig2.JPG "Figure 2")
 **Figure 2**


 **Note**. Make sure to remove any modem inserted in either zoom board
before testing. They also use UART1.

A null-modem cable (female-female, RX/TX and RTS/CTS lines crossed) is
used to interconnect the 2 expansion cards.

So, to sum up, here's the HW required for the setup:

-   1 Zoom2
-   1 Zoom1
-   2 Modem expansion cards
-   1 RS-232 null-modem cable

## Required SW

The device under test (Zoom2) needs to run the kernel with the UART
driver to be tested.

The omap-serial driver has to be enabled, if not already. So run make
menuconfig and enable it - also with console. The test description below
does not assume that DMA is enabled, but there is not reason it could
not be. On the Zoom2 kernel, also disable the 8250 serial driver.

The enabling/disabling of serial drivers can be found in menuconfig
under: device drivers-\>Char Drivers-\>Serial Drivers

The following text assumes that a kernel from the
*p-android-omap-2.6.29* branch on the APG sync-tree:
[http://git.omapzoom.org/?p=kernel/omap.git;a=summary](http://git.omapzoom.org/?p=kernel/omap.git;a=summary)
is used at commit ID not older than
*a0051763d5f04c0458689f0032b6f263d28a5e54*.


 The test device (Zoom1) can run any kernel, as long as the driver
allows for control of the RTS line on UART1. In this setup the control
is implemented as a sys-fs entry, which toggles the RTS output line of
the zoom1.

To accommodate this, the following changes were made to
drivers/serial/8250.c in the kernel:

[File:Zoom1 8250.patch](http://eLinux.org/File:Zoom1_8250.patch "File:Zoom1 8250.patch")

The patch is based of Android APG kernel, commit ID
*8e0ee43bc2c3e19db56a4adaa9a9b04ce885cd84*, available at
[http://android.git.kernel.org/?p=kernel/omap.git;a=summary](http://android.git.kernel.org/?p=kernel/omap.git;a=summary).


 **The sys-fs node is used like this:**
 Toggle the RTS output (using OMAP mux safe mode pull-up and pull-down):

     #echo 1 > /sys/devices/platform/serial8250.0/uart1_rts_toggle

Set the RTS pin to UART mode, to be used for normal HW flow control

     #echo 0 > /sys/devices/platform/serial8250.0/uart1_rts_toggle

**Note**
 The RTS line, when used for normal HW flow control, only
enables/disables the other device's ability to send data. It is
connected to the other device's CTS input. In this context, RTS stands
for: "Request To Send to me". When asserted, the other device can send
data. When de-asserted the other device is blocked from sending data.
Thus, if the purpose of the test solely is to test the other device
during power management (the Zoom2), the RTS pin can be put into safe
mode and toggled randomly on the Zoom1 without impacting the flow of
data to the Zoom2.

As for the file systems used, the following sections Android FS on the
Zoom2 and Busybox FS on the Zoom1.

To verify the operation of the RTS toggling, boot the Zoom1 and echo 1
into the sys-fs node, while scope-probing the physical RTS line shown on
[Figure
3](http://eLinux.org/index.php?title=File:MediaWiki:UART_pm_debugging_fig3.JPG&action=edit&redlink=1 "File:MediaWiki:UART pm debugging fig3.JPG (page does not exist)"),
which shows a detailed photo of the DB9 connector on the expansion card.
Remember that the RS-232 driver inverts the signal, so an assertion of
RTS, which is logical low on the OMAP, translates to a "high" signal on
the RS-232 cable.

[![figure
3](http://eLinux.org/images/thumb/e/e7/UART_pm_debugging_fig3.JPG/650px-UART_pm_debugging_fig3.JPG)](http://eLinux.org/File:UART_pm_debugging_fig3.JPG "figure 3")
 **Figure 3**

## Test Application

The purpose of the user-space test application is two-sided: Data needs
to be sent from the Zoom1 and the RTS pin needs to be toggled, and on
the Zoom2 side data needs to be received. Also, when sending data, the
application should be able to send sporadic burst to simulate the
behavior of eg. control data from a modem. This would help test some PM
aspects (eg. inactivity timeouts).

Using an existing UART test application written by TI developers in
India as basis, the above requirements could be fulfilled using the same
small application on both the Zoom1 and Zoom2 side. Depending on its
mode of operation (send/receive), the application can be configured
using command-line parameters.

The source code for the application ts\_uart is available here:

[File:Ts uart.tar.bz2](http://eLinux.org/File:Ts_uart.tar.bz2 "File:Ts uart.tar.bz2")

**Compilation**
 To compile for ARM and busybox file system, you need to specify the
location of your cross-compiler in the CROSS\_COMPILE environment
variable. Eg., after cd'ing to the source directory:

     #make CROSS_COMPILE=/usr/bin/arm-2009q1/bin/arm-none-linux-gnueabi ts_uart

To compile for use in the Google Android file system, as of writing, the
google compiler is required, since Android links up against its own
Bionic c libraries. To do this, copy the ts\_uart source dir into
/path/to/mydroid/external/

Then, to compile, cd to /path/to/mydroid and run:

     #make -j2 ts_uart

Look at the output logs to see where the executable is moved.

## Preparation for test

Deploy the ts\_uart test application to both the Zoom1 and Zoom2 file
systems - preferably in a dir that's included in the PATH variable.
Connect the boards as mentioned above with a null-modem cable.

To get console control of each board, one needs to have two serial
terminal emulators running on one's PC, eg. minicom. The two minicoms
each need to connect to the UART or USB port of the PC, that is wired to
the console UART port on each of the boards.

After boot-up, a the connection between the boards can be verified (if
needed) using a terminal emulator running on each board (eg. nanocom,
microcom, picocom, minicom). The source for these is available on the
internet, but needs to be compiled for ARM.

In the console, just connect each terminal emulator program to
/dev/ttyS0 at 115200 baud respectively. When typing something in one
terminal, it should appear in the other.

Also, have test file ready for transfer in the same directory as the
ts\_uart directory on the Zoom1. Any file can be used, but it should be
something that can easily be checked for integrity afterwards, like eg,
a PDF file. Currently the application does not support any data
validation upon transfer, so a manual method is needed.



## Testing Without PM

The first test should be without power management on the Zoom2 (more
specifically, without retention and OFF mode) enabled.

To see a help screen listing the parameters to ts\_uart, just cd to its
dir and run it without parameters:

     #ts_uart

**On the Zoom2:**
 Configure ts\_uart for receiving data into sample.file at 115200 baud
with flow control enabled:

     #ts_uart ts_uart r sample.file 115200 1 0 0

The last 2 parameters are just dummies, when receiving data.

**On the Zoom1:**
 Before the ts\_uart receive on the Zoom2 times out (about 10 seconds),
configure ts\_uart on Zoom1 for sending data from sample.file at 115200
baud with flow control enabled:

     #ts_uart ts_uart s sample.file 115200 1 0 0

When sending, the last two parameters do take effect. In this case, no
delay between bursts or random data burst size is set, so ts\_uart will
transmit data at maximum speed (the given baud rate).

Note: As of now, the ts\_uart application always sends/receives on
/dev/ttyS0.

The sample.file should transfer, and a confirmation log should be
printed in the console on both sending and receiving side. Even if it
the number of bytes sent and received is identical, it is sensible to
check for data validity.

Since neither OFF or Retention mode has been enabled, the Zoom2 does not
fall into low power states. The only power-saving feature that could
kick in is the cpu idle thread after some inactivity timer expires. As
of writing this, however, when DMA is disabled, this timer is reset upon
each received interrupt on the RX pin. If DMA is enabled, the timer is
reset after a given DMA timeout, if there is still data in the RX FIFO.

Thus, while data is being transferred continuously, the Zoom2 idle
thread never kicks in.

Try changing the ts\_uart parameters for the Zoom1 to the following and
re-run the test:

     #ts_uart ts_uart s sample.file 115200 1 6 1

The last 2 parameters now introduce a random delay between each buffer
sent up to 6 seconds and also randomly changes the size of the buffer
being sent between 0-4096 bytes.

If printk()s were placed in omap\_uart\_idle() function in the Zoom2
kernel, one would see that the idle thread kicks in between data bursts.
The active state is then resumed upon receipt of RX data, and the
inactivity timer is reset.

## Testing with PM

Enable the OFF mode or Retention transitions during idle for the Zoom2:

     #echo 1 > /sys/power/sleep_while_idle

Issue the following, or press the "OFF" button on the keypad on the
Zoom2:

     #echo -n "mem" > /sys/power/state

This suspends the board. It's possible to wake it up again either by
pressing a keypad or by typing something in the console. Another way of
waking it up is by toggling the CTS line, which is what the ts\_uart
test application will do.

Now then, rerun the same test as above.

**On the Zoom2:**

     #ts_uart ts_uart r sample.file 115200 1 0 0

**On the Zoom1:**

     #ts_uart ts_uart s sample.file 115200 1 9 1

The random delay between burst is now up to 9 seconds. Furthermore, when
a delay other than 0 is set, the RTS line of the Zoom1 (that is, the CTS
line of Zoom2) is toggled before each data burst is transmitted to the
Zoom2. The line is toggled in ts\_uart using the previously mentioned
sysfs interface uart1\_toggle\_rts. Because the current omap-serial
driver has CTS wakeups enabled, the toggling of the CTS line on the
Zoom2 will wake-up the board from suspend. Thus, the Zoom2 will be in
active state and ready to receive the data.

However, a problem was reported regarding the state of the RTS pin on
the Zoom2. It was found that the RTS, which should be de-asserted by
hardware when the device goes to retention or OFF, was not de-asserted
when the board went into low power modes. This resulted in lost data,
since the sending device saw an asserted Zoom2 RTS, and for HW flow
control that means that the Zoom2 is ready to receive data when it is
not.

A software workaround was introduced to "manually" de-assert the RTS
line in the omap-serial driver, when a driver shutdown was initialized
based on an active to low-power transition. This was done by putting the
pin into mux SAFE mode. The pin would be returned to normal UART mode
when leaving the low-power state.

The patch needed for this has been ported to the p-android-omap-2.6.29
branch:

[File:Auto rts.patch](http://eLinux.org/File:Auto_rts.patch "File:Auto rts.patch")

The expected result when doing this transfer is that the delay between
each burst should allow the Zoom2 to suspend, after which it will wake
up when its CTS line is toggled by the Zoom1, thus enabling the Zoom1 to
send data.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")

