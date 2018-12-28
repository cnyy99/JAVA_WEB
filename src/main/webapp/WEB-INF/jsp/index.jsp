<%@ page import="com.chennan.mysite.cnyy.controller.WebSecurityConfig" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>玩转</title>
</head>
<body>
<h3>登录用户： <%= session.getAttribute(WebSecurityConfig.SESSION_KEY)%></h3>
<%--<h3>用户： ${user.getUserName()}</h3>--%>
<%--<h3>密码： ${user.getUserPassword()}</h3>--%>

<a href="/logout">注销</a>
<br />
<a href="http://www.cnblogs.com/GoodHelper/"></a>
</body>
</html>