> From: [eLinux.org](http://eLinux.org/EVMoc "http://eLinux.org/EVMoc")


# EVM Overclocking


(Redirected from [EVMoc](http://eLinux.org/index.php?title=EVMoc&redirect=no "EVMoc"))


**Overclock in UBOOT. Be careful, this is only 'theoretical'. Check the
datasheets for suitable values. You can also underclock to save power.**

*Overlocking ARM:*

In UBOOT find the /boards/davinci.c file. In there there is a routine
called misi\_init\_r.

There you can add code to change the value pf the PLL1\_PLLM register.

*Overclocking DDR:*

Same as above, however you can set the values for PLL2\_PLLM and
PLL2\_DIV2.

*Overclocking DSP:*

\<to follow\>


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DaVinci](http://eLinux.org/Category:DaVinci "Category:DaVinci")

