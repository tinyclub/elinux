> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Mount_NFS_Directory "http://eLinux.org/LeapFrog_Pollux_Platform:_Mount_NFS_Directory")


# LeapFrog Pollux Platform: Mount NFS Directory



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Software Needed](#software-needed)
-   [4 Configure Server and Client](#configure-server-and-client)

## Summary

This is a tutorial to setup an NFS folder on your host PC for your
explorer to boot from. NFS mounting of a directory will enable you to
test applications and scripts without having to copy anything to your
Leapster or LeapPad Explorer.

## Prerequisites

[Networking
Setup](http://eLinux.org/LeapFrog_Pollux_Platform:_Networking "LeapFrog Pollux Platform: Networking")

For Didj [Enable
Networking](http://eLinux.org/Didj_Enable_Networking "Didj Enable Networking") using the
lf1000\_ff\_eth\_defconfig file or manually adding NFS support.



## Software Needed

Linux host PC

nfs-kernel-server

nfs-common



## Configure Server and Client

*On Host*

Make sure your programs are installed.

    sudo apt-get nfs-kernel-server nfs-common


 Configure the /etc/exports file to point to the folder(s) you would
like to make available for NFS mounting. Be sure to specify the IP of
your device, otherwise anyone can mount it.

    /home    10.0.0.2(rw,sync,no_root_squash)


 *On Device*

You'll need to edit /usr/bin/mountnfs, change:

     mount -o nolock `get-ip host`:/home/lfu/nfsroot/LF /LF

to:

     mount -o nolock 10.0.0.1:/home/ /mnt

Start the server and client:


 *On Host*

    $ sudo /etc/init.d/nfs-kernel-server start


 **For Leapster and LeapPad Explorers**

*On Device*

    # modprobe nfs
    # mountnfs
    # cd /mnt
    # ls


 **For Network Enabled Didj**

    mount -o nolock 10.0.0.1:/home /mnt


 At this point should see the contents of your /home dir


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

