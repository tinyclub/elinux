> From: [eLinux.org](http://eLinux.org/Benchmark_DirectFB "http://eLinux.org/Benchmark_DirectFB")


# Benchmark DirectFB



## Benchmarks

The DirectFB example suites include benchmark 'df\_dok'. We have ran
this benchmark on the following platform:

**Platform**

**CPU**

**Clock**

**I/F**

**System RAM**

**Graphics Card**

**Kernel Version**

A

Renesas SH-4

240MHz

CPU

64MB

SMI SM501 software drawing

2.4.20 CELF

A\*

SMI SM501 enable 2D acceleration

2.4.20 CELF

B

Renesas SH-4

240MHz

PCI

64MB

Matrox Millenium

2.4.19

C

Intel Celeron

450MHz

PCI

128MB

Matrox Mystique

2.4.20

D

Intel Celeron

450MHz

PCI

128MB

Matrox Millenium

2.4.20

F

Intel Celeron

450MHz

AGP

128MB

Matrox G450

2.4.20

E

Intel Pentium4

2.4GHz

AGP

1GB

Matrox G450

2.4.20

G

Intel CE2110

1Ghz

CPU

100Mb

software drawing

2.6.16

G\*

Intel GDL accelerated

2.6.16



**Benchmarks**

**Platform**

**A**

**A\***

**B**

**C**

**D**

**E**

**F**

**G**

**G\***

Anti-aliased Text [KChars/sec]

29.22

29.41

20.40

24.83

23.96

607.39

750.00

84

45

Anti-aliased Text (blend) [KChars/sec]

7.52

7.47

6.12

16.52

16.66

613.00

752.85

25

19

Fill Rectangles [MPixel/sec]

14.07

221.49

63.63

116.37

53.25

892.88

849.22

34

105

Fill Rectangles (blend) [MPixel/sec]

1.64

1.67

1.20

3.18

3.26

236.38

225.84

3

6

Fill Triangles [MPixel/sec]

12.25

93.87

93.87

108.79

50.51

748.55

730.24

32

1

Fill Triangles (blend) [MPixel/sec]

1.63

1.61

1.17

3.13

3.17

223.32

218.24

4

0.026

Draw Rectangles [KRects/sec]

1.81

16.01

10.67

12.95

8.57

59.53

36.27

11

3.6

Draw Rectangles (blend) [KRects/sec]

0.52

0.57

0.43

0.83

0.84

25.40

17.09

2.142

0.194

Draw Lines [KLines/sec]

7.10

66.98

61.33

62.60

48.84

281.86

162.40

41

16

Draw Lines (blend) [KLines/sec]

2.33

2.43

1.94

3.69

3.70

127.29

80.04

10

7

Blit [MPixel/sec]

8.12

100.49

38.68

53.75

32.56

435.02

398.84

25

64

Blit colorkeyed [MPixel/sec]

1.63

102.16

39.19

58.69

32.54

445.20

421.97

28

36

Blit with format conversion [MPixel/sec]

4.04

4.13

3.59

18.11

17.79

203.38

193.26

13

38

Blit from 32bit (alphachannel blend) [MPixel/sec]

1.05

1.05

0.82

2.71

2.71

171.32

158.10

3

36

Blit from 8bit palette [MPixel/sec]

3.54

2.35

3.20

17.40

17.38

17.28

95.17

-

-

Blit from 8bit palette (alphachannel blend) [MPixel/sec]

1.02

0.90

0.81

2.67

2.71

3.55

5.53

-

-

Stretch Blit [MPixel/sec]

12.17

83.50

7.06

83.50

47.61

210.32

220.77

25

21

Stretch Blit colorkeyed [MPixel/sec]

7.46

7.43

4.20

46.17

46.30

211.97

221.64

26

20


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

