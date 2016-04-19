<%-- 
    Document   : login
    Created on : Apr 18, 2016, 6:06:32 AM
    Author     : dinhd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="LoginServlet?action=login" method="POST">
            Name<input type="text" name="txtUsername"/>
            Password<input type="text" name="txtPwd"/>
            <button>Login</button>
        </form>
        <a href="register.jsp">Register</a>
        <a href="logout.jsp">Logout</a>
    </body>
</html>
