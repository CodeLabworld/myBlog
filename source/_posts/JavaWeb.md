---
title: JavaWeb
date: 2021-04-14 14:33:20
tags: JavaWeb
categories: JavaWeb
description: JavaWeb学习笔记
---

# JavaWeb

# 基本概念

## 前言

web开发：

- web，网页的意思,www.baidu.com
- 静态web

- - html,css
  - 提供给所有人看的数据不会发生变化

- 动态web

- - 淘宝
  - 技术栈：Servlet/JSP,ASP,PHP

在java中，动态web资源开发的技术统称为JavaWeb；

## web应用程序

web应用程序：可以提供浏览器访问的程序

- a.html、b.html   .....多个web资源，这些资源可以被外界访问，对外界提供服务。
- 能访问到的任何一个页面或者资源，都存在与网络世界的某个计算机上。
- URL
- 这个统一的web资源会被放在同一个文件夹下，web应用程序-->Tomcat：服务器
- 一个web应用程序由多个部分组成：

- - html、css、js
  - jsp、servlet
  - java程序
  - 配置文件（Properties）

web应用程序编写完后，若想提供给外界访问：需要一个服务器统一来管理；

## 静态web

- *.htm *.html ，如果服务器上存在这些东邪，我们就可以通过网络读取。

- 静态web请求响应过程

  ![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1596896598463-669e4279-0bbe-40fe-ba4d-f21db66aede0.png)

- 静态web存在的缺点

- - Web页面无法动态更新，所有用户看到的都是一个页面

- - - 轮播图： 点击特效：伪动态
    - JavaScript: 实际开发中，它用的最多
    - VBScript

- - 它无法和数据库交互（数据无法持久化，用户无法交互）

## 动态web



页面会动态显示：“web的页面展示的效果因人而异”；

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597891092019-7ace5268-434a-46a1-b274-60841d2fb7b8.png)

缺点：

- 加入服务器的动态web资源出现错误，我们需要重新编写我们的后台程序，重新发布;

- - 停机维护

优点：

- Web页面可以动态更新，所有用户看到的都不是一个页面
- 它可以与数据库交互（数据持久化：注册，商品信息，用户信息....）

# web服务器

## 技术详解

**ASP:**  

- 微软：国内最早流行的就是ASP
- 在HTML中嵌入了VB的脚本， ASP+COM；
- 维护成本高
- C#
- IIS

**PHP:**

- PHP开发速度很快，功能强大，跨屏台，代码简单（70%）
- 无法承载大访问的情况（局限性）

**JSP/Servlet:**

- sun公司主推的B/S(浏览器/服务器)架构
- 基于java语言
- 可以承载三高（高并发、高可用、高性能）带来的问题

## web服务器

服务器是一种被动的操作，用来处理用户的一些请求和给用户的一些响应信息；

- IIS

- - 微软的：ASP.. window中自带的

- **Tomcat服务器**

**![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597891780413-6713d404-492c-45b5-9c0b-205720944987.png)**

Tomcat 服务器是一个免费的开放源代码的Web 应用服务器，属于轻量级应用服务器，在中小型系统和并发访问用户不是很多的场合下被普遍使用，是开发和调试JSP 程序的首选。对于一个初学者来说它是最佳的选择。Tomcat 实际上运行JSP 页面和Servlet。目前Tomcat最新版本为**9.0.37****。**

学习：

- 下载tomact
- 安装or解压
- 了解配置文件及目录结构
- 这个东西的作用
- Tomcat目录结构详细介绍： https://www.jb51.net/article/148995.htm

# Tomcat

## 安装Tomcat

- 官网：https://tomcat.apache.org/

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597892365854-907c7565-7a20-461f-aa43-b156477bddb0.png)

下载之后，解压即可：

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597892626662-b9577a4a-1758-4f43-88bf-f355536ef5bf.png)

## 启动Tomcat

测试：http://localhost:8080

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597896554797-ab01edb3-42a1-4078-b424-a4e14dd30eeb.png)

## 配置Tomcat

   ![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597897226644-1f0a95a0-3192-418e-9943-7c673c891ef1.png)

​    ![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597897243102-25508f64-267d-4da3-b986-8ae1b420b165.png)

![image.png](../../../../学习资料/Java/狂神说Java/1597897252056-144941e0-6423-4106-9734-2d143765709b.png)

 可以更改端口和域名，更改域名要修改C:\Windows\System32\drivers\etc，一般不做更改。

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597897408412-863677eb-262f-46ab-87f9-e205c0774b22.png)

**面试题：**

**请你谈谈网站是如何进行访问的？**

- - - 输入域名
    - 检查本机的C:\Windows\System32\drivers\etc\hosts配置文件下有没有这个域名映射，

- - - - 1有：直接返回对应的ip地址，这个地址中，有我们需要访问的web程序，可以直接访问

**127.0.0.1 www.java.com**

- - - - 没有，去DNS服务器找，找到的话就返回，找不到就返回找不到。

​         ![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597897885444-71f09346-5003-42c4-8282-b862e00965dd.png)



##  发布一个web网站

- 将自己写的网站，放到服务器中指定的web应用的文件夹（webapps）下，就可以访问了
- 网站应该有的结构

```
webapps:Tomcat  服务器的web目录
    - ROOT
  - moban4838 网站的目录名
     - WEB-INF
                - classes: java程序
        - lib web应用程序依赖的jar包
        - web.xml 网站的配置文件
     - index.html 默认的首页
     - static
                - css
                - js
        - img
        - ....
```

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597898727958-ef3d0cb6-30c8-4733-9712-368aadaf4724.png)

# HTTP协议

## 什么是HTTP?

HTTP（超文本传输协议）是一个简单的请求-响应协议，它通常运行在TCP之上。

- 文本： html,字符串~ ...
- 超文本：图片，音乐， 视频， 定位， 地图
- 端口： 80
- HTTPS： 安全的HTTP   443
- 两个版本：

- - **HTTP1.0：**客户端可以与web服务器连接后，只能获得一个web资源，断开连接
  - **HTTP1.1：** 客户端可以与web服务器连接后，可以获得多个资源

## HTTP请求

客户端   ----发起请求（request）----  服务器

### 请求行

请求方式： GET/POST HEAD/DELEDE/PUT/TRACT

- **get：**请求能够携带的参数比较少，大小有限制，会在浏览器的URL栏显示数据内容，不安全，但是高效。
- **post:** 请求能够携带的参数限制，大小没有有限制，会在浏览器的URL栏不会显示数据内容，安全，但不高效。

### 消息头

- **Accept:**  告诉浏览器，它所支持的数据类型
- **Accept-Encoding:**  支持的编码格式 UTF-8 GBK GB2312
- **Accept-Language:**  语言环境
- **Cache-Control:**  缓存控制
- **Connection:** 请求完成是断开还是保持连接
- **Cookie:**  缓存
- **Host:** 主机号
- **Refresh:** 告诉客户端，多久刷新一次
- **Location：**让网页重新定位

```
Request URL: https://www.baidu.com/   //请求地址
Request Method: GET                                //get方法和post方法
Status Code: 200 OK                  //状态码
Remote Address: 14.215.177.38:443    // 远程地址
Referrer Policy: no-referrer-when-downgrade
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3
Accept-Encoding: gzip, deflate, br
Accept-Language: zh,zh-CN;q=0.9
Cache-Control: max-age=0
Connection: keep-alive
Cookie: PSTM=1594296714; BAIDUID=19D8FA91D88C0C015880D299FF456E00:FG=1; BD_UPN=12314753; BIDUPSID=70F48A94E0D47DAD6C644E8FCB359A5D; hide_hotsearch=1; sug=3; ORIGIN=2; bdime=0; MCITY=-%3A; BDUSS=UcxcWNxS1ZkWlAxMWIySzJkRlJqS0NVaEphVFJrWjRLQ0FqYVJVc3hJMTloMWxmRVFBQUFBJCQAAAAAAAAAAAEAAABtMSV1x-XT8NrkxLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH36MV99-jFfZ; BDUSS_BFESS=UcxcWNxS1ZkWlAxMWIySzJkRlJqS0NVaEphVFJrWjRLQ0FqYVJVc3hJMTloMWxmRVFBQUFBJCQAAAAAAAAAAAEAAABtMSV1x-XT8NrkxLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH36MV99-jFfZ; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598; BDRCVFR[feWj1Vr5u3D]=I67x6TjHwwYf0; delPer=0; BD_CK_SAM=1; PSINO=6; BD_HOME=1; ZD_ENTRY=baidu; H_PS_PSSID=1457_32569_32531_31660_32045_32117_31708_26350_32506; sugstore=0
Host: www.baidu.com
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36
```

## HTTP响应

​    服务器   -----响应请求(response)----  客户端

## 响应状态码

200： 请求响应成功 200

3xx： 请求重定向

4xx： 找不到资源  404

5xx:   服务器代码错误  500  502（网关错误）

```
Cache-Control: private              //缓存控制
Connection: keep-alive              //连接：
Content-Encoding: gzip              //编码
Content-Type: text/html;charset=utf-8  //类型
Date: Thu, 20 Aug 2020 05:32:58 GMT
Expires: Thu, 20 Aug 2020 05:32:58 GMT
Server: BWS/1.1
Set-Cookie: BDSVRTM=453; path=/
Set-Cookie: BD_HOME=1; path=/
Set-Cookie: H_PS_PSSID=1457_32569_32536_31660_32045_32117_31708_26350_32506; path=/; domain=.baidu.com
Strict-Transport-Security: max-age=172800
Traceid: 1597901578043997236210089786624016751666
Transfer-Encoding: chunked
X-Ua-Compatible: IE=Edge,chrome=1
```

**面试题：**当你的浏览器中地址栏，输入地址并回车的一瞬间到页面能够展示回来，经历了什么？



# Maven

**为什么要学习Maven?**

- 在javaweb开发中，需要使用大量的jar包，需要手动导入。
- 如何能够让一个东西自动帮我们导入和配置这个jar包？
- 由此：Maven诞生了。

## Maven项目架构管理工具

- 目前： 用来方便导入jar包
- 核心思想： 约定大于配置

- - 有约束，不要去违反

- Maven会规定好你该如何编写我们的Java代码

## 下载安装Maven

 **Maven官网：**http://maven.apache.org/download.cgi

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597903104743-d35e45ab-fa0a-474e-9641-b8e469a3590b.png)

## 配置环境变量 

- M2_HOME     maven目录下的bin目录
- MAVEN_HOME  maven的目录

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597903824975-a0124bab-109b-4b57-b93b-1b0f08796e38.png)

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597903833833-bf9189d7-28e6-4318-842f-29ed6963b48f.png)



## 阿里云镜像

- **mirrors**

- - 加速我们的下载
  - 国内建议使用阿里云镜像
  - conf下的settings.xml中的mirror下添加

   ![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597904101978-a9aa1a0f-2a4d-45e6-901f-ef690140a9b2.png)

```
<mirror>
        <id>nexus-aliyun</id>
        <mirrorOf>*,!jeecg,!jeecg-snapshots</mirrorOf>
        <name>Nexus aliyun</name>
        <url>http://maven.aliyun.com/nexus/content/groups/public</url> 
</mirror>
```

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1597904682206-ac920606-3dbd-47a4-bac6-f807bbbbcbad.png)

## 本地仓库的配置

- 建立仓库

- - 建立一个本地仓库： localRepository

```
<localRepository>D:\Study Software\java\Maven\apache-maven-3.6.3\maven-repo</localRepository>
```



## IDEA中使用Maven

https://blog.csdn.net/czc9309/article/details/80304074

## IDEA中配置Tomact

https://blog.csdn.net/With_Her/article/details/89243777



# Servlet

## Servlet简介

- Servlet是sun公司开发动态web的一门技术
- Sun公司在这些API中提供了一个接口叫做Servlet,如果你想开发一个Servlet程序，只需要完成两个小步骤
- - 编写一个类，实现Servlet接口
  - 把开发好的java类部署到web服务器中
- 把实现了Servlet接口的java程序，叫做Servlet。

## web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
 </web-app>
```



## HelloServlet



![image-20210414195406707](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210414195406707.png)

**HelloServlet.java**

```java
package com.web.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Servlet1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter writer = resp.getWriter();
        writer.print("<h1>Hello Servlet!</h1>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
```

**配置web.xml**

```xml
<!DOCTYPE web-app PUBLIC
        "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
        "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
    <servlet>
        <servlet-name>home</servlet-name>
        <servlet-class>edu.cqupt.servlet.HelloServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>home</servlet-name>
        <url-pattern>/home</url-pattern>
    </servlet-mapping>
</web-app>
```

## Servlet原理

![image-20210414200341493](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210414200341493.png)

## Mapping问题

- 一个Servlet可以指定一个映射路径

```xml
<servlet-mapping>
     <servlet-name>home</servlet-name>
     <url-pattern>/home</url-pattern>
</servlet-mapping>
```

- 一个Servlet可以指定多个映射路径

```xml
<servlet-mapping>
     <servlet-name>home</servlet-name>
     <url-pattern>/home</url-pattern>
</servlet-mapping>
<servlet-mapping>
     <servlet-name>home</servlet-name>
     <url-pattern>/home2</url-pattern>
</servlet-mapping>
<servlet-mapping>
     <servlet-name>home</servlet-name>
     <url-pattern>/home3</url-pattern>
</servlet-mapping>
```

- 一个Servlet可以指定通用映射路径

```xml
<servlet-mapping>
     <servlet-name>home</servlet-name>
     <url-pattern>/home/*</url-pattern>
</servlet-mapping>
```

- 一个Servlet可以指定默认映射路径（一般将默认的映射路径设置为404页面，找不到就走到默认路径）

```xml
<servlet-mapping>
     <servlet-name>home</servlet-name>
     <url-pattern>/*</url-pattern>
</servlet-mapping>
```

- 一个Servlet可以指定一些后缀或者前缀等...

```xml
<!-- *前面不能加任何项目映射-->
<servlet-mapping>
     <servlet-name>home</servlet-name>
     <url-pattern>*.qingjiang</url-pattern>
</servlet-mapping>
```

- 优先级

- - 指定固有的映射路径优先级最高，找不到，就会走默认的处理请求

## ServletContext



web容器在启动的时候，它会为每个web程序都创建一个对应的ServletContext对象，它代表了当前的web应用；

### 共享数据

- - 在一个Servlet中，可以在另一个Servlet中拿到，实现了Servlet之间的通信

​     ![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598019995087-0c7b4fb8-bbe1-4285-9c61-a0c243e330ef.png)

```xml
public class HelloServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Hello");
        //this.getInitParameter()   初始化参数
        //this.getServletConfig()   Servlet配置
        //this.getServletContext()  Servlet上下文
        ServletContext context1 = this.getServletContext();
        //将一个数据保存到 ServletContext中，名字为：username,值为username
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        String username = "shilin.z";
        context1.setAttribute("username",username);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
public class GetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context2 = this.getServletContext();
        String username = (String) context2.getAttribute("username");

        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().print("s1传输的内容: " + username);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
        <servlet>
        <servlet-name>hello</servlet-name>
        <servlet-class>edu.cqupt.servlet.HelloServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>hello</servlet-name>
        <url-pattern>/hello</url-pattern>
    </servlet-mapping>

    <servlet>
        <servlet-name>getc</servlet-name>
        <servlet-class>edu.cqupt.servlet.GetServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>getc</servlet-name>
        <url-pattern>/getc</url-pattern>
    </servlet-mapping>
```

**测试结果：**

先 http://localhost:8080/s2/hello， 不然输出为null

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598019443651-f926ef34-ff4b-44ca-8f54-3340d780fa3d.png)

### 获取初始化参数

```xml
        <!-- 配置一些web应用的初始化参数-->
    <context-param>
        <param-name>url</param-name>
        <param-value>jdbc:mysql://local:3306/mybatis</param-value>
    </context-param>    

        <servlet>
        <servlet-name>getp</servlet-name>
        <servlet-class>edu.cqupt.servlet.Servlet03</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>getp</servlet-name>
        <url-pattern>/getp</url-pattern>
    </servlet-mapping>
  @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        String url = context.getInitParameter("url");
        resp.getWriter().print(url);
    }
```

**测试结果：**

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598020843447-09f45609-06df-433f-962b-2c01b4e4d301.png)

### 请求转发(不是重定向）

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598058018610-8189e3ad-4167-4694-b53d-de8887e1bbd3.png)

```java
@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入了Servlet04");
        ServletContext context = this.getServletContext();
        //RequestDispatcher requestDispatcher = context.getRequestDispatcher("/getp");    //转发的请求路径
        //requestDispatcher.forward(req,resp);    //调用forward实现请求转发
        context.getRequestDispatcher("/getp").forward(req,resp);
    }
    <servlet>
        <servlet-name>sd4</servlet-name>
        <servlet-class>edu.cqupt.servlet.Servlet04</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>sd4</servlet-name>
        <url-pattern>/sd4</url-pattern>
    </servlet-mapping>
```

**测试结果：**

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598021244992-0bf8f402-c734-44db-8fe2-362d4c7a81a2.png)

### 读取资源文件(静态资源导入)

- Properties类

- - 在java目录下新建properties
  - 在resources目录下新建properties

- 发现：都被打包到了同一路径下：classes，我们俗称路径为classpath

**![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598060043386-2b4a7650-59ad-42a2-9bc3-6cf0c40cf19d.png)**

**需要在本项目的****pom.xml****中****配置resources**

```xml
    <!-- 在bulid中配置resources，来防止我们资源导出失败的问题-->
    <build>
        <resources>
            <resource>
                <directory>src/main/resources</directory>
                <includes>
                    <include>**/*.properties</include>
                    <include>**/*.xml</include>
                </includes>
                <filtering>true</filtering>
            </resource>
            <resource>
                <directory>src/main/java</directory>
                <includes>
                    <include>**/*.properties</include>
                    <include>**/*.xml</include>
                </includes>
                <filtering>true</filtering>
            </resource>
        </resources>
    </build>
```

需要一个文件流：

**Servlet05.java**

```java
public class Servlet05 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获得文件流
        InputStream is = this.getServletContext().getResourceAsStream("/WEB-INF/classes/db.properties");
        Properties prop = new Properties();
        prop.load(is);
        String user  = prop.getProperty("username");
        String pwd = prop.getProperty("password");
        resp.getWriter().print(user + ":" + pwd);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
```

**db.properties**

```
username=root
password=123456
```

**web.xml**

```xml
<servlet>
        <servlet-name>sd5</servlet-name>
        <servlet-class>edu.cqupt.servlet.Servlet05</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>sd5</servlet-name>
        <url-pattern>/sd5</url-pattern>
    </servlet-mapping>
```

**测试结果：**

**![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598060812023-6388fb4a-2f0b-42cc-9070-a88c1c0b82f6.png)**

## HttpServletResponse

web服务器接收到客户端的http请求，针对这个请求，分别创建一个代表请求的HttpServletRequest对象，一个代表响应的HttpServletResponse对象；

- 如果要获取客户端请求过来的参数：找HttpServletRequset对象
- 如果要给客户端响应一些信息： 找HttpServletResponse对象

### 简单分类

#### **负责向浏览器发送数据的方法**

```java
ServletOutputStream getOutputStream() throws IOException;
PrintWriter getWriter() throws IOException;
```

#### **负责向浏览器发送响应头的方法**

```java
void setCharacterEncoding(String var1);
void setContentLength(int var1);
void setContentLengthLong(long var1);
void setContentType(String var1);
void setDateHeader(String var1, long var2);
void addDateHeader(String var1, long var2);
void setHeader(String var1, String var2);
void addHeader(String var1, String var2);
void setIntHeader(String var1, int var2);
void addIntHeader(String var1, int var2);
```

#### **响应的状态码**

```java
int SC_CONTINUE = 100;
int SC_OK = 200;
int SC_MULTIPLE_CHOICES = 300;
int SC_NOT_FOUND = 404;
int SC_INTERNAL_SERVER_ERROR = 500;
.....
```

### 常见应用

#### 向浏览器输出消息

（resp.getwriter().print()）

#### 下载文件

- - 获取下载文件的路径
  - 下载的文件名
  - 设置想办法让浏览器能够支持下载我们需要的东西
  - 获取下载文件的输入流
  - 创建缓冲区
  - 获取OutputStream对象
  - 将FileOutputStream流写入到buffer缓冲区
  - 使用OutputStream将缓冲区中的数据输出到客户端

```java
public class FileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1.获取下载文件的路径
        //String realPath = this.getServletContext().getRealPath("/dali.jpg");
        String realPath = "E:\\CodePlace\\Java\\idea\\狂神说Java\\Maven\\javawebMaven\\javaweb\\servlet-03-response\\target\\classes\\dali.jpg";
        System.out.println("下载文件的路径为：" + realPath);
        // 2.下载的文件名
        String filename = realPath.substring(realPath.lastIndexOf("\\") + 1);
        // 3.设置想办法让浏览器能够支持下载我们需要的东西
        resp.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename,"UTF-8"));
        // 4.获取下载文件的输入流
        FileInputStream in = new FileInputStream(realPath);
        // 5.创建缓冲区
        int len = 0;
        byte[] buffer = new byte[1024];
        // 6.获取OutputStream对象
        ServletOutputStream out = resp.getOutputStream();
        // 7.将FileOutputStream流写入到buffer缓冲区,使用OutputStream将缓冲区中的数据输出到客户端
        while((len=in.read(buffer))!=-1){
            out.write(buffer,0,len);
        }
        in.close();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
```





#### 验证码功能

**验证怎么来的？**

- 前端实现
- 后端实现，需要用到 java 的图片类，生成一个图片

```java
public class ImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. 如何让浏览器3秒自动刷新一次;
        resp.setHeader("refresh","3");
        //在内存中创建一个图片
        BufferedImage image = new BufferedImage(80, 20, BufferedImage.TYPE_3BYTE_BGR);
        //得到图片
        Graphics2D g = (Graphics2D)image.getGraphics();
        // 设置图片的背景颜色
        g.setColor(Color.white);
        g.fillRect(0,0,80,20);
        //给图片写数据
        g.setColor(Color.blue);
        g.setFont(new Font("宋体",Font.BOLD,20));
        g.drawString(makeNum(),0,20);

        // 告诉浏览器，这个请求用图片的方式打开
        resp.setContentType("image/jpeg");
        //网站存在缓存，不让浏览器缓存
        resp.setDateHeader("expires", -1);
        resp.setHeader("Cache-Control","no-cache");
        resp.setHeader("Pragma","no-cache");

        // 把图片写给浏览器
        boolean write = ImageIO.write(image, "jpg",resp.getOutputStream());
    }
    //生产随机数
    private String makeNum(){
        Random random = new Random();
        String num = random.nextInt(9999999) + "";
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 7 - num.length() ; i++) {   //保证生成的随机数只有7位
            sb.append("0");  //不足7位用0填充
        }
        num = sb.toString() + num;
        return num;
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
    <servlet>
        <servlet-name>img</servlet-name>
        <servlet-class>edu.cqupt.servlet.ImageServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>img</servlet-name>
        <url-pattern>/img</url-pattern>
    </servlet-mapping>
```

#### 请求转发

```java
package com.web.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Servlet1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /**
         * 请求转发
         * 地址不变；一次请求，共享request域中的数据 
         */
        String username = req.getParameter("username");
        System.out.println(username);
        req.setAttribute("key1", "1");

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/Servlet2");
        //走向Servlet2
        requestDispatcher.forward(req, resp);
    }
}
```



#### 实现重定向

   ![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598104464139-c3655ec2-84f2-4e4a-ac2e-63332a8230b9.png)

 B一个web资源收到客户端请求后，他会通知客户端去访问另外一个web资源，这个过程叫重定向。

   **常见场景：**

- 用户登录：登录成功，跳转到另外的页面。

```java
public class RedirectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
//        resp.setHeader("Location", "/s3/img");
//        resp.setStatus(302);
        resp.sendRedirect("/s3/img");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
```

**面试题：请求和重定向的区别？**

- 相同点

- - 页面都会跳转

- 不同点

- - 请求转发，url地址不会发生变化   307
  - 重定向，url地址会发生变化       302

```java
public class RequestTestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入这个请求了----");
        // 处理请求
        String username = req.getParameter("username");
        String pwd = req.getParameter("password");
        System.out.println(username + ":" + pwd);
        // 重定向一定要注意，路径问题，否则就会404
        resp.sendRedirect("/s3/home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> Success ! </h1>
</body>
</html>
```

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598109018004-9f4c5614-2577-406e-b654-590118e9e1f4.png)

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598109052674-9ab55ab9-4fc2-411e-baca-ede515212ef9.png)

## HttpServletRequest

HttpServletRequest代表客户端的请求，用户通过Http协议访问服务器，Http请求中的所有信息会被封装到HttpServletRequest，通过这个HttpServletRequest方法，获得客户端的所有信息。

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598145771426-8402d74e-22a2-4e2b-b209-2a960acc6300.png)

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598145794826-95125fb5-f6d3-4368-920f-b81f61c2dbe2.png)

### 获取前端传递的参数和请求转发

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598145966194-14c085af-39c1-4e96-86fe-111934655f75.png)

```java
public class LoginServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        //获取前端传递参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String[] hobbies = req.getParameterValues("hobbies");
        System.out.println("---------------");
        System.out.println(username);
        System.out.println(password);
        System.out.println(Arrays.toString(hobbies));
        System.out.println("---------------");

        //重定向
        // resp.sendRedirect("/s4/success.jsp");
        //通过请求转发
        System.out.println(req.getContextPath());
        //这里的/代表当前的web应用
        req.getRequestDispatcher("/success.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
```

## Cookie、Session

### 会话

**会话：**用户打开一个浏览器，点击了很多web资源，访问多个web资源，关闭浏览器，这个过程就叫做会话。

**有状态会话：**客户端访问服务器，下次在访问服务器，服务器知晓客户端曾今访问过。

 一个网站怎么证明用户访问过？

客户端       服务器

- 服务端给客户端一个**cookie**，客户端下次访问带上cookie就可以了
- 服务器通过**session**登记客户端访问过，下次客户端再次访问，服务器匹配客户端



### 保存会话的两种技术

**cookie（发票）**

- 客户端技术（响应、请求）

**session（登记）**

- 服务器技术：利用这个技术，可以保存用户的会话信息，我们可以把信息或者数据放在Session中

常见场景：

- 网站登录过后，下次不用登录，第二次访问直接就进去。



### cookie

- 从请求中拿到cookie
- 服务器响应给客户端cookie

```java
// 保存用户上一次访问的时间
public class CookieDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 服务器告诉你 ，你访问的时间，把这个时间封装成一个信件，下次访问的时候，需要带上信件
        req.setCharacterEncoding("gbk");
        resp.setCharacterEncoding("gbk");

        PrintWriter out = resp.getWriter();
        // 服务器端从客户端获取
        Cookie[] cookies = req.getCookies();  // cookie可能存在多个
        // 判断cookie是否存在
        if(cookies!=null){
            //如果存在
            out.write("你上次访问的时间是:");
            for (int i = 0; i <cookies.length ; i++) {
                Cookie cookie = cookies[i];
                // 获取cookie的名字
                if(cookie.getName().equals("lastLoginTime")){

                    long lastLoginTime = Long.parseLong(cookie.getValue());
                    Date date = new Date(lastLoginTime);
                    out.write(date.toLocaleString());
                }
                System.out.println(cookie.getName());
            }
        }else{
            out.write("这是您第一次访问本网站。");
        }
        //服务器给客户端响应一个Cookie
        Cookie cookie = new Cookie("lastLoginTime", System.currentTimeMillis() + "");
        cookie.setMaxAge(24*60*60);
        resp.addCookie(cookie);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
} 
```

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598151296347-8c4c3c75-b480-4c9a-bffe-ed656a8b3f4f.png)

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598151279143-ef1dafd5-86c4-47d7-851f-366deae3b178.png)

### Session（重点）

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598196442356-fc2ae54a-34e9-4a0d-9f67-88da1d869d8c.png)

#### **什么是Session：**

- 服务器给每一个用户（浏览器）创建一个Session对象
- 一个Session独占一个浏览器，只要浏览器没有关闭，这个Session就存在
- 用户登录之后，整个网站都可以访问！
- 场景：保存用户的信息，保存购物车信息，在整个网站中经常会使用的数据，我们将它保存在session中

**
**

#### **Session和Cookie的区别:**

- Cookie是把用户的数据写给用户得浏览器，浏览器保存（可以保存多个）
- Session把用户的数据写到用户独占的Session中，服务器端保存（保存重要的信息，减少服务器资源的浪费）
- Session对象由服务器创建



#### **使用Session**

```java
public class SessionDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 解决乱码问题
        resp.setHeader("content-type","text/html; charset=utf-8");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        //得到session
        HttpSession session = req.getSession();
        //获取Session的ID
        String sessionId  = session.getId();
        //判断session是否为新创建的
        if(session.isNew()){
            resp.getWriter().write("session 创建成功。session ID:" + sessionId );
        }else{
            resp.getWriter().write("已经在服务器中存在了。session ID:" + sessionId );
        }

        // Session创建的时候做了什么事情
        //Cookie cookie = new Cookie("JSESSIONID",sessionId);
        //resp.addCookie(cookie);

        //给Session中存字符串
        session.setAttribute("name","shilin.z");
        String name = (String) session.getAttribute("name");
        System.out.println(name);

        //给Session中存用户信息
        session.setAttribute("name",new Person("shilin.z",20));
        Person person = (Person) session.getAttribute("name");
        System.out.println(person.toString());

        //手动注销Session: 刷新，会重新生成sessionID
        //session.removeAttribute("name");
        //session.invalidate();

        //自动注销：在xml中配置
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
```



```xml
<!--    设置Session 默认的失效时间，以分钟为单位-->
<session-config>
<!-- 1分钟后失效 -->
<session-timeout>1</session-timeout>
</session-config>
```

## JSP

### 什么是JSP？

- Java Server Page: java服务器端页面，和Servlet一样，用于开发动态 web
- 最大的特点，就是写JSP，就像是在写HTML
- 区别：

- - HTML只能给用户提供静态数据
  - JSP页面中，可以嵌入Java代码，为用户提供动态数据

### JSP 原理

思路： JSP到底如何执行的？

- 代码层面： target里面和项目里面的JSP类似
- 服务器层面：

Tomcat服务器的work目录

   ![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598196843150-754658d5-c6de-4246-bef0-7482b0ce0e48.png)

IDEA工作空间

   ![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598196911904-767ef6f1-46c4-45e7-aa1c-771fbd4cea6c.png)

页面转变为了Java程序：

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598197216180-750bfc69-2088-4daa-bf4c-7d2fffcd40cb.png)

浏览器向服务器发送请求，不管访问什么资源，其实都是在访问Servlet!

#### **JSP本质上就是一个Servlet:**

```java
// 初始化
public void _jspInit() {
}
// 销毁
public void _jspDestroy() {  
}
//JSPService
public void _jspService(HttpServletRequest request, HttpServletResponse response) 
```

1. 判断请求
2. 内置一些对象

```java
final javax.servlet.jsp.PageContext pageContext;   // 页面上下文
javax.servlet.http.HttpSession session = null;     //session
final javax.servlet.ServletContext application;    //applocationContext
final javax.servlet.ServletConfig config;          //config
javax.servlet.jsp.JspWriter out = null;            // out
final java.lang.Object page = this;                // page： 当前
javax.servlet.jsp.JspWriter _jspx_out = null;
javax.servlet.jsp.PageContext _jspx_page_context = null;
HttpServletRequest request      // 请求
HttpServletResponse response    // 响应
```

1. 输出页面前设置的代码

```java
response.setContentType("text/html");       //设置响应的页面类型

pageContext = _jspxFactory.getPageContext(this, request, response,null, true, 8192, true);
_jspx_page_context = pageContext;
      
application = pageContext.getServletContext();

config = pageContext.getServletConfig();

session = pageContext.getSession();

out = pageContext.getOut();
_jspx_out = out;

out.write("\r\n");
out.write("<html>\r\n");
out.write("<head>\r\n");
  ......   
out.write("</html>\r\n");
// 在JSP中，只要是Java代码，就会原封不动的输出out.print(name);
// 如果是HTML代码就会被转换为out.write("<html>\r\n"); 这样的格式输出到前端
```

以上的这些对象我们可以在JSP的页面中直接使用。

![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598199502141-28e02361-8725-467e-a5ef-22900761d017.png)

### JSP 基础语法

任何语言都有自己的语法，Java中有，JSP作为java技术的一种应用，它拥有一些自己扩充的语法，Java所有语法都支持。

#### **JSP表达式**

```jsp
<%--JSP 表达式
作用： 用来将程序的输出，输出到客户端
<%= 变量或者表达式%>
--%>

<%=new java.util.Date()%>
```

#### **JSP 脚本片段**

```jsp
<%
    int sum = 0;
    for (int i = 0; i <= 100; i++) {
        sum += i;
    }
    out.println("<h2>Sum=" + sum + "</h2>");
%>
```

#### **JSP 脚本片段的再实现**

```jsp
<%
    int x = 10;
    out.println(x);
%>
<p>这是一个JSP文档</p>
<%
    int y = 2;
    out.println(x);
    out.println(y);
%>
```

#### **在JSP代码中嵌入HTML**

```jsp
<%
    for (int i = 0; i < 5 ; i++) {
%>
    <h1>Hello World! <%=i%> </h1>
<%
    }
%>
```

#### **JSP声明**

```jsp
<%!  
    static {
        System.out.println("Loading Servlet!");
    }
    private int globalVar = 0;
    public void study(){
        System.out.println("进入了方法。。。");
    }
%>
```

**JSP声明：**会被编译到JSP生成的Java类中，其他的就会被生成到_jspService方法中

**
**

#### **EL表达式${}**

```jsp
<%for (int i = 0; i < 5 ; i++) {%>
    <h1>Hello World! ${i} </h1>
<%}%>
```

此外：JSP的注释不会在HTML的源代码中显示。



### JSP 指令

```jsp
<%@ page errorPage="/error/500.jsp" %>
    
<%@ include file="common/header.jsp"%>
<h1>我是body1</h1>
<%@ include file="common/footer.jsp"%>

<hr>
<jsp:include page="/common/header.jsp"/>
<h1>我是body2</h1>
<jsp:include page="/common/footer.jsp"/>
```

### 9 大内置对象

- **PageContext**     **存数据**
- **Request**        **存数据**
- **Response**
- **Session**                   **存数据**
- **Application****(ServletContext)  存数据**
- **Config(ServletConfig)**
- **out**
- **page**
- **Exception**

**![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598249804087-cf0976fa-0b10-42ba-8fa2-d65297416506.png)**

```jsp
<%--内置对象--%>
<%
    //保存的数据只在一个页面中有效
    pageContext.setAttribute("name1","shilin.z-1");     
    //保存的数据只在一次请求中有效，请求转发携带数据
    request.setAttribute("name2","shilin.z-2");         
    //保存的数据只在一次会话中有效，从打开浏览器到关闭浏览器
    session.setAttribute("name3","shilin.z-3");         
    //保存的数据只要服务器中有效，从打开服务器到关闭服务器
    application.setAttribute("name4","shilin.z-4");     

%>
<%--通过pageContext 取出保存的值--%>
<%
    //
    String name1 = (String) pageContext.findAttribute("name1");
    String name2 = (String) pageContext.findAttribute("name2");
    String name3 = (String) pageContext.findAttribute("name3");
    String name4 = (String) pageContext.findAttribute("name4");
%>
<%--使用EL表达式输出${}--%>
<h1>取出的值为：</h1>
<h3>${name1}</h3>
<h3>${name2}</h3>
<h3>${name3}</h3>
<h3>${name4}</h3>
```

request: 客户端向服务器发送请求，产生的数据，用户看完了就没用了，比如：新闻

session：**客户端向服务器发送请求，产生的数据，用户看完了一会还有用，比如：购物车**

application: **客户端向服务器发送请求，产生的数据，一个用户用完了，其它用户还能用，比如：聊天数据**

**
**

### JSP 标签、JSTL标签、EL表达

```xml
        <!-- https://mvnrepository.com/artifact/javax.servlet.jsp.jstl/jstl-api -->
        <!--  JSTL表达式 依赖 -->
        <dependency>
            <groupId>javax.servlet.jsp.jstl</groupId>
            <artifactId>jstl-api</artifactId>
            <version>1.2</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/taglibs/standard -->
        <!-- Standard标签库 依赖 -->
        <dependency>
            <groupId>taglibs</groupId>
            <artifactId>standard</artifactId>
            <version>1.1.2</version>
        </dependency>
```

**EL表达式：** ${}

- 获取数据
- 执行运算
- 获取web开发的常用对象



**JSP标签**

```xml
<jsp:include page="/common/header.jsp"/>
<jsp:forward page="/jsptag02.jsp">
    <jsp:param name="name" value="shilin"/>
    <jsp:param name="age" value="20"/>
</jsp:forward>
```

**JSTL 标签**

- JSTL标签库的使用就是为了弥补HTML标签的不足；它自定义许多标签，可以供我们使用，标签的功能和java代码一样。

https://www.runoob.com/jsp/jsp-jstl.html

- 核心标签：核心标签是最常用的 JSTL标签。引用核心标签库的语法如下：

```jsp
<%@ taglib prefix="c" uri="`[`http://java.sun.com/jsp/jstl/core`](http://java.sun.com/jsp/jstl/core)`" %>
```

   ![image.png](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/1598251283981-2256c802-773d-4a6e-94a9-f7f389c787ab.png)

- JSTL标签使用步骤：

- - 引入对应的taglib
  - 使用其中的方法
  - 在Tomcat中也需要引入jstl的包， 否则会报错误：JSTL解析错误

```html
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h4>if测试</h4>
    <form action="coreif.jsp" method="get">
        <%--EL表达式获取表单中的数据 ${param.参数名}--%>
        名字：<input type="text" name="username" value="${param.username}">
        <input type="submit" value="登录">
    </form>

    <c:if test="${param.username == 'admin'}" var="isAdmin" >
        <c:out value="管理员欢迎您。。"/>
    </c:if>
    <c:out value="${isAdmin}"/>
    
    <c:set var="score" value="85"></c:set>
    <c:choose>
        <c:when test="${socre>90}">
            你的成绩为优秀
        </c:when>
        <c:when test="${socre>80}">
            你的成绩为一般
        </c:when>
        <c:when test="${socre>60}">
            你的成绩为及格
        </c:when>
        <c:when test="${socre<60}">
            你的成绩为不及格
        </c:when>
    </c:choose>
      
   <%
        ArrayList<String> people = new ArrayList<>();
        people.add(0,"张三");
        people.add(1,"李四");
        people.add(2,"王五");
        people.add(3,"赵六");
        people.add(4,"田七");
        request.setAttribute("list",people);
    %>
    <%--
        var: 每次遍历处理的变量
        items: 要遍历的对象
    --%>
    <c:forEach var="people" items="${list}">
        <c:out value="${people}"/><br>
    </c:forEach>
    <c:forEach var="people" items="${list}" begin="1" end="4" step="2">
        <c:out value="${people}"/><br>
    </c:forEach>         
</body>
</html>
```

### JavaBean

- 实体类
- JavaBean 有特定的写法

- - 必须要有一个无参构造
  - 属性必须私有化
  - 必须有对应的get/set方法
  - 一般用来和数据库字段做映射ORM。
  - ORM（对象关系映射）

- - - 表 -- 类
    - 字段 -- 属性

- - - - 行记录 -- 对象

| **id** | **name** | **age** | **address** |
| ------ | -------- | ------- | ----------- |
| 1      | 张三     | 2       | 重庆        |
| 2      | 李四     | 32      | 北京        |
| 3      | 王五     | 45      | 上海        |

```java
class People{
    private int id;
    private String name;
    private int age;
    private String address;
}

class A{
    new People(1,"张三",2,"重庆");
    new People(2,"李四",32,"北京");
    new People(3,"王五",45,"上海");
}
```

# MVC三层架构