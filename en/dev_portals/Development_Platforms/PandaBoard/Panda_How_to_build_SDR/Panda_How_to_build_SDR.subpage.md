# Panda How to build SDR
## Contents
# Introduction
# Software
## Kernel
### kernel 3.3-rc2 .config
### kernel 3.5-rc4 .config
## u-boot/MLO/SPL
## Buildroot Internal toolchain with uClibc mfloat-abi=softfp
### buildroot .config
### busybox .config
### uClibc .config
## Buildroot Internal toolchain with uClibc mfloat-abi=hard
### buildroot .config
### busybox .config
### uClibc .config
## Buildroot Crosstool-ng toolchain with glibc
### buildroot .config
### busybox .config
### crosstool-ng config
## uClibc vs glibc size and speed in a real world example
## rootfs
### Packages
## ghpsdr3-alex
### dttsp
#### Makefile
### fftw3
### widget-server
#### patch to orig
#### Makefile
### dspserver
#### Makefile
### QtRadio
# Hardware
## PandaBoard
## SDR Widget Lite Alpha
## SDR Widget Beta
## SoftRock Lite+USB Xtall v9.0
## RTL-SDR
### mod to directly control the Si570 from the Widget
