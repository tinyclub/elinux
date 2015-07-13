> From: [eLinux.org](http://eLinux.org/Bringing_CAN_interface_up "http://eLinux.org/Bringing_CAN_interface_up")


# Bringing CAN interface up



## Contents

-   [1 Introduction](#introduction)
-   [2 Virtual Interfaces](#virtual-interfaces)
-   [3 Native Interfaces](#native-interfaces)
-   [4 SLCAN based Interfaces](#slcan-based-interfaces)

### Introduction

SocketCAN provides several CAN interface types:

-   virtual interfaces like vcan0
-   native (real hardware) interfaces like can0
-   SLCAN based interfaces like slcan0

### Virtual Interfaces

Virtual CAN interfaces will be brought up via iproute2 ip utility:

     $ modprobe vcan
     $ sudo ip link add dev vcan0 type vcan
     $ sudo ip link set up vcan0

modprobe is needed in the case the driver is sill not loaded.

### Native Interfaces

In most cases you won't need to load the kernel driver for your real
hardware. So let us concentrate on ip invocation:

     $ sudo ip link set can0 type can bitrate 125000
     $ sudo ip link set up can0

Aside from bringing interface up it is important to specify bitrate
(assumes that CONFIG\_CAN\_CALC\_BITTIMING is enabled in kernel)

### SLCAN based Interfaces

SLCAN based device provide a serial interface. At first you'll need a
special daemon (slcand from can-utils), that will link this serial
interface with a virtual CAN device. By default these devices get slcan
name base. This is an example for a USB-to-CAN adapter working at
3Mbit/s:

     $ sudo slcand -o -s8 -t hw -S 3000000 /dev/ttyUSB0
     $ sudo ip link set up slcan0

So far there is no way to set bitrate for SLCAN based devices via ip
tool, so you'll have to do this by slcand invocation: -sX parameter. -s8
in the above example will set adapter's bitrate to 1Mbit/s. See the
table below for further CAN bitrates:

<table>
<thead>
<tr class="header">
<th align="left">ASCII Command</th>
<th align="left">CAN Bitrate</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">S0</td>
<td align="left">10 Kbit/s</td>
</tr>
<tr class="even">
<td align="left">S1</td>
<td align="left">20 Kbit/s</td>
</tr>
<tr class="odd">
<td align="left">S2</td>
<td align="left">50 Kbit/s</td>
</tr>
<tr class="even">
<td align="left">S3</td>
<td align="left">100 Kbit/s</td>
</tr>
<tr class="odd">
<td align="left">S4</td>
<td align="left">125 Kbit/s</td>
</tr>
<tr class="even">
<td align="left">S5</td>
<td align="left">250 Kbit/s</td>
</tr>
<tr class="odd">
<td align="left">S6</td>
<td align="left">500 Kbit/s</td>
</tr>
<tr class="even">
<td align="left">S7</td>
<td align="left">800 Kbit/s</td>
</tr>
<tr class="odd">
<td align="left">S8</td>
<td align="left">1000 Kbit/s</td>
</tr>
</tbody>
</table>


