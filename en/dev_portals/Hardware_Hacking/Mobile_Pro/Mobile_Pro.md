> From: [eLinux.org](http://eLinux.org/Mobile_Pro "http://eLinux.org/Mobile_Pro")


# Mobile Pro



This is the site for the NEC **Mobile Pro** 770/780/790 set of Handheld
PCs. These handhelds are rather neat, and can make a powerful target for
a strong linux system. Among the overall specs of these things we have:

-   VR4121 168mhz 32/64 bit processor (PD30121) - you can access some
    info about it here:
    [http://www.linuxdevices.com/products/PD3171456766.html](http://www.linuxdevices.com/products/PD3171456766.html)
-   32mb of RAM memory
-   24mb of ROM memory
-   16mb of Flash (only on the 790 model)
-   A PC card bridge serving one PCMCIA slot and one [Compact
    Flash](http://eLinux.org/Compact_Flash "Compact Flash") slot
-   Near full size keyboard
-   640x240 64k color DSTN LCD screen with touch panel
-   56k modem
-   [IrDA](http://eLinux.org/IrDA "IrDA")
-   NEC proprietary serial plug, requires NEC cable or just wire a cable
    yourself and solder it onto the pins
-   VGA out

Components inside it listed and checked so far (this list was made while
fixing a problem with the PCMCIA socket, so it will be updated later
with more accurate information) - refer to the board picture for more
info, I will try to get a scan of it later.

-   NEC VR4121A D30121F1 (PD30121) Processor
-   RICOH RFC5C396L PC Card controller
-   CONEXANT RP56LD (Modem controller)
-   [Media
    Q](http://eLinux.org/index.php?title=Media_Q&action=edit&redlink=1 "Media Q (page does not exist)")
    MQ200 LCD Controller
-   2x HYUNDAI GM72V661641CLT7J 64mbit chips onboard
-   2x HYUNDAI GM72V661641CLT7J 64mbit chips on a plugable board (memory
    upgrade anyone?)
-   2x NEC 023C128040L (???) -\> Supposedly the ROM chips, but I can't
    find any information. I haven't really looked for it yet either.

Here we got a pic of the thing:
[mp-open.jpg](http://i7.photobucket.com/albums/y283/ricmm104/mp-open.jpg)

The front - CF slot in the middle, headphones jack and microphone at the
right:
[mp-front.jpg](http://i7.photobucket.com/albums/y283/ricmm104/mp-front.jpg)

PCMCIA Socket on the right side:
[mp-pcmcia.jpg](http://i7.photobucket.com/albums/y283/ricmm104/mp-pcmcia.jpg)

Back of the device (battery):
[mp-back.jpg](http://i7.photobucket.com/albums/y283/ricmm104/mp-back.jpg)

Bottom of the device, you can see the RAM/ROM plugable boards
compartment's cover:
[mp-bottom.jpg](http://i7.photobucket.com/albums/y283/ricmm104/mp-bottom.jpg)

And the board picture mentioned before:
[mp-board.jpg](http://i7.photobucket.com/albums/y283/ricmm104/mp-board.jpg)

I'm currently working using the linux-mips.org
[VR41xx](http://eLinux.org/index.php?title=VR41xx&action=edit&redlink=1 "VR41xx (page does not exist)")
code with a few modifications and code obtained from Linux on MCR700
project. Development is going on continuously on this device, the page
will be updated when deemed necessary.

Contact me for more info on: mendoza dot ricardo at gmail dot com

I would be interested in helping out on this project - how do i contact
you? - Paul


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware](http://eLinux.org/Category:Hardware "Category:Hardware")

