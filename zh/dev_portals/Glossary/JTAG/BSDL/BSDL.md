> From: [eLinux.org](http://eLinux.org/BSDL "http://eLinux.org/BSDL")


# BSDL



Boundary Scan Description Language (BSDL) is a subset of VHDL that is
used to describe how [JTAG](http://eLinux.org/JTAG "JTAG") (IEEE 1149.1) is implemented
in a particular device. For a device to be [JTAG](http://eLinux.org/JTAG "JTAG")
compliant, it must have an associated BSDL file. These files are often
available for download from manufacturers' websites.

[JTAG](http://eLinux.org/JTAG "JTAG") systems use the information contained in a BSDL
file to work out how to access a device in the [JTAG](http://eLinux.org/JTAG "JTAG")
chain.

BSDL files contain the following elements:

-   Entity Description: Statements naming the device or a section of its
    functionality.
-   Generic Parameter: A value such as a package type. The value may
    come from outside the current entity.
-   Port Description: Describes the nature of the pins on the device
    (input, output, bidirectional, linkage).
-   Use Statements: References external definitions (such as IEEE
    1149.1).
-   Pin Mapping(s): Maps logical signals in the device to physical pins.
-   Scan Port Identification: Defines the pins used on the device to
    access the JTAG capabilities (TDI, TDO, etc - the Test Access Port).
-   Instruction Register Description: The signals used for accessing
    JTAG device modes.
-   Register Access Description: Which register is placed between TDI
    and TDO for each JTAG instruction.
-   Boundary Register Description: List of the boundary scan cells and
    their functionality.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

