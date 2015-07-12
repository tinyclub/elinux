> From: [eLinux.org](http://eLinux.org/Drink_Mixer "http://eLinux.org/Drink_Mixer")


# Drink Mixer



## Contents

-   [1 Drink Mixer (Audio Mixer)](#drink-mixer-audio-mixer)
-   [2 Hardware](#hardware)
-   [3 Power Requirements](#power-requirements)
-   [4 Pictures](#pictures)
-   [5 Useful Resources](#useful-resources)

## Drink Mixer (Audio Mixer)

The Drink Mixer is a 6-8 Channel Audio Mixer with a peripheral interface
operated by the Tin Can Tools Hammer. This was a Senior Design Project
presented for Purdue University's Senior Design Class ECE 477. In order
to pass this class at least 3 of 5 project success criteria must be
completed.

**Project Success Criteria:
**

-   1. An ability to mix and adjust levels of 6-8 Channels of Audio
-   2. An ability to change individual equalizer settings for each
    channel.
-   3. An ability to display settings/ channel information on an LCD
    Display.
-   4. An ability to save and load scene settings (moving faders)
-   5. An ability to display the amplitude of an audio output signal.

Of the above project success criteria, currently 2,3, and 4 are
completed with the help of the Hammer ARM920T Chip.

More information and pictures will be added to this later but for now a
link to the Purdue University Senior Design Project Page for this
project can be found below.

[Purdue ECE477 Team 2 Project
Page](https://engineering.purdue.edu/ece477/Webs/F09-Grp02)

## Hardware

The Hammer is not capable of processing audio at rates necessary for
this project with all of the floating point calculations involved. As a
result several processors were used

     1  - ADSP-21262 SHARC DSP
    10 - AVR ATMEGA32A


 The ATMEGA32A were used as peripheral processors that kept track of
motorized faders as well as Rotary Pulse Generators (RPGS) and LED Bar
graphs. These processors were all placed on an i2c bus and monitored and
updated several times / second by the Hammer S3C2410A ARM920T Processor.

The information acquired by the Hammer from the various peripherals as
well as the user interface are then sent to a SHARC ADSP-21262 over an
SPI bus. This information is processed and audio levels are adjusted
accordingly. (Currently the audio portion of the project is incomplete
as too much crosstalk is occurring on the A/D Data line).

## Power Requirements

**Power Rails** +-15V @ 320 mA each direction
 +9 V @ 8.8 A
 +5 V @ 1224 mA
 +3.3 V @ 2.5 A
 (NOT a power rail, but must be considered...)
 +1.3V @ 160 mA for DSP

**Total Power Consumption** 3.84 Watts + 20% = 4.6 Watts Needed in
positive 12VDC
 3.84 Watts + 20% = 4.6 Watts Needed in negative 12VDC
 This is 383 mA @ 12 Vdc

 88 Watts + 20% = 105.6 Watts Needed in positive 10VDC (using switching
power supply)
 This is 10.56 A @ 9 Vdc

 6.12 + 8.25 + 0.352 + extra = 14.722 Watts + 20% = 17.66 Watts Needed
in positive 5VDC (linear, then step-down converted to lower voltages)
 This is 3.53 A @ 5 Vdc


 **LCD Display (Panasonic EDMGRB8KJF)** 1.5 AMP 3.3V Max

**JFET Preamplifier** 40mA x 8 = 320 mA @ +-15V (in each direction)

**Motorized K-Faders** 800 mA x 11 = 8.8 A @ 9V

**Hammer Arm9** 5VDC @ 120 mA (typical), 300 mA (max)

Atmel (ATMEGA32A) Vcc = 5Vdc, Active @ 8MHz: Max = 15 mA
 Vcc = 5Vdc, Active @ 16MHz: Max(estimated)\< 40 mA each


Therefore, total = 9 x 40mA = 360 mA @ 5Vdc

**SHARC (Analog Devices ADSP-21262)** External (I/O) Supply Voltage
(VDDEXT) 3.13 to 3.47 V (optimally 3.3 VDC) @ 1A
 Requires low voltage (approx. 1.3V for something else)

**LED Bar Graph** 2 mA per LED x 10 = 20 mA per graph x 8 = 160 mA @ 2.2
V (just for current draw, voltage rail will be done on channel PCB)

**LED Level Display** 5 mA per LED x 40 = 200 mA @ 5V

**Audio ADC (AD1871 x4)** 5Vdc @ 45mA each = 180mA @ 5Vdc

**Audio DAC (AD1833A)** 5Vdc @ 46mA each = 184mA @ 5Vdc

## Pictures

[![DrinkMixer-Hammer.jpg](http://eLinux.org/images/6/60/DrinkMixer-Hammer.jpg)](http://eLinux.org/File:DrinkMixer-Hammer.jpg)
 This is a picture of the hammer running on the main board.

[![DrinkMixer-inside.jpg](http://eLinux.org/images/8/8e/DrinkMixer-inside.jpg)](http://eLinux.org/File:DrinkMixer-inside.jpg)
 This is an inside view of the DrinkMixer (Audio Mixer Board). It's
getting to be quite a lot of wires. This is mainly due to our PCB
restriction of a maximum of 60 square inches per PCB.

## Useful Resources

Throughout the development cycle of this project many resources were
utilized from this site as well as improved upon and/or updated.

-   [8-Bit Color STN HowTo
    Page](http://eLinux.org/Hammer_LCD_8bit_Color_STN "Hammer LCD 8bit Color STN")
-   [How to use JFFS2
    Flash](http://eLinux.org/Hammer_How_to_JFFS2_Root "Hammer How to JFFS2 Root") for the
    root partition on [Hammer\_Board](http://eLinux.org/Hammer_Board "Hammer Board")
-   [Bootloader, Kernel, Patches,
    Buildroot..](http://eLinux.org/Hammer_Board_Software_System "Hammer Board Software System")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware](http://eLinux.org/Category:Hardware "Category:Hardware")

