> From: [eLinux.org](http://eLinux.org/CR48-Nano "http://eLinux.org/CR48-Nano")


# CR48-Nano



# Installing the Nano text editor

### NOTE:You need to [root](http://eLinux.org/CR48-rooting "CR48-rooting") your CR48 before you can install this!

Open up a shell on the cr-48, and ` `

-   sudo su
-   mkdir /mnt/stateful\_partition/opt -- (if you haven't already)
-   cd /mnt/stateful\_partition/opt
-   wget
    [http://www.calliesfarm.com/chromeos/nano.tar.gz](http://www.calliesfarm.com/chromeos/nano.tar.gz)
-   tar -zxvf nano.tar.gz
-   cd nano
-   mv nano /usr/bin

Then you should be able to execute nano, and have a text editor!


[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

