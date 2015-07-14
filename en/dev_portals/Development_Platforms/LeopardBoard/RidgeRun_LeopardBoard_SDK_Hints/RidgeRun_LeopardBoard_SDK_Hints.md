> From: [eLinux.org](http://eLinux.org/RidgeRun_LeopardBoard_SDK_Hints "http://eLinux.org/RidgeRun_LeopardBoard_SDK_Hints")


# RidgeRun LeopardBoard SDK Hints



## Contents

-   [1 Solutions to known issues](#solutions-to-known-issues)
    -   [1.1 'division by zero' in kernel error when I try to use ALSA
        input](#-division-by-zero-in-kernel-error-when-i-try-to-use-alsa-input)
    -   [1.2 'Kernel panic' Unable to mount root fs when using
        NFS](#-kernel-panic-unable-to-mount-root-fs-when-using-nfs)
    -   [1.3 'Leopard Board got bricked ' BOOTUBLStarting UART
        Boot...](#-leopard-board-got-bricked-bootublstarting-uart-boot)
    -   [1.4 'NAND read: 'FS' is not a number' UBOOT,KERNEL,FS are not
        set](#-nand-read-fs-is-not-a-number-uboot-kernel-fs-are-not-set)
    -   [1.5 'xdctools and dvsdk directories not
        found'](#-xdctools-and-dvsdk-directories-not-found)
    -   [1.6 'Error building
        gst-dmai-plugins'](#-error-building-gst-dmai-plugins)
    -   [1.7 'mono (mono-common) is NOT
        installed'](#-mono-mono-common-is-not-installed)
    -   [1.8 CMEMK errors when capturing
        video](#cmemk-errors-when-capturing-video)
-   [2 Integrating the audio codecs on RR
    SDK](#integrating-the-audio-codecs-on-rr-sdk)
    -   [2.1 RidgeRun Integration and Testing
        Status](#ridgerun-integration-and-testing-status)
    -   [2.2 Integrating the audio codecs into the
        SDK](#integrating-the-audio-codecs-into-the-sdk)
    -   [2.3 Disable audio codecs in the
        SDK](#disable-audio-codecs-in-the-sdk)

## Solutions to known issues

### 'division by zero' in kernel error when I try to use ALSA input

This is a known issue that has been discussed on the ASOC mailing list.
The problem is that the function davinci\_pcm\_enqueue\_dma performs
this operations:

    data_type = prtd->params->data_type;
    count = period_size / data_type;

The first time, data\_type is set to zero, so we get the error Division
by zero in kernel. This is the reason why the pipe arecord | aplay works
after running arecord or aplay first.

Apply the
[Media:Asoc-davinci-pcm.patch](http://eLinux.org/images/9/95/Asoc-davinci-pcm.patch "Asoc-davinci-pcm.patch")
to the kernel 2.6.29 to resolve this issue.

### 'Kernel panic' Unable to mount root fs when using NFS

This issue happens when NFS file system is used. Leopard Board does not
have a MAC address assign, this issue can be detected by taking a look
into the kernel log after booting the board:

1. MAC address is set to 00:00:00:00:00

    [42949373.950000] dm9000 Ethernet Driver, V1.31
    [42949374.080000] dm9000 dm9000: eth%d: Invalid ethernet MAC address. Please seg
    [42949374.080000] eth0 (dm9000): not using net_device_ops yet
    [42949374.090000] eth0: dm9000e at c780c000,c7810016 IRQ 73 MAC: 00:00:00:00:00)

2. Kernel panic error

    [42949465.940000] Kernel panic - not syncing: VFS: Unable to mount root fs on u)

There are different ways of solving this issue:

1. Forced the leopard to get a MAC address: run the ping command in the
u-boot console:

    Leopard Board # ping <ip_address>   or
    Leopard Board # setenv bootcmd="ping 192.168.1.1;nboot KERNEL"

2. Apply the
[Media:mac\_address.patch](http://eLinux.org/images/e/ed/Mac_address.patch "Mac address.patch")
that generates a random MAC address for the leopard.



### 'Leopard Board got bricked ' BOOTUBLStarting UART Boot...

Whenever UBL or the Uboot on a Leopard Board fail, this means that your
board got bricked, however, there's an easy way to recover it. For
information on how to recover your leopard, go to: [How to recover a
bricked Leopard
Board](http://designsomething.org/leopardboard/f/22/t/97.aspx)

### 'NAND read: 'FS' is not a number' UBOOT,KERNEL,FS are not set

This issue causes your board to do not boot, causing the following
message:

    NAND read: 'FS' is not a number

    NAND read: 'KERNEL' is not a number
    ## Booting image at 82000000 ...
    Bad Magic Number

The problem is that "make install" was ran over the uboot that comes
preinstalled on the Leopard Board. This uboot doesn't support the MTD
partitions causing the above messages. To solve this issue:

1. Run "make installbootloader": this will upgrade your board with the
uboot that comes with the SDK

2. Reboot your board

3. Run "make install"

If the problem persists, your board probably got bricked, refer to: [How
to recover a bricked Leopard
Board](http://designsomething.org/leopardboard/f/22/t/97.aspx)

### 'xdctools and dvsdk directories not found'

The SDK requires several tools provided by TI, which you should have
installed on your host machine.

If the following error appears, you should download
[xdctools\_setuplinux\_3\_10\_05\_61.bin](http://software-dl.ti.com/dsps/dsps_registered_sw/sdo_sb/targetcontent/rtsc/xdctools_3_10/xdctools_3_10_05_61/index_external.html)

    Please provide the path to xdctools_3_10_05_61 installation location or press ctrl-c to abort

    Unable to find the directory . Aborting
    make[1]: *** [xdctools_3_10_05_61] Error 1
    make[1]: Leaving directory `<home_directory>/DM355SDK789311/proprietary/xdctools_3_10_05'
    Error building xdctools_3_10_05
    make: *** [dependency_build] Error 1

Also, if the following error appears, you should download
[dvsdk\_setuplinux\_2\_00\_00\_22.bin](https://focus-webapps.ti.com/licreg/productdownload.tsp?toPerform=productDownload&downloadPage=true&location=http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_2_00/latest//exports//dvsdk_setuplinux_2_00_00_22.bin)

    Please provide the path to dvsdk_2_00_00_22 installation location or press ctrl-c to abort

    Unable to find the file /.dvsdk_version. Aborting
    make[1]: *** [dvsdk_2_00_00_22] Error 1
    make[1]: Leaving directory `<home_directory>/DM355SDK789311/proprietary/dvsdk_2_00_00'
    Error building dvsdk_2_00_00
    make: *** [dependency_build] Error 1

Both packages should be install in your home directory for the SDK to
find them automatically, if you do install these tools in another path,
you can provide the correct path when the SDK requests it or create a
dynamic link from that path to your home directory.

### 'Error building gst-dmai-plugins'

If you are having the following error when building gst-dmai-plugins:

    js: "/home/jim/DM355SDK789311/proprietary/xdctools_3_10_05/
    xdctools_3_10_05_61/packages/xdc/xdc.tci", line 461:
    xdc.services.global.XDCException: xdc.MODULE_NOT_FOUND: xdc.module:
    module name '-p' must be qualified with its package name
       "./config.bld", line 5
    gmake: *** No rule to make target `.configuro'.  Stop.
    js: "/home/jim/DM355SDK789311/proprietary/xdctools_3_10_05/
    xdctools_3_10_05_61/packages/xdc/tools/Cmdr.xs", line 40: Error:
    xdc.tools.configuro: configuration failed due to earlier errors
    (status = 2); 'linker.cmd' deleted.

You might have a corrupted file system on your host machine.

-   Run 'make clean' in \~/DM355SDK789311\$
-   Check for any messages about corrupted files in the log, if found,
    fix the corresponding issue.
-   Run 'make clean' again
-   Compile again the SDK: 'make'

### 'mono (mono-common) is NOT installed'

It is a known issue with the old SDK:
LeopardSDK-781811-Linux-x86-Install.bin. The issue basically consists on
the package mono-common not installed, and then mono-gmcs, when they
both are already installed in the host machine.

     >> mono (mono-common) is NOT installed
       gmcs (mono-gmcs) is installed
    There are missing packages, please install them:
     apt-get install mono-common
    make: *** [.oscheck] Error 1

One workaround to get pass this issue, once you have both packages
installed, is to remove gmcs from:

    bsp/arch/host.required

or you can also create a symbolic link to the gmcs2 with name gmcs

    sudo ln -s /usr/bin/gmcs /usr/bin/gmcs2

### CMEMK errors when capturing video

This is not a non fatal error found in the SDK when video is captured
using the VGA.


    Execution ended after 13373478335 ns.
    Setting pipeline to PAUSED ...
    Setting pipeline to READY ...
    Setting pipeline to NULL ...
    [42949461.220000] CMEMK Error: FREE: Not a registered user of physical buffer 0x87b14000
    [42949461.230000] CMEMK Error: FREE: Not a registered user of physical buffer 0x874d8000
    CMEM Error: free[42949461.240000] CMEMK Error: FREE: Not a registered user of physical buffer 0x874d3000
    : failed to free[42949461.250000] CMEMK Error: FREE: Not a registered user of physical buffer 0x87c8a000
     0x41c1c000
    CME[42949461.260000] CMEMK Error: FREE: Not a registered user of physical buffer 0x874d2000
    M Error: free: f[42949461.270000] CMEMK Error: FREE: Not a registered user of physical buffer 0x874d1000
    ailed to free 0x[42949461.280000] CMEMK Error: FREE: Not a registered user of physical buffer 0x874ec000
    41997000
    CMEM E[42949461.290000] CMEMK Error: FREE: Not a registered user of physical buffer 0x87507000
    rror: free: failed to free 0x419ab000
    CMEM Error: free: failed to free 0x419ac000
    CMEM Error: free: failed to free 0x41b22000
    CMEM Error: free: failed to free 0x41b23000



In order to correct this issue, the patch
[Media:Update-cmem.patch](http://eLinux.org/images/3/3f/Update-cmem.patch "Update-cmem.patch")
should be applied in DM355SDK789311/proprietary/dvsdk\_2\_00\_00.

## Integrating the audio codecs on RR SDK

**Important:** The audio codecs are still been tested. Their
functionality needs to be improved, there for many changes are required.

### RidgeRun Integration and Testing Status

<table>
<thead>
<tr class="header">
<th align="left">Codec</th>
<th align="left">Example Verified</th>
<th align="left">GStreamer Integration Complete</th>
<th align="left">GStreamer Integration Verified</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">G.711 encode</td>
<td align="left">Not tested</td>
<td align="left">Not integrated</td>
<td align="left">Not verified</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">G.711 decode</td>
<td align="left">Not tested</td>
<td align="left">Not integrated</td>
<td align="left">Not verified</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">MP3 encode</td>
<td align="left">Complete</td>
<td align="left">Complete</td>
<td align="left">Complete</td>
<td align="left">A</td>
</tr>
<tr class="even">
<td align="left">MP3 decode</td>
<td align="left">Complete</td>
<td align="left">Complete</td>
<td align="left">Complete</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">WMA encode</td>
<td align="left">Example fails.</td>
<td align="left"></td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">WMA decode</td>
<td align="left">No tested.</td>
<td align="left">Not integrated</td>
<td align="left">Not verified</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">AAC encode</td>
<td align="left">Complete</td>
<td align="left">Complete</td>
<td align="left">Complete</td>
<td align="left">A</td>
</tr>
<tr class="even">
<td align="left">AAC decode</td>
<td align="left">Complete</td>
<td align="left">Complete</td>
<td align="left">Complete</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">AEC <br />(acoustic echo cancellation)</td>
<td align="left">Not tested</td>
<td align="left">Not integrated</td>
<td align="left">Not verified</td>
<td align="left"></td>
</tr>
</tbody>
</table>

Notes:

-   A - Can not record from alsa (alsasrc) and encode on the same
    GStreamer pipeline. Can record from alsa (alsasrc) and save to a
    file (in .pcm format).

### Integrating the audio codecs into the SDK

**NOTE:** This is still under construction

-   Select the codecs in the SDK configuration menu

<!-- -->

     1. Run make config
     2. Go to: Proprietary software
     3. Select:
               Texas Instruments CodecEngine for DM355
               Gstreamer DMAI plugins
                  ------> SVN plugins source (Branch)
               Build DM355s Codec configuration instead of standard D355 codecs

-   You need to download the codecs from Texas Instruments page.
    [Download](http://www.go-dsp.com/forms/TIDigitalMediaSWCM/index.htm).
    Once you extract all the files contained in the package:

-   Create a folder name codecs under proprietary.

<!-- -->

    DM355SDK789311/proprietary$ mkdir codecs

-   Copy the folder with the codecs in the SDK directory

<!-- -->

    cp bundle-dm355s-AUDIO1-v1.2/aaclc_enc_2_6_00_production_dm355_mvl/packages-production/ittiam DM355SDK789311/proprietary/codecs -R

Repeat this step for:

    cp bundle-dm355s-AUDIO1-v1.2/mp3_enc_2_8_00_production_dm355_mvl/packages-production/ittiam/ DM355SDK789311/proprietary/codecs -R
    cp bundle-dm355s-AUDIO1-v1.2/mp3_dec_3_6_00_production_dm355_mvl/packages-production/ittiam/ DM355SDK789311/proprietary/codecs -R
    cp bundle-dm355s-AUDIO1-v1.2/aaclc_enc_2_6_00_production_dm355_mvl/packages-production/ittiam/ DM355SDK789311/proprietary/codecs -R
    cp bundle-dm355s-AUDIO1-v1.2/wma_dec_4_6_01_production_dm355_mvl/packages-production/ittiam/ DM355SDK789311/proprietary/codecs -R
    cp bundle-dm355s-AUDIO1-v1.2/wma_enc_2_5_00_production_dm355_mvl/packages-production/ittiam/ DM355SDK789311/proprietary/codecs -R

-   After the last step, the folder
    /DM355SDK789311/proprietary/codecs/ittiam/codecs\$ should look like
    this:

<!-- -->

    aac_dec  aaclc_enc  mp3_dec  mp3_enc  wma_dec  wma_enc

**NOTE:** This is important, because the encoders and decoders are going
to search for the available codecs in this directory.

-   Apply the patch for the codecs to include the parameters definitions
    for the mp3 and aac encoders. This
    [Media:Encoding-parameters.patch](http://eLinux.org/images/9/9f/Encoding-parameters.patch "Encoding-parameters.patch")
    needs to be applied on the directory
    DM355SDK789311/proprietary/codecs.

-   The audio codecs have been tested and are working in Diego Dompe's
    branch, specifically in the revision 496.

<!-- -->

    1. Go to /DM355SDK789311/proprietary/gst-dmai-plugins/
       make clean

    2. Go to /DM355SDK789311/proprietary/gst-dmai-plugins/src/
       svn update -r 496
       autoreconf --install

    3. Apply the Media:Audio_decoders.patch in the directory /DM355SDK789311/proprietary/gst-dmai-plugins/src/src

    4. Compile the plugins.
       Go to /DM355SDK789311/proprietary/gst-dmai-plugins/
       make VERBOSE=1

    5. Install the plugins
       Go to /DM355SDK789311/proprietary/gst-dmai-plugins/
       make install

### Disable audio codecs in the SDK

If you want to disable an specific codec in the SDK, follow the next
steps. This example will remove the aac encoder and decoder.

1. Modify the dm355s.cfg file

    * Go to DM355SDK840402/proprietary/gst-dmai-plugins/src/src$
    * Open the dm355s.cfg file
    * Comment the lines:
          var AAC_DEC = xdc.useModule('ittiam.codecs.aac_dec.ce.AAC_DEC');
          var AACLC_ENC = xdc.useModule('ittiam.codecs.aaclc_enc.ce.AACLC_ENC');
          {name: "aaclcdec", mod: AAC_DEC, local: true, groupId: 1},
          {name: "aaclcenc", mod: AACLC_ENC, local: true, groupId: 1},

2. Modify the configure.ac file

    * Go to DM355SDK840402/proprietary/gst-dmai-plugins/src$
    * Open the configure.ac file
    * Comment the lines:
          #AC_DEFINE([AACLC_ARM_ITTIAM_ENCODER],[1],[Ittiam ARM AACLC Encoder])
          enable_aaclcenc_xdm1=1;
          enable_aaclcdec_xdm1=1;

3. Compile the plugins and install them


    * Go to DM355SDK840402/proprietary/gst-dmai-plugins$
    * make VERBOSE=1
    * make install


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")

