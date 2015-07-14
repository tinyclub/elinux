> From: [eLinux.org](http://eLinux.org/Disable_Console "http://eLinux.org/Disable_Console")


# Disable Console



## Contents

-   [1 Description](#description)
-   [2 How to implement or use](#how-to-implement-or-use)
-   [3 Expected Improvement](#expected-improvement)
-   [4 Resources](#resources)
    -   [4.1 Projects](#projects)
    -   [4.2 Specifications](#specifications)
    -   [4.3 Patches](#patches)
-   [5 Case Studies](#case-studies)
    -   [5.1 Case 1](#case-1)
-   [6 Case 2](#case-2)

## Description

You can save time during kernel bootup by disabling the console output.
The easiest way to do this is to use the "quiet" option on the kernel
command line (described below).

Printk output is usually directed to a serial port or a VGA console
during bootup. By disabling console output, the time taken to output the
characters (and perform things like software scrolling of the display
buffer) is eliminated.

## How to implement or use

To disable console output during kernel bootup, use the "quiet" option
on the kernel command line.

To do this, just put the word "quiet" (without the quotes) in the kernel
command line, with no other arguments. This will suppress printk output
during booting. Note that printk messages are still buffered in the
kernel and can be retrieved after booting using the "dmesg" command.

## Expected Improvement

This saves time during kernel bootup by suppressing printk output.
Printk output delays depend on a number of factors, but in the use cases
cited below, the savings were in the range of a few hundred
milliseconds.

With a serial console, the time to output characters is dependent on the
serial port speed. However, with a VGA console, the time to output the
characters is dependent on the speed of the processor. Therefore, the
slower your processor, the more savings you will gain from this
technique.

## Resources

### Projects

None

### Specifications

None

### Patches

None

## Case Studies

### Case 1

Hardware

KMC SH board, using VGA console

Kernel Version

CELF-1 (040126)

Configuration

relatively small configuration (*details not available*)

Time without "quiet" option

637878 usec

Time with "quiet" option

461893 usec

Time savings

176 milliseconds

From data submitted by Maruyama Kiyoyasu of Mitsubishi.

## Case 2

Hardware

TI OMAP board, using serial console

Kernel Version

CELF-1 (040126)

Configuration

Kernel booted with XIP, CRAMFS root file system, with preset-LPJ

Time without "quiet" option

551735 usec

Time with "quiet" option

280676 usec

Time savings

271 milliseconds

From data submitted by Noboru Wakabayashi of Hitachi.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

