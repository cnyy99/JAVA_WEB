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
    <script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1.11.1/jquery.min.js"></script>
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
<div class="container">
    <div id="jsGrid"></div>
</div>
<script>
    var clients = [
        {"Name": "Otto Clay", "Age": 25, "Country": 1, "Address": "Ap #897-1459 Quam Avenue", "Married": false},
        {"Name": "Connor Johnston", "Age": 45, "Country": 2, "Address": "Ap #370-4647 Dis Av.", "Married": true},
        {"Name": "Lacey Hess", "Age": 29, "Country": 3, "Address": "Ap #365-8835 Integer St.", "Married": false},
        {"Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true},
        {"Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true},
        {"Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true},
        {"Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true},
        {"Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true},
        {"Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true},
        {"Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false}
    ];

    var countries = [
        {Name: "", Id: 0},
        {Name: "United States", Id: 1},
        {Name: "Canada", Id: 2},
        {Name: "United Kingdom", Id: 3}
    ];
    var myController={
        loadData: function(filter) {
            return $.ajax({
                type: "GET",
                url: "/get/skills",
                data: filter
            });
        },

        insertItem: function(item) {
            return $.ajax({
                type: "POST",
                url: "/items",
                data: item
            });
        },

        updateItem: function(item) {
            return $.ajax({
                type: "PUT",
                url: "/items",
                data: item
            });
        },

        deleteItem: function(item) {
            return $.ajax({
                type: "DELETE",
                url: "/items",
                data: item
            });
        },
    };
    alert(myController.loadData());
    $("#jsGrid").jsGrid({
        width: "100%",
        height: "400px",

        inserting: true,
        editing: true,
        sorting: true,
        paging: true,

        controller:myController,
        // data: clients,

        fields: [
            {name: "skillId", type: "number", width: 50},
            {name: "skillName", type: "text", width: 50},
            {name: "skillScore", type: "number", width: 3},
            {name: "skillShow", type: "number",width:1},
            {type: "control"}
        ]
    });
</script>
</body>
</html>