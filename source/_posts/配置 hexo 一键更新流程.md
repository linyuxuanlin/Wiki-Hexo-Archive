---
title: MacOS 配置 Hexo 一键更新
date: 2017-12-05
tags: [技巧,MacOS,Hexo]
categories: 技巧
photo:
- http://upload-images.jianshu.io/upload_images/2218072-1a2d27076e613abd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240
---




众所周知，在Pages上写文章，写完之了后，需要在git命令行先生成，再部署。
缩减版的指令是这样的：
```
hexo g
hexo d
```
再缩减，成了这样：

```
hexo d -g
```
可是我们还想偷懒！有没有更简单的方法呢？

<!-- more -->

MacOS下有个神一般的应用，叫Automator，最近很流行的workflow就是由这个来的。

![屏幕快照 2017-07-01 下午4.43.40.png](http://upload-images.jianshu.io/upload_images/2218072-574b06a28b68ccd1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
它能然你自定义工作流程，以完成一些重复而无脑的操作。

![屏幕快照 2017-07-01 下午4.48.16.png](http://upload-images.jianshu.io/upload_images/2218072-384c3ed576b6e193.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

本文以一键更新Hexo为例，简略介绍一下Automator的用法。

# 一键更新Hexo
## 打开终端类
因为我用的是iTerm，所以下图直接打开它，如果是别的终端就选那个
![屏幕快照 2017-07-01 下午4.52.18.png](http://upload-images.jianshu.io/upload_images/2218072-e5ea94bbd758b6f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
## 控制键盘输入`hexo d -g`


![屏幕快照 2017-07-01 下午4.56.00.png](http://upload-images.jianshu.io/upload_images/2218072-214a9d78a5d49b40.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
找到`执行AppleScript`，把以下代码复制进框里：
```
on run {input, parameters}
	--
	set timeoutSeconds to 0
	set uiScript to "keystroke \"hexo d -g

\" " --Mark，注意这行代码
	my doWithTimeout(uiScript, timeoutSeconds)
	return input
end run

on doWithTimeout(uiScript, timeoutSeconds)
	set endDate to (current date) + timeoutSeconds
	repeat
		try
			run script "tell application \"System Events\"
" & uiScript & "
end tell"
			exit repeat
		on error errorMessage
			if ((current date) > endDate) then
				error "Can not " & uiScript
			end if
		end try
	end repeat
end doWithTimeout
```
## 完成！
先打开终端，输入`cd 博客位置`(这一操作不自动，因为只需要重复一次)。
单击`运行`按钮或者`cmd+R`，自动生成&部署成功！
## 拓展
并不只有这个玩法，你也可以加一句`hexo s`进去试试，或者尝试别的玩法。
只有你想不到，没有Automator做不到的~
