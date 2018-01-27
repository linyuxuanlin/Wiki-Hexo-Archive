---
title: T-Clock
date: 2017-06-25 09:47:42
tags: [3D打印,Arduino,C++,教程,作品]
categories: 科技
photo:
- http://upload-images.jianshu.io/upload_images/2218072-9f8c9b10e99a5561.jpg!thumbnail?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240


---


## 简介

一直想给自己来一个桌上的小时钟，今天就来做一个吧~
<!-- more -->

## 硬件

* Arduino pro mini（主要是因为体积小，其他的型号也兼容）

* OLED屏（内部驱动芯片：SSD1306）



* SPI接口（如果是IIC或者是其他屏幕的也可以，修改程序第12行）

* RTC时钟模块（ds1307）（可加DS18B20测温）




* 锂电池

* 锂电池充电模块

* 开关

## 接线

见代码，RTC模块按IIC协议接

## 代码
```cpp

/*

name:T-Clock

Description: a tiny clock 

IDE version:  1.8.2

Author:  Lin <linyuxuanlin.github.io>

Date:    2016-10-3

*/

#include <U8glib.h>

#include <SPI.h>

#include <Wire.h>

#include <RTClib.h>

U8GLIB_SSD1306_128X64 u8g(10, 9, 12, 11, 13);

//这里适用的OLED屏的引脚是：D0,D1,RST,DC

/*接线：

  OLED-Arduino

  D0-D10

  D1-D9

  RST-D13

  DC-D11

*/

RTC_DS1307 RTC;//RTC按照IIC接线

char monthString[37] =

{

  "JanFebMarAprMayJunJulAugSepOctNovDec"

}

;

int  monthIndex[122] =

{

  0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33

}

;

String thisMonth = "";

String thisTime = "";

String thisDay = "";

//用于定义表盘的中心

int clockCentreX = 64;

int clockCentreY = 32;

void draw(void)

{

  u8g.setFont(u8g_font_profont15);

  DateTime now = RTC.now();

  //在底部显示日期

  thisDay = String(now.day(), DEC) + "/";

  thisMonth = "";

  for (int i = 0; i <= 2; i++)

  {

    thisMonth += monthString[monthIndex[now.month() - 1] + i];

  }

  thisDay = thisDay + thisMonth + "/";

  thisDay = thisDay + String(now.year() , DEC);

  const char* newDay = (const char*) thisDay.c_str();

  u8g.drawStr(32, 63, newDay);

  thisTime = "";

  thisTime = String(now.hour()) + ":";

  if (now.minute() < 10)

  {

    thisTime = thisTime + "0";    // 在单数数字前头加个0

  }

  //数字时间

  thisTime = thisTime + String(now.minute()) ;

  const char* newTime = (const char*) thisTime.c_str();

  u8g.drawStr(10, 10, newTime);

  //画时钟盘面

  u8g.drawCircle(clockCentreX, clockCentreY, 20); // 外面的大圆

  u8g.drawCircle(clockCentreX, clockCentreY, 2);  // 里面的小圆

  //跳动显示

  for ( int z = 0; z < 360; z = z + 30 )

  {

    //始于0°,止于360°

    float angle = z ;

    angle = (angle / 57.29577951) ;   //化度数为弧度

    int x2 = (clockCentreX + (sin(angle) * 20));

    int y2 = (clockCentreY - (cos(angle) * 20));

    int x3 = (clockCentreX + (sin(angle) * (20 - 5)));

    int y3 = (clockCentreY - (cos(angle) * (20 - 5)));

    u8g.drawLine(x2, y2, x3, y3);

  }

  // 秒针

  float angle = now.second() * 6 ;

  angle = (angle / 57.29577951) ; //化度数为弧度

  int x3 = (clockCentreX + (sin(angle) * (20)));

  int y3 = (clockCentreY - (cos(angle) * (20)));

  u8g.drawLine(clockCentreX, clockCentreY, x3, y3);

  // 分针

  angle = now.minute() * 6 ;

  angle = (angle / 57.29577951) ; //化度数为弧度

  x3 = (clockCentreX + (sin(angle) * (20 - 3)));

  y3 = (clockCentreY - (cos(angle) * (20 - 3)));

  u8g.drawLine(clockCentreX, clockCentreY, x3, y3);

  // 时针

  angle = now.hour() * 30 + int((now.minute() / 12) * 6 )   ;

  angle = (angle / 57.29577951) ; //化度数为弧度

  x3 = (clockCentreX + (sin(angle) * (20 - 11)));

  y3 = (clockCentreY - (cos(angle) * (20 - 11)));

  u8g.drawLine(clockCentreX, clockCentreY, x3, y3);

  //显示自己的定制字符

  u8g.setPrintPos(100, 10);

  u8g.print("Lin");

}

void setup(void)

{

  Serial.begin(9600);

  analogReference(EXTERNAL);

  Wire.begin();

  RTC.begin();

  if (! RTC.isrunning())

  {

    Serial.println("RTC is NOT running!");

    RTC.adjust(DateTime(__DATE__, __TIME__));

  }

}

void loop(void)

{

  u8g.firstPage();

  do

  {

    draw();

  }

  while ( u8g.nextPage() );

  delay(10);

}
```
## 外壳

本来是想3D打印一个的，无奈焊接后时间不准，没法调了：)
## 资料下载

##### 所有文件：[https://github.com/linyuxuanlin/My-Arduino-projects/tree/master/T-Clock](https://github.com/linyuxuanlin/My-Arduino-projects/tree/master/T-Clock)

注：我提供的文件里已经包括下列库，这些仅供参考
##### RTClib库

###### GitHub ：[https://github.com/adafruit/RTClib](https://github.com/adafruit/RTClib)

##### U8glib库

###### GitHub ： [https://github.com/olikraus/u8glib](https://github.com/olikraus/u8glib)

###### 备用：
[https://bintray.com/olikraus/u8glib](https://bintray.com/olikraus/u8glib)

## 参考
##### 屏幕显示不了？先来测试一下~

###### [OLED-SPI试验](http://shimo.im/doc/63ALdXdl3EUInWJO) 

##### 用Arudino Uno给pro mini烧程序：

###### [http://blog.sina.com.cn/s/blog_53f8d23d0102wv3m.html](http://blog.sina.com.cn/s/blog_53f8d23d0102wv3m.html)

##### U8glib用法：

###### [https://github.com/olikraus/u8glib/wiki/device#ssd1306-128x64](https://github.com/olikraus/u8glib/wiki/device#ssd1306-128x64)

###### GitHub源，英文

###### [http://www.geek-workshop.com/thread-10634-1-1.html](http://www.geek-workshop.com/thread-10634-1-1.html)

###### 极客工坊，中文，比较推荐

##### OLED屏参考：

###### 引脚信息：
D0：CLK时钟
D1：MOSI数据
RST：复位
DC：数据/命令
兼容3.3V和5V

## 写在最后

这个项目花了一天的时间，我尽量让这这篇文章看起来详细和容易理解。

（不介意给这个项目一个star？）
