> From: [eLinux.org](http://eLinux.org/CR48-Locate "http://eLinux.org/CR48-Locate")


# CR48-Locate



# Installing Locate

### NOTE: You need to [root](http://eLinux.org/CR48-rooting "CR48-rooting") your CR48 before you can do this!

Open up a shell on the cr-48, and ` `

-   sudo su
-   wget
    [http://www.calliesfarm.com/chromeos/locate.tar.gz](http://www.calliesfarm.com/chromeos/locate.tar.gz)
-   mv locate.tar.gz /
-   cd /
-   tar -zxvf locate.tar.gz
-   rm -rf locate.tar.gz

after it's installed, you should be able to run
 ` updatedb`
 to populate the database, and it should add a cron job to auto update
the db daily


[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

