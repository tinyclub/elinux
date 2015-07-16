# 设备驱动 #


## 手册介绍 ##


- [http://en.wikibooks.org/wiki/The_Linux_Kernel](http://en.wikibooks.org/wiki/The_Linux_Kernel "Linux内核") - 正在建设中...
- [http://www.makelinux.net/ldd3/](http://www.makelinux.net/ldd3/ "Linux设备驱动程序（第三版）")
- [http://www.makelinux.net/reference.d/drivers_linux](http://www.makelinux.net/reference.d/drivers_linux "编写Linux并行端口驱动初级教程")
## 驱动程序范例 ##




- [http://github.com/makelinux/ldt](http://github.com/makelinux/ldt "Linux设备驱动模板") - 一个用于学习的Linux设备驱动模板，可以通过修改这个设备模板来实现自己的设备驱动。例如，使用下列的Linux提供的工具：modules、platform driver、file operations（包括read/write， mmap， ioctl， blocking和nonblocking， polling）、 kfifo、 completion、 interrupt、 tasklet、 work、 kthread、 misk device、 proc fs、 UART 0x3f8、 HW loopback、 SW loopback、 ftracer, 尝试去实现一个字符设备的UART。代码可以直接编译运行，并且提供了测试脚本。

- [LDD3-Linux设备驱动的启动范例](https://github.com/martinezjavier/ldd3/ "LDD3")，第三版，基于内核版本是3.2.0.
	
	
	- [pci_skel.c](https://github.com/martinezjavier/ldd3/blob/master/pci/pci_skel.c) - PCI框架
	- [scull.c](https://github.com/martinezjavier/ldd3/blob/master/sbull/sbull.c) - 块设备驱动范例
	- [scull](https://github.com/martinezjavier/ldd3/tree/master/scull) - 字符设备范例
	- [snull.c](https://github.com/martinezjavier/ldd3/blob/master/snull/snull.c) - 网络设备范例
- [vivi.c-Vitual Video driver,uses V4L2](http://lxr.free-electrons.com/source/drivers/media/video/vivi.c) - 
- [mem2mem_testdev.c](http://lxr.free-electrons.com/source/drivers/media/video/mem2mem_testdev.c) - 一个虚拟设备的驱动，用来检测内存之间视频缓冲框架。
- [usb-skeleton.c](http://lxr.free-electrons.com/source/drivers/usb/usb-skeleton.c) - USB设备驱动框架（稍微修改就可以运行了）。
- [skeletonfb.c](http://lxr.free-electrons.com/source/drivers/video/skeletonfb.c) - FrameBuffer设备框架（主要用于LED设备驱动中，该驱动无法编译运行）。
- [pcihp_skeleton.c](http://lxr.free-electrons.com/source/drivers/pci/hotplug/pcihp_skeleton.c) - USB驱动框架(编译通过，但是无法运行)。
- [skeletonfb.c](http://lxr.free-electrons.com/source/drivers/video/skeletonfb.c) 帧缓存的驱动框架 (无法编译)
- [ loopback.c](http://lxr.free-electrons.com/source/drivers/net/loopback.c) 网络设备的一个简单范例--ifconfig lo。
- [gpio_driver](https://github.com/23ars/linux_gpio_driver) 树莓派B+的一个GPIO口驱动（没有经过充分测试）。

## 其他资源 ##
[Device Tree](http://elinux.org/Device_Tree) - 关于设备驱动树的信息（该信息不定时更新）。