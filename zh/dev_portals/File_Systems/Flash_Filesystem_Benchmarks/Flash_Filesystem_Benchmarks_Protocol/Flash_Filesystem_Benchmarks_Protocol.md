> From: [eLinux.org](http://eLinux.org/Flash_Filesystem_Benchmarks_Protocol "http://eLinux.org/Flash_Filesystem_Benchmarks_Protocol")


# Flash Filesystem Benchmarks Protocol



This page refers to the benchmarks presented at [Flash Filesystem
Benchmarks](http://eLinux.org/Flash_Filesystem_Benchmarks "Flash Filesystem Benchmarks")

## Contents

-   [1 Tested filesystems](#tested-filesystems)
-   [2 Tests performed](#tests-performed)
    -   [2.1 Init test](#init-test)
    -   [2.2 Mount test](#mount-test)
    -   [2.3 Read timing test](#read-timing-test)
    -   [2.4 Erase test](#erase-test)
    -   [2.5 Write test](#write-test)
    -   [2.6 Big file write test](#big-file-write-test)
-   [3 Communication with the device](#communication-with-the-device)
-   [4 Kernel and RootFS](#kernel-and-rootfs)
-   [5 Issues](#issues)
    -   [5.1 Memory usage measurement](#memory-usage-measurement)
    -   [5.2 Block filesystems and bad
        blocks](#block-filesystems-and-bad-blocks)
    -   [5.3 Free space shortage](#free-space-shortage)
    -   [5.4 Non-significant time
        measurment](#non-significant-time-measurment)
    -   [5.5 UBI not scaling as expected](#ubi-not-scaling-as-expected)

## Tested filesystems

The test bench covers the following filesystems :

-   **JFFS2** filesystem. All tests are performed with this filesystem.
-   **UBIFS** filesystem. All tests are performed with this filesystem.
-   **SquashFS over *ubiblk***. *ubiblk* is a UBI to block translation
    module that Free Electrons has developed, it makes it possible to
    mount a SquashFS filesystem inside an UBI volume. In this case, none
    of the tests involving write or removal are performed, since
    SquashFS is a read-only filesystem. Those results are labeled
    `squashfs-ubiblk` in our graphs.
-   **SquashFS over *mtdblock\_ro* over *gluebi***, which makes it
    possible to mount a SquashFS filesystem inside an UBI volume.
    Contrary to *ubiblk*, this solution is completely in the mainline
    Linux kernel. In this case, none of the tests involving write or
    removal are performed, since SquashFS is a read-only filesystem.
    Those results are labeled `squashfs-gluebi` in our graphs.
-   **YAFFS2 filesystem**. All tests are performed with this filesystem.
    However, unfortunately, YAFFS2 doesn't build for recent (2.6.39,
    3.0) kernel versions, so we were unable to update our test results
    for YAFFS2.
-   **Raw**. This is not a filesystem, but only raw read performances on
    the flash measured by *nanddump*ing the flash.

All filesystem supports are built as module, including the UBI support.
The *logfs* filesystem is not tested as it is way too unstable.

## Tests performed

Multiple tests are performed on each filesystem / size couple, and those
tests give the following list of values as result:

-   `init_time` and `init_cpu_time` --\> [module initialisation
    time](#Init_test)
-   `init_mem` --\> [module initialisation memory usage](#Init_test) (x)
-   `mount_time` and `mount_cpu_time` --\> [mount time](#Mount_test)
-   `mount_mem` --\> [memory usage for mounting the
    filesystem](#Mount_test) (x)
-   `remount_time` --\> [hot remount time](#Mount_test)
-   `used_space` --\> [space used by the filesystem after
    mounting](#Mount_test)
-   `read_time` and `read_cpu_time` --\> [read timing
    test](#Read_timing_test)
-   `remove_time` and `remove_cpu_time` --\> [erase test](#Erase_test)
-   `write_time` and `write_cpu_time` --\> [write test](#Write_test)
-   `video_write_time` and `video_write_cpu_time` --\> [big -
    uncompressible - file write test](#Big_file_write_test)

Items marked with an (x) don't seem to be reliable yet.

The tests are run in the order as shown above. One filesystem/size
couple (e.g. jffs2/128MB) is tested, then the board is reset and the
next filesystem/size couple is tested.

Notes :

-   The time measurements are done with the `time` util (not the shell
    builtin) is used to launch the command to be timed. When a cache can
    speed the measured criterium up (e.g. read or remove), a `sync` is
    included in the command being timed. The CPU time as well as the
    wall-clock time are measured. So for example, `mount_time` in our
    graphs is the wall-clock time needed to perform the mount test,
    while `mount_cpu_time` in our graphs is the CPU time needed to
    perform the mount test.
-   The memory measurements are done using the content of /proc/meminfo
    right before and after the measured command. The sum of "MemFree",
    "Buffers" and "Cached" is considered to be free memory. The memory
    usage is then the difference before/after. The results tend to show
    that this approach isn't reliable with regard to absolute memory
    consumption: results for one filesystem with different sizes do not
    always follow a law. Results are sometimes negative (memory
    usage\<0).

However, when comparing results (as opposed to "absolute results") of
the different filesystems, some constantly have a low footprint whereas
other have a large one. When the memory usage doesn't scale, it is also
obvious.

### Init test

The init test consists of modprobing the filesystem driver.

In the case of a filesystem on top of UBI, it also consists of
modprobing ubi and attaching a device.

Both time and memory consumption (with inconsitencies explained above)
are measured.

### Mount test

This test simply consists of mounting a partition. (In the case of
ubifs, attaching occured in the previous test)

Both time and memory are measured.

After the mount, a remount (`mount -o remount`) timing test is also
performed when applicable (ie. not for read-only filesystems).

The used space on flash is also measured, using `df`.

### Read timing test

A tar archive of the test filesystem's content is created and written to
/dev/zero (Note: tar detects writes to /dev/null and discards them). A
sync is performed afterward.

This test filesystem contains what would a root filesystem contain.

As reference time, a "raw" read operation is also performed: It consists
of a `nanddump` of the same amount of flash as the uncompressed size of
the filesystem. Compressed filesystems may have a better result than
this reference time.

### Erase test

The whole content of the filesystem is `rm -rf`-ed ; a sync is then
performed. All of this is timed.

### Write test

The content of a folder - previously mounted in a tmpfs - is copied into
the flash partition. When this partition is large, it is done several
times until the partition is almost full: (size / 8) times

### Big file write test

This test is almost the same as the previous one but only one video is
written (possibly several times, as before).

## Communication with the device

A serial connection with the device is assumed. The bench script waits
until a prompt (U-Boot or shell) is displayed and sends a batch of
commands to be executed. It waits for the next prompt, parses the result
and stores it in a SQL database when needed, and sends the next
commands.

Multiline shell commands aren't passed through the serial line but are
stored in shell files and these files are executed. However, we do so
for all filesystems and all sizes homogeneously, so the overhead is
consistent.

## Kernel and RootFS

The kernel is loaded in ram from an external storage (MMC, tftp etc.) to
ensure maximal free space on the flash. On most cards, it may be
possible to use the whole flash by putting the first stage bootloader
and uboot on an MMC card. However, we didn't need to for the tests on
IGEPv2.

The RootFS is also put on an external storage (here, NFS). However, for
read/write operation, the output/input is stored/loaded to/from
devzero/ramfs to avoid hihgly random latency.

## Issues

### Memory usage measurement

The measured init memory footprint is sometimes negative. It also does
not always follow any law with regard to scaling.

The results are however mostly consistent and make it possible to
compare the considered filesystems.

### Block filesystems and bad blocks

When a block filesystem encounters a bad block, it has no way of dealing
with them. So, when the filesystem becomes large, it inevitably fails to
flash.

The results for these tests are then unreliable and must be manually
deleted.

### Free space shortage

When the filesystem size is near from the flash size, some filesystem
fail to write any more data. That kind of problems occured when writing
video: That kind of data can't be compressed.

They also took a long time to fail and sometime also made the system
lack of free memory. It hasn't be verified yet, but one hypothesis might
be that the wear-leveling and garbage-collecting processes fail to
efficiently operate under such load and need too much memory.

### Non-significant time measurment

For unforseeable reasons, the time taken by an operation can be much
larger than expected and/or than on another batch of tests.

Running several occurencies of the tests, remove the highest and lowest
values and computing the average could be a solution.

That solution has been implemented but its implementation isn't perfect:
it should first remove the best and worts results and that would need a
lot of runs.

### UBI not scaling as expected

UBI init time is supposed to scale linearly with the size of the device.
But since the tests always use the same mtd partition and thus, the same
UBI device size (no matter what the volume size may be), the init time
won't reflect the size of the filesystem. A fix could be to define a
different partition at each boot. The size of the test partition can be
precised at each reboot but if this size is defined to be that of the
filesystem, because of UBI overhead, ubifs will lack of space.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Flash Filesystem
    Benchmarks](http://eLinux.org/index.php?title=Category:Flash_Filesystem_Benchmarks&action=edit&redlink=1 "Category:Flash Filesystem Benchmarks (page does not exist)")

