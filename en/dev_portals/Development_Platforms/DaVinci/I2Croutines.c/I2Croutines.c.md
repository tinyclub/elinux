> From: [eLinux.org](http://eLinux.org/I2Croutines.c "http://eLinux.org/I2Croutines.c")


# EVM I2Croutines.c


(Redirected from
[I2Croutines.c](http://eLinux.org/index.php?title=I2Croutines.c&redirect=no "I2Croutines.c"))


A bunch of various I2C routines I have had on occasion to use.

``

    //I2C Routines - Andrew Armstrong 2007

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

    // Read From I2c

    int i2c_write (int slaveaddr, unsigned char *buffer, int length)
    {

     int i2c_fd;

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


     write( i2c_fd, buffer, length);

     waitz();

     close( i2c_fd);

     return 0;
    }

    //Write to a particular register
    int i2c_write_reg (int slaveaddr, int xregister, int data)
    {

     int i2c_fd;
     char dbuff[10];

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

     dbuff[0] = xregister;
     dbuff[1] = data;

     write( i2c_fd, dbuff, 2);

     close( i2c_fd);

     return 0;
    }

    //Read, but from a word address
    int i2c_read_word (int slaveaddr, unsigned char *dregister, unsigned char *buffer, int length)
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

     write( i2c_fd, dregister, 2);

     red=read( i2c_fd, buffer, length);

     close( i2c_fd);

     return 0;
    }


    //Write, but to a word address
    int i2c_write_word (int slaveaddr,unsigned char *dregister, unsigned char *buffer, int length)
    {

     int i2c_fd;
     char output[20]; //18 byte buffer + 2 byte address
     int i=0;

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

     output[0] = dregister[0];
     output[1] = dregister[1];

     for (i=2; i<length+2;i++)
     {
      output[i] = buffer[i-2];
     }

     write( i2c_fd, output, length+2);

     close( i2c_fd);

     return 0;
    }

    void main(void)
    {

     //blah

    }


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DaVinci](http://eLinux.org/Category:DaVinci "Category:DaVinci")
-   [Software](http://eLinux.org/Category:Software "Category:Software")
-   [I2C](http://eLinux.org/index.php?title=Category:I2C&action=edit&redlink=1 "Category:I2C (page does not exist)")

