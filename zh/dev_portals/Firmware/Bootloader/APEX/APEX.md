> From: [eLinux.org](http://eLinux.org/APEX "http://eLinux.org/APEX")


# APEX Bootloader


(Redirected from [APEX](http://eLinux.org/index.php?title=APEX&redirect=no "APEX"))


**NEWS:** APEX is now available via Gitorious



## Contents

-   [1 Summary](#summary)
-   [2 Use](#use)
-   [3 Source Code](#source-code)
-   [4 Change Log](#change-log)
    -   [4.1 Version 1.6 Series](#version-1-6-series)
        -   [4.1.1 2009-05-17 Version 1.6.9](#2009-05-17-version-1-6-9)
        -   [4.1.2 2009-01-23 Version 1.6.8](#2009-01-23-version-1-6-8)
        -   [4.1.3 2009-01-21 Version 1.6.7](#2009-01-21-version-1-6-7)
        -   [4.1.4 2009-01-20 Version 1.6.6](#2009-01-20-version-1-6-6)
        -   [4.1.5 2009-01-05 Version 1.6.5](#2009-01-05-version-1-6-5)
        -   [4.1.6 2008-12-18 Version 1.6.4](#2008-12-18-version-1-6-4)
        -   [4.1.7 2008-11-13 Version 1.6.3](#2008-11-13-version-1-6-3)
    -   [4.2 Version 1.5 Series](#version-1-5-series)
        -   [4.2.1 2007-10-16 Version
            1.5.13](#2007-10-16-version-1-5-13)
        -   [4.2.2 2007-08-06 Version
            1.5.11](#2007-08-06-version-1-5-11)
        -   [4.2.3 2007-07-24 Version
            1.5.10](#2007-07-24-version-1-5-10)
        -   [4.2.4 2007-06-25 Version 1.5.8](#2007-06-25-version-1-5-8)
        -   [4.2.5 2007-06-02 Version 1.5.6](#2007-06-02-version-1-5-6)
        -   [4.2.6 2007-06-01 Version 1.5.5](#2007-06-01-version-1-5-5)
        -   [4.2.7 2007-05-30 Version 1.5.4](#2007-05-30-version-1-5-4)
        -   [4.2.8 2007-05-24 Version 1.5.3](#2007-05-24-version-1-5-3)
        -   [4.2.9 2007-05-18 Version 1.5.2](#2007-05-18-version-1-5-2)
        -   [4.2.10 2007-05-10 Version 1.5.0](#2007-05-10-version-1-5-0)
    -   [4.3 Earlier Series](#earlier-series)

## Summary

APEX is a bootloader for embedded systems. It was originally written to
support the Sharp LH series of processors but has been ported to a
number of additional ARM targets such as the Samsung S3C24xx series.

-   Easy to build. It depends only on shell utilities and GCC.
-   Easy to configure. There is a single configuration file and it uses
    the linux-2.6 Kconfig infrastructure.
-   Excellent dependency management. Uses Linux kernel Kbuild to
    optimally manage dependencies.
-   Modular. Commands and drivers may be included or excluded by
    configuration.
-   Supported targets: LH79520, LH79524, LH7A400, LH7A404, IXP42x (e.g.
    Linksys NSLU2), S3C24xx, and iMX31.
-   Support for RARP IP configuration and TFTP transfers to the target.
-   Filesystem drivers for FAT, EXT2, and JFFS2.
-   Partition driver for FIS as used by Redboot.
-   Small footprint. A limited feature version can be as small as 16KiB.
-   Support for booting APEX from non-memory-mapped storage, e.g. NAND
    flash, OneNAND, I2C
-   OMAP3 and OMAP4 support under development(no need for separate MLO
    and bootloader)

## Use

    discussions should be held on the "discussion" page. please state what you are needing help with

## Source Code

-   APEX is now available via git at
    [Gitorious](https://gitorious.org/apex)
-   OMAP4 PandaBoard repo via git at
    [Gitorious](https://gitorious.org/+pandaboard/apex/pandaboard-apex)

## Change Log

### Version 1.6 Series

#### 2009-05-17 Version 1.6.9

-   Makefile (SUBLEVEL): v1.6.9
-   Closed debian bugs by fixing configuration files.
-   Applied
    [http://svn.nslu2-linux.org/svnroot/kernel/trunk/patches/apex](http://svn.nslu2-linux.org/svnroot/kernel/trunk/patches/apex)
-   src/drivers/driver.c (open\_helper): New open helper used by the
    serial drivers and the memory driver. It's an always-success
    impementation for drivers that have nothing to do on open.
-   src/mach-orion5x/serial.c (orion5x\_serial\_init): Removed old
    console initialization as this is now done as a service.
-   src/mach-s3c2410/serial.c (s3c2410\_serial\_init): Removed old
    console initialization as this is now done as a service.
-   src/mach-lh7952x/serial.c (lh7952x\_serial\_init): Removed old
    console initialization as this is now done as a service.
-   src/mach-lh7a40x/serial.c (lh7a40x\_serial\_init): Removed old
    console initialization as this is now done as a service.
-   src/mach-mx3/serial-sc16c652.c (sc16c652\_serial\_init): Removed old
    console initialization as this is now done as a service.
-   src/mach-mx3/serial-mx31.c (mx31\_serial\_init): Removed old console
    initialization as this is now done as a service.
-   src/mach-ixp42x/serial.c (ixp42x\_serial\_init): Removed old console
    initialization as this is now done as a service.
-   src/apex/console.c (console\_init): Console initialize as a service
    and configurable in the environment.
-   include/service.h (\_\_service\_4): Annotation that console is
    initialized in service 8.
-   include/driver.h (DRIVER\_CONSOLE): Cleanup of macros.
-   src/mach-ixp42x/pci.c (pci\_init): Commented out broken PCI
    interrupt type macros. Should be fixed.
-   src/apex/command.c (expand\_variables): Revised expand\_variables
    code to expand references within expanded references. This change
    permits us to define the kernel location, for example, as depending
    on the \$serverip.

#### 2009-01-23 Version 1.6.8

-   Makefile (SUBLEVEL): v1.6.8
-   src/mach-lh7a40x/initialize.c (target\_init): Added code to the
    target initialization for Companion that initializes the modem.

#### 2009-01-21 Version 1.6.7

-   Makefile (SUBLEVEL): v1.6.7 for push of new features.
-   src/drivers-lh/drv-mmc.c (mmc\_report): Revised reporting to make it
    easier to troubleshoot cards.

#### 2009-01-20 Version 1.6.6

-   include/mmc.h (mmc\_card\_acquired): Revised the card acquisition
    code so that we don't assume that the first byte of the CID register
    is non-zero. IMHO, our assumption was correct based on the SD
    association's documentation, but we found that the Eye-FI card has a
    bogus looking card ID (CID) register and we have to be lenient to
    see it.
-   Makefile (SUBLEVEL): v1.6.6 for Companion fixes so it can use a
    1.6.x version of APEX.
-   src/drivers/relocate-nand.c: Revised NAND relocator to work with the
    LPD7A404. Considering that the only other user of the code is a test
    implemented for the LH79524, this should be safe to rework. The key
    difference is that the relocator will address each page in turn
    instead of depending on an unreliable feature of NAND flash that
    automatically loads successive sectors.
-   src/arch-arm/Kconfig: Changed the Companion bootstrap to use the
    NAND relocator. This allows us to have a loader that is larger than
    80KiB, the size of SRAM. Added a page size configuration option for
    relocation from NAND flash.
-   src/apex/cmd-version.c (cmd\_version): Fixed display of environment
    variables s.t. the \>64KiB length is properly shown in the version
    command output.
-   src/apex/cmd-image.c (cmd\_image): Added an option to relocate the
    ramdisk image s.t. the uBoot image format can be loaded with "image
    load" and then used to boot the system.

#### 2009-01-05 Version 1.6.5

-   src/mach-orion5x/mv2120\_config: Moving to the CodeSourcery compiler
    for thumb support.
-   src/arch-arm/lib/cp15-invalidate-dcache-va.c
    (invalidate\_dcache\_va): Conditionally compiling the
    invalidate-dcache-va function based on the presence of the macro
    and, therefore, the CP15 feature.
-   Makefile (SUBLEVEL): 1.6.5 for orion5x merge.
-   src/apex/cmd-flashusage.c (cmd\_flashusage): New command to scan
    eraseblocks of a flash device for the presence of data.
-   src/mach-lh7952x/memory.h (RAM\_BANK0\_LENGTH): Fixed the
    declarations of the extents for the memory regions in the LH7952x.
    The macros were correct for the LH79524 but not the LH79520. This is
    now fixed.
-   src/drivers/drv-ext2.c (ext2\_identify): Revised EXT2 driver to took
    for extended partitions and to cope with 64 bit IO.
-   include/driver.h: Support for 64 bit IO sizes. This is only
    necessary for large devices like those accessible via ATA/SATA. It
    is optional and somewhat expensive. Even the EXT2 driver will
    function without it, but it won't be able to see partitions past
    2GiB. This change trickled into lots of areas of APEX because of the
    change of types in the descriptor structure. However, there should
    be no size or performance impact when the system is compiled without
    CONFIG\_DRIVER\_LONG\_LONG\_SIZE.
-   src/arch-arm/lib/muldi3.S: Inclusion of another kernel function for
    handling aeabi entry points. This was required by drv-ata when we
    compiled it with THUMB.
-   src/arch-arm/lib/cp15-wait.c: This and other cp15 functions so that
    cp15 operations can be invoked from THUMB code without THUMB2
    support and without specialized code to detect the operation mode.
    These functions allow all code that lacks \_\_asm's to be compiled
    with THUMB.
-   src/drivers/drv-fat.c (fat\_open): Adding greater specificity to the
    region construction from the block\_driver().
-   src/drivers/drv-ext2.c (ext2\_open): Adding greater specificity to
    the region construction from the block\_driver().
-   src/drivers/driver.c (parse\_descriptor): Fix to disambiguate
    regions that could have path elements. The parser would not
    interpret driver:10k as having a start address of 10k when the
    driver could accept a path. Now, parser will interpret driver:bin as
    having a path of 'bin', but driver:10k as having a starting offset
    as 10k. The region can be unambiguously constructed using '@' and
    '/' appropriately.
-   src/mach-mx3/drv-i2c.c: New I2C driver for MX3x. Not complete, but
    working for writes to the I2C\#1 controller.
-   src/mach-mx3/cmd-wm8955.c: New command for sending control messages
    to the WM8955L on the PSJL Karma.
-   src/drivers/driver.c (parse\_descriptor): Fix for the parsing of FS
    descriptors such that the start address and length parameters may be
    set.(parse\_descriptor): Added the '%' special character for
    combining one or more descriptors. This is used by the drivers that
    have a basis driver defined in an environment variable, s.t. the
    driver can specify a starting address and/or length without knowing
    the exact form specified by the

#### 2008-12-18 Version 1.6.4

-   Makefile (SUBLEVEL): Rolling revision for PSJL implementation.
    1.6.4.
-   src/drivers/drv-nor-cfi.c (nor\_probe\_chip): Support for broken
    AMD/Spansion NOR flash that does not properly report top-boot vs.
    bottom-boot.
-   src/drivers/drv-nor-cfi.c: In order to support the Micronix
    (Spansion compatible) NOR flash in the HP MediaVault 2120, we needed
    to completely fill out the Spansion support. There is support for a
    single byte wide bus and a 16 bit internal logic as is the case on
    the MV2120.
-   src/drivers/drv-nor-cfi.c (ReadArray): Changed the ReadArray command
    for Spansion to 0xf0.
-   src/arch-arm/lib/cp15.c (cp15\_ctrl): Enhanced the cp15 report on
    the control register to be more readable and to show more bits
    (ARMv6).
-   src/apex/cmd-image.c (cmd\_image): Adding descriptor\_open() call to
    image load so that we can read from tftp.
-   src/drivers/drv-nor-cfi.c (nor\_report): Cleanup of the nor flash
    driver report. Added start address and length that match the mem
    driver.
-   Makefile: Thumb support restored, required a little work to the
    src/arch-arm/lib code to guarantee interwork compatibility.
-   src/mach-mx3/exception\_vectors.c: Implementation of exception
    vectors on MX31, primarily in support of debugging THUMB.
-   src/arch-arm/lib/div64.S: Slight recoding of platform
    implementations of basic functions to be interwork compatible.
-   src/net/tftp.c (tftp\_receiver): Reporting on TFTP errors s.t. we
    properly detect file-not-found problems.

#### 2008-11-13 Version 1.6.3

-   Makefile (SUBLEVEL): Version 1.6.3 for dm9000. The initial orion
    patches are in as well, but not yet supported.
-   src/drivers/drv-dm9000.c (dm9000\_read): Implementation of
    dm9000\_{read,write} to round out support for dm9000 as a complete
    Ethernet MAC/PHY driver.
-   src/lib/strtol.c: Adding strtol as a separate library function, in
    case it is needed. The memlimit command will use this function.
-   src/mach-mx3/rosencrantz.h (CCM\_PDR0\_V): Override for the PDR0 so
    that the CSI clock scalar is non-default.
-   src/mach-mx3/mx31.h (CCM\_UPCTL\_266\_V): Fixed the UPCTL
    initialization values. This PLL is based on the CKIH, so it doesn't
    need to change when the CPU clock speed changes. (CCM\_PDR0\_V):
    Allowing this value to be overridden by the board specific header.
-   src/drivers/drv-mem.c (cmd\_memlimit): Revised memlimit to permit a
    negative offset which is then subtracted from the total system
    memory.
-   debian/rules (binary-arch): Adding apex-image to the tools installed
    in the debian package.
-   src/apex/cmd-image-uboot.c: Documentation for UBOOT image format.
    (verify\_uboot\_image): Added support for multi-images. Now loading
    UBOOT images the same way that UBOOT does.
-   src/apex/region-checksum.c (region\_checksum): Fixed the checksum to
    account for incoming CRC value as is necessary for UBOOT image CRC
    computation.
-   src/apex/cmd-image-uboot.c: Added uboot image support. No
    multi-images, but the rest works OK.
-   src/apex/region-checksum.c (region\_checksum): Added neglected check
    for whether or not the caller wants the length added to the checksum
-   src/apex/cmd-image-apex.c (handle\_apex\_image): Factored out the
    APEX image code so we can implement UBOOT in separate file with
    optional compilation.
-   scripts/Makefile.build (modorder-target): Removed build of the
    module.order files.
-   src/apex/cmd-copy.c (cmd\_copy): Fixed the return value so copy
    doesn't stop startup.
-   src/apex/cmd-image.c (handle\_load\_apex\_image): Cleaned up the
    output and make the check and load functions look similar in output.
-   src/apex/region-checksum.c (region\_checksum): Fixed checksumming so
    that we can sum over a defined range instead of being limited to
    summing the whole region.
-   src/apex/cmd-image.c (apex\_image): Refactored cmd-image code to
    support a single driver for parsing through the header data.
-   src/apex/cmd-image.c (cmd\_image): Fixed cascade testing of options.
-   src/lib/gmtime.c (gmtime\_r): Fixed year calc (typo). (gmtime\_r):
    Fixed month calc, off by one. convert\_two\_digits): Fixed
    representation of numbers; digits swapped.
-   src/lib/strimatch.c (strimatch): Fixed this function to properly
    match when the case is identical.
-   src/apex/cmd-help.c (compare\_commands): Righted command sort order.
    (cmd\_help): Eliminated a possible overflow of command listing
    array.
-   src/drivers/drv-mem.c (memory\_write): Fixed un-aligned write code.
    The original test used were allowing invalid unaligned accesses.
-   src/mach-mx3/nor-cfi.h: Removed bogus override of the NOR flash
    memory command type.
-   src/mach-mx3/initialize.c (target\_init): New initialization of the
    DM9000 memory region for MX31. The timing is much tighter and the OE
    and R\_Wn timing has a better guarantee of accuracy.
-   src/drivers/drv-dm9000.c (cmd\_eth): New 'r' and 'w' subcommands for
    inspecting registers of the DM9000. Renamed the 're' command to
    eeprom since that's what it does.
-   src/apex/services.c (init\_services): More clear output from service
    startup in LL mode.
-   Makefile (SUBLEVEL): New version for changes to DM9000 code and for
    new KarmaV configuration.
-   src/drivers/drv-ext2.c: Added support for the inode\_size field in
    the first revision of the second-extended filesystem's superblock.
-   debian/postinst: Fixed the postinst script to only run on the NSLU2.

### Version 1.5 Series

#### 2007-10-16 Version 1.5.13

-   Makefile: The help make target now shows the configurations and the
    descriptions of them. (SUBLEVEL): 1.5.13.
-   src/drivers/relocate-nand.c: Fixed the basic NAND relocator. The
    code was previously broken as there was no configuration that used
    it.
-   src/drivers-lh/Kconfig: Added 565 option for LCD panel. Odd, that
    we'd never implemented this before, but it is important to note that
    the NXP LCD controller doesn't cope with 565 as well as 555.
-   src/mach-mx3/ipu.c: Inverted sense of LED outputs for testing
    Rosencrantz.
-   src/mach-lh7a40x/clcdc-karma.c: Added adapter code for Karam LCD
    panel.
-   src/mach-lh7a40x/cmd-karmaaccel.c: Added accelerometer test code for
    Karma.
-   src/mach-lh7a40x/cmd-karmatouch.c: Added touch controller test code
    for Karma.
-   Removed a lot of cruft associated with older NAND flash
    implementations. NAND code is moved to the drivers directory.

#### 2007-08-06 Version 1.5.11

-   Makefile (SUBLEVEL): Rolling to 1.5.11 just to make sure we got all
    of the timing parameter changes in a unique version.

#### 2007-07-24 Version 1.5.10

-   Makefile (SUBLEVEL): rolling to 1.5.10 for fix to CPU timing on
    lh7a404.
-   src/mach-lh7a40x/initialize.c: Moved the clock speed setup to the
    early initialization routine so that it is properly configured.
-   usr/apex-env.cc (arg\_parser): Added force option to the apex-env
    command. (main): Added partial command support so that 'apex-env
    rel' shows the release version.
-   src/arch-arm/entry/apex.lds.S: Removed Companion section from the
    general build.

#### 2007-06-25 Version 1.5.8

-   Makefile (SUBLEVEL): 1.5.8: Releasing for Debian package.
-   usr/apex-env.cc: Added release and region commands for probing the
    APEX environment.
-   src/apex/env.c: Added prefix option to the startup command. Removed
    crufty old ENV\_STARTUP option that was mach specific.
-   src/arch-arm/entry/apex.lds.S: Renamed some of the sections to make
    the meanings clear. Preemtively fixed a vulnerability to section
    reordering. Fixed the setting of fSDRAMBoot so that it works for
    INLINE init mode and for the older form.
-   src/mach-ixp42x/initialize.c (bootstrap\_sdram\_pre): Revamped the
    initialization code for ixp42x to use inline mode. Took the
    opportunity to elide a lot of cruft from the routines. It isn't yet
    tested as written to flash as this requires setup of one of the
    wigglers. None of the typical uses of APEX on the ixp42x install
    APEX as the primary boot loader, so this can wait.
-   src/arch-arm/Kconfig: Configuration option to override the default
    SDRAM execution detection code. Most platforms can use the execution
    address to detect whether or not APEX is running in SDRAM. Some,
    like the ixp42x map flash over SDRAM, so we have to use a custom
    piece of code to detect this circumstance.
-   src/arch-arm/Kconfig: Added AEABI configuration option so that we
    can link APEX with an AEABI toolchain. Really, the only difference
    is the inclusion of a couple of math functions.
-   src/arch-arm/lib/lib1funcs.S: Added config.h to build of lib1funcs
    so that the configuration dependencies are checked.

#### 2007-06-02 Version 1.5.6

-   Makefile (SUBLEVEL): 1.5.6: Releasing version with fix section
    ordering.
-   src/arch-arm/entry/reset.c: Fixed a problem in the ordering of the
    reset sections that was illuminated by rwhitby's default compiler.

#### 2007-06-01 Version 1.5.5

-   Makefile (SUBLEVEL): 1.5.5 for the SAVEATONCE option, very necessary
    for OneNAND stored environment.
-   src/lib/env.c: New option, CONFIG\_ENV\_SAVEATONCE implements a
    cached environment that is saved at one time to non-volatile storage
    instead of through incremental updates. This is necessary for some
    types of NAND flash where multiple writes to the same page are
    limited.
-   src/apex/\*.c: Groomed error reporting for opening regions.
-   src/lib/env.c: Changed the environment region descriptor name to
    d\_env so that it is easier to remember.

#### 2007-05-30 Version 1.5.4

-   Makefile (SUBLEVEL): 1.5.4. Rolling revision for the sake of the
    xscale fixes.
-   src/mach-mx3/cmd-sleep.c (cmd\_sleep): Test code for MX31 sleep
    modes.
-   src/mach-mx3/cmd-reset.c (cmd\_reset): Command verified.
-   src/arch-arm/entry/reset.c: Added a jump to reset\_exit() from
    reset() in the event that we disable the MMU at startup. The ixp42x
    needs this because the xscale MMU flush code allocates data in the
    text section.
-   src/mach-ixp42x/initialize-sdram.c (cmd\_initialize\_sdram): Fixed
    the scan of 256Mib SDRAM chips. A small change to the algorithm and
    we seem to be able to detect 64MiB of memory just fine.
-   src/drivers/drv-mem.c (cmd\_memscan): Error detection for region too
    small.
-   src/drivers/driver.c (parse\_descriptor): Unparseable regions will
    now generate an error.
-   src/apex/cmd-version.c (cmd\_version): Added a message about the
    currently set variation.

#### 2007-05-24 Version 1.5.3

-   Makefile (SUBLEVEL): 1.5.3. Rolling rev for the sake of working IPU
    code, working sensor capture, and turing off of the illumination
    LEDs.
-   src/mach-mx3/ipu.c (cmd\_ipu): Fixed the shutter width to increase
    frame rate.
-   src/mach-mx3/ipu.c (ipu\_setup): Fixed the burst width to memory
    through the IPU DMAC.
-   src/drivers/drv-dm9000.c: Fixed failed probe code path. If the
    dm9000 isn't found, there will be no report.
-   src/mach-mx3/ipu.c: Adding view finder DMA task.
-   src/lib/env.c (env\_check\_magic): Fixed empty/broken environment
    region case.

#### 2007-05-18 Version 1.5.2

-   Makefile (ARCH): Releasing 1.5.2.
-   src/arch-arm/Kconfig: Fixed companion boot by explicitly enabling
    the simple/NOR flash relocator as the primary relocator.
-   src/drivers/drv-nand.c (nand\_sequential\_input): Fixed the NAND
    driver to R/W on ST NAND parts.
-   src/mach-lh7952x/debug\_ll.h: Fixed UART declarations.
-   src/mach-lh7952x/init-motoedge.c: Converted to inline platform
    initialization.
-   src/arch-arm/entry/relocate-simple.c: fixed relocate-simple()
    because we changed the way we handle offsets.
-   Makefile (SUBLEVEL): Rolled to 1.5.2 so that we can keep track of
    this interim release.
-   src/apex/command.c (exec\_monitor): Eliminated representation of
    empty commands in startup command list.
-   src/arch-arm/entry/apex.lds.S: Reorganized the sections and the
    section names to be more readable and consistent.
-   src/arch-arm/entry/reset.c: Restructured to allow for cleaner
    startup code. Legacy implementations are still OK, but the new
    plumbing permits seamless transitions between various initialization
    elements to handle constrained boot situations. Also removed an
    onerous constraint on register usage in the relocate\_apex()
    function. The caller is now forced to assume that no registers are
    saved.
-   src/arch-arm/linux/atag.c (atag\_header): Eliminated the core tag.

#### 2007-05-10 Version 1.5.0

-   Releasing 1.5.0 with iMX31 and OneNAND.
-   src/drivers/relocate-onenand.c: Groomed the relocation for OneNAND
    to remove unneeded return address calculation.
-   src/drivers/drv-dm9000.c: Added code to help select the proper
    default interface when there could be two and only one is present.
-   src/mach-mx3/initialize.c: Groomed the startup code to remove much
    cruft.
-   src/apex/env.c: Fixed typo in the default environment startup
    command that was including the ramdisk startup even though there was
    none needed.
-   src/apex/command.c (call\_command): Reorganized command invocation
    to report bogus command requests.
-   src/arch-arm/entry/apex.lds.S: Start of reorganization of the
    bootstrap so that we don't need to use function calls to handle
    early setup \*and\* we don't depend on macros.
-   src/drivers/relocate-onenand.c: Implementation of OneNAND APEX
    relocation for bootstrap.
-   src/apex/env.c: Improved the environment link so that it can exist
    even if there is no user-modifiable environment. This is to allow
    user-land to browse environment variables even if they cannot set
    them.
-   src/mach-lh7a40x/preinitialization-companion.c: Comment on
    preinitialization.
-   src/mach-mx3/ipu.c (cmd\_ipu): Fixed the i2c code and added hooks to
    enable camera test patterns.
-   src/mach-mx3/initialize.c: Substantially enhanced the system setup.
    The IPU test code is now able to write to memory.
-   src/apex/cmd-version.c (cmd\_version): Added target board
    description string.
-   src/mach-mx3/initialize.c: Extra check in the initialization routine
    so that we don't alter the timing registers if the CPU is already in
    the target mode. It looks like the CPU doesn't like the PLLs being
    changed once it has booted. It may be the SDRAM that doesn't like
    the timing change.
-   src/arch-arm/entry/reset.c: Restored setting of the CPSR mode in the
    loader. The CPU boots in the undefined mode. We move to supervisor
    mode, though this doesn't appear to be necessary for the kernel to
    boot.
-   src/mach-mx3/ipu.c (ipu\_report): Improved clarity of IPU report to
    break out fields and to describe the formats in English.
-   include/asm/cp15-armv6.h: Fixed the cache control macros for the
    ARMV6.
-   src/mach-mx3/ipu.c: More IPU debug code. The report function has a
    clean rendering of the registers.
-   src/mach-mx3/mx31.h (CCM\_PDR0\_533\_V): Switched to 533MHz CPU
    clock.
-   src/mach-mx3/uart.h (INITIALIZE\_CONSOLE\_UART): extended the FIFOS
    to 16 bytes.
-   src/mach-mx3/initialize.c: Added initialization of COSR even though
    we don't use it.
-   src/mach-mx3/Kconfig: New architecture number for Rosencrantz.
-   src/apex/services.c: Created this file to hold service init/release
    code.
-   src/apex/env.c: Added a "" to the startup command so that we can
    have an empty startup command.

### Earlier Series

-   See full [Changelog](http://eLinux.org/images/4/41/Changlog.txt "Changlog.txt")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Bootloaders](http://eLinux.org/Category:Bootloaders "Category:Bootloaders")

