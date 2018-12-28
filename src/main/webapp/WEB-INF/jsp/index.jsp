<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>玩转——简单登录认证</title>
</head>
<body>
<h1>玩转——简单登录认证</h1>
<h3>登录用户： ${username}</h3>

<a href="/logout">注销</a>
<br />
<a href="http://www.cnblogs.com/GoodHelper/"></a>
<script src="//unpkg.com/vue/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.4.11/lib/index.js"></script>
<div id="app">
    <el-row type="flex" class="row-bg">
        <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
        <el-col :span="6"><div class="grid-content bg-purple-light"></div></el-col>
        <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
    </el-row>
    <el-row type="flex" class="row-bg" justify="center">
        <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
        <el-col :span="6"><div class="grid-content bg-purple-light"></div></el-col>
        <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
    </el-row>
    <el-row type="flex" class="row-bg" justify="end">
        <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
        <el-col :span="6"><div class="grid-content bg-purple-light"></div></el-col>
        <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
    </el-row>
    <el-row type="flex" class="row-bg" justify="space-between">
        <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
        <el-col :span="6"><div class="grid-content bg-purple-light"></div></el-col>
        <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
    </el-row>
    <el-row type="flex" class="row-bg" justify="space-around">
        <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
        <el-col :span="6"><div class="grid-content bg-purple-light"></div></el-col>
        <el-col :span="6"><div class="grid-content bg-purple"></div></el-col>
    </el-row>
</div>
<div id="app2">
    <div>
        <el-button @click="show2 = !show2">Click Me</el-button>

        <div style="display: flex; margin-top: 20px; height: 100px;">
            <transition name="el-zoom-in-center">
                <div v-show="show2" class="transition-box">.el-zoom-in-center</div>
            </transition>

            <transition name="el-zoom-in-top">
                <div v-show="show2" class="transition-box">.el-zoom-in-top</div>
            </transition>

            <transition name="el-zoom-in-bottom">
                <div v-show="show2" class="transition-box">.el-zoom-in-bottom</div>
            </transition>
        </div>
    </div>
</div>
<script>
    var app=new Vue({
       el:"#app"
    });
    var app2=new Vue({
        el:"#app2",
        data:{
            show2:true
        }
    })
</script>
<style>
    .el-row {
        margin-bottom: 20px;
    }
    .el-row:last-child {
        margin-bottom: 0;
    }

    .el-col {
        border-radius: 4px;
    }

    .bg-purple-dark {
        background: #99a9bf;
    }

    .bg-purple {
        background: #d3dce6;
    }

    .bg-purple-light {
        background: #e5e9f2;
    }

    .grid-content {
        border-radius: 4px;
        min-height: 36px;
    }

    .row-bg {
        padding: 10px 0;
        background-color: #f9fafc;
    }
    .transition-box {
        margin-bottom: 10px;
        width: 200px;
        height: 100px;
        border-radius: 4px;
        background-color: #409EFF;
        text-align: center;
        color: #fff;
        padding: 40px 20px;
        box-sizing: border-box;
        margin-right: 20px;
    }
</style>
</body>
</html>