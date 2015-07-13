> From: [eLinux.org](http://eLinux.org/Preset_LPJ "http://eLinux.org/Preset_LPJ")


# Preset LPJ



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 LKML Discussion](#lkml-discussion)
    -   [1.2 Rationale](#rationale)
    -   [1.3 Specification](#specification)
-   [2 Downloads](#downloads)
    -   [2.1 Patch](#patch)
-   [3 How To Use](#how-to-use)
-   [4 Sample Results](#sample-results)
    -   [4.1 case 1\*2.6.7 with patch](#case-1-2a2.6-7-with-patch)
    -   [4.2 case 2](#case-2)
    -   [4.3 case 3](#case-3)
    -   [4.4 case 4](#case-4)
    -   [4.5 case 5\*2.6.8-rc1-mm1](#case-5-2a2.6-8-rc1-mm1)
    -   [4.6 case 6](#case-6)
-   [5 Future Work](#future-work)
-   [6 Testing](#testing)

## Introduction

"Preset LPJ" is a feature to avoid the cost associated with calibrating
loops\_per\_jiffy at each boot time.

The value of loops\_per\_jiffy (LPJ) is normally calculated in the
routine calibrate\_delay() early in the initialization sequence of the
Linux kernel. The cost of doing this operation is independent of the CPU
frequency and is about 250 milliseconds on most hardware. The value of
LPJ should be the same for the same hardware operating at the same clock
frequency. Thus LPJ can be calculated once and used for subsequent
boots, and the cost to do the delay calibration can be avoided.

Basically, the patch allows you to specify a preset value for
loops\_per\_jiffy at kernel compile time, or on the command line at
kernel boot time.

### LKML Discussion

The CELF patch was submitted to LKML on July 10, and was discussed
[here](http://groups.google.com/groups?hl==en&lr==&ie==UTF-8&threadm==2g9er-88a-15%40gated-at.bofh.it&rnum==1&prev==/groups%3Fq%3Dpreset%2Blpj%26hl%3Den%26lr%3D%26ie%3DUTF-8%26selm%3D2g9er-88a-15%2540gated-at.bofh.it%26rnum%3D1)

### Rationale

This saves about 250 milliseconds on a 2.4-based Linux system. The
duration of the calibration does not depend on the speed of the
processor, but on the value of HZ for a particular architecture, and the
number of iterations required to perform the calibration. For a 2.6
version of Linux, HZ is now defined as 1000 for the i386 platform
(meaning a HZ duration is 1 millisecond rather than 10 milliseconds as
it was for most architectures in the 2.4 version of the Linux kernel).
Thus, for i386, the savings is now only about 25 milliseconds. However,
many architectures still use a HZ value of 100, so for these
architectures this change is still important.

### Specification

The forum has written a specification for this feature. It is available
at: [Calibrate Delay Avoidance Specification R2]. The specification page
has more details about the operation of calibrate\_delay() and the need
for this feature.

## Downloads

[![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif) A version of
this feature is now included in official (Linus' tree) Linux version
2.6.9-rc2.

-   Note that this version does away with the kernel configuration
    option, and only allows preseting lpj from the kernel command line.

### Patch

-   No patch, no configuration settings needed for kernel's later than
    2.6.9-rc2.
-   Patch for 2.6.7 is on the [Patch
    Archive](../../../../.././dev_portals/Boot_Time/Printk_Times/Patch_Archive/Preset_LPJ/Patch_Archive/Patch_Archive.md "Patch Archive") page
-   Patch for CELF version 040304 is here: attachment:preset-lpj-1.patch

## How To Use

Boot your kernel

-   Measure boot time
-   In kernel boot messages, read loops\_per\_jiffy value measured by
    your kernel. Example: Calibrating delay loop... 187.59 BogoMIPS
    (lpj==937984)
-   If you see no such message in the console, view the /proc/kmsg file
    or boot your kernel with the "loglevel==8" parameter.

For kernels older than 2.6.9-rc2

-   Apply this patch to your CELF kernel
-   Configure your kernel with the feature turned on:

<!-- -->

     **Turn on "Fast boot options"
     **Turn on "Use preset loops_per_jiffy"

-   Recompile your kernel

Reboot your kernel

-   Provide a preset value for loops\_per\_jiffy at the kernel command
    line using the string "lpj==\<value\>", where \<value\> is replaced
    with the correct value for loops\_per\_jiffy for your platform.
-   Measure the new boot time and compare with the original one
-   Notice the new message: Calibrating delay loop (skipped)... 187.59
    BogoMIPS preset

## Sample Results

### case 1\*2.6.7 with patch

Tim Bird (of Sony) measured the result of using preset lpj on his x86
desktop system. It saved 268 milliseconds of bootup time.

Details:

-   Kernel version: CELF Linux kernel (2.4.20-based)
-   CPU: Pentium 4 running at 3 GHz

### case 2

Richard Griffiths (of Intel) measured the result of using preset lpj on
an x86 system. It saved about the same (\~268 milliseconds) of bootup
time.

Details:

-   Kernel version: CELF Linux kernel (2.4.20-based)
-   CPU: Celeron running at 1 GHz

### case 3

Noboru Wakabayashi (of Hitachi) measured the result of using preset lpj
on a TI OMAP (ARM-based) system. It saved about 212 milliseconds.

-   Kernel version: CELF Linux kernel (2.4.20-based)
-   CPU: OMAP 1510 running at 168 MHz

### case 4

Tim Bird measured use of preset-lpj on an x86 desktop system with the
2.6.6 kernel. It saved 25 milliseconds.

Details:

-   Kernel version: Linux (kernel.org) 2.6.6 with preset-lpj patch
    applied
-   CPU: Pentium 4 running at 3 GHz

### case 5\*2.6.8-rc1-mm1

With the new patch, Tim Bird got the following results:

-   Kernel version: Linux (kernel.org) 2.6.8-rc1-mm1
-   CPU: Pentium 4 running at 3 GHz
-   With HZ==1000:

<!-- -->

      **normal boot: calibrate_delay() took 23 milliseconds
      **specifying lpj==xxx: calibrate_delay() took 43 microseconds.

-   With HZ==100:

<!-- -->

      **normal boot: calibrate_delay() took 264 milliseconds
      **specifying lpj==xxx: calibrate_delay() took 43 microseconds.

### case 6

Jyunji Kondo (of Fujitsu Prime Software Technologies) measured the
result of using preset lpj on FR-V processor. It saved about 205
milliseconds.

Details:

-   Kernel version: 2.6.6
-   CPU: FR-V FR450 core running at 360 MHz

Please also refer to the graphic chart in [DMA Copy Of Kernel On
Startup](../../../../.././dev_portals/Boot_Time/DMA_Copy_Of_Kernel_On_Startup/DMA_Copy_Of_Kernel_On_Startup.md "DMA Copy Of Kernel On Startup").

## Future Work

Here is a list of things that need to be done with this patch:

-   possibly provide lpj validation feature, mentioned by specification

## Testing

Testing performed for 2.6.7\*for preset-lpj-5.patch (after LKML
discussion)

-   see if patch applies cleanly to 2.6.7
    -   OK
-   see if patch applies cleanly to 2.6.7-mm7
    -   (preset-lpj-04.06.25.patch applied cleanly, but with offsets for
        all hunks)
-   see if patch applies cleanly to 2.6.7-bk20
    -   (preset-lpj-04.06.25.patch applied cleanly, but with offsets for
        all hunks)
-   see if build succeeds on 2.6.7
    -   OK
-   runtime tests:
    -   run with PRESET\_LPJ set to 0 (default)
        -   result should be: (everything normal)
        -   should print lpj value that is used
    -   run with PRESET\_LPJ set to 0, with lpj==xxx command line
        -   should skip calibration, but print BogoMips anyway
        -   should NOT?? print lpj value that can be used??
    -   run with PRESET\_LPJ option set to yyy in config
        -   should skip calibration
        -   should NOT print lpj value that can be used
    -   run with PRESET\_LPJ option set to yyy in config, with lpj==xxx
        command line
        -   should skip calibration, and use xxx rather than yyy
        -   should NOT print lpj value that can be used
    -   run with PRESET\_LPJ option set to yyy in config, with lpj==0
        command line
        -   should perform calibration
        -   should print lpj value that is used


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

