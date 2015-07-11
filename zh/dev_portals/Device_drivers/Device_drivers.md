# 设备驱动 #


## 手册介绍 ##


- [http://en.wikibooks.org/wiki/The_Linux_Kernel](http://en.wikibooks.org/wiki/The_Linux_Kernel "Linux内核") - 正在建设中...
- [http://www.makelinux.net/ldd3/](http://www.makelinux.net/ldd3/ "Linux设备驱动程序（第三版）")
- [http://www.makelinux.net/reference.d/drivers_linux](http://www.makelinux.net/reference.d/drivers_linux "编写Linux并行端口驱动初级教程")
## 驱动程序范例 ##




- [http://github.com/makelinux/ldt](http://github.com/makelinux/ldt "Linux设备驱动模板") - 一个用于学习的Linux设备驱动模板，可以通过修改这个设备模板来实现自己的设备驱动。例如，使用下列的Linux提供的工具：modules(模块)、platform driver(平台驱动)、file operations(文件操作)（包括read/write， mmap， ioctl， blocking和nonblocking模式， polling）、 kfifo（内核缓冲队列）、 completion(等待事件完成机制)、 interrupt(中断机制)、 tasklet（中断延迟机制）、 work（这里是指workqueue？）、 kthread(内核线程)、 misk device（混杂设备）、 proc fs（proc文件系统）、 UART 0x3f8、 HW loopback（硬件回环）、 SW loopback（软件回环）、 ftracer（内核系统调用跟踪工具）,尝试去实现一个字符设备的UART（通用异步收发传输器）。代码可以直接编译运行，并且提供了测试脚本。

- [LDD3-Linux设备驱动的启动范例](https://github.com/martinezjavier/ldd3/ "LDD3")，第三版，基于内核版本是3.2.0.
	
	
	- [pci_skel.c](https://github.com/martinezjavier/ldd3/blob/master/pci/pci_skel.c) - PCI框架
	- [scull.c](https://github.com/martinezjavier/ldd3/blob/master/sbull/sbull.c) - 块设备驱动范例
	- [scull](https://github.com/martinezjavier/ldd3/tree/master/scull) - 字符设备范例
	- [snull.c](https://github.com/martinezjavier/ldd3/blob/master/snull/snull.c) - 网络设备范例
- [vivi.c-Vitual Video driver,uses V4L2](http://lxr.free-electrons.com/source/drivers/media/video/vivi.c) - 
