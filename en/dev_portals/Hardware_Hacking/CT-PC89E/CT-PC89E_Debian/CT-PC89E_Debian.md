> From: [eLinux.org](http://eLinux.org/CT-PC89E_Debian "http://eLinux.org/CT-PC89E_Debian")


# CT-PC89E Debian



## Contents

-   [1 Debian/Lenny on the CT-PC89E](#debian-lenny-on-the-ct-pc89e)
    -   [1.1 Caveats and Important Info](#caveats-and-important-info)
    -   [1.2 Creating a root filesystem with
        qemu](#creating-a-root-filesystem-with-qemu)
    -   [1.3 Installing packages in the qemu
        environment](#installing-packages-in-the-qemu-environment)
    -   [1.4 Retrospective modifications
        needed](#retrospective-modifications-needed)
    -   [1.5 Copying the filesystem out of
        qemu](#copying-the-filesystem-out-of-qemu)

# Debian/Lenny on the CT-PC89E

This page describes the process by which Debian/Lenny was installed onto
the CT-PC89E, in case anyone wants to replicate it or install an
alternative OS.

## Caveats and Important Info

At this early stage, working with a factory full of people whose primary
language is chinese not english, we have needed to repeat things several
times. Also, we are prioritizing requests. Firmware first, GPL source
code of kernel second, GPL source code of u-boot third, GPL and other
free software licensed source code of the MOS mid-fun operating system
fourth. We've received the firmware, which contains a binary-only
compile of u-boot; a binary-only compile of the 2.6.24.2 kernel; various
splash-screens needed to be loaded during the update phase for
informational purposes; and the all-important replacement root
filesystem, datang-epc.tar.gz

Also, the root filesystem partition is only 450mb, with about 64mb at
the end of the NAND flash storing the kernel and u-boot, and the rest of
the NAND flash allocated for user files. It is therefore, at the moment,
to create a root filesystem that fits in under 450mb.

So, as of 27feb2010, the only option is to build a really quite small
alternative root filesystem, and to use the existing binary u-boot and
binary 2.6.24.2 kernel. Also, it is not clear as to why, but it would
appear that the current kernel is somehow missing ext2 and ext3 drivers,
making it impossible to mount the remaining 3rd 1.2gb partition!

The kernel is fortunately compiled with eabi, so despite evidence to the
contrary on the MOS mid-linux operating system showing the debian
architecture as "arm", this is in fact a mistake: the debian
architecture recorded by MOS should be "armel". further evidence showing
this mistake is in the form of the
[http://mid-linux/sdk](http://mid-linux/sdk) which contains a gnueabi
gcc compiler.

Also: thanks to lack of access to the GPL source code of the kernel and
of u-boot, there is no video console access, period. both u-boot and the
kernel have been compiled NOT to recognise the LCD framebuffer as
console, and it is perhaps a wise choice, except for not compiling in
any console fonts!

## Creating a root filesystem with qemu

There are many ways to create a debian armel root filesystem: using qemu
was chosen out of naivete, and an updated description compiled from
following two other excellent HOWTOs can be found here:
[http://wiki.lkcl.net/ArmelQemu](http://wiki.lkcl.net/ArmelQemu)

The key thing to note is to NOT install too much. XFCE4 is too much.
LXDE is too much. xserver-xorg is also too much, but the existence of
kdrive was not known at the time of creation, and the primary focus was
on getting it "working", fast, and adapting later.

## Installing packages in the qemu environment

So, after getting qemu armel up-and-running, it was then necessary to
take into account the fact that there will be no console access.
Ordinarily it would be perfectly okay to just do a minimal debian
install and then start logging in at the console and going from there...
except there isn't one. Therefore, xdm, gpe and matchbox were installed
and tested.

gpe was installed first, just to give some applications. xdm was
installed second, so as to remove gpe meta-package and gpe-login. to get
a window manager, matchbox was installed. Then, after creating a midfun
user, /home/midfun/.xsessionrc was created with one line,
"matchbox-session" in it. After logging in at xdm, this was sufficient
to start up an xsession with the matchbox window manager.

Also, openssh server was installed, along with rsync and a few other
essential goodies.

Then, /usr/share/doc/\* entries were entirely deleted, as were some of
the locales (not recommended unless you know what you're doing). The end
result was a 350mb root filesystem once it ended up on the NAND flash of
the CT-PC89E.

## Retrospective modifications needed

Before describing how the filesystem was actually installed, it was
discovered that there were problems at boot-up time which needed to be
overcome. The first of these which was discovered was that LVM support
is not compiled in to the mid-fun kernel, and because the root
filesystem in qemu had been an LVM partition, bootup stalled with an
(unreadable!) error message. By editing /etc/init.d/lvm and adding "exit
0" at the top, it was possible to bypass the error.

/etc/fstab on MOS is very weird: rootfs is not named by partition
/dev/mmcblk0p1 but is named rootfs! so, that needed to be modified.

All console entries in /etc/inittab - tty1 through to tty6 - were
commented out.

## Copying the filesystem out of qemu

This was tricky: rather than mess about with a shutdown qemu image,
local loopback etc. rsync was used to copy the files out of the running
qemu session, with rsync --exclude=/proc/\* --exclude=/sys/\*
--exclude=/selinux/\* --delete / 192.168.1.220:/{somewhere}

Then, very simply, in the system to where the files had been copied,
entering the directory, tar was used: tar -cvzf ../rootfs.tgz .

All that was then required was to copy that file, rootfs.tgz, as
datang-epc.tar.gz, onto the FAT-formatted "firmware update" SDcard.
Pressing and holding both mouse buttons as well as the power button
during boot was sufficient to activate the u-boot "update" command
sequence. Power-off was automatic; a reboot entered debian / lenny after
the third attempt.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CT-PC89E](http://eLinux.org/index.php?title=Category:CT-PC89E&action=edit&redlink=1 "Category:CT-PC89E (page does not exist)")

