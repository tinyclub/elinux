> From: [eLinux.org](http://eLinux.org/Qualcomm_SOC_Mainlining_Project "http://eLinux.org/Qualcomm_SOC_Mainlining_Project")


# Qualcomm SOC Mainlining Project



Here is some information about the Qualcomm SOC mainlining project.

[ this page is currently a stub ]

## Contents

-   [1 Project List](#project-list)
-   [2 Project Table](#project-table)
-   [3 Specific Hardware](#specific-hardware)
    -   [3.1 IP blocks on the 8974](#ip-blocks-on-the-8974)
        -   [3.1.1 Features](#features)
        -   [3.1.2 Dependencies](#dependencies)
-   [4 Resources](#resources)
    -   [4.1 mailing list](#mailing-list)
    -   [4.2 IRC channel](#irc-channel)
    -   [4.3 git trees](#git-trees)
    -   [4.4 Other resources](#other-resources)
-   [5 Stakeholders](#stakeholders)
    -   [5.1 Table of phones, processors and download
        sites](#table-of-phones-processors-and-download-sites)
-   [6 Status](#status)

## Project List

List of items that need to be mainlined, or are "in flight" (as of June,
2014):

-   regulators - Josh Cartwright?, Bjorn Andersson?
-   clocks - Stephen Boyd
-   RPM
-   SD Card Controller - Srinivas Kandagatla
-   8084 clock controller - Georgi Djakov
-   dma engine - Andy Gross
-   SOC-specific
    -   8084
    -   8974
-   SOC DT file? - Kumar Gala?
-   USB support
    -   USB host mode for HS port - Tim Bird
    -   dwc3 (superspeed) USB driver
-   spmi - ??

## Project Table

This might be too time-consuming to maintain?

<table>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<tbody>
<tr class="odd">
<td align="left"><strong>Feature or Item</strong></td>
<td align="left"><strong>Person</strong></td>
<td align="left"><strong>Notes</strong></td>
<td align="left"><strong>Link</strong></td>
<td align="left"><strong>Last activity</strong></td>
</tr>
<tr class="even">
<td align="left">USB - msm_otg host mode</td>
<td align="left">Tim Bird</td>
<td align="left">I'm currently working on the pmic_id_irq, which require spmi support.
<p>I got stuck on the DT EPROBE_DEFER support issue.</p></td>
<td align="left">&lt;no links yet&gt;</td>
<td align="left">none yet</td>
</tr>
<tr class="odd">
<td align="left">SD card controller</td>
<td align="left">Srinivas Kandagatla</td>
<td align="left">This patch series adds Qualcomm SD Card Controller support in pl180 mmci
<p>driver. QCom SDCC is basically a pl180, but bit more customized, some of the register layouts and offsets are different to the ones mentioned in pl180 datasheet. The plan is to totally remove the standalone SDCC driver drivers/mmc/host/msm_sdcc.* and start using generic mmci driver for all Qualcomm parts, as we get chance to test on other Qcom boards.</p></td>
<td align="left"><a href="http://thread.gmane.org/gmane.linux.ports.arm.msm/7706">http://thread.gmane.org/gmane.linux.ports.arm.msm/7706</a>
<p><a href="https://www.mail-archive.com/linux-arm-msm@vger.kernel.org/msg09059.html">https://www.mail-archive.com/linux-arm-msm@vger.kernel.org/msg09059.html</a></p></td>
<td align="left">2014-06-02</td>
</tr>
<tr class="even">
<td align="left">DT stuff for 8084</td>
<td align="left">Georgi Djakov</td>
<td align="left">Adds DT nodes for the APQ8084 global clock controller and serial port.</td>
<td align="left"><a href="https://www.mail-archive.com/linux-arm-msm@vger.kernel.org/msg09096.html">https://www.mail-archive.com/linux-arm-msm@vger.kernel.org/msg09096.html</a></td>
<td align="left">2014-06-03</td>
</tr>
</tbody>
</table>

[ add links to most recently posted patches] [ add person who is working
on each part ]

## Specific Hardware

-   8074
    ([Dragonboard/APQ8074](http://eLinux.org/Dragonboard/APQ8074 "Dragonboard/APQ8074"))
-   8064
    ([Dragonboard/IFC6410](http://eLinux.org/Dragonboard/IFC6410 "Dragonboard/IFC6410"),
    [Dragonboard/SYS6440](http://eLinux.org/index.php?title=Dragonboard/SYS6440&action=edit&redlink=1 "Dragonboard/SYS6440 (page does not exist)"))

### IP blocks on the 8974

-   KRAIT - arm processor - **(DONE)**
-   SAW - SPM AVS wrapper - adaptive wakup, sleep, voltage
    -   AVS - adaptive voltage scaler
    -   SPM - subsystem power manager - **(DONE)**
-   RPM - Resource power manager - regulator voting thingy - **(in
    progress)** - *Bjorn, AGross*
-   PM8941 - power management IC (PMIC) - see sub-parts for status
    -   WLED - **(DONE)** - *Courtney*
    -   PWM - pulse width modulator outputs - **(in progress)** -
        *Courtney*
    -   LPG - (RGB LEDS) - **(in progress)** - *Courtney*
    -   VIB - vibrator drivers
    -   GPIO - **(DONE)**
    -   MPP - **(DONE)**
    -   Charger - **(in progress)** - *Courtney, Bjorn*
    -   IADC - **(DONE)**
    -   BMS - battery monitoring system **(not done)**
    -   PON - power on thingy - **(DONE)**
    -   RTC - realtime clock - **(DONE)**
    -   coincell - **(in progress)** - *Tim*
    -   regulators - **(in progress)** (see RPM) - *Bjorn, AGross*
    -   PMIC clocks - **(not done)**
    -   VADC - **(DONE?)** - *Ivan*
-   PM8841 - analog regulators - **(not done)**
-   MODEM - **(not done)** (but see RemoteProc)
-   TLMM - top level mode manager **(DONE)**
    -   PINCTRL - **(DONE)**
-   QUP - configurable serial blocks
    -   I2C - **(DONE)**
    -   SPI - **(DONE)**
-   BLSP - UART - **(DONE)** **(could use high speed improvements)**
-   SDHCI - SD Card/emmc/EMMC controller - **(DONE - but needs regulator
    for HPM mode)** - *Bjorn*
-   GCC - global clocks - **(DONE)**
-   MMCC - multimedia clocks - **(DONE)**
-   LCC - LPASS (audio) clocks - **(DONE)**
-   LPASS - Audio - **(not done)** - *some 3rd party??*
-   MDP - 2d display stuff - **(DONE)** - *Rob*
-   SATA - **(DONE)**
-   DSP - **(in progress)** - *Bjorn* - (see ??? RemoteProc??) - can
    send audio via slimbus, and handles sensor stuff
-   SPMI - **(DONE)**
-   QGIC - interrupt controller - **(DONE)**
-   MPM - power manager - **(not done)**
-   OCMEM - multimedia memory = **(not done)**
-   USB 2.0 controller - chipidea - **(Done, but needs more)** - *Tim*
-   USB 2.0 PHY - **(DONE, but needs more)** - *Tim* - needs regulator
    support
-   HSIC PHY - **(not done)**
-   USB 3.0 PHY - **(not done)**
-   USB 3.0 controller - dwc3 - **(not done)**
-   slimbus - peripheral bus - **(not done)**
-   MI2S - multi-channel audio - **(not done)** - *Kenneth?*
-   I2S - sound thingy - **(not done)**
-   QCRYPTO - **(DONE)**
-   PRND - random number generator - **(DONE)**
-   RIVA - radio controller - **(Done, but needs major rewrite)**
-   HDMI - **(DONE)**
-   DSI - **(not done)**
-   eDP - display port - **(not done)**
-   VENUS - video codec thingy - **(not done)**
-   VFE - video front end - **(not done)**
-   VPE - video processing engine - **(not done)**
-   CSI - camera high speed serial interface (mipi spec) - **(not
    done)**
-   CCI - camera i2c interface (mipi spec) - **(not done)**
-   TCSR - **(not done)**
    -   hardware mutex - hwspinlock - **(DONE)**
        -   hwspinlock DT support - **(DONE)**
    -   halt control
-   QFPROM - fuses - **(not done)**
-   BAM - dma stuff - **(DONE - but missing utilization by individual
    drivers)**
-   TSENSE - thermal sensing - **(in progress)**

#### Features

Here is a list of features (related to IP blocks) for an 8974 processor:

-   charger (see charger IP block) - *Courtney*
-   regulators (depends on RPM) - *Bjorn*
-   remoteproc-tz - loading firmware through trustzone
-   USB 2.0 gadget - **(DONE - but needs regulators)** - *Tim*
-   USB 2.0 host - **(not done)**
-   USB 2.0 OTG - **(in progress)** - *Tim*
-   SMEM - provides an inter-processor heap - **(in progress)** -
    *Bjorn*
-   SMD - inter-processor ring buffers - **(in-progress)** - *Bjorn*
-   SMP2P - interprocessor state signaling - **(in progress)** - *Bjorn*
-   SMSM - interprocessor state signaling - **(in progress)** - *Bjorn*
-   Bluetooth
-   FM radio
-   WiFi - wcn36xx - **(in progress)** - *Bjorn*
-   MHL
-   NFC
-   Vibrator
-   Audio Codec
-   IRDA
-   irq\_read\_line - **(DONE)**
-   ipcrouter - **(in progress)** - *Courtney*

#### Dependencies

Dependencies: '-\>' = "depends on"

-   Regulators -\> RPM -\> SMD -\> SMEM -\> tcsr-mutex
-   SMP2P -\> SMEM
-   SMSM -\> SMEM
-   SMD -\> SMEM -\> tcsr-mutex
-   DSI -\> regulators -\> RPM -\> SMD -\> SMEM -\> tcsr-mutex
-   USB 2.0 controller -\> charger PMIC ID -\> irq\_read\_line
-   USB 2.0 phy -\> regulators -\> RPM -\> SMD -\> SMEM -\> tcsr-mutex
-   USB 2.0 controller -\> charger OTG switch -\> charger
-   charger -\> irq\_read\_line

## Resources

### mailing list

-   Web site:
    [http://vger.kernel.org/vger-lists.html\#linux-arm-msm](http://vger.kernel.org/vger-lists.html#linux-arm-msm)
    -   subscribe or unsubscribe via e-mail, by following links on the
        above page
-   Archives
    -   mail-archive.com:
        [https://www.mail-archive.com/linux-arm-msm@vger.kernel.org/](https://www.mail-archive.com/linux-arm-msm@vger.kernel.org/)
    -   gmain:
        [http://dir.gmane.org/gmane.linux.ports.arm.msm](http://dir.gmane.org/gmane.linux.ports.arm.msm)

### IRC channel

-   Server: freenode (chat.freenode.net)
-   Channel \#\#linux-msm
-   Link: [http://webchat.freenode.net/](http://webchat.freenode.net/)

You can access the IRC channel from inside a corporate firewall using
the web interface.

### git trees

-   git trees:
    -   Sony github integration ("next") tree:
        [https://github.com/andersson/kernel/tree/next](https://github.com/andersson/kernel/tree/next)
        -   Sony maintains this tree by keeping patch sets for
            individual technology areas or features in separate git
            branches. We have an internal tool called 'splash', that is
            used to integrate the separate branches into a single
            integration branch (the "next" branch). This tool is
            available upon request, if you want to use the same workflow
            as Sony.
    -   Code Aurora git trees:
        [https://www.codeaurora.org/cgit/quic/kernel](https://www.codeaurora.org/cgit/quic/kernel)
    -   Linaro Qualcomm integration tree:
        [https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/shortlog/refs/heads/integration-linux-qcomlt](https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/shortlog/refs/heads/integration-linux-qcomlt)

### Other resources

-   Linaro patch queue for msm (??):
    [https://patches.linaro.org/project/linux-arm-msm/](https://patches.linaro.org/project/linux-arm-msm/)
-   Linaro mainline patch queue:
    [https://patches.linaro.org/team/linaro-landing-team-qualcomm/](https://patches.linaro.org/team/linaro-landing-team-qualcomm/)

## Stakeholders

This is a list of parties who are (or should be) interested in the
progress of this work:

-   Qualcomm
-   Code Aurora Forum
-   Linaro
-   Qualcomm Innovation Center
-   Sony
-   Samsung
-   LG
-   HTC
-   Lenovo/Motorola
-   Xiaomi

### Table of phones, processors and download sites

For links to different download sites, see [Phones Processors and
Download
Sites](http://eLinux.org/Phones_Processors_and_Download_Sites "Phones Processors and Download Sites")

## Status

[Figure out a metric for what remains to be done]

-   brainstorming ideas for metric to measure:
    -   \# of features out of tree (should be going down)
    -   size of diff between latest msm tree and server it was based on?
        (should be going down)
    -   linaro uses patch queue length (outstanding vs. already
        mainlined)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Snapdragon](http://eLinux.org/Category:Snapdragon "Category:Snapdragon")

