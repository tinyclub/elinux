> From: [eLinux.org](http://eLinux.org/ZipIt_WiFi_Connect "http://eLinux.org/ZipIt_WiFi_Connect")


# ZipIt WiFi Connect



I've been trying to connect my [ZipIt](http://eLinux.org/ZipIt "ZipIt") to my
university's wireless network for a month now, and it finally dawned on
me that once you connect to a wireless network with WEP on, you have to
explicitly turn it off before you connect to an unencrypted network...

eg.

To see a list of networks, both encrypted and unencrypted do a:

    iwlist eth0 scanning

To connect to an unencrypted network, you do a:

    iwconfig eth0 essid [ESSID]
    udhcpc

To connect to an encrypted network, you do a:

    iwconfig eth0 essid [ESSID] key [WEP key]
    udhcpc

However, if you want to connect to an unencrypted network after this,
you need to do a:

    iwconfig eth0 essid [ESSID] key off
    udhcpc

I really hope I'm the only person that didn't figure this out yet... lol

)

Albert


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

