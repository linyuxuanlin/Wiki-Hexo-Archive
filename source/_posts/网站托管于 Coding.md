---
title: 网站托管于 Coding
date: 2017-12-31 
tags: [Hexo,教程]
categories: 科技
comments: true
photo:
- http://upload-images.jianshu.io/upload_images/2218072-b93a681c1738aafd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240


---
最近把网站的部署从`GitHub Pages`转移到了`Coding Pages`。当然，最初的地址[linyuxuanlin.github.io](linyuxuanlin.github.io)还是可以用的，只不过域名的指向变了而已。谈谈部署在Coding的各种优缺点吧。
<!-- more -->


&nbsp;

---




为了这篇文章看起来不那么像软文，我先说一下缺点吧（当然没拿广告费）
## 缺点
1. 仓库容量小，只有256 MB，可以通过升级套餐增加容量。（说贵不贵，说便宜也不便宜）
2. 免费的套餐，绑定自己的域名时，会插入广告。
3. 数据储存在国内，多少还是有点不放心 /逃

## Coding的好处
**1. 加载速度快**
也因为服务器在国内，所以加载速度比GitHub快很多，至于自己搭服务器的话，如果只是一个博客，我感觉没必要。。。

**2. 私有仓库**
Coding免费版套餐可以有5个私有的仓库，如果部署网站时不想让别人看到发布的源文件，确实挺好用的。

**3. 自动加证书**
  如图↓
![屏幕快照 2017-12-31 下午7.48.39.png](http://upload-images.jianshu.io/upload_images/2218072-06304aab1361f02e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240 )
不用再去申请SSL证书了~

**4. 广告可以"缩小面积"**
为什么这样说呢？且看官方的说明：
> 银牌会员的 Coding Pages 在访问时默认会先加载 Pages 跳转页，您可选择在网站首页任意位置放置「Hosted by Coding Pages」的文字版或图片版，然后勾选下方的「已放置 Hosted by Coding Pages」选项，通过审核后您的 Pages 将不会显示跳转页。请务必将「Hosted by Coding Pages」持续保留在网站首页，撤掉后跳转页会再次出现。

其中，`银牌会员`就是免费套餐，`跳转页`就是广告。
如果你仔细观察，你可以在这个网站的最下端看到

![屏幕快照 2017-12-31 下午7.28.27.png](http://upload-images.jianshu.io/upload_images/2218072-9647b82a4b8b81d3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
这样就不会出现`跳转页`广告了。（升级套餐的话用不着这么麻烦，土豪请随意）

**5. [WebIDE](https://ide.coding.net/)**
适合总换设备的人 :)
![屏幕快照 2017-12-31 下午7.51.44.png](http://upload-images.jianshu.io/upload_images/2218072-8e206d5e3a880473.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

可以直接在网页上修改、写作、部署，只是因为直接在网页上操作，所以显得不是那么流畅。

**6. 更丰富的域名绑定选项**
![屏幕快照 2017-12-31 下午7.35.52.png](http://upload-images.jianshu.io/upload_images/2218072-95dbe9afe5edb158.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如果你有多个域名，不需要在域名服务商那儿设置各种跳转，用Coding的这个功能再容易不过了。


ps：发现我换了个新的域名吗？腾讯云年终降价，用很低的价格拍下的这个`.com`的域名

我现在有几个域名：
* [radiastu.com](https://radiastu.com)
* [radiationstu.cn](https://radiationstu.cn)
* [辐射.cn](http://辐射.cn)
* [yxlin.xyz](https://yxlin.xyz)

其中，前三个都可以跳转至我的网站，最后一个嘛，做实验用的，能不能打开取决于你的运气 :)

## 总结
说到底，还是要感谢Coding，提供了这么方便的服务，使得这篇文章能够稳定、快速地呈现在您的眼前 :)


&nbsp;
来一首Ragtime吧~
{% aplayerlist %}
{
  "narrow": false,            
    "autoplay": false,            
    "mode": "circulation",                    
    "mutex": true,              
    "theme": "#e6d0b2",           
  "preload": "auto",          
  "listmaxheight": "513px",       
    "music": [
        
        {
           "title": "The Easy Winners",
            "author": "Scott Joplin",
            "url": "http://ovp6a4f6u.bkt.clouddn.com/1-05%20The%20Easy%20Winners.mp3",
            "pic": "http://upload-images.jianshu.io/upload_images/2218072-3bde9c7345a1e1fe.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
        }
    ]
}
{% endaplayerlist %}

