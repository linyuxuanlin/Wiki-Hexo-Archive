---
title: 用 Pages 搭建单页面网站
date: 2017-12-05
tags: [教程,GitHub Pages,Jekyll]
categories: 科技
comments: true
photo:
- http://upload-images.jianshu.io/upload_images/2218072-cbaac8c6dc6396fb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240

---
本教程介绍了一种搭建简易网站的方法。
由`jekyll`强力驱动，托管于`GitHub Pages`。
可以用作简历、项目文档、about me，等等，只要你想得到。
预览：[单页面测试](http://radiationstu.cn/single_page/)


<!-- more -->

### `GitHub Pages`的优势：
* 简易，5分钟即可搭建完成。
* 可以不需要买域名和服务器。
* GitHub Pages不用担心访问流量和带宽。
* 丰富的主题选择和 **自定义** 。

那我们开始吧~

## 1.GitHub仓库的建立和设置

首先，建立一个新的GitHub仓库：

![Screen Shot 2017-09-24 at 12.27.24 PM.png](http://upload-images.jianshu.io/upload_images/2218072-533f139685cd5627.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


(原有仓库的任何文档都可以变成jekyll页面，所以说可以愉快地编写项目文档)

建好的仓库如下图：

![Screen Shot 2017-09-24 at 12.27.48 PM.png](http://upload-images.jianshu.io/upload_images/2218072-65fd17a1bed1c57e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

点击`Settings`，移动到下方，开启Pages服务：

![Screen Shot 2017-09-24 at 12.28.17 PM.png](http://upload-images.jianshu.io/upload_images/2218072-0eff0115f03ce326.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

进入主题选择的界面。
我选了一个看起来挺漂亮的`modernist`主题，然后点击`select`：

![Screen Shot 2017-09-24 at 12.29.41 PM.png](http://upload-images.jianshu.io/upload_images/2218072-3c12e363c30dd9ce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

之后返回`settings`，发现网站已经生成了：

![Screen Shot 2017-09-24 at 12.30.45 PM.png](http://upload-images.jianshu.io/upload_images/2218072-1ab6f5314e597bb3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

网址默认是`https://github用户名.github.io/仓库名字(也是网站的名字)`
(因为我有自己的域名，所以直接生成一个二级域名。)

点击访问：

![Screen Shot 2017-09-24 at 12.31.06 PM.png](http://upload-images.jianshu.io/upload_images/2218072-f92d038f3f889876.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## 2.编辑网站
你会发现，刚刚生成的网站的内容是这个仓库的`README`文档。
所以，最简单的，直接修改`README`的内容就可以了。

回到仓库的页面，点击`README.md`

![Screen Shot 2017-09-24 at 12.35.45 PM.png](http://upload-images.jianshu.io/upload_images/2218072-37adcad5d03cfeb9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

点击`铅笔`的图标进行修改：

![Screen Shot 2017-09-24 at 12.35.54 PM.png](http://upload-images.jianshu.io/upload_images/2218072-eb204017053866fd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![Screen Shot 2017-09-24 at 12.37.58 PM.png](http://upload-images.jianshu.io/upload_images/2218072-cec489b05d33fdcd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

保存后隔一两分钟，再访问你的网站：

![Screen Shot 2017-09-24 at 1.57.13 PM.png](http://upload-images.jianshu.io/upload_images/2218072-f685e2576aac2938.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 成功！

## 3.拓展
1. 其实，不只是能单页面，你也可以在主页面里创建一个新的页面，实现多页面。
2. 或者，你看着这些文字很讨厌：

![Screen Shot 2017-09-24 at 12.39.08 PM 2.png](http://upload-images.jianshu.io/upload_images/2218072-0bf477c9e734c76f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

想重新定制一下，变成这样？

![Screen Shot 2017-09-24 at 2.04.02 PM.png](http://upload-images.jianshu.io/upload_images/2218072-ae4a0ca0778cfc12.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 请听下回分解~
