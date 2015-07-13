> From: [eLinux.org](http://eLinux.org/CR48-JavaVNC "http://eLinux.org/CR48-JavaVNC")


# CR48-JavaVNC



# Installing VNCViewer

### NOTE: Your device needs to be [rooted](http://eLinux.org/CR48-rooting "CR48-rooting") before you can continue.




-   Open up a shell on the cr-48, and

` sudo su mkdir /mnt/stateful_partition/opt (if you haven't already) cd /mnt/stateful_partition/opt wget http://www.calliesfarm.com/chromeos/java.tar.gz wget http://www.calliesfarm.com/chromeos/vncviewer.tar.gz tar -zxvf java.tar.gz tar -zxvf vncviewer.tar.gz rm -rf java.tar.gz vncviewer.tar.gz ln -s /usr/bin/java jre1.6.0_23/bin/java mv vncviewer/vncviewer /usr/bin`

-   After it's installed, you should be able to run

` vncviewer`

-   However, since there are no close window widgets, there's two ways
    to disconnect.. either navigate to the vnc server icon once
    connected, and tell it to disconnect you. or, kill it from the
    terminal.




[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

