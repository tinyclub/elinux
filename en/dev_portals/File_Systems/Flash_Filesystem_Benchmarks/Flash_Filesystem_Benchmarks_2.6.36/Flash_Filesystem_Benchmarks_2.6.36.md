> From: [eLinux.org](http://eLinux.org/Flash_Filesystem_Benchmarks_2.6.36 "http://eLinux.org/Flash_Filesystem_Benchmarks_2.6.36")


# Flash Filesystem Benchmarks 2.6.36



This page is part of the
[Flash\_Filesystem\_Benchmarks](http://eLinux.org/Flash_Filesystem_Benchmarks "Flash Filesystem Benchmarks")
effort done by Free Electrons with funding from the CE Linux Forum.

-   The results below are old, and our test scripts have been improved,
    so we recommend looking at our results for newer kernel versions
    instead
-   These results were obtained on a [CALAO Systems
    USB-A9263-C02](http://www.calao-systems.com/articles.php?lng=en&pg=5932)
    board.
-   See our [ELCE 2010
    presentation](http://elinux.org/images/d/d7/Elce2010-flash-filesystems.pdf)
    for complete details and graphical representations of those results.

<!-- -->

    Test: init_time (s)
    size     ubifs   jffs2   yaffs2
    8    0.34    0.12    0.07
    32   0.78    0.39    0.25
    128  1   0.41    0.26
    252  1.17    0.42    0.26

    Test: init_mem (KB)
    size     ubifs   jffs2   yaffs2
    8    888     444     96
    32   916     464     96
    128  956     576     88
    252  988     436     80

    Test: mount_time (s)
    size     ubifs   jffs2   yaffs2
    8    0.14    0.11    0.03
    32   0.36    0.48    0.34
    128  0.43    1.38    0.51
    252  0.33    2.08    0.96

    Test: mount_mem (KB)
    size     ubifs   jffs2   yaffs2
    8    544     184     8
    32   532     316     20
    128  548     712     664
    252  540     1540    2336

    Test: init_time + mount_time (s)
    size     ubifs   jffs2   yaffs2
    8    0.48    0.23    0.1
    32   1.14    0.87    0.59
    128  1.43    1.79    0.77
    252  1.5     2.5     1.22

    Test: init_mem + mount_mem (MB)
    size     ubifs   jffs2   yaffs2
    8    1432    628     104
    32   1448    780     116
    128  1504    1288    752
    252  1528    1976    2416

    Test: used_space (KB)
    size     ubifs   jffs2   yaffs2
    8    4520    4196    8000
    32   16164   13940   30204
    128  64748   54028   117428
    252  127192  109880  233676

    Test: read_time (s)
    size     ubifs   jffs2   yaffs2
    8    4.46    1.48    1.18
    32   1.84    5.46    1.8
    128  4.86    19.53   4.81
    252  11.59   43.97   11.51

    Test: remove_time (s)
    size     ubifs   jffs2   yaffs2
    8    7.4     5.76    9.52
    32   6.93    5.11    7.77
    128  10.16   8.97    16.42
    252  17.26   9.82    37.56

    Test: write_time (s)
    size     ubifs   jffs2   yaffs2
    8    4.83    15.97   4.31
    32   16.47   60.83   11.14
    128  61.41   236.96  37.09
    252  118.38  459.58  70.56

    Test: video_write_time (s)
    size     ubifs   jffs2   yaffs2
    8    -   16.06   3.69
    32   19.03   60.92   8.45
    128  72.76   238.99  28.85
    252  140.16  461.35  55.16


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Flash Filesystem
    Benchmarks](http://eLinux.org/index.php?title=Category:Flash_Filesystem_Benchmarks&action=edit&redlink=1 "Category:Flash Filesystem Benchmarks (page does not exist)")

