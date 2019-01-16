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

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
    <!-- BootstrapValidator JS -->
    <script type="text/javascript"
            src="//cdn.jsdelivr.net/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"></script>
</head>
<body>
<div class="col-lg-6 offset-3" style="text-align: center"><h1>Course Manage</h1></div>
<div class="container">
    <div id="jsGrid"></div>
</div>
<script>

    var myController={
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
    $("#jsGrid").jsGrid({
        width: "100%",
        height: "477px",
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
        controller:myController,

        fields: [
            {name: "courseId", type: "number", width: 7, editing: false},
            {name: "courseName", type: "text", width: 23},
            {name: "courseScore", type: "number", width: 13},
            {name: "courseType", type: "text", width: 17},
            {name: "courseTerm", type: "text", width: 20},
            {name: "courseShow", type: "checkbox", width:3},
            {type: "control"}
        ]
    });
</script>
</body>
</html>