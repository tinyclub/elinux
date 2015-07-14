> From: [eLinux.org](http://eLinux.org/Logic_Analyzers "http://eLinux.org/Logic_Analyzers")


# Logic Analyzers



A logic analyzer is an electronic instrument that displays signals in a
digital circuit that are too fast to be observed and presents it to a
user so that the user can more easily check correct operation of the
digital system. They are typically used for capturing data in systems
that have too many channels to be examined with an oscilloscope.
Software running on the logic analyzer can convert the captured data
into timing diagrams, protocol decodes, state machine traces, assembly
language, or correlate assembly with source-level software.

When selecting a logic analyzer, make sure that the software package
includes bus analyzers (I2C/SPI/UART are a given). Any tool worth
purchasing will include support for these.

## Contents

-   [1 Tools](#tools)
    -   [1.1 Linux](#linux)
    -   [1.2 Everyone Else](#everyone-else)
-   [2 Information](#information)

# Tools

Since logic analyzers typically need software running on your
development system, this list is split up to give preference to those
tools which are fully supported on both Windows and Linux.

## Linux

-   [BitScope](http://www.bitscope.com/):
    -   100Mhz
    -   Cheapest one looks to be around 475 USD
-   [miniLA](http://minila.sourceforge.net/) - open source hardware!
-   [Saleae](http://www.saleae.com/):
    -   8 Inputs
    -   USB 2.0
    -   24MHz max
    -   Logic analyzer with RS232, SPI, I2C and 1-Wire Protocol Analyzer
    -   Can handle 1.8V logic
        ([Spec](http://www.saleae.com/logic/specs/) mentions *Input High
        Voltage: 2 to 5.25V*, but users report that 1.8V work, too)
    -   \~149 USD
-   [Sigma2](http://www.asix.net/tools/dbg_sigma.htm)
    -   16 inputs
    -   200MHz
    -   €198

## Everyone Else

-   [Acute](http://www.acute.com.tw/)
-   [ASIX](http://tools.asix.net/dbg_sigma.htm)
-   [TechTools](http://www.tech-tools.com/dv_main.htm)
-   [LogicPort](http://www.pctestinstruments.com/):
    -   Windows only SW
    -   up to 500Mhz?
    -   \~389 USD
-   [Zeroplus](http://www.zeroplus.com.tw/logic-analyzer_en/products.php)
    (e.g. LAP-C):
    -   Can handle 1.8V logic
    -   Can do decodes of the data
    -   Around 100USD depending of the device.
    -   Some devices seems to be available with Linux software (?)

# Information

-   [http://en.wikipedia.org/wiki/Bus\_analyzer](http://en.wikipedia.org/wiki/Bus_analyzer)
-   [http://en.wikipedia.org/wiki/Logic\_analyzer](http://en.wikipedia.org/wiki/Logic_analyzer)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

