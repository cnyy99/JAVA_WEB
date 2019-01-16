<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel='stylesheet' href="/static/css/style_register.css" type="text/css"/>
    <title>Chennan's website &mdash; Register</title>
    <script src="https://cdn.jsdelivr.net/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<script type="application/x-javascript"> addEventListener("load", function () {--%>
    <%--setTimeout(hideURLbar, 0);--%>
    <%--}, false);--%>
    <%--function hideURLbar() {--%>
    <%--window.scrollTo(0, 1);--%>
    <%--} </script>--%>
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/static/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="/static/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="/static/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="/static/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/static/assets/ico/apple-touch-icon-57-precomposed.png">
    <style>
        .help-block{
            color: red;
        }
    </style>
</head>

<body>
<div class="main">
    <!-----start-main---->
    <div class="clear"></div>
    <h2>Sign up</h2>
    <form action="/register" id="register_from" class="form-horizontal" method="post">
        <div class="lable-2 form-group">
            <p style="color: red">${SESSION_MSG_KEY}</p>
            <input type="text" class="text form-control" name="username" placeholder="请输入用户名">
        </div>
        <div class="lable-2 form-group">
            <p style="color: red">${SESSION_MSG_EMAIL_KEY}</p>
            <input type="text" class="text form-control" name="email" placeholder="请输入邮箱">
        </div>
        <div class="clear"></div>
        <div class="lable-2 form-group">
            <input type="password" class="text form-control" name="password" placeholder="请输入密码">
        </div>
        <div class="lable-2 form-group">
            <input type="password" class="text form-control" name="password2" placeholder="请重新输入密码">
        </div>

        <div class="clear"></div>
        <h3>By creating an account, you agree to my <span><a href="#">license</a> </span></h3>
        <div class="submit">
            <input type="submit" value="Create account">
        </div>
        <div class="clear">

        </div>
    </form>
    <!-----//end-main---->
</div>
<script>
    $(document).ready(function () {
        $('#register_from').bootstrapValidator({
            // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]{2,10}$|^[a-zA-Z0-9_\u4E00-\u9FA5]{2,6}$/,
                            message: '用户名非法'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        identical: {
                            field: 'password2',
                            message: '两次输入的密码不同'
                        }
                    }
                },
                password2: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        identical: {
                            field: 'password',
                            message: '两次输入的密码不同'
                        }
                    }
                },
                email:{
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱地址无效'
                        }
                    }
                }
            }
        });
    });
</script>
<!-----start-copyright---->
<%--<div class="copy-right">--%>
<%--<p>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a></p>--%>
<%--</div>--%>
<!-----//end-copyright---->

</body>
</html>