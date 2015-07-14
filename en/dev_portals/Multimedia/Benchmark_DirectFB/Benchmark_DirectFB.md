> From: [eLinux.org](http://eLinux.org/Benchmark_DirectFB "http://eLinux.org/Benchmark_DirectFB")


# Benchmark DirectFB



## Benchmarks

The DirectFB example suites include benchmark 'df\_dok'. We have ran
this benchmark on the following platform:

<table border="1" cellpadding="5" cellspacing="0" align="center">
<tr>
<th style="background:#80FF80;"><b>Platform</b>
</th>
<th style="background:#80FF80;"><b>CPU</b>
</th>
<th style="background:#80FF80;"><b>Clock</b>
</th>
<th style="background:#80FF80;"><b>I/F</b>
</th>
<th style="background:#80FF80;"><b>System RAM</b>
</th>
<th style="background:#80FF80;"><b>Graphics Card</b>
</th>
<th style="background:#80FF80;"><b>Kernel Version</b>
</th></tr>
<tr>
<td>A</td>
<td rowspan="2">Renesas SH-4</td>
<td rowspan="2">240MHz</td>
<td rowspan="2">CPU</td>
<td rowspan="2">64MB</td>
<td>SMI SM501 software drawing</td>
<td>2.4.20 CELF
</td></tr>
<tr>
<td>A*</td>
<td>SMI SM501 enable 2D acceleration</td>
<td>2.4.20 CELF
</td></tr>
<tr>
<td>B</td>
<td>Renesas SH-4</td>
<td>240MHz</td>
<td>PCI</td>
<td>64MB</td>
<td>Matrox Millenium</td>
<td>2.4.19
</td></tr>
<tr>
<td>C</td>
<td>Intel Celeron </td>
<td>450MHz</td>
<td>PCI</td>
<td>128MB</td>
<td>Matrox Mystique</td>
<td>2.4.20
</td></tr>
<tr>
<td>D</td>
<td>Intel Celeron </td>
<td>450MHz</td>
<td>PCI</td>
<td>128MB</td>
<td>Matrox Millenium</td>
<td>2.4.20
</td></tr>
<tr>
<td>F</td>
<td>Intel Celeron </td>
<td>450MHz</td>
<td>AGP</td>
<td>128MB</td>
<td>Matrox G450</td>
<td>2.4.20
</td></tr>
<tr>
<td>E</td>
<td>Intel Pentium4</td>
<td>2.4GHz</td>
<td>AGP</td>
<td>1GB</td>
<td>Matrox G450</td>
<td>2.4.20
</td></tr>
<tr>
<td>G</td>
<td rowspan="2">Intel CE2110</td>
<td rowspan="2">1Ghz</td>
<td rowspan="2">CPU</td>
<td rowspan="2">100Mb</td>
<td>software drawing</td>
<td>2.6.16
</td></tr>
<tr>
<td>G*</td>
<td>Intel GDL accelerated</td>
<td>2.6.16
</td></tr></table>
<p><br />
</p>
<table border="1" cellpadding="5" cellspacing="0" align="center">
<tr>
<th style="background:#80FF80;" rowspan="2"><b>Benchmarks</b>
</th>
<th style="background:#80FF80;" colspan="9"><b>Platform</b>
</th></tr>
<tr>
<th style="background:#80FF80;"><b>A</b>
</th>
<th style="background:#80FF80;"><b>A*</b>
</th>
<th style="background:#80FF80;"><b>B</b>
</th>
<th style="background:#80FF80;"><b>C</b>
</th>
<th style="background:#80FF80;"><b>D</b>
</th>
<th style="background:#80FF80;"><b>E</b>
</th>
<th style="background:#80FF80;"><b>F</b>
</th>
<th style="background:#80FF80;"><b>G</b>
</th>
<th style="background:#80FF80;"><b>G*</b>
</th></tr>
<tr>
<td>Anti-aliased Text [KChars/sec]</td>
<td>29.22</td>
<td>29.41</td>
<td>20.40</td>
<td>24.83</td>
<td>23.96</td>
<td>607.39</td>
<td>750.00</td>
<td>84</td>
<td>45
</td></tr>
<tr>
<td>Anti-aliased Text (blend)  [KChars/sec]</td>
<td>7.52</td>
<td>7.47</td>
<td>6.12</td>
<td>16.52</td>
<td>16.66</td>
<td>613.00</td>
<td>752.85</td>
<td>25</td>
<td>19
</td></tr>
<tr>
<td>Fill Rectangles [MPixel/sec]</td>
<td style="background:#80FFFF;">14.07</td>
<td style="background:#80FFFF;">221.49</td>
<td>63.63</td>
<td>116.37</td>
<td>53.25</td>
<td>892.88</td>
<td>849.22</td>
<td style="background:#80FFFF;">34</td>
<td style="background:#80FFFF;">105
</td></tr>
<tr>
<td>Fill Rectangles (blend) [MPixel/sec]</td>
<td>1.64</td>
<td>1.67</td>
<td>1.20</td>
<td>3.18</td>
<td>3.26</td>
<td>236.38</td>
<td>225.84</td>
<td style="background:#80FFFF;">3</td>
<td style="background:#80FFFF;">6
</td></tr>
<tr>
<td>Fill Triangles [MPixel/sec]</td>
<td style="background:#80FFFF;">12.25</td>
<td style="background:#80FFFF;">93.87</td>
<td>93.87</td>
<td>108.79</td>
<td>50.51</td>
<td>748.55</td>
<td>730.24</td>
<td style="background:#80FFFF;">32</td>
<td style="background:#80FFFF;">1
</td></tr>
<tr>
<td>Fill Triangles (blend) [MPixel/sec]</td>
<td>1.63</td>
<td>1.61</td>
<td>1.17</td>
<td>3.13</td>
<td>3.17</td>
<td>223.32</td>
<td>218.24</td>
<td style="background:#80FFFF;">4</td>
<td style="background:#80FFFF;">0.026
</td></tr>
<tr>
<td>Draw Rectangles [KRects/sec]</td>
<td style="background:#80FFFF;">1.81</td>
<td style="background:#80FFFF;">16.01</td>
<td>10.67</td>
<td>12.95</td>
<td>8.57</td>
<td>59.53</td>
<td>36.27</td>
<td style="background:#80FFFF;">11</td>
<td style="background:#80FFFF;">3.6
</td></tr>
<tr>
<td>Draw Rectangles (blend) [KRects/sec]</td>
<td>0.52</td>
<td>0.57</td>
<td>0.43</td>
<td>0.83</td>
<td>0.84</td>
<td>25.40</td>
<td>17.09</td>
<td style="background:#80FFFF;">2.142</td>
<td style="background:#80FFFF;">0.194
</td></tr>
<tr>
<td>Draw Lines [KLines/sec]</td>
<td style="background:#80FFFF;">7.10</td>
<td style="background:#80FFFF;">66.98</td>
<td>61.33</td>
<td>62.60</td>
<td>48.84</td>
<td>281.86</td>
<td>162.40</td>
<td style="background:#80FFFF;">41</td>
<td style="background:#80FFFF;">16
</td></tr>
<tr>
<td>Draw Lines (blend) [KLines/sec]</td>
<td>2.33</td>
<td>2.43</td>
<td>1.94</td>
<td>3.69</td>
<td>3.70</td>
<td>127.29</td>
<td>80.04</td>
<td style="background:#80FFFF;">10</td>
<td style="background:#80FFFF;">7
</td></tr>
<tr>
<td>Blit [MPixel/sec]</td>
<td style="background:#80FFFF;">8.12</td>
<td style="background:#80FFFF;">100.49</td>
<td>38.68</td>
<td>53.75</td>
<td>32.56</td>
<td>435.02</td>
<td>398.84</td>
<td style="background:#80FFFF;">25</td>
<td style="background:#80FFFF;">64
</td></tr>
<tr>
<td>Blit colorkeyed [MPixel/sec]</td>
<td style="background:#80FFFF;">1.63</td>
<td style="background:#80FFFF;">102.16</td>
<td>39.19</td>
<td>58.69</td>
<td>32.54</td>
<td>445.20</td>
<td>421.97</td>
<td style="background:#80FFFF;">28</td>
<td style="background:#80FFFF;">36
</td></tr>
<tr>
<td>Blit with format conversion [MPixel/sec]</td>
<td>4.04</td>
<td>4.13</td>
<td>3.59</td>
<td>18.11</td>
<td>17.79</td>
<td>203.38</td>
<td>193.26</td>
<td style="background:#80FFFF;">13</td>
<td style="background:#80FFFF;">38
</td></tr>
<tr>
<td>Blit from 32bit (alphachannel blend) [MPixel/sec]</td>
<td>1.05</td>
<td>1.05</td>
<td>0.82</td>
<td>2.71</td>
<td>2.71</td>
<td>171.32</td>
<td>158.10</td>
<td>3</td>
<td>36
</td></tr>
<tr>
<td>Blit from 8bit palette [MPixel/sec]</td>
<td>3.54</td>
<td>2.35</td>
<td>3.20</td>
<td>17.40</td>
<td>17.38</td>
<td>17.28</td>
<td>95.17</td>
<td>-</td>
<td>-
</td></tr>
<tr>
<td>Blit from 8bit palette (alphachannel blend) [MPixel/sec]</td>
<td>1.02</td>
<td>0.90</td>
<td>0.81</td>
<td>2.67</td>
<td>2.71</td>
<td>3.55</td>
<td>5.53</td>
<td>-</td>
<td>-
</td></tr>
<tr>
<td>Stretch Blit [MPixel/sec]</td>
<td style="background:#80FFFF;">12.17</td>
<td style="background:#80FFFF;">83.50</td>
<td>7.06</td>
<td>83.50</td>
<td>47.61</td>
<td>210.32</td>
<td>220.77</td>
<td>25</td>
<td>21
</td></tr>
<tr>
<td>Stretch Blit colorkeyed [MPixel/sec]</td>
<td>7.46</td>
<td>7.43</td>
<td>4.20</td>
<td>46.17</td>
<td>46.30</td>
<td>211.97</td>
<td>221.64</td>
<td>26</td>
<td>20
</td></tr></table>


 After enabling 2D acceleration in A\* environment, the graphics
benchmark score improves. It looks like even embedded processor like
SH-4 can be used when DirectFB can use hardware acceleration. So a
graphics library would be essential in a graphical system.

For G\* (Intel CE2110) environment, just basic operations like opaque
rectangle and blits are really optimized, some operations are much
slower and we can notice rendering artifacts/bugs. So take care,
possible you'll have to fallback to software rendering on such platform.
Cyan-colored cells are supposed to be accelerated.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DirectFB](http://eLinux.org/Category:DirectFB "Category:DirectFB")
-   [Multimedia](http://eLinux.org/Category:Multimedia "Category:Multimedia")
-   [SuperH](http://eLinux.org/Category:SuperH "Category:SuperH")

