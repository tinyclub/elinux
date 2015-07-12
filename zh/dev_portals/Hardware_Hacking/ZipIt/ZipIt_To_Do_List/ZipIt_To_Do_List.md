> From: [eLinux.org](http://eLinux.org/ZipIt_To_Do_List "http://eLinux.org/ZipIt_To_Do_List")


# ZipIt To Do List



So, as far as I can tell, the next steps in
[OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") development should be focused on
turning it from a proof-of-concept into a useable platform for wireless
messenging (and other whatever cool stuff we can think of.)

The major steps to doing that (as far as I've thought are):

1.  Making sure the device automatically connects to wireless access
    points properly. Cynfab (Ken McGuire) told me
    [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") currently tries connecting to
    any open wireless acces point, but uses a static IP (should be DHCP
    or given the option) and also uses the DNS servers on his ISP's
    network (in /etc/resolv.conf)

1.  Getting a rudimentary GUI up and running. We need a simple program
    that gives you a menu allowing you to do things like launch
    centericq (or whatever), connect to an SSH server, view the list of
    access points, manually reconfigure the wifi settings, etc.

1.  Tying into the above points, making the thing do as much
    autoconfiguration as possible. I believe
    [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") '**should'** be usable without
    requiring manual customization (ie. modifying the root image.) In
    order for this to happen, it's got to have a little bit of smart
    software to do as much as possible automatically, and then when user
    intervention is required, prompt them with a GUI. (All this GUI
    stuff could be done in one program, call it something like
    "ZipItShell"...)

1.  Applications I already mentioned the important GUI application that
    should tie everything together, but
    [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") also needs more applications.
    Tiny, useful, cool applications.

1.  Documentation I think people would definitely be more inclined to
    try compiling apps for the Zipit if there was some documentation on
    how/where to get the toolchain needed to cross compile... (Did I see
    this somewhere before?)

1.  Lastly, we need [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") to still be
    customizable. That's why it's cool and fun. We need all the
    autoconfiguration and GUI and everything, but there still has to be
    extra room in the ROM for the user to add apps. Consequentally, we
    have to keep the whole idea of [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt")
    simple, like it is now. :)


 Thanks,

Albert [bomberman0]


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

