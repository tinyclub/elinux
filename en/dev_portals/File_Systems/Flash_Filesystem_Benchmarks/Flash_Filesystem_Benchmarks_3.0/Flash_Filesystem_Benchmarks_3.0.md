> From: [eLinux.org](http://eLinux.org/Flash_Filesystem_Benchmarks_3.0 "http://eLinux.org/Flash_Filesystem_Benchmarks_3.0")


# Flash Filesystem Benchmarks 3.0



This page is part of the
[Flash\_Filesystem\_Benchmarks](http://eLinux.org/Flash_Filesystem_Benchmarks "Flash Filesystem Benchmarks")
effort done by Free Electrons with funding from the CE Linux Forum. This
page presents the results of our tests with a 3.0 vanilla Linux kernel.

**Note:** yaffs2 isn't included because it doesn't build against 3.0
(since the removal `include/linux/smp_lock.h`, actually)

## Board IGEPv2

[![Elinux-igepv2-3.0-init
time.png](http://eLinux.org/images/c/c2/Elinux-igepv2-3.0-init_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-init_time.png)
[![Elinux-igepv2-3.0-init cpu
time.png](http://eLinux.org/images/2/27/Elinux-igepv2-3.0-init_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-init_cpu_time.png)
[![Elinux-igepv2-3.0-init
mem.png](http://eLinux.org/images/7/71/Elinux-igepv2-3.0-init_mem.png)](http://eLinux.org/File:Elinux-igepv2-3.0-init_mem.png)
[![Elinux-igepv2-3.0-mount
time.png](http://eLinux.org/images/9/9e/Elinux-igepv2-3.0-mount_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-mount_time.png)
[![Elinux-igepv2-3.0-mount cpu
time.png](http://eLinux.org/images/b/b6/Elinux-igepv2-3.0-mount_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-mount_cpu_time.png)
[![Elinux-igepv2-3.0-mount
mem.png](http://eLinux.org/images/8/88/Elinux-igepv2-3.0-mount_mem.png)](http://eLinux.org/File:Elinux-igepv2-3.0-mount_mem.png)
[![Elinux-igepv2-3.0-remount
time.png](http://eLinux.org/images/8/8f/Elinux-igepv2-3.0-remount_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-remount_time.png)
[![Elinux-igepv2-3.0-remount cpu
time.png](http://eLinux.org/images/9/9b/Elinux-igepv2-3.0-remount_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-remount_cpu_time.png)
[![Elinux-igepv2-3.0-used
space.png](http://eLinux.org/images/f/f4/Elinux-igepv2-3.0-used_space.png)](http://eLinux.org/File:Elinux-igepv2-3.0-used_space.png)
[![Elinux-igepv2-3.0-read
time.png](http://eLinux.org/images/1/11/Elinux-igepv2-3.0-read_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-read_time.png)
[![Elinux-igepv2-3.0-read cpu
time.png](http://eLinux.org/images/9/97/Elinux-igepv2-3.0-read_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-read_cpu_time.png)
[![Elinux-igepv2-3.0-remove
time.png](http://eLinux.org/images/a/ab/Elinux-igepv2-3.0-remove_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-remove_time.png)
[![Elinux-igepv2-3.0-remove cpu
time.png](http://eLinux.org/images/f/fb/Elinux-igepv2-3.0-remove_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-remove_cpu_time.png)
[![Elinux-igepv2-3.0-write
time.png](http://eLinux.org/images/c/cf/Elinux-igepv2-3.0-write_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-write_time.png)
[![Elinux-igepv2-3.0-write cpu
time.png](http://eLinux.org/images/a/ab/Elinux-igepv2-3.0-write_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-write_cpu_time.png)
[![Elinux-igepv2-3.0-video write
time.png](http://eLinux.org/images/8/84/Elinux-igepv2-3.0-video_write_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-video_write_time.png)
[![Elinux-igepv2-3.0-video write cpu
time.png](http://eLinux.org/images/f/fb/Elinux-igepv2-3.0-video_write_cpu_time.png)](http://eLinux.org/File:Elinux-igepv2-3.0-video_write_cpu_time.png)

## Board Calao-USB9263

[![Elinux-calao-3.0-init
time.png](http://eLinux.org/images/2/27/Elinux-calao-3.0-init_time.png)](http://eLinux.org/File:Elinux-calao-3.0-init_time.png)
[![Elinux-calao-3.0-init cpu
time.png](http://eLinux.org/images/e/e0/Elinux-calao-3.0-init_cpu_time.png)](http://eLinux.org/File:Elinux-calao-3.0-init_cpu_time.png)
[![Elinux-calao-3.0-init
mem.png](http://eLinux.org/images/4/4f/Elinux-calao-3.0-init_mem.png)](http://eLinux.org/File:Elinux-calao-3.0-init_mem.png)
[![Elinux-calao-3.0-mount
time.png](http://eLinux.org/images/5/5b/Elinux-calao-3.0-mount_time.png)](http://eLinux.org/File:Elinux-calao-3.0-mount_time.png)
[![Elinux-calao-3.0-mount cpu
time.png](http://eLinux.org/images/b/b8/Elinux-calao-3.0-mount_cpu_time.png)](http://eLinux.org/File:Elinux-calao-3.0-mount_cpu_time.png)
[![Elinux-calao-3.0-mount
mem.png](http://eLinux.org/images/4/42/Elinux-calao-3.0-mount_mem.png)](http://eLinux.org/File:Elinux-calao-3.0-mount_mem.png)
[![Elinux-calao-3.0-remount
time.png](http://eLinux.org/images/0/01/Elinux-calao-3.0-remount_time.png)](http://eLinux.org/File:Elinux-calao-3.0-remount_time.png)
[![Elinux-calao-3.0-remount cpu
time.png](http://eLinux.org/images/0/0d/Elinux-calao-3.0-remount_cpu_time.png)](http://eLinux.org/File:Elinux-calao-3.0-remount_cpu_time.png)
[![Elinux-calao-3.0-used
space.png](http://eLinux.org/images/9/99/Elinux-calao-3.0-used_space.png)](http://eLinux.org/File:Elinux-calao-3.0-used_space.png)
[![Elinux-calao-3.0-read
time.png](http://eLinux.org/images/1/16/Elinux-calao-3.0-read_time.png)](http://eLinux.org/File:Elinux-calao-3.0-read_time.png)
[![Elinux-calao-3.0-read cpu
time.png](http://eLinux.org/images/0/09/Elinux-calao-3.0-read_cpu_time.png)](http://eLinux.org/File:Elinux-calao-3.0-read_cpu_time.png)
[![Elinux-calao-3.0-remove
time.png](http://eLinux.org/images/8/8c/Elinux-calao-3.0-remove_time.png)](http://eLinux.org/File:Elinux-calao-3.0-remove_time.png)
[![Elinux-calao-3.0-remove cpu
time.png](http://eLinux.org/images/3/3f/Elinux-calao-3.0-remove_cpu_time.png)](http://eLinux.org/File:Elinux-calao-3.0-remove_cpu_time.png)
[![Elinux-calao-3.0-write
time.png](http://eLinux.org/images/c/c1/Elinux-calao-3.0-write_time.png)](http://eLinux.org/File:Elinux-calao-3.0-write_time.png)
[![Elinux-calao-3.0-write cpu
time.png](http://eLinux.org/images/0/0f/Elinux-calao-3.0-write_cpu_time.png)](http://eLinux.org/File:Elinux-calao-3.0-write_cpu_time.png)
[![Elinux-calao-3.0-video write
time.png](http://eLinux.org/images/0/08/Elinux-calao-3.0-video_write_time.png)](http://eLinux.org/File:Elinux-calao-3.0-video_write_time.png)
[![Elinux-calao-3.0-video write cpu
time.png](http://eLinux.org/images/4/42/Elinux-calao-3.0-video_write_cpu_time.png)](http://eLinux.org/File:Elinux-calao-3.0-video_write_cpu_time.png)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Flash Filesystem
    Benchmarks](http://eLinux.org/index.php?title=Category:Flash_Filesystem_Benchmarks&action=edit&redlink=1 "Category:Flash Filesystem Benchmarks (page does not exist)")

