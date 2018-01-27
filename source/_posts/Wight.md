---
title: Wight-基于云平台的去线缆化照明系统
date: 2017-07-17 12:47:42
tags: [3D打印,Arduino,C++,教程,作品]
categories: 科技
comments: true
photo:
- http://upload-images.jianshu.io/upload_images/2218072-45113d2e545128b6.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240

---


这是在hack.init()中做出来的
撸代码、3D建模、调试各种乱七八糟的bug、等待打印、展示&演讲，花了20多个小时
欲了解更多，请展开下文~
<!-- more -->


## 简介
![...](http://upload-images.jianshu.io/upload_images/2218072-d2fc5f0f59bc3735.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
简单介绍一下，这个项目主要是用于乡村偏远地区的路灯照明系统
模型有点抽象，有人说它像火箭，但其实它是一杆路灯。。。

## 项目的创新点：
* 太阳能供电。自给自足（经查阅详细资料，太阳能发电量足以点亮LED）
* 去线缆化。为偏远山区不方便铺线缆提供便利
* 智能算法。检测到夜晚，自动开灯；检测到人或车辆经过，提高LED亮度
* 云平台统一控制。用的是GSM主控，可以批量远程调试
* 拓展性。对个别有自定义照明需求的特殊用户提供各种自定义的功能

## 代码
基于intorobot的云平台，已开源：[**代码**](https://github.com/linyuxuanlin/Wight/tree/master/%E4%BB%A3%E7%A0%81)

```cpp
#define BUTTONS_address   "channel/widget4_0/cmd/control" //开关命令
#define LIGHT_STATUS_address  "channel/widget4_0/data/light"//开关状态
#define ITENSITY_DATA_address "channel/widget4_0/data/lightsensor"
#define LEDPIN1    D1    //定义灯泡控制引脚
#define LEDPIN2    D2
#define LEDPIN3    D3
#define LEDPIN4    D5
#define CHECKIN1   A0
#define CHECKIN2   D4


int autostate = 2;
int light_state = 2;
void buttons_function(uint8_t *payload, uint32_t len)//自动&浇水按钮
{
	uint8_t SwitchKey;
	uint8_t SwitchKey2;
	aJsonClass aJson;
	aJsonObject *root = aJson.parse((char *)payload);
	if(root == NULL)
	{
		aJson.deleteItem(root);
		return;
	}
	aJsonObject *_switch = aJson.getObjectItem(root, "mode");
	if(_switch != NULL)
	{
		SwitchKey = atoi(_switch->valuestring);
		if(SwitchKey)
		{
			SerialUSB.println("auto on");
			autostate=1;
			 IntoRobot.publish(LIGHT_STATUS_address,"1");
		}
		else
		{
			SerialUSB.println("auto off");
			autostate=0;
			 IntoRobot.publish(LIGHT_STATUS_address,"0");
		}
	}
	aJsonObject *_switch2 = aJson.getObjectItem(root, "manual");
	if(_switch2 != NULL)
	{
		SwitchKey2 = atoi(_switch2->valuestring);
		if(SwitchKey2)
		{
			SerialUSB.println("manual on");
			light_state=1;
			 IntoRobot.publish(LIGHT_STATUS_address,"1");
		}
		else
		{
			SerialUSB.println("manual off");
			light_state=0;
			 IntoRobot.publish(LIGHT_STATUS_address,"0");
		}
	}
	else
	{
	}
	aJson.deleteItem(root);
}
void lightup()
{
	digitalWrite(LEDPIN1, HIGH);	// 打开灯泡
	digitalWrite(LEDPIN2, HIGH);	// 打开灯泡
	digitalWrite(LEDPIN3, HIGH);	// 打开灯泡
	digitalWrite(LEDPIN4, HIGH);	// 打开灯泡

}
void light_half_up()
{
	analogWrite(LEDPIN1, 80);	// 打开灯泡
	analogWrite(LEDPIN2, 80);	// 打开灯泡
	analogWrite(LEDPIN3, 80);	// 打开灯泡
	analogWrite(LEDPIN4, 80);	// 打开灯泡

}
void lightdown()
{
	digitalWrite(LEDPIN1, LOW);
	digitalWrite(LEDPIN2, LOW);
	digitalWrite(LEDPIN3, LOW);
	digitalWrite(LEDPIN4, LOW);

}
int getlight()
{
	int k  = analogRead(CHECKIN1);

	SerialUSB.println(k);
	return k;
}
int get_IR_data()
{
	int b = digitalRead(CHECKIN2);
	SerialUSB.println(b);
	return b;
}
void automode()
{
	if(getlight()>=400)
	{
	    IntoRobot.publish(LIGHT_STATUS_address,"1");
		if (get_IR_data()==0)
		lightup();
		else
		light_half_up();
	}
	else
	{
	IntoRobot.publish(LIGHT_STATUS_address,"0");
	lightdown();
	}
}

void HUMIDITY_print_function(uint8_t *payload, uint32_t len)
{


}

// IntoRobot.publish(LIGHT_STATUS_address,"1");
// IntoRobot.publish(LIGHT_STATUS_address,"0");
void setup()
{
    pinMode(D4,INPUT);
	SerialUSB.begin(115200);
	SerialUSB.println("hello world");
	pinMode(LEDPIN1, OUTPUT);	//初始化
	pinMode(LEDPIN2, OUTPUT);	//初始化
	pinMode(LEDPIN3, OUTPUT);	//初始化
	pinMode(LEDPIN4, OUTPUT);	//初始化
	//设备接收云平台的灯开关命令
	IntoRobot.subscribe(BUTTONS_address,NULL,buttons_function);
	IntoRobot.subscribe(ITENSITY_DATA_address,NULL,HUMIDITY_print_function);
}
void loop()
{
   int a =map(getlight() ,0,1024,100,0);
   IntoRobot.publish(LIGHT,a);
    SerialUSB.println(getlight());
	if(autostate==0)
	{
		if(light_state ==1)
		lightup();
		else
		lightdown();  
	}
	else if (autostate==1)
	{
		SerialUSB.println("state=1");
		automode();
	}
	delay(100);
}

```


## 模型
用的是123D建模。
tips：熟悉快捷键的话，建模速度会很快~
因为现场时间不够，随便画了一个
总的模型分底座，顶部和中间的部分
然后打印出来
[**模型下载**](https://github.com/linyuxuanlin/Wight/tree/master/3D%E6%A8%A1%E5%9E%8B)

![屏幕快照 2017-07-17 下午5.00.16 (2).png](http://upload-images.jianshu.io/upload_images/2218072-c2cb025a94089a51.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
