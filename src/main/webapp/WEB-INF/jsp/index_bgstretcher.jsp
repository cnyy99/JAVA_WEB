<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Background Stretcher Demo</title>

<link rel="stylesheet" type="text/css" href="/static/css/main.css" />

<link rel="stylesheet" type="text/css" href="/static/css/bgstretcher.css" />

<script type="text/javascript" src="/static/js/jquery-1.5.2.min.js"></script>

<script type="text/javascript" src="/static/js/bgstretcher.js"></script>

<script type="text/javascript">

	$(document).ready(function(){

	

        //  Initialize Backgound Stretcher	   

		$('.demoo').bgStretcher({

			images: ['/static/images/preview.png', '/static/images/preview1.png', 'images/sample-3.jpg', 'images/sample-4.jpg', 'images/sample-5.jpg', 'images/sample-6.jpg'],

			imageWidth: 800, 

			imageHeight: 400, 

			slideDirection: 'N',

			slideShowSpeed: 1000,

			transitionEffect: 'fade',

			sequenceMode: 'normal',

		});

		

	});

</script>

</head>

<body>

<div class="demoo" id="deeeee"><br /><br />

	<div class="demofont">背景在切换，前面放内容。</div>

    <p>　　bgStretcher 2011 (Background Stretcher)是一个 jQuery 的插件，可以为你的网页添加多张背景图，且多个背景图能够自动切换，同时背景图大小可以自适应浏览器窗口的大小。背景图的切换效果有淡入淡出，滚动，幻灯，其中选用滚动和幻灯时，可以选择方向，上下左右，或者左上右下，右上左下。图片切换的顺序也可以设置，正向，反向或者随机。</p>

</div>
<!-- 
<script src="http://www.jq22.com/js/jq.js"></script> -->

</body>

</html>