> From: [eLinux.org](http://eLinux.org/OMAP_Power_Management "http://eLinux.org/OMAP_Power_Management")


# OMAP Power Management



## Contents

-   [1 PM branch](#pm-branch)
    -   [1.1 Features](#features)
    -   [1.2 Current version](#current-version)
        -   [1.2.1 Supported platforms (OMAP3
            only)](#supported-platforms-omap3-only)
    -   [1.3 Using OMAP PM](#using-omap-pm)
        -   [1.3.1 Features](#features-2)
            -   [1.3.1.1 Suspend/Resume](#suspend-resume)
            -   [1.3.1.2 Enabling system for hitting retention during
                idle](#enabling-system-for-hitting-retention-during-idle)
            -   [1.3.1.3 Enabling system for hitting
                OFF](#enabling-system-for-hitting-off)
    -   [1.4 Known Problems](#known-problems)
    -   [1.5 Advanced features for PM developers and power
        users](#advanced-features-for-pm-developers-and-power-users)
        -   [1.5.1 Debug info](#debug-info)
        -   [1.5.2 UART wakeup and timeout
            options](#uart-wakeup-and-timeout-options)
        -   [1.5.3 UART PM Debugging
            Techniques](#uart-pm-debugging-techniques)
    -   [1.6 Public Power management test
        framework](#public-power-management-test-framework)
        -   [1.6.1 Cpufreq utils](#cpufreq-utils)
        -   [1.6.2 Maemo pm\-test](#maemo-pm-test)
        -   [1.6.3 Quick verification of suspend-idle
            functionality](#quick-verification-of-suspend-idle-functionality)

## PM branch

The PM branch is a developement branch of the linux-omap kernel for the
purposes of developing and stabilizing the PM infrastructure for OMAP
and submitting it upstream.

The maintainer of the PM branch is Kevin Hilman.

### Features

-   full-chip retention in idle and suspend
-   full-chip OFF in idle and suspend
-   idle PM via CPUidle
-   support for multiple OMAP3/4 boards

The latest, tested PM branch is available as a branch named
['pm'](http://git.kernel.org/?p=linux/kernel/git/khilman/linux-omap-pm.git;a=shortlog;h=pm)
from the [linux-omap-pm
repository](http://git.kernel.org/?p=linux/kernel/git/khilman/linux-omap-pm.git).
This branch is also sync'd daily as the 'pm' branch of the [main
linux-omap
repository](http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap-2.6.git).



### Current version

#### Supported platforms (OMAP3 only)

Tested on the following platforms using omap3\_pm\_defconfig with
busybox-based initramfs, and tested full-chip RET and OFF in idle and
suspend:

-   3430SDP
-   OMAP3EVM
-   Beagle
-   Overo (Water + Tobi)
-   [Nokia N900](http://eLinux.org/N900 "N900") (a.k.a RX51)
-   Zoom2
-   [KwikByte KBOC](http://www.kwikbyte.com/KBOC.html)

### Using OMAP PM

#### Features

By default, the OMAP is configured to hit full-chip retention in
suspend.

##### Suspend/Resume

    # echo mem > /sys/power/state

Serial console activity or other configured wakeup sources (keypad,
touchscreen) will trigger resume.

Upon resume, you can use the powerdomain state statistics to check
whether all states hit the desired state, cf. 'Debug info'

    # cat /debug/pm_debug/count

In addition, if any power domains did not hit the desired state, you
will see a message on the console.

##### Enabling system for hitting retention during idle

By default, the UARTs will not automatically idle when unused so they
will prevent low-power states during idle. To enable UART idle timeouts
with a 5 second timeout:

    # echo 5 > /sys/devices/platform/omap/omap_uart.0/sleep_timeout
    # echo 5 > /sys/devices/platform/omap/omap_uart.1/sleep_timeout
    # echo 5 > /sys/devices/platform/omap/omap_uart.2/sleep_timeout
    # echo 5 > /sys/devices/platform/omap/omap_uart.3/sleep_timeout

NOTE: the 4th UART is only present on 3630 and OMAP4.

Then, wait for any inactivity timers to expire (such as the 5 second
UART timer) and check the powerdomain transition statistics to see that
transitions are happening

     # cat /debug/pm_debug/count

##### Enabling system for hitting OFF

By default, retention is the deepest sleep state attempted. To enable
power domain transitions to off mode

    # echo 1 > /debug/pm_debug/enable_off_mode

Once again, after a suspend or after some idle time, use the power
domain transition stats to check that transitions to off-mode are
happening

     # cat /debug/pm_debug/count



### Known Problems

-   Zoom2/3: serial console wakeups not working
    -   Problem: on suspend, by default the serial driver will disable
        serial interrupts, thus disabling the GPIO IRQ needed for
        wakeup.
    -   Fix: enable the wakeup feature for the tty used as console:

<!-- -->

     # echo enabled > /sys/devices/platform/serial8250.0/tty/ttyS0/power/wakeup

-   GPIO module-level wakeups not always working
    -   Background: GPIO wakeups can happen either via the GPIO module
        itself (module-level wakeups) or via IO pad wakeups if the CORE
        powerdomain is inactive, in retention or off.
    -   If the IO pad wakeups are not enabled (either because CORE
        remains on, or because IO pad is not armed) GPIO wakeups may not
        happen unless the GPIO module-level wakeups are programmed
        correctly.
    -   To ensure GPIO module wakeups are programmed correctly:
        -   Enable GPIO IRQ for wakeup GPIO, including ISR. Use
            `request_irq()`
        -   Ensure GPIO is edge-triggered. Only edge triggered GPIOs are
            wakeup capable (c.f. omap34xx TRM Sec. 25.5.3.1)
            -   the `flags` argument of `request_irq()` should have
                either `IRQF_TRIGGER_FALLING`, `IRQF_TRIGGER_RISING` or
                both.
        -   Enable GPIO IRQ as wakeup source using
            `enable_irq_wake(gpio_to_irq(<gpio>))`
    -   **NOTE:** It is very important that an interrupt handler be
        configured for the GPIO IRQ, even if it does nothing but return
        `IRQ_HANDLED`. This is because without an interrupt handler, the
        GPIO IRQ event will never be properly cleared and this can
        prevent the GPIO module from hitting retention or off on the
        next idle request (c.f. omap34xx TRM Sec. 25.5.3.1).

-   GPIO wakeup works once, but prevents future retention
    -   See **NOTE** just above

### Advanced features for PM developers and power users

#### Debug info

First, mount the debug filesystem (debugfs)

    # mount -t debugfs debugfs /debug

Show powerdomain state statistics and clockdomain active clocks

    # cat /debug/pm_debug/count

This will look something like this on OMAP3:

     # cat /debug/pm_debug/count
     cefuse_pwrdm (OFF),OFF:1,RET:0,INA:0,ON:0,RET-LOGIC-OFF:0
     always_on_core_pwrdm (OFF),OFF:1,RET:0,INA:0,ON:0,RET-LOGIC-OFF:0
     l4per_pwrdm (ON),OFF:0,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0
     l3init_pwrdm (RET),OFF:0,RET:1,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
     cam_pwrdm (OFF),OFF:1,RET:0,INA:0,ON:0,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
     ivahd_pwrdm (RET),OFF:1,RET:1,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0,RET-MEMBANK3-OFF:0,RET-MEMBANK4-OFF:0
     mpu_pwrdm (ON),OFF:0,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0
     cpu1_pwrdm (ON),OFF:0,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
     cpu0_pwrdm (ON),OFF:0,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
     tesla_pwrdm (RET),OFF:1,RET:1,INA:0,ON:0,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0,RET-MEMBANK3-OFF:0
     dss_pwrdm (RET),OFF:0,RET:1,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
     abe_pwrdm (ON),OFF:1,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0
     gfx_pwrdm (OFF),OFF:2,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
     core_pwrdm (ON),OFF:0,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0,RET-MEMBANK3-OFF:0,RET-MEMBANK4-OFF:0,RET-MEMBANK5-OFF:0

If you see each power domain has counters specified. OFF, RET, INA and
so on...The count basically keeps incrementing every time it hits low
power state. In the above example, cam\_pwrdm (camera power domain) has
hit OFF state once. GFX power domain has hit OFF state twice and like
wise.



#### UART wakeup and timeout options

By default, each of the on-chip OMAP UARTs are enabled as wakeup
sources. In addition, they are configured with a configurable inactivity
timer (default 5 seconds) after which the UART clocks are allowed to be
gated during idle or suspend.

For example, to disable the wakeup capability of a UART1 (a.k.a ttyO0)

     # echo disabled > /sys/devices/platform/omap/omap-hsuart.0/power/wakeup

And to change the inactivity timer to 10 seconds, instead of the default
5:

     # echo 10 > /sys/devices/platform/omap/omap-hsuart.0/sleep_timeout

Note that you can `cat` these files under `/sys` as well to see the
current values.

#### UART PM Debugging Techniques

Debugging problems with the OMAP UART driver wakeup and data transfer
when Power Management is enabled can be quite tedious, if one does not
have a proper HW setup. An example of a setup (including both HW and SW
changes) can be found in the
[OMAP\_UART\_pm\_debugging](http://eLinux.org/OMAP_UART_pm_debugging "OMAP UART pm debugging")
page.





### Public Power management test framework

Some commonly used power management utilities are listed here which make
sense from an OMAP perspective

#### Cpufreq utils

[cpufreq
utils](http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils.html)
for testing dynamic voltage and frequency scaling.

#### Maemo pm\_test

[pm-test](https://garage.maemo.org/projects/pm-test/) plugin for Maemo
[says](https://garage.maemo.org/plugins/wiki/index.php?id=778&type=g)

     utility which tests that kernel and kernel modules works power management wise

This utility could be used to sanity test the powermanagement impact to
a system for suspend/restore and basic power features.

#### Quick verification of suspend-idle functionality

the following script may be used with userspace supporting something
simple as busybox:

    #!/bin/ash
    # Quick script to verify SUSPEND Resume behavior without human intervention
    # Refer: http://elinux.org/OMAP_Power_Management for details

    # Some params that might change based on the environment
    SYS=/sys
    DEBUG=$SYS/kernel/debug
    PROC=/proc

    PMDEBUG=$DEBUG/pm_debug
    VOLTAGE_OFF=$PMDEBUG/voltage_off_mode
    kver=`uname -r`
    if [ $kver > "2.6.36" ]; then
        UART="$SYS/devices/platform/omap/omap-hsuart"
    else
        UART="$SYS/devices/platform/serial8250"
    fi
    UART1=$UART.0/sleep_timeout
    UART2=$UART.1/sleep_timeout
    UART3=$UART.2/sleep_timeout

    # Setup cpu idle
    cpu_idle(){
        echo -n "$1" > $PMDEBUG/sleep_while_idle
    }

    # setup off mode
    off_mode(){
        echo -n "$1" > $PMDEBUG/enable_off_mode
    }

    # Do a suspend
    suspend_me(){
        echo -n "mem" > $SYS/power/state
    }

    # get my core data (This is the last domain to hit lowest power state)
    core_count(){
        cat $PMDEBUG/count |grep "^core_pwrdm"
    }

    # get my retention counter
    core_ret_count(){
        core_count|cut -d ',' -f3|cut -d ':' -f2
    }

    # get my off counter
    core_off_count(){
        core_count|cut -d ',' -f2|cut -d ':' -f2
    }

    # setup wakeup timer - automated testing
    wakeup_timer(){
        echo -n "$1" > $PMDEBUG/wakeup_timer_seconds
        echo -n "$2" > $PMDEBUG/wakeup_timer_milliseconds
    }

    # Setup our uart to be inactivity timer
    setup_tty_sleep_timeout() {
        if [ -f $UART1 ]; then
            echo -n "$1" > $UART1
        fi
        if [ -f $UART2 ]; then
            echo -n "$1" > $UART1
        fi
        if [ -f $UART3 ]; then
            echo -n "$1" > $UART3
        fi

    }

    # Measurement Start
    measure_start(){
        OFF_START=`core_off_count`
        RET_START=`core_ret_count`
        TIME_START=`date "+%s"`
    }
    # Measurement End
    measure_end(){
        OFF_END=`core_off_count`
        RET_END=`core_ret_count`
        TIME_END=`date "+%s"`
    }
    # Common formatted print
    measure_print(){
        DUR=`expr $TIME_END - $TIME_START`
        echo "$1 | $2 | OFF: $OFF_START->$OFF_END| RET:$RET_START->$RET_END ($DUR sec)"
    }

    # verify function
    check_core_off(){
        RESULT=FAIL
        if [ $OFF_START -lt $OFF_END ]; then
            RESULT=PASS
        fi
    }
    check_core_ret(){
        RESULT=FAIL
        if [ $RET_START -lt $RET_END ]; then
            RESULT=PASS
        fi
    }

    # Disable everything
    disable_all(){
        # disable voltage off
        if [ -f $VOLTAGE_OFF ]; then
            echo -n "0" >$VOLTAGE_OFF
        fi
        setup_tty_sleep_timeout 0
        wakeup_timer 0 0
        off_mode 0
        cpu_idle 0
    }

    # test idle - core ret
    test_idle_ret() {
        disable_all
        measure_start
        setup_tty_sleep_timeout 5
        cpu_idle 1
        sleep 20
        disable_all
        sleep 1;sync
        measure_end
        check_core_ret
        measure_print "IDLE:RET test" $RESULT
    }

    # test idle - core off
    test_idle_off() {
        disable_all
        measure_start
        setup_tty_sleep_timeout 5
        off_mode 1
        cpu_idle 1
        sleep 20
        disable_all
        sleep 1;sync
        measure_end
        check_core_off
        measure_print "IDLE:OFF test" $RESULT
    }

    # test suspend - core ret
    test_suspend_ret() {
        disable_all
        measure_start
        wakeup_timer 5 0
        suspend_me
        disable_all
        sleep 1;sync
        measure_end
        check_core_ret
        measure_print "SUSPEND:RET test" $RESULT
    }

    # test suspend - core off
    test_suspend_off() {
        disable_all
        measure_start
        off_mode 1
        wakeup_timer 5 0
        suspend_me
        disable_all
        sleep 1;sync
        measure_end
        check_core_off
        measure_print "SUSPEND:OFF test" $RESULT
    }

    # mount up the basic fs
    already_mntd=`mount|grep $PROC`
    if [ x == x"$already_mntd" ]; then
        mount -t proc none $PROC
    fi

    already_mntd=`mount|grep $SYS`
    if [ x == x"$already_mntd" ]; then
        mount -t sysfs none $SYS
    fi
    already_mntd=`mount|grep $DEBUG`
    if [ x == x"$already_mntd" ]; then
        mount -t debugfs none $DEBUG
    fi
    # Lets run the tests one by one..
    NR=""
    R=`test_suspend_off`
    echo $R
    NR="$NR\n$R"
    R=`test_suspend_ret`
    echo $R
    NR="$NR\n$R"
    R=`test_idle_off`
    echo $R
    NR="$NR\n$R"
    R=`test_idle_ret`
    echo $R
    NR="$NR\n$R"
    # Print End result summary
    cat $PMDEBUG/count

    # Print test summary
    echo -e "$NR"


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [Power
    Management](http://eLinux.org/Category:Power_Management "Category:Power Management")

