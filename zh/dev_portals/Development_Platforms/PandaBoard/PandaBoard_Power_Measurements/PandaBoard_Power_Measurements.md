> From: [eLinux.org](http://eLinux.org/PandaBoard_Power_Measurements "http://eLinux.org/PandaBoard_Power_Measurements")


# PandaBoard Power Measurements



## Contents

-   [1 Reference Materials](#reference-materials)
-   [2 Parts](#parts)
-   [3 Power Rails for PandaBoard](#power-rails-for-pandaboard)
-   [4 Power Rails for PandaBoard ES Rev B1
    (Latest)](#power-rails-for-pandaboard-es-rev-b1-latest)

## Reference Materials

-   [Measuring Power Consumption of the OMAP4430 using the
    PandaBoard](http://www.vectorfabrics.com/blog/item/power_consumption_omap4430_pandaboard)
-   [Snowball Power Measurement
    Modifications](https://wiki.linaro.org/WorkingGroups/PowerManagement/Doc/Power_snowball)
-   Low Cost Power Measurement presentation by David Anders
    -   [Video](http://youtu.be/J8_V1TbSpBs)
    -   [Slides](http://eLinux.org/images/1/11/Danders-power-measurement.pdf "Danders-power-measurement.pdf")

## Parts

-   INA219 - I2C based power measurement IC
    -   Standalone device and does not require an ADC for sampling
    -   does voltage measurements
    -   only needs an I2C interface for data transmission
    -   [Digikey product
        page](http://www.digikey.com/product-detail/en/INA219AIDCNR/296-23770-1-ND/1952550)
    -   [TI product page](http://www.ti.com/product/ina219)
-   INA199A2 - x100 OPAMP
    -   requires the use of an ADC for sampling
    -   recommend using an Atmel AVR or TI MSP430
    -   [Datasheet](http://www.ti.com/product/ina199a2)
    -   [Digikey product
        page](http://search.digikey.com/us/en/products/INA199A2DCKR/296-27331-1-ND/2279292)
-   Shunt Resistor
    -   0603 package size
    -   0.05 Ohm resistance
    -   [Digikey product
        page](http://search.digikey.com/us/en/products/ERJ-L03KJ50MV/P50NJCT-ND/570940)

## Power Rails for PandaBoard

<table>
<thead>
<tr class="header">
<th align="left">Name</th>
<th align="left">Function</th>
<th align="left">Inductor</th>
<th align="left">Comment</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">VCORE1</td>
<td align="left">VDD_MPU</td>
<td align="left">L18</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">VCORE2</td>
<td align="left">VDD_IVA</td>
<td align="left">L21</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">VCORE3</td>
<td align="left">VDD_CORE</td>
<td align="left">L23</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">V1V8</td>
<td align="left">VIO_1.8V</td>
<td align="left">L16</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">V2V1</td>
<td align="left">VDD_V2V1</td>
<td align="left">L8</td>
<td align="left">Used for secondary power rails</td>
</tr>
<tr class="even">
<td align="left">V1V29</td>
<td align="left">VDD_V1V29</td>
<td align="left">L11</td>
<td align="left">Used for memory interface</td>
</tr>
<tr class="odd">
<td align="left">VMEM</td>
<td align="left">VDD_VMEM</td>
<td align="left">L22</td>
<td align="left"></td>
</tr>
</tbody>
</table>





[![Pandaboard-inductors.jpg](http://eLinux.org/images/thumb/5/52/Pandaboard-inductors.jpg/400px-Pandaboard-inductors.jpg)](http://eLinux.org/File:Pandaboard-inductors.jpg)

## Power Rails for PandaBoard ES Rev B1 (Latest)

<table>
<thead>
<tr class="header">
<th align="left">Name</th>
<th align="left">Function</th>
<th align="left">Inductor</th>
<th align="left">Comment</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">VCORE1</td>
<td align="left">VDD_MPU</td>
<td align="left">L22</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">VCORE2</td>
<td align="left">VDD_IVA</td>
<td align="left">L17</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">VCORE3</td>
<td align="left">VDD_CORE</td>
<td align="left">L15</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">V1V8</td>
<td align="left">VIO_1.8V</td>
<td align="left">L13</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">V2V1</td>
<td align="left">VDD_V2V1</td>
<td align="left">L7</td>
<td align="left">Used for secondary power rails</td>
</tr>
<tr class="even">
<td align="left">V1V29</td>
<td align="left">VDD_V1V29</td>
<td align="left">L10</td>
<td align="left">Used for memory interface</td>
</tr>
<tr class="odd">
<td align="left">VMEM</td>
<td align="left">VDD_VMEM</td>
<td align="left">N/C</td>
<td align="left">Not used on PandaBoard-ES</td>
</tr>
</tbody>
</table>



[![Pandaboard-es-inductors.jpg](http://eLinux.org/images/thumb/8/80/Pandaboard-es-inductors.jpg/400px-Pandaboard-es-inductors.jpg)](http://eLinux.org/File:Pandaboard-es-inductors.jpg)

**NOTE:** L22 is on the back side of the PandaBoard-ES

[![Pandaboard-es-inductors-back.jpg](http://eLinux.org/images/thumb/7/78/Pandaboard-es-inductors-back.jpg/400px-Pandaboard-es-inductors-back.jpg)](http://eLinux.org/File:Pandaboard-es-inductors-back.jpg)


