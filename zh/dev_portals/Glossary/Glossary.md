> 原文: [eLinux.org](http://eLinux.org/Glossary "http://eLinux.org/Glossary")
> 翻译：[@mintisan](https://github.com/mintisan)
> 校订：[@lzufalcon](https://github.com/lzufalcon)

# 术语表

本文介绍嵌入式Linux中使用的术语词汇表，以及本 Wiki 中现有的其它术语页的链接：


## 高频主题术语表

以下是特定技术领域的一些术语页面：

-   [启动时间](../.././dev_portals/Boot_Time/Boot-up_Time_Definition_Of_Terms/Boot-up_Time_Definition_Of_Terms.md "Boot-up Time Definition Of Terms")
    - Linux 启动过程涉及的相关术语
-   [电源管理](../.././dev_portals/Glossary/Power_Management_Definition_Of_Terms/Power_Management_Definition_Of_Terms.md "Power Management Definition Of Terms")
    - CELF 电源管理工作组术语定义
-   [实时性](../.././dev_portals/Glossary/Real_Time_Terms/Real_Time_Terms.md "Real Time Terms") - 系统实时性能相关术语
-   [安全](../.././dev_portals/Glossary/Security_Terms/Security_Terms.md "Security Terms") - Linux 安全及安全架构相关术语

<table>
<thead>
<tr class="header">
<th align="left"> 目录 </th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><a href="#A">A</a> <a href="#B">B</a> <a href="#C">C</a> <a href="#D">D</a> <a href="#E">E</a> <a href="#F">F</a> <a href="#G">G</a> <a href="#H">H</a> <a href="#I">I</a> <a href="#J">J</a> <a href="#K">K</a> <a href="#L">L</a> <a href="#M">M</a> <a href="#N">N</a> <a href="#O">O</a> <a href="#P">P</a> <a href="#Q">Q</a> <a href="#R">R</a> <a href="#S">S</a> <a href="#T">T</a> <a href="#U">U</a> <a href="#V">V</a> <a href="#W">W</a> <a href="#X">X</a> <a href="#Y">Y</a> <a href="#Z">Z</a> <br /></td>
</tr>
</tbody>
</table>

## A

 **Abatron **
[Abatron](http://www.abatron.ch/) 是一家瑞士厂商，他们生产市场流行的 JTAG 调试器，这些调试器常用于调试嵌入式 Linux 系统。他们的主要产品是 `BDIx000` 系列的 JTAG 调试器。


 **异步 I/O （Asynchronous I/O）**
在启动 I/O 之后即回到主程序中，而非等到功能 I/O 完成。此时，I/O 转换和处理器同时并行工作，在 I/O 操作的同时也在执行主程序流程，而非阻塞等待其完成。

## B

**板子（Board）**
当我们在说开发板，一般是在说带有嵌入式 Linux 操作系统的硬件设备，它其实是一块印刷电路板。我们有时也叫它开发板或者评估板。

**阻塞 I/O（Blocked I/O）**
直到 I/O 所有的数据请求完成之后才返回程序控制权的方式。这种方式下，I/O 传输与处理器串行执行。

板级支持包（BSP）**
其实就是用于支持特定硬件板的代码，这个术语一般用于指代代码，而不能见名知义地当作一个具体的“包”。它通常指适用于某块特定板子的所有特例软件，包括内核代码、用户代码等等。

## C

**交叉编译器（Cross-compiler）**
通过配置相关参数设置，可以在 A 平台上，编译出 B 平台或者其他平台上可以运行的代码，即跨平台编译。

**交叉编译过程（Cross-compilation）**
在 A 平台上通过[交叉编译器](http://eLinux.org/index.php?title=Cross-compiler&action=edit&redlink=1 "Cross-compiler (page does not exist)")编译 B 平台可运行程序的过程。

## D

## E

**嵌入式 Linux 会议（ELC）**
这是每年为嵌入式 Linux 开发者准备的主要技术会议之一。参考[事件](../../dev_portals/Events/Events.md "Events") 页面可以看到历年的参考资料。

**嵌入式（Embedded）**
我们称一个设备为“嵌入式”设备，这意味着此设备附带固定的功能，可独立于其他软硬件模块而运行。该术语多少有些含糊不清，因为“嵌入式”意味着专用而非通用。目前的移动手机早已开始支持通用软件和功能，但是我们认为它也属于嵌入式设备。传统的嵌入式 Linux 设备包括以下产品，如数码相机，路由器，电信设备和机顶盒之类的；也有像非消费级的嵌入式设别包括，如传感器，工控设备和其他除了在台式机和服务器领域使用的 Linux 的设备。其它详见 [维基百科嵌入式入门指南](http://en.wikipedia.org/wiki/Embedded_system).

## F

**文件系统（File system）**
操作系统用来管理磁盘分区的一套方法和数据结构，也就是磁盘组织文件的方式。有时也指用于存储文件或者文件系统类型的分区或者磁盘。

## G

## H

**主机（Host）**
主机或者宿主机是指软件开发者具体为他们的产品编写和编译软件时所用的机器。在主机－目标机环境中，主机用来开发软件，目标机用来运行主机开发出来的软件。

## I

**知识产权模块（IP block）**
IP 模块是指集成电路中执行不同功能的电路部分。IP 代表“知识产权”。如需使用 IP 模块进行开发，并且需要将其集成到 SoC 系统中，需要得到产权方的许可。其模块的实现需要类似 Verilog 的序言来表述硬件。由于同一  IP 模块可能被使用到不同的芯片上，所以针对一个系统开发的驱动可能在其它拥有同一 IP 模块的系统上也可以使用。在现如今的处理器上必备的 IP 模块如下，视屏控制器，UARTs（串口），总线控制器，有线和无线网络接口，而这些只是冰山一角。

## J

 [**JTAG**](../.././dev_portals/Glossary/JTAG/JTAG.md "JTAG") 
"Joint Test Action Group"的缩写, JTAG 是一种调试接口，用于在嵌入式开发板上验证硬件和调试软件。 详见 [JTAG](../.././dev_portals/Glossary/JTAG/JTAG.md "JTAG")

## K

**内核（Kernel）**
Linux 内核是 Linux 系统的核心组件，它负责与硬件打交道，管理处理器自己的计算资源，协调处理器与硬件的交互，还有多核系统中处理器间的通信和同步。

## L

## M

## N

**非阻塞 I/O （Non-blocking I/O）**
当 I/O 初始化完成之后，I/O 进程启动后立马返回控制权到调用程序，但是此时 I/O 并未完成。I/O 数据传输与处理器并行执行，也就是说用户程序与 I/O 操作可以齐飞。即异步 I/O。

**非易失性存储（Non-volatile storage）**
(NVS, 非易失性存储，也称持久性储存) ，此术语描述的意思是：设备在掉电时，其内容不会丢失。使用磁介质（比如，磁盘，磁带或者磁泡存储器）通常情况下是非易失的。尽管半导体内存（静态 RAM，特别事动态 RAM）都是易失性的，但是可以通过附加可充电电池来保持其内容一段时间。

## O

## P

**物理层（PHY）**
物理层（Physical Layer）的缩写。物理层通常指代在一个芯片或者主板上实现了网络功能的硬件电路。有时候，物理层是单独的芯片实现的，但是更一般的是指 SoC 上的网络设备或者接口模块。详见 [http://en.wikipedia.org/wiki/PHY\_(chip)](http://en.wikipedia.org/wiki/PHY_(chip))

## Q

## R

 基于内存的文件系统（RAM-based file system） 
在易失性 RAM 上建立的文件系统。

## S

**片上系统（SOC）**
片上系统是指单一集成电路上包含一个几乎完整系统的芯片，它可能会有多种 IP 核，这些 IP 核实现不同的硬件功能，除了系统主 CPU 以外，如串口、网口、总线和视频控制器。一般读作 "ess-oh-see"  或者  "sock"。详见 [http://en.wikipedia.org/wiki/System\_on\_a\_chip](http://en.wikipedia.org/wiki/System_on_a_chip)



**同步 I/O （Synchronous I/O）**
直到 I/O 所有的数据请求完成之后才返回程序控制权的方式。这种方式下，I/O 传输与处理器串行执行。即阻塞 I/O 。

## T

**目标板（Target）**
目标板是执行所开发软件的设备或者环境。它可能是开发板，真实的产品或者仿真器。一般而言，开发者在主机上开发完软件之后需要到目标板上测试，调试和部署。

**工具链（Toolchain）**
工具链是一整套为嵌入式设备构建软件的程序，具体来说，它指代编译器和连接器。但是它也可能是其他特定于某个特别架构或者 CPU 的其他程序，例如调试器，分析器和与目标软件配合使用的其他工具。

## U

## V

## W

## X

## Y

## Z


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [贡献你的力量](http://eLinux.org/Category:NeedsEditing "Category:NeedsEditing")
