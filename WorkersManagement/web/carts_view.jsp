<%-- 
    Document   : carts_view
    Created on : Apr 23, 2016, 5:43:31 PM
    Author     : dinhd
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <form action="" method="POST">
            <table border="1">
                <tr>
                    <th>orderId</th>
                    <th>jobId</th>
                    <th>startDate</th>
                    <th>endDate</th>
                    <th>quantity</th>
                    <th>Delete</th>
                </tr>
                <c:set var="carts" value="${sessionScope.login.cart}"/>
                <c:forEach var="c" items="${carts}">
                    <tr>
                        <td>${c.orderId}</td>
                        <td>${c.jobId}</td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${c.startDate}"/></td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${c.endDate}"/></td>
                        <td>${c.quantity}</td>
                        <td><a href="CartServlet?action=delete&jobId=${c.jobId}">Delete</a></td>
                    </tr>                    
                </c:forEach>
            </table>
        </form>
    </body>
</html>
