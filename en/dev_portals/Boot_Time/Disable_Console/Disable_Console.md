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

<table border="1">
<tr>
<th>Hardware
</th>
<td>KMC SH board, using VGA console
</td></tr>
<tr>
<th>Kernel Version
</th>
<td>CELF-1 (040126)
</td></tr>
<tr>
<th>Configuration
</th>
<td>relatively small configuration (<i>details not available</i>)
</td></tr>
<tr>
<th>Time without "quiet" option
</th>
<td>637878 usec
</td></tr>
<tr>
<th>Time with "quiet" option
</th>
<td>461893 usec
</td></tr>
<tr>
<th>Time savings
</th>
<td>176 milliseconds
</td></tr></table>
<p>From data submitted by Maruyama Kiyoyasu of Mitsubishi.
</p>

## Case 2

<table border="1">
<tr>
<th>Hardware
</th>
<td>TI OMAP board, using serial console
</td></tr>
<tr>
<th>Kernel Version
</th>
<td>CELF-1 (040126)
</td></tr>
<tr>
<th>Configuration
</th>
<td>Kernel booted with XIP, CRAMFS root file system, with preset-LPJ
</td></tr>
<tr>
<th>Time without "quiet" option
</th>
<td>551735 usec
</td></tr>
<tr>
<th>Time with "quiet" option
</th>
<td>280676 usec
</td></tr>
<tr>
<th>Time savings
</th>
<td>271 milliseconds
</td></tr></table>

From data submitted by Noboru Wakabayashi of Hitachi.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

