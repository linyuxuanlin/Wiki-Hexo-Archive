---
title: Workbench
layout: default
type: "about"
comments: true
---

### Hexo文章密码 `Demo` 
**测试页面：[[passtest]](passtest)**
密码：123456
&nbsp;


### 音乐播放控件 `Demo` 
**成品：**
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
            "title": "The Ragtime Dance",
            "author": "Scott Joplin/Louis Piano Man Riddles",
            "url": "http://ovp6a4f6u.bkt.clouddn.com/The%20Ragtime%20Dance.mp3",
            "pic": "http://upload-images.jianshu.io/upload_images/2218072-5a8478977d3c4494.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
        },
        {
           "title": "The Crave",
            "author": "Jelly Roll Morton",
            "url": "http://ovp6a4f6u.bkt.clouddn.com/04%20The%20Crave.mp3",
            "pic": "http://upload-images.jianshu.io/upload_images/2218072-4ce4d7af11fd826c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
        },
        {
           "title": "Peacherine Rag",
            "author": "Scott Joplin/Louis Piano Man Riddle",
            "url": "http://ovp6a4f6u.bkt.clouddn.com/1-14%20Peacherine%20Rag.mp3",
            "pic": "http://upload-images.jianshu.io/upload_images/2218072-3bde9c7345a1e1fe.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
        },
        {
           "title": "Scott Joplin's New Rag",
            "author": "Scott Joplin/Louis Piano Man Riddle",
            "url": "http://ovp6a4f6u.bkt.clouddn.com/1-08%20Scott%20Joplin%27s%20New%20Rag.mp3",
            "pic": "http://upload-images.jianshu.io/upload_images/2218072-3bde9c7345a1e1fe.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
        },
        {
           "title": "Peacherine Rag  Alexander Ragtime Band",
            "author": "Jelly Roll Morton",
            "url": "http://ovp6a4f6u.bkt.clouddn.com/13%20Peacherine%20Rag%20%20Alexander%20Ragtime%20Band.mp3",
            "pic": "http://upload-images.jianshu.io/upload_images/2218072-4ce4d7af11fd826c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
        },
        {
           "title": "Tom Cat Blues",
            "author": "Jelly Roll Morton",
            "url": "http://ovp6a4f6u.bkt.clouddn.com/1-04%20Tom%20Cat%20Blues.mp3",
            "pic": "http://upload-images.jianshu.io/upload_images/2218072-2443aef185e1b18b.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
        },
        {
           "title": "The Easy Winners",
            "author": "Scott Joplin",
            "url": "http://ovp6a4f6u.bkt.clouddn.com/1-05%20The%20Easy%20Winners.mp3",
            "pic": "http://upload-images.jianshu.io/upload_images/2218072-3bde9c7345a1e1fe.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
        }
    ]
}
{% endaplayerlist %}

**类似插件测试：[[musictest]](musictest)**


&nbsp; 

### 按钮控件 `Demo` 

**测试：**

{% button buttontest, 测试按钮 %}

**示例用法：[[buttonetc]](buttonetc)**


&nbsp; 

### tabs标签 `Demo` 
就像是浏览器的标签页

**测试：**
{% tabs 选项卡, 2 %}
<!-- tab -->
**这是选项卡 1** nanana
<!-- endtab -->
<!-- tab -->
**这是选项卡 2**
<!-- endtab -->
<!-- tab -->
**这是选项卡 3** hello again!
<!-- endtab -->
{% endtabs %}


