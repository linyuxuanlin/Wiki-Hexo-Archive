---
title: 给 Hexo 加上评论(已弃用)
date: 2017-12-07
tags: [Hexo,教程]
categories: 科技
comments: true
photo:
- http://upload-images.jianshu.io/upload_images/2218072-055a2debefc90a3e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240

---

2018.1.17更新
改用更加简洁的 [Valine](https://radiastu.com/2018/01/21/%E6%9E%81%E7%AE%80%E7%9A%84%E8%AF%84%E8%AE%BA%E7%B3%BB%E7%BB%9F/#more)

<!-- more -->

---

2018.1.14更新：
弃用 Gitment 的原因：
* 每写一篇文章都必须配置一下
* 每个页面都必须手动初始化
* 只能用 GitHub 账号登陆

~~现改用[來比利](https://livere.com/)~~
参考：
[hexo从多说评论转为韩国来必力评论](https://zengmianhui.github.io/2017/05/02/hexo%E4%BB%8E%E5%A4%9A%E8%AF%B4%E8%AF%84%E8%AE%BA%E8%BD%AC%E4%B8%BA%E9%9F%A9%E5%9B%BD%E6%9D%A5%E5%BF%85%E5%8A%9B%E8%AF%84%E8%AE%BA/)
[第三方评论系统推荐](https://blog.shuiba.co/comment-systems-recommendation)


---

## 原文：

可以点开看看效果：[测试页面](https://radiastu.com/workbench/GitHubIssues)
多说停止服务了，网易云跟帖也挂了，disqus在墙内没法看到。
于是，有人突发奇想，利用 GitHub 的 Issues 来搭建评论系统。
项目的中文简介：[文档](https://imsun.net/posts/gitment-introduction/)
GitHub 仓库：[gitment](https://github.com/imsun/gitment)
示例页面：[Gitment Demo Page](https://imsun.github.io/gitment/)
中文介绍写得有些复杂，我给大家简化一下。

## 1. 注册 OAuth Application
[点击此处](https://github.com/settings/applications/new) 注册一个 Application，按下图填写相关信息：
![屏幕快照 2017-08-01 上午10.29.14.png](http://upload-images.jianshu.io/upload_images/2218072-bddd580954bcd4f4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
点击绿色的按钮提交
然后你会得到 client ID 和 client secret，之后会用到的

## 2. 把代码引入到你的页面
eg. 我在 关于我 的页面添加评论，只需要把以下代码添加到文章的末尾：
```html
<div id="container"></div>
<link rel="stylesheet" href="https://imsun.github.io/gitment/style/default.css">
<script src="https://imsun.github.io/gitment/dist/gitment.browser.js"></script>
<script>
var gitment = new Gitment({
  id: '页面 ID', // 可选。默认为 location.href
  owner: 'linyuxuanlin',  //改你自己的名字
  repo: 'Comments',  //专门储存评论一个GitHub仓库
  oauth: {
    client_id: '45dc966马赛克b1950', //改为你自己的，下同
    client_secret: '839马赛克647523eb马赛克c6ad1f598f5df',
  },
})
gitment.render('container')
</script>
```

## 3. 初始化评论
把页面 **发布** 一下
然后打开有放置评论的页面，用你的GitHub账号登陆，按提示点击 **初始化** 按钮
这样评论系统就建立啦~

## 更多自定义
请见[中文介绍](https://imsun.net/posts/gitment-introduction/)

有兴趣可以加我微信: `linyuxuanlin`
一起交流讨论hexo建站~
