> From: [eLinux.org](http://eLinux.org/PandaBoard_ES_uboot_howto "http://eLinux.org/PandaBoard_ES_uboot_howto")


# PandaBoard ES uboot howto



## Getting the Source

To get the source code for U-Boot, clone a copy of the Linaro U-Boot
stable tree:

    mkdir pandaboard-es
    cd pandaboard-es
    git clone git://git.linaro.org/boot/u-boot-linaro-stable.git
    cd u-boot-linaro-stable
    git checkout -b pandaboard-es origin/Linaro-u-boot-2011.12

As of 12/18/2011, the master branch tagged Linaro-u-boot-2011.12
produces a working MLO/U-Boot pair which will boot both Panda and
Panda-ES boards. Previously, the Panda EA1 with rev ES2.0 silicon would
not boot.

## Configure and Compile

To configure and compile U-Boot for PandaBoard ES do the following:

    export CROSS_COMPILE=arm-none-linux-gnueabi-
    make omap4_panda_config
    make

Note: This assumes that you are using and have installed the
CodeSourcery 2011.03-41 for ARM GNU/Linux toolchain. If you are using a
different toolchain, make sure to adjust the CROSS\_COMPILE variable
accordingly.

Using "Sourcery CodeBench Lite 2011.09-70 for ARM GNU/Linux" generates a
compiler error, as does using the toolchain that comes with Ubuntu's
`gcc-arm-linux-gnueabi` package as follows:

    ... snip ...
    arm-linux-gnueabi-gcc  -g  -Os   -fno-common -ffixed-r8 -msoft-float  -D__KERNEL__
      -DCONFIG_SYS_TEXT_BASE=0x80E80000 -DCONFIG_SPL_TEXT_BASE=0x40303080
      -I/home/rpjday/panda/uboot/u-boot-linaro-stable/include -fno-builtin
      -ffreestanding -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabi/4.6.1/include
      -pipe  -DCONFIG_ARM -D__ARM__ -marm -mabi=aapcs-linux -mno-thumb-interwork -march=armv5
      -Wall -Wstrict-prototypes -fno-stack-protector -Wno-format-nonliteral -Wno-format-security
      -o clocks.o clocks.c -c
    clocks.c: In function ‘enable_non_essential_clocks’:
    clocks.c:420:13: internal compiler error: in decode_addr_const, at varasm.c:2638
    Please submit a full bug report,
    with preprocessed source if appropriate.
    See <file:///usr/share/doc/gcc-4.6/README.Bugs> for instructions.
    Preprocessed source stored into /tmp/ccE2XxKg.out file, please attach this to your bugreport.

At the present time, this seems to be a problem with gcc 4.6.1.

GNU gcc 4.6.2 appears to have a fix for this issue. Stay tuned for a
How-to on how to build a gcc 4.6.x toolchain that will properly compile
u-boot.



## Copy Files

Copy the MLO and U-Boot images to the boot partition of your mounted SD
card:

    cp MLO /media/boot
    cp u-boot.img /media/boot
    sync

Make sure you unmount your SD card prior to removing it from the host
PC.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

