---
title: Java基础
date: 2021-04-11 18:29:50
tags: java
categories: Java学习
description: Java基础
---

## JVM内存结构

- 编译完源程序以后，生成一个或多个字节码文件。我们使用JVM中的类的加载器和解释器对生成的字节码文件进行解释运行。意味着，需要将字节码文件对应的类加载到内存中，涉及到内存解析

![img](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/img9.jpg)

- 虚拟机栈，即为平时提到的栈结构。我们将局部变量存储在栈结构中堆，我们将new出来的结构（比如：数组、对象）加载在对空间中。补充：对象的属性（非static的）加载在堆空间中。方法区：类的加载信息、常量池、静态域。

##  逻辑运算符

- &与&&的区别
  - 相同点：左边为true时，二者都会执行右边的运算；运算结果相同
  - 不同点：左边为false时，&继续执行右边的运算，&&不会执行右边的运算
- |与|| 的区别
  - 相同点：运算结果相同；左边为flase时，二者都会执行右边的运算
  - 不同点：当左边为true时，||不会执行右边的运算，|会执行右边的运算

## 变量的使用

### 变量类型

- 整型：byte（一字节=8bit）；short(2字节)；int(4字节)；long(8字节)
  - byte范围：-128--127
  - 声明long型变量时，必须以l或L结尾
- 浮点型：float(4字节)；double(8字节)
  - float表示的数值范围比long还大
  - 定义float类型的变量时，变量以f或F结尾
- 字符型：char（一字符=2字节）
- 布尔型：boolean
  - 只能取两个值true和false

### 基本数据类型变量间运算规则

- 自动类型转型：当容量小的和容量大的做运算时，结果自动提升为容量大的数据类型

  - byte/char/short-->int-->long-->float-->double   ==当byte，char，short三种做运算时，结果为int型==

- 强制类型转换

  - 需要使用（）
  - String只能做连接运算，运算结果仍为Sring类型

  ```java
  String s = 123;//编译错误
  String s1 = "123";
  int i = (int)s1;//编译错误
  ```

## 位运算符

![image-20210411184954091](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210411184954091.png)

### 面试题：能否写出最高效的2*8的实现方式？

答案：2<<3 或 8<<1

### 注意：

- 1.位运算符操作的都是整型的数据
- 2.<< 在一定范围内，每向左移一位，相当于*2
  	  
  	  
  	  
  	  
  	  
  	   >> 在一定范围内，每向右移一位，相当于/2

## Arrays工具类的使用

- Java.util包下
- 提供了很多操作数组的方法

```java
boolean equals(int[] a,int[] b)//判断两个数组是否相等
String toString(int[] a)//输出数组信息
void fill(int[]a,int val)//将指定值填充到数组之中
void sort(int[]a)//对数组就行排序
int binarySearch(int[]a,int key)//搜索数
```

## JavaBean的概念

- 类是公共的
- 一个无参的公共的构造器
- 属性，有对应的get、set方法

![image-20210412191413341](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412191413341.png)

## Java的值传递机制

### 1.针对方法内变量的赋值

- 变量是基本数据类型，此时赋值的变量所保存的数据值
- 变量是引用数据类型，此时赋值的变量所保存的数据的地址值

```Java
System.out.println("***********基本数据类型：****************");
int m = 10;
int n = m;
System.out.println("m = " + m + ", n = " + n);
n = 20;
System.out.println("m = " + m + ", n = " + n);
System.out.println("***********引用数据类型：****************");
Order o1 = new Order();
o1.orderId = 1001;
Order o2 = o1;//赋值以后，o1和o2的地址值相同，都指向了堆空间中同一个对象实体。
System.out.println("o1.orderId = " + o1.orderId + ",o2.orderId = " +o2.orderId);
o2.orderId = 1002;
System.out.println("o1.orderId = " + o1.orderId + ",o2.orderId = " +o2.orderId);
```
