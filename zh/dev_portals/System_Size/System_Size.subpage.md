# System Size
## Contents
## Introduction
## Technologies for decreasing system size
### Kernel size reduction
#### Configuration Options
* Kernel_Size_Tuning_Guide
#### The Linux-tiny patchset
* Linux_Tiny
#### "dietnet"
#### Compiler options for reducing kernel size
* Compiler_Optimization
#### Section garbage collection patchset
#### Runtime size of kernel
##### kernel stack size
* Kernel_Small_Stacks
#### Auto-reduction
* System_Size_Auto-Reduction
#### Compressed printk messages
* Compressed_printk_messages
* Compressed_printk_messages_-_Results
#### Reduction Ideas and recent work
* Kernel_Size_Reduction_Work
### File system compression
* File_Systems
### Shrinking your application
#### Compiler options for program size
#### Stripping your program
#### Hand-optimizing programs, for size
### Library savings
#### Use of a smaller libc
#### Static Linking
#### Library reduction
#### Deferred Library Loading
### Execute-in-place
#### Kernel XIP
* Kernel_XIP
#### Application XIP
* Application_XIP
#### Data Read In Place (DRIP)
* Data_Read_In_Place
## Size measurement tools and techniques
### Kernel size measurement data
### How to measure the kernel image size
### How to measure the memory usage at runtime
* Runtime_Memory_Measurement
* Accurate_Memory_Measurement
### Linux size increase from 2.4 to 2.6
* Szwg_Linux_26Data
* Size_Tunables
### GCC Code-Size Benchmarking
## Case Studies
### uClinux
### Linux on MicroControllers (M3 in this case)
## Reduced-size distribution efforts
## Other Tidbits on System Size
### Memory leak detection for the kernel
### How System Size may affect performance
### Stripping down the filesystem of a desktop distribution
### Extremely-minimal systems
