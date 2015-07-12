> From: [eLinux.org](http://eLinux.org/Temp_sens.c "http://eLinux.org/Temp_sens.c")


# Temp sens.c



Grab hold of a "Microchip TC74" temperature sensor IC, a TO220 is easy
to handle, and hook it up to the bus using the pins as shown in the
hardware hack section. Make sure you use a 3.3v part.

-   [http://ww1.microchip.com/downloads/en/devicedoc/21462c.pdf](http://ww1.microchip.com/downloads/en/devicedoc/21462c.pdf)



``

    // Temp Sensor Talkies - Andrew Armstrong 2007

    #include <stdio.h>
    #include <fcntl.h>
    #include <sys/ioctl.h>


    #define I2C_DEVICE  "/dev/i2c/0"
    #define I2C_SLAVE  0x0703

    // Write to I2c

    int i2c_read (int slaveaddr, unsigned char *buffer, int length)
    {
        int i2c_fd;
        int red;

        if( (i2c_fd = open( I2C_DEVICE, O_RDWR)) < 0)
        {
            printf( "Unable to open the i2c port!\n");
            return 100;
        }

        if( ioctl( i2c_fd, I2C_SLAVE, slaveaddr) == -1)
        {
            close( i2c_fd);
            printf( "Unable to setup the i2c port!\n");
            return 101;
        }

        red=read( i2c_fd, buffer, length);

        close( i2c_fd);

        return 0;
    }

    //Whats the temperature

    void printtemp()
    {
        char dbuff[2];

        //***TEMPERATURE

        i2c_read (0x48, dbuff, 1);

        printf ("Temperature :- %d degrees C\n", dbuff[0]);
    }

    int main(void)
    {
        printtemp();

        return 0;

    }


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Software](http://eLinux.org/Category:Software "Category:Software")

