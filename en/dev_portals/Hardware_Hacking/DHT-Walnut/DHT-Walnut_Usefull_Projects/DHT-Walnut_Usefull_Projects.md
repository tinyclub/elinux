> From: [eLinux.org](http://eLinux.org/DHT-Walnut_Usefull_Projects "http://eLinux.org/DHT-Walnut_Usefull_Projects")


# DHT-Walnut Usefull Projects



[mpd](http://www.musicpd.org/) server

Following in the footsteps of [Nate
True](http://devices.natetrue.com/musicap/), I turned a DHT-Walnut +
parts into a server to play my music collection. It grabs the data via
nfs from an NSLU2, and is controlled via various
[mpc-like](http://www.musicpd.org/clients.shtml) clients from my
desktops.

[![Mpdserver.jpg](http://eLinux.org/images/6/6b/Mpdserver.jpg)](http://eLinux.org/File:Mpdserver.jpg)

After the above was running flawlessly for a day, somehow the usb audio
device got fried. May have been a ground loop in the stereo. I had
gotten used to having music playing. so I dug out an old PCI sound card
(CS4280 based) and compiled the drivers and plugged it in. GIGO... seems
like
[IBM4xx](http://eLinux.org/index.php?title=IBM4xx&action=edit&redlink=1 "IBM4xx (page does not exist)")
DMA support needs to be turned on in the kernel to make it work. Things
are fine now with a few extra ground wires, just to be sure.

[[[Media:config.gz]] 2.6.16-pre3 configuration]

[![Mpdserver1.jpg](http://eLinux.org/images/0/0a/Mpdserver1.jpg)](http://eLinux.org/File:Mpdserver1.jpg)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")

