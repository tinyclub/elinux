> From: [eLinux.org](http://eLinux.org/PWM.c "http://eLinux.org/PWM.c")


# EVM PWM.c


(Redirected from [PWM.c](http://eLinux.org/index.php?title=PWM.c&redirect=no "PWM.c"))


This seems to work fine, but I only guessed at the registers and
start-up sequence, perhaps someone could verify they are correct. They
certainly work.

``

    // PWM driver - Andrew Armstrong 2007

    // Used a skeleton from somewhere, cannot remember where though - oops!

    #include <linux/config.h>
    #include <linux/kernel.h>
    #include <linux/module.h>
    #include <linux/init.h>
    #include <linux/fs.h>
    #include <linux/major.h>
    #include <linux/root_dev.h>
    #include <asm/uaccess.h>  /* for put_user */
    #include <asm/setup.h>
    #include <asm/semaphore.h>
    #include <asm/hardware/clock.h>
    #include <asm/io.h>
    #include <asm/mach-types.h>

    #include <asm/mach/arch.h>
    #include <asm/mach/map.h>

    #include <asm/arch/hardware.h>

    /*
     *  Prototypes - this would normally go in a .h file
     */
    int init_module(void);
    void cleanup_module(void);
    static int device_open(struct inode *, struct file *);
    static int device_release(struct inode *, struct file *);
    static ssize_t device_read(struct file *, char *, size_t, loff_t *);
    static ssize_t device_write(struct file *, const char *, size_t, loff_t *);

    #define SUCCESS 0
    #define DEVICE_NAME "evm_pwm" /* Dev name as it appears in /proc/devices   */
    #define BUF_LEN 80      /* Max length of the message from the device */

    /*
     * Global variables are declared as static, so are global within the file.
     */

    static int Major;       /* Major number assigned to our device driver */
    static int Device_Open = 0; /* Is device open?
                     * Used to prevent multiple access to device */
    static char msg[BUF_LEN];   /* The msg the device will give when asked */
    static char *msg_Ptr;

    static struct file_operations fops = {
        .read = device_read,
        .write = device_write,
        .open = device_open,
        .release = device_release
    };

    //********************************************************************************

    static int PWMStatus=1; //1 = on 2 = off

    //********************************************************************************

    #define PWM0_BASE           __REG(0x01C22000)

    #define PWM0_PID            __REG(0x01C22000)

    #define PWM0_PCR            __REG(0x01C22004)

    #define PWM0_CFG            __REG(0x01C22008)

    #define PWM0_START          __REG(0x01C2200C)

    #define PWM0_RPT            __REG(0x01C22010)

    #define PWM0_PER            __REG(0x01C22014)

    #define PWM0_PH1D           __REG(0x01C22018)

    void pwm_power(int option)
    {

        if(option==0)
        {
            PWM0_CFG   = 0x00000000;
            PWMStatus = 0;
        }
        else
        {
            PWM0_PCR   = 0x00000001;
            PWM0_CFG   = 0x00000001;
            PWM0_RPT   = 0x99999999;
            PWM0_PER   = 0x00002000;
            PWM0_PH1D  = 0x00001000;
            PWM0_START = 0x00000001;
            PWMStatus = 1;
        }
    }

    //AA07 Checks a character for a boolean 0 or 1 returns appropriately, returns 999 on error
    int checkchar(char s)
    {

        if (s >= '0' && s <= '1')
        {
            if (s == '0')
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
        else
        {
            return 999;
        }

    }

    int init_module(void)
    {
            Major = register_chrdev(0, DEVICE_NAME, &fops);

        if (Major < 0) {
          printk(KERN_ALERT "Registering char device failed with %d\n", Major);
          return Major;
        }

        printk(KERN_INFO "Create driver node:- 'mknod /dev/%s c %d 0'.\n", DEVICE_NAME, Major);
        printk(KERN_INFO "[cat] to see status and [echo 0] for off and [1] for on\n");

        printk(KERN_ALERT "Turning PWM on (default setting)\n");
        pwm_power(0);
        pwm_power(1);

        return 0;
    }

    /*
     * This function is called when the module is unloaded
     */
    void cleanup_module(void)
    {
        /*
         * Unregister the device
         */
        int ret = unregister_chrdev(Major, DEVICE_NAME);
        if (ret < 0)
            printk(KERN_ALERT "Error in unregister_chrdev: %d\n", ret);
    }

    /*
     * Methods
     */

    /*
     * Called when a process tries to open the device file, like
     * "cat /dev/mycharfile"
     */
    static int device_open(struct inode *inode, struct file *file)
    {
        if (Device_Open)
            return -EBUSY;

        Device_Open++;
        sprintf(msg, "%d\n", PWMStatus);
        msg_Ptr = msg;
        try_module_get(THIS_MODULE);

        return SUCCESS;
    }

    /*
     * Called when a process closes the device file.
     */
    static int device_release(struct inode *inode, struct file *file)
    {
        Device_Open--;      /* We're now ready for our next caller */

        /*
         * Decrement the usage count, or else once you opened the file, you'll
         * never get get rid of the module.
         */
        module_put(THIS_MODULE);

        return 0;
    }

    /*
     * Called when a process, which already opened the dev file, attempts to
     * read from it.
     */
    static ssize_t device_read(struct file *filp,   /* see include/linux/fs.h   */
                   char *buffer,    /* buffer to fill with data */
                   size_t length,   /* length of the buffer     */
                   loff_t * offset)
    {
        /*
         * Number of bytes actually written to the buffer
         */
        int bytes_read = 0;

        /*
         * If we're at the end of the message,
         * return 0 signifying end of file
         */
        if (*msg_Ptr == 0)
            return 0;

        /*
         * Actually put the data into the buffer
         */
        while (length && *msg_Ptr) {

            /*
             * The buffer is in the user data segment, not the kernel
             * segment so "*" assignment won't work.  We have to use
             * put_user which copies data from the kernel data segment to
             * the user data segment.
             */
            put_user(*(msg_Ptr++), buffer++);

            length--;
            bytes_read++;
        }

        /*
         * Most read functions return the number of bytes put into the buffer
         */
        return bytes_read;
    }

    /*
     * Called when a process writes to dev file: echo "hi" > /dev/hello
     */
    static ssize_t
    device_write(struct file *filp, const char *buff, size_t len, loff_t * off)
    {
        int i = checkchar(buff[0]);

        if (i == 999)
        {
            printk(KERN_ALERT "Error in option, use 0 (off) or 1 (on)\n");
        }
        else
        {
            printk(KERN_ALERT "Setting value %d :- 0 (off) or 1 (on)\n",i);
            pwm_power(i);
        }

        return len;

    }


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DaVinci](http://eLinux.org/Category:DaVinci "Category:DaVinci")

