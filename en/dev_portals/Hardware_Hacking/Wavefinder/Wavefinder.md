> From: [eLinux.org](http://eLinux.org/Wavefinder "http://eLinux.org/Wavefinder")


# Wavefinder



## Contents

-   [1 DABUSB Wavefinder Information - Version
    0.5](#dabusb-wavefinder-information-version-0-5)
    -   [1.1 Todo](#todo)
    -   [1.2 Hardware](#hardware)
        -   [1.2.1 Main section (under shielding on USB cable
            side)](#main-section-under-shielding-on-usb-cable-side)
        -   [1.2.2 Radio section (large shield on reverse
            side)](#radio-section-large-shield-on-reverse-side)
        -   [1.2.3 Other bit (small shield on reverse
            side)](#other-bit-small-shield-on-reverse-side)
        -   [1.2.4 Power Regulation and Management (Revised
            22/11/02)](#power-regulation-and-management-revised-22-11-02)
        -   [1.2.5 SL11R microcontroller](#sl11r-microcontroller)
    -   [1.3 General software tools](#general-software-tools)
        -   [1.3.1 Psion's Wavefinder
            software](#psion-s-wavefinder-software)
            -   [1.3.1.1 Files](#files)
        -   [1.3.2 Snoopy/SnoopyPro](#snoopy-snoopypro)
    -   [1.4 Custom software tools](#custom-software-tools)
        -   [1.4.1 Dabble](#dabble)
        -   [1.4.2 PAD extraction](#pad-extraction)
        -   [1.4.3 wlights](#wlights)
        -   [1.4.4 wboot](#wboot)
        -   [1.4.5 wfic](#wfic)
        -   [1.4.6 FICDEC](#ficdec)
        -   [1.4.7 Quick and dirty DSP
            dissasembler](#quick-and-dirty-dsp-dissasembler)
    -   [1.5 Specifications](#specifications)
    -   [1.6 USB Protocol](#usb-protocol)
        -   [1.6.1 Startup](#startup)
        -   [1.6.2 LEDs](#leds)
        -   [1.6.3 Tuning Datastream](#tuning-datastream)
        -   [1.6.4 Automatic Frequency
            Control](#automatic-frequency-control)
        -   [1.6.5 Main datastream - processing data
            blocks](#main-datastream-processing-data-blocks)
        -   [1.6.6 Command list](#command-list)
    -   [1.7 Other links](#other-links)
        -   [1.7.1 GNU Radio](#gnu-radio)

# DABUSB Wavefinder Information - Version 0.5

Wavefinder is a software-defined DAB radio designed jointly between
Psion, RadioScape, Roke, Lost Wax and Real Networks; and marketed by
Psion Infomedia circa year 2000. Wavefinder was originally a
Windows-only product - the eventual aim of this project is to develop
Free/Open Source GNU/Linux software, drivers and firmware suitable for
controlling the Wavefinder from an embedded Linux platform such as the
[BeagleBoard](http://eLinux.org/BeagleBoard "BeagleBoard").

In the future it might even be possible to replace the Wavefinder
hardware with [Open
Hardware](http://en.wikipedia.org/wiki/Category:Open_hardware) that
takes advantage of modern highly integrated ICs (such as the TEMIC
U2731B / Atmel ATR2731 or the Hitachi HD155080 tuner ICs) and using the
DSP onboard the OMAP IC rather than 2x5402s.

## Todo

-   Remove any rubbish that's been superseded (ie. stuff we've figured
    out since).

## Hardware

### Main section (under shielding on USB cable side)

-   2x [TMS320VC5402](http://www-s.ti.com/sc/ds/tms320vc5402.pdf) -
    Texas Instruments 16 bit 5402 DSPs, DVC 5402GGU CD-0AA19DW
-   [ScanLogic
    SL11R-100](http://www.cypress.com/cfuploads/img/products/SL11R.pdf)
    - USB controller / 16 bit RISC processor ([User
    Manual](http://www.intel-u-press.com/usb_dbe/AppendixA/Micros/SL11Rum.pdf))
-   2x
    [K6R1016V1C](http://www.samsungelectronics.com/semiconductors/SRAM/High_Speed/Asynch_Fast/1M_bit/K6R1016V1C/ds_k6r1016v1c.pdf)
    - 64K x 16 Bit High-Speed CMOS Static RAM(3.3V Operating)
-   [ADC1173](http://www.national.com/ds/AD/ADC1173.pdf) EM06AB - 8 bit
    3V 15MSPS 33mW A/D converter
-   [MAX5541](http://pdfserv.maxim-ic.com/arpdf/MAX5541.pdf) - 16 bit
    serial DAC
-   [LMC6462BIM](http://www.national.com/ds/LM/LMC6462.pdf) - Dual Rail
    to Rail Op-Amp
-   [TL431](http://www.onsemi.com/pub/Collateral/TL431-D.PDF) -
    Programmable Precision Reference
-   2x [LCX74PDXP](http://www.fairchildsemi.com/ds/74/74LCX74.pdf) -
    Dual D-type Flipflop
-   [HCT244](http://www-us.semiconductors.philips.com/acrobat/datasheets/74HC_HCT244_CNV_2.pdf)
    - 8 bit buffer
-   [XILINX
    XCR3128A](http://direct.xilinx.com/bvdocs/publications/ds016.pdf) -
    Coolrunner
    [PLD](http://direct.xilinx.com/bvdocs/publications/ds012.pdf)
    (programmable logic device)
-   [IDT QS3VH245Q](http://www.idt.com/docs/QS3VH245_DS_49165.pdf)
    XQ0041D - 8-bit bus switch
    ([link](http://www.idt.com/products/pages/Bus_Switches-QS3VH245.html))
-   [NC7S04](http://www.fairchildsemi.com/ds/NC/NC7S04.pdf) - Single
    CMOS inverter (marked 7S04)
-   48.000 MHz Crystal Oscillator / sytem clock
-   16.384 MHz device, marked 0047SM1. Reference clock?

The two [TI 5402](http://www-s.ti.com/sc/ds/tms320vc5402.pdf) DSPs
provide about 200 MIPS of grunt. According to press releases from TI
([link](http://www.ti.com/sc/docs/news/2001/01002.htm),
[link](http://www.ti.com/sc/docs/news/2000/00082.htm)), these perform a
limited amount of demodulation/decoding of the raw RF signal. More
recent designs as used in the ModularTech PCI card, perform much more of
the decoding on-board using a TMS320DRE200 (or TMS320C5416) DSP, and
less on the host PC.

### Radio section (large shield on reverse side)

-   [LMX2331](http://www.national.com/ds/LM/LMX2330A.pdf) - Freq
    synthesiser or PLL (2 GHz & 510 MHz)
-   [LMX1511](http://www.national.com/ds/LM/LMX1501A.pdf) - Freq
    synthesiser or PLL (1.1 GHz)
-   [Hitachi
    HWSD231](http://www.datasheetarchive.com/pdf-datasheets/Datasheets-13/DSA-245380.pdf)
    - 38.912 MHz SAW filter ([product
    page](http://www.hitachi-media-el.co.jp/products/saw1_e.html),
    [product
    page](http://www.hitachi-media-el.co.jp/products/saw1_e.html))

### Other bit (small shield on reverse side)

-   [24LC16B](http://www.microchip.com/download/lit/pline/memory/ic/21703b.pdf)
    - 2Kx8 Serial EEPROM (prob interfaced to USB controller)
-   [MAX1692](http://pdfserv.maxim-ic.com/arpdf/MAX1692.pdf) -
    Low-Noise, 5.5V Input, PWM Step-Down Regulator (marked 1692 EUB)
-   [Si9424DY](http://www.fairchildsemi.com/ds/SI/SI9424DY.pdf) -
    P-channel 20V (D-S) mosfet (marked 9424 JZA Y02C)

### Power Regulation and Management (Revised 22/11/02)

There is a plethora of power supply devices. It looks like a MAX1692 PWM
regulator (rated 600mA) provides a 3.3V supply from the USB 5V supply.
This almost certainly provides the power for the SL11R and probably the
DSPs and Xilinx chip as well. It also feeds an adjustable linear
regulator set to 1.8V
([LM1117MPX-ADJ](http://www.national.com/ds/LM/LM1117.pdf) - SOT223
package marked 'NO3A') which probably forms the core supply for the
TMS320C5402's. There is also a mosfet (the Si9424) which appears to
switch the unregulated power from the mains unit to a
[ZSR800](http://www.zetex.co.uk/3.0/pdf/ZSR.pdf) 8V linear regulator
which supplies a [ZSR500](http://www.zetex.co.uk/3.0/pdf/ZSR.pdf) 5V
linear regulator. This regulator chain looks like it supplies the RF
section (and, of course, the (in)famous LEDs). There is also a
[TPS76338](http://www-s.ti.com/sc/ds/tps76338.pdf) 3.3V linear regulator
(the SOT23-5 package marked 'PBEI'). This is fed directly from the
Si9424 mosfet and here we see a (the?) reason for the Wavefinder's poor
reliability. The [TPS76338](http://www-s.ti.com/sc/ds/tps76338.pdf) has
a maximum input voltage of 10V according to the data sheet and that is
what the loaded unregulated supply provides - this means that this
regulator is operating at the edge of its specifications and is liable
to fail - or at least it had on mine! The reason whoever designed it
used a 10V PSU is that the
[ZSR800](http://www.zetex.co.uk/3.0/pdf/ZSR.pdf) has a minimum input
voltage requirement of 10V. Why the
[TPS76338](http://www-s.ti.com/sc/ds/tps76338.pdf) isn't fed from either
the [ZSR800](http://www.zetex.co.uk/3.0/pdf/ZSR.pdf) or the
[ZSR500](http://www.zetex.co.uk/3.0/pdf/ZSR.pdf) I don't know - they're
both rated at 200mA.



### SL11R microcontroller

The SL11R's memory map:

    Int RAM       0000-0BFF (3k)
    Ext RAM       0C00-7FFF (29k)
    Ext Pg.1/DRAM 8000-9FFF (8k)
    Ext Pg.2/DRAM A000-BFFF (8k)
    Mem map reg   C000-C0FF (256b)
    Ext ROM       C100-E7FF (9984b)
    Int ROM       E800-FFFF (6k)

It seems that the memory mapped registers (0xC000-0xC0FF) are mapped
directly from USB commands such as "e6 c0 00 00", etc. The processor is
16-bit, and data words are sent LSB first. This holds true for commands
with the first word being in the range (0xC000-0xC0FF). It \*may\* be
that some of the other commands are writing direct to memory.

## General software tools

### Psion's Wavefinder software

The basis for reverse-engineering the Wavefinder, the Psion software
provides the libraries used by any of the Wavefinder control software
(e.g. native Psion software, DABBar, etc.). It also provides an API for
use by custom programs such as Dabble (extrememly useful when combined
with hooking the DLL functions).

#### Files

-   **rsDSP[*ab*].bin** - contain the DSP code. The data from both of
    these files is sent to the Wavefinder at startup.
-   **rsCPU*\**.dll** - different version of CPU-intensive code for
    different processors
-   **ViadabReceiver.dll** - lots of stuff, including LED control code

### Snoopy/SnoopyPro

This is a USB sniffer, logging all tranfers over the USB bus related to
particular devices.

## Custom software tools

### Dabble

Dabble uses the Radioscape API to control the Wavefinder while hooking
some DLLs. This allows the behaviour of the supplied Wavefinder software
and what it sends over the USB bus to be studied. (maybe something on
interpreting dabble output)

### PAD extraction

Kristoff Bonne has written a PAD extractor. pad\_decode and tdc\_decode.
([url](http://mccb.be.eu.org/leden/krbonne/dab/dab_streamdecoder-0.0.2.tar.gz))
(add more details)

### wlights

Controls the Wavefinder's LEDs independently of the Radioscape DLLs.

### wboot

Further development of the wlights code so that now it will bootup the
wavefinder, download the DSP code, tune it to 'something', and collect
all the data returned. No real attempt so far to understand the content
of the data streams, other than the semi-obvious.

**find\_wavefinder()** - Now uses some setupapi calls to find the
wavefinder driver, based on its GUID. My PC seems to like both
{96cb3fae-594e-11d3-b317-00e02914a689} and {a5dcbf10-6530-11d2-901f-
00c04fb951ed} - quite where these come from, I'm not sure, but the
{a5dcbf10-... one matches one posted to the list, so it must be
wavefinder specific. Hopefully, this code should now find any wavefinder
driver, on any USB port ... **init\_wavefinder()** - Trundles through
the API calls captured by dabble. (see startup, below)

A few threads are kicked off - one to cycle the LEDS, one to control the
frontend, and one to collect the main data: **lights\_thread()** -
updates all 3 LEDS every 100ms - takes a 12 bit value, 0x3ff = dim,
0x001=bright **tune\_thread()** - This is where things get serious... A
few commands are issued, then 0x800 bytes are returned from wavefinder.
This data appears to be the raw output from the ADC in the tuner
frontend - plot it, and you'll see. The VIADAB code, then performs a
series of DSP functions - applies the Hamming window; fft's etc. I guess
this is the tuner synchronisation, and feedback from these calculations
gets fed back to keep the tuner locked. It also seems to calulate its
BER from this data. This is what we need to understand more to control
the fine tuning ourselves. **data\_thread()** - This is also quite
serious ... This thread is kept in sync with the tuner thread, and
returns blocks of data (0x200 bytes), with a big discontinuity at 0x180
bytes. My guess is that this is the output of the IFFT performed by the
DSP chip. (more detail based on wfic) The whole data stream is not
returned - so the parameters sent each time round the loop by the
tune\_thread, must select which what services are being received. Since
no sensible data is being sent back to wavefinder in wboot, the
data\_thread is likely to return garbage. But, if you run dabble, you
get the same 2 distinct data streams.



### wfic

Extract FIC data from Dabble4 logs, for later processing with FICDEC.

### FICDEC

[FICDEC](http://www.esslinger.de/download/ficdec.htm)

### Quick and dirty DSP dissasembler

A partial DSP dissasembler for the TI 5402 DSP code has been written,
but further work on this is not expected to be fruitful.

## Specifications

-   ETS 300 401 (AKA "radio broadcasting systems; digital audio
    broadcasting (DAB) to mobile, portable and fixed receivers").

(add links to above)

## USB Protocol

    Commands are sent using dwIOControlCode = 0x80002018
    Data is retrieved using dwIOControlCode = 0x22000c, 0x220010, 0x2200014

    USB Setup Data
        bmRequestType = 0x40 - Write
        bmRequestType = 0xc0 - Read

    bRequest = 1        command/data to DSP_A
        wValue = 0x0000
        wIndex = 0x0080
        wLength = 0x40
        *data = <data>

    bRequest = 2        command/data to DSP_B
        wValue = 0x0000
        wIndex = 0x0080
        wLength = 0x40
        *data = <data>

    bRequest = 3        command/data to SR11R
        wValue = register address, e.g. red LED = 0xc0f4
        wIndex = register value
        wLength = 0x04,
        *data = <addr> <value>

    bRequest = 4        Frequency Synthesiser
        wValue = 0x0000
        wIndex = 0x0000
        wLength = 0x0c
        *data = <data>

    bRequest = 5        AFC, Symbol Selection
        wValue = 0x0000
        wIndex = 0x0000
        wLength = 0x20
        *data = <data>



### Startup

    (skip select_config stuff)
    (skip first vendor_device packet, 64 bytes)

    ; initialise everything to zero
    e6 c0 00 00 : 0xc0e6 : PWM control reg
    e8 c0 ff 03 : 0xc0e8 : Max counter reg
    ea c0 00 00 : 0xc0ea : PWM start ch.0 reg (0)
    ec c0 00 00 : 0xc0ec : PWM stop  ch.0 reg (0)
    ee c0 00 00 : 0xc0ee : PWM start ch.1 reg (0)
    f0 c0 00 00 : 0xc0f0 : PWM stop  ch.1 reg (0)
    fa c0 ff 03 : 0xc0fa : PWM cycle count - 1 (1024)
    f2 c0 00 00 : 0xc0f2 : PWM start ch.2 reg (0)
    f4 c0 00 00 : 0xc0f4 : PWM stop  ch.2 reg (0)
    f6 c0 00 00 : 0xc0f6 : PWM start ch.3 reg (0)
    f8 c0 00 00 : 0xc0f8 : PWM stop  ch.3 reg (0)

    ; initialise PWM counter registers
    ea c0 00 00 : 0xc0ea : PWM start ch.0 reg (0)
    ec c0 ff 02 : 0xc0ec : PWM stop  ch.0 reg (0x02ff)
    f0 c0 ff 02 : 0xc0f0 : PWM stop  ch.1 reg (0x02ff)
    f4 c0 ff 03 : 0xc0f4 : PWM stop  ch.2 reg (0x03ff)
    f8 c0 ff 03 : 0xc0f8 : PWM stop  ch.3 reg (0x03ff)
    f0 c0 ff 03 : 0xc0f0 : PWM stop  ch.1 reg (0x03ff)

    ; initialise PWM control
    e6 c0 0f 80 : 0xc0e6 : PWM control register


    ; initialise frequency synthesiser????
    ; or these might be the wLength=0x0c ones, as these occur just after dabble prints out "About to tune ..."
    28 c0 e0 3d : 0xc028 : I/O control register 1
    20 c1 00 00 : ??????
    20 c1 ff ff : ??????
    24 c0 00 38 : 0xc024 : Output control register 1
    1e c0 00 00 : 0xc01e : Output data register 0
    24 c0 00 30 : 0xc024 : Output control register 1
    24 c0 00 38 : 0xc024 : Output control register 1
    14 c1 e0 00 00 00 : ??????
    . . .
    . . .
    . . .

PWM Control Register = 0x800f = b1000 0000 0000 1111 which basically
means it's set to begin operation, at 48MHz, continuous repeat (rather
than one-shot), active low, enabled.

### LEDs

The LEDs are controlled via the SL11R's built-in PWM controlled pins (of
which there are four, though only three are used). The PWM pins are
setup during initialisation (see above).

Colours are sent via the commands (or similar):

    f4 c0 xx 00 (for red)
    f8 c0 xx 00 (for green)
    f0 c0 xx 00 (for blue)

with xx being the intensity (or at least the value passed to the command
line of wlights). (can probably add more here, we know a lot more about
the leds than this now)



### Tuning Datastream

The frequency is set by a set of 6 'req=4' commands. The first five
always seem to be the same; the last one varies dependant on the
frequency. The wtune code just calculates the value for the last
command.

    e.g.
    About to tune radio frequency to 225.648000
    req=04, val=0000, idx=0000, len=000c  10 08 10 00 16 00 00 00 00 00 00 10
    req=04, val=0000, idx=0000, len=000c  22 63 34 00 16 00 00 00 00 00 00 10
    req=04, val=0000, idx=0000, len=000c  10 08 00 00 16 00 00 00 00 00 00 10
    req=04, val=0000, idx=0000, len=000c  82 02 20 00 16 00 00 00 00 00 00 10
    req=04, val=0000, idx=0000, len=000c  11 80 00 00 10 00 01 00 00 00 00 10
    req=04, val=0000, idx=0000, len=000c  04 a2 03 00 13 00 01 00 00 00 00 10
                                          ^         ^
                                          \---------/

    -> tune(225.648000), x1=1022e, x2=3a204
    the 4 bytes calculated are 0x04, 0xa2, 0x03, 0x00

These values are presumably sent the to frequency synth. PLL (LMX2331U);
but I've not tried to figure out the actual meanings of the parameters.



* * * * *

I've also been monitoring the 'req=5' commands that are sent by the
tune\_thread. e.g. cmd=5, value=007f, index=7fff ffff ffff fff8 0000
0000 0000 0000 0000 0000 ff00 056c 0011 0000 000f 0000

The 1st 4 words (0x7fff ffff ffff ffff8) may control which symbols are
transferred, but normally I see these values. Sometimes, if the tuner
cannot lock (bad freq, or no reception), I see something like (1111 1111
1111 1111) which possibly resets the null symbol synchroniser. The last
but few words (056c, 0011) are probably the AFC. If there is no
reception or lock then these values are constant. If it is tuned, then
they vary slowly, presumably causing the AFC circuit to adjust the
frequency to hold the tuner in lock. - onward and upwards ...

The wavefinder return a block of 0x20c bytes per symbol received. Not
all symbols per frame are passed accross the USB interface - only those
selected by a 'req=5' command (precise format of this command is still
TBD).

### Automatic Frequency Control

The biggest missing bit is the AFC control. I figured out how to send
the required frequency to the frequency synthesiser, but to complete the
tuning, the frequency must be phase locked fairly precisely in order to
ensure that each of the carriers end up in the middle of the FFT bin.
This is a 2 stage process. The acquisistion phase achieves a course
lock, by performing a sequence of correlations of the received phase
reference symbol against a locally constructed phase reference symbool.
By sliding the local symbol, and performing a correlation for each
position, a course offset value can be determined. I can do the
correlation, but I don't yet know how to feed the result back to the
wavefinder. The acquisition phase can reduce the phase offset (too many
phases here ...) to within 1 carrier (1 FFT bin). Once this phase offset
has been reduced, the system enters a tracking phase, to provide fine
adjustment. This seems to invlove a further correlation, and then uses a
moving average to further adjust the frequecy. This process should be
able to track any frequency drift, and reduce the phase error to \< 1
carrier - i.e centre the sample point to the middle of the carrier. As
with the acquisition, I do not as yet have a complete understanding of
how the analysis is converted to the value that is sent back to the
wavefinder.



### Main datastream - processing data blocks

My current thought is that the DSP may also do the demodulation as well
as the FFT. This is mainly based on the amount of data that is returned.
For each symbol, we get back 1 block of data (0x200) bytes, of which the
last 0x80 bytes is a replica of the first 0x80 bytes of a previous
symbol - this must be the effect of the guard band. That leaves 0x180
bytes per symbol. A symbol is based on 1536 (0x600) carriers; so that
only allows 2 bits per carrier. So, either the data is 2 bits per fft
bin, or the fft output has been further processed. The header for each
data block indicates which symbol it is for. Symbol 0 (the NULL symbol)
seems to be returned for all frames. Sometimes I also get 0x12-0x3d;
somtimes I only get 2,3,4. 2,3,4 are the FIC; higher numbers are the
MSC.

The data returned appears to consist of a 12 byte header that identifies
the symbol number, then 0x180 bytes of 'useful' data, then a further
0x80 bytes of 'useless' data (which is presumably due to the guard
band).

        byte 0 : 0x0c
        byte 1 : 0x62
        byte 2 : <symbol>
        byte 3 : <frame number, 00-1f>
        byte 4 : 0xb9 / 0xbd / 0xbe / 0xbf
        byte 5 : 0x20 / 0x10
        byte 6 : 0x01
        byte 7 : 0x00
        byte 8 : 0x80
        byte 9 : 0x01
        byte 10 : 0x00
        byte 11 : 0x00 / 0x80

The 0x180 bytes of symbol data is the result of some processing by the
DSPs.
 The DSPs take in data from the ADC, perform a 2048 point FFT, then
perform differential demodulation. The data transfered over the USB is
the resulting OFDM complex symbols.
 These are transferred as 16 bit words. Care needs to be take to process
this data in the correct order - aren't big/little endian issues a right
pain...

    e.g for the returned data : 0c 62 02 00 b9 20 01 00 80 01 00 00 6e 12 32 ...
                                <-----    12 byte header     -----> <----- symbol data ...


        6e 12 - 0 1 1 0 1 0 0 0    0 0 0 1 0 0 1 0
                                           | | | |
                                           | | | \__  real QPSK symbol 0
                                           | | \____  imag QPSK symbol 0
                                           | \______  real QPSK symbol 1
                                           \________  imag QPSK symbol 1

The symbol data must then be processed accroding to EN 300-401. These
steps are:

-   **Frequency Deinterleaving** - Each of the 1536 QPSK complex symbols
    is transmitted on a different carrier. Theses are reordered before
    transmission. This process needs to be reversed.
-   **Symbol Demapping** - The 1536 QPSK symbols are derived from 3072
    OFDM symbols. This process is reversed here.
-   **Depuncturing** - Extra zero's are added to the data stream
    according to the puncturing pattern.
-   **Viterbi Decoding** - The Viterbi decoder attempts to correct any
    errors in the data stream, using the redundancy that was added
    before transmission. Approx. 3 x more data is transmitted than is
    required.
-   **Descrambling** - The data is scrambled to produce a similar number
    of 1's and 0's.

### Command list

(perhaps we should put together a full list of USB commands and packets
and what they do)

## Other links

### GNU Radio

-   [GNU Radio](http://www.gnu.org/software/gnuradio/) is a project to
    write a Software Defined Radio (SDR). Basically, they have hooked up
    a cable-TV downconverter to a wideband ADC (a \$1000 PCI-card...)
    and are then trying to do stuff with the baseband signal in
    software.
-   [DAB ETSI
    Standards](http://webapp.etsi.org/WorkProgram/Frame_WorkItemList.asp?butExpertSearch=++Search++&qETSI_STANDARD_TYPE=&qETSI_NUMBER=&qTB_ID=&qINCLUDE_SUB_TB=True&includeNonActiveTB=FALSE&qWKI_REFERENCE=&qTITLE=dab&qSCOPE=&qCURRENT_STATE_CODE=&qSTOP_FLG=N&qSTAR)
-   [DAB Standards](http://www.eurekadab.org/Standards.htm)
-   [TPEG
    Specifications](http://www.ebu.ch/departments/technical/broadcast_technology/b_tpeg_project.php)
-   [Good DAB Articles](http://www.ebu.ch/trev_index-dab.html)
-   [BBC MOT Webpages](http://www.bbc.co.uk/rd/projects/mot/home.html)
-   [BBC TPEG Webpages](http://www.bbc.co.uk/rd/projects/tpeg/)
-   [VIADAB
    Specification](http://www.radioscape.com/extranet_copy/axDownloads/Viadab.pdf)
-   [2 API.pdf VIADAB 2
    Specification](http://www.radioscape.com/extranet_copy/axDownloads/VIADAB)
-   [DABUSB](http://dab.cs.tum.edu/)
-   [Wavefinder
    FAQ](http://www.andante.pwp.blueyonder.co.uk/wavefinder/)
-   [DABbar](http://www.dabbar.co.uk)
-   [Yahoo DABUSB](http://groups.yahoo.com/group/dabusb)
-   [alt.radio.digital](http://groups.google.co.uk/groups?hl=en&group=alt.radio.digital)
-   [Rhode & Scwartz DAB COFDM
    Generator](http://www.signalgeneration.rohde-schwarz.com/www/dev_center.nsf/html/1117116down)
-   (many more on DABUSB Yahoo group bookmarks)



* * * * *

Original editor: Matthew Burnham
 Last updated 31 May 2009 by md84419


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [BeagleBoard](http://eLinux.org/Category:BeagleBoard "Category:BeagleBoard")

