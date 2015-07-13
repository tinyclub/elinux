> From: [eLinux.org](http://eLinux.org/Board_Bringup_Utilities "http://eLinux.org/Board_Bringup_Utilities")


# Board Bringup Utilities



<table>
<thead>
<tr class="header">
<th align="left">Description</th>
<th align="left">Tool</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Framebuffer</td>
<td align="left"><a href="https://github.com/prpplague/fb-test-app">fb-test-app git repo</a> (<a href="http://elinux.org/images/0/09/Fb-test.c" title="Fb-test.c">original fb-test</a>)</td>
</tr>
<tr class="even">
<td align="left">Input Events</td>
<td align="left"><a href="http://elinux.org/images/9/93/Evtest.c" title="Evtest.c">evtest</a></td>
</tr>
<tr class="odd">
<td align="left">Physical Memory</td>
<td align="left"><a href="http://elinux.org/images/a/aa/Devmem2.c" title="Devmem2.c">devmem2</a></td>
</tr>
<tr class="even">
<td align="left">I2C Interface</td>
<td align="left"><a href="http://www.lm-sensors.org/wiki/I2CTools">I2C Tools</a></td>
</tr>
<tr class="odd">
<td align="left">OMAP Booting</td>
<td align="left"><a href="http://code.google.com/p/omap-u-boot-utils/">OMAP U-boot Utils</a></td>
</tr>
<tr class="even">
<td align="left">OMAP4 USB Booting</td>
<td align="left"><a href="http://git.omapzoom.org/?p=repo/omapboot.git;a=summary">OMAP4 USB Booting</a></td>
</tr>
<tr class="odd">
<td align="left">Uart</td>
<td align="left"><a href="http://elinux.org/images/b/b7/Uart-loopback.c" title="Uart-loopback.c">Uart Loopback</a></td>
</tr>
<tr class="even">
<td align="left">OMAP overlay swapper</td>
<td align="left"><a href="http://elinux.org/images/a/ac/Overlayswap.c" title="Overlayswap.c">overlayswap</a></td>
</tr>
<tr class="odd">
<td align="left">OMAP memory speed test</td>
<td align="left"><a href="http://elinux.org/images/8/8a/Memspeed.tar.gz" title="Memspeed.tar.gz">memspeed</a></td>
</tr>
<tr class="even">
<td align="left">OMAP4 EMIF cycle speed</td>
<td align="left"><a href="http://elinux.org/images/e/ed/Omap4_emif.c" title="Omap4 emif.c">omap4_emif</a></td>
</tr>
<tr class="odd">
<td align="left">OMAP4 EMIF performance</td>
<td align="left"><a href="http://elinux.org/images/7/74/Omap4_ddrstat.c" title="Omap4 ddrstat.c">omap4_ddrstat</a></td>
</tr>
</tbody>
</table>

    To compile single .c source files such as fb-test.c,
    use compiler command line:

    # arm-none-linux-gnueabi-gcc fbtest.c -o fb-test

    this will generate the binary fb-test for use on your
    system where arm-none-linux-gnueabi- is the cross compiler
    that you have installed on your host system.

-   minimal kernel config for
    [4430sdp](http://eLinux.org/images/9/96/Minimal-kernel-4430sdp.txt "Minimal-kernel-4430sdp.txt")
-   minimal rootfs for
    [OMAP3/OMAP4](http://eLinux.org/images/b/bd/Minimal-rootfs.tar.gz "Minimal-rootfs.tar.gz")
-   test kernel for
    [PandaBoard](http://eLinux.org/images/2/2f/UImage-test-panda.bin "UImage-test-panda.bin")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

