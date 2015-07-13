> From: [eLinux.org](http://eLinux.org/PRUSSv2_Memory_Map "http://eLinux.org/PRUSSv2_Memory_Map")


# PRUSSv2 Memory Map



## Contents

-   [1 Local Data Memory Map](#local-data-memory-map)
-   [2 Global Memory Map](#global-memory-map)
-   [3 CFG Register Map](#cfg-register-map)
    -   [3.1 PRUSS\-CFG Register](#pruss-cfg-register)

## Local Data Memory Map

The following memory mappings may only be used from within the PRUSS.

<table>
<thead>
<tr class="header">
<th align="left">Start Address</th>
<th align="left">PRU0</th>
<th align="left">PRU1</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">0x0000_0000</td>
<td align="left">Data 8KB RAM 0</td>
<td align="left">Data 8KB RAM 1</td>
<td align="left">8KB data RAM belonging to PRU0</td>
</tr>
<tr class="even">
<td align="left">0x0000_2000</td>
<td align="left">Data 8KB RAM 1</td>
<td align="left">Data 8KB RAM 0</td>
<td align="left">8KB data RAM belonging to PRU1</td>
</tr>
<tr class="odd">
<td align="left">0x0001_0000</td>
<td align="left">Data 12KB RAM 2 (Shared)</td>
<td align="left">Data 12KB RAM 2 (Shared)</td>
<td align="left">12KB data RAM shared between both PRUs</td>
</tr>
<tr class="even">
<td align="left">0x0002_0000</td>
<td align="left">INTC</td>
<td align="left">INTC</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">0x0002_2000</td>
<td align="left">PRU0 Control Registers</td>
<td align="left">PRU0 Control Registers</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">0x0002_2400</td>
<td align="left">Reserved</td>
<td align="left">Reserved</td>
<td align="left">-</td>
</tr>
<tr class="odd">
<td align="left">0x0002_4000</td>
<td align="left">PRU1 Control Registers</td>
<td align="left">PRU1 Control Registers</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">0x0002_4400</td>
<td align="left">Reserved</td>
<td align="left">Reserved</td>
<td align="left">-</td>
</tr>
<tr class="odd">
<td align="left">0x0002_6000</td>
<td align="left">CFG</td>
<td align="left">CFG</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">0x0002_8000</td>
<td align="left">UART 0</td>
<td align="left">UART 0</td>
<td align="left">PRUSS dedicated UART Controller (Universal Asynchronous Receive/Transmit Controller)</td>
</tr>
<tr class="odd">
<td align="left">0x0002_A000</td>
<td align="left">Reserved</td>
<td align="left">Reserved</td>
<td align="left">-</td>
</tr>
<tr class="even">
<td align="left">0x0002_C000</td>
<td align="left">Reserved</td>
<td align="left">Reserved</td>
<td align="left">-</td>
</tr>
<tr class="odd">
<td align="left">0x0002_E000</td>
<td align="left">IEP</td>
<td align="left">IEP</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">0x0003_0000</td>
<td align="left">eCAP 0</td>
<td align="left">eCAP 0</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">0x0003_2000</td>
<td align="left">MII_RT_CFG</td>
<td align="left">MII_RT_CFG</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">0x0003_2400</td>
<td align="left">MII_MDIO</td>
<td align="left">MII_MDIO</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">0x0003_4000</td>
<td align="left">Reserved</td>
<td align="left">Reserved</td>
<td align="left">-</td>
</tr>
<tr class="even">
<td align="left">0x0003_8000</td>
<td align="left">Reserved</td>
<td align="left">Reserved</td>
<td align="left">-</td>
</tr>
<tr class="odd">
<td align="left">0x0004_0000</td>
<td align="left">Reserved</td>
<td align="left">Reserved</td>
<td align="left">-</td>
</tr>
<tr class="even">
<td align="left">0x0008_0000</td>
<td align="left">System OCP_HP0</td>
<td align="left">System OCP_HP1</td>
<td align="left">Address Offset of the Interface/OCP Master Port used to access the host memory map</td>
</tr>
</tbody>
</table>

## Global Memory Map

The following memory mappings may be used either from the host ARM
Cortex-A8 CPU or from within the PRUSS.

*It is recommended to use local mappings from within the PRUSS however,
as access times will be faster.*

<table>
<thead>
<tr class="header">
<th align="left">Offset Address</th>
<th align="left">PRUSS</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">0x0000_0000</td>
<td align="left">Data 8KB RAM 0</td>
</tr>
<tr class="even">
<td align="left">0x0000_2000</td>
<td align="left">Data 8KB RAM 1</td>
</tr>
<tr class="odd">
<td align="left">0x0001_0000</td>
<td align="left">Data 12KB RAM 2 (Shared)</td>
</tr>
<tr class="even">
<td align="left">0x0002_0000</td>
<td align="left">INTC</td>
</tr>
<tr class="odd">
<td align="left">0x0002_2000</td>
<td align="left">PRU0 Control</td>
</tr>
<tr class="even">
<td align="left">0x0002_2400</td>
<td align="left">PRU0 Debug</td>
</tr>
<tr class="odd">
<td align="left">0x0002_4000</td>
<td align="left">PRU1 Control</td>
</tr>
<tr class="even">
<td align="left">0x0002_4400</td>
<td align="left">PRU1 Debug</td>
</tr>
<tr class="odd">
<td align="left">0x0002_6000</td>
<td align="left">CFG</td>
</tr>
<tr class="even">
<td align="left">0x0002_8000</td>
<td align="left">UART 0</td>
</tr>
<tr class="odd">
<td align="left">0x0002_A000</td>
<td align="left">Reserved</td>
</tr>
<tr class="even">
<td align="left">0x0002_C000</td>
<td align="left">Reserved</td>
</tr>
<tr class="odd">
<td align="left">0x0002_E000</td>
<td align="left">IEP</td>
</tr>
<tr class="even">
<td align="left">0x0003_0000</td>
<td align="left">eCAP 0</td>
</tr>
<tr class="odd">
<td align="left">0x0003_2000</td>
<td align="left">MII_RT_CFG</td>
</tr>
<tr class="even">
<td align="left">0x0003_2400</td>
<td align="left">MII_MDIO</td>
</tr>
<tr class="odd">
<td align="left">0x0003_4000</td>
<td align="left">PRU0 8KB IRAM</td>
</tr>
<tr class="even">
<td align="left">0x0003_8000</td>
<td align="left">PRU1 8KB IRAM</td>
</tr>
<tr class="odd">
<td align="left">0x0004_0000</td>
<td align="left">Reserved</td>
</tr>
</tbody>
</table>

## CFG Register Map

The PRUSS CFG block contains registers for control and status of power
management, memory parity and enhanced PRU GP port functions.

Any register offset addresses not listed below should be considered
reserved and should not be modified.

### PRUSS\_CFG Register

<table>
<thead>
<tr class="header">
<th align="left">Offset (Hexadecimal Bytes)</th>
<th align="left">Name</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">0h</td>
<td align="left">REVID</td>
<td align="left">The Revision Register, contains the ID and revision information.</td>
</tr>
<tr class="even">
<td align="left">4h</td>
<td align="left">SYSCFG</td>
<td align="left">The System Configuration Register, defines the power IDLE and STANDBY modes.</td>
</tr>
<tr class="odd">
<td align="left">8h</td>
<td align="left">GPCFG0</td>
<td align="left">The General Purpose Configuration 0 Register, defines the GPI/O configuration for PRU0.</td>
</tr>
<tr class="even">
<td align="left">Ch</td>
<td align="left">GPCFG1</td>
<td align="left">The General Purpose Configuration 0 Register, defines the GPI/O configuration for PRU1.</td>
</tr>
<tr class="odd">
<td align="left">10h</td>
<td align="left">CGR</td>
<td align="left">The Clock Gating Register, controls the state of Clock Management of the different modules. Software should not clear {module}_CLK_EN until {module}_CLK_STOP_ACK is 0x01.</td>
</tr>
<tr class="even">
<td align="left">14h</td>
<td align="left">ISRP</td>
<td align="left">The IRQ Status Raw Parity register is a snapshot of the IRQ raw status for the PRUSS memory parity events. The raw status is set even if the event is not enabled.</td>
</tr>
<tr class="odd">
<td align="left">18h</td>
<td align="left">ISP</td>
<td align="left">The IRQ Status Parity Register is a snapshot of the IRQ status for the PRUSS memory parity events. The status is set only if the event is enabled. Write 1 to clear the status after the interrupt has been serviced.</td>
</tr>
<tr class="even">
<td align="left">18h</td>
<td align="left">ISP</td>
<td align="left">The IRQ Status Parity Register is a snapshot of the IRQ status for the PRUSS memory parity events. The status is set only if the event is enabled. Write 1 to clear the status after the interrupt has been serviced.</td>
</tr>
<tr class="odd">
<td align="left">1Ch</td>
<td align="left">IESP</td>
<td align="left">The IRQ Enable Set Parity Register enables the IRQ PRUSS memory parity events.</td>
</tr>
<tr class="even">
<td align="left">20h</td>
<td align="left">IECP</td>
<td align="left">The IRQ Enable Clear Parity Register disables the IRQ PRUSS memory parity events.</td>
</tr>
<tr class="odd">
<td align="left">24h</td>
<td align="left">SCRP</td>
<td align="left">SCR Priority Register defines the priority of some of the elements in the SCR. Lower numbers indicate higher priority level.</td>
</tr>
<tr class="even">
<td align="left">28h</td>
<td align="left">PMAO</td>
<td align="left">The PRU Master OCP Address Offset Register enables for the PRU OCP Master Port Address to have an offset of minus 0x0008_0000. This enables the PRU to access External Host address space starting at 0x00000.</td>
</tr>
<tr class="odd">
<td align="left">2Ch</td>
<td align="left">MII_RT</td>
<td align="left">The MII_RT Event Enable Register enables Ethercat (or MII_RT) mode events to the PRUSS INTC.</td>
</tr>
<tr class="even">
<td align="left">30h</td>
<td align="left">IEPCLK</td>
<td align="left">The IEP Clock Source Register defines the source of the IEP clock.</td>
</tr>
<tr class="odd">
<td align="left">34h</td>
<td align="left">SPP</td>
<td align="left">The Scratch Pad Priority and Configuration Register defines the access priority assigned to the PRU cores and configures the scratch pad XFR shift functionality.</td>
</tr>
<tr class="even">
<td align="left">40h</td>
<td align="left">PIN_MX</td>
<td align="left">The Pin Mux Select Register defines the state of the PRUSS internal pinmuxing.</td>
</tr>
</tbody>
</table>


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PRU](http://eLinux.org/Category:PRU "Category:PRU")

