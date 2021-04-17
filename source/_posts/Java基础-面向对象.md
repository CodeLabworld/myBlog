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

### 使用范围

- 在Java类中，可用static修饰属性、方法、代码块、内部类 
-  被修饰后的成员具备以下特点： 
  - 随着类的加载而加载 
  - 优先于对象存在 
  - 修饰的成员，被所有对象所共享 
  - 访问权限允许时，可不创建对象，直接被类调用

### static修饰属性：静态变量（或类变量）

#### 属性，是否使用static修饰，又分为：静态属性  vs 非静态属性(实例变量)

- 实例变量：我们创建了类的多个对象，每个对象都独立的拥一套类中的非静态属性。当修改其中一个对象中的非静态属性时，不会导致其他对象中同样的属性值的修改。

- 静态变量：我们创建了类的多个对象，多个对象共享同一个静态变量。当通过某一个对象修改静态变量时，会导致其他对象调用此静态变量时，是修改过了的。

#### static修饰属性的其他说明：

- 静态变量随着类的加载而加载。可以通过"类.静态变量"的方式进行调用

- 静态变量的加载要早于对象的创建。

- 由于类只会加载一次，则静态变量在内存中也只会存在一份：存在方法区的静态域中。



- ​          类变量	实例变量

- 类		yes		no

- 对象	yes		yes

#### 静态属性举例：System.out; Math.PI;

#### static修饰方法：静态方法、类方法

- 随着类的加载而加载，可以通过"类.静态方法"的方式进行调用
- ​           静态方法	非静态方法

 *          类		    yes		no
 *          对象		yes		yes
 *          静态方法中，只能调用静态的方法或属性
 *          非静态方法中，既可以调用非静态的方法或属性，也可以调用静态的方法或属性

#### static的注意点：

- 在静态的方法内，不能使用this关键字、super关键字
- 关于静态属性和静态方法的使用，大家都从生命周期的角度去理解。

#### 如何判定属性和方法应该使用static关键字：

- 关于属性

> 属性是可以被多个对象所共享的，不会随着对象的不同而不同的。
> 类中的常量也常常声明为static

- 关于方法

> 操作静态属性的方法，通常设置为static的
> 工具类中的方法，习惯上声明为static的。 比如：Math、Arrays、Collections

### 类变量 vs 实例变量内存解析

 类变量（类属性）由该类的所有实例共享

![image-20210415202758153](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415202758153.png)

### 静态变量的内存解析

![image-20210415202820474](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415202820474.png)

### 单例 (Singleton)设计模式

- 设计模式是在大量的实践中总结和理论化之后优选的代码结构、编程风格、 以及解决问题的思考方式。设计模免去我们自己再思考和摸索。就像是经典 的棋谱，不同的棋局，我们用不同的棋谱。”套路” 

- 所谓类的单例设计模式，就是采取一定的方法保证在整个的软件系统中，对 某个类只能存在一个对象实例，并且该类只提供一个取得其对象实例的方法。 如果我们要让类在一个虚拟机中只能产生一个对象，我们首先必须将类的构 造器的访问权限设置为private，这样，就不能用new操作符在类的外部产生 类的对象了，但在类内部仍可以产生该类的对象。因为在类的外部开始还无 法得到类的对象，只能调用该类的某个静态方法以返回类内部创建的对象， 静态方法只能访问类中的静态成员变量，所以，指向类内部产生的该类对象 的变量也必须定义成静态的。

#### 单例(Singleton)设计模式-饿汉式

```java
class Singleton {
    // 1.私有化构造器
    private Singleton() {
    }
    // 2.内部提供一个当前类的实例
    // 4.此实例也必须静态化
    private static Singleton single = new Singleton();
    // 3.提供公共的静态的方法，返回当前类的对象
    public static Singleton getInstance() {
        return single;
    }
}
```

#### 单例(Singleton)设计模式-懒汉式

```java
class Singleton {
    // 1.私有化构造器
    private Singleton() {
    }
    // 2.内部提供一个当前类的实例
    // 4.此实例也必须静态化
    private static Singleton single;
    // 3.提供公共的静态的方法，返回当前类的对象
    public static Singleton getInstance() {
        if(single == null) {
            single = new Singleton();
        }
        return single;
    }
}
```

![image-20210415203410826](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415203410826.png)

#### 单例模式的优点

由于单例模式只生成一个实例，减少了系统性能开销，当一个对象的 产生需要比较多的资源时，如读取配置、产生其他依赖对象时，则可 以通过在应用启动时直接产生一个单例对象，然后永久驻留内存的方 式来解决。

#### 举例 java.lang.Runtime

![image-20210415203616995](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415203616995.png)

#### 单例(Singleton)设计模式-应用场景

- 网站的计数器，一般也是单例模式实现，否则难以同步。 
-  应用程序的日志应用，一般都使用单例模式实现，这一般是由于共享的日志 文件一直处于打开状态，因为只能有一个实例去操作，否则内容不好追加。 
-  数据库连接池的设计一般也是采用单例模式，因为数据库连接是一种数据库 资源。 
-  项目中，读取配置文件的类，一般也只有一个对象。没有必要每次使用配置 文件数据，都生成一个对象去读取。 
-  Application 也是单例的典型应用 
-  Windows的Task Manager (任务管理器)就是很典型的单例模式 
-  Windows的Recycle Bin (回收站)也是典型的单例应用。在整个系统运行过程 中，回收站一直维护着仅有的一个实例。

## 理解main方法的语法

由于Java虚拟机需要调用类的main()方法，所以该方法的访问权限必须是 public，又因为Java虚拟机在执行main()方法时不必创建对象，所以该方法必须 是static的，该方法接收一个String类型的数组参数，该数组中保存执行Java命令 时传递给所运行的类的参数。 

又因为main() 方法是静态的，我们不能直接访问该类中的非静态成员，必须创 建该类的一个实例对象后，才能通过这个对象去访问类中的非静态成员，这种情 况，我们在之前的例子中多次碰到。

### 【面试题】

```java
//此处，Something类的文件名叫OtherThing.java
class Something {
    public static void main(String[] something_to_do) { 
        System.out.println("Do something ...");
    }
}
//上述程序是否可以正常编译、运行？

```

## 模板方法的设计模式

### 解决的问题

在软件开发中实现一个算法时，整体步骤很固定、通用，这些步骤已经在父类中写好了。但是某些部分易变，易变部分可以抽象出来，供不同子类实现。这就是一种模板模式。

###  举例

```java
abstract class Template{
	
	//计算某段代码执行所需要花费的时间
	public void spendTime(){
		
		long start = System.currentTimeMillis();
		
		this.code();//不确定的部分、易变的部分
		
		long end = System.currentTimeMillis();
		
		System.out.println("花费的时间为：" + (end - start));
		
	}
	
	public abstract void code();
	
}

class SubTemplate extends Template{

	@Override
	public void code() {
		
		for(int i = 2;i <= 1000;i++){
			boolean isFlag = true;
			for(int j = 2;j <= Math.sqrt(i);j++){
				
				if(i % j == 0){
					isFlag = false;
					break;
				}
			}
			if(isFlag){
				System.out.println(i);
			}
		}

	}
	
}

```

### 应用场景

![image-20210415205119355](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415205119355.png)

## 代理模式

### 解决的问题

代理模式是Java开发中使用较多的一种设计模式。代理设计就是为其他对象提供一种代理以控制对这个对象的访问。 

### 举例

```java
interface NetWork{
	
	public void browse();
	
}

//被代理类
class Server implements NetWork{

	@Override
	public void browse() {
		System.out.println("真实的服务器访问网络");
	}

}
//代理类
class ProxyServer implements NetWork{
	
	private NetWork work;
	
	public ProxyServer(NetWork work){
		this.work = work;
	}
	

	public void check(){
		System.out.println("联网之前的检查工作");
	}
	
	@Override
	public void browse() {
		check();
		
		work.browse();
		
	}
	
}
```

### 应用场景

![image-20210415205339160](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415205339160.png)

## 代码块

### 代码块(或初始化块)的作用

 对Java类或对象进行初始化

### 代码块(或初始化块)的分类

一个类中代码块若有修饰符，则只能被static修饰，称为静态代码块 (static block)，没有使用static修饰的，为非静态代码块。

### static代码块通常用于初始化static的属性

### 静态代码块：用static 修饰的代码块

- 可以有输出语句。 
-  可以对类的属性、类的声明进行初始化操作。 
- 不可以对非静态的属性初始化。即：不可以调用非静态的属性和方法。 
- 若有多个静态的代码块，那么按照从上到下的顺序依次执行。 
-  静态代码块的执行要先于非静态代码块。 
-  静态代码块随着类的加载而加载，且只执行一次。

```java
class Person {
    public static int total;
    static {
        total = 100;
        System.out.println("in static block!");
    }
}
public class PersonTest {
    public static void main(String[] args) {
        System.out.println("total = " + Person.total);
        System.out.println("total = " + Person.total);
    }
}
```

![image-20210415205836449](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415205836449.png)

### 非静态代码块：没有static修饰的代码块

- 可以有输出语句。 
-  可以对类的属性、类的声明进行初始化操作。 
-  除了调用非静态的结构外，还可以调用静态的变量或方法。 
-  若有多个非静态的代码块，那么按照从上到下的顺序依次执行。 
-  每次创建对象的时候，都会执行一次。且先于构造器执行。

### 属性的赋值顺序

- ①默认初始化

 * ②显式初始化/⑤在代码块中赋值
 * ③构造器中初始化
 * ④有了对象以后，可以通过"对象.属性"或"对象.方法"的方式，进行赋值
 * 执行的先后顺序：① - ② / ⑤ - ③ - ④

![image-20210415205952014](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415205952014.png)

## 关键字：final

在Java中声明类、变量和方法时，可使用关键字final来修饰,表示“最终的”。

- final标记的类不能被继承。提高安全性，提高程序的可读性。 
- String类、System类、StringBuffer类 
- final标记的方法不能被子类重写。 
- 比如：Object类中的getClass()。 
- final标记的变量(成员变量或局部变量)即称为常量。名称大写，且只 能被赋值一次。 
- final标记的成员变量必须在声明时或在每个构造器中或代码块中显式赋 值，然后才能使用
- final double MY_PI = 3.14;

## 抽象类与抽象方法

### 定义

随着继承层次中一个个新子类的定义，类变得越来越具体，而父类则更一 般，更通用。类的设计应该保证父类和子类能够共享特征。有时将一个父 类设计得非常抽象，以至于它没有具体的实例，这样的类叫做抽象类。

![image-20210415210257773](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415210257773.png)

- 用abstract关键字来修饰一个类，这个类叫做抽象类。 
-  用abstract来修饰一个方法，该方法叫做抽象方法。 
- 抽象方法：只有方法的声明，没有方法的实现。以分号结束： 比如：public abstract void talk(); 
- 含有抽象方法的类必须被声明为抽象类。 
- 抽象类不能被实例化。抽象类是用来被继承的，抽象类的子类必须重 写父类的抽象方法，并提供方法体。若没有重写全部的抽象方法，仍 为抽象类。 
- 不能用abstract修饰变量、代码块、构造器； 
- 不能用abstract修饰私有方法、静态方法、final的方法、final的类。

### abstract修饰类：抽象类

- 此类不能实例化

 *      抽象类中一定有构造器，便于子类实例化时调用（涉及：子类对象实例化的全过程）
 *      开发中，都会提供抽象类的子类，让子类对象实例化，完成相关的操作 --->抽象的使用前提：继承性

### abstract修饰方法：抽象方法

- 抽象方法只方法的声明，没方法体

- 包含抽象方法的类，一定是一个抽象类。反之，抽象类中可以没有抽象方法的。

- 若子类重写了父类中的所的抽象方法后，此子类方可实例化

- 若子类没重写父类中的所的抽象方法，则此子类也是一个抽象类，需要使用abstract修饰

### 注意点

- abstract不能用来修饰：属性、构造器等结构
- abstract不能用来修饰私方法、静态方法、final的方法、final的类

```java
abstract class  A {
    abstract void m1();
    public void m2() {
        System.out.println("A类中定义的m2方法");
    }
}
class B extends A {
    void m1() {
        System.out.println("B类中定义的m1方法");
    }
}
public class Test {
    public static void main(String args[]) {
        A a = new B();
        a.m1();
        a.m2();
    }
}
```

### 抽象类应用

![image-20210415210627732](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415210627732.png)

![image-20210415210647644](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415210647644.png)

### 举例二：

```java
abstract class GeometricObject{
    public abstract double findArea();
}
class Circle extends GeometricObject{
    private double radius;
    public double findArea(){
        return 3.14 * radius * radius;
    };
}
```

### 举例三：

IO流中设计到的抽象类：InputStream/OutputStream / Reader /Writer。在其内部
定义了抽象的read()、write()方法。

## interface:接口

### 使用说明：

#### 接口使用interface来定义

#### Java中，接口和类是并列的两个结构

#### 如何定义接口：定义接口中的成员

 * JDK7及以前：只能定义全局常量和抽象方法
    * 			全局常量：public static final的.但是书写时，可以省略不写
    * 			抽象方法：public abstract的
 * 		 JDK8：除了定义全局常量和抽象方法之外，还可以定义静态方法、默认方法（略

#### 接口中不能定义构造器的！意味着接口不可以实例化

#### Java开发中，接口通过让类去实现(implements)的方式来使用.

 * 如果实现类覆盖了接口中的所抽象方法，则此实现类就可以实例化
 * 如果实现类没覆盖接口中所的抽象方法，则此实现类仍为一个抽象类

#### Java类可以实现多个接口   --->弥补了Java单继承性的局限性

 * 格式：class AA extends BB implements CC,DD,EE

#### 接口与接口之间可以继承，而且可以多继承

#### 接口的具体使用，体现多态性

#### 接口，实际上可以看做是一种规范

### 举例

```java
class Computer{
	
	public void transferData(USB usb){//USB usb = new Flash();
		usb.start();
		
		System.out.println("具体传输数据的细节");
		
		usb.stop();
	}
	
	
}

interface USB{
	//常量：定义了长、宽、最大最小的传输速度等
	
	void start();
	
	void stop();
	
}

class Flash implements USB{

	@Override
	public void start() {
		System.out.println("U盘开启工作");
	}

	@Override
	public void stop() {
		System.out.println("U盘结束工作");
	}
	
}

class Printer implements USB{
	@Override
	public void start() {
		System.out.println("打印机开启工作");
	}

	@Override
	public void stop() {
		System.out.println("打印机结束工作");
	}
	
}
//体会：
 // 1.接口使用上也满足多态性
 // 2.接口，实际上就是定义了一种规范
 // 3.开发中，体会面向接口编程！
```

### 体会面向接口编程的思想

![image-20210415211555575](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415211555575.png)

面向接口编程：我们在应用程序中，调用的结构都是JDBC中定义的接口，不会出现具体某一个
数据库厂商的API。

### Java8中关于接口的新规范

- 知识点1：接口中定义的静态方法，只能通过接口来调用。

- 知识点2：通过实现类的对象，可以调用接口中的默认方法。
  //如果实现类重写了接口中的默认方法，调用时，仍然调用的是重写以后的方法

- 知识点3：如果子类(或实现类)继承的父类和实现的接口中声明了同名同参数的默认方法，那么子类在没重写此方法的情况下，默认调用的是父类中的同名同参数的方法。-->类优先原则
- 知识点4：如果实现类实现了多个接口，而这多个接口中定义了同名同参数的默认方法，
  //那么在实现类没重写此方法的情况下，报错。-->接口冲突。
  //这就需要我们必须在实现类中重写此方法
- 知识点5：如何在子类(或实现类)的方法中调用父类、接口中被重写的方法

```java
public void myMethod(){
    method3();//调用自己定义的重写的方法
    super.method3();//调用的是父类中声明的
    //调用接口中的默认方法
    CompareA.super.method3();
    CompareB.super.method3();
}
```

### 接口和抽象类之间的对比

![image-20210415211918677](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210415211918677.png)

### 面试题：

抽象类和接口的异同？
相同点：不能实例化；都可以包含抽象方法的。
不同点：
1）把抽象类和接口(java7,java8,java9)的定义、内部结构解释说明
2）类：单继承性    接口：多继承
   类与接口：多实现

## 内部类

### 定义

在Java中，允许一个类的定义位于另一个类的内部，前者称为内部类，后者 称为外部类

Inner class一般用在定义它的类或语句块之内，在外部引用它时必须给出完 整的名称。 

Inner class的名字不能与包含它的外部类类名相同； 

分类： 成员内部类（static成员内部类和非static成员内部类） 局部内部类（不谈修饰符）、匿名内部类

### 成员内部类作为类的成员的角色：

-  和外部类不同，Inner class还可以声明为private或protected； 
- 可以调用外部类的结构 
- Inner class 可以声明为static的，但此时就不能再使用外层类的非static的成员 变量； 

### 成员内部类作为类的角色： 

- 可以在内部定义属性、方法、构造器等结构
- 可以声明为abstract类 ，因此可以被其它的内部类继承 
- 可以声明为final的
- 编译以后生成OuterClass$InnerClass.class字节码文件（也适用于局部内部类） 

### 【注意】 

- 非static的成员内部类中的成员不能声明为static的，只有在外部类或static的成员 内部类中才可声明static成员。 
-  外部类访问成员内部类的成员，需要“内部类.成员”或“内部类对象.成员”的方式 
-  成员内部类可以直接使用外部类的所有成员，包括私有的数据 
- 当想要在外部类的静态成员部分使用内部类时，可以考虑内部类声明为静态的

### 内部类举例

```java
class Outer {
    private int s;
    public class Inner {
        public void mb() {
            s = 100;
            System.out.println("在内部类Inner中s=" + s);
        }
    }
    public void ma() {
        Inner i = new Inner();
        i.mb();
    }
}
public class InnerTest {
    public static void main(String args[]) {
        Outer o = new Outer();
        o.ma();
    }
}
```

```java
public class Outer {
    private int s = 111;
    public class Inner {
        private int s = 222;
        public void mb(int s) {
            System.out.println(s); // 局部变量s
            System.out.println(this.s); // 内部类对象的属性s
            System.out.println(Outer.this.s); // 外部类对象属性s
        }
    }
    public static void main(String args[]) {
        Outer a = new Outer();
        Outer.Inner b = a.new Inner();
        b.mb(333);
    }
}
```

### 如何声明局部内部类

```java
class 外部类{
    方法(){
        class 局部内部类{
        }
    }
    {
        class 局部内部类{
        }
    }
}
```

### 如何使用局部内部类

-  只能在声明它的方法或代码块中使用，而且是先声明后使用。除此之外的任何地方 都不能使用该类
-  但是它的对象可以通过外部方法的返回值返回使用，返回值类型只能是局部内部类 的父类或父接口类型

### 局部内部类的特点

-  内部类仍然是一个独立的类，在编译之后内部类会被编译成独立的.class文件，但 是前面冠以外部类的类名和$符号，以及数字编号。 
- 只能在声明它的方法或代码块中使用，而且是先声明后使用。除此之外的任何地方 都不能使用该类。 
- 局部内部类可以使用外部类的成员，包括私有的。 
- 局部内部类可以使用外部方法的局部变量，但是必须是final的。由局部内部类和局 部变量的声明周期不同所致
- 局部内部类和局部变量地位类似，不能使用public,protected,缺省,private 
- 局部内部类不能使用static修饰，因此也不能包含静态成员

### 匿名内部类

#### 定义

匿名内部类不能定义任何静态成员、方法和类，只能创建匿名内部类的一 个实例。一个匿名内部类一定是在new的后面，用其隐含实现一个接口或 实现一个类。

#### 格式：

 new 父类构造器（实参列表）|实现接口(){ //匿名内部类的类体部分 } 

#### 匿名内部类的特点

-  匿名内部类必须继承父类或实现接口
-  匿名内部类只能有一个对象 
- 匿名内部类对象只能使用多态形式引用

```java
interface A{
    public abstract void fun1();
}
public class Outer{
    public static void main(String[] args) {
        new Outer().callInner(new A(){
            //接口是不能new但此处比较特殊是子类对象实现接口，只不过没有为对象取名
            	public void fun1() {
                		System.out.println(“implement for fun1");
                }
         });// 两步写成一步了
      }
      public void callInner(A a) {
                a.fun1();
      }
} 
```

