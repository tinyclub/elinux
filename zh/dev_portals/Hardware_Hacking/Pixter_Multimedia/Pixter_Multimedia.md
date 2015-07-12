> From: [eLinux.org](http://eLinux.org/Pixter_Multimedia "http://eLinux.org/Pixter_Multimedia")


# Pixter Multimedia



[![Pixter-mm.jpg](http://eLinux.org/images/c/cf/Pixter-mm.jpg)](http://eLinux.org/File:Pixter-mm.jpg)


 Items of interest inside the device:

-   Sharp [LH79524](http://eLinux.org/LH79524 "LH79524") CPU
-   Two IC42S16100-7T SDRAM ICs (2MB each, 4MB total)
    [[datasheet](http://www.issi.com/pdf/42S16100.pdf)]
-   TLV320DAC26 audio
    [[datasheet](http://www-s.ti.com/sc/ds/tlv320dac26.pdf)]
-   OTP flash [Chip On Board](http://eLinux.org/Chip_On_Board "Chip On Board") IC
-   SPI eeprom [Chip On Board](http://eLinux.org/Chip_On_Board "Chip On Board") IC (still
    collecting information on this)
-   Audio [Chip On Board](http://eLinux.org/Chip_On_Board "Chip On Board") IC which
    connects to the DAC26's microphone input (still collecting
    information on this)
-   Well-labeled
    [PixterMultimediaLCD](http://eLinux.org/PixterMultimediaLCD "PixterMultimediaLCD")
    port
-   4-wire touch-screen
-   Silkcreen above largest [Chip On
    Board](http://eLinux.org/Chip_On_Board "Chip On Board") reads "PT1543A-BGA-42FC
    2005/04/30 REC 4.2B"
-   [Pixter Multimedia Expansion
    Slot](http://eLinux.org/Pixter_Multimedia_Expansion_Slot "Pixter Multimedia Expansion Slot")
-   [Pixter Multimedia Expansion
    Cartridge](http://eLinux.org/Pixter_Multimedia_Expansion_Cartridge "Pixter Multimedia Expansion Cartridge")
-   [Pixter Multimedia Developer
    Board](http://eLinux.org/Pixter_Multimedia_Developer_Board "Pixter Multimedia Developer Board")
-   [PixterMultimediaJTAG](http://eLinux.org/PixterMultimediaJTAG "PixterMultimediaJTAG")

PCB Pads:

Primary side:

-   TXD0, RXD0 these are incorrectly label on the pcb, they are actually
    UARTTXD1 and UARTRXD1
-   CTS0, RTS0 (apparently extended to cartridge port)
-   L16 (nCS0 PM0)
-   A4 (PH5/ETHERTX1 I/O General Purpose I/O Signals -- Port H5;
    multiplexed with Ethernet Transmit Channel 1)

USB Pins:

-   A16 USBDN I/O USB Data Negative (Differential Pair output, single
    ended and Differential pair input)
-   A15 USBDP I/O USB Data Positive (Differential Pair output, single
    ended and Differential pair input)

Secondary side:

-   Test1
-   Vss
-   Test2
-   CS1 bridge (SMT pads for 0-ohm resistor with a line between them)
    opposite the big CoB blob
-   M4 (PB4/SSPRX/I2SRXD/UARTRX0/UARTIRRX0) Port B4; multiplexed with
    SSP Data In, I2S Data In, UART0 Serial Data In, and UART0 Infrared
    Data In
-   1V8 (most likely 1.8v for the cpu core)



* * * * *


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Pixter](http://eLinux.org/Category:Pixter "Category:Pixter")

