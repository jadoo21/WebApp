<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>

        <script>
            function show(){
                alert('Account created Successfully!!');
            }
        </script>

        <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel = "stylesheet" type = "text/css" href = "${pageContext.request.contextPath}/css/auth.css">
    </head>
    <body>

        <h1 style = "text-align: center ;margin: auto; padding: 50px">RemindMe</h1>

        <div class="container">
            <center>
            <h2 style="padding: 20px"><%= "Login"%></h2>

            <%
                String error = "";
                if(request.getAttribute("error")!=null)
                    error = "Error: "+ (String) request.getAttribute("error");
            %>
            <h5><%=error%></h5>

                <form method = "post" action = "${pageContext.request.contextPath}/login">
                    <input class = "input" name = "email" type = "text" placeholder="Email/Username"><br><br>
                    <input class = "input" name = "password" type = "password" placeholder="Password"><br><br>
                    <input type = "submit" class = "authButton" value = "Login"><br><br>
                </form>

                Not a member?
                <a href = "${pageContext.request.contextPath}/html/signUp.jsp">SignUp</a><br><br>
            </center>
        </div>

        <%
            if(request.getAttribute("success")!=null){
        %>
                <script>
                    show();
                </script>
        <%
            }
        %>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>