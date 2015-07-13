> From: [eLinux.org](http://eLinux.org/Barebox "http://eLinux.org/Barebox")


# Barebox



The Barebox bootloader was started in 2007 as an attempt to work around
the limitations that U-Boot shows through its age. Originally dubbed
U-Boot v2, it now has a different name because its design goals are
different and it has its own community in the meantime.

Barebox now supports arm, powerpc, mips, nios2, blackfin, x86 and a
Linux userspace port called "sandbox".

Features:

-   Devices/Drivers Model
    -   ata
    -   eeprom
    -   I2c
    -   nand
    -   nor
    -   net
    -   mfd
    -   MMC
    -   serial
    -   SPI
    -   USB
        -   Host
        -   Devices
    -   Framebuffer
-   Filesystem
-   Posix Interface
-   Hush
-   password
-   DFU
-   Menu

# Build and configuration

Unlike U-Boot, Barebox uses Kbuild for the build and Kconfig for the
configuration.

For the environment, a file system is used so you will not have to
clobber any config.h file.

[![Barebox
Kconfig.png](http://eLinux.org/images/thumb/9/93/Barebox_Kconfig.png/600px-Barebox_Kconfig.png)](http://eLinux.org/File:Barebox_Kconfig.png)

[Barebox](http://www.barebox.org)

[U-Boot-v2 Presentation from CELF Embedded Linux Conference Europe
Grenoble,
2009-10-16](http://eLinux.org/File:Hauer-U_BootV2.pdf "File:Hauer-U BootV2.pdf") (pdf)

[Booting Linux Fast &
Fancy](http://eLinux.org/File:ELCE-2010-Barebox-Booting-Linux-Fast-and-Fancy.pdf "File:ELCE-2010-Barebox-Booting-Linux-Fast-and-Fancy.pdf")
(pdf)

# Sandbox

One of the great things with barebox is the sandbox.

Basically you can develop and debug generic features on your host:

1) compile it

for other arch than x86 or ppc you need to use the next branch or the
mainline

As I just recently fixed the support for all host

ARCH=sandbox make sandbox\_defconfig

ARCH=sandbox make

now just start it

      # ./barebox

       barebox 2011.10.0-00119-gad62fdb-dirty (Oct 15 2011 - 11:38:46)

       Board: sandbox
       Malloc space: 0x7f679f24b010 -> 0x7f679fa4b010 (size  8 MB)
       Open /dev/env0 No such file or directory
       no valid environment found on /dev/env0. Using default environment
       running /env/bin/init...
       barebox:/
       barebox:/ ls -al /dev/
       ls: invalid option -- a
       cr-------- 18446744073709551615 zero
       crw-------       8249 defaultenv
       crw------- 4294967295 mem
       crw-------       2198 fd0
       barebox:/ devinfo
       devices:
       `---- hostfile0
       `---- console0
        `---- cs0
       `---- ramfs0
       `---- devfs0
       `---- mem0
        `---- 0x00000000-0x00002038: /dev/defaultenv
       `---- mem1
            `---- 0x00000000-0xfffffffe: /dev/mem
       `---- tap0
       `---- eth0

       drivers:
          console
            ramfs
            devfs
              tap
              mem
           cramfs
         hostfile
       barebox:/

       barebox:/ help
            . - alias for source
            ? - alias for help
            [ - alias for test
      addpart - adds a partition table to a device
    boot_config - Boot Menu
    boot_menu - Boot Menu
          cat - concatenate file(s)
           cd - change working directory
        clear - clear screen
           cp - copy files
        crc32 - crc32 checksum calculation
      delpart - delete partition(s)
      devinfo - Show information about devices and drivers.
         dhcp - invoke dhcp client to obtain ip/boot params
         echo - echo args to console
         edit - Usage: (s)edit <file>
       ethact - set current ethernet device
         exit - exit script
       export - export environment variables
        false - do nothing, unsuccessfully
           go - start application at address or file
         help - print online help
    linux_exec - Execute a command on the host
      loadenv - Load environment from ENVFS into DIRECTORY (default: /dev/env0 -> /env).
        login - login
           ls - list a file or directory
           md - memory display
       md5sum - md5 checksum calculation
       memcmp - memory compare
       memcpy - memory copy
      meminfo - print info about memory usage
       memset - memory fill
         menu - Menu Management
        mkdir - make directories
        mount - Mount a filesystem of a given type to a mountpoint or list mounted filesystems.
           mw - memory write (fill)
       passwd - passwd
         ping - ping <destination>
     printenv - Print value of one or all environment variables.
          pwd - print working directory
     readline - prompt for user input
        reset - Perform RESET of the CPU
           rm - remove files
        rmdir - remove directorie(s)
      saveenv - save environment to persistent storage
        sedit - alias for edit
           sh - run shell script
      sha1sum - sha1 checksum calculation
    sha224sum - sha224 checksum calculation
    sha256sum - sha256 checksum calculation
        sleep - delay execution for n seconds
       source - execute shell script in current shell environment
         test - minimal test like /bin/sh
         tftp - Load file using tftp protocol
         time - measure execution time of a command
      timeout - wait for a specified timeout
         true - do nothing, successfully
       umount - umount a filesystem
      version - print monitor version
    barebox:/

# Menu

It's another great feature

Add Menu Framework

Introduce a menu framework that allow us to create list menu to simplify
barebox and make it more user-frendly.

This kind of menu is very useful when you do not have a keyboard or a
serial console attached to your board to allow you to interact with
barebox

For the developer part, the framework introduces two API

1) C that allow you to create menu, submenu, entry and complex menu
action

2) Command that allow you as the C API to create menu, submenu, entry
and complex menu action but this time the actions will be store in a
function and then be evaluated and excecuted at runtime.

    barebox:/ help menu
    Usage: menu [OPTION]...
    Manage Menu
      -m  menu
      -l  list
      -s  show
    Advanced
      -e  menu entry
      -a  add
      -r  remove
      -S  select

    How to

    Show menu
      (-A auto select delay)
      (-d auto select description)
      menu -s -m <menu> [-A delay] [-d auto_display]

    List menu
      menu -l

    Add a menu
      menu -a -m <name> -d <description>

    Remove a menu
      menu -r -m <name>

    Add an entry
      (-R for do no exit the menu after executing the command)
      (-b for box style 1 for selected)
      (and optional -c for the command to run when we change the state)
      menu -e -a -m <menu> -c <command> [-R] [-b 0|1] -d <description>
    Add a submenu entry
      (-R is not needed)
      (-b for box style 1 for selected)
      (and -c is not needed)
      menu -e -a -m <menu> -u submenu -d [-b 0|1] <description>

    Remove an entry
      menu -e -r -m <name> -n <num>

    Select an entry
      menu -m <menu> -S -n <entry num starting at 1>

    List menu
      menu -e -l [menu]

    Menu example
    menu -a -m boot -d "Boot Menu"
    menu -e -a -m boot -c boot -d "Boot"
    menu -e -a -m boot -c reset -d "Reset"
    menu -s -m boot

An example

    menu -a -m boot -d "Welcome on Barebox Boot Sequence"
    menu -e -a -m boot -c boot -d "   1: linux_2_6_36"
    menu -e -a -m boot -c boot -d "   2: linux_2_6_39"
    menu -e -a -m boot -c boot -d "   3: linux_3_0_0"
    menu -e -a -m boot -c boot -d "   4: installer"
    menu -e -a -m boot -c clear -d "   5: shell"
    menu -e -a -m boot -c reset -d "   6: reset"
    menu -s -m boot

The screen is clear and show

     Welcome on Barebox Boot Sequence
         1: linux_2_6_36
         2: linux_2_6_39
         3: linux_3_0_0
         4: installer
         5: shell
         6: reset
     Auto Select in  1


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Bootloaders](http://eLinux.org/Category:Bootloaders "Category:Bootloaders")

