> From: [eLinux.org](http://eLinux.org/UsingJtagTools "http://eLinux.org/UsingJtagTools")


# UsingJtagTools



**Note**: This assumes that you use the default locations for the jtag
tools 0.6 install (HEAD from cvs). Please adjust your paths accordingly

## Contents

-   [1 Add Support for the Juicebox](#add-support-for-the-juicebox)
    -   [1.1 0.5.1](#0-5-1)
    -   [1.2 0.6](#0-6)
    -   [1.3 Manually Add Support](#manually-add-support)
-   [2 Using Jtag Tools](#using-jtag-tools)
-   [3 Useful Scripts for Jtag Tools](#useful-scripts-for-jtag-tools)

## Add Support for the Juicebox

### 0.5.1

here is a [attachment:jtag-jb.diff patch] against the 0.5.1 release. it
would be nice if someone made the changes against the cvs repo head and
submit it to the openwince folks. There's been some version slippage,
and you'll need v0.3.2 of the OpenWinCE Includes to compile jtag 0.5.1.

### 0.6

here is an [attachment:jtag-jb-cvs-alpha.diff alpha patch] against
version 0.6 (cvs head). please try this out and post/fix issues you see
with it.

    * Install OpenWinCE Includes
    * Get the latest code from cvs
    * Apply the patch
    * Run "autogen.sh"
    * make && make install

Get the latest Jtag Tools from the OpenWinCE project CVS Repo -
[http://openwince.sourceforge.net/jtag/](http://openwince.sourceforge.net/jtag/)

### Manually Add Support

**Note:** This is by far the least desirable method

Using the attached BSDL on ["JuiceBoxJTAG"] file you can create the
necessary files for jtag tools using the included **bsdl2jtag**.

    #Convert the BSDL file by piping in the
    #bsdl file and piping the stdout to a file
    bsdl2jtag < s3c44b0x.bsdl > 0001
    #Modify the MANUFACTURERS file
    echo 11110000111 juicebox juicebox >> /usr/local/share/jtag/MANUFACTURERS
    #Create the juicebox device
    mkdir -p /usr/local/share/jtag/juicebox/s3c44b0x
    mv 0001 /usr/local/share/jtag/juicebox/s3c44b0x/
    echo 1111000011110000 s3c44b0x S3C44B0X > /usr/local/share/jtag/juicebox/PARTS
    echo 0001 0001 0001 > /usr/local/share/jtag/juicebox/s3c44b0x/STEPPINGS

I am having issues doing anything useful since I do not have the correct
bus driver, or don't know which to use. If you are using jtag tools with
the juicebox please post some details on the bus driver.

## Using Jtag Tools

You can now start jtag tools (http://eLinux.org/usr/local/bin/jtag) and detect the device

This example uses a Xilinx Parallel Cable III (Model DLC5)

    jtag> cable parallel 0x378 DLC5
    jtag> detect
    jtag> print chain

Print out the current pin values

    jtag> instruction SAMPLE/PRELOAD
    jtag> shift ir
    jtag> shift dr
    jtag> dr

Initialize the Bus (to peek/poke/copy memory and the other good stuff)
and ID the cart

    jtag> initbus s3c44b0x
    *no cart*
    jtag> peek 0x00590000
    bus_read(0x00590000) = 0x0000CE0C (52748)
    *video cart*
    jtag> peek 0x00590000
    bus_read(0x00590000) = 0x00001880 (6272)

**Note:** Here I am assuming that the cart id is only 32 bits but I
don't know that to be the case

## Useful Scripts for Jtag Tools

This script will set up a Xilinx Parallel Cable III (DLC5), detect the
juicebox, print out the jtag chain, and initialize the juicebox jtag
driver. The help screen is just to show you what other commands are
available.

**init**

    cable parallel 0x378 DLC5
    detect
    print
    initbus s3c44b0x
    help

This script is kinda useless but I wanted to show that you can call one
script from another. This probably can be done with "include" as well
but I haven't that command yet. **id\_cart**

    script /home/antics/jb/init
    peek 0x00590000


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

