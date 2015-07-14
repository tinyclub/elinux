> From: [eLinux.org](http://eLinux.org/Parallel_HDSpin_Up "http://eLinux.org/Parallel_HDSpin_Up")


# Parallel HDSpin Up



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
    -   [5.2 Case 2](#case-2)
    -   [5.3 Case 3](#case-3)

## Description

    - Hard drive spinup is one of the most costly operations during startup.
    - Can start HD in firmware prior to kernel load
    - Obviously, kernel can't reside on HD
      - Requires separate storage for kernel (and possibly other init programs)

## How to implement or use

[describe how to achieve the technique (config options, command args,
etc.)]

## Expected Improvement

The expected improvement in bootup times from using this technique
depends (of course) on the time is takes for the hard disk to spin up.
For some systems, the hard disk spinup time dominates the boot up time.
In this case, the time saved is approximately the time of the kernel
initialization.

<table>
<tbody>
<tr class="odd">
<td align="left"><strong>Brand</strong></td>
<td align="left"><strong>Size</strong></td>
<td align="left"><strong>Time to Ready</strong></td>
</tr>
<tr class="even">
<td align="left">Maxtor</td>
<td align="left">3.5&quot;</td>
<td align="left">7.5 seconds</td>
</tr>
<tr class="odd">
<td align="left">Seagate</td>
<td align="left">3.5&quot;</td>
<td align="left">6.5 - 10 seconds *</td>
</tr>
<tr class="even">
<td align="left">Hitachi</td>
<td align="left">3.5&quot;</td>
<td align="left">6 - 10 seconds *</td>
</tr>
<tr class="odd">
<td align="left">Hitachi</td>
<td align="left">2.5&quot;</td>
<td align="left">4 - 5 seconds</td>
</tr>
<tr class="even">
<td align="left">Toshiba</td>
<td align="left">2.5&quot;</td>
<td align="left">4 seconds</td>
</tr>
<tr class="odd">
<td align="left">Hitachi microdrive</td>
<td align="left">1.0&quot;</td>
<td align="left">1 - 1.5 seconds</td>
</tr>
</tbody>
</table>

-   depends on the number of platters

During retries, these times can be extended by 10's of seconds, but this
is rare.

## Resources

### Projects

### Specifications

### Patches

## Case Studies

### Case 1

### Case 2

### Case 3


