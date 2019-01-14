<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论demo</title>

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
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript" src="/static/js/zyComment.js"></script>
	
	<script type="text/javascript">
	
		var agoComment = [
		                  {"id":1,"userName":"游客1","time":"2014-04-04","sortID":0,"content":"第一条评论"},
		                  {"id":2,"userName":"游客2","time":"2014-04-04","sortID":0,"content":"第二条评论"},
		                  {"id":3,"userName":"站长","time":"2014-04-04","sortID":1,"content":"第一条评论的回复"},
		                  {"id":4,"userName":"站长","time":"2014-04-04","sortID":2,"content":"第二条评论的回复"},
		                  {"id":5,"userName":"游客3","time":"2014-04-04","sortID":0,"content":"第三条评论"},
		                  {"id":6,"userName":"游客2","time":"2014-04-04","sortID":4,"content":"第二条评论的回复的回复"},
		                  ];
		                 i=1;
        $.ajax({
            url : '/data/comments',
            type : 'GET',
            async: true,//使用同步的方式,true为异步方式
            data : {'act':'addvideo', 'videoname':videoname},//这里使用json对象
            success : function(data){
//code here...
                agoComment=data;
            },
            fail:function(){
//code here...
            }
        });
		$("#articleComment").zyComment({
			"width":"355",
			"height":"33",
			"agoComment":agoComment,
			"callback":function(comment){
				console.info("填写内容返回值：");
				console.info(comment);
				i+=1;
				comment.id=999+i;
				comment.name="name"+i;
				// 添加新的评论
				$("#articleComment").zyComment("setCommentAfter",{"id":comment.id, "name":comment.name, "content":comment.content, "time":new Date()});

			}
		});
		
		
	
	</script>
		
</body>
</html>