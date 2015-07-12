> From: [eLinux.org](http://eLinux.org/Pollux_JTAG_with_Wiggler "http://eLinux.org/Pollux_JTAG_with_Wiggler")


# Pollux JTAG with Wiggler



## Introduction

For now I'm just going to dump my configuration files here that I use to
debug the kernel. To speed up the debug process, I use
[Micromon](http://code.jeffkent.net/trac/nc600/wiki/MicromonBootloader)
to load the kernel to memory, rather than waiting on the slow Wiggler.

Please see [Pollux JTAG with
FTDI](http://elinux.org/Didj,_Explorer_and_eGo_(Pollux)_FTDI_JTAG_How_To)
or the [Didj JTAG How To](http://elinux.org/Didj_JTAG_How_To) for more
info on OpenOCD or GDB.

## openocd.cfg

    interface parport
    parport_port 0
    parport_cable wiggler
    # length of reset signal: [ms]
    jtag_nsrst_assert_width 100
    # don't talk to JTAG after reset for: [ms]
    jtag_nsrst_delay 250
    reset_config trst_and_srst separate
    # end reset config
    # reset_config trst_only
    if { [info exists CHIPNAME] } {
      set  _CHIPNAME $CHIPNAME
    } else {
      set  _CHIPNAME pollux
    }
    if { [info exists ENDIAN] } {
      set  _ENDIAN $ENDIAN
    } else {
      set  _ENDIAN little
    }
    if { [info exists CPUTAPID ] } {
      set _CPUTAPID $CPUTAPID
    } else {
      # force an error till we get a good number
      set _CPUTAPID 0x07926f0f
    }
    #jtag scan chain
    jtag newtap $_CHIPNAME cpu -irlen 4 -expected-id $_CPUTAPID
    set _TARGETNAME $_CHIPNAME.cpu
    target create $_TARGETNAME arm926ejs -endian $_ENDIAN -chain-position $_TARGETNAME -variant arm926ejs

## .gdbinit

    define dmesg
      set $log_buf = log_buf
      set $log_end = log_end
      set $log_buf_len = log_buf_len
     set $logged_chars = logged_chars

      set $i = 0
      set $end_idx = (log_end - 1) & (log_buf_len - 1)
      while ($i < logged_chars)
        set $idx = (log_end - 1 - logged_chars + $i) & (log_buf_len - 1)
        printf "%c", log_buf[$idx]
        set $i = $i + 1
      end
    end
    document dmesg
      print the kernel ring buffer
    end

    define reload
      # restart the target
      mon reset

      # load_kernel.py is assumed in your path, which is a
      # modified version of micromon's boot_kernel.py that
      # does not execute the kernel after loading or start
      # the console
      shell load_kernel.py arch/arm/boot/Image

      # stop the looping cpu running in Thumb mode
      mon halt

      # switch back to ARM
      mon arm core_state arm

      # this register must be 0
      mon reg r0 0

      # platform id
      mon reg r1 2028

      # -1
      mon reg r2 0xFFFFFFFF

      # kernel start address
      mon reg pc 0x00008000

      # load the symbols from the debug kernel
      symbol-file vmlinux
    end
    document reload
    reload
    Resets the target and reloads the kernel, halted at the kernel entry point
    end

    target remote :3333
    mon target_request debugmsgs charmsg
    mon arm7_9 fast_memory_access enable
    mon arm7_9 dcc_downloads enable
    reload


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [Augen
    eGo](http://eLinux.org/index.php?title=Category:Augen_eGo&action=edit&redlink=1 "Category:Augen eGo (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

