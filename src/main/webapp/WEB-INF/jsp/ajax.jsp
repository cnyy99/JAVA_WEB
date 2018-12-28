<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Person列表</title>
    <!-- 引入Jquery -->
    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <!-- 編寫腳本 -->
    <script type="text/javascript">
        $(function() {
            $.ajax({
                url: '${pageContext.request.contextPath}/ajaxlist',
                type: 'post',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function(rawdata) {//這裏的data代表的就是返回person集合list
                    var html = "";
                    html += "<tr><th>姓名</th><th>密码</th></tr>";
                    var data=rawdata.list;
                    for(var i=0; i<data.length; i++){
                        html += "<tr><td>"+data[i].userName+"</td><td>"+data[i].userPassword+"</td></tr>";
                    }
                    $("table").html(html);
                }
            });
        });
    </script>
</head>

<body>
<H1>This is the ajax.jsp</H1>
<table>
</table>
</body>
</html>