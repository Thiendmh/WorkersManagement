<%-- 
    Document   : carts_view
    Created on : Apr 23, 2016, 5:43:31 PM
    Author     : dinhd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart View</title>
    </head>
    <body>
        <h1>Cart Details</h1>
        <c:set var="carts" value="${sessionScope.login}"/>
        <c:forEach var="c" items="${carts}">
            ${c.jobId}
        </c:forEach>
    </body>
</html>
