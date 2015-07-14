> From: [eLinux.org](http://eLinux.org/CR48-stateful-exec "http://eLinux.org/CR48-stateful-exec")


# CR48-stateful-exec



# Making /mnt/stateful\_partition exec friendly

### NOTE: You need to [root](http://eLinux.org/CR48-rooting "CR48-rooting") your CR48 before you can do this!

Finally found out how to make the /mnt/stateful\_partition exec
permission persistant.
 ` `

-   sudo su
-   nano /sbin/chromeos\_startup -- I'll use
    [nano](http://eLinux.org/CR48-Nano "CR48-Nano")

Now, when scrolling around in nano, if the screen does not refresh
properly when scrolling up/down pages, press CTRL-L to make it redraw
the screen

While in nano, CTRL-C will give you you're current cursor position.
 We want to edit lines 51, 58, and 67.\<p\> Remove noexec, from each of
those lines
 The line should then look something like .... -o nodev,nosuid
.....\<p\> You can also remove the ,nosuid if you'll be wanting to
install and SUID programs on the stateful partition.
 Save the file by pressing CTRL-X and answering Y and pressing enter for
the filename.
 Reboot, and your stateful partition should be remounted with the
correct options from this point forward.



[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

