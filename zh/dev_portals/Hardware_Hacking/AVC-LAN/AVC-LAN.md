> From: [eLinux.org](http://eLinux.org/AVC-LAN "http://eLinux.org/AVC-LAN")


# AVC-LAN



## Contents

-   [1 Introduction](#introduction)
-   [2 Connections](#connections)
-   [3 Waveform](#waveform)
-   [4 Protocol](#protocol)
-   [5 Hardware](#hardware)
    -   [5.1 Specific](#specific)
    -   [5.2 General Purpose](#general-purpose)
-   [6 Hacks](#hacks)
-   [7 Documentation Credit](#documentation-credit)

## Introduction

The AVC-LAN is part of the Body Electrical System Control and manages
all audio and video related functions. The audio bus is described in
Toyota's own words as follows:

    AVC-LAN consist of audio visual systems such as the multi-display, navigation ECU, radio and
    player, stereo component amplifier and gateway ECU. Gateway ECU has communication
    circuit to correspond with different types of communication data. Different types of
    communication data can be shared among communication parts after it goes through gateway
    ECU (System Circuits: AVC-LAN Bus, “Prius Wiring Diagram” 80).

The system itself can be considered a subset of the IEBus Standard,
which was delevoped by NEC electronics for automotive use. It is
slightly faster than the [BEAN Bus](http://eLinux.org/BEAN_Bus "BEAN Bus") and has more
data per command, but is still much slower than [CAN
Bus](http://eLinux.org/CAN_Bus "CAN Bus"), since realtime speeds are not required.

## Connections

[![Iebus-connections.gif](http://eLinux.org/images/e/ea/Iebus-connections.gif)](http://eLinux.org/File:Iebus-connections.gif)

## Waveform

[![Iebus-waveform.jpg](http://eLinux.org/images/d/d1/Iebus-waveform.jpg)](http://eLinux.org/File:Iebus-waveform.jpg)

-   Prep 7uS
-   Sync 20uS
-   Data 13uS

## Protocol

[![Iebus-message.jpg](http://eLinux.org/images/1/18/Iebus-message.jpg)](http://eLinux.org/File:Iebus-message.jpg)



[![Avc-lan-message.jpg](http://eLinux.org/images/thumb/b/b8/Avc-lan-message.jpg/600px-Avc-lan-message.jpg)](http://www.elinux.org/images/b/b8/Avc-lan-message.jpg)

This is an AVC-LAN message captured using a logic probe.

## Hardware

### Specific

-   Renesas [HA12240](http://eLinux.org/images/0/03/HA12240.pdf "HA12240.pdf")
    Differential Transceiver
    -   A2240 Package Marking
    -   CA0008 Package Marking
    -   CA0013 Package Marking
-   NEC [uPD6708](http://eLinux.org/images/2/2c/UPD6708.pdf "UPD6708.pdf") IEBus (Inter
    Equipment Bus) Protocol Controller
-   NEC [uPD72042](http://eLinux.org/images/e/e1/UPD72042.pdf "UPD72042.pdf") IEBus
    (Inter Equipment Bus) Protocol Controller

### General Purpose

-   LM239 comparator (can be used for receiver)
-   PCA82C250 [CAN Bus](http://eLinux.org/CAN_Bus "CAN Bus") (can be used for driver)
-   MCP2551 [CAN Bus](http://eLinux.org/CAN_Bus "CAN Bus") (can be used for driver)
-   RS-485 Differential Transceiver ( can be used for both receiver and
    driver)
    -   SN65HVD11 +3.3V
    -   SN75HVD11 +5v

## Hacks

-   [Marcin Slonicki's Toyota Corolla AVC-Lan MP3
    player](http://www.softservice.com.pl/corolla/avc/) using:
    -   ATmega8 is clocked at 14.7456 MHz with an external crystal
    -   PCA82C250 CAN bus driver is used to drive the IEBus
    -   LM239 comparator is required on top of the PCA82C250 to read
        from the IEBus
-   [Louis Frigon's Toyota Auxiliary Audio Input
    Enabler](http://www.sigmaobjects.com/toyota/) using:
    -   ATmega8 is clocked at 8.00 MHz with the internal RC
    -   ATmega8's internal analog comparator handles the receive side
    -   ATmega8's two GPIOs as antagonist output pins perform the bus
        driver

## Documentation Credit

-   Jeremiah J. Flerchinger
    [Whitepaper](http://eLinux.org/images/e/ed/Avc-lan.pdf "Avc-lan.pdf")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Networking](http://eLinux.org/Category:Networking "Category:Networking")

