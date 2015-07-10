> From: [eLinux.org](http://eLinux.org/Benchmark_Programs "http://eLinux.org/Benchmark_Programs")


# Benchmark Programs



Here are some different programs for performing benchmarking.

*Note: It is important to recognize that benchmarks between systems may
be misleading.* Benchmarks should primarily be used to determine
differences in performance for different software configurations on the
**same** hardware system.

## Contents

-   [1 Unix Bench](#unix-bench)
-   [2 lmbench](#lmbench)
    -   [2.1 Instructions for
        lmbench-3.0-a9](#instructions-for-lmbench-3-0-a9)
-   [3 Wishlist](#wishlist)

## Unix Bench

FYI, the URL to the UnixBench is as follows;

OLD site:
[http://www.tux.org/pub/tux/benchmarks/System/unixbench/](http://www.tux.org/pub/tux/benchmarks/System/unixbench/)

NEW site:
[http://code.google.com/p/byte-unixbench/](http://code.google.com/p/byte-unixbench/)

UnixBench contains 9 kinds of tests:

1.  Dhrystone 2 using register variables
2.  Double-Precision Whetstone
3.  Execl Throughput
4.  File Copy
5.  Pipe Throughput
6.  Pipe-based Context Switching
7.  Process Creation
8.  Shell Script
9.  System Call Overhead

## lmbench

The LMBench home page is at:
[http://www.bitmover.com/lmbench/](http://www.bitmover.com/lmbench/)
and/or
[http://lmbench.sourceforge.net/](http://lmbench.sourceforge.net/)
 The sourceforge project page is at:
[http://sourceforge.net/projects/lmbench](http://sourceforge.net/projects/lmbench)

### Instructions for lmbench-3.0-a9

(Adjust CC and OS according to your needs.)

    cd lmbench-3.0-a9/src
    make CC=arm-linux-gcc OS=arm-linux TARGET=linux

Make the whole lmbench-3.0-a9 directory accessible on the target, e.g.
by copying or NFS mount. Make sure the benchmark scripts can write the
configuration file and results, and also unpack a tarball used during
the benchmark (in case tar is not available on target):

    chmod a+w ../bin/arm-linux ../results
    tar xf webpage-lm.tar

To run the benchmark on the target:

    cd lmbench-3.0-a9/src
    hostname foo    # make sure hostname is set, the scripts use it to name config and result files
    OS=arm-linux ../scripts/config-run
    OS=arm-linux ../scripts/results

This worked for me on a target using BusyBox v1.10.2 ash.

The results are written into lmbench-3.0-a9/results/, for each run of
the ../scripts/results a new file is created. You can copy the results
back to your PC and run various kinds of summary postprocessing scripts
from lmbench, e.g.

    ../scripts/getsummary ../results/arm-linux/*

## Wishlist

A list of benchmark results would be useful:

-   Comparing performance of different FFT implementations on
    Beagleboard-XM:
    [http://pmeerw.dyndns.org/blog/programming/arm\_fft.html](http://pmeerw.dyndns.org/blog/programming/arm_fft.html)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

