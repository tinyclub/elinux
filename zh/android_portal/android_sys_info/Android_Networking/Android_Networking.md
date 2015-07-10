> From: [eLinux.org](http://eLinux.org/Android_Networking "http://eLinux.org/Android_Networking")


# Android Networking



Here are some tips for getting networking working on your Android
device.

## Setting the DNS server

In my experience, some times the device fails to get it's DNS server
correctly from DHCP. The DNS server address is retrieved from system
properties.

You can set this manually by typing (on the target):

    $ setprop net.eth0.dns1 xx.yy.zz.aa

(replacing with the correct numeric values for your DNS server address)

I have also set the following:

    $ setprop net.nds1 xx.yy.zz.aa

This needs to be set each time the system boots. I'm sure there's a way
to have 'init' set this, or to put it into persistent properties, but I
haven't done that yet.

## Configuring a web proxy

The browser looks at system settings stored in a provider database for
the http proxy.

The value for http\_proxy is set in the following sqlite database:
/data/data/com.android.providers.settings/databases/settings.db

the setting goes in the 'system' table in this database, with a key of
99, a name of 'http\_proxy' and a value that is a string containing your
proxy server and port. I don't know if you can use a server name rather
than just an IP address. I haven't done that.

To set this, on target, do the following:

     # cd /data/data/com.android.providers.settings/databases
     # sqlite3 settings.db
    SQLite version 3.5.9
    Enter ".help" for instructions
    sqlite> insert into system values(99,'http_proxy','192.168.1.1:80');
    sqlite>.exit

*Replace '192.168.1.1:80' with the appropriate address and port for your
network configuration.*

Since it's only a single line, you can also do this from the command
line. You can check that the value is stored properly by typing the
following:

    # sqlite3 settings.db "select * from system;"

This should show output similar to the following (first part omitted):

    ...
    38|volume_ring|4
    39|volume_ring_last_audible|4
    99|http_proxy|43.131.3.73:80

This change is persistent, and you should only have to make it once.

## Setting up networking on bootup

Add the following lines in the init.rc:

    service ethernet /eth0.sh

Now create a file at the root (or anywhere else, probably in /system/etc
but modify the above line accordingly) called eth0.sh, make it
executable (chmod +x eth0.sh) and put the following lines in it:

    #!/system/bin/sh

    netcfg eth0 dhcp

    setprop net.dns1 8.8.8.8
    setprop net.dns2 8.8.4.4


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

