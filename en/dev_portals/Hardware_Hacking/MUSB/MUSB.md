> From: [eLinux.org](http://eLinux.org/MUSB "http://eLinux.org/MUSB")


# MUSB



## Contents

-   [1 MUSBMHDRC DRD OTG Controller](#musbmhdrc-drd-otg-controller)
-   [2 MUSB PENDING PATCHES](#musb-pending-patches)
    -   [2.1 Bug fix patches for v2.6.35](#bug-fix-patches-for-v2-6-35)
        -   [2.1.1 Greg's queue](#greg-s-queue)
        -   [2.1.2 Acked by Felipe](#acked-by-felipe)
        -   [2.1.3 Review in progress](#review-in-progress)
            -   [2.1.3.1 Jon Povey: [1 patch] : Fixing compilation
                warning](#jon-povey-1-patch-:-fixing-compilation-warning)
    -   [2.2 New feature patches for
        v2.6.36](#new-feature-patches-for-v2-6-36)
        -   [2.2.1 Greg's queue](#greg-s-queue-2)
            -   [2.2.1.1 Anand: [1 patch] :
                Cleanup](#anand-1-patch-:-cleanup)
            -   [2.2.1.2 Anand: [1 patch] : on Mentor
                DMA](#anand-1-patch-:-on-mentor-dma)
        -   [2.2.2 Acked by Felipe](#acked-by-felipe-2)
        -   [2.2.3 Review in progress](#review-in-progress-2)
            -   [2.2.3.1 Sergei: [1 patch] : DA8x MUSB
                support](#sergei-1-patch-:-da8x-musb-support)
            -   [2.2.3.2 Ajay: [3 patch] : Set on AM35x MUSB
                support](#ajay-3-patch-:-set-on-am35x-musb-support)
            -   [2.2.3.3 Ajay: [2 patch] : FIFO table and
                cleanup](#ajay-2-patch-:-fifo-table-and-cleanup)
            -   [2.2.3.4 Ajay: [3 patch] : Set on neednop flag for
                NOP](#ajay-3-patch-:-set-on-neednop-flag-for-nop)
            -   [2.2.3.5 Ajay: [6 patch] : Set on SDMA as Mentor DMA
                workarounds](#ajay-6-patch-:-set-on-sdma-as-mentor-dma-workarounds)
            -   [2.2.3.6 Ajay: [1 patch] : On DMA channel release in
                host
                mode](#ajay-1-patch-:-on-dma-channel-release-in-host-mode)
            -   [2.2.3.7 Hema: [2 patch] : on Mentor
                DMA](#hema-2-patch-:-on-mentor-dma)
            -   [2.2.3.8 Hema: [4 patch] : Set on
                HWMODS](#hema-4-patch-:-set-on-hwmods)

# MUSBMHDRC DRD OTG Controller

The MUSBMHDRC DRD OTG Controller (from now on referred to as MUSB is a
Dual-Role OTG IP Core used in several SoC implementations. At the time
of this writing at least OMAP, DaVinci and Blackfins integrate that IP
Core in the SoC and a discrete version of it is supplied by Texas
Instruments as the tusb6010 ASIC.

# MUSB PENDING PATCHES

## Bug fix patches for v2.6.35

### Greg's queue

### Acked by Felipe

    * None

### Review in progress

#### Jon Povey: [1 patch] : Fixing compilation warning

    * USB: musb: suppress warning about unused flags [1]

## New feature patches for v2.6.36

### Greg's queue

#### Anand: [1 patch] : Cleanup

    * musb: Kill board specific pinmux from driver file [2]

#### Anand: [1 patch] : on Mentor DMA

    * usb: musb: do not override DMA mode in channel program [3]

### Acked by Felipe

    * None

### Review in progress

#### Sergei: [1 patch] : DA8x MUSB support

    * MUSB: DA8xx/OMAP-L1x glue layer [4]

#### Ajay: [3 patch] : Set on AM35x MUSB support

    * AM35x: Add musb support [5]
    * musb: add musb support for AM35x [6]
    * musb: AM35x: Workaround for fifo read issue [7]

#### Ajay: [2 patch] : FIFO table and cleanup

    * usb: musb: Update FIFO mode_5_cfg to accomodate 4K [8]
    * musb: remove extra blank and border lines [9]

#### Ajay: [3 patch] : Set on neednop flag for NOP

    * OMAP3: musb: add neednop flag to fix nop modular issue [10]
    * musb: populate board_data within musb structure [11]
    * musb: use neednop flag for nop registration [12]

#### Ajay: [6 patch] : Set on SDMA as Mentor DMA workarounds

    * musb: save OTG base physical address [13]
    * musb: use system DMA to fix Inventra DMA issue on RTL-1.4 [14]
    * musb: add function to check if Inventra DMA used [15]
    * musb: use system DMA for unaligned buffers on RTL >= 1.8 [16]
    * musb: gadget: fix tx transfer path for mode0 operation [17]
    * musb: dma: use optimal transfer element for sdma [18]

#### Ajay: [1 patch] : On DMA channel release in host mode

    * musb: host: release dma channels if no active io [19]

#### Hema: [2 patch] : on Mentor DMA

    * usb: musb: Unmapping the dma buffer when switching to PIO mode [20]
    * usb: musb: Dynamic dma channel allocation in gadget driver [21]

#### Hema: [4 patch] : Set on HWMODS

    * usb: musb: Adding names for IRQs in resource structure [22]
    * usb: musb: Remove board_data parameter from musb_platform_init() [23]
    * usb: musb: HWMOD database structures addition for OMAP3 [24]
    * usb : musb:USB driver using omap_device_build for device registration. [25]


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware](http://eLinux.org/Category:Hardware "Category:Hardware")

