<%-- 
    Document   : error
    Created on : Apr 18, 2016, 7:10:37 AM
    Author     : dinhd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>error</title>
    </head>
    <body>
        <%
            String error = request.getAttribute("error").toString();
        %>
        <h1><%=error%></h1>
    </body>
</html>
