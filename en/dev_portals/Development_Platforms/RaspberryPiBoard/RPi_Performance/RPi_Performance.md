> From: [eLinux.org](http://eLinux.org/RPi_Performance "http://eLinux.org/RPi_Performance")


# RPi Performance



<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#CPU">1 CPU</a>
<ul>
<li><a href="#LINPACK">1.1 LINPACK</a>
<ul>
<li><a href="#Source">1.1.1 Source</a></li>
<li><a href="#Compile.2FRun">1.1.2 Compile/Run</a></li>
<li><a href="#Results">1.1.3 Results</a></li>
</ul></li>
<li><a href="#Whetstone.2FDhrystone">1.2 Whetstone/Dhrystone</a>
<ul>
<li><a href="#Source_2">1.2.1 Source</a></li>
<li><a href="#Compile.2FRun_2">1.2.2 Compile/Run</a></li>
<li><a href="#Results_2">1.2.3 Results</a></li>
</ul></li>
<li><a href="#OpenSSL">1.3 OpenSSL</a>
<ul>
<li><a href="#Source_3">1.3.1 Source</a></li>
<li><a href="#Compile.2FRun_3">1.3.2 Compile/Run</a></li>
<li><a href="#Results_3">1.3.3 Results</a></li>
</ul></li>
</ul></li>
<li><a href="#GPU">2 GPU</a>
<ul>
<li><a href="#ioquake3">2.1 ioquake3</a>
<ul>
<li><a href="#Source_4">2.1.1 Source</a></li>
<li><a href="#Compile.2FRun_4">2.1.2 Compile/Run</a></li>
<li><a href="#Results_4">2.1.3 Results</a></li>
</ul></li>
</ul></li>
<li><a href="#I.2FO">3 I/O</a>
<ul>
<li><a href="#USB_bus">3.1 USB bus</a></li>
<li><a href="#SD_card">3.2 SD card</a></li>
<li><a href="#NIC">3.3 NIC</a>
<ul>
<li><a href="#Compile.2FRun_5">3.3.1 Compile/Run</a></li>
<li><a href="#Results_5">3.3.2 Results</a></li>
</ul></li>
<li><a href="#Routing">3.4 Routing</a>
<ul>
<li><a href="#Methodology">3.4.1 Methodology</a></li>
<li><a href="#Results_6">3.4.2 Results</a></li>
</ul></li>
</ul></li>
<li><a href="#Power">4 Power</a></li>
<li><a href="#References">5 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Software & Distributions:**

*[Software](http://eLinux.org/RPi_Software "RPi Software") - an overview.*

*[Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") - operating
systems and development environments for the Raspberry Pi.*

*[Kernel Compilation](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation")
- advice on compiling a kernel.*

***Performance** - measures of the Raspberry Pi's performance.*

*[Programming](http://eLinux.org/RPi_Programming "RPi Programming") - programming
languages that might be used on the Raspberry Pi.*



# CPU

## LINPACK

The ARM has been tested using the LINPACK benchmark from
[[1]](http://www.netlib.org/benchmark/linpackc.new), built with gcc with
-O3 (Optimisation level 3). Run with array size 200.

With software floating point

### Source

[[2]](http://www.netlib.org/benchmark/linpackc.new)

### Compile/Run

    cc -O3 -o linpack linpack.c -lm
      linpack.c: In function ‘main’:
      linpack.c:69: warning: return type of ‘main’ is not ‘int’
    ./linpack
      Enter array size (q to quit) [200]: 200



### Results

Crippled

    Memory required:  315K.

    LINPACK benchmark, Double precision.
    Machine precision:  15 digits.
    Array size 200 X 200.
    Average rolled and unrolled performance:

        Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS
           2   0.53  92.45%   1.89%   5.66%   5493.333
           4   1.07  92.52%   2.80%   4.67%   5385.621
           8   2.12  92.45%   2.36%   5.19%   5466.003
          16   4.24  92.45%   2.83%   4.72%   5438.944
          32   8.49  92.11%   2.71%   5.18%   5459.213
          64  16.98  92.05%   2.89%   5.06%   5452.440

Hardware floating point (-mfloat-abi=softfp)

    Memory required:  315K.
    LINPACK benchmark, Double precision.
    Machine precision:  15 digits.
    Array size 200 X 200.
    Average rolled and unrolled performance:

        Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS
           8   0.51  90.20%   3.92%   5.88%  22888.889
          16   1.02  89.22%   4.90%   5.88%  22888.889
          32   2.05  90.24%   3.41%   6.34%  22888.889
          64   4.08  91.42%   2.94%   5.64%  22829.437
         128   8.16  91.54%   2.94%   5.51%  22799.827
         256  16.31  91.35%   2.76%   5.89%  22903.800

Full hardware floating point on Raspbian (-mfloat-abi=hard -mfpu=vfp)
and arm\_freq=700

    Memory required:  315K.
    LINPACK benchmark, Double precision.
    Machine precision:  15 digits.
    Array size 200 X 200.
    Average rolled and unrolled performance:

        Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS
          16   0.58  89.66%   3.45%   6.90%  40691.358
          32   1.17  87.18%   4.27%   8.55%  41071.651
          64   2.32  88.36%   3.02%   8.62%  41459.119
         128   4.67  88.22%   3.43%   8.35%  41071.651
         256   9.33  88.85%   3.32%   7.82%  40880.620
         512  18.63  89.00%   2.95%   8.05%  41047.675

Full hardware floating point on Raspbian (-mfloat-abi=hard -mfpu=vfp)
and arm\_freq=1000 and core\_freq=500

    Memory required:  315K.
    LINPACK benchmark, Double precision.
    Machine precision:  15 digits.
    Array size 200 X 200.
    Average rolled and unrolled performance:

        Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS
          32   0.79  89.87%   0.00%  10.13%  61896.714
          64   1.58  89.24%   1.27%   9.49%  61463.869
         128   3.16  90.19%   1.90%   7.91%  60407.789
         256   6.32  88.13%   3.80%   8.07%  60511.761
         512  12.65  87.83%   3.56%   8.62%  60825.836

Full hardware floating point on Gentoo with more compiler optimizations
(gcc-4.6.3 -Ofast -fno-fast-math), default clocks

    Memory required:  315K.
    LINPACK benchmark, Double precision.
    Machine precision:  15 digits.
    Array size 200 X 200.
    Average rolled and unrolled performance:

        Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS
    ----------------------------------------------------
          16   0.56  89.29%   1.79%   8.93%  43084.967
          32   1.13  91.15%   4.42%   4.42%  40691.358
          64   2.25  89.78%   3.56%   6.67%  41853.968
         128   4.51  87.80%   4.21%   7.98%  42358.233
         256   9.01  88.68%   3.88%   7.44%  42155.076
         512  18.01  89.23%   2.78%   8.00%  42434.923

## Whetstone/Dhrystone

All code compiled with gcc options -float-abi=softfp -O3

### Source

Code for these tests can be found here
[http://www.rowley.co.uk/arm/whet\_dhry.zip](http://www.rowley.co.uk/arm/whet_dhry.zip).
Or if 404 this code might be analogous
[http://freespace.virgin.net/roy.longbottom/benchnt.zip](http://freespace.virgin.net/roy.longbottom/benchnt.zip)



### Compile/Run

    ?



### Results

Dhrystone

    Microseconds for one run through Dhrystone: 1.2

    Dhrystones per Second: 809061.5


 Whetstone Crippled

    Loops: 1000, Iterations: 10, Duration: 24 sec.

    C Converted Double Precision Whetstones: 41.7 MIPS

Rebuilding the Whetstone test code with 'gcc -mfpu -float-abi=softfp'
gives better results:


    Loops: 1000, Iterations: 100, Duration: 106 sec.
    C Converted Double Precision Whetstones: 94.3 MIPS

However, the majority of compute time is spent in the SQRT function,
which for the above test was built without -mfpu=vfp. Using a library
with vfp give the following much improved result:

    Loops: 1000, Iterations: 100, Duration: 15 sec.
    C Converted Double Precision Whetstones: 666.7 MIPS

## OpenSSL

### Source

[[3]](http://www.openssl.org/source/)

### Compile/Run

    openssl version;
    openssl speed;

### Results

Assembly optimization disabled:

    OpenSSL 0.9.8o 01 Jun 2010
    built on: Thu Aug 26 18:56:26 UTC 2010
    options:bn(64,32) md2(int) rc4(ptr,int) des(idx,risc1,4,long) aes(partial) blowfish(idx)
    compiler: gcc -fPIC -DOPENSSL_PIC -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall
    available timing options: TIMES TIMEB HZ=100 [sysconf value]
    timing function used: times
    The 'numbers' are in 1000s of bytes per second processed.
    type             16 bytes     64 bytes    256 bytes   1024 bytes   8192 bytes
    md2                148.81k      372.18k      624.81k      769.95k      832.90k
    mdc2                 0.00         0.00         0.00         0.00         0.00
    md4                615.30k     2468.76k     7612.19k    16707.01k    28104.86k
    md5                380.13k     1501.12k     4800.77k    11312.81k    21682.77k
    hmac(md5)         1022.28k     3480.23k     9587.80k    17492.25k    25441.78k
    sha1               303.72k     1092.39k     3106.50k     6302.57k     9852.39k
    rmd160             244.29k      849.04k     2414.53k     4747.26k     7513.00k
    rc4              14658.70k    16836.49k    17462.03k    17628.21k    17522.08k
    des cbc           2913.17k     3221.30k     3289.77k     3360.09k     3367.21k
    des ede3          1149.87k     1188.59k     1198.46k     1206.00k     1208.25k
    idea cbc             0.00         0.00         0.00         0.00         0.00
    seed cbc             0.00         0.00         0.00         0.00         0.00
    rc2 cbc           2812.71k     3012.02k     3054.19k     3077.82k     3076.12k
    rc5-32/12 cbc        0.00         0.00         0.00         0.00         0.00
    blowfish cbc      6091.32k     7007.89k     7250.62k     7288.21k     7163.88k
    cast cbc          5068.25k     6020.03k     6345.71k     6367.64k     6260.44k
    aes-128 cbc       3205.76k     3497.72k     3616.00k     3652.49k     3665.85k
    aes-192 cbc       2730.65k     2981.88k     3073.20k     3102.38k     3111.86k
    aes-256 cbc       2383.90k     2596.12k     2659.91k     2702.13k     2732.50k
    camellia-128 cbc     0.00         0.00         0.00         0.00         0.00
    camellia-192 cbc     0.00         0.00         0.00         0.00         0.00
    camellia-256 cbc     0.00         0.00         0.00         0.00         0.00
    sha256             679.98k     1629.47k     2905.43k     3708.32k     4175.45k
    sha512              41.02k      163.83k      232.63k      318.20k      353.81k
    aes-128 ige       3089.03k     3579.08k     3698.68k     3689.14k     3578.18k
    aes-192 ige       2641.68k     3019.45k     3111.38k     3144.95k     3035.70k
    aes-256 ige       2334.50k     2632.35k     2705.04k     2735.69k     2687.74k
                      sign    verify    sign/s verify/s
    rsa  512 bits 0.013747s 0.001193s     72.7    838.4
    rsa 1024 bits 0.063481s 0.002742s     15.8    364.7
    rsa 2048 bits 0.321250s 0.007378s      3.1    135.5
    rsa 4096 bits 1.805000s 0.022528s      0.6     44.4
                      sign    verify    sign/s verify/s
    dsa  512 bits 0.011690s 0.013597s     85.5     73.5
    dsa 1024 bits 0.027233s 0.031683s     36.7     31.6
    dsa 2048 bits 0.073897s 0.087304s     13.5     11.5

Assembly optimization enabled:

    OpenSSL 1.0.1c 10 May 2012
    built on: Sun Jul 29 00:43:16 CEST 2012
    options:bn(64,32) rc4(ptr,char) des(idx,cisc,16,long) aes(partial) idea(int) blowfish(ptr)
    compiler: armv6j-hardfloat-linux-gnueabi-gcc -fPIC -DOPENSSL_PIC -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN \
    -DHAVE_DLFCN_H -DL_ENDIAN -DTERMIO -Wall -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM \
    -DSHA512_ASM -DAES_ASM -DGHASH_ASM -O2 -march=armv6j -mfpu=vfp -mfloat-abi=hard -fno-strict-aliasing -Wa,--noexecstack
    The 'numbers' are in 1000s of bytes per second processed.
    type             16 bytes     64 bytes    256 bytes   1024 bytes   8192 bytes
    md2                  0.00         0.00         0.00         0.00         0.00
    mdc2               724.41k      933.06k     1024.68k     1063.59k     1075.88k
    md4               2547.83k     9441.28k    27284.48k    51824.98k    69894.14k
    md5               1954.05k     7217.96k    20805.95k    39365.29k    53226.15k
    hmac(md5)         3075.61k    10241.88k    26669.65k    44729.00k    55386.11k
    sha1              2115.34k     6823.83k    16264.45k    25053.18k    30121.35k
    rmd160            1487.88k     4783.96k    10707.71k    15800.32k    19303.08k
    rc4              34205.43k    39535.98k    41215.83k    41561.43k    41570.04k
    des cbc           6251.12k     6605.08k     6686.81k     6713.01k     6707.54k
    des ede3          2326.45k     2368.36k     2385.83k     2397.53k     2391.84k
    idea cbc          8758.77k     9421.31k     9607.34k     9653.93k     9687.93k
    seed cbc          8274.52k     9036.46k     9264.64k     9321.47k     9284.27k
    rc2 cbc           6047.90k     6354.82k     6458.82k     6465.19k     6485.33k
    rc5-32/12 cbc    16204.47k    18649.32k    19367.94k    19560.11k    19649.84k
    blowfish cbc     11934.03k    13189.85k    13546.92k    13633.19k    13486.76k
    cast cbc         10797.59k    11828.46k    12156.58k    12187.65k    12050.43k
    aes-128 cbc      12978.72k    14708.69k    15387.40k    15472.93k    15529.06k
    aes-192 cbc      11441.49k    12834.60k    13315.69k    13453.78k    13430.80k
    aes-256 cbc      10267.01k    11409.83k    11744.41k    11812.86k    11859.64k
    camellia-128 cbc     9312.98k    10278.89k    10572.46k    10646.19k    10657.82k
    camellia-192 cbc     7541.38k     8140.71k     8325.63k     8370.18k     8361.30k
    camellia-256 cbc     7513.97k     8138.65k     8297.98k     8351.40k     8347.65k
    sha256            3598.03k     8377.26k    14605.57k    17979.39k    19300.35k
    sha512            1080.74k     4322.82k     6151.85k     8416.32k     9418.07k
    whirlpool          361.82k      729.24k     1186.42k     1425.38k     1512.79k
    aes-128 ige      11702.57k    13853.45k    14429.53k    14671.38k    14057.47k
    aes-192 ige      10468.67k    12165.24k    12628.24k    12743.72k    12331.69k
    aes-256 ige       9505.78k    10831.25k    11205.36k    11333.43k    10982.74k
    ghash            15681.70k    17279.32k    17770.84k    17894.06k    17940.48k
                      sign    verify    sign/s verify/s
    rsa  512 bits 0.002185s 0.000217s    457.6   4611.1
    rsa 1024 bits 0.011325s 0.000640s     88.3   1563.5
    rsa 2048 bits 0.074296s 0.002289s     13.5    436.8
    rsa 4096 bits 0.544211s 0.008741s      1.8    114.4
                      sign    verify    sign/s verify/s
    dsa  512 bits 0.002157s 0.002262s    463.5    442.0
    dsa 1024 bits 0.006234s 0.007123s    160.4    140.4
    dsa 2048 bits 0.022247s 0.025884s     44.9     38.6

# GPU

The Raspberry Pi appears to handle H.264 1080p movie from USB to HDMI at
least 4 MB/s.

The Admin "JamesH" said it would handle "basically 1080p30, high
profile, \>40 Mbit/s." (5 MB/s) in H.264.

And about WVGA(480p30) or 720p20 in VP8/WEBM.

## ioquake3

### Source

    https://github.com/raspberrypi/quake3

### Compile/Run

    - Download source, compile as delivered
    - Start game
    - Runs at display's native resolution, in my case 1280x1024
    - Bitdepth stuck at 16 bpp, not sure how to change, values in q3config.cfg seem to be ignored
    - In-game console commands:
    \timedemo 1
    \demo four

### Results

    armel "driver info" : http://i.imgur.com/wtYhB.jpg
    armel timedemo score: http://i.imgur.com/i2TkN.jpg
    20.2fps

    armhf "driver info" : http://i.imgur.com/8nqa1.jpg
    armhf timedemo score: http://i.imgur.com/dUu0g.jpg
    28.5fps

# I/O

## USB bus

-   All I/O uses the same bus so the combination of all I/O can not
    exceed the bus speed of an as yet hypothetical 60 MB/s
-   A test with a fast USB-Stick showed that Raspberry Pi can achieve
    about 30 MB/s:

<!-- -->

    root@raspberrypi:~# dd if=/dev/sda of=/dev/null bs=32M count=10 iflag=direct
    10+0 records in
    10+0 records out
    335544320 bytes (336 MB) copied, 10.6428 s, 31.5 MB/s

## SD card

This section has been moved to
[RPi\_SD\_cards\#Performance](http://eLinux.org/RPi_SD_cards#Performance "RPi SD cards")

## NIC

### Compile/Run

On LAN server:

    iperf -s

On Raspberry Pi:

    iperf -t 60 -c <SERVER_IP_ADDRESS> -d

### Results

<table>
<thead>
<tr class="header">
<th align="left">Bandwidth (Mbit/s)</th>
<th align="left">CPU usage (top)</th>
<th align="left">Distro</th>
<th align="left">Kernel</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">52.1 + 46.4</td>
<td align="left">5.1%us, 66.2%sy, 28.7%si</td>
<td align="left">Debian Squeeze &quot;debian6-19-04-2012&quot;</td>
<td align="left">Linux Raspberry Pi 3.1.9+ #95 PREEMPT</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">91.8 + 36.8</td>
<td align="left">1.6%us, 60.8%sy, 37.5%si</td>
<td align="left">Debian Wheezy &quot;Raspbian&quot;</td>
<td align="left">Linux Raspbian 3.1.9+ #101 PREEMPT</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">65.1 + 48.8</td>
<td align="left">1.3%us, 61.9%sy, 36.8%si</td>
<td align="left">Arch Linux 2012-04-29</td>
<td align="left">Linux alarmpi 3.1.9-12+ #5 Sat Apr 28 04:49:38 UTC 2012 armv6l ARMv6-compatible processor rev 7 (v6l) BCM2708 GNU/Linux</td>
<td align="left">Remote host connected at gigabit</td>
</tr>
<tr class="even">
<td align="left">69.5 + 29.1</td>
<td align="left">0.6%us, 55.5%sy, 40.0%si</td>
<td align="left">Debian Wheezy &quot;Raspbian&quot;</td>
<td align="left">Linux rpi 3.1.9+ #168 PREEMPT</td>
<td align="left">Remote connected at gigabit, values for si between 30 and 55 %</td>
</tr>
<tr class="odd">
<td align="left">90.8 + 91.4</td>
<td align="left">0.3%us, 62.2%sy, 37.5%si</td>
<td align="left">Gentoo Linux ARM</td>
<td align="left">Linux genpi 3.2.23-bootc #1</td>
<td align="left">Remote host connected at gigabit, vm.min_free_kbytes = 4096</td>
</tr>
</tbody>
</table>



## Routing

### Methodology

-   OpenBSD 5.2 computer with two VLAN interfaces in differents rdomains
    directly connected to Raspberry Pi with two VLAN interfaces.
-   iperf -s on one interface of the OpenBSD, iperf -t 300 -c on the
    other, Raspberry Pi routing in the middle.
-   iperf v2.0.5.
-   System load on the Raspberry Pi after 150 seconds testing.

### Results

<table>
<thead>
<tr class="header">
<th align="left">Bandwidth (Mbit/s)</th>
<th align="left">CPU usage (top)</th>
<th align="left">Distro</th>
<th align="left">Kernel</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">50.2 Mbit/s</td>
<td align="left">0.0%us, 0.1%sy, 99.8%si</td>
<td align="left">Debian Wheezy &quot;Raspbian&quot;</td>
<td align="left">Linux Raspberry Pi 3.6.11+ #366 PREEMPT</td>
<td align="left">Stock clock</td>
</tr>
<tr class="even">
<td align="left">85.5 Mbit/s</td>
<td align="left">0.0%us, 2.8%sy, 69.7%si</td>
<td align="left">Debian Wheezy &quot;Raspbian&quot;</td>
<td align="left">Linux Raspberry Pi 3.6.11+ #366 PREEMPT</td>
<td align="left">Overclocked via raspi_config &quot;turbo&quot;</td>
</tr>
<tr class="odd">
<td align="left">87.1 Mbit/s</td>
<td align="left">4.3%us, 4.3%sy, 52.1%si</td>
<td align="left">Debian Wheezy &quot;Raspbian&quot;</td>
<td align="left">Linux Raspberry Pi 3.6.11+ #366 PREEMPT</td>
<td align="left">Overclocked arm_freq 1100 core_freq 500 sdram_freq 600 over_voltage 6</td>
</tr>
<tr class="even">
<td align="left">62.1 Mbit/s</td>
<td align="left">0.0%us, 0.1%sy, 99.2%si</td>
<td align="left">Debian Wheezy &quot;Raspbian&quot;</td>
<td align="left">Linux Raspberry Pi 3.6.11+ #366 PREEMPT</td>
<td align="left">Overclocked arm_freq 1100 core_freq 500 sdram_freq 600 over_voltage 6 - SNAT enabled</td>
</tr>
</tbody>
</table>

# Power

This table lists how much power is drawn over the 5V power cable whilst
performing various tasks.

<table>
<thead>
<tr class="header">
<th align="left">Task</th>
<th align="left">Power use (mA)</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Booting (without peripherals)</td>
<td align="left">120-400</td>
<td align="left">Taken from Agilent lab power supply readings. No composite/keyboard/mouse/network connected. HDMI was enabled but the cable was disconnected.</td>
</tr>
<tr class="even">
<td align="left">Idling (HDMI on, network on)</td>
<td align="left">370</td>
<td align="left">Taken from Agilent lab power supply readings. No composite/keyboard/mouse connected.</td>
</tr>
<tr class="odd">
<td align="left">Idling (HDMI on, network off)</td>
<td align="left">320</td>
<td align="left">Taken from Agilent lab power supply readings. No composite/keyboard/mouse/network connected.</td>
</tr>
<tr class="even">
<td align="left">1080p video playback</td>
<td align="left">750</td>
<td align="left">About 3h on 4 AA batteries</td>
</tr>
<tr class="odd">
<td align="left">Text editing</td>
<td align="left">-</td>
<td align="left">Same as idling</td>
</tr>
<tr class="even">
<td align="left">Compiling C code (QuakeIII)</td>
<td align="left">364</td>
<td align="left">Measured with a Fluke 87V multimeter. No composite, keyboard, mouse, or network connected. HDMI was connected. Current peaked at 418mA.</td>
</tr>
<tr class="odd">
<td align="left">Running a Python program</td>
<td align="left"> ?</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">Playing Quake III</td>
<td align="left">461</td>
<td align="left">Measured with a Fluke 87V multimeter. No composite or network connected. HDMI was connected. Current peaks at 551mA.</td>
</tr>
</tbody>
</table>

# References



-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

[Raspberry Pi](http://eLinux.org/R-Pi_Hub "R-Pi Hub")

**Startup**

[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - [SD Card
Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") - [Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") - [Advanced
Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") - [Beginners
Guide](http://eLinux.org/RPi_Beginners "RPi Beginners") -
[Troubleshooting](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting")

[![RpiFront.jpg](http://eLinux.org/images/thumb/9/96/RpiFront.jpg/167px-RpiFront.jpg)](http://eLinux.org/File:RpiFront.jpg)

**Hardware**

[Hardware](http://eLinux.org/RPi_Hardware "RPi Hardware") - [Hardware
History](http://eLinux.org/RPi_HardwareHistory "RPi HardwareHistory") - [Low-level
peripherals](http://eLinux.org/RPi_Low-level_peripherals "RPi Low-level peripherals") -
[Expansion Boards](http://eLinux.org/RPi_Expansion_Boards "RPi Expansion Boards")

**Peripherals**

[Screens](http://eLinux.org/RPi_Screens "RPi Screens") - [Cases](http://eLinux.org/RPi_Cases "RPi Cases")
- [Other Peripherals (Keyboard, mouse, hub,
wifi...)](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals")

**Software**

[Software](http://eLinux.org/RPi_Software "RPi Software") -
[Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") -
[Kernel](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation") -
**Performance** - [Programming](http://eLinux.org/RPi_Programming "RPi Programming") -
[VideoCore APIs](http://eLinux.org/RPi_VideoCore_APIs "RPi VideoCore APIs") -
[Utilities](http://eLinux.org/RPi_Utilities "RPi Utilities")

**Projects**

[Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") -
[Guides](http://eLinux.org/RPi_Guides "RPi Guides") -
[Projects](http://eLinux.org/RPi_Projects "RPi Projects") -
[Tasks](http://eLinux.org/RPi_Tasks "RPi Tasks") -
[DataSheets](http://eLinux.org/RPi_DatasheetCategories "RPi DatasheetCategories") -
[Education](http://eLinux.org/RPi_Education "RPi Education") -
[Communities](http://eLinux.org/RPi_Community "RPi Community")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")

