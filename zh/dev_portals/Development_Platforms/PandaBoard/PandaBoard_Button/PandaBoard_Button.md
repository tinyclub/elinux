> From: [eLinux.org](http://eLinux.org/PandaBoard_Button "http://eLinux.org/PandaBoard_Button")


# PandaBoard Button



## UserSpace Access

the push button can be accessed via the sysfs interface as well as a
shell script functionality. the sysfs entry for the push button can be
found in the directory marked /sys/devices/platform/ . each button will
be listed as gpio-keys follow by a number.

## Adding New PushButtons

the gpio buttons are defined in the linux kernel machine file. in this
case for pandaboard it would be in
arch/arm/mach-omap2/board-omap4panda.c file. each button requires that
the gpio be defined, a name, and key scan code associated with it. in
addition standard platform data and platform device have to be defined.

    static struct gpio_keys_button gpio_keys_buttons[] = {
        [0] = {
                .code       = 0x26,
                .gpio           = 39,
                .active_low     = 0,
                .desc           = "PB0",
        },
    };

    static struct gpio_keys_platform_data gpio_keys_data = {
            .buttons   = gpio_keys_buttons,
                .nbuttons   = ARRAY_SIZE(gpio_keys_buttons),
    };

    static struct platform_device pandaboard_buttons = {
        .name       = "gpio-keys",
        .id     = 0,
        .dev        = {
            .platform_data = &gpio_keys_data,
        },
    };

## PushButton Hardware

[![Pb-example-1v8.jpg](http://eLinux.org/images/b/ba/Pb-example-1v8.jpg)](http://eLinux.org/File:Pb-example-1v8.jpg)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

