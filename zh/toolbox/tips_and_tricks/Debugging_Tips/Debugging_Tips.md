> From: [eLinux.org](http://eLinux.org/Debugging_Tips "http://eLinux.org/Debugging_Tips")


# Debugging Tips



-   See the [Debugging\_Portal](http://eLinux.org/Debugging_Portal "Debugging Portal")
    page
-   See the [Kernel Debugging
    Tips](http://eLinux.org/Kernel_Debugging_Tips "Kernel Debugging Tips") page
-   See also [Debugging
    Makefiles](http://eLinux.org/Debugging_Makefiles "Debugging Makefiles")
-   [Debugging by
    printing](http://eLinux.org/Debugging_by_printing "Debugging by printing")
-   Debug user-space initialization:
    -   If you get a panic - "not syncing: Attempted to kill init!" it
        can be for many different reasons. Try setting
        CONFIG\_DEBUG\_USER=y in your .config and pass 'user\_debug=255'
        in the kernel command line. That will give you a more verbose
        output about why user space programs crash. Thanks to Daniel
        Mack on the linux-arm-kernel mailing list for this tip.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")

