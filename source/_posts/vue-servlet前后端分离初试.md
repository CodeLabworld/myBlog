---
title: vue-servlet前后端分离初试
date: 2021-04-26 21:45:19
tags: 前后端分离项目
categories: 项目
description: 记录vue-servlet前后端
---

# vue-servlet前后端分离（简易登录功能实现）

## 引入axios用于前端提交表单

### vue中main.js

```javascript
import axios from 'axios'

Vue.use(axios)
Vue.prototype.$axios = axios
```

 /store/index.js

### modules中设置解决前后端跨域问题

```javascript
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    dev: {
      // Paths
      assetsSubDirectory: 'static',
      assetsPublicPath: '/',
      proxyTable: {
        '/': {
          target: 'http://localhost:8081/login.do',
          changeOrigin: true,
          pathRewrite: {
            '/def': ''
          }
        }
      },
    }
  }
})
```

### 页面login.vue(axios提交表单post)

```vue
<template>
  <div class="from">
    <el-form
      :model="ruleForm"
      status-icon
      :rules="rules"
      ref="ruleForm"
      label-width="80px"
      class="demo-ruleForm"
      label-position="left"
    >
      <el-form-item label="密码" prop="pass">
        <el-input
          type="password"
          v-model="ruleForm.pass"
          autocomplete="off"
        ></el-input>
      </el-form-item>
      <el-form-item label="确认密码" prop="checkPass">
        <el-input
          type="password"
          v-model="ruleForm.checkPass"
          autocomplete="off"
        ></el-input>
      </el-form-item>
      <el-form-item label="年龄" prop="age">
        <el-input v-model.number="ruleForm.age"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')"
          >提交</el-button
        >
        <el-button @click="resetForm('ruleForm')">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: "login",
  data () {
    var checkAge = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("年龄不能为空"))
      }
      setTimeout(() => {
        if (!Number.isInteger(value)) {
          callback(new Error("请输入数字值"))
        } else {
          if (value < 18) {
            callback(new Error("必须年满18岁"))
          } else {
            callback()
          }
        }
      }, 1000)
    }
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"))
      } else {
        if (this.ruleForm.checkPass !== "") {
          this.$refs.ruleForm.validateField("checkPass")
        }
        callback()
      }
    }
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"))
      } else if (value !== this.ruleForm.pass) {
        callback(new Error("两次输入密码不一致!"))
      } else {
        callback()
      }
    }
    return {
      ruleForm: {
        pass: "",
        checkPass: "",
        age: "",
      },
      rules: {
        pass: [{ validator: validatePass, trigger: "blur" }],
        checkPass: [{ validator: validatePass2, trigger: "blur" }],
        age: [{ validator: checkAge, trigger: "blur" }],
      },
    }
  },
  methods: {
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          // alert(this.ruleForm.pass)
          this.$axios({
            method: 'post',
            url: 'http://localhost:8081/login.do',
            params: {
              userpass: this.ruleForm.pass,
              useruame: 'qiuqiu'
            }
          })
        } else {
          console.log("error submit!!")
          return false
        }
      })
    },
    resetForm (formName) {
      this.$refs[formName].resetFields()
    },
  },
};
</script>
<style scoped>
.from {
  width: 400px;
  margin: 0 auto;
}
</style>
```

## 后端controler层

```java
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println("进入LoginServlet---");
        //获得前端输入的数据
        String usercode = req.getParameter("useruame");
        String pawcode = req.getParameter("userpass");
        System.out.println(pawcode);
        //去数据库中找
        UserService userService = null;
        User user = null;
        try {
            //调用业务层获得用户信息
            userService = new UserService();
            user = userService.login(usercode, pawcode);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        if (user != null) {
//            //查到此人，将用户信息存入session
//            req.getSession().setAttribute(Constants.USER_SESSION, user);
//            //跳转到主页
//            resp.sendRedirect("index.jsp");
//        } else {
//            //未查到此人，返回前台登录失败
//            req.setAttribute("error", "用户名或密码错误");
//            req.getRequestDispatcher("login.jsp").forward(req, resp);
//        }
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(user);
//        return json;
//        PrintWriter out = resp.getWriter();
//        out.write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
```

