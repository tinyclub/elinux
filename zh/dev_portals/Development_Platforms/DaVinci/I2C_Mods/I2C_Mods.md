> From: [eLinux.org](http://eLinux.org/I2C_Mods "http://eLinux.org/I2C_Mods")


# EVM I2C Mods


(Redirected from [I2C
Mods](http://eLinux.org/index.php?title=I2C_Mods&redirect=no "I2C Mods"))


You can hook into the I2C at a convenient location, namely one of the
I2C expanders.

Just hook your device (make sure its a 3.3v variant!) to the SCL and SDA
lines on the expander and get the 3.3v from either the expander or
elsewhere on the board.

The code for accessing your device will be similar to the LED flash
function [REF NEEDED] listed in the software area.

[![EVMI2c.jpg](http://eLinux.org/images/2/21/EVMI2c.jpg)](http://eLinux.org/File:EVMI2c.jpg)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Categories](http://eLinux.org/Category:Categories "Category:Categories")

