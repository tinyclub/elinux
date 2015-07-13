> From: [eLinux.org](http://eLinux.org/SMC_WSKP100 "http://eLinux.org/SMC_WSKP100")


# SMC WSKP100



<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><p>The SMC WSKP100 Wifi Skype phone is a Linux running phone meant to be used for Skype over wifi without having to use a computer. It retails for around $150 and comes with a 1.8&quot; CSTN LCD (128 x 160, 65K colors), Mini USB and earphone ports, various buttons/keys including volume and directional buttons, ARM9 processor, and 802.11G capable wifi module. You can buy the phone from <a href="http://www.amazon.com/SMC-WSKP100-802-11G-Wireless-Skype/dp/B000INI1H8/">Amazon</a>.</p>
<p>The phone has a custom built Linux distribution made by SMC to run the Skype binaries. The goal of this project is to make a custom Linux image for the phone to run other software besides Skype. Since the processor in the phone is ARM9 based, it could be used for some other more interesting solutions including the possibility of creating a full SIP based phone or even a wifi mesh of wifi phones.</p>
<h3><strong>Known Components:</strong></h3>
<hr />
<pre><code>* TI OMAP1710
      o 220 MHz ARM926TEJ and MS320C55x DSP SoC
* TI TSC2101
      o 4-Wire Touch Screen Controller
      o St. DAC / Mono ADC with HP/Speaker Amplifier
* Samsung K4S56163PF
      o 4M x 16bit x 4 banks (256Mbit) SDRAM
* Intel 28F128L18B
      o 16MB NOR Flash
* TI TPS65013
      o 1-cell Li-Ion Power Mgmt IC
      o USB/AC Charger, 2DC/DC, 2 LDOs, I2C interface
      o http://www.ti.com/lit/gpn/tps65013
* Marvell 88W8385-BDK1
      o 802.11B/G WiFi</code></pre>
<p>(source: <a href="http://wiki.gpl-devices.org/index.php/SMC_WSKP100G">http://wiki.gpl-devices.org/index.php/SMC_WSKP100G</a> )</p>
<h3><strong>Status:</strong></h3>
<hr />
<p><em>August 15, 2007:</em> I'm currently awaiting for my phone to arrive. While I'm waiting, I'm gathering as much information about the phone as possible. Since the WSKP100 has a 1.8v serial port, I ordered samples of the MAX3218 so I can hook it up to a computer. Also, I was able to extract the binary firmware images from the firmware flashing tool provided by SMC by just running the tool in Windows and copying them out of c:\winnt\Temp\Skypyphone\Flasher before closing the application. However, it seems the images are encrypted. I also tried the same method with the firmware flasher from the very similar yet more expensive SMCWSP-100 and at least some of the images are not encrypted. This might prove useful as I could possibly re-use things from the SMCWSP-100 for this one and can most likely use the SMCWSP-100's firmware flasher to flash the WSKP100.</p>
<p>(sources: <a href="http://spritesmods.com/?art=wskpsip">http://spritesmods.com/?art=wskpsip</a> and <a href="http://wiki.gpl-devices.org/index.php/SMC_WSKP100G">http://wiki.gpl-devices.org/index.php/SMC_WSKP100G</a> )</p>
<p><em>August 16, 2007:</em> I've succesfully mounted one of the jffs2 images from the firmware flasher of the SMCWSP-100 since they aren't encrypted. While doing this, I decided to make two really simple bash scripts to simplify mounting and umounting jffs2 images since the process isn't so simple. You can check the scripts out here: <a href="http://elinux.org/Mount_jffs2" title="Mount jffs2">mount_jffs2</a> and <a href="http://elinux.org/Umount_jffs2" title="Umount jffs2">umount_jffs2</a>. These scripts assume you're mounting/umounting one jffs2 image at a time. Obviously there is no guarantee that these scripts won't mess up your system or will even work for you. You have been warned :-)</p>
<p>(sources: <a href="http://linux-7110.sourceforge.net/howtos/netbook_new/x1125.htm">http://linux-7110.sourceforge.net/howtos/netbook_new/x1125.htm</a> )</p>
<p><em>August 17, 2007:</em> I've been going through the jffs2 images of the SMCWSP-100 and been finding some interesting things. The first major one is that SMC is using Qtopia for the GUI. Another tidbit came from GPSFan in #edev (irc.freenode.net) that in /root/sbin/QCopSend there is references to crosstool-0.32, gcc-3.42 and glibc-2.2.5. Also, some leftovers from the original programmers/system designers have been found, which are always interesting to see. I'm hoping to see similar things in the firmware for the WSKP100, but I'll have to wait till I hook it upto a serial port and gain root access to the running system as its firmware images are encrypted.</p>
<h3><strong>Interesting Links and Hacks:</strong></h3>
<hr />
<p><a href="http://spritesmods.com/?art=wskpsip">http://spritesmods.com/?art=wskpsip</a> - A hack involving installing the firmware from SMCs Wifi SIP phone onto this phone</p>
<p><a href="http://www.wifiphone24.com/download.aspx">http://www.wifiphone24.com/download.aspx</a> - SMC's Download page for firmware for the phone and GPL'd sources</p>
<p><a href="http://www.smc.com/index.cfm?event=downloads.doSearchCriteria&amp;localeCode=EN_GBR&amp;knowsPartNumber=false&amp;productCategory=14&amp;modelNumber=1560&amp;partNumber=3429&amp;downloadType=0&amp;os=20">http://www.smc.com/index.cfm?event=downloads.doSearchCriteria&amp;localeCode=EN_GBR&amp;knowsPartNumber=false&amp;productCategory=14&amp;modelNumber=1560&amp;partNumber=3429&amp;downloadType=0&amp;os=20</a> - Another Download page for firmware &amp; source</p>
<p><a href="http://www.wifiphone24.com/tech_specification.aspx">http://www.wifiphone24.com/tech_specification.aspx</a> - SMC's Tech Specs for the phone</p>
<p><a href="http://linux.omap.com/">http://linux.omap.com/</a> - Official TI OMAP Linux</p>
<p><a href="http://www.muru.com/linux/omap/">http://www.muru.com/linux/omap/</a> - Unofficial OMAP Linux</p>
<p><a href="http://free-electrons.com/articles/omap">http://free-electrons.com/articles/omap</a> - More info on OMAP Linux</p>
<p><a href="http://linux.omap.com/pub/documentation/omap_1710v1.4.txt">http://linux.omap.com/pub/documentation/omap_1710v1.4.txt</a> - Some interesting info on installing Linux on a OMAP1710 H3 Board</p>
<p><a href="http://www.nmacleod.com/nokia/schematics/N770_Schematics.pdf">http://www.nmacleod.com/nokia/schematics/N770_Schematics.pdf</a> - Schematic of the Nokia 770 which shows pin descriptions of the OMAP1710</p>
<p><a href="http://www-s.ti.com/sc/psheets/mpbg284a/mpbg284a.pdf">http://www-s.ti.com/sc/psheets/mpbg284a/mpbg284a.pdf</a> - Pin Layout of the OMAP1710's BGA package</p>
<p><a href="http://git.infradead.org/?p=libertas-2.6.git;a=summary">http://git.infradead.org/?p=libertas-2.6.git;a=summary</a> - Driver for the onboard Wifi module</p></td>
<td align="left"><p><a href="http://elinux.org/File:Phone_skype.jpg"><img src="http://elinux.org/images/1/1a/Phone_skype.jpg" alt="Phone skype.jpg" /></a></p></td>
</tr>
</tbody>
</table>

* * * * *

--[G1powermac](http://eLinux.org/index.php?title=User:G1powermac&action=edit&redlink=1 "User:G1powermac (page does not exist)")
[g1powermac@yahoo.com] 02:00, 18 August 2007 (EEST)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware
    Hacking](http://eLinux.org/Category:Hardware_Hacking "Category:Hardware Hacking")

