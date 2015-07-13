> From: [eLinux.org](http://eLinux.org/RPi_Guides "http://eLinux.org/RPi_Guides")


# RPi Guides



<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Introduction">1 Introduction</a></li>
<li><a href="#System_Tasks">2 System Tasks</a>
<ul>
<li><a href="#Setting_up_an_SD_card">2.1 Setting up an SD card</a></li>
<li><a href="#Debian_Auto_Login.2FStartx">2.2 Debian Auto Login/Startx</a></li>
<li><a href="#Defining_default_LXTerminal_size_on_the_Raspberry_Pi">2.3 Defining default LXTerminal size on the Raspberry Pi</a></li>
<li><a href="#Installing_Chromium_web_browser">2.4 Installing Chromium web browser</a></li>
<li><a href="#Installing_The_Java_JDK_on_the_Raspberry_Pi_.28Debian_systems_only.29">2.5 Installing The Java JDK on the Raspberry Pi (Debian systems only)</a></li>
<li><a href="#Installing_Mozilla_IceWeasel_Web_Browser">2.6 Installing Mozilla IceWeasel Web Browser</a></li>
<li><a href="#Raspberry_Pi_and_real-time.2C_low-latency_audio">2.7 Raspberry Pi and real-time, low-latency audio</a></li>
</ul></li>
<li><a href="#Easy">3 Easy</a>
<ul>
<li><a href="#Network_Attached_Storage">3.1 Network Attached Storage</a></li>
<li><a href="#Connect_your_RPi_to_your_MS_Windows_machines">3.2 Connect your RPi to your MS Windows machines</a></li>
<li><a href="#Python_3_on_Debian">3.3 Python 3 on Debian</a></li>
<li><a href="#Installing_Java_8">3.4 Installing Java 8</a></li>
<li><a href="#iTunes_music_server_.28forked-daapd.29">3.5 iTunes music server (forked-daapd)</a></li>
<li><a href="#Setting_up_a_static_IP_in_Debian">3.6 Setting up a static IP in Debian</a></li>
<li><a href="#Setting_up_static_IP_.282.29">3.7 Setting up static IP (2)</a></li>
<li><a href="#Using_the_serial_port">3.8 Using the serial port</a></li>
<li><a href="#Text_to_Speech_.28Speech_Synthesis.29">3.9 Text to Speech (Speech Synthesis)</a></li>
<li><a href="#Installing_a_Web_Cam">3.10 Installing a Web Cam</a></li>
<li><a href="#RaPiRo_Web_Control">3.11 RaPiRo Web Control</a></li>
</ul></li>
<li><a href="#Medium">4 Medium</a>
<ul>
<li><a href="#Classroom_Boot_Server">4.1 Classroom Boot Server</a></li>
<li><a href="#Installing_Ruby_on_Rails">4.2 Installing Ruby on Rails</a></li>
<li><a href="#Share_your_screen_with_VNC">4.3 Share your screen with VNC</a></li>
<li><a href="#Remote_Control_of_a_Raspberry_with_VNC">4.4 Remote Control of a Raspberry with VNC</a></li>
<li><a href="#Remote_Destop_Server_for_Raspberry">4.5 Remote Destop Server for Raspberry</a></li>
<li><a href="#iSCSI_support_and_boot">4.6 iSCSI support and boot</a></li>
<li><a href="#Send_email_containing_Pi_ip_address_on_boot">4.7 Send email containing Pi ip address on boot</a></li>
<li><a href="#Connecting_securely_to_TightVNC_over_the_Internet">4.8 Connecting securely to TightVNC over the Internet</a></li>
<li><a href="#Configuring_a_LAMP_webserver">4.9 Configuring a LAMP webserver</a></li>
<li><a href="#Storage_Filer.2FNAS_via_Chef">4.10 Storage Filer/NAS via Chef</a></li>
<li><a href="#Raspberry_Pi_WiFi_Hotspot">4.11 Raspberry Pi WiFi Hotspot</a></li>
<li><a href="#Raspberry_Pi_.2F_Arduino_Serial_Communication">4.12 Raspberry Pi / Arduino Serial Communication</a></li>
<li><a href="#Using_the_camera_module_in_c.2B.2B">4.13 Using the camera module in c++</a></li>
</ul></li>
<li><a href="#Advanced">5 Advanced</a>
<ul>
<li><a href="#building_and_installing_OpenELEC">5.1 building and installing OpenELEC</a></li>
<li><a href="#Using_Skypekit">5.2 Using Skypekit</a></li>
<li><a href="#Interactive_Google_Calendar">5.3 Interactive Google Calendar</a></li>
<li><a href="#Pre-configuring_SD_card_with_a_static_IP_address">5.4 Pre-configuring SD card with a static IP address</a></li>
<li><a href="#Sending_remote_commands_to_our_Pi_thanks_to_Pastebin">5.5 Sending remote commands to our Pi thanks to Pastebin</a></li>
</ul></li>
<li><a href="#References">6 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Community Pages:**

*[Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") - a list of tutorials.
Learn by doing.*

***Guides** - a list of informative guides. Make something useful.*

*[Projects](http://eLinux.org/RPi_Projects "RPi Projects") - a list of community
projects. Help others out.*

*[Tasks](http://eLinux.org/RPi_Tasks "RPi Tasks") - for advanced users to collaborate on
software tasks.*

*[Datasheets](http://eLinux.org/RPi_DatasheetCategories "RPi DatasheetCategories") - a
frambozenier.org documentation project.*

*[Education](http://eLinux.org/RPi_Education "RPi Education") - a place to share your
group's project and find useful learning sites.*

*[Community](http://eLinux.org/RPi_Community "RPi Community") - links to the community
elsewhere on the web.*

*[Games](http://eLinux.org/RPi_Games "RPi Games") - all kinds of computer games.*



## Introduction

This page contains a set of guides to show readers how to do common or
useful tasks on the system. These guides focus on system-related items
such as how to install a linux option or configure an on-board device.
Items listed here should achieve a goal as simply as possible, with the
aim to build the confidence of the reader. For anything more complex,
the item should be listed on the projects page.

The Raspberry Pi Forum has a list of [Project Ideas &
Links](http://www.raspberrypi.org/forum/projects-and-collaboration-general/the-projects-list-look-here-for-some-ideas),
to help people get started.

Please add links to your guides (and ones you find interesting).

Fill in each section:

-   Guide Title (as a link to the project webpage or connected wiki
    page)
-   Guide Description (including any additional links or information
-   Tags (key words related to the item, i.e. LCD Screen, Teaching,
    Python)
-   Author(s) or group who have produced it (also if it is an
    Open/Community Project for anyone to contribute)
-   Guide Status (Not Started/In-Progress/Available).

## System Tasks

This section describes tasks that involve software installation, setup
or configuration of your Raspberry Pi.

<table>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<tbody>
<tr class="odd">
<td align="left"><p><strong>Guide Title and Link</strong></p></td>
<td align="left"><p><strong>Guide Description</strong></p></td>
<td align="left"><p><strong>Tags</strong></p></td>
<td align="left"><p><strong>Author</strong></p></td>
<td align="left"><p><strong>Status</strong></p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://www.cpdforteachers.com/resources/setting-up-an-sd-card-for-your-raspberry-pi">Setting up an SD card</a></h3></td>
<td align="left"><p>How to set up an SD card with an OS image</p></td>
<td align="left"><p>Linux, OS, Raspbian, SD card</p></td>
<td align="left"><p>Ben Elgar - CPD for Teachers</p></td>
<td align="left"><p>Complete and Tested</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/RPi_Debian_Auto_Login" title="RPi Debian Auto Login">Debian Auto Login/Startx</a></h3></td>
<td align="left"><p>How to launch LXDE without the need of a username/Password in Debian.</p></td>
<td align="left"><p>LXDE, Boot, Login, Auto</p></td>
<td align="left"><p>Ian Hartwell (helpme1986)</p></td>
<td align="left"><p>Early draft.</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/RPi_Defining_Default_Terminal_Size" title="RPi Defining Default Terminal Size">Defining default LXTerminal size on the Raspberry Pi</a></h3></td>
<td align="left">The LXTerminal application starts with a default size of 24 rows and 80 columns. The window can be resized, but this setting is not remembered for the next time you create a window. This guide shows how to make the setting persistent.</td>
<td align="left">LXTerminal size</td>
<td align="left">HBrydon</td>
<td align="left">Complete</td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/RPi_Chromium" title="RPi Chromium">Installing Chromium web browser</a></h3></td>
<td align="left"><p>Installing the Chromium web browser on Debian.</p></td>
<td align="left"><p>Chromium</p></td>
<td align="left"><p>bredman</p></td>
<td align="left"><p>Ready for testing</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/RPi_Java_JDK_Installation" title="RPi Java JDK Installation">Installing The Java JDK on the Raspberry Pi (Debian systems only)</a></h3></td>
<td align="left">This page describes how to to install the Java 7 JDK on Debian Wheezy. [As of Q1 2013, the Java JDK will only run on soft-float implementations of Debian Wheezy.]</td>
<td align="left">Java JDK</td>
<td align="left">HBrydon</td>
<td align="left">Complete</td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/RPi_IceWeasel" title="RPi IceWeasel">Installing Mozilla IceWeasel Web Browser</a></h3></td>
<td align="left">On the Raspberry Pi, the Mozilla Firefox browser is implemented under the name &quot;IceWeasel&quot;. This page lists how to install IceWeasel on Raspian and Debian.</td>
<td align="left">Mozilla IceWeasel</td>
<td align="left">HBrydon</td>
<td align="left">Debian: Complete Raspian: Needs testing</td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://wiki.linuxaudio.org/wiki/raspberrypi">Raspberry Pi and real-time, low-latency audio</a></h3></td>
<td align="left"><p>The Raspberry Pi can be set up to handle real-time, low-latency audio but it requires quite some tweaking. Hence this Wiki article in which some common bottlenecks as well as some possible optimizations will be described. Last but not least this article will explain how to get JACK aka jackd running on your RPi.</p></td>
<td align="left"><p>realtime real-time jackd low-latency audio midi</p></td>
<td align="left"><p>Jeremy Jongepier (AutoStatic)</p></td>
<td align="left"><p>Almost complete Raspbian: tested</p></td>
</tr>
</tbody>
</table>

## Easy

Suitable for beginners who are confident typing commands into Linux but
need a lot of guidance.

<table>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<tbody>
<tr class="odd">
<td align="left"><p><strong>Guide Title and Link</strong></p></td>
<td align="left"><p><strong>Guide Description</strong></p></td>
<td align="left"><p><strong>Tags</strong></p></td>
<td align="left"><p><strong>Author</strong></p></td>
<td align="left"><p><strong>Status</strong></p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/R-Pi_NAS" title="R-Pi NAS">Network Attached Storage</a></h3></td>
<td align="left"><p>Network Attached Storage - Basic concept: A place to save copies of all your important files</p></td>
<td align="left"><p>Samba</p></td>
<td align="left"><p><a href="http://elinux.org/User:Bredman" title="User:Bredman">bredman</a> - Open Project</p></td>
<td align="left"><p>Tested on Debian, some help needed with Fedora chapter</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/index.php?title=Autoinstall_Samba&amp;action=edit&amp;redlink=1" title="Autoinstall Samba (page does not exist)">Connect your RPi to your MS Windows machines</a></h3></td>
<td align="left"><p>The guide above is a full NAS setup - This guide/script just configures and installs a very simple setup to allow you to read/write to your RPi files</p></td>
<td align="left"><p>Samba</p></td>
<td align="left"><p><a href="http://elinux.org/index.php?title=User:SimpleSi&amp;action=edit&amp;redlink=1" title="User:SimpleSi (page does not exist)">Simon Walters</a> - Open Project</p></td>
<td align="left"><p>Tested on Raspbian</p></td>
</tr>
<tr class="even">
<td align="left"><p><br /></p>
<h3><a href="http://elinux.org/RPi_Debian_Python3" title="RPi Debian Python3">Python 3 on Debian</a></h3></td>
<td align="left"><p>Installing the latest Python 3 and common modules on Debian.</p></td>
<td align="left"><p>Python</p></td>
<td align="left"><p>croston</p></td>
<td align="left"><p>Tested. Needs more modules adding</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/RPi_Java" title="RPi Java">Installing Java 8</a></h3></td>
<td align="left"><p>Installing Java 8 on Raspberry Pi.</p></td>
<td align="left"><p>Java 8</p></td>
<td align="left"><p>Happy-Neko</p></td>
<td align="left"><p>Tested on Raspbian.</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/RPiForked-Daapd" title="RPiForked-Daapd">iTunes music server (forked-daapd)</a></h3></td>
<td align="left"><p>How to install forked-daapd, an iTunes music server</p></td>
<td align="left"><p>Debian, streaming,</p></td>
<td align="left"><p>Greg (pr1sm)/ejurgensen</p></td>
<td align="left"><p>Tested on Raspbian</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/RPi_Setting_up_a_static_IP_in_Debian" title="RPi Setting up a static IP in Debian">Setting up a static IP in Debian</a></h3></td>
<td align="left"><p>How to set-up a static IP in Debian</p></td>
<td align="left"><p>Debian, Static IP</p></td>
<td align="left"><p>sleepy</p></td>
<td align="left"><p>Available</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/Configuring_a_Static_IP_address_on_your_Raspberry_Pi" title="Configuring a Static IP address on your Raspberry Pi">Setting up static IP (2)</a></h3></td>
<td align="left"><p>Alternative guide to setting-up a static IP</p></td>
<td align="left"><p>Debian, Static IP</p></td>
<td align="left"><p>Andrum99</p></td>
<td align="left"><p>Unknown</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/RPi_Serial_Connection" title="RPi Serial Connection">Using the serial port</a></h3></td>
<td align="left"><p>Connecting the serial port on your Raspberry Pi</p></td>
<td align="left"><p>Serial, GPIO, Console</p></td>
<td align="left"><p>Open project</p></td>
<td align="left"><p>Nearing completion</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/RPi_Text_to_Speech_(Speech_Synthesis)" title="RPi Text to Speech (Speech Synthesis)">Text to Speech (Speech Synthesis)</a></h3></td>
<td align="left"><p>Three easy methods of getting your Raspberry Pi to talk</p></td>
<td align="left"><p>Raspbian</p></td>
<td align="left"><p>StevenP</p></td>
<td align="left"><p>Works fine</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://robotblogging.blogspot.co.uk/2013/01/pi-vision-10.html">Installing a Web Cam</a></h3></td>
<td align="left"><p>Basic installation and testing of a usb web cam on Raspberry Pi</p></td>
<td align="left"><p>web cam, ps eye, ffmpeg</p></td>
<td align="left"><p>Chris Cummings</p></td>
<td align="left"><p>Works</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/Installing_RaPiRo_Web_Control" title="Installing RaPiRo Web Control">RaPiRo Web Control</a></h3></td>
<td align="left"><p>Basic installation and testing of a webserver controlling RaPiRo on Raspberry Pi</p></td>
<td align="left"><p>webserver, python, serial controll</p></td>
<td align="left"><p>Jaix Bly</p></td>
<td align="left"><p>Works</p></td>
</tr>
</tbody>
</table>

## Medium

Suitable for beginners who are willing to experiment and only need a
little guidance.

<table>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<tbody>
<tr class="odd">
<td align="left"><p><strong>Guide Title and Link</strong></p></td>
<td align="left"><p><strong>Guide Description</strong></p></td>
<td align="left"><p><strong>Tags</strong></p></td>
<td align="left"><p><strong>Author</strong></p></td>
<td align="left"><p><strong>Status</strong></p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/R-Pi_PXE_Server" title="R-Pi PXE Server">Classroom Boot Server</a></h3></td>
<td align="left"><p>Classroom boot server - Basic concept: A PXE server to allow cheap computers without hard disks to boot into Windows or Linux.</p></td>
<td align="left"><p>PXE, netboot</p></td>
<td align="left"><p><a href="http://elinux.org/User:Bredman" title="User:Bredman">bredman</a> - Open Project</p></td>
<td align="left"><p>Lots of random text, needs organisation and testing</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/RPi_Ruby_on_Rails" title="RPi Ruby on Rails">Installing Ruby on Rails</a></h3></td>
<td align="left"><p>Installing Ruby on Rails and common modules on Debian.</p></td>
<td align="left"><p>Ruby, Rails</p></td>
<td align="left"><p>Erik</p></td>
<td align="left"><p>Partially tested. Still early draft.</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/RPi_VNC_Screen_Sharing" title="RPi VNC Screen Sharing">Share your screen with VNC</a></h3></td>
<td align="left"><p>Installing Vino to allow remote control of the screen from another computer.</p></td>
<td align="left"><p>Vino, VNC</p></td>
<td align="left"><p>Jaix Bly</p></td>
<td align="left"><p>Draft.</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/RPi_VNC_Server" title="RPi VNC Server">Remote Control of a Raspberry with VNC</a></h3></td>
<td align="left"><p>Installing VNC to allow remote control a X11 session (not the console) from another computer.</p></td>
<td align="left"><p>VNC</p></td>
<td align="left"><p>Simon H</p></td>
<td align="left"><p>Early draft.</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/RPi_XRDP_Server" title="RPi XRDP Server">Remote Destop Server for Raspberry</a></h3></td>
<td align="left"><p>Installing XRDP to allow Remote Desktop / Terminal Server on Raspberry Pi.</p></td>
<td align="left"><p>rdp, xrdp</p></td>
<td align="left"><p>Jaix Bly</p></td>
<td align="left"><p>Draft.</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/RPi_iSCSI_Initiator" title="RPi iSCSI Initiator">iSCSI support and boot</a></h3></td>
<td align="left"><p>Adding iSCSI initiator/target support, setting up iSCSI initiator, and configuring booting from an iSCSI volume.</p></td>
<td align="left"><p>iSCSI, netboot</p></td>
<td align="left"><p>Alex (nidO)</p></td>
<td align="left"><p>Early draft, tested</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/RPi_Email_IP_On_Boot_Debian" title="RPi Email IP On Boot Debian">Send email containing Pi ip address on boot</a></h3></td>
<td align="left"><p>Send email containing the ip of your Pi so you can access via SSH or other network protocol when your ip changes (moving networks) and you are working headless</p></td>
<td align="left"><p>SSH, email, python</p></td>
<td align="left"><p>--<a href="http://elinux.org/index.php?title=User:Geraldcor&amp;action=edit&amp;redlink=1" title="User:Geraldcor (page does not exist)">Geraldcor</a> 03:36, 18 June 2012 (UTC)</p></td>
<td align="left"><p>Early draft, tested</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://www.penguintutor.com/linux/tightvnc">Connecting securely to TightVNC over the Internet</a></h3></td>
<td align="left"><p>Guide to installing Tightvnc server on the Raspberry Pi and securing it using ssh to allow connecting over the Internet.</p></td>
<td align="left"><p>VNC, ssh</p></td>
<td align="left"><p>Stewart Watkiss</p></td>
<td align="left"><p>Available</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://www.penguintutor.com/linux/raspberrypi-webserver">Configuring a LAMP webserver</a></h3></td>
<td align="left"><p>Guide to configuring the Raspberry Pi as a LAMP (Linux, Apache, Mysql, PHP) webserver.</p></td>
<td align="left"><p>apache, mysql, php</p></td>
<td align="left"><p>Stewart Watkiss</p></td>
<td align="left"><p>Available</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="https://github.com/ewindisch/chefiler">Storage Filer/NAS via Chef</a></h3></td>
<td align="left"><p>Turn-key package to turn a machine into a storage filer / NAS. Developed and tested on a RaspberryPi. Still in early development. Deploys with Chef.</p></td>
<td align="left"><p>samba, nfs, chef</p></td>
<td align="left"><p>Eric Windisch</p></td>
<td align="left"><p>Alpha/early-stage</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/RPI-Wireless-Hotspot" title="RPI-Wireless-Hotspot">Raspberry Pi WiFi Hotspot</a></h3></td>
<td align="left"><p>Turn your Raspberry Pi into a WiFi hotspot!</p></td>
<td align="left"><p>wifi, hotspot, hostapd</p></td>
<td align="left"><p>Isaac Smith</p></td>
<td align="left"><p>Works like a charm.</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://robotblogging.blogspot.co.uk/2013/01/raspberry-pi-chats-to-arduino.html">Raspberry Pi / Arduino Serial Communication</a></h3></td>
<td align="left"><p>Raspberry Pi talking to Arduino over serial uart</p></td>
<td align="left"><p>arduino, serial, uart</p></td>
<td align="left"><p>Chris Cummings</p></td>
<td align="left"><p>Works perfectly!</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://robotblogging.blogspot.co.uk/2013/10/an-efficient-and-simple-c-api-for.html">Using the camera module in c++</a></h3></td>
<td align="left"><p>Installation and tutorial on using a very simple api to access the Pi Camera Module in C++</p></td>
<td align="left"><p>camera, c++</p></td>
<td align="left"><p>Chris Cummings</p></td>
<td align="left"><p>Works</p></td>
</tr>
</tbody>
</table>

## Advanced

Suitable for confident users who want to try something more advanced.

<table>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<tbody>
<tr class="odd">
<td align="left"><p><strong>Guide Title and Link</strong></p></td>
<td align="left"><p><strong>Guide Description</strong></p></td>
<td align="left"><p><strong>Tags</strong></p></td>
<td align="left"><p><strong>Author</strong></p></td>
<td align="left"><p><strong>Status</strong></p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://elinux.org/RPi_building_and_installing_OpenELEC" title="RPi building and installing OpenELEC">building and installing OpenELEC</a></h3></td>
<td align="left"><p>How to build and install OpenELEC,a embedded Multimedia Distro. You can learn (cross)compiling, building packages from source, how buildsystems are working and what is needed to install a OS on a SD-card for Raspberry Pi.</p></td>
<td align="left"><p>XBMC, HTPC, Multimedia, Distro, compiling</p></td>
<td align="left"><p>Stephan Raue</p></td>
<td align="left"><p>Available</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://elinux.org/RPi_Using_Skypekit" title="RPi Using Skypekit">Using Skypekit</a></h3></td>
<td align="left"><p>How to get started using Skypekit to make calls &amp; chat. This is currently only useful for advanced users &amp; developers.</p></td>
<td align="left"><p>Skype, Skypekit</p></td>
<td align="left"><p>Henry Cooke</p></td>
<td align="left"><p>Alpha.</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://raspberry.tips/2014/07/27/raspberrypi-tutorials/raspberry-pi-projekt-google-kalender-mit-touch-screen-und-bewegungserkennung">Interactive Google Calendar</a></h3></td>
<td align="left"><p>Guide to create a interactive google calendar with motion detection and 19<em>touch screen (Guide is in german)</em></p></td>
<td align="left"><p>Multimedia</p></td>
<td align="left"><p>Philipp Schweizer</p></td>
<td align="left"><p>Available</p></td>
</tr>
<tr class="odd">
<td align="left"><h3><a href="http://www.penguintutor.com/linux/raspberrypi-headless">Pre-configuring SD card with a static IP address</a></h3></td>
<td align="left"><p>Guide to pre-configuring a SD image so that it boots with a static IP address. Useful for running headless without needing to know what DHCP address will be allocated.</p></td>
<td align="left"><p>networking, tcpip</p></td>
<td align="left"><p>Stewart Watkiss</p></td>
<td align="left"><p>Available</p></td>
</tr>
<tr class="even">
<td align="left"><h3><a href="http://rpipython.blogspot.com.es/2012/12/sending-remote-commands-to-our-pi.html">Sending remote commands to our Pi thanks to Pastebin</a></h3></td>
<td align="left"><p>A guide to send remote commands to our Pi just by editing a pastebin!</p></td>
<td align="left"><p>remote commands, notsureifuseful</p></td>
<td align="left"><p>Itxaka Serrano Garcia</p></td>
<td align="left"><p>Available</p></td>
</tr>
</tbody>
</table>

# References



-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

[Raspberry Pi](http://eLinux.org/R-Pi_Hub "R-Pi Hub")

**Startup**

[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - [SD Card
Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") - [Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") - [Advanced
Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") - [Beginners
Guide](http://eLinux.org/RPi_Beginners "RPi Beginners") -
[Troubleshooting](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting")

[![RpiFront.jpg](http://eLinux.org/images/thumb/9/96/RpiFront.jpg/167px-RpiFront.jpg)](http://eLinux.org/File:RpiFront.jpg)

**Hardware**

[Hardware](http://eLinux.org/RPi_Hardware "RPi Hardware") - [Hardware
History](http://eLinux.org/RPi_HardwareHistory "RPi HardwareHistory") - [Low-level
peripherals](http://eLinux.org/RPi_Low-level_peripherals "RPi Low-level peripherals") -
[Expansion Boards](http://eLinux.org/RPi_Expansion_Boards "RPi Expansion Boards")

**Peripherals**

[Screens](http://eLinux.org/RPi_Screens "RPi Screens") - [Cases](http://eLinux.org/RPi_Cases "RPi Cases")
- [Other Peripherals (Keyboard, mouse, hub,
wifi...)](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals")

**Software**

[Software](http://eLinux.org/RPi_Software "RPi Software") -
[Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") -
[Kernel](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation") -
[Performance](http://eLinux.org/RPi_Performance "RPi Performance") -
[Programming](http://eLinux.org/RPi_Programming "RPi Programming") - [VideoCore
APIs](http://eLinux.org/RPi_VideoCore_APIs "RPi VideoCore APIs") -
[Utilities](http://eLinux.org/RPi_Utilities "RPi Utilities")

**Projects**

[Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") - **Guides** -
[Projects](http://eLinux.org/RPi_Projects "RPi Projects") -
[Tasks](http://eLinux.org/RPi_Tasks "RPi Tasks") -
[DataSheets](http://eLinux.org/RPi_DatasheetCategories "RPi DatasheetCategories") -
[Education](http://eLinux.org/RPi_Education "RPi Education") -
[Communities](http://eLinux.org/RPi_Community "RPi Community")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")

