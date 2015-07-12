> From: [eLinux.org](http://eLinux.org/Flash_Filesystem_Benchmarks_Kernel_Evolution "http://eLinux.org/Flash_Filesystem_Benchmarks_Kernel_Evolution")


# Flash Filesystem Benchmarks Kernel Evolution



This page is part of the
[Flash\_Filesystem\_Benchmarks](http://eLinux.org/Flash_Filesystem_Benchmarks "Flash Filesystem Benchmarks")
effort done by Free Electrons with funding from the CE Linux Forum.

This page makes it possible to monitor performance regressions in newer
kernel versions. Each board/filesystem couple should be watched. More
results will come shortly.

## Contents

-   [1 IGEPv2 Board / UBIfs](#igepv2-board-ubifs)
-   [2 IGEPv2 Board / JFFS2](#igepv2-board-jffs2)
-   [3 IGEPv2 Board / SquashFS over
    gluebi+mtdblock\-ro](#igepv2-board-squashfs-over-gluebi-mtdblock-ro)
-   [4 IGEPv2 Board / SquashFS over
    ubiblk](#igepv2-board-squashfs-over-ubiblk)
-   [5 Calao-USB9263 Board / UBIfs](#calao-usb9263-board-ubifs)
-   [6 Calao-USB9263 Board / JFFS2](#calao-usb9263-board-jffs2)
-   [7 Calao-USB9263 Board / SquashFS over
    gluebi+mtdblock\-ro](#calao-usb9263-board-squashfs-over-gluebi-mtdblock-ro)
-   [8 Calao-USB9263 Board / SquashFS over
    ubiblk](#calao-usb9263-board-squashfs-over-ubiblk)

## IGEPv2 Board / UBIfs

[![Elinux-igepv2-ubifs-comparison-init
time.png](http://eLinux.org/images/a/ae/Elinux-igepv2-ubifs-comparison-init_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-init_time.png)
[![Elinux-igepv2-ubifs-comparison-init cpu
time.png](http://eLinux.org/images/2/2e/Elinux-igepv2-ubifs-comparison-init_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-init_cpu_time.png)
[![Elinux-igepv2-ubifs-comparison-init
mem.png](http://eLinux.org/images/e/e9/Elinux-igepv2-ubifs-comparison-init_mem.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-init_mem.png)
[![Elinux-igepv2-ubifs-comparison-mount
time.png](http://eLinux.org/images/9/90/Elinux-igepv2-ubifs-comparison-mount_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-mount_time.png)
[![Elinux-igepv2-ubifs-comparison-mount cpu
time.png](http://eLinux.org/images/0/08/Elinux-igepv2-ubifs-comparison-mount_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-mount_cpu_time.png)
[![Elinux-igepv2-ubifs-comparison-mount
mem.png](http://eLinux.org/images/5/57/Elinux-igepv2-ubifs-comparison-mount_mem.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-mount_mem.png)
[![Elinux-igepv2-ubifs-comparison-remount
time.png](http://eLinux.org/images/b/b4/Elinux-igepv2-ubifs-comparison-remount_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-remount_time.png)
[![Elinux-igepv2-ubifs-comparison-remount cpu
time.png](http://eLinux.org/images/b/b6/Elinux-igepv2-ubifs-comparison-remount_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-remount_cpu_time.png)
[![Elinux-igepv2-ubifs-comparison-used
space.png](http://eLinux.org/images/3/33/Elinux-igepv2-ubifs-comparison-used_space.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-used_space.png)
[![Elinux-igepv2-ubifs-comparison-read
time.png](http://eLinux.org/images/8/82/Elinux-igepv2-ubifs-comparison-read_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-read_time.png)
[![Elinux-igepv2-ubifs-comparison-read cpu
time.png](http://eLinux.org/images/7/7d/Elinux-igepv2-ubifs-comparison-read_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-read_cpu_time.png)
[![Elinux-igepv2-ubifs-comparison-remove
time.png](http://eLinux.org/images/7/75/Elinux-igepv2-ubifs-comparison-remove_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-remove_time.png)
[![Elinux-igepv2-ubifs-comparison-remove cpu
time.png](http://eLinux.org/images/a/a2/Elinux-igepv2-ubifs-comparison-remove_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-remove_cpu_time.png)
[![Elinux-igepv2-ubifs-comparison-write
time.png](http://eLinux.org/images/0/0a/Elinux-igepv2-ubifs-comparison-write_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-write_time.png)
[![Elinux-igepv2-ubifs-comparison-write cpu
time.png](http://eLinux.org/images/6/6f/Elinux-igepv2-ubifs-comparison-write_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-write_cpu_time.png)
[![Elinux-igepv2-ubifs-comparison-video write
time.png](http://eLinux.org/images/7/72/Elinux-igepv2-ubifs-comparison-video_write_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-video_write_time.png)
[![Elinux-igepv2-ubifs-comparison-video write cpu
time.png](http://eLinux.org/images/0/07/Elinux-igepv2-ubifs-comparison-video_write_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-ubifs-comparison-video_write_cpu_time.png)

## IGEPv2 Board / JFFS2

[![Elinux-igepv2-jffs2-comparison-init
time.png](http://eLinux.org/images/5/53/Elinux-igepv2-jffs2-comparison-init_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-init_time.png)
[![Elinux-igepv2-jffs2-comparison-init cpu
time.png](http://eLinux.org/images/4/44/Elinux-igepv2-jffs2-comparison-init_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-init_cpu_time.png)
[![Elinux-igepv2-jffs2-comparison-init
mem.png](http://eLinux.org/images/b/b6/Elinux-igepv2-jffs2-comparison-init_mem.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-init_mem.png)
[![Elinux-igepv2-jffs2-comparison-mount
time.png](http://eLinux.org/images/9/9b/Elinux-igepv2-jffs2-comparison-mount_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-mount_time.png)
[![Elinux-igepv2-jffs2-comparison-mount cpu
time.png](http://eLinux.org/images/a/aa/Elinux-igepv2-jffs2-comparison-mount_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-mount_cpu_time.png)
[![Elinux-igepv2-jffs2-comparison-mount
mem.png](http://eLinux.org/images/0/03/Elinux-igepv2-jffs2-comparison-mount_mem.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-mount_mem.png)
[![Elinux-igepv2-jffs2-comparison-remount
time.png](http://eLinux.org/images/b/b1/Elinux-igepv2-jffs2-comparison-remount_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-remount_time.png)
[![Elinux-igepv2-jffs2-comparison-remount cpu
time.png](http://eLinux.org/images/1/19/Elinux-igepv2-jffs2-comparison-remount_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-remount_cpu_time.png)
[![Elinux-igepv2-jffs2-comparison-used
space.png](http://eLinux.org/images/0/0c/Elinux-igepv2-jffs2-comparison-used_space.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-used_space.png)
[![Elinux-igepv2-jffs2-comparison-read
time.png](http://eLinux.org/images/9/97/Elinux-igepv2-jffs2-comparison-read_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-read_time.png)
[![Elinux-igepv2-jffs2-comparison-read cpu
time.png](http://eLinux.org/images/d/d0/Elinux-igepv2-jffs2-comparison-read_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-read_cpu_time.png)
[![Elinux-igepv2-jffs2-comparison-remove
time.png](http://eLinux.org/images/f/ff/Elinux-igepv2-jffs2-comparison-remove_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-remove_time.png)
[![Elinux-igepv2-jffs2-comparison-remove cpu
time.png](http://eLinux.org/images/c/c5/Elinux-igepv2-jffs2-comparison-remove_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-remove_cpu_time.png)
[![Elinux-igepv2-jffs2-comparison-write
time.png](http://eLinux.org/images/2/20/Elinux-igepv2-jffs2-comparison-write_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-write_time.png)
[![Elinux-igepv2-jffs2-comparison-write cpu
time.png](http://eLinux.org/images/2/2d/Elinux-igepv2-jffs2-comparison-write_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-write_cpu_time.png)
[![Elinux-igepv2-jffs2-comparison-video write
time.png](http://eLinux.org/images/d/dc/Elinux-igepv2-jffs2-comparison-video_write_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-video_write_time.png)
[![Elinux-igepv2-jffs2-comparison-video write cpu
time.png](http://eLinux.org/images/6/66/Elinux-igepv2-jffs2-comparison-video_write_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-jffs2-comparison-video_write_cpu_time.png)

## IGEPv2 Board / SquashFS over gluebi+mtdblock\_ro

[![Elinux-igepv2-sqfs-gluebi-comparison-init
time.png](http://eLinux.org/images/6/61/Elinux-igepv2-sqfs-gluebi-comparison-init_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-gluebi-comparison-init_time.png)
[![Elinux-igepv2-sqfs-gluebi-comparison-init cpu
time.png](http://eLinux.org/images/b/b7/Elinux-igepv2-sqfs-gluebi-comparison-init_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-gluebi-comparison-init_cpu_time.png)
[![Elinux-igepv2-sqfs-gluebi-comparison-init
mem.png](http://eLinux.org/images/5/5a/Elinux-igepv2-sqfs-gluebi-comparison-init_mem.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-gluebi-comparison-init_mem.png)
[![Elinux-igepv2-sqfs-gluebi-comparison-mount
time.png](http://eLinux.org/images/2/2d/Elinux-igepv2-sqfs-gluebi-comparison-mount_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-gluebi-comparison-mount_time.png)
[![Elinux-igepv2-sqfs-gluebi-comparison-mount cpu
time.png](http://eLinux.org/images/c/c4/Elinux-igepv2-sqfs-gluebi-comparison-mount_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-gluebi-comparison-mount_cpu_time.png)
[![Elinux-igepv2-sqfs-gluebi-comparison-mount
mem.png](http://eLinux.org/images/f/f0/Elinux-igepv2-sqfs-gluebi-comparison-mount_mem.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-gluebi-comparison-mount_mem.png)
[![Elinux-igepv2-sqfs-gluebi-comparison-used
space.png](http://eLinux.org/images/7/75/Elinux-igepv2-sqfs-gluebi-comparison-used_space.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-gluebi-comparison-used_space.png)
[![Elinux-igepv2-sqfs-gluebi-comparison-read
time.png](http://eLinux.org/images/7/7a/Elinux-igepv2-sqfs-gluebi-comparison-read_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-gluebi-comparison-read_time.png)
[![Elinux-igepv2-sqfs-gluebi-comparison-read cpu
time.png](http://eLinux.org/images/4/4e/Elinux-igepv2-sqfs-gluebi-comparison-read_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-gluebi-comparison-read_cpu_time.png)

## IGEPv2 Board / SquashFS over ubiblk

[![Elinux-igepv2-sqfs-ubiblk-comparison-init
time.png](http://eLinux.org/images/9/95/Elinux-igepv2-sqfs-ubiblk-comparison-init_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-ubiblk-comparison-init_time.png)
[![Elinux-igepv2-sqfs-ubiblk-comparison-init cpu
time.png](http://eLinux.org/images/6/65/Elinux-igepv2-sqfs-ubiblk-comparison-init_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-ubiblk-comparison-init_cpu_time.png)
[![Elinux-igepv2-sqfs-ubiblk-comparison-init
mem.png](http://eLinux.org/images/c/c5/Elinux-igepv2-sqfs-ubiblk-comparison-init_mem.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-ubiblk-comparison-init_mem.png)
[![Elinux-igepv2-sqfs-ubiblk-comparison-mount
time.png](http://eLinux.org/images/c/c4/Elinux-igepv2-sqfs-ubiblk-comparison-mount_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-ubiblk-comparison-mount_time.png)
[![Elinux-igepv2-sqfs-ubiblk-comparison-mount cpu
time.png](http://eLinux.org/images/c/cf/Elinux-igepv2-sqfs-ubiblk-comparison-mount_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-ubiblk-comparison-mount_cpu_time.png)
[![Elinux-igepv2-sqfs-ubiblk-comparison-mount
mem.png](http://eLinux.org/images/a/a6/Elinux-igepv2-sqfs-ubiblk-comparison-mount_mem.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-ubiblk-comparison-mount_mem.png)
[![Elinux-igepv2-sqfs-ubiblk-comparison-read
time.png](http://eLinux.org/images/e/e4/Elinux-igepv2-sqfs-ubiblk-comparison-read_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-ubiblk-comparison-read_time.png)
[![Elinux-igepv2-sqfs-ubiblk-comparison-read cpu
time.png](http://eLinux.org/images/f/f3/Elinux-igepv2-sqfs-ubiblk-comparison-read_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-sqfs-ubiblk-comparison-read_cpu_time.png)



* * * * *

* * * * *



## Calao-USB9263 Board / UBIfs

[![Elinux-calao-ubifs-comparison-init
time.png](http://eLinux.org/images/8/8b/Elinux-calao-ubifs-comparison-init_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-init_time.png)
[![Elinux-calao-ubifs-comparison-init cpu
time.png](http://eLinux.org/images/1/17/Elinux-calao-ubifs-comparison-init_cpu_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-init_cpu_time.png)
[![Elinux-calao-ubifs-comparison-init
mem.png](http://eLinux.org/images/c/cb/Elinux-calao-ubifs-comparison-init_mem.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-init_mem.png)
[![Elinux-calao-ubifs-comparison-mount
time.png](http://eLinux.org/images/d/d3/Elinux-calao-ubifs-comparison-mount_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-mount_time.png)
[![Elinux-calao-ubifs-comparison-mount cpu
time.png](http://eLinux.org/images/9/93/Elinux-calao-ubifs-comparison-mount_cpu_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-mount_cpu_time.png)
[![Elinux-calao-ubifs-comparison-mount
mem.png](http://eLinux.org/images/8/88/Elinux-calao-ubifs-comparison-mount_mem.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-mount_mem.png)
[![Elinux-calao-ubifs-comparison-remount
time.png](http://eLinux.org/images/3/3b/Elinux-calao-ubifs-comparison-remount_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-remount_time.png)
[![Elinux-calao-ubifs-comparison-remount cpu
time.png](http://eLinux.org/images/8/84/Elinux-calao-ubifs-comparison-remount_cpu_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-remount_cpu_time.png)
[![Elinux-calao-ubifs-comparison-used
space.png](http://eLinux.org/images/6/66/Elinux-calao-ubifs-comparison-used_space.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-used_space.png)
[![Elinux-calao-ubifs-comparison-read
time.png](http://eLinux.org/images/0/03/Elinux-calao-ubifs-comparison-read_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-read_time.png)
[![Elinux-calao-ubifs-comparison-read cpu
time.png](http://eLinux.org/images/b/bf/Elinux-calao-ubifs-comparison-read_cpu_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-read_cpu_time.png)
[![Elinux-calao-ubifs-comparison-remove
time.png](http://eLinux.org/images/3/33/Elinux-calao-ubifs-comparison-remove_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-remove_time.png)
[![Elinux-calao-ubifs-comparison-remove cpu
time.png](http://eLinux.org/images/c/ce/Elinux-calao-ubifs-comparison-remove_cpu_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-remove_cpu_time.png)
[![Elinux-calao-ubifs-comparison-write
time.png](http://eLinux.org/images/d/d3/Elinux-calao-ubifs-comparison-write_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-write_time.png)
[![Elinux-calao-ubifs-comparison-write cpu
time.png](http://eLinux.org/images/f/fe/Elinux-calao-ubifs-comparison-write_cpu_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-write_cpu_time.png)
[![Elinux-calao-ubifs-comparison-video write
time.png](http://eLinux.org/images/b/bc/Elinux-calao-ubifs-comparison-video_write_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-video_write_time.png)
[![Elinux-calao-ubifs-comparison-video write cpu
time.png](http://eLinux.org/images/6/6e/Elinux-calao-ubifs-comparison-video_write_cpu_time.png)](http://eLinux.org/File:Elinux-calao-ubifs-comparison-video_write_cpu_time.png)

## Calao-USB9263 Board / JFFS2

[![Elinux-calao-jffs2-comparison-init
time.png](http://eLinux.org/images/e/ed/Elinux-calao-jffs2-comparison-init_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-init_time.png)
[![Elinux-calao-jffs2-comparison-init cpu
time.png](http://eLinux.org/images/9/9d/Elinux-calao-jffs2-comparison-init_cpu_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-init_cpu_time.png)
[![Elinux-calao-jffs2-comparison-init
mem.png](http://eLinux.org/images/9/9c/Elinux-calao-jffs2-comparison-init_mem.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-init_mem.png)
[![Elinux-calao-jffs2-comparison-mount
time.png](http://eLinux.org/images/9/99/Elinux-calao-jffs2-comparison-mount_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-mount_time.png)
[![Elinux-calao-jffs2-comparison-mount cpu
time.png](http://eLinux.org/images/e/e8/Elinux-calao-jffs2-comparison-mount_cpu_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-mount_cpu_time.png)
[![Elinux-calao-jffs2-comparison-mount
mem.png](http://eLinux.org/images/c/cd/Elinux-calao-jffs2-comparison-mount_mem.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-mount_mem.png)
[![Elinux-calao-jffs2-comparison-remount
time.png](http://eLinux.org/images/4/4d/Elinux-calao-jffs2-comparison-remount_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-remount_time.png)
[![Elinux-calao-jffs2-comparison-remount cpu
time.png](http://eLinux.org/images/4/49/Elinux-calao-jffs2-comparison-remount_cpu_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-remount_cpu_time.png)
[![Elinux-calao-jffs2-comparison-used
space.png](http://eLinux.org/images/c/cc/Elinux-calao-jffs2-comparison-used_space.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-used_space.png)
[![Elinux-calao-jffs2-comparison-read
time.png](http://eLinux.org/images/8/89/Elinux-calao-jffs2-comparison-read_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-read_time.png)
[![Elinux-calao-jffs2-comparison-read cpu
time.png](http://eLinux.org/images/8/83/Elinux-calao-jffs2-comparison-read_cpu_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-read_cpu_time.png)
[![Elinux-calao-jffs2-comparison-remove
time.png](http://eLinux.org/images/f/f9/Elinux-calao-jffs2-comparison-remove_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-remove_time.png)
[![Elinux-calao-jffs2-comparison-remove cpu
time.png](http://eLinux.org/images/0/09/Elinux-calao-jffs2-comparison-remove_cpu_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-remove_cpu_time.png)
[![Elinux-calao-jffs2-comparison-write
time.png](http://eLinux.org/images/0/04/Elinux-calao-jffs2-comparison-write_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-write_time.png)
[![Elinux-calao-jffs2-comparison-write cpu
time.png](http://eLinux.org/images/f/f9/Elinux-calao-jffs2-comparison-write_cpu_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-write_cpu_time.png)
[![Elinux-calao-jffs2-comparison-video write
time.png](http://eLinux.org/images/8/8b/Elinux-calao-jffs2-comparison-video_write_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-video_write_time.png)
[![Elinux-calao-jffs2-comparison-video write cpu
time.png](http://eLinux.org/images/b/b1/Elinux-calao-jffs2-comparison-video_write_cpu_time.png)](http://eLinux.org/File:Elinux-calao-jffs2-comparison-video_write_cpu_time.png)

## Calao-USB9263 Board / SquashFS over gluebi+mtdblock\_ro

[![Elinux-calao-sqfs-gluebi-comparison-init
time.png](http://eLinux.org/images/b/b9/Elinux-calao-sqfs-gluebi-comparison-init_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-gluebi-comparison-init_time.png)
[![Elinux-calao-sqfs-gluebi-comparison-init cpu
time.png](http://eLinux.org/images/a/a4/Elinux-calao-sqfs-gluebi-comparison-init_cpu_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-gluebi-comparison-init_cpu_time.png)
[![Elinux-calao-sqfs-gluebi-comparison-init
mem.png](http://eLinux.org/images/2/28/Elinux-calao-sqfs-gluebi-comparison-init_mem.png)](http://eLinux.org/File:Elinux-calao-sqfs-gluebi-comparison-init_mem.png)
[![Elinux-calao-sqfs-gluebi-comparison-mount
time.png](http://eLinux.org/images/b/b8/Elinux-calao-sqfs-gluebi-comparison-mount_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-gluebi-comparison-mount_time.png)
[![Elinux-calao-sqfs-gluebi-comparison-mount cpu
time.png](http://eLinux.org/images/f/f0/Elinux-calao-sqfs-gluebi-comparison-mount_cpu_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-gluebi-comparison-mount_cpu_time.png)
[![Elinux-calao-sqfs-gluebi-comparison-mount
mem.png](http://eLinux.org/images/f/f2/Elinux-calao-sqfs-gluebi-comparison-mount_mem.png)](http://eLinux.org/File:Elinux-calao-sqfs-gluebi-comparison-mount_mem.png)
[![Elinux-calao-sqfs-gluebi-comparison-used
space.png](http://eLinux.org/images/8/84/Elinux-calao-sqfs-gluebi-comparison-used_space.png)](http://eLinux.org/File:Elinux-calao-sqfs-gluebi-comparison-used_space.png)
[![Elinux-calao-sqfs-gluebi-comparison-read
time.png](http://eLinux.org/images/1/1d/Elinux-calao-sqfs-gluebi-comparison-read_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-gluebi-comparison-read_time.png)
[![Elinux-calao-sqfs-gluebi-comparison-read cpu
time.png](http://eLinux.org/images/5/59/Elinux-calao-sqfs-gluebi-comparison-read_cpu_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-gluebi-comparison-read_cpu_time.png)

## Calao-USB9263 Board / SquashFS over ubiblk

[![Elinux-calao-sqfs-ubiblk-comparison-init
time.png](http://eLinux.org/images/c/cf/Elinux-calao-sqfs-ubiblk-comparison-init_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-ubiblk-comparison-init_time.png)
[![Elinux-calao-sqfs-ubiblk-comparison-init cpu
time.png](http://eLinux.org/images/e/eb/Elinux-calao-sqfs-ubiblk-comparison-init_cpu_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-ubiblk-comparison-init_cpu_time.png)
[![Elinux-calao-sqfs-ubiblk-comparison-init
mem.png](http://eLinux.org/images/f/fd/Elinux-calao-sqfs-ubiblk-comparison-init_mem.png)](http://eLinux.org/File:Elinux-calao-sqfs-ubiblk-comparison-init_mem.png)
[![Elinux-calao-sqfs-ubiblk-comparison-mount
time.png](http://eLinux.org/images/b/b9/Elinux-calao-sqfs-ubiblk-comparison-mount_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-ubiblk-comparison-mount_time.png)
[![Elinux-calao-sqfs-ubiblk-comparison-mount cpu
time.png](http://eLinux.org/images/3/31/Elinux-calao-sqfs-ubiblk-comparison-mount_cpu_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-ubiblk-comparison-mount_cpu_time.png)
[![Elinux-calao-sqfs-ubiblk-comparison-mount
mem.png](http://eLinux.org/images/3/3f/Elinux-calao-sqfs-ubiblk-comparison-mount_mem.png)](http://eLinux.org/File:Elinux-calao-sqfs-ubiblk-comparison-mount_mem.png)
[![Elinux-calao-sqfs-ubiblk-comparison-read
time.png](http://eLinux.org/images/8/88/Elinux-calao-sqfs-ubiblk-comparison-read_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-ubiblk-comparison-read_time.png)
[![Elinux-calao-sqfs-ubiblk-comparison-read cpu
time.png](http://eLinux.org/images/c/ca/Elinux-calao-sqfs-ubiblk-comparison-read_cpu_time.png)](http://eLinux.org/File:Elinux-calao-sqfs-ubiblk-comparison-read_cpu_time.png)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Flash Filesystem
    Benchmarks](http://eLinux.org/index.php?title=Category:Flash_Filesystem_Benchmarks&action=edit&redlink=1 "Category:Flash Filesystem Benchmarks (page does not exist)")

