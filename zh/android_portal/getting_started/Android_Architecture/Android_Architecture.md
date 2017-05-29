> 原文：[eLinux.org](http://eLinux.org/Android_Architecture "http://eLinux.org/Android_Architecture")
> 翻译：[@willis](https://github.com/lovelers)
> 校订：[@lzufalcon](https://github.com/lzufalcon)


# Android 架构



通过查阅 [Google Android 网址](http://developer.android.com/guide/basics/what-is-android.html) 了解 Android 的各个部分，以及架构图。

上文这幅架构图出现在我看过的所有关于 Android 技术主题的演示文稿中（我自己的除外）。

## 目录

-   [1 架构图](#architecture-diagram)
-   [2 概要介绍](#overview-presentations)
-   [3 Android 系统运行明细](#breakdown-of-running-android-system)
-   [4 与 Linux 内核的关系](#relation-to-the-linux-kernel)
-   [5 Java](#java)
        -   [5.1 Java/面向对象思想](#java-object-oriented-phoilosophy)

<span id="architecture-diagram"></span>

## 架构图

Android 架构图出自于：
[这里](http://developer.android.com/images/system-architecture.jpg)。

[![Android-system-architecture.jpg](http://eLinux.org/images/c/c2/Android-system-architecture.jpg)](http://eLinux.org/File:Android-system-architecture.jpg)

请也参考 [Android 内部图](http://www.makelinux.net/android/internals/)

基本上，Android　存在如下几层结构：

-   应用(Java 程序语言编写，运行在 Dalvik 虚拟机上)
-   框架服务和函数库(大多数用 Java 程序语言编写)
    -   应用层以及大多数的 Java 代码运行在虚拟机上)
-   本地库，守护进程和服务(C/C++ 程序语言编写)
-   Linux 内核。包括
    -   硬件驱动，网络，文件系统以及进程间通信

<span id="overview-presentations"></span>

## 概要介绍

-   [Android 不仅仅是基于 Linux 的 Java](http://kobablog.wordpress.com/2011/05/22/android-is-not-just-java-on-linux/)
    -   这是作者 Tetsuyuki Kobayashi 对 Android 的精辟讲解

-   查阅 Karim Yaghmour 对 Android 深度剖析
    -   [http://www.opersys.com/blog/android-internals-101103](http://www.opersys.com/blog/android-internals-101103)
    -   您可以在这里找到视频以及幻灯片资料

-   [Mythbusters\_Android.pdf](http://eLinux.org/images/2/2d/Mythbusters_Android.pdf "Mythbusters Android.pdf")
    Matt Porter 在欧洲 Linux 嵌入式峰会上的报告
    -   关于有疑问的 Android 代码以及策略的林林总总

<span id="breakdown-of-running-android-system"></span>

## Android 系统运行明细

快速查阅 Android 启动时的服务和程序：

-   [http://benno.id.au/blog/2007/11/13/android-under-the-hood](http://benno.id.au/blog/2007/11/13/android-under-the-hood)

<span id="relation-to-the-linux-kernel"></span>

## 与 Linux 内核的关系

来自于 2010 年 CELF 峰会的[Greg Kroah-Hartmans presentation on Android](http://github.com/gregkh/android-presentation/downloads)就 Google/Android 与 Linux 社区如何协作（或者不配合）进行了讨论。

<span id="java"></span>

## Java

Java 是应用程序编程语言，但是它会通过定制的解释器（Dalvik）解析为运行时的非 Java 字节码。

<span id="java-object-oriented-phoilosophy"></span>

### Java/面向对象思想

Android 系统，实践出真知。

Dianne Hackborn，一位资深的 Android 工程师，他这样写道：

并不是说我是一个不喜欢面向对象设计的 C 程序员。实际上，在从事 Android 之前，我主要的编程语言是 C++。诚实的说，Java 真正困扰我的地方在于，对于同一件事情，它需要太多的重写方法来完成，然而，我能通过 C++ 非常棒的面向对象的理念来得到更轻量级的结果。

尽管在 Android 上，Java 有许多其他很好的属性，但是它也有自身设计上的缺陷和不足，以至于我们不能认为它就是我们心中完美的面向对象。

最终，再往前看，API 规范的定义允许我们在现有的硬件上安置一个运行良好的操作系统。但是 API 的规范也会随着某些情况的发生而发生改变（比如变得慢，却不是足够慢）。然而，我将尽可能的继续保持这些 API 的规范以便于保证现有的所有工作的一致性。当然了，如果 Android 是成功的，那么在从现在起的 10 年内，我们将设计全新的下一代 Android 架构。那么，情况就不一样了。




[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

