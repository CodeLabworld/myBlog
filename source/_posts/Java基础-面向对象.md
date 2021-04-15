---

title: Java基础-面向对象
date: 2021-04-12 08:46:29
tags: java
categories: Java学习
description: Java面向对象
---

## 面向对象与面向过程

- 面向过程：强调的是功能行为，以函数为最小单位，考虑怎么做
- 面向对象：强调具备了功能的对象，以类/对象为最小单位，考虑谁来做

## 类与对象

- 属性=成员变量=field=域、字段
- 方法=成员方法=函数=method
- 创建类的对象=类的实例化=实例化类

### JVM内存结构

编译完源程序以后，生成一个或多个字节码文件。
我们使用JVM中的类的加载器和解释器对生成的字节码文件进行解释运行。意味着，需要将字节码文件对应的类加载到内存中，涉及到内存解析。

![image-20210412085716482](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412085716482.png)

虚拟机栈，即为平时提到的栈结构。我们将局部变量存储在栈结构中
堆，我们将new出来的结构（比如：数组、对象）加载在对空间中。补充：对象的属性（非static的）加载在堆空间中。
方法区：类的加载信息、常量池、静态域。

## 类的结构:属性

![image-20210412191158958](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412191158958.png)

### 属性vs局部变量

- 相同点：
  -   定义变量的格式：数据类型  变量名 = 变量值
  -  先声明，后使用
  -  变量都其对应的作用域 
- 不同点：
  - 在类中声明的位置的不同

     属性：直接定义在类的一对{}内

     局部变量：声明在方法内、方法形参、代码块内、构造器形参、构造器内部的变量
   - ==关于权限修饰符的不同==

      * 属性：

        可以在声明属性时，指明其权限，使用权限修饰符。

        常用的权限修饰符：private、public、缺省、protected  --->封装性

        目前，大家声明属性时，都使用缺省就可以了。
      * 局部变量：

        不可以使用权限修饰符。
   - 默认初始化值的情况==：
      * 属性：

        类的属性，根据其类型，都默认初始化值。

        整型（byte、short、int、long：0）

        浮点型（float、double：0.0）

        字符型（char：0  （或'\u0000'））

        布尔型（boolean：false）

        引用数据类型（类、数组、接口：null）
      * 局部变量：

        ==没默认初始化值==。

        意味着，我们在调用局部变量之前，一定要显式赋值。

        特别地：形参在调用时，我们赋值即可。
   - ==在内存中加载的位置==：

      * 		属性：加载到堆空间中   （非static）
      * 		局部变量：加载到栈空间

  ![image-20210412191114929](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412191114929.png)

## 类的结构：方法

### 重写和重载的区别

![image-20210412091208828](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412091208828.png)

## 面向对象的特性（封装、继承、多态）

### 封装性

- 体现
  - 将类的属性xxx私化(private),同时，提供公共的(public)方法来获取(getXxx)和设置(setXxx)此属性的值
  - 不对外暴露的私有的方法
  - 单例模式（将构造器私有化）
  - 如果不希望类在包外被调用，可以将类设置为缺省的。
- 权限从小到大顺序为：private <  缺省 < protected < public

![image-20210412091757155](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412091757155.png)

### 构造器

- 如果没显式的定义类的构造器的话，则系统默认提供一个空参的构造器

 * 定义构造器的格式：权限修饰符  类名(形参列表){}
 * 一个类中定义的多个构造器，彼此构成重载
 * 一旦我们显式的定义了类的构造器之后，系统就不再提供默认的空参构造器
 * ==一个类中，至少会有一个构造器==。

### this关键字

#### this：当前对象  或 当前正在创建的对象

#### 可以调用的结构：属性、方法；构造器



### JDK中的主要包介绍：



![image-20210412092356775](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412092356775.png)



### import的使用

* 1. 在源文件中显式的使用import结构导入指定包下的类、接口
 * 2. 声明在包的声明和类的声明之间
 * 3. 如果需要导入多个结构，则并列写出即可
 * 4. 可以使用"xxx.*"的方式，表示可以导入xxx包下的所结构
 * 5. 如果使用的类或接口是java.lang包下定义的，则可以省略import结构
 * 6. 如果使用的类或接口是本包下定义的，则可以省略import结构
 * 7. 如果在源文件中，使用了不同包下的同名的类，则必须至少一个类需要以全类名的方式显示。
 * 8. 使用"xxx.*"方式表明可以调用xxx包下的所结构。但是如果使用的是xxx子包下的结构，则仍需要显式导入
 * 9. import static:导入指定类或接口中的静态结构:属性或方法。 

### 继承性

#### 作用：

- ① 减少了代码的冗余，提高了代码的复用性

 * ② 便于功能的扩展
 * ③ 为之后多态性的使用，提供了前提

#### 格式：

class A extends B{}
 *    A:子类、派生类、subclass
 *    B:父类、超类、基类、superclass

#### 子类继承父类以后有哪些不同？

体现：一旦子类A继承父类B以后，子类A中就获取了父类B中声明的所有的属性和方法。

- 特别的，父类中声明为private的属性或方法，子类继承父类以后，仍然认为获取了父类中私的结构。只因为封装性的影响，使得子类不能直接调用父类的结构而已。

子类继承父类以后，还可以声明自己特有的属性或方法：实现功能的拓展。

 *    子类和父类的关系，不同于子集和集合的关系。
 *    extends：延展、扩展
 *    子类继承父类以后，可以对父类中的方法重写，重写后执行重写后的方法

#### Java中继承性的说明

- 1.一个类可以被多个子类继承。
- 2.Java中类的单继承性：一个类只能有一个父类
- 3.子父类是相对的概念。
- 4.子类直接继承的父类，称为：直接父类。间接继承的父类称为：间接父类
- 5.子类继承父类以后，就获取了直接父类以及所间接父类中声明的属性和方法

#### java.lang.Object类的理解

- 1.如果我们没显式的声明一个类的父类的话，则此类继承于java.lang.Object类
- 2.所的java类（除java.lang.Object类之外都直接或间接的继承于java.lang.Object类
- 3.意味着，所的java类具有java.lang.Object类声明的功能。

### super关键字

#### 理解：父类的

#### 可以调用的结构：方法，构造器，属性

#### super调用属性、方法：

- 1 我们可以在子类的方法或构造器中。通过使用"super.属性"或"super.方法"的方式，显式的调用父类中声明的属性或方法。但是，通常情况下，我们习惯省略"super."
- 2 特殊情况：当子类和父类中定义了同名的属性时，我们要想在子类中调用父类中声明的属性，则必须显式的使用"super.属性"的方式，表明调用的是父类中声明的属性。
- 3 特殊情况：当子类重写了父类中的方法以后，我们想在子类的方法中调用父类中被重写的方法时，则必须显式的使用"super.方法"的方式，表明调用的是父类中被重写的方法。

### 多态性

#### 理解：一个事物的多种形态

```java
public class Test {
    public void method(Person e) {
        // ……
        e.getInfo();
    }
    public static void main(Stirng args[]) {
        Test t = new Test();
        Student m = new Student();
        t.method(m); // 子类的对象m传送给父类类型的参数e
    }
}
```



#### 对象的多态性：父类的引用指向子类的对象（子类的对象赋给父类的引用）

- 例

  ```java
  Person p = new Man();
  Object obj = new Date();
  Person p = new Student();
  Object o = new Person();//Object类型的变量o，指向Person类型的对象
  o = new Student(); //Object类型的变量o，指向Student类型的对象
  //子类可看做是特殊的父类，所以父类类型的引用可以指向子类的对象：向上转型(upcasting)。
  ```

#### 多态性的使用：虚拟方法调用

> 有了对象的多态性以后，我们在编译期，只能调用父类中声明的方法，但在运行期，我们实际执行的是子类重写父类的方法。
>
> 子类中定义了与父类同名同参数的方法，在多态情况下，将此时父类的方法称为虚拟方法，父 类根据赋给它的不同子类对象，动态调用属于子类的该方法。这样的方法调用在编译期是无法 确定的。
>
> ==总结：编译，看左边；运行，看右边==
>
> ==“看左边”== ：看的是父类的引用（父类中不具备子类特有的方法） 
>
> ==“看右边”== ：看的是子类的对象（实际运行的是子类重写父类的方法）

#### 多态性的使用前提：

- 类的继承关系  
-  方法的重写

```java
//一个引用类型变量如果声明为父类的类型，但实际引用的是子类对象，那么该变量就不能再访问子类中添加的属性和方法
Student m = new Student();
m.school = “pku”; //合法,Student类有school成员变量
Person e = new Student(); 
e.school = “pku”; //非法,Person类没有school成员变量
//属性是在编译时确定的，编译时e为Person类型，没有school成员变量，因而编译错误
```

#### 重载和多态

从编译和运行的角度看：

- 重载，是指允许存在多个同名方法，而这些方法的参数不同。编译器根据方法不 同的参数表，对同名方法的名称做修饰。对于编译器而言，这些同名方法就成了 不同的方法。它们的调用地址在编译期就绑定了。Java的重载是可以包括父类 和子类的，即子类可以重载父类的同名不同参数的方法。 所以：对于重载而言，在方法调用之前，编译器就已经确定了所要调用的方法， 这称为“早绑定”或“静态绑定”； 
- 对于多态，只有等到方法调用的那一刻，解释运行器才会确定所要调用的具体 方法，这称为“晚绑定”或“动态绑定”。

#### 多态小节

- 多态作用： 提高了代码的通用性，常称作接口重用 
- 前提：
  - 需要存在继承或者实现关系 
  - 有方法的重写 
- 成员方法： 
  - 编译时：要查看引用变量所声明的类中是否有所调用的方法。
  -  运行时：调用实际new的对象所属的类中的重写方法。
- 成员变量：不具备多态性，只看引用变量所声明的类。

#### instanceof操作符

x instanceof A：检验x是否为类A的对象，返回值为boolean型。 

要求x所属的类与类A必须是子类和父类的关系，否则编译错误。

如果x属于类A的子类B，x instanceof A值也为true。

```java
public class Person extends Object {…}
public class Student extends Person {…}
public class Graduate extends Person {…}
-------------------------------------------------------------------
public void method1(Person e) {
if (e instanceof Person) 
// 处理Person类及其子类对象
if (e instanceof Student) 
//处理Student类及其子类对象
if (e instanceof Graduate)
//处理Graduate类及其子类对象
}
```

#### 对象类型转换

对Java对象的强制类型转换称为造型 

- 从子类到父类的类型转换可以自动进行 
- 从父类到子类的类型转换必须通过造型(强制类型转换)实现
- 无继承关系的引用类型间的转换是非法的
- 在造型前可以使用instanceof操作符测试一个对象的类型

```java
public class ConversionTest {
    public static void main(String[] args) {
        double d = 13.4;
        long l = (long) d;
        System.out.println(l);
        int in = 5;
        // boolean b = (boolean)in;
        Object obj = "Hello";
        String objStr = (String) obj;
        System.out.println(objStr);
        Object objPri = new Integer(5);
        // 所以下面代码运行时引发ClassCastException异常
        String str = (String) objPri;
    }
}

```

```java
public class Test {
    public void method(Person e) { // 设Person类中没有getschool() 方法
        // System.out.pritnln(e.getschool()); //非法,编译时错误
        if (e instanceof Student) {
        Student me = (Student) e; // 将e强制转换为Student类型
        System.out.pritnln(me.getschool());
        }
    }
    public static void main(String[] args){
        Test t = new Test();
        Student m = new Student();
        t.method(m);
    }
}
```

![image-20210412195922174](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412195922174.png)

#### 面试题

##### 多态是编译时行为还是运行时行为？

==多态是运行时行为==

```java
package com.codediao.java5;

import java.util.Random;

//面试题：多态是编译时行为还是运行时行为？ 答:运行时行为

//证明如下：
class Animal {

	protected void eat() {
		System.out.println("animal eat food");
	}
}

class Cat extends Animal {

	protected void eat() {
		System.out.println("cat eat fish");
	}
}

class Dog extends Animal {

	public void eat() {
		System.out.println("Dog eat bone");

	}

}

class Sheep extends Animal {

	public void eat() {
		System.out.println("Sheep eat grass");

	}

}

public class InterviewTest {

	public static Animal getInstance(int key) {
		switch (key) {
		case 0:
			return new Cat();
		case 1:
			return new Dog();
		default:
			return new Sheep();
		}

	}

	public static void main(String[] args) {
		int key = new Random().nextInt(3); // 随机数

		System.out.println(key);

		Animal animal = getInstance(key);// 看不出来结果，是运行时行为，只有运行的时候才知道new的是谁
		animal.eat();

	}

}

```

## Object类的使用

#### 类是所有Java类的根父类

#### Object类中的主要结构

![image-20210412201138928](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412201138928.png)

#### ==操作符与equals方法

#####   ==：

- 基本类型比较值:只要两个变量的值相等，即为true。 int a=5; if(a==6){…}
- 引用类型比较引用(是否指向同一个对象)：只有指向同一个对象时，==才 返回true。
- 用“==”进行比较时，符号两边的数据类型必须兼容(可自动转换的基本 数据类型除外)，否则编译出错

#####   equals方法：

- equals()：所有类都继承了Object，也就获得了equals()方法。还可以重写。
  - 只能比较引用类型，其作用与“==”相同,比较是否指向同一个对象。 
  - 格式:obj1.equals(obj2)
- **特例**：当用equals()方法进行比较时，对类File、String、Date及包装类 （Wrapper Class）来说，是比较类型及内容而不考虑引用的是否是同一个对 象；<u>原因：在这些类中重写了Object类的equals()方法。</u>
- 当自定义使用equals()时，可以重写。用于比较两个对象的“内容”是否都 相等

#####  重写equals()方法的原则

- 对称性：如果x.equals(y)返回是“true” ，那么y.equals(x)也应该返回是 “true”。
- 自反性：x.equals(x)必须返回是“true”。
- 传递性：如果x.equals(y)返回是“true” ，而且y.equals(z)返回是“true” ， 那么z.equals(x)也应该返回是“true”。
- 一致性：如果x.equals(y)返回是“true” ，只要x和y内容一直不变，不管你 重复x.equals(y)多少次，返回都是“true”。
- 任何情况下，x.equals(null)，永远返回是“false” ； x.equals(和x不同类型的对象)永远返回是“false”。

##### 面试题：==和equals的区别

- == 既可以比较基本类型也可以比较引用类型。对于基本类型就是比较值，对于引用类型 就是比较内存地址 
- equals的话，它是属于java.lang.Object类里面的方法，如果该方法没有被重写过默认也 是==;我们可以看到String等类的equals方法是被重写过的，而且String类在日常开发中 用的比较多，久而久之，形成了equals是比较值的错误观点。
- 具体要看自定义类里有没有重写Object的equals方法来判断。
- 通常情况下，重写equals方法，会比较类中的相应属性是否都相等。

##### Object类的使用

```java
int it = 65;
float fl = 65.0f;
System.out.println(“65和65.0f是否相等？” + (it == fl)); //true
char ch1 = 'A'; char ch2 = 12;
System.out.println("65和'A'是否相等？" + (it == ch1));//true
System.out.println(“12和ch2是否相等？" + (12 == ch2));//true
String str1 = new String("hello");
String str2 = new String("hello");
System.out.println("str1和str2是否相等？"+ (str1 == str2));//false
System.out.println("str1是否equals str2？"+(str1.equals(str2)));//true
System.out.println(“hello” == new java.util.Date()); //编译不通过
```

##### 面试题：

```java
public class mytest {
    public static void main(String[] args) {
    char[] arr = new char[] { 'a', 'b', 'c' };
    System.out.println(arr);//abc
    int[] arr1 = new int[] { 1, 2, 3 };
    System.out.println(arr1);//[I@7852e922
    double[] arr2 = new double[] { 1.1, 2.2, 3.3 };
    System.out.println(arr2);//[D@4e25154f
    }
}
```



## 包装类

#### 包装类的使用

![image-20210412204040805](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412204040805.png)

- 基本数据类型包装成包装类的实例 ---装箱
  - 通过包装类的构造器实现： int i = 500; Integer t = new Integer(i);
  - 还可以通过字符串参数构造包装类对象： Float f = new Float(“4.56”); Long l = new Long(“asdf”); //NumberFormatException
- 获得包装类对象中包装的基本类型变量 ---拆箱 
  -  调用包装类的.xxxValue()方法： boolean b = bObj.booleanValue(); 
-  JDK1.5之后，支持自动装箱，自动拆箱。但类型必须匹配。
- 字符串转换成基本数据类型 
  -  通过包装类的构造器实现： int i = new Integer(“12”); 
  -  通过包装类的parseXxx(String s)静态方法： Float f = Float.parseFloat(“12.1”);
- 基本数据类型转换成字符串 
  - 调用字符串重载的valueOf()方法： String fstr = String.valueOf(2.34f); 
  -  更直接的方式： String intStr = 5 + “”

##### 总结

![image-20210412204427718](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210412204427718.png)

#### 包装类用法举例

```java
int i = 500;
Integer t = new Integer(i);
//装箱：包装类使得一个基本数据类型的数据变成了类。
//有了类的特点，可以调用类中的方法。
String s = t.toString(); // s = “500“,t是类，有toString方法
String s1 = Integer.toString(314); // s1= “314“ 将数字转换成字符串。
String s2=“4.56”;
double ds=Double.parseDouble(s2); //将字符串转换成数字

//拆箱：将数字包装类中内容变为基本数据类型。
int j = t.intValue(); // j = 500，intValue取出包装类中的数据
//包装类在实际开发中用的最多的在于字符串变为基本数据类型。
String str1 = "30" ;
String str2 = "30.3" ;
int x = Integer.parseInt(str1) ; // 将字符串变为int型
float f = Float.parseFloat(str2) ; // 将字符串变为int型
```

#### 面试题

```java
public class mytest {
    public static void main(String[] args) {
        //三元运算符“:”两边类型需要相同，因此此处有一个强制类型转换
        Object o1 = true ? new Integer(1) : new Double(2.0);
        System.out.println(o1);//1.0
        Object o2;
        if (true)
            o2 = new Integer(1);
        else
            o2 = new Double(2.0);
        System.out.println(o2);//1
    }
}
```

```java
public class mytest {
    public static void main(String[] args) {
        Integer i = new Integer(1);
        Integer j = new Integer(1);
        System.out.println(i == j);//false
        Integer m = 1;
        Integer n = 1;
        //Integer类中有一个缓存数组（-128——127）这个范围的数用得多，里面有就不需要重复new，所以地址相同
        System.out.println(m == n);//true
        Integer x = 128;
        Integer y = 128;
        //128缓存中没有需要new
        System.out.println(x == y);//false
    }
}
```

## static关键字

