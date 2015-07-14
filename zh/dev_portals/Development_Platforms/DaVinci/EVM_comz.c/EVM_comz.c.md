> From: [eLinux.org](http://eLinux.org/EVM_comz.c "http://eLinux.org/EVM_comz.c")


# EVM comz.c



This is a handy, simple terminal program to talk to your EVM from the
command line.

``


    #include <termios.h>
    #include <stdio.h>
    #include <unistd.h>
    #include <fcntl.h>
    #include <sys/signal.h>
    #include <sys/types.h>
    #include <sys/ioctl.h>

    int transfer_byte(int from, int to, int is_control);

    typedef struct {char *name; int flag; } speed_spec;


    void print_status(int fd) {
        int status;
        unsigned int arg;
        status = ioctl(fd, TIOCMGET, &arg);
        fprintf(stderr, "[STATUS]: ");
        if(arg & TIOCM_RTS) fprintf(stderr, "RTS ");
        if(arg & TIOCM_CTS) fprintf(stderr, "CTS ");
        if(arg & TIOCM_DSR) fprintf(stderr, "DSR ");
        if(arg & TIOCM_CAR) fprintf(stderr, "DCD ");
        if(arg & TIOCM_DTR) fprintf(stderr, "DTR ");
        if(arg & TIOCM_RNG) fprintf(stderr, "RI ");
        fprintf(stderr, "\r\n");
    }

    main(int argc, char *argv[])
    {
        int comfd;
        struct termios oldtio, newtio;       //place for old and new port settings for serial port
        struct termios oldkey, newkey;       //place tor old and new port settings for keyboard teletype
        char *devicename = argv[1];
        int need_exit = 0;
        speed_spec speeds[] =
        {
            {"1200", B1200},
            {"2400", B2400},
            {"4800", B4800},
            {"9600", B9600},
            {"19200", B19200},
            {"38400", B38400},
            {"57600", B57600},
            {"115200", B115200},
            {NULL, 0}
        };
        int speed = B115200;

        fprintf(stderr,"\nTTY Comms Interface\n\n");

        if(argc < 2) {
            fprintf(stderr, "example: %s /dev/ttyS0 [115200]\n", argv[0]);
            fprintf(stderr, "Defaulting to /dev/ttyUSB0 at 115200\n");
            devicename="/dev/ttyUSB0";
        }

        comfd = open(devicename, O_RDWR | O_NOCTTY | O_NONBLOCK);
        if (comfd < 0)
        {
            perror(devicename);
            exit(-1);
        }

        if(argc > 2) {
            speed_spec *s;
            for(s = speeds; s->name; s++) {
                if(strcmp(s->name, argv[2]) == 0) {
                    speed = s->flag;
                    fprintf(stderr, "setting speed %s\n", s->name);
                    break;
                }
            }
        }

        fprintf(stderr, "CTRL-a exit, CTRL-x modem lines status\n");

        tcgetattr(STDIN_FILENO,&oldkey);
        newkey.c_cflag = speed | CRTSCTS | CS8 | CLOCAL | CREAD;
        newkey.c_iflag = IGNPAR;
        newkey.c_oflag = 0;
        newkey.c_lflag = 0;
        newkey.c_cc[VMIN]=1;
        newkey.c_cc[VTIME]=0;
        tcflush(STDIN_FILENO, TCIFLUSH);
        tcsetattr(STDIN_FILENO,TCSANOW,&newkey);


        tcgetattr(comfd,&oldtio); // save current port settings
        newtio.c_cflag = B115200 | CS8 | CREAD;
        newtio.c_iflag = IGNPAR;
        newtio.c_oflag = 0;
        newtio.c_lflag = 0;
        newtio.c_cc[VMIN]=1;
        newtio.c_cc[VTIME]=0;
        tcflush(comfd, TCIFLUSH);
        tcsetattr(comfd,TCSANOW,&newtio);

        print_status(comfd);

        while(!need_exit) {
            fd_set fds;
            int ret;

            FD_ZERO(&fds);
            FD_SET(STDIN_FILENO, &fds);
            FD_SET(comfd, &fds);


            ret = select(comfd+1, &fds, NULL, NULL, NULL);
            if(ret == -1) {
                perror("select");
            } else if (ret > 0) {
                if(FD_ISSET(STDIN_FILENO, &fds)) {
                    need_exit = transfer_byte(STDIN_FILENO, comfd, 1);
                } else if(FD_ISSET(comfd, &fds)) {
                    need_exit = transfer_byte(comfd, STDIN_FILENO, 0);
                }
            }
        }

        tcsetattr(comfd,TCSANOW,&oldtio);
        tcsetattr(STDIN_FILENO,TCSANOW,&oldkey);
        close(comfd);
    }


    int transfer_byte(int from, int to, int is_control) {
        char c;
        int ret;
        ret = read(from, &c, 1);
        if(ret == 1) {
            if(is_control) {
                if(c == '\x01') { // C-a
                    return -1;
                } else if(c == '\x18') { // C-x
                    print_status(to);
                    return 0;
                }
            }
            if(write(to, &c, 1) != 1) {
                perror("write failed");
            }
        }
        return 0;
    }




[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DaVinci](http://eLinux.org/Category:DaVinci "Category:DaVinci")

