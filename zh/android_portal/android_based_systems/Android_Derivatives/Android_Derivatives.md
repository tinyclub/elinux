> From: [eLinux.org](http://eLinux.org/Android_Derivatives "http://eLinux.org/Android_Derivatives")


# Android 衍生系统



本页面包含了 Android 衍生系统的信息。

## 为什么使用非 Google 官方的 Android 系统

-   [http://www.reliableembeddedsystems.com/pdfs/2012-07-03-penguin-and-droid.pdf](http://www.reliableembeddedsystems.com/pdfs/2012-07-03-penguin-and-droid.pdf)
    - Robert Berger 关于非 Google 官方 Android 市场的演讲

## Cyborgstack

本项目旨在在其他产品类别中使用 Android 系统，包括深度嵌入:

-   网站: [http://www.cyborgstack.org](http://www.cyborgstack.org)
-   wiki: [http://wiki.cyborgstack.org](http://wiki.cyborgstack.org)
-   github:
    [http://github.com/cyborgstack](http://github.com/cyborgstack)
-   twitter: @cyborgstack
-   邮件列表:
    [http://lists.cyborgstack.org/listinfo/dev](http://lists.cyborgstack.org/listinfo/dev)

### Headless Android

来自:
[https://lkml.org/lkml/2012/2/15/443](https://lkml.org/lkml/2012/2/15/443)

作为参考，我认为你们中的一些人可能对 Android 用户空间可以被修改成在“无头”系统（例如没有 framebuffer）上运行感兴趣。换句话说，可以配置 FB 完全无用或配置一个没有 FB 的内核接口但仍能运行 Android
用户空间。

我已经把这部分上传作为 Cyborgstack 项目的一部分了：

    $ repo init -u git://github.com/cyborgstack/android.git -b headless
    $ repo sync
    $ ...

Android Builders 大会相关的介绍如下：
[cyborgstack-120213.pdf](http://eLinux.org/images/6/6f/Cyborgstack-120213.pdf "Cyborgstack-120213.pdf")

本质上来说，Headless Android 是没有如下部分的 AOSP :

-   SurfaceFlinger
-   WindowManager
-   WallpaperService
-   InputMethodManager

它有着除 UI 之外的所有 Android
 framework 部分（没有 FB）。这意味着可以使用标准 Android 开发工具（ Eclipse、SDK/NDK等等）来创建除了 Activities 组件之外的应用：

-   ContentProviders
-   Services
-   BroadcastReceivers

为什么要使用它而不是“嵌入式 Linux”？说实话，当很多开发者第一次向我提起他们对做这个事情很感兴趣时，我感到很怀疑。事实上当时我很不重视它。但是我一直以来收到越来越多关于它的询问。于是我决定努力尝试一下。

由于我做到了，所以我认为有两个明显的好处来使用它而不是“嵌入式 Linux”：1)得到一个适合所有设备开发的平台，不论有没有 UI 2) 设备对任何了解 Android API（正如可能知道的那样，Android 开发者越来越多）的开发者来说是可编程的。

即便如此，我所做的更多只是概念的验证。实际上这时它还是一个 dirty hack。现在还请不要急于求成。它需要吸引更多的眼球并来完成更多的工作。但是，它足以给你一个好的体验让你去玩味它。

谢谢,

-- Karim Yaghmour


[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

