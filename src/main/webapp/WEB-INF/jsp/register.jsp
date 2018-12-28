<%--
  Created by IntelliJ IDEA.
  User: 69532
  Date: 2018/12/27
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<head>
    <meta charset="UTF-8" />
    <title>Title</title>
</head>
<body>
<div class="web_login">
    <form name="form2" id="regUser" accept-charset="utf-8"  action="/register" method="post">
        <ul class="reg_form" id="reg-ul">
            <div id="userCue" class="cue">快速注册请注意格式</div>
            <li>
                <label for="username"  class="input-tips2">用户名：</label>
                <div class="inputOuter2">
                    <input type="text" id="username" name="username" maxlength="16" class="inputstyle2"/>
                </div>
            </li>
            <li>
                <label for="password" class="input-tips2">密码：</label>
                <div class="inputOuter2">
                    <input type="password" id="password"  name="password" maxlength="16" class="inputstyle2"/>
                </div>
            </li>
            <li>
                <label for="password2" class="input-tips2">确认密码：</label>
                <div class="inputOuter2">
                    <input type="password" id="password2" name="password2" maxlength="16" class="inputstyle2" />
                </div>
            </li>
            <li>
                <div class="inputArea">
                    <input type="submit" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="同意协议并注册"/> <a href="#" class="zcxy" target="_blank">注册协议</a>
                </div>
            </li><div class="cl"></div>
        </ul>
    </form>
</div>
</body>
</html>
