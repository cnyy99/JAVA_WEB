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

			images: ['/static/images/preview.png', '/static/images/preview1.png'],

			imageWidth: 'auto',

			imageHeight: 'auto',

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


</div>
<!-- 
<script src="http://www.jq22.com/js/jq.js"></script> -->

</body>

</html>