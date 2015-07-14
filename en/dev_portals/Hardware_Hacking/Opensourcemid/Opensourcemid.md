> From: [eLinux.org](http://eLinux.org/Opensourcemid "http://eLinux.org/Opensourcemid")


# Opensourcemid



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 K7](#k7)
    -   [1.2 K7 mainboard](#k7-mainboard)
    -   [1.3 Optional module - E380](#optional-module-e380)
    -   [1.4 Optional module - E300](#optional-module-e300)
    -   [1.5 Optional module - W338](#optional-module-w338)
-   [2 Android](#android)
    -   [2.1 How to update the Android](#how-to-update-the-android)
    -   [2.2 How to compile the Android
        source](#how-to-compile-the-android-source)
    -   [2.3 How to use the USB device port as the UART debug
        port](#how-to-use-the-usb-device-port-as-the-uart-debug-port)
-   [3 WinCE](#wince)
    -   [3.1 How to update the WinCE](#how-to-update-the-wince)

# Introduction

OpenSourceMID.org is founded by a group of engineers enthusiastic in
modern technologies and open source software development and sponsored
by Timll Technic Inc. in China. It is an open community to provide
support and discussions for K7 MID or any other open source MID projects
through this website.

OpenSourceMID.org, itself, is an Open Source project. This means, first,
that we offer not only a product but a process, and second, that we
depend upon the contributions of developers and endusers to make that
process happen. The easiest way for you to help us out is to join the
overall OpenSourceMID.org project by join OpenSourceMID Community.

## K7

[![Opensourcemidk7.jpg](http://eLinux.org/images/6/6e/Opensourcemidk7.jpg)](http://eLinux.org/File:Opensourcemidk7.jpg)

 K7 MID is a low-cost, high-performance handheld Mobile Internet Device
featuring Texas Instruments' OMAP3530 ARM Cortex-A8 core processor with,
wireless connectivity, touch screen control, GPS navigation systems and
integrated power management with battery backup. It can support for both
Android and WinCE operating systems and would be a complete solution
that addresses all of the user's multimedia and communication needs on a
single platform.

K7 schematic: [Click here to
download](http://opensourcemid.googlecode.com/files/K7_schematic.pdf)
 K7 MID operation manual:
[Click here to download
(English)](http://opensourcemid.googlecode.com/files/K7_MID_Operation_Manual_EN.pdf)
 [Click here to download
(Chinese)](http://www.elinux.org/images/f/f2/K7_Operation_Manual_cn.pdf)

## K7 mainboard

[![K7PCB1.jpg](http://eLinux.org/images/2/26/K7PCB1.jpg)](http://eLinux.org/File:K7PCB1.jpg)
 [![K7PCB.jpg](http://eLinux.org/images/d/d9/K7PCB.jpg)](http://eLinux.org/File:K7PCB.jpg)

<table>
<tbody>
<tr class="odd">
<td align="left"><strong>Number</strong></td>
<td align="left"><strong>Chip</strong></td>
<td align="left"><strong>Description</strong></td>
<td align="left"><strong>Datasheet</strong></td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">OMAP3530</td>
<td align="left">The Processor</td>
<td align="left"><a href="http://elinux.org/File:OMAP3530-datasheet.pdf" title="File:OMAP3530-datasheet.pdf">File:OMAP3530-datasheet.pdf</a></td>
</tr>
<tr class="odd">
<td align="left">2</td>
<td align="left">MT29C2G48MAKLCJA-6IT</td>
<td align="left">256MB NAND Flash + 256MB SDRAM</td>
<td align="left"><a href="http://elinux.org/File:MT29CxGxxMAxxxJA-6IT.pdf" title="File:MT29CxGxxMAxxxJA-6IT.pdf">File:MT29CxGxxMAxxxJA-6IT.pdf</a></td>
</tr>
<tr class="even">
<td align="left">3</td>
<td align="left">TPS65930</td>
<td align="left">Power Management</td>
<td align="left"><a href="http://elinux.org/File:TPS65930-datasheet.pdf" title="File:TPS65930-datasheet.pdf">File:TPS65930-datasheet.pdf</a></td>
</tr>
<tr class="odd">
<td align="left">4</td>
<td align="left">GSC3f/LPx</td>
<td align="left">GPS Chip</td>
<td align="left"><a href="http://elinux.org/File:GSC3f-datasheet.pdf" title="File:GSC3f-datasheet.pdf">File:GSC3f-datasheet.pdf</a></td>
</tr>
<tr class="even">
<td align="left">5</td>
<td align="left">USB3320</td>
<td align="left">High Speed USB Transceiver</td>
<td align="left"><a href="http://elinux.org/File:USB3320-datasheet.pdf" title="File:USB3320-datasheet.pdf">File:USB3320-datasheet.pdf</a></td>
</tr>
<tr class="odd">
<td align="left">6</td>
<td align="left">FE1.1</td>
<td align="left">USB 2.0 High Speed 4-Port Hub Controller</td>
<td align="left"><a href="http://elinux.org/File:FE11-datasheet.pdf" title="File:FE11-datasheet.pdf">File:FE11-datasheet.pdf</a></td>
</tr>
<tr class="even">
<td align="left">7</td>
<td align="left">APW7093</td>
<td align="left">Step Down DC/DC Regulator</td>
<td align="left"><a href="http://elinux.org/File:APW7093-datasheet.pdf" title="File:APW7093-datasheet.pdf">File:APW7093-datasheet.pdf</a></td>
</tr>
<tr class="odd">
<td align="left">8</td>
<td align="left">TPS61032</td>
<td align="left">Synchronous Boost Converter</td>
<td align="left"><a href="http://elinux.org/File:TPS61032-datasheet.pdf" title="File:TPS61032-datasheet.pdf">File:TPS61032-datasheet.pdf</a></td>
</tr>
<tr class="even">
<td align="left">9</td>
<td align="left">BQ24070</td>
<td align="left">Single-Chip Charge and System Power-Path Management IC</td>
<td align="left"><a href="http://elinux.org/File:BQ24070-datasheet.pdf" title="File:BQ24070-datasheet.pdf">File:BQ24070-datasheet.pdf</a></td>
</tr>
<tr class="odd">
<td align="left">10</td>
<td align="left">MMA8450Q</td>
<td align="left">3-Axis, 8-bit/12-bit Digital Accelerometer</td>
<td align="left"><a href="http://elinux.org/File:MMA8450Q.pdf" title="File:MMA8450Q.pdf">File:MMA8450Q.pdf</a></td>
</tr>
<tr class="even">
<td align="left">11</td>
<td align="left">74ALVC164245</td>
<td align="left">16-bit Dual Supply Translating Transciever</td>
<td align="left"><a href="http://elinux.org/File:74ALVC164245-datasheet.pdf" title="File:74ALVC164245-datasheet.pdf">File:74ALVC164245-datasheet.pdf</a></td>
</tr>
<tr class="odd">
<td align="left">12</td>
<td align="left">WG7310</td>
<td align="left">WLAN+BT+FM Module</td>
<td align="left"><a href="http://elinux.org/File:WG7310-datasheet.pdf" title="File:WG7310-datasheet.pdf">File:WG7310-datasheet.pdf</a></td>
</tr>
<tr class="even">
<td align="left">13</td>
<td align="left">TSC2046</td>
<td align="left">Touch Screen Controller</td>
<td align="left"><a href="http://elinux.org/File:TSC2046-datasheet.pdf" title="File:TSC2046-datasheet.pdf">File:TSC2046-datasheet.pdf</a></td>
</tr>
<tr class="odd">
<td align="left">14</td>
<td align="left">LM4890</td>
<td align="left">1 Watt Audio Power Amplifier</td>
<td align="left"><a href="http://elinux.org/File:LM4890-datasheet.pdf" title="File:LM4890-datasheet.pdf">File:LM4890-datasheet.pdf</a></td>
</tr>
</tbody>
</table>

## Optional module - E380

[![OpentionalmoduleE380.JPG](http://eLinux.org/images/9/95/OpentionalmoduleE380.JPG)](http://eLinux.org/File:OpentionalmoduleE380.JPG)

 E380 is a Mini PCI-E 3G wireless communication card based on EV-DO
Rev.A standard，it is applicable to CDMA 2000 1x and EVDO network，it
supports CDMA 800MHz and 1900MHz frequency band，it can achieve global
roaming.

 Product features:
 Size: 51mm(L)\*30mm(W)\*2.3mm(T)
 Working voltage: 3.3 - 3.8V DC
 Dual-antenna interface, support diversity antenna
 Support CDMA 2000 1x ，EV-DO Rev.0，EV-DO Rev.A
 Support CDMA 800/S1900 MHz


Performance parameters:
 Maximum output power: (Class III) BAND CLASS 0 (800/1900MHz)：+23dBm
 Minimum controlled output power: \<-50dBm
 Sensitivity: \<-104dBm (FER≤0.5％)
 Spurious maximum output power: 900kHz: \<-42dBc/30kHz 1.98MHz:
\<-54dBc/30kHz
 Support high-speed data services
 CDMA 1x UL：153.6kbit/s(Peak) DL：153.6kbit/s(Peak)
 EVDO Rev.0 UL：153.6kbit/s(Peak) DL：2.4Mbit/s(Peak)
 EVDO Rev.A UL：1.8Mbit/s(Peak) DL：3.1Mbit/s(Peak)


Main functions:
 Support the China Telecom standard AT command set
 Support the connection speed and traffic statistics
 Support OTA function
 Fast-connect
 Support 8K EVRC Voice Code
 Embedded 3G wireless communication protocol stack

## Optional module - E300

[![OptionalmoduleE300.jpg](http://eLinux.org/images/4/4a/OptionalmoduleE300.jpg)](http://eLinux.org/File:OptionalmoduleE300.jpg)



 E300 is a CDMA2000 Internet card using USB port.


Product features:
 Size: 81\*25.4\*12mm
 Weight: 25.5g
 Dual-antenna interface, support diversity antenna
 Support CDMA 2000 1x ，EV-DO Rev.0，EV-DO Rev.A
 Support CDMA 800/1900 MHz


Performance parameters:
 CDMA 1x UL：153.6kbit/s(Peak) DL：153.6kbit/s(Peak)
 EVDO Rev.0 UL：153.6kbit/s(Peak) DL：2.4Mbit/s(Peak)
 EVDO Rev.A UL：1.8Mbit/s(Peak) DL：3.1Mbit/s(Peak)


Main functions:
 Support Micro-SD card(up to 16GB)
 USB 2.0 high-speed transmission


Environmental parameter:
 Working temperature: -20\~55℃
 Storage temperature: -30\~80℃

## Optional module - W338

[![OpentionalmoduleW338.JPG](http://eLinux.org/images/f/f6/OpentionalmoduleW338.JPG)](http://eLinux.org/File:OpentionalmoduleW338.JPG)

 W338 is a HSDPA Internet card using USB port.

 Product features:
 Size: 87.9mm(L)\*27mm(W)\*12.05mm(T)
 Weight: 23g
 Chipset: Qualcomm MSM6280


Performance parameters:
 3G frequency band: UMTS 2100MHz
 2G frequency band: GSM/GPRS/EDGE 850/900/1800/1900 MHz


Main functions:
 Support Micro-SD card(up to 8GB)、USIM card management
 USB 2.0 high-speed transmission
 Single color LED can display a variety of state: real-time network
state, working mode, error warning.


Environmental parameter:
 Working temperature: -20\~60℃
 Storage temperature: -30\~85℃
 Humidity≤93%
 Shake: 15g(Peak), 10\~500Hz

# Android

## How to update the Android

1.Please backup your TF data.

 2 Use [HP USB Disk Storage Format Tool(Click here to
download)](http://www.embedinfo.com/english/download/SP27213.exe) to
format TF card.

 3.Download the system image files from your backup data or website
[OpensourceMID](http://www.opensourcemid.org).

 [![How to flash
android2.JPG](http://eLinux.org/images/7/76/How_to_flash_android2.JPG)](http://eLinux.org/File:How_to_flash_android2.JPG)

 4.You should insert the TF card before K7 is turned on.

 [![How to flash
android1.JPG](http://eLinux.org/images/b/b1/How_to_flash_android1.JPG)](http://eLinux.org/File:How_to_flash_android1.JPG)

 5.Connect the 5V power supply, press the **Power key** and **Down
key**, the LCD will display the interface below:

 [![How to flash
android3.JPG](http://eLinux.org/images/d/d6/How_to_flash_android3.JPG)](http://eLinux.org/File:How_to_flash_android3.JPG)

 Press the enter key to select the "update system", the system updating
will start.

 6.Select the "exit", the system will reboot.


## How to compile the Android source

Please download the pdf from
[K7\_Android\_Development\_Manual](http://opensourcemid.googlecode.com/files/K7_Android_Development_Manual_101103.pdf),
you can find the details on the pdf.
 Chinese version pdf：[Click here to
download](http://opensourcemid.googlecode.com/files/K7_Android%E5%BC%80%E5%8F%91%E6%89%8B%E5%86%8C_101103.pdf).

 [Opensourcemid
Googlecode](http://code.google.com/p/opensourcemid/downloads/list)

## How to use the USB device port as the UART debug port

1. Download the USB driver for Windows ["Littleton USB Driver for
Windows.rar"](http://opensourcemid.googlecode.com/files/Littleton_USB_Driver_for_Windows.rar)
and extract it.
 2. Connect K7 to your computer's USB port. Windows will detect the
device and launch the Found New Hardware wizard. Vista/7 users need to
cancel the automatic driver update.
 3. Select "Locate and install driver software."
 4. Select "Browse my computer for driver software."
 5. Click "Browse..." and locate the folder where you extracted the
driver. As long as you specified the exact location of the installation
package, you may leave "Include subfolders" checked or unchecked—it
doesn't matter.
 6. Click "Next." Vista/7 may prompt you to confirm the privilege
elevation required for driver installation. Confirm it. The driver will
be installed.
 7. Download the Android SDK for Windows
["android-sdk\_r07-windows.zip"](http://dl.google.com/android/android-sdk_r07-windows.zip)
and extract it.
 8. Run the cmd in Windows.
 9. Enter the commands below:

      D:
      cd D:\android-sdk-windows\tools
      adb.exe shell

Now the USB device port is working as the UART debug port. You can
install applications from computer. Enter the command below:

      adb.exe install D:\AdobeReaderv10.0.0.apk

# WinCE

## How to update the WinCE

1.Please backup your TF data.

 2.Use [HP USB Disk Storage Format Tool(Click here to
download)](http://www.embedinfo.com/english/download/SP27213.exe) to
format TF card.

 3.Copy the following files in the backup data[\\wince\_6\_R3\\image] to
the root directory of the TF card.


     MLO
     EBOOTNAND.nb0
     NK.bin
     XLDRNAND.nb0

Then change the EBOOTNAND.nb0 name to EBOOTSD.nb0 in the TF card.

 4.Insert the TF card to K7 TF slot before power on.

 [![K7 wince4.jpg](http://eLinux.org/images/c/c2/K7_wince4.jpg)](http://eLinux.org/File:K7_wince4.jpg)

 5. long press Power Button and Esc Button, system will enter the update
menu.
 [![K7 wince5.jpg](http://eLinux.org/images/4/40/K7_wince5.jpg)](http://eLinux.org/File:K7_wince5.jpg)

 6.Follow the instruction, and long press Esc Button, system will update
automatically.

 7.When finish updating, system will boot automatically.


