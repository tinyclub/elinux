> From: [eLinux.org](http://eLinux.org/PRUSSv2_Interrupt_Controller "http://eLinux.org/PRUSSv2_Interrupt_Controller")


# PRUSSv2 Interrupt Controller



The PRUSS Interrupt Controller sits on the SCR 32-bit bus that
interconnects elements of the PRUSS. It also has a direct outgoing
connection to the ARM Interrupt Controller, EDMA and TSC\_ADC Event
triggers, allowing interrupts to these units to be dispatched by various
components of the PRUSS. The controller also has a direct incoming
connection, allowing it to receive events from various SoC external
peripherals.

***Important Note:** It is vital to clear all system interrupts before
the PRUSS is halted, else the PRUSS will not power down.*

## Contents

-   [1 Features](#features)
-   [2 Enabling the Interrupt
    Controller](#enabling-the-interrupt-controller)
-   [3 Configuring and enabling an
    Interrupt](#configuring-and-enabling-an-interrupt)
-   [4 Servicing (clearing) an
    Interrupt](#servicing-clearing-an-interrupt)
-   [5 Interrupt Nesting](#interrupt-nesting)

## Features

 [A list of 64 possible interrupt events](http://eLinux.org/PRUSSv2_Interrupts "PRUSSv2 Interrupts").
 10 interrupt channels (Channel-0 to Channel-9), allowing for 10 separate active triggers, which may be triggered by one or more specified interrupts from the above list.
If more than one interrupt arrives at the same time, those assigned to a
lower channel number will be given priority. If more than one interrupt
arrives at the same time on the same channel, again, the interrupt with
the lowest interrupt number from the above table is given priority.

 10 host channels (Host-0 to Host-9), allowing for one or more interrupt channels to be directed to up to 10 different locations, either within or outside of the PRUSS.
The first two channels, Host-0 and Host-1, always directly point to
Register R31 bit 30 and bit 31 respectively of the two PRU units,
enabling PRUs to receive interrupts by checking these register bits.

Other locations a host channel may point to will typically be local
peripherals, external components such as the EDMA for triggering a DMA
transfer and the ARM Interrupt Controller for interrupting an operating
system, allowing for software intervention.

## Enabling the Interrupt Controller

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<thead>
<tr class="header">
<th align="left">Instruction</th>
<th align="left">Location Name</th>
<th align="left">Location Number</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1. Globally enable interrupts by setting the Global Enable Register (<a href="http://elinux.org/index.php?title=GER&amp;action=edit&amp;redlink=1" title="GER (page does not exist)">GER</a>) to 1</td>
<td align="left">PRUSS_INTC + <a href="http://elinux.org/index.php?title=GER&amp;action=edit&amp;redlink=1" title="GER (page does not exist)">GER</a></td>
<td align="left">0x0002_0000 + 10h</td>
</tr>
<tr class="even">
<td align="left">2. Set polarity of all incoming events through the System Interrupt Polarity Registers (<a href="http://elinux.org/index.php?title=SIPR0&amp;action=edit&amp;redlink=1" title="SIPR0 (page does not exist)">SIPR0</a> and <a href="http://elinux.org/index.php?title=SIPR1&amp;action=edit&amp;redlink=1" title="SIPR1 (page does not exist)">SIPR1</a>) to Active High (set all bits to 1)</td>
<td align="left">PRUSS_INTC + <a href="http://elinux.org/index.php?title=SIPR0&amp;action=edit&amp;redlink=1" title="SIPR0 (page does not exist)">SIPR0</a>
<p>PRUSS_INTC + <a href="http://elinux.org/index.php?title=SIPR1&amp;action=edit&amp;redlink=1" title="SIPR1 (page does not exist)">SIPR1</a></p></td>
<td align="left">0x0002_0000 + D00h
<p>0x0002_0000 + D04h</p></td>
</tr>
<tr class="odd">
<td align="left">3. Set the type of all incoming events through the System Interrupt Type Registers (<a href="http://elinux.org/index.php?title=SITR0&amp;action=edit&amp;redlink=1" title="SITR0 (page does not exist)">SITR0</a> and <a href="http://elinux.org/index.php?title=SITR1&amp;action=edit&amp;redlink=1" title="SITR1 (page does not exist)">SITR1</a>) to 'pulse' (set all bits to 0)</td>
<td align="left">PRUSS_INTC + <a href="http://elinux.org/index.php?title=SITR0&amp;action=edit&amp;redlink=1" title="SITR0 (page does not exist)">SITR0</a>
<p>PRUSS_INTC + <a href="http://elinux.org/index.php?title=SITR1&amp;action=edit&amp;redlink=1" title="SITR1 (page does not exist)">SITR1</a></p></td>
<td align="left">0x0002_0000 + D80h
<p>0x0002_0000 + D84h</p></td>
</tr>
</tbody>
</table>

*Although the Interrupt Controller supports settings for individual
interrupt polarities and types, in the AM335X (BeagleBone) processor,
these settings are ALWAYS Active High and Pulsed and as such can be
configured as part of the global set-up as opposed to configuration for
individual interrupts.*

## Configuring and enabling an Interrupt

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<thead>
<tr class="header">
<th align="left">Instruction</th>
<th align="left">Location Name</th>
<th align="left">Location Number</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1. Map the chosen <a href="http://elinux.org/PRUSSv2_Interrupts" title="PRUSSv2 Interrupts">system event</a> to an interrupt channel by inserting the channel number into the appropriate Channel Map Register (<a href="http://elinux.org/index.php?title=CMR&amp;action=edit&amp;redlink=1" title="CMR (page does not exist)">CMR</a>0::15 - each register represents 4 system interrupts)</td>
<td align="left">PRUSS_INTC + <a href="http://elinux.org/index.php?title=CMR0&amp;action=edit&amp;redlink=1" title="CMR0 (page does not exist)">CMR0</a> <strong>...</strong>
<p>PRUSS_INTC + <a href="http://elinux.org/index.php?title=CMR15&amp;action=edit&amp;redlink=1" title="CMR15 (page does not exist)">CMR15</a></p></td>
<td align="left">0x0002_0000 + 400h <strong>...</strong>
<p>0x0002_0000 + 43Ch</p></td>
</tr>
<tr class="even">
<td align="left">2. Map the configured interrupt channel to the chosen host channel by inserting the host channel number into the appropriate Host Map Register (<a href="http://elinux.org/index.php?title=HMR&amp;action=edit&amp;redlink=1" title="HMR (page does not exist)">HMR</a>0::2 - each register represents 4 interrupt channels)
<p><em>It is recommend to assign interrupt channel X to host channel X (Interrupt Channel 1 -&gt; Host Channel 1 etc.)</em></p></td>
<td align="left">PRUSS_INTC + <a href="http://elinux.org/index.php?title=HMR0&amp;action=edit&amp;redlink=1" title="HMR0 (page does not exist)">HMR0</a> <strong>...</strong>
<p>PRUSS_INTC + <a href="http://elinux.org/index.php?title=HMR2&amp;action=edit&amp;redlink=1" title="HMR2 (page does not exist)">HMR2</a></p></td>
<td align="left">0x0002_0000 + 800h <strong>...</strong>
<p>0x0002_0000 + 808h</p></td>
</tr>
<tr class="odd">
<td align="left">3. Clear the system interrupt's status by setting the appropriate bit in the System Interrupt Status Register to 1 (<a href="http://elinux.org/index.php?title=SECR&amp;action=edit&amp;redlink=1" title="SECR (page does not exist)">SECR</a>0::1 - each register represents 32 interrupts)</td>
<td align="left">PRUSS_INTC + <a href="http://elinux.org/index.php?title=SECR0&amp;action=edit&amp;redlink=1" title="SECR0 (page does not exist)">SECR0</a>
<p>PRUSS_INTC + <a href="http://elinux.org/index.php?title=SECR1&amp;action=edit&amp;redlink=1" title="SECR1 (page does not exist)">SECR1</a></p></td>
<td align="left">0x0002_0000 + 280h
<p>0x0002_0000 + 284h</p></td>
</tr>
<tr class="even">
<td align="left">4. Enable the individual host channel by writing the host channel number to the Host Interrupt Enable Indexed Set Register (<a href="http://elinux.org/index.php?title=HIEISR&amp;action=edit&amp;redlink=1" title="HIEISR (page does not exist)">HIEISR</a>)
<p><em>Individual interrupts can be disabled by following the above step but by instead writing to the Host Interrupt Enable Indexed Clear Register (<a href="http://elinux.org/index.php?title=HIDISR&amp;action=edit&amp;redlink=1" title="HIDISR (page does not exist)">HIDISR</a>)</em></p></td>
<td align="left">PRUSS_INTC + <a href="http://elinux.org/index.php?title=HIEISR&amp;action=edit&amp;redlink=1" title="HIEISR (page does not exist)">HIEISR</a></td>
<td align="left">0x0002_0000 + 34h</td>
</tr>
<tr class="odd">
<td align="left">5. Enable the individual system interrupt (<a href="http://elinux.org/PRUSSv2_Interrupts" title="PRUSSv2 Interrupts">system event</a>) by writing the interrupt number to the System Interrupt Enable Indexed Set Register (<a href="http://elinux.org/index.php?title=EISR&amp;action=edit&amp;redlink=1" title="EISR (page does not exist)">EISR</a>)
<p><em>Individual system interrupts can be disabled by following the above step but by instead writing to the System Interrupt Enable Indexed Clear Register (<a href="http://elinux.org/index.php?title=EICR&amp;action=edit&amp;redlink=1" title="EICR (page does not exist)">EICR</a>)</em></p></td>
<td align="left">PRUSS_INTC + <a href="http://elinux.org/index.php?title=EISR&amp;action=edit&amp;redlink=1" title="EISR (page does not exist)">EISR</a></td>
<td align="left">0x0002_0000 + 28h</td>
</tr>
</tbody>
</table>

## Servicing (clearing) an Interrupt

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<thead>
<tr class="header">
<th align="left">Instruction</th>
<th align="left">Location Name</th>
<th align="left">Location Number</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1a. Clear the interrupt's status by setting the bit at the location of the interrupt number in the System Interrupt Status Enabled/Clear Register (<a href="http://elinux.org/index.php?title=SECR&amp;action=edit&amp;redlink=1" title="SECR (page does not exist)">SECR</a>0::1 - for example, to clear Interrupt 12, write 1 to bit 12 in SECR0).</td>
<td align="left">PRUSS_INTC + <a href="http://elinux.org/index.php?title=SECR0&amp;action=edit&amp;redlink=1" title="SECR0 (page does not exist)">SECR0</a>
<p>PRUSS_INTC + <a href="http://elinux.org/index.php?title=SECR1&amp;action=edit&amp;redlink=1" title="SECR1 (page does not exist)">SECR1</a></p></td>
<td align="left">0x0002_0000 + 280h
<p>0x0002_0000 + 284h</p></td>
</tr>
<tr class="even">
<td align="left">1b. Alternatively, clear the interrupt's status by writing the interrupt number to the System Interrupt Status Enabled Indexed Clear Register (<a href="http://elinux.org/index.php?title=EICR&amp;action=edit&amp;redlink=1" title="EICR (page does not exist)">EICR</a>).</td>
<td align="left">PRUSS_INTC + <a href="http://elinux.org/index.php?title=EICR&amp;action=edit&amp;redlink=1" title="EICR (page does not exist)">EICR</a></td>
<td align="left">0x0002_0000 + 2Ch</td>
</tr>
</tbody>
</table>


 Once an interrupt has been acted upon it should always be cleared to
ensure the correct receipt of future interrupts.

## Interrupt Nesting

Interrupt nesting allows various priorities of interrupts to be disabled
when an interrupt event, with nesting configured, is received. Disabled
interrupts are then re-enabled by the user writing to the
[ISR](http://eLinux.org/index.php?title=ISR&action=edit&redlink=1 "ISR (page does not exist)")
register.

There are three types of supported nesting:

 Nesting of all host channels of the same or lower priority when an interrupt event is received
The nesting level can be set by placing the channel number in the Global
Nesting Level Register
([GNLR](http://eLinux.org/index.php?title=GNLR&action=edit&redlink=1 "GNLR (page does not exist)")).

 Nesting of an individual host channel, the individual host may not be interrupted by interrupt events on interrupt channels of the same or lower priority
The nesting level can be set individually by placing the channel number
in the Host Interrupt Nesting Level Registers
([HINLR](http://eLinux.org/index.php?title=HINLR&action=edit&redlink=1 "HINLR (page does not exist)")0::1)

 Software nesting, whereby the software disables all host channels on receipt of an interrupt, proceeded by enabling/disabling individual host channels and finally re-enabling all host channels, allowing only those manually enabled to continue processing interrupts. The changes are reversed once the interrupt request has been serviced by the software.
Requires the most CPU intervention and should be avoided if either of
the first two nesting solutions are applicable.


