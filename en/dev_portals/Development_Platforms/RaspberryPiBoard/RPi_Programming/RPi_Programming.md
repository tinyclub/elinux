> From: [eLinux.org](http://eLinux.org/RPi_Programming "http://eLinux.org/RPi_Programming")


# Raspberry Pi Programming


(Redirected from [RPi
Programming](http://eLinux.org/index.php?title=RPi_Programming&redirect=no "RPi Programming"))


<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Programming_languages.2C_IDEs.2C_etc.">1 Programming languages, IDEs, etc.</a>
<ul>
<li><a href="#Tested_on_Alpha_board">1.1 Tested on Alpha board</a></li>
<li><a href="#Tested_on_Raspberry_Pi">1.2 Tested on Raspberry Pi</a></li>
<li><a href="#Expected_to_work">1.3 Expected to work</a></li>
</ul></li>
<li><a href="#Graphical_Programming">2 Graphical Programming</a></li>
<li><a href="#Robotics">3 Robotics</a></li>
<li><a href="#Would_Be_Great_If_These_Worked">4 Would Be Great If These Worked</a></li>
<li><a href="#Uncategorised">5 Uncategorised</a></li>
<li><a href="#References">6 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Software & Distributions:**

*[Software](http://eLinux.org/RPi_Software "RPi Software") - an overview.*

*[Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") - operating
systems and development environments for the Raspberry Pi.*

*[Kernel Compilation](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation")
- advice on compiling a kernel.*

*[Performance](http://eLinux.org/RPi_Performance "RPi Performance") - measures of the
Raspberry Pi's performance.*

*[Programming](http://eLinux.org/RPi_Programming "RPi Programming") - programming
languages that might be used on the Raspberry Pi.*

## Programming languages, IDEs, etc.

### Tested on Alpha board

-   Clojure
-   gas (GNU assembler) <sup>[[1]](#cite_note-1)</sup>
-   gcc
-   g++
-   Interp
-   Mono (C\#)
-   OCaml
-   Node.js 0.6.18 (JavaScript)
-   Perl
-   Python <sup>[[2]](#cite_note-2)</sup>
-   Ruby 1.9.2 (KidsRuby)
-   Scala
-   [Nimrod](http://nimrod-lang.org/)
-   [Tiny BASIC for Curses](http://freecode.com/projects/tinybc)

### Tested on Raspberry Pi

-   [C\#](http://eLinux.org/CSharp_on_RPi "CSharp on RPi")
-   [CodeBlocks](http://eLinux.org/CodeBlocks "CodeBlocks")
-   [Erlang](http://eLinux.org/Erlang "Erlang")
-   [Forth](http://eLinux.org/Forth "Forth")
-   [GalaxC programming language and XXICC "Chicken Coop"
    environment](http://xxicc.org) (works in progress)
-   [Go](http://eLinux.org/Go_on_RPi "Go on RPi")
-   Java
    -   [How to set up Java](http://eLinux.org/How_to_set_up_Java "How to set up Java")
        and add access to the hardware
    -   gcj - for Java code compilation,
    -   depending on *floatness*, Oracle JVM may or may not be
        available. For now, only soft-float JVM is available. See
        [here](http://www.oracle.com/technetwork/articles/java/raspberrypi-1704896.html)
        for thorough description.
    -   Groovy (requires Java)
    -   Other JVMs are compared
        [here](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=34&t=15639).
-   JavaScript via [Node.js](http://eLinux.org/Node.js_on_RPi "Node.js on RPi")
-   Pascal
    -   [Free Pascal Compiler / Object Pascal
        language](http://eLinux.org/Free_Pascal_on_RPi "Free Pascal on RPi")
    -   [Lazarus](http://eLinux.org/Lazarus_on_RPi "Lazarus on RPi"), the professional
        cross-platform IDE for [Free
        Pascal](http://eLinux.org/Free_Pascal "Free Pascal").
-   PHP
-   Python <sup>[[3]](#cite_note-3)</sup>
-   Regina Rexx <sup>[[4]](#cite_note-4)</sup>
-   [Scratch](http://eLinux.org/Scratch_on_RPi "Scratch on RPi")
-   Tcl/Tk

### Expected to work

-   Eclipse
-   (maybe) BoaConstructor
-   Anjuta for C/C++
-   Dev-C++
-   [Lua](http://www.lua.org/)
-   [BBC BASIC](http://www.bbcbasic.co.uk/bbcbasic.html)
    -   [mdfs.net](http://mdfs.net/Software/BBCBasic/)
    -   [ROOL
        wiki](http://www.riscosopen.org/wiki/documentation/show/*BASIC),
        forum threads:
        [1](http://www.riscosopen.org/forum/forums/1/topics/693),
        [2](http://www.riscosopen.org/forum/forums/3/topics/183),
        [3](http://www.riscosopen.org/forum/forums/5/topics/129),
        [4](http://www.riscosopen.org/forum/forums/2/topics/71),
        [5](http://www.riscosopen.org/forum/forums/2/topics/71)
-   [Small Basic](http://smallbasic.com/)
-   [Squeak implementation of Smalltalk](http://www.squeak.org/)
-   [Processing](http://processing.org/)
-   Other BASIC variants common to Debian, Ubuntu, Fedora, etc. are all
    likely to work fine, including:
    -   [basic256](http://http://basic256.org) - educational BASIC
        programming environment for children
    -   [bwbasic](http://www.bwbasic.at/tutorial.htm) - Bywater BASIC
        Interpreter
    -   [sdlbasic](http://sdlbasic.sf.net) - BASIC interpreter for game
        development
    -   [yabasic](http://www.yabasic.de/) - Yet Another BASIC
        interpreter
-   [Regina Rexx](http://regina-rexx.sourceforge.net/)

> *See also:*
> [RaspberryPiBoard/EducationalLinks](http://eLinux.org/RaspberryPiBoard/EducationalLinks "RaspberryPiBoard/EducationalLinks")
> for education-friendly languages.

## Graphical Programming

-   [Gambas](http://gambas.sourceforge.net/) - possibly a good choice;
    easy like old Visual Basic
-   [Scratch](http://scratch.mit.edu/)
-   [Alice](http://www.alice.org/)
-   [Android App Inventor](http://appinventor.googlelabs.com/)
-   [Kodu](http://fuse.microsoft.com/projects-kodu.html)
-   [Star Logo](http://education.mit.edu/starlogo/)
-   [PrimerLabs CodeHero](http://primerlabs.com/codehero)
-   [Lazarus](http://www.lazarus.freepascal.org) I was working on
    LaZor**OS4**Pi a while back to provide a on-device IDE but I'm stuck
    with only a VGA monitor + chroot. Will pick it back up asap for it
    is a great combination. (Used: Fedora, [Razor-QT
    desktop](http://razor-qt.org/) and Lazarus-QT+FreePascal. 2nd
    attempt =\> [Funtoo](http://funtoo.org))
-   [YAD](http://code.google.com/p/yad) 'Yet Another Dialog' for fast
    GUI scripting in Bash.
-   [EasyBashGui](https://sites.google.com/site/easybashgui) Want to
    keep it fast and simple than this is your tool. Goes even faster
    with the code snippets from Komodo Edit + Bash Menu plugin.
-   [BlueGriffon](http://bluegriffon.org) is a very slick WYSIWYG editor
    for HTML5.
-   [fpGUI Toolkit](http://fpgui.sourceforge.net) has been tested and
    fully working on the Raspberry Pi. fpGUI is a custom drawn, full
    featured, cross-platform GUI toolkit that has been in development
    since 2006. fpGUI can be use for Desktop or Embedded environments,
    and is suitable for commercial and open source projects. Implemented
    100% in Object Pascal, and producing small executables and very low
    library dependency (just the standard X11 - no Qt or GTK, etc.
    required). For a very quick setup of the Free Pascal Compiler &
    fpGUI Toolkit, download the starter archive (3.5 MB download) from
    [http://www.turbocontrol.com/easyfpgui.htm](http://www.turbocontrol.com/easyfpgui.htm).
    Unzip, and you are ready to go! fpGUI includes lots of ready made
    widgets, a documentation viewer (docview), a Visual GUI Forms
    Designer (uidesigner), and an IDE (maximus). The IDE is still in the
    very early stages of development, but any programmer editor could be
    used with fpGUI too.
-   [Pi3D hardware accelerated 3D (and 2D) for
    Python](https://github.com/rec/pi3d) - still being improved but
    works now
-   [Adafruit Learning System Raspberry Pi
    WebIDE](http://learn.adafruit.com/webide/overview) - allows programs
    to be written, compiled, and executed on the Raspberry Pi via a web
    interface.
-   [Pridopia Scratch-RaspberryPi GPIO
    Driver](http://www.pridopia.co.uk/rs-pi-set-scratch.html) -- helping
    children / beginner programmers / hardware enthusiasts build up
    their skills by doing simple tasks with even easier commands /
    controls.

## Robotics

-   [Lego Mindstorms](http://mindstorms.lego.com/en-us/Default.aspx)
-   [KTurtle](http://edu.kde.org/kturtle/) and other Logo/[turtle
    graphics](http://en.wikipedia.org/wiki/Turtle_graphics) (The I/O
    board supports motor drive outputs)

## Would Be Great If These Worked

-   wvdial -- Dialer for Land-line, GSM, UMTS modems and other serial
    devices.
-   VHDL -- VHDL (VHSIC hardware description language) is a hardware
    description language used in electronic design automation to
    describe digital and mixed-signal systems such as field-programmable
    gate arrays and integrated circuits.
-   Verilog -- Verilog, standardized as IEEE 1364, is a hardware
    description language (HDL) used to model electronic systems. It is
    most commonly used in the design and verification of digital
    circuits at the register-transfer level of abstraction. icarus
    verilog (iverilog) is available at
    [http://iverilog.icarus.com/](http://iverilog.icarus.com/) or
    apt-get install iverilog

## Uncategorised

-   [Sugar Learning Platform: An alternative to the Desktop metaphor of
    the GUI](http://wiki.sugarlabs.org/go/What_is_Sugar%3F)
-   [Frink](http://futureboy.us/frinkdocs/) - A language that tracks
    units of measure through all calculations. If Java works, Frink will
    work. Frink runs under any version of Java 1.1 or later. Can work
    without GUI, with AWT GUI, or with Swing GUI, or run on Android if
    that's what you're using.
-   [GAViewer](http://www.geometricalgebra.net/gaviewer_download.html)
-   [GeoGebra](http://www.geogebra.org/cms/)
-   [codecademy.com](http://codecademy.com)

See also [Category:Education](http://eLinux.org/Category:Education "Category:Education")

## References

1.  [↑](#cite_ref-1)
    [http://www.vanhaarlem.eu/assembler](http://www.vanhaarlem.eu/assembler)
2.  [↑](#cite_ref-2)
    [http://ntoll.org/article/baking-with-raspberrypipy](http://ntoll.org/article/baking-with-raspberrypipy)
3.  [↑](#cite_ref-3)
    [http://ntoll.org/article/baking-with-raspberrypipy](http://ntoll.org/article/baking-with-raspberrypipy)
4.  [↑](#cite_ref-4) [http://www.rexx.org/](http://www.rexx.org/)



-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://www.elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

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

[Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") -
[Guides](http://eLinux.org/RPi_Guides "RPi Guides") -
[Projects](http://eLinux.org/RPi_Projects "RPi Projects") -
[Tasks](http://eLinux.org/RPi_Tasks "RPi Tasks") -
[DataSheets](http://eLinux.org/RPi_DatasheetCategories "RPi DatasheetCategories") -
[Education](http://eLinux.org/RPi_Education "RPi Education") -
[Communities](http://eLinux.org/RPi_Community "RPi Community")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")

