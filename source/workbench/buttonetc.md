---
标题: 按钮-示例用法
layout: default
type: "about"
comments: false

---

### 参考图标
http://fontawesome.io/icons/
eg. `arrow-left` `home` `paper-plane-o`

### 用法
直接在文章中加入
```
{% button /path/to/url/, 文字, icon [class], 标题 %}
```
简化：
```
Alias: {% btn /path/to/url/, 文字, icon [class], 标题 %}
```

（下文中以`#`代`url`）


#### 带文字
```
{% button #, 文字 %}

```
{% button buttontest, 文字 %}

```
{% btn #, 文字 %}{% btn #, 文字 & 标题,, 标题 %}
```
{% btn buttontest, 文字 %}{% btn buttontest, 文字 & 标题,, 标题 %}

```
{% btn #, 文字 %} {% btn #, 文字 & 标题,, 标题 %}
```
{% btn buttontest, 文字 %} {% btn buttontest, 文字 & 标题,, 标题 %}


```
{% btn #, 文字 %}
{% btn #, 文字 & 标题,, 标题 %}
```
{% btn buttontest, 文字 %}
{% btn buttontest, 文字 & 标题,, 标题 %}


#### 带图标

```
{% btn #,, home fa-5x %}
{% btn #,, home fa-4x %}
{% btn #,, home fa-3x %}{% btn #,, home fa-2x %}{% btn #,, home fa-lg %}{% btn #,, home %}
```
{% btn buttontest,, home fa-5x %}
{% btn buttontest,, home fa-4x %}
{% btn buttontest,, home fa-3x %}{% btn buttontest,, home fa-2x %}{% btn buttontest,, home fa-lg %}{% btn buttontest,, home %}

#### 带文字和图标
```
{% btn #, 文字 & 图标 (紧凑), home %}
{% btn #, 文字 & 图标 (适当宽度), home fa-fw %}```
{% btn buttontest, 文字 & 图标 (紧凑), home %}
{% btn buttontest, 文字 & 图标 (适当宽度), home fa-fw %}

```
{% btn #, 文字 & 大图标, home fa-fw fa-lg %}
{% btn #, 文字 & 大图标 & 标题, home fa-fw fa-lg, 标题 %}
```
{% btn buttontest, 文字 & 大图标, home fa-fw fa-lg %}
{% btn buttontest, 文字 & 大图标 & 标题, home fa-fw fa-lg, 标题 %}

#### 标签页内按钮

```

> {% btn #, 文字 & 图标, home fa-fw %}
 {% btn #,, home, 标题 %}{% btn #, 文字 %}

```


> {% btn buttontest, 文字 & 图标, home fa-fw %}
  {% btn buttontest,, home, 标题 %}{% btn #, 文字 %}

#### 按钮旁边空白
```
<div class="text-center"><span>{% btn #,, header %}{% btn #,, edge %}{% btn #,, times %}{% btn #,, circle-o %}</span>
<span>{% btn #,, italic %}{% btn #,, scribd %}</span>
<span>{% btn #,, google %}{% btn #,, chrome %}{% btn #,, opera %}{% btn #,, diamond fa-rotate-270 %}</span></div>```

<div class="text-center"><span>{% btn buttontest,, header %}{% btn buttontest,, edge %}{% btn buttontest,, times %}{% btn buttontest,, circle-o %}</span>
<span>{% btn buttontest,, italic %}{% btn buttontest,, scribd %}</span>
<span>{% btn buttontest,, google %}{% btn buttontest,, chrome %}{% btn buttontest,, opera %}{% btn buttontest,, diamond fa-rotate-270 %}</span></div>


居中：
```
<div class="text-center">{% btn #, Almost, adn fa-fw fa-lg %} {% btn #, Over, terminal fa-fw fa-lg %}</div>
```

<div class="text-center">{% btn buttontest, Almost, adn fa-fw fa-lg %} {% btn buttontest, Over, terminal fa-fw fa-lg %}</div>

页面右侧：
```
<div class="text-right">
{% btn #, Test is finished., check fa-fw fa-lg, Button tag test is finished. %}
</div>
```

<div class="text-right">
{% btn buttontest, Test is finished., check fa-fw fa-lg, Button tag test is finished. %}
</div>



### 自用
```
{% btn #, 小纸条, paper-plane-o %}
{% btn #,, arrow-left fa-1x %}
{% btn #,, home fa-1x %}
```

{% btn buttontest, 小纸条, paper-plane-o %}
{% btn buttontest,, arrow-left fa-1x %}
{% btn buttontest,, home fa-1x %}

&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;

{% btn index,, arrow-left fa-1x %}