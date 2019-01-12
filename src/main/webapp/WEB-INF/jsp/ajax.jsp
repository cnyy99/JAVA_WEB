<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Person列表</title>
    <script src="https://cdn.staticfile.org/vue/2.4.2/vue.min.js"></script>
    <script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
    <!-- 引入Jquery -->
    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <!-- 編寫腳本 -->
    <script type="text/javascript">
        $(function() {
            $.ajax({
                url: '${pageContext.request.contextPath}/allusers',
                type: 'post',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function(rawdata) {//這裏的data代表的就是返回person集合list
                    var html = "";
                    html += "<tr><th>姓名</th><th>密码</th></tr>";
                    var data=rawdata;
                    for(var i=0; i<data.length; i++){
                        html += "<tr><td>"+data[i].userName+"</td><td>"+data[i].userPassword+"</td></tr>";
                    }
                    $("table").html(html);
                }
            });
        });

    </script>
    <div id="box">
        <input type="button" @click="get()" value="点我异步获取数据(Get)">
    </div>
    <div id="box2">
        {{msg}}
    </div>
    <script type = "text/javascript">
        var vm2 = new Vue({
            el:'#box2',
            data:{
                msg:'Hello World!'
            }
        });
        window.onload = function(){

            var vm = new Vue({
                el:'#box',
                data:{
                    msg:'Hello World!',
                },
                methods:{
                    get:function(){
                        //发送get请求
                        this.$http.get('/users').then(function(res){
                            var str="";
                            for(var property in res) {
                                str+=property + "=" + res[property]+"</br>";
                            }
                            vm2.msg=str;
                            // document.write(res.body.list);
                        },function(){
                            console.log('请求失败处理');
                        });
                    }
                }
            });

        }
    </script>
</head>

<body>
<H1>This is the ajax.jsp</H1>
<table>
</table>
</body>
</html>