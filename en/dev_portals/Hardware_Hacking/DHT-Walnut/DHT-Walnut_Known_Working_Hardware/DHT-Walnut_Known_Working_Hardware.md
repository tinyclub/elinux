> From: [eLinux.org](http://eLinux.org/DHT-Walnut_Known_Working_Hardware "http://eLinux.org/DHT-Walnut_Known_Working_Hardware")


# DHT-Walnut Known Working Hardware



This page lists all hardware that is known to work (and not to work)
with the DHT Walnut board. Some PCI cards that don't work, may have
kernel/driver compilation issues. Here is a kernel that works with the
drivers listed below.

[[[Media:kernel]] 2.6.16-pre-3 kernel]

## Contents

-   [1 Known To Work](#known-to-work)
    -   [1.1 Video](#video)
    -   [1.2 USB Cards](#usb-cards)
    -   [1.3 SCSI Adapters](#scsi-adapters)
    -   [1.4 Sound Cards](#sound-cards)
    -   [1.5 IDE](#ide)
    -   [1.6 USB Serial Adapters](#usb-serial-adapters)
-   [2 Known Not To Work](#known-not-to-work)
    -   [2.1 Video](#video-2)
    -   [2.2 Sound Cards](#sound-cards-2)

## Known To Work

### Video

-   Matrox Millenium II (framebuffer console for kernel 2.4 & 2.6)
-   ATI Rage XL (atyfb driver with mods for kernel 2.6.16-pre3)

### USB Cards

-   Best Buy 2-port USB2.0 card (NEC D720101GJ) -- NOTE: Some kernel
    trees has no console mapping for the Walnut target, so while USB
    works, keyboard only works in X.
-   Compu Geeks 2 & 5 port USB2.0 cards (NEC D720101GJ--(NOTE: Kernel
    2.6.16-pre3 and later seem to handle the console mapping ok, and
    both usb keyboards & mice (some) work ok. )--

### SCSI Adapters

-   Adaptec 2930CU is recognized by the AIC7xxx driver

### Sound Cards

-   No Name CS4280/4297A PCI uses cs46xx driver, needs IBM4xx DMA
    support turned on in the kernel config.
-   Creative Labs En Soniq es1370 uses ens1370 driver, needs IBM4xx DMA
    support turned on in the kernel config.

[[[Media:sound.tar.gz]] Drivers]

### IDE

-   SYBA [Compact Flash](http://eLinux.org/Compact_Flash "Compact Flash") to IDE adapter
    (available
    [HERE](http://www.newegg.com/Product/Product.asp?Item=N82E16822998003))

### USB Serial Adapters

-   FTDI USB-Serial adapter chipset (ftdi\_sio driver as module, kernel
    2.6.15.4)

## Known Not To Work

### Video

-   most "standard" PCI video cards
-   many of these cards need their hardware initialized by the BIOS
    which the DHT doesn't have.

### Sound Cards

-   Aureal Votrex2 using au88x0 driver, built from either the latest
    ALSA sources or from those in kernel 2.6.16. The driver loads and
    appears to initialize without errors, but causes a kernel oops when
    an application tries to use it.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")

