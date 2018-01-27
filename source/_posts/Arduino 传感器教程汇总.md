---
title: Arduino教程汇总
date: 2016-10-02 22:48:49
tags: [Arduino,C++,教程]
categories: 科技
photo:
- http://upload-images.jianshu.io/upload_images/2218072-52aa8ec70e5463d4.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240
---



缓更

<!-- more -->

## 什么是Arduino?
可以把Arduino主控板看做一个微缩版电脑，编写程序，交给Arduino帮你执行。
若你想造一只机器人，Arudino作为控制中枢，从各传感器接收数据，处理并交给其它传感器执行，这样，机器人就能动了。

## Arduino的优势
Arduino在全世界创客圈的影响范围很大，有数不胜数的开源社区、论坛。对比51单片机，Arduino极易入门，而且能适应快速开发。对于我们学生，随时能造出一些黑科技，服务于我们的生活。

# 各类传感器的参考
## 输入类

### 按钮
![按钮.jpg](http://upload-images.jianshu.io/upload_images/2218072-aeda78b724631135.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**1. 简介:**
输入设备，按下时输出低电平，反之

**2. 接线:**
![Button_bb.jpg](http://upload-images.jianshu.io/upload_images/2218072-cf474a2de3118976.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**3. 程序:**

``` c++
//name: Button example
//Description: 按扭的例程
//IDE version:  1.6
//Author:  Lin <linyuxuanlin.github.io>
//Date:    2016-10-3
//note: 按下按钮，LED亮；松开，LED灭

int Button = 2;
int LEDpin = 13;
void setup() {
  pinMode(Button, INPUT_PULLUP); //上拉使之默认接高电平,省去电阻
  pinMode(LEDpin, OUTPUT);  //设置13号IO口为输出状态
}

void loop() {
  int ButtonState = digitalRead(Button); //设置变量存储状态值
  if(ButtonState==0)
  {
  digitalWrite(LEDpin,HIGH);        //如果读到的状态为0，说明按键已经按下，点亮LED
  }
  else
  {
  digitalWrite(LEDpin,LOW);      // 反之，熄灭LED
  }   
}

```


### 超声波传感器
![超声波.jpg](http://upload-images.jianshu.io/upload_images/2218072-886fc319ad0ce660.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**1. 简介:**
检测距离
**2. 接线:**

![Untitled Sketch_bb.jpg](http://upload-images.jianshu.io/upload_images/2218072-3a74bc428d79e527.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


**3. 程序:**
为了最大程度简化程序，这里我们可以用到这个库文件
[SR04库](https://yun.baidu.com/share/link?shareid=443161475&uk=3996344533)
``` c++
/*
name: HC-SR04 example
Description: 超声波测距,输出至串口
IDE version:  1.6
Author:  Lin <linyuxuanlin.github.io>
Date:  2016-10-5
note: TRIG - 2
      ECHO - 3
*/
#include "SR04.h"
SR04 sr04 = SR04(3,2);

void setup() {
   Serial.begin(9600); //串口启动
   Serial.println("Hi there!");
   delay(1000);
}

void loop() {
   int a=sr04.Distance(); //把读到的数据赋值给a
   Serial.print(a); //输出
   Serial.println("cm");
   delay(500);
}
```




### 旋转编码器
![编码器.jpg](http://upload-images.jianshu.io/upload_images/2218072-6ecc6cc10b9634c3.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**1. 简介:**

旋转，输出不同数值

**2. 接线:**
![2218072-7677f5ffe26a14dc.png](http://upload-images.jianshu.io/upload_images/2218072-1fb431c383273587.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**3. 程序:**
``` c++
//name: RotaryEncoder example
//Description:  旋转编码器例程
//IDE version:  1.6
//Author:  Lin <linyuxuanlin.github.io>
//Date:    2016-10-2
//note: 顺时针旋转数值变大；逆时针变小；按钮按下时显示

#define ENCODER_A_PIN 2
#define ENCODER_B_PIN 3
#define SWITCH_PIN    4
long position;

void setup(){
  //初始化
  pinMode(ENCODER_A_PIN, INPUT);
  pinMode(ENCODER_B_PIN, INPUT);
  pinMode(SWITCH_PIN, INPUT);

  //硬件中断
  attachInterrupt(0, read_quadrature, CHANGE);

  //初始化串口
  Serial.begin(9600);
}

void loop(){
   if (digitalRead(SWITCH_PIN) == LOW){
     delay(10);
     if (digitalRead(SWITCH_PIN) == LOW){
       Serial.println("Switch Pressed");
     }
   }
   Serial.print("Position: ");
   Serial.println(position, DEC);
   delay(500);
}

void read_quadrature(){  
  // ENA脚下降沿中断触发
  if (digitalRead(ENCODER_A_PIN) == LOW){   
    //查询ENB的电平以确认是顺时针还是逆时针旋转
    if (digitalRead(ENCODER_B_PIN) == LOW)
      position++;
  }
  // ENA脚上升沿中断触发
  else{
    //查询ENB的电平以确认是顺时针还是逆时针旋转
    if (digitalRead(ENCODER_B_PIN) == LOW)
      position--;
  }
}

```


## 未完，有时间继续填坑
