<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title> Chennan's website &mdash; Manage</title>
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/static/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="/static/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="/static/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="/static/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/static/assets/ico/apple-touch-icon-57-precomposed.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/bootstrap/3.2.0/css/bootstrap.min.css"/>

    <!-- Include FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/fontawesome/4.1.0/css/font-awesome.min.css"/>

    <!-- jQuery and Bootstrap JS -->
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css"/>
    <link type="text/css" rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.5/css/bootstrap-select.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.5/js/bootstrap-select.min.js"></script>

    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.5/js/i18n/defaults-zh_CN.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
    <!-- BootstrapValidator JS -->
    <script type="text/javascript"
            src="//cdn.jsdelivr.net/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"></script>
</head>
<body>
<div class="row">
    <div class="col-sm-6 offset-3" style="padding-left: 2%;padding-top: 1%">
        <div class="form-group">
            <label for="select_control" class="col-sm-6 control-label">chose item to manage</label>
            <div class="col-sm-11">
                <select class="selectpicker show-tick" id="select_control" name="select_control" data-style="btn-info">
                    <option value="2">Course</option>
                    <option value="1">Skill</option>
                    <option value="3">Comment</option>
                </select>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <h3><a href="/druid">database click here</a></h3>
    </div>
</div>


<div class="row">
    <div class="container  hide" id="skill">
        <div class="row" style="text-align: center"><h1>Skill Manage</h1></div>
        <div id="jsGrid_skill"></div>
    </div>

    <div class="container" id="course">
        <div class="row" style="text-align: center"><h1>Course Manage</h1></div>
        <div id="jsGrid_course"></div>
    </div>

    <div class="container  hide" id="comment">
        <div class="row" style="text-align: center"><h1>Comment Manage</h1></div>
        <div id="jsGrid_comment"></div>
    </div>
</div>
<script type="text/javascript" src="/static/js/mycontrol.js"></script>

</body>
</html>