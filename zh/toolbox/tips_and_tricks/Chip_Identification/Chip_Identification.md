> From: [eLinux.org](http://eLinux.org/Chip_Identification "http://eLinux.org/Chip_Identification")


# Chip Identification



Chip Detective: TV show helps with tech issue

One of the common problems while debugging a new board, as well as
reverse engineering designs, is the inability to read part numbers on IC
packages. During assembly the parts are baked at high temperatures and
often washed with chemicals which can cause the package markings to
become very difficult to read.

About 8 years ago i was watching one of the generic "Detective" TV shows
where they had a hand gun with the serial number ground off. On the TV
show, they used a colored die and different camera lighting to bring out
the serial number as the imprint what still on the metal of the gun. I
thought to myself... Can i use this method to read the markings on IC
packages?

I purchased a small usb based microscope and did some testing. Sure
enough it worked.

Today one of my most valued tools is the Celestron 44302-A Deluxe
Handheld Digital Microscope(about \$50USD). It works with most linux
utilities including guvcview which I use to capture images. I've
uploaded a picture of an IC taken after the IC had been installed on a
pcb. You will notice that the markings are pretty hard to read. Using a
Sharpie you can paint the top of the package to bring out the markings.
I've tried all the basic colors and found that the yellow is the best.
It is dark enough to bring out the markings, but not too opaque to
obscure the markings. The second photo is a capture after painting the
IC with the yellow Sharpie. You can see a pretty dramatic difference.
The third capture is done with the usb microscope at a 45 degree angle
with the part, which makes the markings really jump out.


 EDIT: this also works on ceramic packages where the markings have
intentionally removed. Since most of the markings are done with laser
etching, the ceramics usually retain the markings and the yellow ink
will get absorbed into the ceramic portions "damaged" by the laser
etching.

-   [Celestron
    Microscope](http://www.amazon.com/Celestron-44302-Handheld-Digital-Microscope/dp/B001UQ6E4E/ref=sr_1_1?ie=UTF8&qid=1302633075&sr=8-1)

[![Celestron.jpg](http://eLinux.org/images/2/20/Celestron.jpg)](http://eLinux.org/File:Celestron.jpg)

[![Chip-id-procedure-1.jpg](http://eLinux.org/images/4/44/Chip-id-procedure-1.jpg)](http://eLinux.org/File:Chip-id-procedure-1.jpg)

[![Chip-id-procedure-2.jpg](http://eLinux.org/images/e/e5/Chip-id-procedure-2.jpg)](http://eLinux.org/File:Chip-id-procedure-2.jpg)

[![Chip-id-procedure-3.jpg](http://eLinux.org/images/8/84/Chip-id-procedure-3.jpg)](http://eLinux.org/File:Chip-id-procedure-3.jpg)

[![Chip-id-procedure-pen.jpg](http://eLinux.org/images/0/00/Chip-id-procedure-pen.jpg)](http://eLinux.org/File:Chip-id-procedure-pen.jpg)


