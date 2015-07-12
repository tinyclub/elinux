> From: [eLinux.org](http://eLinux.org/CR48-Timezone_wont_change "http://eLinux.org/CR48-Timezone_wont_change")


# CR48-Timezone wont change



## Fix for Wrong Timezone in 0.10.142.3 Dev Build

In addition to the static audio bug in the recent releases, the dev
0.10.142.3 build has a bug where the timezone resets to Pacific Standard
Time (PST) and can't be changed to any other timezone. Once again,
Google's on it and already has a fix that just needs pushing out. In the
meantime though, the workaround for this is quite easy, we'll just set
the timezone manually via the command line: Your Cr-48 needs the
developer switch on (towards battery contacts). Press CTRL+ALT+T to get
the crosh shell and type "shell" to get a bash shell. You don't however
need to be root, the chronos user has rights to do what we need to
do.\<p\> Run the command:
 ` cd /var/lib/timezone`
 This puts in the directory where timezones are set.
 Run the command:
 ` ls -l`
 That's l, s, space, dash, lowercase letter L. This shows us the current
localtime file which is just a symlink to the selected timezone. Because
of the bug, this will always be /usr/share/zoneinfo/US/Pacific.
 Run the command:
 ` rm localtime`
 Here we get rid of the incorrect timezone setting.
 Run the command:
 ` ln -s /usr/share/zoneinfo/US/Eastern localtime`
 which will recreate our symlink pointing the symlink file localtime at
the correct timezone. You may of course need to change Eastern to be one
of Alaska, Aleutian, Arizona, Central, East-Indiana, Hawaii,
Indiana-Starke, Michigan, Mountain, Pacific-New or Samoa depending on
your local timezone. If you managed to sneak your Cr-48 out of the U.S.,
there are other timezones one directory up.
 Reboot. Your time should now be correct for your localtimezone!




[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

