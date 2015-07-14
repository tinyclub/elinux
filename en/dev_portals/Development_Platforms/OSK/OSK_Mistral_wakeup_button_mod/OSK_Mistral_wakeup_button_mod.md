> From: [eLinux.org](http://eLinux.org/OSK_Mistral_wakeup_button_mod "http://eLinux.org/OSK_Mistral_wakeup_button_mod")


# OSK Mistral wakeup button mod



The Mistral board has the wakeup button (SW1) wired to the LCD 3.3V
rail, which is powered down during suspend. To allow this button to wake
up the omap, it must be rewired to the main 3.3V rail.

[![Osk mistral wakeup
top.jpg](http://eLinux.org/images/d/de/Osk_mistral_wakeup_top.jpg)](http://eLinux.org/File:Osk_mistral_wakeup_top.jpg)

1.  Rotate R10 (the resistor directly behind SW1) so it is only
    connected to the pad near TP23
2.  Solder a thin wire to the floating end of R10 and drop it through
    the slot for the LCD cable
3.  Solder the other end of the wire to the 3.3V rail (pin \#10 on
    connector J5)

[![Osk mistral wakeup
bottom.jpg](http://eLinux.org/images/c/c0/Osk_mistral_wakeup_bottom.jpg)](http://eLinux.org/File:Osk_mistral_wakeup_bottom.jpg)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")

