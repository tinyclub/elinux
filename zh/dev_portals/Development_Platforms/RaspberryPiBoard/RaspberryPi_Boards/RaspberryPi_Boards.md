> From: [eLinux.org](http://eLinux.org/RaspberryPi_Boards "http://eLinux.org/RaspberryPi_Boards")


# RaspberryPi Boards



## Hardware versions/revisions

Several different boards have been found probably from different
assembly lines, and the following table tries to help you identify your
board for better troubleshooting. These differences are being debated on
raspberrypi.org on this thread
[[1]](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=28&t=9524&start=25)

For what we can see for model B boards there are mainly two versions
that differ on the type RAM used, Samsung (S) and Hynix (H).


 Note: For **Board ver.** we used: \<model\>\<RAM Maker\>\<production
date\> (ex.: BS1218 is "Model B, Samsung RAM, 18th week of 2012")

Look for the date of manufacturing printed with the year and week (back
side, board edge near LAN connector). In this example year (2012) and
week (18th):

[![Date of
manufacturing.jpg](http://eLinux.org/images/thumb/6/60/Date_of_manufacturing.jpg/54px-Date_of_manufacturing.jpg)](http://eLinux.org/File:Date_of_manufacturing.jpg)

[](http://eLinux.org/File:Date_of_manufacturing.jpg "Enlarge")




 **Model A:**

<table>
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<thead>
<tr class="header">
<th align="left">Board
<p>ver.</p></th>
<th align="left">RAM
<p>Chip</p></th>
<th align="left">USB
<p>Chip</p></th>
<th align="left">C6</th>
<th align="left">F1 / F2
<p>Ref. &amp; Ohm</p></th>
<th align="left">RG2</th>
<th align="left">Reported issues / Feedback</th>
<th align="left">Front</th>
<th align="left">Back</th>
<th align="left">Distributor</th>
<th align="left">Owner</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">AS1245</td>
<td align="left">Samsung
<pre><code>225
K4P2G324ED-AGC1
GAC0288J</code></pre></td>
<td align="left">N/A</td>
<td align="left"><pre><code>220
CFP
20N</code></pre></td>
<td align="left">N/A</td>
<td align="left"><pre><code>17-33G
RQB44</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">RS</td>
<td align="left"><a href="http://elinux.org/User:AndrewS" title="User:AndrewS">AndrewS</a></td>
</tr>
</tbody>
</table>


 **Model B:**

<table>
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<thead>
<tr class="header">
<th align="left">Board
<p>ver.</p></th>
<th align="left">RAM
<p>Chip</p></th>
<th align="left">USB
<p>Chip</p></th>
<th align="left">C6</th>
<th align="left">F1 / F2
<p>Ref. &amp; Ohm</p></th>
<th align="left">RG2</th>
<th align="left">Reported issues / Feedback</th>
<th align="left">Front</th>
<th align="left">Back</th>
<th align="left">Distributor</th>
<th align="left">Owner</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">BS1321</td>
<td align="left">Samsung
<pre><code>316
K4P4G324EB-AGC1
GKDVBRGCU</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
81319-A1B17
3194KPA
CTI-TW</code></pre></td>
<td align="left"><pre><code>220
CFP
3G6</code></pre></td>
<td align="left">None/None</td>
<td align="left"><pre><code>17-33G
RQC18</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-Board_Bv2-Front.jpg"><img src="http://elinux.org/images/thumb/c/c8/RaspberryPi-Board_Bv2-Front.jpg/100px-RaspberryPi-Board_Bv2-Front.jpg" alt="RaspberryPi-Board Bv2-Front.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-Board_Bv2-Front.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-Board_Bv2-Back.jpg"><img src="http://elinux.org/images/thumb/d/d8/RaspberryPi-Board_Bv2-Back.jpg/100px-RaspberryPi-Board_Bv2-Back.jpg" alt="RaspberryPi-Board Bv2-Back.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-Board_Bv2-Back.jpg" title="Enlarge"></a></td>
<td align="left">Farnell / element-14</td>
<td align="left"><a href="http://elinux.org/User:Otousama" title="User:Otousama">Otousama</a></td>
</tr>
<tr class="even">
<td align="left">BM1320</td>
<td align="left">Micron
<pre><code>3DAI8
D9QHN
CZ22</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
81319-A1B17
3194KQA
CTI-TW</code></pre></td>
<td align="left"><pre><code>220
CFP
3G6</code></pre></td>
<td align="left">None/None</td>
<td align="left"><pre><code>SE8117T33
1304-LF</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:BM1320-Front.JPG"><img src="http://elinux.org/images/thumb/7/71/BM1320-Front.JPG/100px-BM1320-Front.JPG" alt="BM1320-Front.JPG" /></a>
<a href="http://elinux.org/File:BM1320-Front.JPG" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:BM1320-Back.JPG"><img src="http://elinux.org/images/thumb/1/1f/BM1320-Back.JPG/100px-BM1320-Back.JPG" alt="BM1320-Back.JPG" /></a>
<a href="http://elinux.org/File:BM1320-Back.JPG" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left"><a href="http://elinux.org/User:V_Tom" title="User:V Tom">V Tom</a></td>
</tr>
<tr class="odd">
<td align="left">AS1251</td>
<td align="left">Samsung
<pre><code>301
K4P4G324EB-AGC1
GKKS23HAU</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
81244-A1817
BR1525858
CTI-TW</code></pre></td>
<td align="left"><pre><code>220
CFP
2BD</code></pre></td>
<td align="left">None/None</td>
<td align="left"><pre><code>17-33G
RQB44</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell / element-14</td>
<td align="left"><a href="http://elinux.org/User:SiBaz" title="User:SiBaz">SiBaz</a></td>
</tr>
<tr class="even">
<td align="left">BS1240</td>
<td align="left">Samsung
<pre><code>301
K4P4G324EB-AGC1
GKI3619P</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1231-A1B17
8R151387B
CTI-TW</code></pre></td>
<td align="left"><pre><code>220
CFP
2GO</code></pre></td>
<td align="left">None/None</td>
<td align="left"><pre><code>17-33G
RSB39</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell / element-14</td>
<td align="left"><a href="http://elinux.org/User:Jwdietrich" title="User:Jwdietrich">jwdietrich</a></td>
</tr>
<tr class="odd">
<td align="left">BS1215</td>
<td align="left">Samsung</td>
<td align="left">SMSC</td>
<td align="left"><pre><code>220
16V
EEZ</code></pre></td>
<td align="left"> ?
<p>? / ?</p></td>
<td align="left"></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell</td>
<td align="left">SN</td>
</tr>
<tr class="even">
<td align="left">BS1215</td>
<td align="left">Samsung</td>
<td align="left">SMSC</td>
<td align="left"><pre><code>n2
220
UD</code></pre></td>
<td align="left"> ?
<p>? / ?</p></td>
<td align="left"></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell</td>
<td align="left">SN</td>
</tr>
<tr class="odd">
<td align="left">BS1215</td>
<td align="left">Samsung
<pre><code>216
K4P2G324ED-AGC1
GA30419V</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1211-A1B17
BR149884A
CTI-TW</code></pre></td>
<td align="left"><pre><code>n2
220C
UD</code></pre></td>
<td align="left">14
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117733
943-1F</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell</td>
<td align="left"><a href="http://elinux.org/User:AndrewS" title="User:AndrewS">AndrewS</a></td>
</tr>
<tr class="even">
<td align="left">BS1301</td>
<td align="left">Samsung
<pre><code>301
K4P4G32F4EB-AGC1
GKL438GHU
(512MB version)</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
81244-A1817
BR1525858
CTI-TW</code></pre></td>
<td align="left"><pre><code>220
CFP
28D</code></pre></td>
<td align="left">N/A</td>
<td align="left"><pre><code>17-33G
RQB44</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell</td>
<td align="left"><a href="http://elinux.org/User:AndrewS" title="User:AndrewS">AndrewS</a></td>
</tr>
<tr class="odd">
<td align="left">BS1218</td>
<td align="left">Samsung
<pre><code>216
K4P2G324ED-AGC1
GAL0839V</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1212-A1B17
BR149884S</code></pre></td>
<td align="left"><pre><code>220
16V
EE5</code></pre></td>
<td align="left">T014
<p>3.8 / 4.4</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-Board_A-Front.JPG"><img src="http://elinux.org/images/thumb/c/c1/RaspberryPi-Board_A-Front.JPG/100px-RaspberryPi-Board_A-Front.JPG" alt="RaspberryPi-Board A-Front.JPG" /></a>
<a href="http://elinux.org/File:RaspberryPi-Board_A-Front.JPG" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-Board_A-Back.JPG"><img src="http://elinux.org/images/thumb/0/0d/RaspberryPi-Board_A-Back.JPG/100px-RaspberryPi-Board_A-Back.JPG" alt="RaspberryPi-Board A-Back.JPG" /></a>
<a href="http://elinux.org/File:RaspberryPi-Board_A-Back.JPG" title="Enlarge"></a></td>
<td align="left">Farnell</td>
<td align="left">marcoalexcampos</td>
</tr>
<tr class="even">
<td align="left">BS1218</td>
<td align="left">Samsung
<pre><code>216
K4P2G324ED-AGC1
GAJ0419C</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1212-A1B17
BR149884S</code></pre></td>
<td align="left"><pre><code>220
16V
EE5</code></pre></td>
<td align="left">T014
<p>5.8 / 3.9</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:Antijn_raspi_farnell_top.jpg"><img src="http://elinux.org/images/thumb/3/3a/Antijn_raspi_farnell_top.jpg/100px-Antijn_raspi_farnell_top.jpg" alt="Antijn raspi farnell top.jpg" /></a>
<a href="http://elinux.org/File:Antijn_raspi_farnell_top.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:Antijn_raspi_farnell_bot.jpg"><img src="http://elinux.org/images/thumb/1/15/Antijn_raspi_farnell_bot.jpg/100px-Antijn_raspi_farnell_bot.jpg" alt="Antijn raspi farnell bot.jpg" /></a>
<a href="http://elinux.org/File:Antijn_raspi_farnell_bot.jpg" title="Enlarge"></a></td>
<td align="left">Farnell</td>
<td align="left">antijn</td>
</tr>
<tr class="odd">
<td align="left">BS1218</td>
<td align="left">Samsung</td>
<td align="left"> ?</td>
<td align="left"><pre><code></code></pre></td>
<td align="left"> ?
<p>? / ?</p></td>
<td align="left"></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-BS1218-Front-JakeBlues.jpg"><img src="http://elinux.org/images/thumb/2/2e/RaspberryPi-BS1218-Front-JakeBlues.jpg/100px-RaspberryPi-BS1218-Front-JakeBlues.jpg" alt="RaspberryPi-BS1218-Front-JakeBlues.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-BS1218-Front-JakeBlues.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-BS1218-Back-JakeBlues.jpg"><img src="http://elinux.org/images/thumb/4/46/RaspberryPi-BS1218-Back-JakeBlues.jpg/100px-RaspberryPi-BS1218-Back-JakeBlues.jpg" alt="RaspberryPi-BS1218-Back-JakeBlues.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-BS1218-Back-JakeBlues.jpg" title="Enlarge"></a></td>
<td align="left">Farnell</td>
<td align="left">JakeBlues</td>
</tr>
<tr class="even">
<td align="left">BH1208</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LANDM 149A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1134-A1B17
8R147769B
STA-SG</code></pre></td>
<td align="left"><pre><code>220
16V
EE2</code></pre></td>
<td align="left">14</td>
<td align="left"><pre><code>SE8117T33
1001-LF</code></pre></td>
<td align="left"><ul>
<li>No issues after getting a good power supply</li>
<li>Note the SMSC is 8R149482C which I suspect is the same for the others.</li>
<li>Ethernet: LU1S041ALF 1018M</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-BS1208-Front-MarkBeckett.JPG"><img src="http://elinux.org/images/thumb/1/1b/RaspberryPi-BS1208-Front-MarkBeckett.JPG/100px-RaspberryPi-BS1208-Front-MarkBeckett.JPG" alt="RaspberryPi-BS1208-Front-MarkBeckett.JPG" /></a>
<a href="http://elinux.org/File:RaspberryPi-BS1208-Front-MarkBeckett.JPG" title="Enlarge"></a></td>
<td align="left">Error creating thumbnail: Invalid thumbnail parameters
<a href="http://elinux.org/File:RaspberryPi-BS1208-Back-MarkBeckett.JPG" title="Enlarge"></a></td>
<td align="left">Farnell</td>
<td align="left">MarkBeckett</td>
</tr>
<tr class="odd">
<td align="left">BH1219</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LANDM 218A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1206-A1B17
8R149471A
CTI-TW</code></pre></td>
<td align="left"><pre><code>220
16V
2E2</code></pre></td>
<td align="left">T014</td>
<td align="left"><pre><code>SE8117T33
1217-LF</code></pre></td>
<td align="left"><ul>
<li>No issues</li>
<li>Ethernet: HanRun HR901110A 1220</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPI_1219_RS_Pi_1_MCB1.JPG"><img src="http://elinux.org/images/thumb/5/5b/RaspberryPI_1219_RS_Pi_1_MCB1.JPG/100px-RaspberryPI_1219_RS_Pi_1_MCB1.JPG" alt="RaspberryPI 1219 RS Pi 1 MCB1.JPG" /></a>
<a href="http://elinux.org/File:RaspberryPI_1219_RS_Pi_1_MCB1.JPG" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPI_1219_RS_Pi_2_MCB1.JPG"><img src="http://elinux.org/images/thumb/9/9f/RaspberryPI_1219_RS_Pi_2_MCB1.JPG/100px-RaspberryPI_1219_RS_Pi_2_MCB1.JPG" alt="RaspberryPI 1219 RS Pi 2 MCB1.JPG" /></a>
<a href="http://elinux.org/File:RaspberryPI_1219_RS_Pi_2_MCB1.JPG" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left">MarkBeckett</td>
</tr>
<tr class="even">
<td align="left">BH1218</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LRNOM 217A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1215-A1B17
BR1501888</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">14
<p>6.4 / 5.0</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>USB/Keyboard/LAN issues</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:Antijn_raspi_RS_top.jpg"><img src="http://elinux.org/images/thumb/d/d6/Antijn_raspi_RS_top.jpg/100px-Antijn_raspi_RS_top.jpg" alt="Antijn raspi RS top.jpg" /></a>
<a href="http://elinux.org/File:Antijn_raspi_RS_top.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:Antijn_raspi_RS_bot.jpg"><img src="http://elinux.org/images/thumb/c/ce/Antijn_raspi_RS_bot.jpg/100px-Antijn_raspi_RS_bot.jpg" alt="Antijn raspi RS bot.jpg" /></a>
<a href="http://elinux.org/File:Antijn_raspi_RS_bot.jpg" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left">antijn</td>
</tr>
<tr class="odd">
<td align="left">BH1218</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LRNDM 217A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1215-A1817
BR1494828</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">14
<p>6.1 / 5.6</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>&quot;I haven't had any issues&quot;<a href="http://www.raspberrypi.org/phpBB3/viewtopic.php?f=28&amp;t=9524&amp;start=50">[2]</a></li>
<li>Ethernet HR901110A 1211</li>
<li>E2112RSV1.0B1.1</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">RS</td>
<td align="left">dukla2000</td>
</tr>
<tr class="even">
<td align="left">BS1219</td>
<td align="left">Samsung</td>
<td align="left">SMSC</td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">T014
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-A1219-Front.jpg"><img src="http://elinux.org/images/thumb/d/d6/RaspberryPi-A1219-Front.jpg/100px-RaspberryPi-A1219-Front.jpg" alt="RaspberryPi-A1219-Front.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-A1219-Front.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-A1219-Back.jpg"><img src="http://elinux.org/images/thumb/3/39/RaspberryPi-A1219-Back.jpg/100px-RaspberryPi-A1219-Back.jpg" alt="RaspberryPi-A1219-Back.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-A1219-Back.jpg" title="Enlarge"></a></td>
<td align="left">Farnell</td>
<td align="left">Troublesome</td>
</tr>
<tr class="odd">
<td align="left">BH1208</td>
<td align="left">Hynix</td>
<td align="left">SMSC</td>
<td align="left"><pre><code>220
16V
EE2</code></pre></td>
<td align="left">14
<p>? / ?</p></td>
<td align="left"> ?</td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:Raspberry-pi-top.jpg"><img src="http://elinux.org/images/thumb/7/76/Raspberry-pi-top.jpg/100px-Raspberry-pi-top.jpg" alt="Raspberry-pi-top.jpg" /></a>
<a href="http://elinux.org/File:Raspberry-pi-top.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:Raspberry-pi-bottom.jpg"><img src="http://elinux.org/images/thumb/b/b8/Raspberry-pi-bottom.jpg/100px-Raspberry-pi-bottom.jpg" alt="Raspberry-pi-bottom.jpg" /></a>
<a href="http://elinux.org/File:Raspberry-pi-bottom.jpg" title="Enlarge"></a></td>
<td align="left">Farnell</td>
<td align="left">selsinork</td>
</tr>
<tr class="even">
<td align="left">BH1213</td>
<td align="left">Hynix</td>
<td align="left">SMSC</td>
<td align="left"><pre><code>n2
220c
UD</code></pre></td>
<td align="left">14
<p>? / ?</p></td>
<td align="left">&lt;blank&gt;</td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-Board_C-Front.jpg"><img src="http://elinux.org/images/thumb/6/63/RaspberryPi-Board_C-Front.jpg/100px-RaspberryPi-Board_C-Front.jpg" alt="RaspberryPi-Board C-Front.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-Board_C-Front.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-Board_C-Back.jpg"><img src="http://elinux.org/images/thumb/b/b1/RaspberryPi-Board_C-Back.jpg/100px-RaspberryPi-Board_C-Back.jpg" alt="RaspberryPi-Board C-Back.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-Board_C-Back.jpg" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">BH1213</td>
<td align="left">Hynix
<pre><code>h9tknnn2c0mp
landm 1494</code></pre></td>
<td align="left">SMSC
<pre><code>lan9512-jzx
b1134 a1b17 8r14
77698
sta-sg</code></pre></td>
<td align="left"><pre><code>n2
220c
UD</code></pre></td>
<td align="left">14
<p>? / ?</p></td>
<td align="left">&lt;blank&gt;</td>
<td align="left"><ul>
<li>&quot;pretty stable&quot;</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-B1213-Front-RaTTuS.jpg"><img src="http://elinux.org/images/thumb/8/80/RaspberryPi-B1213-Front-RaTTuS.jpg/100px-RaspberryPi-B1213-Front-RaTTuS.jpg" alt="RaspberryPi-B1213-Front-RaTTuS.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-B1213-Front-RaTTuS.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-B1213-Back-RaTTuS.jpg"><img src="http://elinux.org/images/thumb/0/05/RaspberryPi-B1213-Back-RaTTuS.jpg/100px-RaspberryPi-B1213-Back-RaTTuS.jpg" alt="RaspberryPi-B1213-Back-RaTTuS.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-B1213-Back-RaTTuS.jpg" title="Enlarge"></a></td>
<td align="left">Farnell</td>
<td align="left">RaTTuS</td>
</tr>
<tr class="even">
<td align="left">BS12xx</td>
<td align="left">Samsung
<pre><code>216 k4p
26324ED
agc1</code></pre></td>
<td align="left">SMSC
<pre><code>lan9512-jzx
b1212 a1b17
br149884b
cti-tw</code></pre></td>
<td align="left"><pre><code>220
16V
EE5</code></pre></td>
<td align="left"> ?
<p>? / ?</p></td>
<td align="left"></td>
<td align="left"><ul>
<li>OK &quot;has not been stress tested yet&quot;</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell</td>
<td align="left">RaTTuS</td>
</tr>
<tr class="odd">
<td align="left">BH1218</td>
<td align="left">Hynix
<pre><code>h9trnnn2g0mp
lrndm 217a</code></pre></td>
<td align="left">SMSC
<pre><code>lan9512-jzy
b1215-a1b17
ase-tw</code></pre></td>
<td align="left"><pre><code>2e
220
16h</code></pre></td>
<td align="left">14
<p>? / ?</p></td>
<td align="left"><pre><code>Se8117t33
12-13 cf</code></pre></td>
<td align="left"><ul>
<li>&quot;stable good runner overclocked to 900mhz&quot;</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-B1218-Front-RaTTuS.jpg"><img src="http://elinux.org/images/thumb/f/fe/RaspberryPi-B1218-Front-RaTTuS.jpg/100px-RaspberryPi-B1218-Front-RaTTuS.jpg" alt="RaspberryPi-B1218-Front-RaTTuS.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-B1218-Front-RaTTuS.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-B1218-Back-RaTTuS.jpg"><img src="http://elinux.org/images/thumb/4/49/RaspberryPi-B1218-Back-RaTTuS.jpg/100px-RaspberryPi-B1218-Back-RaTTuS.jpg" alt="RaspberryPi-B1218-Back-RaTTuS.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-B1218-Back-RaTTuS.jpg" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left">RaTTuS</td>
</tr>
<tr class="even">
<td align="left">BH1218</td>
<td align="left">Hynix</td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1215-A1B17
BR150188A
ASE-TW (e3)</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">14
<p>8.2 / 5.9</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>USB/Keyboard/LAN power down<a href="http://www.raspberrypi.org/phpBB3/viewtopic.php?p=109984#p109984">[3]</a></li>
<li></li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-Board_B-Front.JPG"><img src="http://elinux.org/images/thumb/f/f6/RaspberryPi-Board_B-Front.JPG/100px-RaspberryPi-Board_B-Front.JPG" alt="RaspberryPi-Board B-Front.JPG" /></a>
<a href="http://elinux.org/File:RaspberryPi-Board_B-Front.JPG" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-Board_B-Back.JPG"><img src="http://elinux.org/images/thumb/9/9c/RaspberryPi-Board_B-Back.JPG/100px-RaspberryPi-Board_B-Back.JPG" alt="RaspberryPi-Board B-Back.JPG" /></a>
<a href="http://elinux.org/File:RaspberryPi-Board_B-Back.JPG" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left">marcoalexcampos</td>
</tr>
<tr class="odd">
<td align="left">BH1218</td>
<td align="left">Hynix</td>
<td align="left">SMSC</td>
<td align="left"><pre><code>2B
220
16H</code></pre></td>
<td align="left"> ?
<p>6-7 / 6-7</p></td>
<td align="left"></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">RS</td>
<td align="left">SN</td>
</tr>
<tr class="even">
<td align="left">BH1218</td>
<td align="left">Hynix</td>
<td align="left">SMSC</td>
<td align="left"><pre><code>2B
220
16H</code></pre></td>
<td align="left"> ?
<p>? / ?</p></td>
<td align="left"></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">RS</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">BH1218</td>
<td align="left">Hynix</td>
<td align="left">SMSC</td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">F014
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-B1218-Front.jpg"><img src="http://elinux.org/images/thumb/8/8b/RaspberryPi-B1218-Front.jpg/100px-RaspberryPi-B1218-Front.jpg" alt="RaspberryPi-B1218-Front.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-B1218-Front.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-B1218-Back.jpg"><img src="http://elinux.org/images/thumb/3/30/RaspberryPi-B1218-Back.jpg/100px-RaspberryPi-B1218-Back.jpg" alt="RaspberryPi-B1218-Back.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-B1218-Back.jpg" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left">Troublesome</td>
</tr>
<tr class="even">
<td align="left">BH1218</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LANDM 217A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1215-A1B17
BR150188B
ASE-TW (e3)</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">14
<p>6.9 / 5.9</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RPi1T.jpg"><img src="http://elinux.org/images/thumb/c/c5/RPi1T.jpg/100px-RPi1T.jpg" alt="RPi1T.jpg" /></a>
<a href="http://elinux.org/File:RPi1T.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RPi1B.jpg"><img src="http://elinux.org/images/thumb/9/90/RPi1B.jpg/100px-RPi1B.jpg" alt="RPi1B.jpg" /></a>
<a href="http://elinux.org/File:RPi1B.jpg" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left">Mortimer</td>
</tr>
<tr class="odd">
<td align="left">BH1218</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LANDM 218A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1215-A1B17
BR150188A
ASE-TW (e3)</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">14
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RPi2T.jpg"><img src="http://elinux.org/images/thumb/c/c4/RPi2T.jpg/100px-RPi2T.jpg" alt="RPi2T.jpg" /></a>
<a href="http://elinux.org/File:RPi2T.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RPi2B.jpg"><img src="http://elinux.org/images/thumb/9/97/RPi2B.jpg/100px-RPi2B.jpg" alt="RPi2B.jpg" /></a>
<a href="http://elinux.org/File:RPi2B.jpg" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left">Mortimer</td>
</tr>
<tr class="even">
<td align="left">BH1218</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LRNOM 217A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1215-A1B17
8R150188B
ASE-TW (e3)</code></pre></td>
<td align="left"><pre><code>2E
22-
16H</code></pre></td>
<td align="left">14
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>D1 shorted when attaching a Neewer HDMI to VGA adapter. The adapter has had no other tests and the raspberry pi's HDMI output has not been connected to any other devices before or since.</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-BH1218-Front-Tom1989.jpg"><img src="http://elinux.org/images/thumb/c/c4/RaspberryPi-BH1218-Front-Tom1989.jpg/100px-RaspberryPi-BH1218-Front-Tom1989.jpg" alt="RaspberryPi-BH1218-Front-Tom1989.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-BH1218-Front-Tom1989.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RaspberryPi-BH1218-Back-Tom1989.jpg"><img src="http://elinux.org/images/thumb/e/e0/RaspberryPi-BH1218-Back-Tom1989.jpg/100px-RaspberryPi-BH1218-Back-Tom1989.jpg" alt="RaspberryPi-BH1218-Back-Tom1989.jpg" /></a>
<a href="http://elinux.org/File:RaspberryPi-BH1218-Back-Tom1989.jpg" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left">Tom1989</td>
</tr>
<tr class="odd">
<td align="left">BH1208</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LANDM 149A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1134-A1B17
BR147769B
STA-SG</code></pre></td>
<td align="left"><pre><code>220
16V
EE2</code></pre></td>
<td align="left"> ?
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1001-LF</code></pre></td>
<td align="left"><ul>
<li>Stable, powers up off any charger. Powers off laptop USB without any issues</li>
<li>Ethernet: LU1S041ALF 1018M</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell</td>
<td align="left">Tass</td>
</tr>
<tr class="even">
<td align="left">BH1213</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LANDM 149A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1134-A1B17
BR147769B
STA-SG</code></pre></td>
<td align="left"><pre><code>n2
220C
UD</code></pre></td>
<td align="left"> ?
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
943-LF</code></pre></td>
<td align="left"><ul>
<li>Stable, no power issues (not thouroughly tested)</li>
<li>Ethernet: HR901110A 1211|</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">RS</td>
<td align="left">Tass</td>
</tr>
<tr class="odd">
<td align="left">BH1218</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LANDM 217A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1216-A1B17
8R149482C
ASE-TW (e3)</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">14
<p>14 / 5.1</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>Up headless with Squeeze and Wheezy for ~six weeks, light duty, no problems</li>
<li>Ethernet: HR901110A 1211</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:Rpi001F.jpg"><img src="http://elinux.org/images/thumb/2/2e/Rpi001F.jpg/100px-Rpi001F.jpg" alt="Rpi001F.jpg" /></a>
<a href="http://elinux.org/File:Rpi001F.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:Rpi001R.jpg"><img src="http://elinux.org/images/thumb/0/06/Rpi001R.jpg/100px-Rpi001R.jpg" alt="Rpi001R.jpg" /></a>
<a href="http://elinux.org/File:Rpi001R.jpg" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left">Davidm870</td>
</tr>
<tr class="even">
<td align="left">BS1218</td>
<td align="left">Samsung
<pre><code>216
K42P2G324ED-AGG1
GAL0839T</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1212-A1B17
8R149885A
ASE-TW (e3)</code></pre></td>
<td align="left"><pre><code>220
16V
EE5</code></pre></td>
<td align="left">T014
<p>T014 / ?</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>Comes upp headless with Wheezy, not tested extensively</li>
<li>Ethernet: HR901110A 1218</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:Rpi002F.jpg"><img src="http://elinux.org/images/thumb/9/9f/Rpi002F.jpg/100px-Rpi002F.jpg" alt="Rpi002F.jpg" /></a>
<a href="http://elinux.org/File:Rpi002F.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:Rpi002R.jpg"><img src="http://elinux.org/images/thumb/d/d2/Rpi002R.jpg/100px-Rpi002R.jpg" alt="Rpi002R.jpg" /></a>
<a href="http://elinux.org/File:Rpi002R.jpg" title="Enlarge"></a></td>
<td align="left">Farnell</td>
<td align="left">Davidm870</td>
</tr>
<tr class="odd">
<td align="left">BS1219</td>
<td align="left">Samsung
<pre><code>216
K4P2G324ED-AGC1
GAL0859V</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1216-A1B17
8R149482C
ASE-TW (e3)</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">T014
<p>2.9ohm / 3.0ohm</p></td>
<td align="left"><pre><code>SE8117T33
0941-LF</code></pre></td>
<td align="left"><ul>
<li>First had problems (freezing, no LAN, etc.) due to low quality power supply - cheap ebay adaptor. Solved with own <a href="http://elinux.org/RPi_5V_PSU_construction" title="RPi 5V PSU construction">PSU construction</a> with 7805 stabiliser adjusted to 5.25V. Now works OK with Raspbian “wheezy”, but not yet tested extensively.</li>
<li>Ethernet: HR901110A 1220</li>
<li>F3 0.3ohm</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RPi-BS1219-Front_Pinoccio.jpg"><img src="http://elinux.org/images/thumb/e/e1/RPi-BS1219-Front_Pinoccio.jpg/100px-RPi-BS1219-Front_Pinoccio.jpg" alt="RPi-BS1219-Front Pinoccio.jpg" /></a>
<a href="http://elinux.org/File:RPi-BS1219-Front_Pinoccio.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RPi-BS1219-Back_Pinoccio.jpg"><img src="http://elinux.org/images/thumb/9/91/RPi-BS1219-Back_Pinoccio.jpg/100px-RPi-BS1219-Back_Pinoccio.jpg" alt="RPi-BS1219-Back Pinoccio.jpg" /></a>
<a href="http://elinux.org/File:RPi-BS1219-Back_Pinoccio.jpg" title="Enlarge"></a></td>
<td align="left">Farnell</td>
<td align="left"><a href="http://elinux.org/User:Pinoccio" title="User:Pinoccio">Pinoccio</a></td>
</tr>
<tr class="even">
<td align="left">BS1219</td>
<td align="left">Samsung
<pre><code>216
K4P2G324ED-AGC1
GAL0859D</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1216-A1B17
8R149482C
ASE-TW (e3)</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">T014 / T014
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
0941-LF</code></pre></td>
<td align="left"><ul>
<li>No issues</li>
<li>Ethernet: HanRun HR901110A 1220</li>
<li>FN120659744</li>
</ul></td>
<td align="left">Error creating thumbnail: Invalid thumbnail parameters
<a href="http://elinux.org/File:RPi-BS1219-Front_slabua.jpg" title="Enlarge"></a></td>
<td align="left">Error creating thumbnail: Invalid thumbnail parameters
<a href="http://elinux.org/File:RPi-BS1219-Back_slabua.jpg" title="Enlarge"></a></td>
<td align="left">Farnell</td>
<td align="left">[SLB] <a href="http://twitter.com/slabua">@slabua</a></td>
</tr>
<tr class="odd">
<td align="left">BH1222</td>
<td align="left">Hynix
<pre><code>H9TKNNN2GDMP
LANDM 214A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1215-A1B17
8R148168E
ASE-TW (e3)</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">T014 / T014
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1217-LF</code></pre></td>
<td align="left"><ul>
<li>No issues</li>
<li>Ethernet: HanRun HR901110A 1225</li>
<li>E2712RSV1.0B1.1</li>
</ul></td>
<td align="left">Error creating thumbnail: Invalid thumbnail parameters
<a href="http://elinux.org/File:RPi-BH1222-Front_slabua.jpg" title="Enlarge"></a></td>
<td align="left">Error creating thumbnail: Invalid thumbnail parameters
<a href="http://elinux.org/File:RPi-BH1222-Back_slabua.jpg" title="Enlarge"></a></td>
<td align="left">RS</td>
<td align="left">[SLB] <a href="http://twitter.com/slabua">@slabua</a></td>
</tr>
<tr class="even">
<td align="left">BS1224</td>
<td align="left">Samsung
<pre><code>222
K4P2G324ED-AGC1
GAA0419T</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1222-A1B17
8R150543C
CTI-TW (e3)</code></pre></td>
<td align="left"><pre><code>2F
220
16H</code></pre></td>
<td align="left">T014 / T014
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1217-LF</code></pre></td>
<td align="left"><ul>
<li>Ethernet: HanRun HR901110A 1225</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell</td>
<td align="left">accumulator</td>
</tr>
<tr class="odd">
<td align="left">BS1224</td>
<td align="left">Samsung
<pre><code>222
K4P2G324ED-AGC1
GAA0519H</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1223-A1B17
8R15D81DA
CTI-TW (e3)</code></pre></td>
<td align="left"><pre><code>2F
220
16H</code></pre></td>
<td align="left">0000 / 0000
<p>0 / 0</p></td>
<td align="left"><pre><code>SE8117T33
1220-LF</code></pre></td>
<td align="left"><ul>
<li>Ethernet: HanRun HR901110A 1225</li>
<li>No Issues</li>
<li>Note: F1 and F2 are black 0 ohm resistors instead of green polyfuses</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RPi-BS1224-Front_Shuckle.jpg"><img src="http://elinux.org/images/thumb/c/c9/RPi-BS1224-Front_Shuckle.jpg/100px-RPi-BS1224-Front_Shuckle.jpg" alt="RPi-BS1224-Front Shuckle.jpg" /></a>
<a href="http://elinux.org/File:RPi-BS1224-Front_Shuckle.jpg" title="Enlarge"></a></td>
<td align="left"></td>
<td align="left">Farnell</td>
<td align="left">shuckle</td>
</tr>
<tr class="even">
<td align="left">BS1218</td>
<td align="left">Samsung
<pre><code>216
K4P2G324ED-AGC1
GAL0839R</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1215-A1B17
8R150188B
ASE-TW
(e3)</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">F014
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1213-LF</code></pre></td>
<td align="left"><ul>
<li>None</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell</td>
<td align="left">d4lamar</td>
</tr>
<tr class="odd">
<td align="left">BS1222</td>
<td align="left">Samsung
<pre><code>225
K4P2G324ED-AGC1
GAC0289E</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1227-A1B17
8R1511968
CTI-TW (e3)</code></pre></td>
<td align="left"><pre><code>2F
220
16H</code></pre></td>
<td align="left">0000 / 0000
<p>0 / 0</p></td>
<td align="left"><pre><code>SE8117T33
1217-LF</code></pre></td>
<td align="left"><ul>
<li>Ethernet: HanRun HR901110A 1228</li>
<li>Both boards by wcfields ordered at the same time/date.</li>
<li>Note: F1 and F2 are black 0 ohm resistors instead of green polyfuses</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">MCM</td>
<td align="left">wcfields</td>
</tr>
<tr class="even">
<td align="left">BS1232</td>
<td align="left">Samsung
<pre><code>225
K4P2G324ED-AGC1
GAC0289H</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1227-A1B17
8R151261A
CTI-TW (e3)</code></pre></td>
<td align="left"><pre><code>2F
220
16H</code></pre></td>
<td align="left">0000 / 0000
<p>0 / 0</p></td>
<td align="left"><pre><code>SE8117T33
1225-LF</code></pre></td>
<td align="left"><ul>
<li>Ethernet: HanRun HR901110A 1228</li>
<li>Both boards by wcfields ordered at the same time/date.</li>
<li>Note: F1 and F2 are black 0 ohm resistors instead of green polyfuses</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">MCM</td>
<td align="left">wcfields</td>
</tr>
<tr class="odd">
<td align="left">BS1228</td>
<td align="left">Samsung
<pre><code>234
K4P2G324ED-AGC1
GAK1229X</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1228-A1B17
8R151303B
CTI-TW (e3)</code></pre></td>
<td align="left"><pre><code>2E
220
16H</code></pre></td>
<td align="left">0000 / 0000
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1220-LF</code></pre></td>
<td align="left"><ul>
<li>Serious problems with the 4GB SDHC-Card ordered with the board on initial testing with Gentoo (corrupted FS)</li>
<li>Same issues using rasbian and two different supported SD cards</li>
<li>Using RS original power adapter</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">RC</td>
<td align="left">FKlama</td>
</tr>
<tr class="even">
<td align="left">BS1233</td>
<td align="left">Samsung
<pre><code>231
K4P4G324EB-AGC1
GKG0609V
(512MB version)</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1227-A1B17
8R151261A
CTI-TW (e3)</code></pre></td>
<td align="left"><pre><code>2E
220
CFP
2G6</code></pre></td>
<td align="left">None / None
<p>? / ?</p></td>
<td align="left"><pre><code>17-33G
RRB32 (ON)</code></pre></td>
<td align="left"><ul>
<li>Ethernet Jack: No visible branding</li>
<li>PS: 500mA Mobile phone charger &amp; USB Port on Laptop and Desktop (These are all I had). Works with blackberry 8520 550mA charger.</li>
<li>Fuse(s): ONLY seems to have green polyswitch (F3) on bottom side of board F1 and F2 don't exist</li>
<li>In the position of the (other fuses) there is a mounting hole, likewise there is also a mounting hole under the Raspberry Pi Logo.</li>
</ul>
<ul>
<li>There is also an extra header (P5) defined on the bottom side of the PCB near P1 (which is on the top side)</li>
<li>Won't boot with a known working (This same card will boot on BS1215 ) Kingston 4GB Class 4 SD Card, Raspbian &quot;wheezy&quot; 2012-09-18.</li>
<li>When using raspbmc powered with 550ma blackberry 8520 charger, keyboard and mouse disconnects frequently also external hard drive unmounts frequently.</li>
<li>When using torrents and connected with usb wireless adapter (tested with Netgear WNA1000M), when torrent picks up speed, raspbian becomes unstable. Same works well over Ethernet.</li>
<li>The unit WILL boot from the SD card bought from Element 14.</li>
<li>Will add more when I know more.</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Farnell/Element14 (AU)</td>
<td align="left">TheSteveB</td>
</tr>
<tr class="odd">
<td align="left">BS1236</td>
<td align="left">Samsung
<pre><code>225
K4P46324EB-AGC1
GKEM509X
(512MB version)</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1232-A1B17
8R151680A
CTI-TW (e3)</code></pre></td>
<td align="left"><pre><code>2F
220
16H</code></pre></td>
<td align="left">None / None
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1225-LF</code></pre></td>
<td align="left"><ul>
<li>Ethernet Jack: HanRun HT901110A 1228</li>
<li>Seems to randomly power off on 3 different PS's (650mA, 900mA and 1A) (<a href="http://www.raspberrypi.org/phpBB3/viewtopic.php?f=28&amp;t=22353">http://www.raspberrypi.org/phpBB3/viewtopic.php?f=28&amp;t=22353</a>)</li>
<li>Extra header, F1, F2 and F3 and mounting holes just like BS1233</li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">RS</td>
<td align="left">Yaron</td>
</tr>
<tr class="even">
<td align="left">BS1238</td>
<td align="left">Samsung
<pre><code>225
K4P4G324EB-AGC1
GKFX1390
(512MB version)</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
B1232-A1B17
8R151549A
CTI-TW (e3)</code></pre></td>
<td align="left"><pre><code>2H
220
16H</code></pre></td>
<td align="left">None / None
<p>? / ?</p></td>
<td align="left"><pre><code>SE8117T33
1225-LF</code></pre></td>
<td align="left"><ul>
<li>Ethernet Jack: HanRun HR901110A 1230</li>
<li>With extra header P5, missing fuses F1 and F2, and with mounting holes just like BS1233</li>
<li>Weird stability problems. Can build Quake3, and can play it for a little while, but eventually locks up (black screen, loses ethernet link). Putting it in the Adafruit case seems to exacerbate the problem.</li>
<li>Highest temp measured by <code>vcgencmd measure_temp</code> is 53.5C. Last measured temp before lockup was 53.0C</li>
<li>Problem occurs with both the Adafruit power supply as well as my Nexus 7 2A supply.</li>
<li>Tested with at least 3 different Micro-USB cables.</li>
<li>Tested with the 4GB Dane-Elec Class 4 MicroSD card from Adafruit, as well as an 8GB Class 10 SanDisk full-size SD card.</li>
<li>Voltages:
<ul>
<li>Idle, with HDMI only
<ul>
<li>5.06V (polyfuse in)</li>
<li>4.82V (polyfuse out)</li>
</ul></li>
<li>Idle, with HDMI, keyboard and mouse
<ul>
<li>5.04V (polyfuse in)</li>
<li>4.77V (polyfuse out)</li>
</ul></li>
<li>Running Quake (with HDMI, keyboard, mouse, and network)
<ul>
<li>4.98V (polyfuse in)</li>
<li>4.55V (polyfuse out)</li>
</ul></li>
</ul></li>
</ul></td>
<td align="left"></td>
<td align="left"></td>
<td align="left">Adafruit (US)</td>
<td align="left">Balefrost</td>
</tr>
<tr class="odd">
<td align="left">BH1310</td>
<td align="left">Hynix
<pre><code>H9TKNNN4GDMP
LRNDM 305A</code></pre></td>
<td align="left">SMSC
<pre><code>LAN9512-JZX
81303-A1B17
3032AWA
CTI-TW</code></pre></td>
<td align="left"><pre><code>L2
220
16H</code></pre></td>
<td align="left">N/A</td>
<td align="left"><pre><code>SE8117T33
1244-LF</code></pre></td>
<td align="left"><ul>
<li>Ethernet: HanRun HR901110A 1247</li>
<li>Quake 3 crashes and reboots near instantly after rendering the arena when overclocked (Turbo)</li>
<li>Prone to SD card (SDHC 4 GB Class 4) corruption after a force halt when overclocked (High+)</li>
</ul></td>
<td align="left"><a href="http://elinux.org/File:RPi-BH1310-Front_BrianXP7.jpg"><img src="http://elinux.org/images/thumb/4/45/RPi-BH1310-Front_BrianXP7.jpg/100px-RPi-BH1310-Front_BrianXP7.jpg" alt="RPi-BH1310-Front BrianXP7.jpg" /></a>
<a href="http://elinux.org/File:RPi-BH1310-Front_BrianXP7.jpg" title="Enlarge"></a></td>
<td align="left"><a href="http://elinux.org/File:RPi-BH1310-Back_BrianXP7.jpg"><img src="http://elinux.org/images/thumb/9/92/RPi-BH1310-Back_BrianXP7.jpg/100px-RPi-BH1310-Back_BrianXP7.jpg" alt="RPi-BH1310-Back BrianXP7.jpg" /></a>
<a href="http://elinux.org/File:RPi-BH1310-Back_BrianXP7.jpg" title="Enlarge"></a></td>
<td align="left">Allied Electronics (US)</td>
<td align="left"><a href="http://elinux.org/User:BrianXP7" title="User:BrianXP7">BrianXP7</a></td>
</tr>
</tbody>
</table>


