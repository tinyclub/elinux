> From: [eLinux.org](http://elinux.org/LTTng "http://eLinux.org/LTTng")

原文：[eLinux.org](http://eLinux.org/LTTng) <br />
翻译：@[unicornx](https://github.com/unicornx) <br />
校订：@ <br />

# LTTng

Linux 跟踪工具包查看器（Linux Trace Toolkit Viewer，下文简称 LTTV）/ 下一代Linux
 跟踪工具包（Linux Trace Toolkit Next Generation，下文简称 LTTng）

LTTV 是一个模块化的查看/分析工具，专门用来处理产品级系统所产生的海量跟踪调试信息。

该工具是 LTTng 的一部分。LTTng 基于已有的 LTT 的跟踪点（tracepoint）和 RelayFS 的
分发机制构建，但 LTTng 完全重写了 LTT 的跟踪模块和后台服务。

LTTV 的设计初衷是充分利用来自社区的贡献。要知道基于跟踪的结果我们可以做出各式各
样的数据分析，而利用 LTTV 可以让这个过程变得更简单并且有趣。

更多有关 LTTV 的内容可以访问 [http://www.lttng.org](http://www.lttng.org). 参照
快速入门（Quickstart）指导可以获悉如何通过 Debian 的软件包，PRM 等源获取该软件。

LTTV 的关键特性：

-   支持处理海量跟踪数据 （曾经使用多达 15GB 的数据进行过测试）。从一开始的设计就要求其能够支持处理大量数据。
-   支持将多个跟踪结果数据文件合并生成一个视图。
-   支持跨平台，任意大小端架构的数据格式。
-   以插件方式提供命令行操作接口，支持批处理分析。
-   以插件方式提供图形化可视化输出。
-   灵活的事件过滤器。
-   模块化架构 :

     - 支持动态可加载插件：每种视图展现或者分析器都可以实现为一个插件。
     - 基于模块的架构设计可以最大化地实现功能复用并方便测试。

-   提供事件描述解析器（event description parser）和跟踪代码生成器（ genevent ）
	使添加新的检测点（trace point）变得更容易。


更多有关 LTTng 的内容可以访问 [http://www.lttng.org](http://www.lttng.org). 
参照快速入门（Quickstart）指导可以获悉如何通过 Debian 的软件包，PRM 等源获取该软件。

LTTng 的关键特性：

-   通过支持 genevent 代码生成器可以方便地添加新的检测点。
-   通过直接使用处理器的计数器作为单调递增时间基准可以为事件保证非常精准的时间戳。
-   对被跟踪系统影响甚微：因为 LTTng 是通过使用 RCU 和 cmpxchg 原子操作，而不是以关闭中断或者持有锁的方式来添加测量点。
-   可以保证非屏蔽中断（Non maskable interrupts，简称NMI）的可重入性。
-   支持多种可嵌套的类型定义方式：结构体（structures），联合体（unions），数组（arrays），序列（sequences）。
-   支持主机架构特定的类型定义。
-   以很小的开销实现跟踪数据的动态对齐。
-   集成 LTTV ，支持图形界面的操作方式。
-   可以同时记录多路跟踪。
-   模块化架构。

参考[http://lwn.net/Articles/166952/](http://lwn.net/Articles/166952/)

## 外部链接

-   [lwn.net: LTTng 2.0: Tracing for power users and developers - part
    1](http://lwn.net/Articles/491510/)
-   [lwn.net: LTTng 2.0: Tracing for power users and developers - part
    2](http://lwn.net/Articles/492296/)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")

