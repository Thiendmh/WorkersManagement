<%-- 
    Document   : order_management
    Created on : Apr 30, 2016, 10:59:41 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Order List!</h1>
        <table border="1">
            <tr>
                <th>Oder ID</th>
                <th>Username</th>
                <th>Order Date</th>
                <th>View Details Order</th>
            </tr>
            <c:forEach var="o" items="${sessionScope.orders}">
                <c:if test="${o.active == 0}" >
                    <tr>
                        <td>${o.oderId}</td>
                        <td>${o.userName}</td>
                        <td><fmt:formatDate type="both" pattern="dd-MM-yyyy"
                                        value="${o.orderDate}" /></td>
                        <td><a href="OrderMgmtServlet?action=viewOrderDetails&orderId=${o.oderId}">Details</a></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </body>
</html>
