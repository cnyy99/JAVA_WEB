<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/bootstrap/3.2.0/css/bootstrap.min.css"/>

    <!-- Include FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/fontawesome/4.1.0/css/font-awesome.min.css"/>

    <!-- BootstrapValidator CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css"/>

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
        <div class="col-lg-6 offset-3" style="text-align: center"><h1>Skill Manage</h1></div>
        <div id="jsGrid_skill"></div>
    </div>

    <div class="container" id="course">
        <div class="col-lg-6 offset-3" style="text-align: center"><h1>Course Manage</h1></div>
        <div id="jsGrid_course"></div>
    </div>

    <div class="container  hide" id="comment">
        <div class="col-lg-6 offset-3" style="text-align: center"><h1>Comment Manage</h1></div>
        <div id="jsGrid_comment"></div>
    </div>
</div>
<script>
    $('#select_control').on('change', function(){
        if ($(this).val() == 1 ) {
            $('#skill').removeClass('hide');
            $('#comment').addClass('hide');
            $('#course').addClass('hide');
        }

        if ($(this).val() == 2 ) {
            $('#skill').addClass('hide');
            $('#comment').addClass('hide');
            $('#course').removeClass('hide');
        }
        if ($(this).val() == 3 ) {
            $('#skill').addClass('hide');
            $('#comment').removeClass('hide');
            $('#course').addClass('hide');
        }
    })

    var myController_comment={
        loadData: function(filter) {
            return $.ajax({
                type: "GET",
                url: "/data/comments",
                data: filter,
                dataType: "JSON"
            });
        },

        insertItem: function(item) {
            return $.ajax({
                type: "POST",
                url: "/data/insertComment",
                data: item
            });
        },

        updateItem: function(item) {
            return $.ajax({
                type: "POST",
                url: "/data/updateComment",
                data: item
            });
        },

        deleteItem: function(item) {
            return $.ajax({
                type: "GET",
                url: "/data/deleteComment",
                data: item
            });
        }
    };
    $("#jsGrid_comment").jsGrid({
        width: "100%",
        height: "430px",
        autoload:true,
        inserting: true,
        editing: true,
        reloadAfterSubmit:true,
        localUpdate:true,
        sorting: true,
        paging: true,
        // pageLoading:true,
        pageSize: 10,
        // pageButtonCount: 5,
        // pageIndex: 1,
        afterSubmit: function () { location.reload(true); },
        loadIndication: true,
        loadIndicationDelay: 500,
        loadMessage: "Please, wait...",
        loadShading: true,
        controller:myController_comment,
        fields: [
            {name: "commentId", type: "number", width: 17, editing: false},
            {name: "userId", type: "number", width: 17, editing: false},
            {name: "commentPid", type: "number", width: 17 , editing: false},
            {name: "commentTime", type: "date", width: 27, editing: false},
            {name: "commentText", type: "textarea", width: 50, editing: false},
            {editButton: false,insertButton: false, type: "control"}
        ]
    });
    var myController_course={
        loadData: function(filter) {
            return $.ajax({
                type: "GET",
                url: "/data/courses",
                data: filter,
                dataType: "JSON"
            });
        },

        insertItem: function(item) {
            return $.ajax({
                type: "POST",
                url: "/data/insertCourse",
                data: item
            });
        },

        updateItem: function(item) {
            return $.ajax({
                type: "POST",
                url: "/data/updateCourse",
                data: item
            });
        },

        deleteItem: function(item) {
            return $.ajax({
                type: "GET",
                url: "/data/deleteCourse",
                data: item
            });
        }
    };
    $("#jsGrid_course").jsGrid({
        width: "100%",
        height: "430px",
        autoload:true,
        inserting: true,
        editing: true,
        reloadAfterSubmit:true,
        localUpdate:true,
        sorting: true,
        paging: true,
        // pageLoading:true,
        pageSize: 10,
        // pageButtonCount: 5,
        // pageIndex: 1,
        afterSubmit: function () { location.reload(true); },
        loadIndication: true,
        loadIndicationDelay: 500,
        loadMessage: "Please, wait...",
        loadShading: true,
        controller:myController_course,

        fields: [
            {name: "courseId", type: "number", width: 10, editing: false},
            {name: "courseName", type: "text", width: 27},
            {name: "courseScore", type: "number", width: 18},
            {name: "courseType", type: "text", width: 23},
            {name: "courseTerm", type: "text", width: 25},
            {name: "courseShow", type: "checkbox", width:5},
            {type: "control"}
        ]
    });
    var myController_skill={
        loadData: function(filter) {
            return $.ajax({
                type: "GET",
                url: "/data/skills",
                data: filter,
                dataType: "JSON"
            });
        },

        insertItem: function(item) {
            return $.ajax({
                type: "POST",
                url: "/data/insertSkill",
                data: item
            });
        },

        updateItem: function(item) {
            return $.ajax({
                type: "POST",
                url: "/data/updateSkill",
                data: item
            });
        },

        deleteItem: function(item) {
            return $.ajax({
                type: "GET",
                url: "/data/deleteSkill",
                data: item
            });
        }
    };
    $("#jsGrid_skill").jsGrid({
        width: "100%",
        height: "430px",
        autoload:true,
        inserting: true,
        editing: true,
        reloadAfterSubmit:true,
        localUpdate:true,
        sorting: true,
        paging: true,
        // pageLoading:true,
        pageSize: 10,
        // pageButtonCount: 5,
        // pageIndex: 1,
        afterSubmit: function () { location.reload(true); },
        loadIndication: true,
        loadIndicationDelay: 500,
        loadMessage: "Please, wait...",
        loadShading: true,
        controller:myController_skill,

        fields: [
            {name: "skillId", type: "number", width: 30, editing: false},
            {name: "skillName", type: "text", width: 30},
            {name: "skillScore", type: "number", width: 7},
            {name: "skillShow", type: "checkbox", width:3},
            {type: "control"}
        ]
    });
</script>
</body>
</html>