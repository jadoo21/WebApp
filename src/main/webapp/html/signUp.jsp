<%--
  Created by IntelliJ IDEA.
  User: risha
  Date: 03-02-2021
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SignUp Page</title>

        <script>
            function show(){
                alert('Error');
            }
        </script>

        <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel = "stylesheet" type = "text/css" href = "${pageContext.request.contextPath}/css/auth.css">
    </head>
    <body>

    <div class="container" style="margin-top: 50px">
        <center>
            <h2 style="padding: 20px"><%= "Sign Up"%></h2>

            <%
                String error = "";
                if(request.getAttribute("error")!=null)
                    error = "Error: "+(String) request.getAttribute("error");
            %>
            <h5><%=error%></h5>

            <form name = "signUp" method = "post" action = "${pageContext.request.contextPath}/signup">
                <input class = "input" name = "username" type = "text" placeholder="Username"><br><br>
                <input class = "input" name = "phoneno" type = "text" placeholder="Mobile Number"><br><br>
                <input class = "input" name = "email" type = "text" placeholder="Email Address"><br><br>
                <input class = "input" name = "pwd" type = "password" placeholder="Password"><br><br>
                <input class = "input" name = "cnfrm_pwd" type = "password" placeholder="Confirm Password"><br><br>
                <input type = "submit" class = "authButton" value = "Submit"><br><br>
            </form>

            Already a member?
            <a href = "${pageContext.request.contextPath}/index.jsp">Login</a><br><br>
        </center>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
