> From: [eLinux.org](http://eLinux.org/Didj_GPIO_Map "http://eLinux.org/Didj_GPIO_Map")


# Didj GPIO Map



## GPIO Registers

<table>
<thead>
<tr class="header">
<th align="left">Register</th>
<th align="left">GPIO A Address</th>
<th align="left">GPIO B Address</th>
<th align="left">GPIO C Address</th>
<th align="left">Comments</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">GPIO_OUT</td>
<td align="left">C000A000</td>
<td align="left">C000A040</td>
<td align="left">C000A080</td>
<td align="left">GPIO &quot;Write&quot; register (pin must be in output mode)</td>
</tr>
<tr class="even">
<td align="left">GPIO_OUTEN</td>
<td align="left">C000A004</td>
<td align="left">C000A044</td>
<td align="left">C000A084</td>
<td align="left">Output enable: 1 = pin output mode, 0 = input mode</td>
</tr>
<tr class="odd">
<td align="left">GPIO_PAD</td>
<td align="left">C000A018</td>
<td align="left">C000A058</td>
<td align="left">C000A098</td>
<td align="left">GPIO &quot;Read&quot; register (pin must be in input mode)</td>
</tr>
</tbody>
</table>

## GPIO List

<table>
<thead>
<tr class="header">
<th align="left">Group</th>
<th align="left">Index</th>
<th align="left">GPIO Function</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">A</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[31:0]</td>
<td align="left">Unknown</td>
</tr>
<tr class="odd">
<td align="left">B</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[31:6]</td>
<td align="left">Unknown</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">[5:2]</td>
<td align="left">SD DAT[3:0] (at cartridge connector)</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[1]</td>
<td align="left">SD CMD (at cartridge connector)</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">[0]</td>
<td align="left">SD CLK (at cartridge connector)</td>
</tr>
<tr class="even">
<td align="left">C</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">[31:21]</td>
<td align="left">Unknown</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[20]</td>
<td align="left">#Power Switch</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">[19:14]</td>
<td align="left">Unknown</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[13]</td>
<td align="left">Brightness Switch</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">[12]</td>
<td align="left">Pause button</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[11]</td>
<td align="left">Question button</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">[10]</td>
<td align="left">Home button</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[9]</td>
<td align="left">B button</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">[8]</td>
<td align="left">A button</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[7]</td>
<td align="left">Right shoulder</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">[6:5]</td>
<td align="left">Unknown</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[4]</td>
<td align="left">Left shoulder</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">[3]</td>
<td align="left">D-pad Down</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[2]</td>
<td align="left">D-pad Up</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">[1]</td>
<td align="left">D-pad Right</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">[0]</td>
<td align="left">D-pad Left</td>
</tr>
</tbody>
</table>


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

