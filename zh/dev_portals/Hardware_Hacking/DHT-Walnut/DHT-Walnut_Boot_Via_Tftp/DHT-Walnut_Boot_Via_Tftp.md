> From: [eLinux.org](http://eLinux.org/DHT-Walnut_Boot_Via_Tftp "http://eLinux.org/DHT-Walnut_Boot_Via_Tftp")


# DHT-Walnut Boot Via Tftp



It's relative easy if:

-   You have a tftp server setup
-   Have a kernel Image and Userland Image in the /tftpboot/ directory
    on your server

-   -   =\>tftpboot 400000 [Working Kernel
        Image](http://eLinux.org/index.php?title=Working_Kernel_Image&action=edit&redlink=1 "Working Kernel Image (page does not exist)")
    -   \< kernel image loads \>
    -   =\>tftpboot c00000 [Working Userland
        Image](http://eLinux.org/index.php?title=Working_Userland_Image&action=edit&redlink=1 "Working Userland Image (page does not exist)")
    -   \< userland image loads \>
    -   bootm 400000 c00000
    -   \< kernel boots and loads userland image \>


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")

