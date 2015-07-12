> From: [eLinux.org](http://eLinux.org/Python_Can "http://eLinux.org/Python_Can")


# Python Can



Since version 3.3 Python provides support for SocketCAN. You can specify
AF\_CAN protocol family as you do in C. Below you’ll find slightly
modified example provided in the original [SocketCAN
patch](http://bugs.python.org/issue10141).

To get started just copy the code into example.py and start it as
follows provided your CAN interface is can0:

python example.py can0

Use build\_can\_frame() and dissect\_can\_frame() to build/dissect CAN
frames. Interface management like bitrate settings or getting statistics
will be made as usual via iproute2 utility.

           import socket
           import struct
           import sys

           # CAN frame packing/unpacking (see `struct can_frame` in <linux/can.h>)
           can_frame_fmt = "=IB3x8s"

           def build_can_frame(can_id, data):
                   can_dlc = len(data)
                   data = data.ljust(8, b'\x00')
                   return struct.pack(can_frame_fmt, can_id, can_dlc, data)

           def dissect_can_frame(frame):
                   can_id, can_dlc, data = struct.unpack(can_frame_fmt, frame)
                   return (can_id, can_dlc, data[:can_dlc])

           if len(sys.argv) != 2:
                   print('Provide CAN device name (can0, slcan0 etc.)')
                   sys.exit(0)

           # create a raw socket and bind it to the given CAN interface
           s = socket.socket(socket.AF_CAN, socket.SOCK_RAW, socket.CAN_RAW)
           s.bind((sys.argv[1],))

           while True:
                   cf, addr = s.recvfrom(16)

                   print('Received: can_id=%x, can_dlc=%x, data=%s' % dissect_can_frame(cf))

                   try:
                           s.send(cf)
                   except socket.error:
                           print('Error sending CAN frame')

                   try:
                           s.send(build_can_frame(0x01, b'\x01\x02\x03'))
                   except socket.error:
                           print('Error sending CAN frame')


