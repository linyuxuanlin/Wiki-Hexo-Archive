---
title: Hexo 文章简单加密访问
date: 2017-12-8 
tags: [教程,Hexo]
categories: 科技
comments: true
photo:
- http://upload-images.jianshu.io/upload_images/2218072-96d0a541a8684ebb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240

---
> 即使是最简单的密码,也足以阻止90%的人

测试页面：[工作台](http://radiationstu.cn/workbench/)
<!-- more -->
(随便点进去一个链接试试?)


## 起因
> 当 Hexo 有了文章加密的功能，我终于可以写一些私密的内容了

起初，我是用`印象笔记`来写一些东西的，只是如果要与别人分享的话，不是很方便。
而这种做法，得到密码就可以打开某一篇文章了。

## 过程
很简单的一个操作，打开`主题文件夹/layout/_partials/head.swig`
在首句`<meta charset="UTF-8"/>`后面插入以下代码：

```
<script>
    (function(){
        if('{{ page.password }}'){
            if (prompt('请输入文章密码') !== '{{ page.password }}'){
                alert('密码错误');
                history.back();
            }
        }
    })();
</script>
```

然后，在需要加密的文章里加进`password: 你要设的密码`
像这样：
```
---
title: 文章标题
layout: default
password: 123456
---
```

这就完成了，效果和上面的图一样。

## 安全性
> 道高一尺，魔高一丈

毕竟是静态的网站，这种方式只能阻挡一般人。
如果你有更好的方法，不妨在下面的评论里分享一下？

