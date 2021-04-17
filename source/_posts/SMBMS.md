---
title: SMBMS
date: 2021-04-16 19:30:38
tags: 项目
categories: Java项目
description: smbms超市管理项目
---

# smbms

## 项目搭建

打开idea，创建maven项目

### 配置pom.xml,导入依赖jar包

```xml
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.xihua</groupId>
    <artifactId>SMBMS</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>war</packaging>
    <dependencies>
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>servlet-api</artifactId>
            <version>2.5</version>
        </dependency>
        <dependency>
            <groupId>javax.servlet.jsp</groupId>
            <artifactId>jsp-api</artifactId>
            <version>2.2.1-b03</version>
        </dependency>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.16</version>
        </dependency>
    </dependencies>
</project>
```

### 改写web.xml文件，更新版本

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
</web-app>
```

### 配置tomcat服务器

<img src="https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210416194100498.png" alt="image-20210416194100498" style="zoom:80%;" />![image-20210416194152523](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210416194152523.png)

<img src="https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210416194100498.png" alt="image-20210416194100498" style="zoom:80%;" />![image-20210416194152523](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210416194152523.png)

### 创建Java和resource文件夹，并创建Java包结构

![image-20210416194937008](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210416194937008.png)

### db.properties文件

```properties
user=root
password=702310
url=jdbc:mysql://localhost:3306/test?serverTimezone=UTC
driverClass=com.mysql.cj.jdbc.Driver
```

## 代码编写（登录功能）

### 代码编写流程

![image-20210417081321770](https://congloveqiu.oss-cn-chengdu.aliyuncs.com/img/image-20210417081321770.png)

### pojo层  Java对象

User.java

```java
package com.xihua.pojo;

public class User {
    private String username;
    private String password;

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}


```



### JdbcConnections连接数据库工具类

JdbcConnections.java

```java
package com.xihua.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcConnections {
    /**
     * 获得连接
     *
     * @return
     * @throws IOException
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static Connection getConnection() throws IOException, ClassNotFoundException, SQLException {
        //加载资源文件db.properties
        InputStream is = JdbcConnections.class.getClassLoader().getResourceAsStream("db.properties");
        Properties prop = new Properties();
        prop.load(is);
        String driver = prop.getProperty("driverClass");
        String url = prop.getProperty("url");
        String user = prop.getProperty("user");
        String password = prop.getProperty("password");
        //加载驱动
        Class.forName(driver);
        //获取连接
        Connection coon = DriverManager.getConnection(url, user, password);
        return coon;
    }
}
```

### 加载资源文件需要配置pom.xml

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

### Dao层BaseDao通用查询函数

BaseDao.java

```java
package com.xihua.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {
    /**
     * 通用查询dao函数
     *
     * @param coon
     * @param sql
     * @param params
     * @param ps
     * @param resultSet
     * @return
     * @throws SQLException
     */
    public static ResultSet execute(Connection coon, String sql, Object[] params, PreparedStatement ps, ResultSet resultSet) throws SQLException {
        //预编sql语句
        ps = coon.prepareStatement(sql);
        //填充占位符
        for (int i = 0; i < params.length; i++) {
            ps.setObject(i + 1, params[i]);
        }
        resultSet = ps.executeQuery();
        return resultSet;
    }
}

```

### Dao层 getLoginUser查询登录的用户信息

UserDaoImpl.java

```java
package com.xihua.dao;

import com.xihua.pojo.User;

import java.sql.Connection;
import java.sql.SQLException;

public interface UserDaoImpl {
    public User getLoginUser(Connection coon, String username) throws SQLException;
}

```

UserDao.java

```java
package com.xihua.dao;

import com.xihua.pojo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao implements UserDaoImpl {
    public User getLoginUser(Connection coon, String Username) throws SQLException {

        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        if (coon != null) {
            String sql = "SELECT * FROM `user` WHERE username=?";
            Object[] params = {Username};
            rs = BaseDao.execute(coon, sql, params, ps, rs);
            if (rs.next()) {
                user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("paw"));
            }
        }
        return user;
    }
}

```

### service层 用户登录业务

UserServiceImpl.java

```java
package com.xihua.service;

import com.xihua.pojo.User;

import java.io.IOException;
import java.sql.SQLException;

public interface UserServiceImpl {
    public User login(String username, String passwords) throws SQLException, IOException, ClassNotFoundException;
}
```

UserService.java

```java
package com.xihua.service;

import com.xihua.dao.UserDao;
import com.xihua.pojo.User;
import com.xihua.util.JdbcConnections;
import org.junit.Test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class UserService implements UserServiceImpl {
    private UserDao userDao;

    public UserService() {
        userDao = new UserDao();
    }

    public User login(String username, String passwords) throws SQLException, IOException, ClassNotFoundException {
        //业务层调用Dao层
        Connection coon = JdbcConnections.getConnection();
        User user = userDao.getLoginUser(coon, username);
        return user;
    }

    /**
     * 测试前面编写的内容是否有误
     *测试是否能够通过username查询到用户信息
     * @throws SQLException
     * @throws IOException
     * @throws ClassNotFoundException
     */
    @Test
    public void mytest() throws SQLException, IOException, ClassNotFoundException {
        UserService userService = new UserService();
        User user = userService.login("qiuqiu", "12345");
        System.out.println(user);
    }
}
```

### servlet层 调用业务层

LoginServlet.java

```java
package com.xihua.sverlet;

import com.xihua.pojo.User;
import com.xihua.service.UserService;
import com.xihua.util.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println("进入LoginServlet---");
        String usercode = req.getParameter("usercode");
        String pawcode = req.getParameter("pawcode");
        //去数据库中找
        UserService userService = null;
        User user = null;
        try {
            userService = new UserService();
            user = userService.login(usercode, pawcode);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (user != null) {
            req.getSession().setAttribute(Constants.USER_SESSION, user);
            //跳转主页
            resp.sendRedirect("index.jsp");
        } else {
            req.setAttribute("error", "用户名或密码错误");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
```

### 注册servlet

```xml
<servlet>
    <servlet-name>LoginServlet</servlet-name>
    <servlet-class>com.xihua.sverlet.LoginServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>LoginServlet</servlet-name>
    <url-pattern>/login.do</url-pattern>
</servlet-mapping>
<welcome-file-list>
    <welcome-file>login.jsp</welcome-file>
</welcome-file-list>
```

### filter过滤器   注册

CharacterEncodingFilter.java

```java
package com.xihua.filter;

import javax.servlet.*;
import java.io.IOException;

public class CharacterEncodingFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }

    public void destroy() {

    }
}

```

```xml
<filter>
    <filter-name>CharacterEncodingFilter</filter-name>
    <filter-class>com.xihua.filter.CharacterEncodingFilter</filter-class>
</filter>
<filter-mapping>
    <filter-name>CharacterEncodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>
```

### 前端页面导入

login.jsp

```jsp
<%--
  Created by IntelliJ IDEA.
  User: 聪哥
  Date: 2021/4/17
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>
    <title>登录</title>
</head>
<body>
<div class="container">
    <form id="form" class="form" action="${pageContext.request.contextPath}/login.do" method="post">
        <h2>Sign Up</h2>
        <div class="error">${error }</div>
        <div class="form-control">
            <label for="username">Username</label>
            <input type="text" name="usercode" id="username" placeholder="Enter username"/>
            <small>Error message</small>
        </div>
        <%--        <div class="form-control">--%>
        <%--            <label for="email">Email</label>--%>
        <%--            <input type="text" id="email" placeholder="Enter email"/>--%>
        <%--            <small>Error message</small>--%>
        <%--        </div>--%>
        <div class="form-control">
            <label for="password">Password</label>
            <input type="password" name="pawcode" id="password" placeholder="Enter password"/>
            <small>Error message</small>
        </div>
        <%--        <div class="form-control">--%>
        <%--            <label for="password2">Confirm Password</label>--%>
        <%--            <input--%>
        <%--                    type="password"--%>
        <%--                    id="password2"--%>
        <%--                    placeholder="Enter password again"--%>
        <%--            />--%>
        <%--            <small>Error message</small>--%>
        <%--        </div>--%>
        <button type="submit">Login</button>
    </form>
</div>

<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>

```

login.css

```css
@import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

:root {
    --success-color: #2ecc71;
    --error-color: #e74c3c;
}

* {
    box-sizing: border-box;
}

body {
    background-color: #f9fafb;
    font-family: 'Open Sans', sans-serif;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    margin: 0;
}

.container {
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
    width: 400px;
}

h2 {
    text-align: center;
    margin: 0 0 20px;
}

.form {
    padding: 30px 40px;
}

.form-control {
    margin-bottom: 10px;
    padding-bottom: 20px;
    position: relative;
}

.form-control label {
    color: #777;
    display: block;
    margin-bottom: 5px;
}

.form-control input {
    border: 2px solid #f0f0f0;
    border-radius: 4px;
    display: block;
    width: 100%;
    padding: 10px;
    font-size: 14px;
}

.form-control input:focus {
    outline: 0;
    border-color: #777;
}

.form-control.success input {
    border-color: var(--success-color);
}

.form-control.error input {
    border-color: var(--error-color);
}

.form-control small {
    color: var(--error-color);
    position: absolute;
    bottom: 0;
    left: 0;
    visibility: hidden;
}

.form-control.error small {
    visibility: visible;
}

.form button {
    /* 光标变化 */
    cursor: pointer;
    background-color: #3498db;
    border: 2px solid #3498db;
    border-radius: 4px;
    color: #fff;
    display: block;
    font-size: 16px;
    padding: 10px;
    margin-top: 20px;
    width: 100%;
}
```

script.js

```js
const form = document.getElementById('form');
const username = document.getElementById('username');
// const email = document.getElementById('email');
const password = document.getElementById('password');
// const password2 = document.getElementById('password2');


// Show input error message
function showError(input, message) {
    const formControl = input.parentElement;
    formControl.className = 'form-control error';
    const small = formControl.querySelector('small');
    small.innerText = message;
}

// Show success outline
function showSuccess(input) {
    const formControl = input.parentElement;
    formControl.className = 'form-control success';
}

// Check email is valid
// function checkEmail(input) {
//     const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
//     if (re.test(input.value.trim())) {
//         showSuccess(input);
//     } else {
//         showError(input, 'Email is not valid');
//     }
// }

// Check required fields
function checkRequired(inputArr) {
    let isRequired = false;
    // ===要求值相同类型相同
    inputArr.forEach(function (input) {
        if (input.value.trim() === '') {
            showError(input, `${getFieldName(input)} is required`);
            isRequired = true;
        } else {
            showSuccess(input);
        }
    });
    return isRequired;
}

// Check input length
function checkLength(input, min, max) {
    let flag = true;
    if (input.value.length < min) {
        showError(
            input,
            `${getFieldName(input)} must be at least ${min} characters`
        );
        flag = false;
    } else if (input.value.length > max) {
        showError(
            input,
            `${getFieldName(input)} must be less than ${max} characters`
        );
        flag = false;
    } else {
        showSuccess(input);
    }
    return flag;
}

// Check passwords match
// function checkPasswordsMatch(input1, input2) {
//     if (input1.value !== input2.value) {
//         showError(input2, 'Passwords do not match');
//     }
// }

// Get fieldname
function getFieldName(input) {
    return input.id.charAt(0).toUpperCase() + input.id.slice(1);
}

// Event listeners
form.addEventListener("submit", function (e) {
    e.preventDefault();
    if (!checkRequired([username, password,])) {
        if (checkLength(username, 3, 15) & checkLength(password, 6, 25)) {
            form.submit();
        }
        // checkEmail(email);
        // checkPasswordsMatch(password, password2);
    }
});
```

### 前端页面思路

用from表单post方式提交，提交前验证长度（用js），验证成功则登录，跳转到首页

## 代码编写（注销功能）

