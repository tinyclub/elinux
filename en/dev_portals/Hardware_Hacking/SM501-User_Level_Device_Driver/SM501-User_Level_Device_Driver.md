> From: [eLinux.org](http://eLinux.org/SM501-User_Level_Device_Driver "http://eLinux.org/SM501-User_Level_Device_Driver")


# SM501-User Level Device Driver



## Contents

-   [1 概要](#-e6.a6.82.e8.a6-81)
-   [2
    割り込みフックドライバ](#-e5.89.b2.e3.82.8a.e8.be.bc.e3.81.bf.e3.83.95.e3.83.83.e3.82.af.e3.83.89.e3.83.a9.e3.82.a4.e3.83-90)
-   [3
    サンプルアプリケーション](#-e3.82.b5.e3.83.b3.e3.83.97.e3.83.ab.e3.82.a2.e3.83.97.e3.83.aa.e3.82.b1.e3.83.bc.e3.82.b7.e3.83.a7.e3.83-b3)
    -   [3.1 SM501 UARTシリアルターミナル for
        RTS7715R2D](#sm501-uart-e3.82.b7.e3.83.aa.e3.82.a2.e3.83.ab.e3.82.bf.e3.83.bc.e3.83.9f.e3.83.8a.e3.83-ab-for-rts7715r2d)
-   [4 実験](#-e5.ae.9f.e9.a8-93)
    -   [4.1 目的](#-e7.9b.ae.e7.9a-84)
    -   [4.2 環境](#-e7.92.b0.e5.a2-83)
    -   [4.3 方法](#-e6.96.b9.e6.b3-95)
    -   [4.4 結果](#-e7.b5.90.e6.9e-9c)

## 概要

## 割り込みフックドライバ

[Media:irqhook-0.0.4.tar.gz](http://eLinux.org/images/e/e9/Irqhook-0.0.4.tar.gz "Irqhook-0.0.4.tar.gz")

## サンプルアプリケーション

### SM501 UARTシリアルターミナル for RTS7715R2D

[Media:sm501uart\_tty-0.0.1.tar.gz](http://eLinux.org/images/e/e0/Sm501uart_tty-0.0.1.tar.gz "Sm501uart tty-0.0.1.tar.gz")

## 実験

### 目的

割り込み処理をユーザタスクで行う場合に問題となる、割り込み応答時間のレイテンシ増分を測定する。

### 環境

-   Target platform

Renesas RTS7751R2D

SH4(SH7751) 240MHz

64MB SDRAM

10Base-T Ethernet

Linux 2.6.16.4 / 2.4.20

256MB [Compact Flash](http://eLinux.org/Compact_Flash "Compact Flash") for rootfs

### 方法

シリアルからデータを送信し、割り込み発生後、カーネルドライバの割り込みハンドラが起動してから、ハンドラによってwakeup()されたULDDが起床するまでの時間を測定する。

-   10KBのデータを38400bpsで送信
-   データ受信時の起床時間（カーネル割り込みハンドラ起動直後からULDD復帰までの時間を計測）を計測
-   負荷状況を変化
    -   (none): 負荷なし
    -   lat\_proc:
        lmbench3付属のプロセス生成ベンチマークをバッググラウンドで実行(./lat\_proc
        -P 3 -N 20 exec &)
-   Non-RT(SCHED\_OTHER), RT(SCHED\_RR, sched\_prio=1)スレッドを使用



### 結果

2" | **IRQ Delivering Method**

2" | **Scheduling Policy**

2" | **Disturbance Task**

**Linux 2.6.16.4 (CONFIG\_PREEMPT=y)**

**Linux 2.4.20**

**MAX (us)**

**AVG (us)**

**MIN (us)**

**Plot**

**MAX (us)**

**AVG (us)**

**MIN (us)**

**Plot**

File I/O (sync)

SCHED\_OTHER

(none)

39.80

17.52

13.73

①

14.93

6.98

6.87

⑬

SCHED\_OTHER

*lat\_proc*

253.27

42.57

10.93

②

2808.13

478.43

6.53

⑭

*SCHED\_RR*

(none)

38.13

15.73

14.07

③

17.13

6.34

6.20

⑮

*SCHED\_RR*

*lat\_proc*

33.73

14.32

8.80

④

2697.13

485.29

6.60

⑯

SIGIO (async)

SCHED\_OTHER

(none)

524.00

62.84

45.47

⑤

SCHED\_OTHER

*lat\_proc*

72317.40

2185.96

83.33

⑥

*SCHED\_RR*

(none)

81.40

47.12

43.67

⑦

*SCHED\_RR*

*lat\_proc*

280.93

102.89

79.40

⑧

SIGRT (async)

SCHED\_OTHER

(none)

83.47

50.00

44.80

⑨

SCHED\_OTHER

*lat\_proc*

85973.93

2528.19

85.40

⑩

*SCHED\_RR*

(none)

75.93

46.71

43.07

⑪

*SCHED\_RR*

*lat\_proc*

290.80

102.18

78.87

⑫

[![Ulddexp-fio-nort-nodt-26.JPG](http://eLinux.org/images/8/87/Ulddexp-fio-nort-nodt-26.JPG)](http://eLinux.org/File:Ulddexp-fio-nort-nodt-26.JPG)

[![Ulddexp-fio-nort-dt-26.JPG](http://eLinux.org/images/9/99/Ulddexp-fio-nort-dt-26.JPG)](http://eLinux.org/File:Ulddexp-fio-nort-dt-26.JPG)

[![Ulddexp-fio-rt-nodt-26.JPG](http://eLinux.org/images/4/4f/Ulddexp-fio-rt-nodt-26.JPG)](http://eLinux.org/File:Ulddexp-fio-rt-nodt-26.JPG)

[![Ulddexp-fio-rt-dt-26.JPG](http://eLinux.org/images/7/75/Ulddexp-fio-rt-dt-26.JPG)](http://eLinux.org/File:Ulddexp-fio-rt-dt-26.JPG)

[![Ulddexp-sig-nort-nodt-26.JPG](http://eLinux.org/images/5/5e/Ulddexp-sig-nort-nodt-26.JPG)](http://eLinux.org/File:Ulddexp-sig-nort-nodt-26.JPG)

[![Ulddexp-sig-nort-dt-26.JPG](http://eLinux.org/images/1/18/Ulddexp-sig-nort-dt-26.JPG)](http://eLinux.org/File:Ulddexp-sig-nort-dt-26.JPG)

[![Ulddexp-sig-rt-nodt-26.JPG](http://eLinux.org/images/6/63/Ulddexp-sig-rt-nodt-26.JPG)](http://eLinux.org/File:Ulddexp-sig-rt-nodt-26.JPG)

[![Ulddexp-sig-rt-dt-26.JPG](http://eLinux.org/images/7/79/Ulddexp-sig-rt-dt-26.JPG)](http://eLinux.org/File:Ulddexp-sig-rt-dt-26.JPG)

[![Ulddexp-rtsig-nort-nodt-26.JPG](http://eLinux.org/images/f/fb/Ulddexp-rtsig-nort-nodt-26.JPG)](http://eLinux.org/File:Ulddexp-rtsig-nort-nodt-26.JPG)

[![Ulddexp-rtsig-nort-dt-26.JPG](http://eLinux.org/images/1/10/Ulddexp-rtsig-nort-dt-26.JPG)](http://eLinux.org/File:Ulddexp-rtsig-nort-dt-26.JPG)

[![Ulddexp-rtsig-rt-nodt-26.JPG](http://eLinux.org/images/6/62/Ulddexp-rtsig-rt-nodt-26.JPG)](http://eLinux.org/File:Ulddexp-rtsig-rt-nodt-26.JPG)

[![Ulddexp-rtsig-rt-dt-26.JPG](http://eLinux.org/images/e/e3/Ulddexp-rtsig-rt-dt-26.JPG)](http://eLinux.org/File:Ulddexp-rtsig-rt-dt-26.JPG)

[![Ulddexp-fio-nort-nodt-24.JPG](http://eLinux.org/images/e/ef/Ulddexp-fio-nort-nodt-24.JPG)](http://eLinux.org/File:Ulddexp-fio-nort-nodt-24.JPG)

[![Ulddexp-fio-nort-dt-24.JPG](http://eLinux.org/images/3/39/Ulddexp-fio-nort-dt-24.JPG)](http://eLinux.org/File:Ulddexp-fio-nort-dt-24.JPG)

[![Ulddexp-fio-rt-nodt-24.JPG](http://eLinux.org/images/6/6a/Ulddexp-fio-rt-nodt-24.JPG)](http://eLinux.org/File:Ulddexp-fio-rt-nodt-24.JPG)

[![Ulddexp-fio-rt-dt-24.JPG](http://eLinux.org/images/1/18/Ulddexp-fio-rt-dt-24.JPG)](http://eLinux.org/File:Ulddexp-fio-rt-dt-24.JPG)


