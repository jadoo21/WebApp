<%--
  Created by IntelliJ IDEA.
  User: risha
  Date: 04-02-2021
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous">
    </script>

    <script src = "${pageContext.request.contextPath}/js/dash.js"></script>

    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel = "stylesheet" type = "text/css" href = "${pageContext.request.contextPath}/css/dash.css">
    <link rel = "stylesheet" type = "text/css" href = "${pageContext.request.contextPath}/css/dialog.css">
</head>
<body>
<%--  ---  ...Header... --- --%>
    <nav class = "navbar navbar-inverse">
        <div class = "container-fluid">

        <div style = "float: left; padding-top: 15px; padding-left: 10px">
        <button type = "button" onclick="openNav()">
            <span class = " glyphicon glyphicon-menu-hamburger"></span>
        </button>
        </div>

        <div class = "navbar-header" id = "heading">
            <a class = "navbar-brand" href = "#">Notifier</a>
        </div>

        <ul class = "nav navbar-nav" style="float: right">
            <li> <a href = "#add"> Add Notebook </a></li>
            <li> <a href = "#"><span class = "glyphicon glyphicon-bell"></span> </a></li>
            <li> <a href = "#"><span class = "glyphicon glyphicon-log-out"></span> Logout </a></li>
        </ul>
        </div>
    </nav>

<%--    Side Navigation Bar division here...--%>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <h1 class = "name">Hi!! User</h1>
        <ul style = " padding: 0; width: available; font-size: 2px"><li class = "divider" style="background-color: white;"></li></ul>
        <a href="#">Note Books</a>
        <a href="#">Notes</a>
        <a href="#">Edit Profile</a>
    </div>

<%--    Dialog of Adding Notebook...--%>

    <div class = "container dialog">
        <div class = "row dialog_content">
            <button class = "closeDialog" type = "button" style="float: right; font-weight: bolder"><span class="closebtn"></span> X</button>
            <h2>ADD NOTEBOOK</h2>
            <hr>
            <label for="name_notebook"><b>Notebook Name: </b></label><br>
            <input id = "name_notebook" placeholder="Enter Notebook Name..." style="width: 100%; padding: 5px"/><br><br>
            <center><button type = "button" style = "padding: 10px; font-weight: bolder; width: 60%" id = "button_dialog_notebook">ADD</button></center>
        </div>
    </div>

<%--    From here the main container starts... below header part...--%>

    <div id = "main" class = "container">
        <div style = "float: right; padding: 10px">
            <input id = "search_input" style = "padding: 5px; width: 200px; height: 30px" type = "text" placeholder="Search...">
            <button id = "search_button" style = "background-color: #2f7eb5; padding: 5px; height: 30px" type = "button">
                <span class = "glyphicon glyphicon-search"></span>
            </button>
        </div><br><br>
        <h1 style = "padding: 10px"> Notes</h1>
        <ul style=" margin: 0; font-size: 2px; width: available; background-color: black"><li class = "divider"></li></ul>
        <br><br>
        <h2 style = "text-align: center; margin: auto"> Not a single note available!! Add a one to visit here...</h2>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
