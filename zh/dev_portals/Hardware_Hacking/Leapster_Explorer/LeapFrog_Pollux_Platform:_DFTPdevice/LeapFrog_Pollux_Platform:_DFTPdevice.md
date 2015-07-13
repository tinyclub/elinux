> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_DFTPdevice "http://eLinux.org/LeapFrog_Pollux_Platform:_DFTPdevice")


# LeapFrog Pollux Platform: DFTPdevice



DFTPdevice is a custom server LeapFrog includes with the
[Explorer](http://eLinux.org/Leapster_Explorer "Leapster Explorer") and
[LeapPad](http://eLinux.org/LeapPad_Explorer "LeapPad Explorer"). This is the main
interface between LFConnect, and these devices. DFTPdevice seems loosely
based on an FTP server, while including customized features for the
purposes of updating the firmware, and a general maintenance.

## Contents

-   [1 Versions](#versions)
-   [2 Connection](#connection)
-   [3 Response Codes](#response-codes)
    -   [3.1 Success](#success)
    -   [3.2 Data Transfer](#data-transfer)
    -   [3.3 Errors](#errors)
-   [4 Command List](#command-list)
    -   [4.1 Surgeon Only](#surgeon-only)
    -   [4.2 Universal](#universal)
    -   [4.3 Combination Commands](#combination-commands)
-   [5 Firmware Updates](#firmware-updates)
    -   [5.1 Explorer](#explorer)
        -   [5.1.1 Firmware File Names](#firmware-file-names)
        -   [5.1.2 Device FS Map](#device-fs-map)
        -   [5.1.3 Altering Partitions](#altering-partitions)

## Versions

There are currently 2 versions of DFTPdevice, 1.12, mostly used in
Surgeon, and 1.8 for firmware. The Explorer and LeapPad version, while
containing the same version number, do seem to differ, most notably in
that if you disconnect from the Explorer version it reboots, while the
LeapPad version goes back to broadcasting its address, waiting for
another connection.

Explorer

Firmware \< 1.4.11.2128

Type

Language

DFTP Version

Firmware

English

1.8

Firmware

French

1.8

Surgeon

English

1.12

Surgeon

French

1.8

Firmware \>= 1.4.11.2128

Firmware

English

4

Surgeon

English

4



LeapPad

Firmware \< 2.2.4-3609

Type

Language

DFTP Version

Firmware

English

1.8

Surgeon

English

1.12

Firmware \>= 2.2.4-3609

Firmware

English

4

Surgeon

English

4

 

 



## Connection

**Version 1.x**

The host PC and LeapFrog device communicate via a USBLAN driver. Initial
setup is done with Avahi on the device and Linux host, or Bonjour on
Windows. To complete the connection on Windows, you will need to add an
IP route to the device. When the device starts it opens port 5000, once
you make a socket connection, you then need to send the ETH command and
wait a second or two. The device then opens up a socket to port 5001,
make your second connection to this port, and you can then start
communicating with it.

5000 is the port you send commands to.

5001 is the port you read the responses from.


 **Version 4.x**

The host PC and LeapFrog device use a USB Mass Storage driver in this
version, instead of the USBLAN driver. While the commands and workings
of DFTP are fairly similar, the communication connection is a vast
departure from Version 1.x. The USB Mass Storage drive shows up as
roughly 50mb, but has no file system or partitions. It is essentially
just a port to communicate with. Commands and data are written to, and
read at two LBAs on the disk, 0x20 and 0x40, with transfer lengths of
0x01 and 0x14 respectively.

Write(10) and read(10) SCSI commands are used exclusively. There is one
vendor specific command that is sent, C2 with CDB length of 10, all
0x00, but seems to have no effect on the device. Write(10) and Read(10)
are used in pairs for most commands, uploading or download data is the
exception read or write is repeated until data sent.

If you write to LBA 0x20, you must read your response from it also.
Transfer Length dictates the size of packets you send. Regular commands
are 0x01 or 512 bytes, large data is transferred in 0x14 or 10240 bytes.
All data must be aligned to this size, padded with 0x00 when necessary.
When done a 101 EOF:\<padding size\> response code is sent/received, to
determine if the last packet needs to be trimmed.

## Response Codes

### Success

The success code is sent for most commands to signify everything went
okay. Will not be sent for data transfers, except on the 101 EOF packet.

**200 OK'**

### Data Transfer

File transfer ACK. This is returned when the device is receiving data
from an upload, it also needs to be send when downloading from it. The
number seems to be the size of the last amount of data read.

**100** ACK \<num\>

EOF is the marker to signify all data has been sent, and to stop
expecting it. When receiving data you need to check for this packet, and
when uploading data you need to send it when finished.

**101** EOF

### Errors

Server errors generate a response back that start with 5xx and then the
error text.

**500** Command not found

**504** Unknown Setting

## Command List

The command list is fairly undocumented, there is a few listed in the
sources, but most will be discovered by other means, like using
Wireshark. This is the list so far.

All commands must have a trailing 0x00 attached. In python it would look
something like.

    socket.send('LIST /path/to\x00')

In OpenLFConnect there is a special command send. It allows you to send
any command you like, the 0x00 is appended for you, otherwise its all
raw read/write. Obviously STOR, RETR, RUN won't work with it, but the
rest you can play around with.

    remote>send LIST /path/to

Some commands are Surgeon only.

### Surgeon Only

**DFTP Version 1.12**


 **GETS MFG\_LOCALE**

Returns:

MFG\_LOCALE=""


 **SETS MOUNTPATIENT=0,1, or 2**

Returns:

200 OK

Action:

0 Unmounts both

1 Mounts Bulk and Rootfs

2 Mounts Rootfs


 **GETS METAINFS**

Returns:

METAINFS=/tmp/metainfs

### Universal

**ETH \<host ip\> 1383**

Action: Has to do with establishing a connection.

Must be sent before opening the second port.


 **LIST /path/to**

Returns:

\<directory path\> list

200 OK


 **STAT /path/to**

Returns:

D 00000000 755 root:root

200 OK

Notes: Seems to not always work as expected.


 **INFO**

Returns:

PACKETSIZE=131072

VERSION=1.12

200 OK


 **GETS BATTERYLEVEL**

Returns:

BATTERYLEVEL=\<number\>

200 OK

Note: number/1000=volts


 **GETS BATTERYSTATUS**

Returns:

BATTERYSTATUS=1

200 OK


 **STOR /path/to**

Action: Initiate file upload.

Next: Send file data till EOF then send 101 EOF.

Device responds with a lot of 100 ACK: \<number\> (Seems to be last
amount of len(data) received.)

**101 EOF**

Returns:

200 OK

Action: Ends STOR data transfer

Notes:Must flush receive buffer first


 **RETR /path/to**

Action: Downloads file.

Next: Read socket buffer for data and send back 100 ACK: \<number\>
(Seems to be last amount of len(data) received.)

Ends: When 101 EOF is received.


 **RM /path/to**

Returns:

200 OK

Action: Removes file


 **RMD \<path\>**

Returns:

200 OK

Action:Removes directory


 **IPKG**

Action:?

Notes:Found listed in source code, does something with firmware.


 **SIZE /path/to**

Returns:

a number, that doesn't seem to make sense


 **SETS DATETIME=20120126083030**

Returns:

200 OK

Action: Sets time.



**GETS DATETIME**

Returns:

DATETIME=20120126083014**200 OK**


 **GETS TOTALSPACE**

Returns:

TOTALSPACE=397307904

200 OK


 **GETS FREESPACE**

Returns:

FREESPACE=265678848

**GETS SERIAL**

Returns:

SERIAL="XXXXXXXXXXXXXXXXXXXXX"

Note: This is the serial number of the device.

**RUN**

Action: Runs shell script

Next: Send data then 101 EOF

Note: Make sure to remove any \\r line ends as it will cause an error.

Example:

    #!/bin/sh
    /etc/init.d/telnet start

Would start the telnet client.


 **GETS SCRIPT\_RUNNING** Returns:

SCRIPT\_RUNNING=0

200 OK

Note: If script is still running returns 1



### Combination Commands

**Disconnect sequence**

NOOP

DCON


 **Reboot after update or in general**

RSET

NOOP

DCON


 **Reboot to usb mode**

UPD8

NOOP

DCON



## Firmware Updates

DFTP's main purpose is for Firmware updating by LFConnect. Basically
there is a set of special folders created on the device by dftpdevice,
which are uploaded to. This triggers the upload to be written to the
NAND, instead of to Surgeon's RAM file system. For the Explorer DFTP is
used exclusively for this purpose. While the LeapPad uses a program
called Fuse-Flasher that can be found in [source]/packages.

### Explorer

The Explorer uses a combination of the file names, and a file system map
file on the device itself, to allow dftpdevice to successfully update
the firmware.

#### Firmware File Names

The firmware file names are used by dftpdevice to figure out where to
flash the data to on NAND. This will write the data to that location
regardless of the fs map. But will cause issues with UBI images if not
coordinated with the map. 131072 is the PACKETSIZE returned in the INFO
command.

Format: [NAND Address],[Partition Size/131072],[Filename]

Example:

    1048576,8,FIRST.32.rle
    2097152,64,kernel.cbf
    10485760,688,erootfs.ubi
    100663296,15616



#### Device FS Map

On the device itself there is a list of files in /var with extension
.fs. These numbers are used in the creation of the mtd/ubi devices
required for mounting and flashing. To figure out which version your
firmware is using, take a look at /etc/init.d/recover-mounts. In that
script there is a variable fs, near the beginning, that shows which file
to use.

Format: [NAND Address] [Partition Size] [Filename]

Example:

    0x00000000 0x00100000 payload/emerald-boot.bin
    0x00100000 0x00100000 payload/FIRST.32.rle
    0x00200000 0x00800000 payload/kernel.cbf
    0x00a00000 0x05600000 payload/erootfs.ubi
    0x06000000 0x7a000000 payload/bulk.ubi

#### Altering Partitions

To change the partitions, a few things need to be accomplished before
configuring dftpdevice. The kernel has the partitions hard coded into
it, those will need to be changed. And if you move the kernel, Emerald
Boot will need to be compiled with the new kernel address and size.

Once those are taken care of, you will need to calculate the file names,
and create the new .fs file. From my experience the .fs is most critical
for UBI, as once Emerald Boot was compiled with the proper kernel
address, it loaded fine. But for UBI there are certain steps required
for flashing to NAND, like erase counter management and it's lack of OOB
usage, that need to be dealt with. dftpdevice will write the UBI image
where ever the file name numbers tell it too, but it will not be usable
by the kernel. If you get an error 22 manually mounting it, this is
probably the reason. An MTD and UBI device needs to be created for
proper flashing, which dftpdevice creates the MTD devices using the .fs
file information. For more application of this, look in
/etc/init.d/recovery-mounts.


