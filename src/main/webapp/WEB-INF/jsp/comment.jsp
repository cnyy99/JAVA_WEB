<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chennan's website &mdash; Messages</title>
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/static/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="/static/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="/static/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="/static/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/static/assets/ico/apple-touch-icon-57-precomposed.png">

<link rel="stylesheet" href="/static/css/semantic.css" type="text/css" />
<link rel="stylesheet" href="/static/css/zyComment.css" type="text/css" />

<style type="text/css" media="print, screen">  
label {
	font-weight: bold;
}

a {
	font-family: Microsoft YaHei;
}

#articleComment {
	width: 600px;
	margin:0 auto;
}
</style> 

</head>
<body>
	<div id="articleComment"></div>
	
	<%--<script type="text/javascript" src="/static/js/jquery-1.7.2.min.js"></script>--%>
    <script type="text/javascript" src="/static/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/static/js/zyComment.js"></script>
	
	<script type="text/javascript">
        $.ajax({
            url : '/data/commentshow',
            type : 'GET',
            async: false,//使用同步的方式,true为异步方式
            success : function(data){
//code here...
//                 alert('success')
                agoComment=data;
            },
            fail:function(){
//code here...
            }
        });
        var newComment;
		$("#articleComment").zyComment({
			"width":"355",
			"height":"33",
			"agoComment":agoComment,
			"callback":function(comment){
                var SESSION_USER_KEY="${SESSION_USER_KEY}";
			    if(SESSION_USER_KEY=="")
                {
                    alert("请先登录后再留言");
                    self.location='/login';
                }
			    for (var i in comment)
                {
                    console.log(i+"   "+comment[i]);
                }
                $.ajax({
                    url : '/data/commentshowinsert',
                    type : 'POST',
                    async: false,
                    dataType: "json",
                    data:comment,
                    success : function(data){
                        newComment=data;
                    },
                    fail:function(){
                    }
                });
				console.info("填写内容返回值：");
				console.info("comment.text:"+comment.commentText+"    commentPid:"+comment.commentPid);
				comment=newComment;
                console.info("newComment"+comment);// 添加新的评论
				$("#articleComment").zyComment("setCommentAfter",{"commentId":comment.commentId, "userName":comment.userName, "commentText":comment.commentText, "commentTime":comment.commentTime});

			}
		});
		
		
	
	</script>
		
</body>
</html>