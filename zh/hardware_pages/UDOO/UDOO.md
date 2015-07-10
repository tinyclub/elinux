> From: [eLinux.org](http://eLinux.org/UDOO "http://eLinux.org/UDOO")


# UDOO

This page collects information about [UDOO](http://www.udoo.org) the
first ever small sized computer that merges in one single board an ARM
cortex-A9 iMX.6 CPU and an Arduino Due compatible board embedded with a
dedicated ARM SAM3X8E CPU. [UDOO project has been funded through
Kickstarter](http://www.kickstarter.com/projects/435742530/udoo-android-linux-arduino-in-a-tiny-single-board),
raising \$641,614 in sixty days thanks to 4,172 backers.

[![UDOO](http://eLinux.org/images/thumb/b/be/UDOO-icons2.png/400px-UDOO-icons2.png)](http://eLinux.org/File:UDOO-icons2.png "UDOO")

***Notice:** The UDOO Wiki pages on this site is collaborative work -
the UDOO Team is **not** responsible for content on these pages.*

## Contents

-   [1 What's UDOO?](#what-s-udoo)
    -   [1.1 UDOO goals:](#udoo-goals)
-   [2 Specifications](#specifications)
    -   [2.1 Board Overview](#board-overview)
    -   [2.2 GPIO features](#gpio-features)
-   [3 Getting Started](#getting-started)
    -   [3.1 Very first start](#very-first-start)
    -   [3.2 Advanced Setup](#advanced-setup)
    -   [3.3 Resources](#resources)
-   [4 Tutorials](#tutorials)
    -   [4.1 Linux](#linux)
    -   [4.2 Android](#android)
    -   [4.3 Arduino](#arduino)
-   [5 Resources](#resources-2)
    -   [5.1 Hardware & Accessories](#hardware-accessories)
    -   [5.2 Software & OS
        Distributions](#software-os-distributions)
    -   [5.3 Additional Resources](#additional-resources)
-   [6 Official Accessories](#official-accessories)
    -   [6.1 UDOO Camera Module](#udoo-camera-module)
    -   [6.2 UDOO LVDS Touch Screens](#udoo-lvds-touch-screens)
-   [7 Community](#community)
    -   [7.1 Home site and community](#home-site-and-community)
    -   [7.2 Social account](#social-account)

## What's UDOO?

UDOO is a single board computer that can be used both with Android and
Linux, paired with an Arduino-compatible processor. It is a powerful
prototyping board for software development and design; it’s easy to use
and allows developing projects with minimum knowledge of hardware
design. UDOO merges different computing worlds together: each one has
its proper strengths and weak points, but all of them are useful in
todays life for educational purposes as well as Do-It-Yourself (DIY) and
quick prototyping. UDOO is an open hardware, low-cost platform equipped
with an ARM i.MX6 Freescale processor, and an Arduino Due compatible
section based on ATMEL SAM3X8E ARM processor, all this available on the
same board!

### UDOO goals:

-   Develop an innovative product for a growing market
-   Give a new vision to the educational framework, with the idea of
    training up a new generation of engineers, designers and software
    developers skilled in digital technology: physical computing,
    multi-media arts, interactive arts, IoT...
-   Give a boost to the DIY world
-   Offer a low cost embedded platform for interactive arts with
    powerful tools: Processing, OpenCV, PureData, openFramework
-   Provide companies with a great tool for fast prototyping

## Specifications

UDOO retail line up consists of three models, sharing most of the
features and different only for connectivity and i.MX6 processor used.
All three models feature an embedded Arduino compatible section based on
Arduino Due schematic. UDOO’s dimensions are: 4.33 inch x 3.35 inch (11
cm x 8.5 cm).



<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><a href="http://elinux.org/File:Udoo.versions.jpg" title="UDOO"><img src="http://elinux.org/images/thumb/8/8b/Udoo.versions.jpg/500px-Udoo.versions.jpg" alt="UDOO" /></a></td>
<td align="left"><ul>
<li>Freescale i.MX6Quad, 2\4 x ARM® Cortex™-A9 core @ 1GHz with ARMv7A instruction set</li>
<li>GPU Vivante GC 2000 for 3D + Vivante GC 355 for 2D (vector graphics) + Vivante GC 320 for 2D</li>
<li>Atmel SAM3X8E ARM Cortex-M3 CPU (same as Arduino Due)</li>
<li>RAM DDR3 1GB</li>
<li>76 fully available GPIO with Arduino compatible R3 1.0 pinout</li>
<li>HDMI and LVDS + Touch</li>
<li>2 Micro USB (1 OTG)</li>
<li>2 USB 2.0 type A and 1 USB 2.0 internal pin header (requires adapter cable)</li>
<li>Analog Audio and Mic jacks</li>
<li>CSI Camera Connection</li>
<li>on board Micro SD card reader (boot device)</li>
<li>Power Supply (6-15V) and External Battery connector</li>
<li>Ethernet RJ45 (10/100/1000 MBit)</li>
<li>WiFi Module</li>
<li>SATA connector with power header</li>
</ul></td>
</tr>
</tbody>
</table>

**Warning: The UDOO I/O pins are 3.3V compliant. Higher voltages (like
5V) would damage the board.**

Learn more about [wrong uses that invalidate the
warranty](http://www.udoo.org/faq-items/what-are-the-wrong-uses-that-invalidate-the-warranty/).

### Board Overview

[![Schema UDOO
Wiki.jpg](http://eLinux.org/images/d/da/Schema_UDOO_Wiki.jpg)](http://eLinux.org/File:Schema_UDOO_Wiki.jpg)

### GPIO features

-   76 fully available GPIO
-   Arduino-compatible R3 1.0 pinout
-   3,3 V Compliant
-   Compatible with All Arduino Due Shields and most Arduino Shields
-   GPIO's can be accessed as Arduino pins, GPIO's or as additional
    S\\PDIF, FlexCAN,I2S, SPI

[More informations about
UDOO\_GPIO\_Pinout](http://eLinux.org/UDOO_GPIO_Pinout "UDOO GPIO Pinout")



## Getting Started

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<tbody>
<tr class="odd">
<td align="left"><h3>Very first start</h3>
<hr />
<ul>
<li>An easy step by step guide that will lead you to <a href="http://www.elinux.org/UDOO_Getting_started">boot your UDOO for the very first time</a>.</li>
</ul>
<ul>
<li>How to <a href="http://www.elinux.org/UDOO_creating_a_bootable_Micro_SD_card_from_precompiled_image">Create a bootable micro SD card for UDOO</a></li>
</ul>
<ul>
<li>Configure your UDOO with <a href="http://elinux.org/UDOO_Configuration_Tool">UDOO Configuration Tool</a></li>
</ul></td>
<td align="left"><h3>Advanced Setup</h3>
<hr />
<ul>
<li>How to <a href="http://www.elinux.org/UDOO_creating_a_bootable_Micro_SD_card_from_precompiled_binaries">Create a bootable Micro SD card from precompiled binaries</a>.</li>
</ul>
<ul>
<li>How to <a href="http://www.elinux.org/UDOO_creating_a_bootable_Micro_SD_card_from_source">Create a bootable Micro SD card from sources</a>.</li>
</ul>
<ul>
<li>How to <a href="http://elinux.org/UDOO_kernel_update_procedure">Update UDOO Kernel</a></li>
</ul>
<ul>
<li>How to <a href="http://www.elinux.org/UDOO_boot_from_sata">boot from SATA drive</a></li>
</ul>
<ul>
<li><a href="http://elinux.org/UDOO_usb_debug" title="UDOO usb debug">Using USB Debug Connection</a></li>
</ul>
<ul>
<li><strong>Having problems? Try the <a href="http://elinux.org/index.php?title=UDOO_TroubleShooting&amp;action=edit&amp;redlink=1" title="UDOO TroubleShooting (page does not exist)">Troubleshooting</a> page.</strong></li>
</ul></td>
<td align="left"><h3>Resources</h3>
<hr />
<p>UDOO has a very active and growing community where to find help and new ideas</p>
<ul>
<li><a href="http://www.udoo.org/">UDOO.org</a> is the official Website</li>
<li><a href="http://www.udoo.org/forum/">UDOO Forum</a> is a great place to start discussing</li>
</ul>
<ul>
<li>Get started with some basic projects and tutorials:
<ul>
<li><a href="http://www.youtube.com/user/UDOOboard">UDOO YouTube Tutorials</a><br /></li>
<li><a href="http://www.udoo.org/tutorials/">UDOO Tutorials Section</a><br /></li>
<li><a href="http://www.udoo.org/projects/">UDOO Projects Section</a><br /></li>
</ul></li>
</ul>
<ul>
<li>Take a look at <a href="http://udoo.org/download/files/Documents/UDOO_Starting_Manual_beta0.4_11_28_2013.pdf">UDOO User Manual</a> which contains lots of useful technical informations</li>
</ul>
<ul>
<li>Hop on <a href="http://en.irc2go.com/webchat/?net=freenode&amp;room=udoo">UDOO Channel</a> IRC Chat</li>
</ul></td>
</tr>
</tbody>
</table>



## Tutorials

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<tbody>
<tr class="odd">
<td align="left"><h3>Linux</h3>
<hr />
<ul>
<li>How to <a href="http://www.elinux.org/UDOO_Installing_Debian_With_Debootstrap">install a custom Debian distro with debootstrap</a></li>
</ul>
<ul>
<li>How to <a href="http://www.elinux.org/UDOO_create_a_Virtual_Machine_for_UDOO_Development">Create a Virtual Machine for UDOO Development</a></li>
</ul>
<ul>
<li>Understand some basic <a href="http://elinux.org/Linux_command_line_basics" title="Linux command line basics">linux commands</a></li>
</ul></td>
<td align="left"><h3>Android</h3>
<hr />
<ul>
<li>Introduction on <a href="http://elinux.org/index.php?title=Android_Making&amp;action=edit&amp;redlink=1" title="Android Making (page does not exist)">Making with Android</a></li>
</ul>
<ul>
<li>How to <a href="http://www.elinux.org/UDOO_compile_android_from_sources">compile android from sources</a></li>
</ul>
<ul>
<li>How to <a href="http://www.elinux.org/UDOO_Switch_between_adb_Debug_and_ADK_connection">Switch between adb Debug and ADK connection</a></li>
</ul>
<ul>
<li>A useful <a href="https://github.com/palazzem/adk-toolkit">Android ADK Toolkit Library</a> and its <a href="http://android-adk-toolkit.readthedocs.org/en/latest/">Docs</a></li>
</ul>
<ul>
<li>How to configure Ethernet under Android</li>
</ul>
<p>How to <a href="http://www.elinux.org/UDOO_configure_Ethernet_under_Android">configure Ethernet under Android</a></p></td>
<td align="left"><h3>Arduino</h3>
<hr />
<ul>
<li>How to <a href="http://www.elinux.org/UDOO_programming_the_embedded_Arduino_microcontroller">program the embedded Arduino microcontroller</a></li>
</ul></td>
</tr>
</tbody>
</table>

## Resources

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<tbody>
<tr class="odd">
<td align="left"><h3>Hardware &amp; Accessories</h3>
<hr />
<ul>
<li><a href="http://elinux.org/UDOO_GPIO_Pinout" title="UDOO GPIO Pinout">UDOO_GPIO_Pinout</a></li>
<li><a href="http://elinux.org/IMX_6_Internal_and_drivers_pin-muxing_reference" title="IMX 6 Internal and drivers pin-muxing reference">IMX 6 Internal and drivers pin-muxing reference</a></li>
<li><a href="http://elinux.org/IMX6_and_Sam3X_Communication" title="IMX6 and Sam3X Communication">IMX6 and Sam3X Communication</a></li>
<li>How to <a href="http://www.elinux.org/UDOO_setup_lvds_panels">Setup LVDS Display Panels</a></li>
<li>How to setup <a href="http://elinux.org/UDOO_Camera_Module" title="UDOO Camera Module">UDOO Camera Module</a></li>
<li><a href="http://elinux.org/UDOO_watchdog" title="UDOO watchdog">Using Watchdog Timer on UDOO</a></li>
</ul></td>
<td align="left"><h3>Software &amp; OS Distributions</h3>
<hr />
<ul>
<li><a href="http://elinux.org/index.php?title=UDOOBuntu&amp;action=edit&amp;redlink=1" title="UDOOBuntu (page does not exist)">UDOOBuntu</a> is the Official UDOO Linux Distribution</li>
<li><a href="http://elinux.org/index.php?title=Android_4.3&amp;action=edit&amp;redlink=1" title="Android 4.3 (page does not exist)">Android 4.3</a> is the Official UDOO Android Distribution</li>
<li>List of all<a href="http://elinux.org/UDOO_Distributions" title="UDOO Distributions">UDOO Distributions available</a></li>
</ul>
<p><br /></p>
<p><br /></p></td>
<td align="left"><h3>Additional Resources</h3>
<hr />
<ul>
<li>Node-udoo is an abstraction library for Node.js complete with command line tools (callback, promise, and synchronous styles supported)
<ul>
<li><a href="https://www.youtube.com/watch?v=tjS-Fe-7dDA">Introductory/demo video</a></li>
<li><a href="https://github.com/pilwon/node-udoo">Project homepage</a></li>
<li><a href="http://www.udoo.org/forum/viewtopic.php?f=8&amp;t=431&amp;p=3595#p3595">Installing the latest node.js is covered in this forum post</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>



## Official Accessories

### UDOO Camera Module

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left"><p><br /></p>
<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><ul>
<li>Auto focus control (AFC) with embedded AF VCM driver</li>
<li>Sensitivity: 600mV/lux-sec</li>
<li>Video capture in Full Field of View (FOV): double sensitivity,improved signal-to.noise ratio (SNR)</li>
<li>Post-binning re-sampling filter for sharper, crisper contours and colours</li>
<li>Internal anti-shaking engine</li>
<li>Image transfer rate</li>
</ul>
<p>VGA (320x480) @120fps VGA (640x480) @90fps 720p @60fps 1280x960 @45fps 1080p @30fps QSXGA (2592x1944) @15fps</p>
<p><a href="http://elinux.org/UDOO_Camera_Module" title="UDOO Camera Module">More informations about UDOO Camera Modules</a></p>
<p><a href="http://udoo.org/download/files/datasheets/datasheet_camera.pdf">UDOO Camera Module Datasheet</a></p>
<p><br /></p></td>
<td align="left"><a href="http://elinux.org/File:UDOO_Camera.jpg"><img src="http://elinux.org/images/thumb/b/b3/UDOO_Camera.jpg/300px-UDOO_Camera.jpg" alt="UDOO Camera.jpg" /></a>
<a href="http://elinux.org/File:UDOO_Camera.jpg" title="Enlarge"></a></td>
</tr>
</tbody>
</table>
<p><br /></p>
<h2>UDOO LVDS Touch Screens</h2>
<p><strong>7&quot; Touch Panel Kit</strong></p>
<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><ul>
<li>7&quot; TFT RGB Display</li>
<li>I2C Touch Screen</li>
<li>Dual Touch</li>
<li>Resolution 800X480</li>
<li>UDOO_VK-7T video cable for UDOO</li>
<li>LCD BOARD ADAPTER</li>
</ul>
<p>How to <a href="http://www.elinux.org/UDOO_setup_lvds_panels">setup lvds panels</a></p>
<p><a href="http://udoo.org/download/files/datasheets/datasheet7.pdf">UDOO 7&quot; Touch Panel Display Kit Datasheet</a></p></td>
<td align="left"><a href="http://elinux.org/File:UDOO_LVDS_7.jpg"><img src="http://elinux.org/images/thumb/b/be/UDOO_LVDS_7.jpg/300px-UDOO_LVDS_7.jpg" alt="UDOO LVDS 7.jpg" /></a>
<a href="http://elinux.org/File:UDOO_LVDS_7.jpg" title="Enlarge"></a></td>
</tr>
</tbody>
</table>
<p><br /></p>
<p><br /> <strong>15&quot; Touch Panel Kit</strong></p>
<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><ul>
<li>15,6&quot; LVDS Display</li>
<li>USB Capacitive Touch Screen</li>
<li>Resolution 1366X768 24bit</li>
<li>UDOO_VK-15T video cable for UDOO</li>
<li>USB CABLE for Third UDOO'USB</li>
<li>Touch Controller Board</li>
</ul>
<p><br /> How to <a href="http://www.elinux.org/UDOO_setup_lvds_panels">setup lvds panels</a></p>
<p><a href="http://udoo.org/download/files/datasheets/datasheet15.pdf">UDOO 15&quot; Touch Panel Display Kit Datasheet</a></p></td>
<td align="left"><a href="http://elinux.org/File:UDOO_LVDS_15.jpg"><img src="http://elinux.org/images/thumb/f/fb/UDOO_LVDS_15.jpg/300px-UDOO_LVDS_15.jpg" alt="UDOO LVDS 15.jpg" /></a>
<a href="http://elinux.org/File:UDOO_LVDS_15.jpg" title="Enlarge"></a></td>
</tr>
</tbody>
</table>
<p><br /></p>
<p><br /></p>
<h1>Community</h1>
<p><strong>Forums</strong> The official UDOO forums can be found at <a href="http://www.udoo.org/forum">http://www.udoo.org/forum</a></p>
<p>The forum search facility has been tweaked to allow more general searching. <strong>Please</strong> do a search before making a post as the issue may already have been raised and answered.</p>
<p><br /> <strong>IRC</strong> There is an (unofficial) UDOO discussion channel on IRC. Using the IRC client of your choice, use server information: irc.freenode.net. Room name is #udoo.</p>
<h2>Home site and community</h2>
<ol>
<li>Official web site <a href="http://www.udoo.org">http://www.udoo.org</a></li>
<li>Official forum <a href="http://www.udoo.org/forum/index.php">http://www.udoo.org/forum/index.php</a></li>
</ol>
<h2>Social account</h2>
<ol>
<li>Facebook fan page <a href="http://www.facebook.com/udooboard">http://www.facebook.com/udooboard</a></li>
<li>Twitter <a href="http://twitter.com/UDOO_Board">http://twitter.com/UDOO_Board</a></li>
<li>Google+ <a href="https://plus.google.com/u/0/110742692974455430878/posts">https://plus.google.com/u/0/110742692974455430878/posts</a></li>
<li>YouTube <a href="http://www.youtube.com/channel/UCXv5UyGn5jArK8xOAmuSeHg">http://www.youtube.com/channel/UCXv5UyGn5jArK8xOAmuSeHg</a></li>
</ol></td>
</tr>
</tbody>
</table>


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [UDOO](http://eLinux.org/Category:UDOO "Category:UDOO")

