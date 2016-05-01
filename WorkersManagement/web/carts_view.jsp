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
        <form action="CartServlet?action=approve" method="POST">
            <table border="1">
                <tr>
                    <th>No</th>
                    <th>Job Name</th>
                    <th>Category Name</th>
                    <th>startDate</th>
                    <th>endDate</th>
                    <th>quantity</th>
                    <th>price</th>
                    <th>total</th>
                    <th>Delete</th>
                </tr>
                <c:set var="carts" value="${sessionScope.login.cart}"/>
                <c:set var="index" value="0"/>
                <c:set var="total" value="0"/>
                <c:forEach var="c" items="${carts}">                    
                    <tr>
                        <td>${index+1}</td>
                        <td>${c.jName}</td>
                        <td>${c.cName}</td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${c.startDate}"/></td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${c.endDate}"/></td>
                        <td>${c.quantity}</td>
                        <td>${c.price}</td>
                        <td>${c.quantity*c.price}</td>
                        <td><a href="CartServlet?action=delete&index=${index}">Delete</a></td>
                    </tr>     
                    <c:set var="index" value="${index+1}"/>
                    <c:set var="total" value="${total + c.quantity*c.price}"/>
                </c:forEach>
            </table>
            <h4>SumTotal: ${total}</h4>
            <input type="submit" value="Approve" />
        </form>
    </body>
</html>
