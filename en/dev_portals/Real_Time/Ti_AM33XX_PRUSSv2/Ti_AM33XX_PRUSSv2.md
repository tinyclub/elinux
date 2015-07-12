> From: [eLinux.org](http://eLinux.org/Ti_AM33XX_PRUSSv2 "http://eLinux.org/Ti_AM33XX_PRUSSv2")


# Ti AM33XX PRUSSv2





The PRUSS (Programmable Real-time Unit Sub System) consists of two
32-bit 200MHz real-time cores, each with 8KB of program memory and
direct access to general I/O. These cores are connected to various data
memories, peripheral modules and an interrupt controller for access to
the entire system-on-a-chip via a 32-bit interconnect bus.

PRUs are programmed in
[Assembly](http://en.wikipedia.org/wiki/Assembly_language), with most
commands executing in a single cycle and with no caching or pipe-lining,
allowing for 100% predictable timings. At 200MHz, most operations will
take 5ns (nanoseconds) to execute, with the exception of accessing
memory external to PRU.

## Contents

-   [1 This is a Work In Progress](#this-is-a-work-in-progress)
-   [2 Available PRU Resources](#available-pru-resources)
    -   [2.1 Per PRU](#per-pru)
    -   [2.2 Shared Between PRUs](#shared-between-prus)
    -   [2.3 Local Peripherals](#local-peripherals)
-   [3 Communication](#communication)
    -   [3.1 PRU to Host (PRU to ARM
        Cortex-A8)](#pru-to-host-pru-to-arm-cortex-a8)
    -   [3.2 Host to PRU (ARM Cortex-A8 to
        PRU)](#host-to-pru-arm-cortex-a8-to-pru)
        -   [3.2.1 Interrupts](#interrupts)
    -   [3.3 PRU to external peripherals](#pru-to-external-peripherals)
    -   [3.4 External peripherals to PRU](#external-peripherals-to-pru)
    -   [3.5 PRU to internal peripherals](#pru-to-internal-peripherals)
    -   [3.6 Internal peripherals to PRU](#internal-peripherals-to-pru)
-   [4 Loading a PRU Program](#loading-a-pru-program)
-   [5 Beaglebone PRU connections and
    modes](#beaglebone-pru-connections-and-modes)
-   [6 Assembly](#assembly)
    -   [6.1 Four instruction classes](#four-instruction-classes)
    -   [6.2 Instruction Syntax](#instruction-syntax)
-   [7 C Compiler](#c-compiler)
    -   [7.1 TI](#ti)
    -   [7.2 GCC](#gcc)
-   [8 Forth Compiler](#forth-compiler)
-   [9 Resources](#resources)
-   [10 Examples](#examples)

#### This is a Work In Progress

## Available PRU Resources

[![AM335x
PRUSS](http://eLinux.org/images/b/b1/PRUSS.png)](http://eLinux.org/File:PRUSS.png "AM335x PRUSS")

[Click here for a full list of register
mappings.](http://eLinux.org/PRUSSv2_Memory_Map "PRUSSv2 Memory Map")

### Per PRU

 8KB program memory
Memory used to store instructions and static data AKA Instruction Memory
(IRAM). This is the memory in which PRU programs are loaded.

 Enhanced GPIO (EGPIO)
High-speed direct access to 16 general purpose output and 17 general
purpose input pins for each PRU.

 PRU0
*pr1\_pru\_0\_pru\_r30[15:0]* (PRU0 Register R30 Outputs)

*pr1\_pru\_0\_pru\_r31[16:0]* (PRU0 Register R31 Inputs)

 PRU1
*pr1\_pru\_1\_pru\_r30[15:0]* (PRU1 Register R30 Outputs)

*pr1\_pru\_1\_pru\_r31[16:0]* (PRU1 Register R31 Inputs)

 Hardware capture modes
Serial 28-bit shift in and out.

Parallel 16-bit capture on clock.

[MII](http://en.wikipedia.org/wiki/Media_Independent_Interface)
standardised capture mode, used for implementing media independent Fast
Ethernet (100Mbps - 25MHz 4-bit).

 A 32-bit multiply and accumulate unit (MAC)
Enables single-cycle integer multiplications with a 64-bit overflow
(useful for decimal results).

 8KB data memory
Memory used to store dynamic data. Is accessed over the 32-bit bus and
so not single-cycle.

One PRU may access the memory of another for passing information but it
is recommend to use scratch pad or shared memory, see below.

 [Open Core Protocol](http://en.wikipedia.org/wiki/Open_Core_Protocol) (OCP) master port
Access to the data bus that interconnects all peripherals on the SoC,
including the ARM Cortex-A8, used for data transfer directly to and from
the PRU in Level 3 (L3) memory space.

### Shared Between PRUs

 Scratch pad
3 banks of 30 32-bit registers (total 90 32-bit registers).

Single-cycle access, can be accessed from either PRU for data sharing
and signalling or for individual use.

 12KB data memory
Accessed over the 32-but bus, not single-cycle.

### Local Peripherals

Local peripherals are those present within the PRUSS and not those
belonging to the entire SoC. Peripherals are accessed from PRUs over the
Switched Central Resource (SCR) 32-bit bus within the PRUSS.

Attached to the SCR bus is also an OCP slave, enabling OCP masters from
outside of the PRUSS to access these local peripherals in Level 4 (L4)
memory space.

 Enhanced Capture Model (eCAP)

Industrial Ethernet Peripheral (IEP)

 Universal Asynchronous Receiver/Transmitter (UART0)
Used to perform serial data transmission to the TL16C550 industry
standard.

16-bit FIFO receive and transmit buffers + per byte error status.

Can generate Interrupt requests for the PRUSS Interrupt Controller.

Can generate DMA requests for the EDMA SoC DMA controller.

Maximum transmission speed of 192MHz (192Mbps - 24MB/s).

## Communication

Communication between various elements of the PRUSS or the wider SoC may
take place either directly, over a bus, via interrupts or via DMA.

The following lists will expose all possible communication approaches
for each likely scenario.

For communication via interrupts, please first read the section on the
[PRUSSv2 Interrupt
Controller](http://eLinux.org/PRUSSv2_Interrupt_Controller "PRUSSv2 Interrupt Controller").

[Click here for a full list of PRUSS
Interrupts.](http://eLinux.org/PRUSSv2_Interrupts "PRUSSv2 Interrupts")

The current [example PRU
loader](https://github.com/beagleboard/am335x_pru_package/blob/master/pru_sw/app_loader/interface/prussdrv.c)
uses
[UIO](http://arago-project.org/git/projects/?p=linux-am33x.git;a=commit;h=f1a304e7941cc76353363a139cbb6a4b1ca7c737),
but this ideally should be replaced with
[remoteproc](http://omappedia.org/wiki/Category:RPMsg) rather than
poking at the registers from userspace. In the mean time, according to
[this
discussion:](https://groups.google.com/d/msg/beagleboard/gqCjxh4uZi0/_uIUD8ZF88QJ)
we can use the included script and load the uio\_pruss userspace driver.

### PRU to Host (PRU to ARM Cortex-A8)

Include the uio\_pruss kernel driver by using **modprobe uio\_pruss** or
the steps outlined above, if that does not work. Then in a project
include the header files for the am335x\_pru\_package.

       #define PRU_NUM0      0
       // Driver header file
       #include <prussdrv.h>
       #include <pruss_intc_mapping.h>

/\* Then, initialize the interrupt controller data \*/

       tpruss_intc_initdata pruss_intc_initdata = PRUSS_INTC_INITDATA;

/\* Initialize the PRU \*/

       prussdrv_init ();

/\* Get the interrupt initialized \*/

       prussdrv_pruintc_init(&pruss_intc_initdata)

/\* Execute example on PRU0 where first argument is the PRU\# and second
is the assembly to execute\*/

       prussdrv_exec_program (PRU_NUM0, "./example.bin");

/\* Wait until PRU0 sends the interrupt\*/

       prussdrv_pru_wait_event (PRU_EVTOUT_0);

/\* Clear the interrupt\*/

       prussdrv_pru_clear_event (PRU0_ARM_INTERRUPT);

The PRU (in this case 0) will have the following in the example.bin file
to trigger the interrupt:

       #define PRU0_ARM_INTERRUPT      19
       MOV       r31.b0, PRU0_ARM_INTERRUPT+16

Register 31 allows for control of the INTC for the PRU.

### Host to PRU (ARM Cortex-A8 to PRU)

#### Interrupts

Each PRU has access to host interrupt channels Host-0 and Host-1 through
register R31 bit 30 and bit 31 respectively. By probing these registers,
a PRU can determine if an interrupt is currently present on each host
channel.

To configure



### PRU to external peripherals

### External peripherals to PRU

### PRU to internal peripherals

### Internal peripherals to PRU

## Loading a PRU Program

## Beaglebone PRU connections and modes

<table>
<tbody>
<tr class="odd">
<td align="left"><strong>PRU #</strong></td>
<td align="left"><strong>R30(output) bit</strong></td>
<td align="left"><strong>Pinmux Mode</strong></td>
<td align="left"><strong>R31(input) bit</strong></td>
<td align="left"><strong>Pinmux Mode</strong></td>
<td align="left"><strong>BB Header</strong></td>
<td align="left"><strong>BB Pin Name</strong></td>
<td align="left"><strong>ZCZ BallName</strong></td>
<td align="left"><strong>Offset Reg</strong></td>
<td align="left"><strong>DT Offset</strong></td>
<td align="left"><strong>Input Mode</strong></td>
<td align="left"><strong>Output Mode</strong></td>
</tr>
<tr class="even">
<td align="left">0</td>
<td align="left">0</td>
<td align="left">Mode_5</td>
<td align="left">0</td>
<td align="left">Mode_6</td>
<td align="left">P9_31</td>
<td align="left">SPI1_SCLK</td>
<td align="left">mcasp0_aclkx</td>
<td align="left">990h</td>
<td align="left">0x190</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">0</td>
<td align="left">1</td>
<td align="left">Mode_5</td>
<td align="left">1</td>
<td align="left">Mode_6</td>
<td align="left">P9_29</td>
<td align="left">SPI1_D0</td>
<td align="left">mcasp0_fsx</td>
<td align="left">994h</td>
<td align="left">0x194</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">0</td>
<td align="left">2</td>
<td align="left">Mode_5</td>
<td align="left">2</td>
<td align="left">Mode_6</td>
<td align="left">P9_30</td>
<td align="left">SPI1_D1</td>
<td align="left">mcasp0_axr0</td>
<td align="left">998h</td>
<td align="left">0x198</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">0</td>
<td align="left">3</td>
<td align="left">Mode_5</td>
<td align="left">3</td>
<td align="left">Mode_6</td>
<td align="left">P9_28</td>
<td align="left">SPI1_CS0</td>
<td align="left">mcasp0_ahclkr</td>
<td align="left">99Ch</td>
<td align="left">0x19C</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">0</td>
<td align="left">4</td>
<td align="left">Mode_5</td>
<td align="left">4</td>
<td align="left">Mode_6</td>
<td align="left">P9_42</td>
<td align="left">(*note1)</td>
<td align="left">mcasp0_aclkr</td>
<td align="left">9A0h</td>
<td align="left">0x1A0</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">0</td>
<td align="left">5</td>
<td align="left">Mode_5</td>
<td align="left">5</td>
<td align="left">Mode_6</td>
<td align="left">P9_27</td>
<td align="left">GPIO3_19</td>
<td align="left">mcasp0_fsr</td>
<td align="left">9A4h</td>
<td align="left">0x1A4</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">0</td>
<td align="left">6</td>
<td align="left">Mode_5</td>
<td align="left">6</td>
<td align="left">Mode_6</td>
<td align="left">P9_41</td>
<td align="left">(*note2)</td>
<td align="left">mcasp0_axr1</td>
<td align="left">9A8h</td>
<td align="left">0x1A8</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">0</td>
<td align="left">7</td>
<td align="left">Mode_5</td>
<td align="left">7</td>
<td align="left">Mode_6</td>
<td align="left">P9_25</td>
<td align="left">GPIO3_21</td>
<td align="left">mcasp0_ahclkx</td>
<td align="left">9ACh</td>
<td align="left">0x1AC</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">0</td>
<td align="left">14</td>
<td align="left">Mode_6</td>
<td align="left">N/A</td>
<td align="left"></td>
<td align="left">P8_12</td>
<td align="left">GPIO1_12</td>
<td align="left">gpmc_ad12</td>
<td align="left">830h</td>
<td align="left">0x030</td>
<td align="left">N/A</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">0</td>
<td align="left">15</td>
<td align="left">Mode_6</td>
<td align="left">N/A</td>
<td align="left"></td>
<td align="left">P8_11</td>
<td align="left">GPIO1_13</td>
<td align="left">gpmc_ad13</td>
<td align="left">834h</td>
<td align="left">0x034</td>
<td align="left">N/A</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">0</td>
<td align="left">N/A</td>
<td align="left"></td>
<td align="left">14</td>
<td align="left">Mode_6</td>
<td align="left">P8_16</td>
<td align="left">GPIO1_14</td>
<td align="left">gpmc_ad14</td>
<td align="left">838h</td>
<td align="left">0x038</td>
<td align="left">0x06</td>
<td align="left">N/A</td>
</tr>
<tr class="odd">
<td align="left">0</td>
<td align="left">N/A</td>
<td align="left"></td>
<td align="left">15</td>
<td align="left">Mode_6</td>
<td align="left">P8_15</td>
<td align="left">GPIO1_15</td>
<td align="left">gpmc_ad15</td>
<td align="left">83Ch</td>
<td align="left">0x03C</td>
<td align="left">0x06</td>
<td align="left">N/A</td>
</tr>
<tr class="even">
<td align="left">0</td>
<td align="left">N/A</td>
<td align="left"></td>
<td align="left">16</td>
<td align="left">Mode_6</td>
<td align="left">P9_24</td>
<td align="left">UART1_TXD</td>
<td align="left">uart1_txd</td>
<td align="left">984h</td>
<td align="left">0x184</td>
<td align="left">0x06</td>
<td align="left">N/A</td>
</tr>
<tr class="odd">
<td align="left">1</td>
<td align="left">0</td>
<td align="left">Mode_5</td>
<td align="left">0</td>
<td align="left">Mode_6</td>
<td align="left">P8_45</td>
<td align="left">GPIO2_6</td>
<td align="left">lcd_data0</td>
<td align="left">8A0h</td>
<td align="left">0x0A0</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">1</td>
<td align="left">Mode_5</td>
<td align="left">1</td>
<td align="left">Mode_6</td>
<td align="left">P8_46</td>
<td align="left">GPIO2_7</td>
<td align="left">lcd_data1</td>
<td align="left">8A4h</td>
<td align="left">0x0A4</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">1</td>
<td align="left">2</td>
<td align="left">Mode_5</td>
<td align="left">2</td>
<td align="left">Mode_6</td>
<td align="left">P8_43</td>
<td align="left">GPIO2_8</td>
<td align="left">lcd_data2</td>
<td align="left">8A8h</td>
<td align="left">0x0A8</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">3</td>
<td align="left">Mode_5</td>
<td align="left">3</td>
<td align="left">Mode_6</td>
<td align="left">P8_44</td>
<td align="left">GPIO2_9</td>
<td align="left">lcd_data3</td>
<td align="left">8ACh</td>
<td align="left">0x0AC</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">1</td>
<td align="left">4</td>
<td align="left">Mode_5</td>
<td align="left">4</td>
<td align="left">Mode_6</td>
<td align="left">P8_41</td>
<td align="left">GPIO2_10</td>
<td align="left">lcd_data4</td>
<td align="left">8B0h</td>
<td align="left">0x0B0</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">5</td>
<td align="left">Mode_5</td>
<td align="left">5</td>
<td align="left">Mode_6</td>
<td align="left">P8_42</td>
<td align="left">GPIO2_11</td>
<td align="left">lcd_data5</td>
<td align="left">8B4h</td>
<td align="left">0x0B4</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">1</td>
<td align="left">6</td>
<td align="left">Mode_5</td>
<td align="left">6</td>
<td align="left">Mode_6</td>
<td align="left">P8_39</td>
<td align="left">GPIO2_12</td>
<td align="left">lcd_data6</td>
<td align="left">8B8h</td>
<td align="left">0x0B8</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">7</td>
<td align="left">Mode_5</td>
<td align="left">7</td>
<td align="left">Mode_6</td>
<td align="left">P8_40</td>
<td align="left">GPIO2_13</td>
<td align="left">lcd_data7</td>
<td align="left">8BCh</td>
<td align="left">0x0BC</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">1</td>
<td align="left">8</td>
<td align="left">Mode_5</td>
<td align="left">8</td>
<td align="left">Mode_6</td>
<td align="left">P8_27</td>
<td align="left">GPIO2_22</td>
<td align="left">lcd_vsync</td>
<td align="left">8E0h</td>
<td align="left">0x0EO</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">9</td>
<td align="left">Mode_5</td>
<td align="left">9</td>
<td align="left">Mode_6</td>
<td align="left">P8_29</td>
<td align="left">GPIO2_23</td>
<td align="left">lcd_hsync</td>
<td align="left">8E4h</td>
<td align="left">0x0E4</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">1</td>
<td align="left">10</td>
<td align="left">Mode_5</td>
<td align="left">10</td>
<td align="left">Mode_6</td>
<td align="left">P8_28</td>
<td align="left">GPIO2_24</td>
<td align="left">lcd_pclk</td>
<td align="left">8E8h</td>
<td align="left">0x0E8</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">11</td>
<td align="left">Mode_5</td>
<td align="left">11</td>
<td align="left">Mode_6</td>
<td align="left">P8_30</td>
<td align="left">GPIO2_25</td>
<td align="left">lcd_ac_bias_en</td>
<td align="left">8ECh</td>
<td align="left">0x0EC</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">1</td>
<td align="left">12</td>
<td align="left">Mode_5</td>
<td align="left">12</td>
<td align="left">Mode_6</td>
<td align="left">P8_21</td>
<td align="left">GPIO1_30</td>
<td align="left">gpmc_csn1</td>
<td align="left">880h</td>
<td align="left">0x080</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">13</td>
<td align="left">Mode_5</td>
<td align="left">13</td>
<td align="left">Mode_6</td>
<td align="left">P8_20</td>
<td align="left">GPIO1_31</td>
<td align="left">gpmc_csn2</td>
<td align="left">884h</td>
<td align="left">0x084</td>
<td align="left">0x06</td>
<td align="left">0x25</td>
</tr>
<tr class="odd">
<td align="left">1</td>
<td align="left">N/A</td>
<td align="left"></td>
<td align="left">16</td>
<td align="left">Mode_6</td>
<td align="left">P9_26</td>
<td align="left">UART1_RXD</td>
<td align="left">uart1_rxd</td>
<td align="left">980h</td>
<td align="left">0x180</td>
<td align="left">0x06</td>
<td align="left">NA</td>
</tr>
</tbody>
</table>

    *Note1: The PRU0 Registers{30,31} Bit 4 (GPIO3_18) is routed to P9_42-GPIO0_7 pin.  You MUST set GPIO0_7 to input mode in pinmuxing.

    *Note2: The PRU0 Registers{30,31} Bit 6 (GPIO3_20) is routed to P9_41-GPIO0_20(CLKOUT2). You must set GPIO0_20 to input mode in pinmuxing.

## Assembly

The complete list of PRU assembly instructions can be found [at
TI](http://processors.wiki.ti.com/index.php/PRU_Assembly_Instructions).

### Four instruction classes

-   Arithmetic
-   Logical
-   Flow Control
-   Register Load/Store

### Instruction Syntax

-   Mnemonic, followed by comma separated parameter list
-   Parameters can be a register, label, immediate value, or constant
    table entry
-   Example
    -   SUB r3, r4, 10
    -   Subtracts immediate value 10 (decimal) from the value in r4 and
        then places the result in r3 (or r3 = r4 - 10)

## C Compiler

### TI

-   [TI C Compiler
    download](http://software-dl.ti.com/codegen/non-esd/downloads/download.htm#PRU)
-   [TI Code Composer Studio](http://www.ti.com/tool/ccstudio-sitara)
-   [CCS PRU compiler release discussion on Element14
    site](http://www.element14.com/community/community/knode/single-board_computers/next-gen_beaglebone/blog/2014/04/30/bbb--pru-c-compiler)

### GCC

-   [GCC C wiki](https://github.com/dinuxbg/gnupru/wiki)
-   [GCC C compiler source](https://github.com/dinuxbg/gnupru)
-   [GCC C compiler
    announcement](https://groups.google.com/forum/#!topic/beagleboard/hC5OwPXuSmQ)

## Forth Compiler

-   [Forth for PRU](https://github.com/biocode3D/prufh)

## Resources

-   [PRU
    FAQ](https://groups.google.com/forum/?fromgroups#!topic/beagleboard/u28ytaoNenU)
-   [AM335x PRU support package on
    Github](https://github.com/beagleboard/am335x_pru_package)
-   [AM335x PRU-ICSS Reference
    Guide](https://github.com/beagleboard/am335x_pru_package/blob/master/am335xPruReferenceGuide.pdf?raw=true)
-   The documentation on the subsystem is
    [here](http://eLinux.org/images/6/65/Spruh73c.pdf "Spruh73c.pdf"). TI does not
    support this subsystem and all questions/inquires/problems should be
    directed to the community.
-   Example for the first PRU version (Ti AM18XX and other DSP)
    [http://www.ti.com/tool/sprc940](http://www.ti.com/tool/sprc940)
-   [Element14 write-up on using
    PRU](http://www.element14.com/community/community/knode/single-board_computers/next-gen_beaglebone/blog/2013/05/22/bbb--working-with-the-pru-icssprussv2)

-   [PRU assembly syntax highlighting for TextMate, Sublime Text,
    etc.](https://github.com/sagedevices/ti-pruv2-assembly-textmate-bundle)

-   A userspace [debugging
    utility](https://docs.google.com/file/d/0B80aJokrBccAV1paMTU0bjM1OXc/edit?usp=sharing)
    with credit to PRU\_EVTOUT\_2 from the \#beagle IRC channel.
-   ncurses based debugger work has started at
    [here](https://github.com/wz2b/prude).
-   A classic CLI debugger is available on SourceForge called
    [prudebug](http://sourceforge.net/projects/prudebug).
-   For using the Open Core Protocol to [access external
    memory](http://nomel.org/post/30006622413/beaglebone-tutorial-accessing-main-memory-from-the-pru)
    from the PRU.
-   Jason Kridner's presentation at Pumping Station: One -
    [video](http://videos.pumpingstationone.org/video/27/real-time-programming-with-beaglebone-prus)
    [slides](http://beagleboard.org/static/PumpingStationOne20140628_Real-timeProgrammingWithBeagleBonePRUs.pptx.pdf)

## Examples

-   [BeagleBone\_6502\_RemoteProc\_cape](http://eLinux.org/BeagleBone_6502_RemoteProc_cape "BeagleBone 6502 RemoteProc cape")
-   [BeagleBone Nixie Cape PRU
    App](https://github.com/mranostay/beagle-nixie)
-   [PRU Soft UART
    Driver](http://processors.wiki.ti.com/index.php/Soft-UART_Implementation_on_AM335X_PRU_-_Software_Users_Guide)
-   [PRU Projects](http://processors.wiki.ti.com/index.php/PRU_Projects)
-   [SPI ADC](http://exploringbeaglebone.com/chapter13/#prettyPhoto)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [ECE497](http://eLinux.org/Category:ECE497 "Category:ECE497")
-   [BeagleBone](http://eLinux.org/index.php?title=Category:BeagleBone&action=edit&redlink=1 "Category:BeagleBone (page does not exist)")
-   [PRU](http://eLinux.org/Category:PRU "Category:PRU")

