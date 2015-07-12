> From: [eLinux.org](http://eLinux.org/ZipIt_Software "http://eLinux.org/ZipIt_Software")


# ZipIt Software



The [ZipIt](http://eLinux.org/ZipIt "ZipIt") is an embedded Linux device. You can run
other Linux applications on the [ZipIt](http://eLinux.org/ZipIt "ZipIt") besides the
built-in Instant Messaging application. You can replace or add-on the
built-in [ZipIt](http://eLinux.org/ZipIt "ZipIt") software. Users have created software
for the [ZipIt](http://eLinux.org/ZipIt "ZipIt") that you can download for free.

To access the "hidden" Linux OS contained in the
[ZipIt](http://eLinux.org/ZipIt "ZipIt"), you must replace "re-flash" the built in
firmware. the currently available basic firmware is called
[BURN3](http://eLinux.org/BURN3 "BURN3"). Instructions on how to upload BURN3 to your
Zipit are here. [ZipIt WiFi Flash](http://eLinux.org/ZipIt_WiFi_Flash "ZipIt WiFi Flash")

Once you have installed BURN3, you can access the Linux command line.
You then mount a NFS server running on another machine via
[WiFi](http://eLinux.org/WiFi "WiFi") and can run software you have stored there on the
[ZipIt](http://eLinux.org/ZipIt "ZipIt").

## Available software

-   **[OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt")** Lots of new features for the
    Zipit, including audio playback.

-   Adam has developed software to add many functions to the
    [ZipIt](http://eLinux.org/ZipIt "ZipIt") including a web browser. Here's more info
    [ZipIt Adam Software](http://eLinux.org/ZipIt_Adam_Software "ZipIt Adam Software")
    Detailed instructions on how to install this software: [ZipIt Adam
    HOWTO](http://eLinux.org/ZipIt_Adam_HOWTO "ZipIt Adam HOWTO")

-   **Lynx browser**
    [http://68.204.179.1/zipit/lynx.html](http://68.204.179.1/zipit/lynx.html)

-   **Nano X**
    [http://newstar.rinet.ru/\~goga/zipit/nano-X/](http://newstar.rinet.ru/~goga/zipit/nano-X/)

-   [Karosium](http://karosium.com/) blog about experiences with the
    Zipit and [Pixil](http://pixil.org/)/[Nano
    X](http://eLinux.org/index.php?title=Nano_X&action=edit&redlink=1 "Nano X (page does not exist)")
    GUI.

Get the following from:
[http://www.santoni.ca/albert/zipit.html](http://www.santoni.ca/albert/zipit.html)

-   **sed-4.1.2** - the usual UNIX stream editor (notably missing from
    [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt"))
-   **minised-1.5** - a smaller implementation of sed.
-   **ipdump2-pre1** - a simple packet sniffer
-   **wget-1.9.1** - retrieves files using HTTP, HTTPS and FTP
-   **wavemon-0.4.0b** - a neat utility to provide some realtime
    wireless statistics. more info: [ZipIt
    Wavemon](http://eLinux.org/ZipIt_Wavemon "ZipIt Wavemon")
-   **ivorbisfile\_example** - using the Tremor library, this supplied
    sample application plays Ogg Vorbis files. (Use with:
    ./ivorbisfile\_example \< file.ogg \> /dev/zipaudio) - Also, make
    sure you load the sound drivers first... (run "go2" on
    [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt"))

Get the following from:
[http://stoa.dhs.org/\~cvs/zipit/](http://stoa.dhs.org/~cvs/zipit/)

-   **/sbin/init** This script is designed to work with Adam's Zipit
    distribution. It replaces /sbin/init on the root filesystem and
    attempts to boot an mmc card first, then mount an nfsroot
    filesystem.

-   **mmc driver** Optimized version of Ken's mmc kernel driver. This
    driver improves read/write performance by a factor of almost 2.
    Please ensure that your mmc data is backed up before testing this
    driver.

-   **Familiar** The Familiar Project is working to create the next
    generation of PDA OS. It is an ipkg based distribution for arm based
    handhelds (like the Zipit). The distribution is too large to fit
    within the 2MB flash available in the Zipit, but for those of us
    with an MMC interface or those willing to boot to an nfsroot
    filesystem, this distribution could be an ideal way to expand upon
    the available software.

-   **zipit-tools** A set of tools for accessing the Zipit hardware.
    These tools include preliminary versions of programs to do software
    shutdown, suspend to RAM, and a powerd daemon to handle suspend when
    the lid is closed. Also, tools for manipulating the
    [LEDs](http://eLinux.org/LED "LED") and obtaining battery status are being worked on.

Get software from
[http://www.cybertheque.org/homebrew/zipit/](http://www.cybertheque.org/homebrew/zipit/)

-   X-10 control software
-   Linphone

## Source Code

Info on compiling sourcecode is at [ZipIt
Compile](http://eLinux.org/ZipIt_Compile "ZipIt Compile")

-   **Lid** - check to see if lid closed button is pressed [ZipIt
    Lid](http://eLinux.org/ZipIt_Lid "ZipIt Lid")
-   **zipitgfx** - a tiny little graphics library to do some rudimentary
    drawing to a Zipit's framebuffer [Zipit Gfx](http://eLinux.org/Zipit_Gfx "Zipit Gfx")

## Wishlist

Go here to see what people want: [ZipIt Software
Wishlist](http://eLinux.org/ZipIt_Software_Wishlist "ZipIt Software Wishlist")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

