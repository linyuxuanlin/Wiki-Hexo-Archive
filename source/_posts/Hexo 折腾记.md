---
title: Hexo 折腾记
date: 2017-12-17 
tags: [教程,Hexo]
categories: 科技
comments: true
photo:

---
看到有些基于Hexo搭建的网站很漂亮，那是怎样深度定制的呢？
<!-- more -->
持续更新~

&nbsp;

---
## 背景颜色
**效果**
看我的网站就是了
**实现方法**

定义颜色变量：`themes/next/source/css/_variables/custom.styl`

```
// 背景颜色
$body-bg-color = #f5f5d5;
$header-bg-color = #f5f5d5;
$footer-bg-color = #f5f5d5;
```


---

## 修改文章底部标签样式
带`#`的标签并不好看
**效果图**
![屏幕快照 2017-12-17 下午2.56.00.png](http://upload-images.jianshu.io/upload_images/2218072-db1bd282fc556cd4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**实现方法**
修改模板`/themes/next/layout/_macro/post.swig`，搜索`rel="tag">#`，将`#`换成`<i class="fa fa-tag"></i>`

---

## 点击爆炸效果
**效果图**
![]( http://ovp6a4f6u.bkt.clouddn.com/2218072-c9f4802f7e975fa2.png)

**实现方法**
1. 首先在`themes/next/source/js/src`里面新建一个叫`fireworks.js`的文件，输入以下代码：
```
"use strict";function updateCoords(e){pointerX=(e.clientX||e.touches[0].clientX)-canvasEl.getBoundingClientRect().left,pointerY=e.clientY||e.touches[0].clientY-canvasEl.getBoundingClientRect().top}function setParticuleDirection(e){var t=anime.random(0,360)*Math.PI/180,a=anime.random(50,180),n=[-1,1][anime.random(0,1)]*a;return{x:e.x+n*Math.cos(t),y:e.y+n*Math.sin(t)}}function createParticule(e,t){var a={};return a.x=e,a.y=t,a.color=colors[anime.random(0,colors.length-1)],a.radius=anime.random(16,32),a.endPos=setParticuleDirection(a),a.draw=function(){ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.fillStyle=a.color,ctx.fill()},a}function createCircle(e,t){var a={};return a.x=e,a.y=t,a.color="#F00",a.radius=0.1,a.alpha=0.5,a.lineWidth=6,a.draw=function(){ctx.globalAlpha=a.alpha,ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.lineWidth=a.lineWidth,ctx.strokeStyle=a.color,ctx.stroke(),ctx.globalAlpha=1},a}function renderParticule(e){for(var t=0;t<e.animatables.length;t++){e.animatables[t].target.draw()}}function animateParticules(e,t){for(var a=createCircle(e,t),n=[],i=0;i<numberOfParticules;i++){n.push(createParticule(e,t))}anime.timeline().add({targets:n,x:function(e){return e.endPos.x},y:function(e){return e.endPos.y},radius:0.1,duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule}).add({targets:a,radius:anime.random(80,160),lineWidth:0,alpha:{value:0,easing:"linear",duration:anime.random(600,800)},duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule,offset:0})}function debounce(e,t){var a;return function(){var n=this,i=arguments;clearTimeout(a),a=setTimeout(function(){e.apply(n,i)},t)}}var canvasEl=document.querySelector(".fireworks");if(canvasEl){var ctx=canvasEl.getContext("2d"),numberOfParticules=30,pointerX=0,pointerY=0,tap="mousedown",colors=["#FF1461","#18FF92","#5A87FF","#FBF38C"],setCanvasSize=debounce(function(){canvasEl.width=2*window.innerWidth,canvasEl.height=2*window.innerHeight,canvasEl.style.width=window.innerWidth+"px",canvasEl.style.height=window.innerHeight+"px",canvasEl.getContext("2d").scale(2,2)},500),render=anime({duration:1/0,update:function(){ctx.clearRect(0,0,canvasEl.width,canvasEl.height)}});document.addEventListener(tap,function(e){"sidebar"!==e.target.id&&"toggle-sidebar"!==e.target.id&&"A"!==e.target.nodeName&&"IMG"!==e.target.nodeName&&(render.play(),updateCoords(e),animateParticules(pointerX,pointerY))},!1),setCanvasSize(),window.addEventListener("resize",setCanvasSize,!1)}"use strict";function updateCoords(e){pointerX=(e.clientX||e.touches[0].clientX)-canvasEl.getBoundingClientRect().left,pointerY=e.clientY||e.touches[0].clientY-canvasEl.getBoundingClientRect().top}function setParticuleDirection(e){var t=anime.random(0,360)*Math.PI/180,a=anime.random(50,180),n=[-1,1][anime.random(0,1)]*a;return{x:e.x+n*Math.cos(t),y:e.y+n*Math.sin(t)}}function createParticule(e,t){var a={};return a.x=e,a.y=t,a.color=colors[anime.random(0,colors.length-1)],a.radius=anime.random(16,32),a.endPos=setParticuleDirection(a),a.draw=function(){ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.fillStyle=a.color,ctx.fill()},a}function createCircle(e,t){var a={};return a.x=e,a.y=t,a.color="#F00",a.radius=0.1,a.alpha=0.5,a.lineWidth=6,a.draw=function(){ctx.globalAlpha=a.alpha,ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.lineWidth=a.lineWidth,ctx.strokeStyle=a.color,ctx.stroke(),ctx.globalAlpha=1},a}function renderParticule(e){for(var t=0;t<e.animatables.length;t++){e.animatables[t].target.draw()}}function animateParticules(e,t){for(var a=createCircle(e,t),n=[],i=0;i<numberOfParticules;i++){n.push(createParticule(e,t))}anime.timeline().add({targets:n,x:function(e){return e.endPos.x},y:function(e){return e.endPos.y},radius:0.1,duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule}).add({targets:a,radius:anime.random(80,160),lineWidth:0,alpha:{value:0,easing:"linear",duration:anime.random(600,800)},duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule,offset:0})}function debounce(e,t){var a;return function(){var n=this,i=arguments;clearTimeout(a),a=setTimeout(function(){e.apply(n,i)},t)}}var canvasEl=document.querySelector(".fireworks");if(canvasEl){var ctx=canvasEl.getContext("2d"),numberOfParticules=30,pointerX=0,pointerY=0,tap="mousedown",colors=["#FF1461","#18FF92","#5A87FF","#FBF38C"],setCanvasSize=debounce(function(){canvasEl.width=2*window.innerWidth,canvasEl.height=2*window.innerHeight,canvasEl.style.width=window.innerWidth+"px",canvasEl.style.height=window.innerHeight+"px",canvasEl.getContext("2d").scale(2,2)},500),render=anime({duration:1/0,update:function(){ctx.clearRect(0,0,canvasEl.width,canvasEl.height)}});document.addEventListener(tap,function(e){"sidebar"!==e.target.id&&"toggle-sidebar"!==e.target.id&&"A"!==e.target.nodeName&&"IMG"!==e.target.nodeName&&(render.play(),updateCoords(e),animateParticules(pointerX,pointerY))},!1),setCanvasSize(),window.addEventListener("resize",setCanvasSize,!1)};
```
2. 打开`themes/next/layout/_layout.swig`,在`</body>`上面写下如下代码：
```
{% if theme.fireworks %}
   <canvas class="fireworks" style="position: fixed;left: 0;top: 0;z-index: 1; pointer-events: none;" ></canvas> 
   <script type="text/javascript" src="//cdn.bootcss.com/animejs/2.2.0/anime.min.js"></script> 
   <script type="text/javascript" src="/js/src/fireworks.js"></script>
{% endif %}
```
3. 打开`主题配置文件`，添加：
```
# 烟花效果
fireworks: true
```


---

## 底部加上访问量和字数统计
**效果图**
![屏幕快照 2017-12-17 下午2.34.49.png](http://upload-images.jianshu.io/upload_images/2218072-1771caf4f0cd1c70.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**访问量——实现方法**
打开`\themes\next\layout_partials\footer.swig`文件,在`copyright`框前加上这句话：
```
<script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>

```
然后在随便一个位置添加显示统计的代码，如图：
```
<div class="powered-by">
<i class="fa fa-user-md"></i><span id="busuanzi_container_site_uv">
  本站访客数:<span id="busuanzi_value_site_uv"></span>
</span>
</div>
```
在这里有两中不同计算方式的统计代码：
1. pv的方式，单个用户连续点击n篇文章，记录n次访问量
2. uv的方式，单个用户连续点击n篇文章，只记录1次访客数

只需要修改这句话：
```
<span id="busuanzi_value_site_uv"></span>
```
中的`uv`/`pv`即可

**字数统计——实现方法**
切换到根目录下，然后运行如下代码：
```
$ npm install hexo-wordcount --save

```
然后在`/themes/next/layout/_partials/footer.swig`文件尾部加上：
```
<div class="theme-info">
  <div class="powered-by"></div>
  <span class="post-count">博客全站共{{ totalcount(site) }}字</span>
</div>
```

---
## 改变文本选中颜色

[使用CSS3::selection伪元素改变文本选中颜色](http://www.vinsongeek.com/2017/11/17/%E4%BD%BF%E7%94%A8CSS3-selection%E4%BC%AA%E5%85%83%E7%B4%A0%E6%94%B9%E5%8F%98%E6%96%87%E6%9C%AC%E9%80%89%E4%B8%AD%E9%A2%9C%E8%89%B2/)

---

## 设置动态title
**效果图**
[效果图.gif]( http://ovp6a4f6u.bkt.clouddn.com/xthk0-frjbw.gif)

**实现方法**
在 `\themes\next\source\js\src` 目录下新建 `dytitle.js` 。添加以下内容：
```
<!--崩溃欺骗-->
var OriginTitile = document.title;
 var titleTime;
 document.addEventListener('visibilitychange', function () {
     if (document.hidden) {
         $('[rel="icon"]').attr('href', "/img/TEP.ico");
         document.title = ' 你好像掉线了';
         clearTimeout(titleTime);
     }
     else {
         $('[rel="icon"]').attr('href', "/favicon.ico");
         document.title = ' 嗯正常了~ ' + OriginTitile;
         titleTime = setTimeout(function () {
             document.title = OriginTitile;
         }, 2000);
     }
 });

```
更改 `\themes\next\layout\_layout.swig` ，在 `</body `之前添加：
```
<!--卖萌-->
<script type="text/javascript" src="/js/src/dytitle.js"></script>
```

---

## 为博客加上萌萌的宠物
**效果图**
看右下角或者点击[效果图.gif](http://upload-images.jianshu.io/upload_images/2218072-e9b2a2a5cc45cd9c.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
ps:好像有些model不应该叫宠物。。。
**实现方法**
在你的博客的根目录里，输入如下代码：
```
npm install -save hexo-helper-live2d
```
然后打开`Hexo/blog/themes/next/layout`
下的`_layout.swig`,将下面代码放到末尾的</body>之前：
```
{{ live2d() }}

```
然后在在`hexo`的`_config.yml`中添加参数：
```
live2d:
  model: wanko
  bottom: -30
```
各种模型：https://github.com/EYHN/hexo-helper-live2d
* width 宽度 默认值: 150
* height 高度 默认值： 300
* className `<canvas>`元素的类名 默认值： live2d
* id `<canvas>` 元素的id 默认值： live2dcanvas
* bottom `<canvas>` 元素的底部偏移 默认值： -20 如果嫌模型位置不正确 可以调整这个参数

---

## 自定义鼠标样式

**实现方法**
在`themes/next/source/css/_custom/custom.styl`添加：
```
// 鼠标样式
  * {
      cursor: url("http://om8u46rmb.bkt.clouddn.com/sword2.ico"),auto!important
  }
  :active {
      cursor: url("http://om8u46rmb.bkt.clouddn.com/sword1.ico"),auto!important
  }
```
其中`url`里面必须是`ico`图片，可以直接把图片传到网上（`七牛云`或`简书`），获取外链就可以了。

&nbsp;


---

## 推荐博客
[Hexo小书](https://pengloo53.gitbooks.io/hexo/content/)

[Vinson-sheep博客](http://www.vinsongeek.com/)

## 拓展阅读
[Hexo小书](https://pengloo53.gitbooks.io/hexo/content/)
[关于 Hexo 的若干问题](http://bubkoo.com/2013/12/16/hexo-issure/)


## 结尾
希望以上的教程能帮到你~
