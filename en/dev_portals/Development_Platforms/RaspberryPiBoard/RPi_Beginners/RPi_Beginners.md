> From: [eLinux.org](http://eLinux.org/RPi_Beginners "http://eLinux.org/RPi_Beginners")


# RPi Beginners





<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Where_to_start.3F">1 Where to start?</a></li>
<li><a href="#What_is_Linux_and_why_not_use_Windows.3F">2 What is Linux and why not use Windows?</a></li>
<li><a href="#Basic_Raspbian_Setup">3 Basic Raspbian Setup</a></li>
<li><a href="#Intro_to_the_CLI_.28Command_Line_Interface.29">4 Intro to the CLI (Command Line Interface)</a></li>
<li><a href="#Remote_Access">5 Remote Access</a></li>
<li><a href="#Installing_and_updating_software_to_your_Raspberry_Pi">6 Installing and updating software to your Raspberry Pi</a></li>
<li><a href="#Adding_USB_Storage_to_Your_Raspberry_Pi">7 Adding USB Storage to Your Raspberry Pi</a></li>
<li><a href="#Beginner_Projects">8 Beginner Projects</a>
<ul>
<li><a href="#Backup_your_SD_card">8.1 Backup your SD card</a></li>
<li><a href="#Media_Player">8.2 Media Player</a></li>
<li><a href="#Play_Games">8.3 Play Games</a></li>
<li><a href="#Introducing_Young_Children_To_Computers">8.4 Introducing Young Children To Computers</a></li>
<li><a href="#Teaching">8.5 Teaching</a></li>
<li><a href="#Learn_To_Program">8.6 Learn To Program</a></li>
<li><a href="#Interface_With_Hardware">8.7 Interface With Hardware</a></li>
<li><a href="#Word_Processing.2FInternet_Browsing_etc">8.8 Word Processing/Internet Browsing etc</a></li>
<li><a href="#Your_Own_Pet_Project.21">8.9 Your Own Pet Project!</a></li>
</ul></li>
<li><a href="#Living_Without_RPi">9 Living Without RPi</a>
<ul>
<li><a href="#Using_Linux">9.1 Using Linux</a></li>
<li><a href="#Trying_Programming">9.2 Trying Programming</a></li>
<li><a href="#Controlling_Hardware">9.3 Controlling Hardware</a></li>
</ul></li>
<li><a href="#About_This_Page_-_For_Contributors">10 About This Page - For Contributors</a></li>
<li><a href="#References">11 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

![RaspPi.png](http://eLinux.org/images/thumb/c/ca/RaspPi.png/25px-RaspPi.png) [Back to
the Hub](http://eLinux.org/RPi_Hub "RPi Hub")



**Getting Started:**

*[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - for advice on
buying the Raspberry Pi.*

*[SD Card Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") - for
information on how to prepare the SD Card used to boot your Raspberry
Pi.*

*[Basic Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") -
for help with buying / selecting other hardware and setting it up.*

***Beginners Guide** - you are up and running, now what can you do?*

*[Advanced Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") - for more
extensive information on setting up.*

*[Trouble Shooting](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting") - some
things to check if things don't work as expected.*

There is some restructuring going on , we are sorry for the
inconvenience.

# Where to start?

Any easy question to ask, but a very difficult one to answer!

1.  **If you are looking for any information related to SD Cards and
    setup look
    [here](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup")**
2.  If you need to get a RPi, the see the [Buying
    Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide").
3.  If you need to know what equipment you will need and how to set it
    up, see the [Basic Hardware
    Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") page.
4.  If you need to install/setup an SD card see the [Preload your
    Card](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") section.
5.  If something is not working, check the
    [Troubleshooting](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting")
    section.
6.  If you need help with Debian, try the [Debian
    Wiki](http://wiki.debian.org/FrontPage).
7.  If you have imaged an SD with the Debian Wheezy image and started
    your RPi here's some help with what you see first - the raspi-config
    menu [RPi\_raspi-config](http://eLinux.org/RPi_raspi-config "RPi raspi-config")
8.  Help for Noob's with a quizical disposition and Wheezy or Raspbian
    instalations
    [here](http://eLinux.org/RPi_Noob_Guides_for_Wheezy_using_2012-16-18_beta "RPi Noob Guides for Wheezy using 2012-16-18 beta")
9.  If you don't have a composite monitor or HDMI then it may be worth
    you looking at [Blind Login
    Method](http://eLinux.org/RPi_A_Method_for_ssh_blind_login "RPi A Method for ssh blind login")
10. Build yourself a Wheezy
    [LAMP](http://eLinux.org/RPi_A_Simple_Wheezy_LAMP_install "RPi A Simple Wheezy LAMP install")
    webserver.
11. VNC connection for the monitorily challenged Noob [VNC for a wheezy
    install](http://eLinux.org/RPi_Wheezy_VNC "RPi Wheezy VNC") (noobs that are using the
    Blind Login)
12. If you've done all that, and you are wondering what next...**welcome
    and read on!**



    References needed (idea for new section Living Without RPi, which can guide users or link to info to users who haven't got RPis)
         Link to emulation builds or live linux cds setup for beginners (RacyPy2 for example)

If you don't have a Raspberry Pi yet, you can still try things out, see
[Windows RPi Emulator](http://sourceforge.net/projects/rpiqemuwindows/)
for details.

# What is Linux and why not use Windows?

Linux is an operating system just like Windows, however, unlike Windows
(which needs a set hardware requirement to run i.e. One Size fits or get
different hardware), Linux comes in many varieties and configurations
which means you can usually find a flavour (or Distribution) which fits
your hardware big or small / fast or slow.

The Raspberry Pi is not suited to running Windows due to its hardware,
but there are plenty of Linux Distributions which fit nicely. In
addition to this, most Distributions of Linux are free, however Windows
can cost many times the price of the Raspberry Pi itself.

Chances are you already have Linux running in your home without you even
knowing it, since it is commonly used in Kindle ebook readers, Android
smartphones, modern TVs, Freeview and cable boxes to run things and
ensure your recording of **Inbetweeners** or **Prison Break** gets done!

For more information about Linux see
[Wikipedia](http://en.wikipedia.org/wiki/Linux)

Also see
[FAQ](http://eLinux.org/index.php?title=RPi_End-user_FAQ_End-User&action=edit&redlink=1 "RPi End-user FAQ End-User (page does not exist)")
And [Running XXX on the RPi](http://eLinux.org/Will_RPi_Run "Will RPi Run")

# Basic Raspbian Setup

When you first turn on your Raspberry Pi with it's fresh Debian image on
the SD card, you will likely want to tweak the system settings. Luckily,
there's a tool called
[raspi-config](http://eLinux.org/RPi_raspi-config "RPi raspi-config") which makes
everything super-easy to set up. This automatically launches when you
first boot Raspbian up, and (for the most part) it is in plain English.

If you want to access the setup screen again, just type:

     sudo raspi-config

in the terminal (LXTerminal in the desktop UI).

# Intro to the CLI (Command Line Interface)

You will need to use the Command Line Interface at some point in your
management of the RPi. The command line interface is a powerful way to
interact with the Raspberry Pi and is well worth learning some basic
commands to get started with.

For an introductory guide to some basic commands please see: [Command
Line Interface "Must Have" Commands](http://eLinux.org/CLI_Spells "CLI Spells"). Featured
on the Raspberry Pi [home
page](http://www.raspberrypi.org/archives/1414) was also a link to this
site for ["learning the
shell"](http://linuxcommand.org/learning_the_shell.php)

Your SD card may boot into a GUI, if not and you are done with the text
interface and want to use a graphical one instead, run:

       startx

# Remote Access

Your default install probably has a ssh (secure shell) "daemon" running.
This means that you can run everything on your RPi with only the network
attached. Provided you know which IP address it has. With appropriate
software installed on your Windows, Mac or Linux PC, you can also run a
GUI remotely.

Prior to your initial remote access it is recommended that you
regenerate unique host public/private ID keys with the following command

     rm /etc/ssh/ssh_host_* && dpkg-reconfigure openssh-server

More details about remote access (including remote GUI are at [RPi
Remote Access](http://eLinux.org/RPi_Remote_Access "RPi Remote Access")

# Installing and updating software to your Raspberry Pi

You will probably want to add software to your Raspberry Pi, as well as
keep the current packages up to date. With Raspbian this is performed
using apt-get. The most common commands can be found in the [adding
software page](http://elinux.org/Add_software). It is good practice to
regularly ensure you run the update and upgrade commands detailed in the
[guide](http://elinux.org/Add_software) to ensure you have the most up
to date software packages.

The apt-get package for Raspbian will also keep the GPU firmware updated
to the latest stable release. If you'd like to try the bleeding edge
releases you can read more on the [RPi
Software](http://elinux.org/RPi_Software#GPU_bootloaders).

# Adding USB Storage to Your Raspberry Pi

Sooner or later, you're going to run out of room on the SD card used to
boot up your Raspberry Pi. For a tutorial on how to connect USB flash
drives and hard drives to your Pi to expand storage, see: [Adding USB
Drives to a Raspberry Pi](http://elinux.org/RPi_Adding_USB_Drives)

# Beginner Projects

Here are a few things you can try out with your Raspberry Pi, in most
cases all you'll need is your SD Card loaded with a particular
preconfigured OS Distribution.

It will be worth getting a few spare SD Cards if you think you will
switch between setups regularly or become familiar with how to **back up
and restore** your card.

    Reference needed - a good guide on how to backup and restore cards or software to do this easily

## Backup your SD card

For Windows users the 'Raw HDD Copy Tool' from HDD Guru works well to
backup and restore your SD card between projects. This can backup and
restore the entire card sector by sector to/from an img file, and
doesn't care which file system is on the card.

[Raw HDD Copy Tool](http://hddguru.com/software/HDD-Raw-Copy-Tool/)

Linux and Mac OS(X) users can use the
[dd](http://www.gnu.org/software/coreutils/manual/html_node/dd-invocation.html)
tool that comes with most versions of Linux (including Raspbian) to save
the contents of an SD card as an image file. Warning: be sure to use
this tool carefully as accidentally choosing your hard drive as the
output will destroy all data on it.

Mac OSX users can use
[PiCloner](http://sourceforge.net/projects/picloner/). The PiCloner app
is easy to use and will help you detect your SD card, back it up to an
img file and is able to compress the img using GZIP to decrease backup
size. PiCloner is Free Open Source Software (FOSS) released under a BSD
License so it's **Free** as in; **Free Beer**!

## Media Player

With this configuration you will typically have the Raspberry Pi
connected to a TV or large monitor and a source of videos/music/photos
etc you wish to play (i.e. Internet/hard-drive/local network etc).

DesignSpark have written an article on this, which is worth a look,
[DesignSpark - Raspberry Pi goes to the
movies](http://www.designspark.com/blog/raspberry-pi-goes-to-the-movies)

You can download an installer from www.raspbmc.com which will install to
your desktop (IOS, Windows, Linux) and write the latest install to your
SD card. You then boot your Pi with the card and go through the config
steps.

There is a breif video basic tutorial here:
[http://www.instructables.com/id/RaspberryPi-Media-center-XMBC/](http://www.instructables.com/id/RaspberryPi-Media-center-XMBC/)

*Reference needed - More information is needed on specific configuration
choices for raspbmc, although raspbmc.com does have a wiki.*

## Play Games

While there are not any commercial games for the Raspberry Pi (yet)
there are plenty ways to play games on it.

Many distributions will have games built into them, and some may well
support emulation of other platforms so you can run those games.

Also, a lot of Raspberry Pi users will be writing simple games which
will be available for others to enjoy (and if desired added to or
modified).

    Reference needed - game section is empty at the moment!

*See the [Games Section](http://eLinux.org/RPi_Games "RPi Games") for more details*



## Introducing Young Children To Computers

    Reference needed - some kid friendly and fun stuff!



## Teaching

There is a huge number of groups, links and resources available within
the [Education](http://eLinux.org/RPi_Education "RPi Education") section.

    Reference needed - links to the learning pages, education links and school/university groups



## Learn To Program

There is a huge selection of [programming
languages](http://eLinux.org/RPi_Programming "RPi Programming") which you can use to
write interesting programs, games, applications and utilities. There are
also more great links within the
[Education](http://eLinux.org/RPi_Education#Programming_languages "RPi Education")
section.

There is a huge selection to choose from (not just Python...) which
should suit any ability and a range of purposes.

If you are new to programming, there are plenty of tutorials for getting
started in the [Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") Section.

Books about programming can be found in the
[Books](http://eLinux.org/RPi_Programming_Books "RPi Programming Books") Section.

In the latest Debian, Python (+Pygame) and MIT Scratch are
pre-installed.

-   [Raspberry Pi
    Beginners](http://www.youtube.com/user/RaspberryPiBeginners)
    (videos)
-   [Raspberry Pi YouTube
    Tutorials](http://www.youtube.com/user/RaspberryPiTutorials)
    (videos)
-   [My First Raspberry Pi
    Game](http://www.youtube.com/playlist?list=PLgyU3jNA6VjS3ij6ZXbb2x4GdEP3bAWzO)
    (videos)
-   [Easy GPIO Hardware &
    Software](http://eLinux.org/RPi_Tutorial_Easy_GPIO_Hardware_%26_Software "RPi Tutorial Easy GPIO Hardware & Software")
    (videos) - in-progress at the moment

<!-- -->

    Reference needed - links to the learning pages, recommended books?

## Interface With Hardware

1.  [Interfacing with
    Arduino](http://eLinux.org/RPi_Interfacing_with_hardware "RPi Interfacing with hardware")

<!-- -->

    Reference needed - links to basic circuits tutorials and expansion boards

## Word Processing/Internet Browsing etc

Yes, the Raspberry Pi can do the majority of the dull stuff too which
other computers do.

**Debian** currently comes with Midori installed for web browsing and
word processing programs be installed rather easily.

-   Entering "sudo apt-get install chromium-browser" into a terminal
    will install Chromium which is generally a faster and more featured
    browser than Midori
-   Entering "sudo apt-get install openoffice.org" into a terminal will
    install OpenOffice.org, a free Microsoft Office-like application
    suite
-   Entering "sudo apt-get install abiword-common" into a terminal will
    install AbiWord, a lighter weight but still fully functional word
    processor
-   Entering "sudo apt-get install gnumeric" into a terminal will
    install Gnumeric, a lighter weight but still fully functional
    spreadsheet

<!-- -->

     More information needed

## Your Own Pet Project!

The sky is the limit really, with some time and effort any number of
projects can be achieved.

Even if you don't have the skill to do it yourself, you can join like
minded people by getting involved with one of the numerous groups in the
[Community Section](http://eLinux.org/RPi_Community "RPi Community"), also within the
[Education](http://eLinux.org/RPi_Education "RPi Education") pages or learn what you need
in from the [Guides](http://eLinux.org/RPi_Guides "RPi Guides") &
[Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") sections.

Of course, if you do anything interesting then please let us know in the
[Projects](http://eLinux.org/RPi_Projects "RPi Projects") section.

# Living Without RPi

Even if you do not have any Raspberry Pi hardware there are a number
things you can do to learn about Linux, programming or even controlling
hardware.

## Using Linux

You can install a version of Linux on most computers, and on many you
will be able to "try out" Linux by using a "Live CD" - this will start
your computer up running from a CD or DVD and run Linux (without
installing anything to the computer itself).

RacyPy - This is a simple LiveCD of Puppy Linux which includes some
basic programming languages and a light-weight graphical user interface
(GUI).

You can get it from here:

[teampython
RacyPy](http://teampython.wordpress.com/2012/03/03/while-you-wait-for-your-raspberry-pi-why-not-use-racypy2/)

## Trying Programming

Many of the programming languages you can use on the Raspberry Pi can be
installed on a Windows or Mac machine. Just visit the websites of the
languages you are interested in and see if they have an installer for
your operating system.

## Controlling Hardware

As discussed in the [Easy GPIO Hardware &
Software](http://eLinux.org/RPi_Tutorial_Easy_GPIO_Hardware_%26_Software "RPi Tutorial Easy GPIO Hardware & Software")
tutorials, there are lots of alternative hardware you can use to
experiment with (some as little as \$5).

# About This Page - For Contributors

The intention of this page is to provide a **starting point** for
beginners and to **direct them to** the kind of information a person
would need in order to start doing something useful or interesting with
a Raspberry Pi.

It is not intended to contain or replicate much of the information
already available on-line or elsewhere in the wiki, however please
create new wiki pages and link them here if there is information
beginners will find useful (similarly any section which grows too much
here, should be separated into new pages as and when needed)!

    At the moment building up ideas of content of typical things beginners will want to know and the kind of things they will want to do first.

* * * * *



# References



-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

[Raspberry Pi](http://eLinux.org/R-Pi_Hub "R-Pi Hub")

**Startup**

[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - [SD Card
Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") - [Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") - [Advanced
Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") - **Beginners Guide** -
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

[Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") -
[Guides](http://eLinux.org/RPi_Guides "RPi Guides") -
[Projects](http://eLinux.org/RPi_Projects "RPi Projects") -
[Tasks](http://eLinux.org/RPi_Tasks "RPi Tasks") -
[DataSheets](http://eLinux.org/RPi_DatasheetCategories "RPi DatasheetCategories") -
[Education](http://eLinux.org/RPi_Education "RPi Education") -
[Communities](http://eLinux.org/RPi_Community "RPi Community")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")

