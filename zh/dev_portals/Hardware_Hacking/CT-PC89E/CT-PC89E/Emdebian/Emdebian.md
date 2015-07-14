> From: [eLinux.org](http://eLinux.org/Emdebian "http://eLinux.org/Emdebian")


# CT-PC89E/Emdebian


\< [CT-PC89E](http://eLinux.org/CT-PC89E "CT-PC89E")


## Contents

-   [1 Preparations](#preparations)
    -   [1.1 Getting the Toolchain](#getting-the-toolchain)
    -   [1.2 Getting the kernel](#getting-the-kernel)
-   [2 Building](#building)
    -   [2.1 Building the kernel](#building-the-kernel)
-   [3 See also](#see-also)
-   [4 External links](#external-links)

# Preparations

## Getting the Toolchain

    $ sudo apt-get install emdebian-archive-keyring
    $ sudo sh -c 'echo deb http://buildd.emdebian.org/debian unstable main > /etc/apt/sources.list.d/emdebian.list'
    $ sudo apt-get update
    $ sudo apt-get install linux-libc-dev-armel-cross libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi \
      gcc-4.3-arm-linux-gnueabi gcc-4.4-arm-linux-gnueabi

## Getting the kernel

    $ git clone https://alioth.debian.org/anonscm/git/arm-netbook/arm-netbook.git
    $ cd arm-netbook
    $ git checkout --track -b 2.6.24-from-smartq origin/ct-pc89e/2.6.24/from-smartq

# Building

## Building the kernel

    $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- menuconfig
    $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-

# See also

-   [CT-PC89E](http://eLinux.org/CT-PC89E "CT-PC89E")

# External links

-   [Emdebian Grip](http://www.emdebian.org/grip/index.html)
-   [Emdebian Toolchain](http://wiki.debian.org/EmdebianToolchain)
-   [Git repository in
    *alioth*](https://alioth.debian.org/scm/?group_id=100475)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CT-PC89E](http://eLinux.org/index.php?title=Category:CT-PC89E&action=edit&redlink=1 "Category:CT-PC89E (page does not exist)")

