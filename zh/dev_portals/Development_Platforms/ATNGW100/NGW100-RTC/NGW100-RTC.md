> From: [eLinux.org](http://eLinux.org/NGW100-RTC "http://eLinux.org/NGW100-RTC")


# NGW100-RTC



## Contents

-   [1 Adding an external RTC](#adding-an-external-rtc)
    -   [1.1 Enabling it in Linux](#enabling-it-in-linux)
-   [2 Setting the system clock from RTC at boot
    time](#setting-the-system-clock-from-rtc-at-boot-time)
-   [3 Schematics](#schematics)

## Adding an external RTC

Unfortunately the RTC embedded in the AT32AP700x is not battery backed
(and no battery can be added) and consequently loses the time on
powerloss. In order to keep the time one has to add an external rtc.

I've choosen the simple DS1672 Binary Counter RTC from Maxim IC
[[1]](http://www.maxim-ic.com/quick_view2.cfm/qv_pk/2750), as it is
already supported in the linux kernel. (Device-Drivers-\>RTC-\>DS1672,
CONFIG\_RTC\_DRV\_DS1672') and as it is quite cheap and simple.

### Enabling it in Linux

Select support for i2c, i2c-gpio, rtc, rtc-ds1672 in the Kernel config,
either as module or compiled in. (either via 'make menuconfig', or for
Buildroot 'make linux26-menunonfig')

In arch/avr32/boards/atngw100/setup.c add {I2C\_BOARD\_INFO("ds1672",
0x68), }, to static struct i2c\_board\_info \_\_initdata i2c\_info[]
(line 169)

OR compile and load this simple module/driver:

    #include <linux/i2c.h>
    #include <linux/rtc.h>
    #define DRV_VERSION "0.1"
    static struct i2c_board_info i2c_info = {I2C_BOARD_INFO("ds1672", 0x68)};
    static struct i2c_client *i2c_client;
    static int __init ngw_ds1672_init(void)
    {
       struct i2c_adapter *adap = i2c_get_adapter(0);//we only have 1 i2c.
       i2c_client = i2c_new_device(adap,&i2c_info);
       return 0;
    }
    static void __exit ngw_ds1672_exit(void)
    {
       i2c_unregister_device(i2c_client);
    }
    MODULE_AUTHOR("Peter Huewe <peterhuewe <!at!> gmx.de>");
    MODULE_DESCRIPTION("Register Dallas/Maxim DS1672 i2c-client");
    MODULE_LICENSE("GPL");
    MODULE_VERSION(DRV_VERSION);
    module_init(ngw_ds1672_init);
    module_exit(ngw_ds1672_exit);

## Setting the system clock from RTC at boot time

In order to use the external RTC as a reference clock, I'd recommend
adding the line to setup.c and compile in the drivers mentioned above
(i2c, i2c-gpio, rtc, rtc-ds1672).

Then, in the kernel config, set 'CONFIG\_RTC\_HCTOSYS\_DEVICE' to 'rtc1'
in order to use the external RTC as reference clock.

    Location:
     -> Device Drivers
      -> Real Time Clock
       -> Set system time from RTC on startup and resume
         -> RTC used to set the system time (change this from rtc0 to rtc1)



## Schematics

In order to ease the wiring of the ds1762 I created some schematics


 [![Ds1672-rtc
Schaltplan.png](http://eLinux.org/images/5/52/Ds1672-rtc_Schaltplan.png)](http://eLinux.org/File:Ds1672-rtc_Schaltplan.png)
[![Ds1672-rtc
Steckplatine.png](http://eLinux.org/images/a/a7/Ds1672-rtc_Steckplatine.png)](http://eLinux.org/File:Ds1672-rtc_Steckplatine.png)

Schematics / Image created with
[fritzing](http://eLinux.org/index.php?title=Fritzing&action=edit&redlink=1 "Fritzing (page does not exist)")
- [[2]](http://fritzing.org/)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [HOWTOs](http://eLinux.org/Category:HOWTOs "Category:HOWTOs")

