<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chennan.mysite.cnyy.controller.WebSecurityConfig" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
    <%
        // 获取session创建时间
        Date createTime = new Date(session.getCreationTime());
        // 获取最后访问页面的时间
        Date lastAccessTime = new Date(session.getLastAccessedTime());

        String title = "再次访问菜鸟教程实例";
        Integer visitCount = new Integer(0);
        String visitCountKey = new String("visitCount");
        String userIDKey = new String("userID");
        String userID = new String("ABCD");

        // 检测网页是否由新的访问用户
        if (session.isNew()){
            title = "访问菜鸟教程实例";
//            session.setAttribute(userIDKey, userID);
//            session.setAttribute(visitCountKey,  visitCount);
        } else {
            visitCount = (Integer)session.getAttribute(visitCountKey);
            visitCount += 1;
            userID = (String)session.getAttribute(userIDKey);
            session.setAttribute(visitCountKey,  visitCount);
        }
        String username2=(String) session.getAttribute(WebSecurityConfig.SESSION_KEY);
    %>
</head>
<body>
<%
    Enumeration enums=session.getAttributeNames();
    while(enums.hasMoreElements() ) {
        out.println(enums.nextElement()+"</br>");
    }
%>
<form action="/toindex" name="loginfrom" accept-charset="utf-8" method="post">
    <label class="label-tips" for="u">账号:</label>
    <input type="text" id="u" name="username" class="inputstyle"/>
    <div>
        <label class="lable-tips" for="password">密码:</label>
        <input type="password" id="password" name="password" class="inputstyle" />
    </div>
    <input type="submit" name="登录"/>
    <a href="/register" class="zcxy" target="_blank">注册</a>
</form>
<a href="/index">首页</a>
<h1>Session 跟踪</h1>

<table border="1" align="center">
    <tr bgcolor="#949494">
        <th>Session 信息</th>
        <th>值</th>
    </tr>
    <tr>
        <td>id</td>
        <td><% out.print( session.getId()); %></td>
    </tr>
    <tr>
        <td>创建时间</td>
        <td><% out.print(createTime); %></td>
    </tr>
    <tr>
        <td>最后访问时间</td>
        <td><% out.print(lastAccessTime); %></td>
    </tr>
    <tr>
        <td>用户 ID</td>
        <td><% out.print(userID); %></td>
    </tr>
    <tr>
        <td>访问次数</td>
        <td><% out.print(visitCount); %></td>
    </tr>
    <tr>
        <td>用户名</td>
        <td><% out.print(username2); %></td>
    </tr>
</table>
</body>
</html>