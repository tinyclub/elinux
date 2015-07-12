> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_File_Format_CBF "http://eLinux.org/LeapFrog_Pollux_Platform:_File_Format_CBF")


# LeapFrog Pollux Platform: File Format CBF



## Contents

-   [1 Summary](#summary)
-   [2 Programs](#programs)
-   [3 File Structure](#file-structure)
-   [4 File Differences](#file-differences)
-   [5 make\-cbf.py](#make-cbf-py)

## Summary

The LeapFrog [Leapster Explorer](http://eLinux.org/Leapster_Explorer "Leapster Explorer")
and [LeapPad Explorer](http://eLinux.org/LeapPad_Explorer "LeapPad Explorer") both use
the CBF file format for the kernel firmware and Surgeon. This is a
rather basic format, that contains some summary information about the
kernel, size, load address, etc. This information is all rather easy to
obtain out of the file, with a hex editor. You can also extract the
zImage or Image of the kernel if desired or use the python script in the
[LeapFrog
Sources](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code "LeapFrog Pollux Platform: Source Code").



## Programs

A list of programs/scripts that deal with CBF

\<Sources\>/scripts/make\_cbf.py.

[OpenLFConnect](http://eLinux.org/LeapFrog_Pollux_Platform:_OpenLFConnect "LeapFrog Pollux Platform: OpenLFConnect")



## File Structure

There are three basic components of the CBF file, the summary, the
kernel image, and padding. The Summary occupies the first 20 bytes of
the file, which is followed by the summary CRC checksum. Directly after
this starts the kernel image, which can vary in size depending on the
options compiled in. It is then followed by the kernel image CRC
checksum. This concludes the data portion, the file is then filled with
0xFF bytes until it is aligned to 16384 byte blocks of data.

Summary

Summary CRC

Kernel

Kernel CRC

Padding

[0:3]

[4:7]

[8:11]

[12:15]

[16:19]

[20:23]

[24:K end]

[K end+1:+4]

[..EOF]

Magic Number(1)

CBF Version

Kernel Load

Kernel Jump

Kernel Size

CRC Checksum(2)

Kernel Image

CRC Checksum(2)

0xFF

(1)

-   0xF0 0xDE 0xBC 0x9A in actual file
-   -0x65432110 in make\_cbf.py

(2)

-   This is calculated using their own routine.

## File Differences

<table>
<thead>
<tr class="header">
<th align="left">Device</th>
<th align="left">File</th>
<th align="left">kernel_load</th>
<th align="left">kernel_jump</th>
<th align="left">compressed</th>
<th align="left">initramfs</th>
<th align="left">Size Limit</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">LeapPad</td>
<td align="left">Kernel.cbf</td>
<td align="left">0x00100000</td>
<td align="left">0x00100000</td>
<td align="left">False</td>
<td align="left">False</td>
<td align="left"> ? Partition Limited</td>
</tr>
<tr class="even">
<td align="left">LeapPad</td>
<td align="left">Surgeon.cbf</td>
<td align="left">0x00010000</td>
<td align="left">0x00010000</td>
<td align="left">True</td>
<td align="left">True</td>
<td align="left">8MB Memory Limited</td>
</tr>
<tr class="odd">
<td align="left">Explorer</td>
<td align="left">Kernel.cbf</td>
<td align="left">0x00008000</td>
<td align="left">0x00008000</td>
<td align="left">True</td>
<td align="left">False</td>
<td align="left">8MB Partition Limited</td>
</tr>
<tr class="even">
<td align="left">Explorer</td>
<td align="left">Surgeon.cbf</td>
<td align="left">0x00008000</td>
<td align="left">0x00008000</td>
<td align="left">True</td>
<td align="left">True</td>
<td align="left">8MB Memory Limited</td>
</tr>
</tbody>
</table>

## make\_cbf.py

**Version 1**

This version uses a compressed kernel (zImage) and it's kernel\_boot and
kernel\_load addresses are 0x8000. This script, referenced in the latest
make\_surgeon.cbf as make\_compressed\_cbf.py (assuming, as its not in
the sources) is used on the Explorer Surgeon and Kernel as well as the
LeapPad Surgeon.

**Version 2**

This version uses an uncompressed kernel (Image) and it's kernel\_boot
and kernel\_load addresses are 0x10000. The only CBF file this seems to
be used on is the LeapPad kernel.

**Usage**

The script graps the zImage or Image file, depending on version from
\<kernel\>/arch/arm/boot/[Image|zImage] and wraps iy with the CBF
information, they use their own CRC routine in calculating the checksum.
There is three options, of which only two look valid. -c deletes a
previous kernel.cbf file, and -o specifies the output files name
(default, kernel.cbf).


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

