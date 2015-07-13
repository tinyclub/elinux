> From: [eLinux.org](http://eLinux.org/Can-utils "http://eLinux.org/Can-utils")


# Can-utils



### Installation

Perform following steps to install SocketCAN utilities:

-   git clone
    [https://github.com/linux-can/can-utils.git](https://github.com/linux-can/can-utils.git)
-   cd can-utils
-   ./autogen.sh
-   ./configure
-   make
-   make install (with root privileges)

### Usage

## candump

candump let you sniff CAN packets from one or more CAN interfaces with
lots of other useful options to filter, redirect messages etc. Here just
a small example:

     candump vcan0
     vcan0  123   [4]  01 AA BB 22
     vcan0  123   [4]  01 AA BB 23
     vcan0  123   [4]  01 AA BB 24


