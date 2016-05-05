<%-- 
    Document   : OrderDetails
    Created on : May 4, 2016, 8:37:35 AM
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
        <h1>Order Details!</h1>
        <table border="1">
            <tr>
                <th>Oder Details ID</th>
                <th>Job Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Quantity</th>
                <th>View Details Order</th>
                <th>Status</th>
            </tr>
            <c:forEach var="od" items="${sessionScope.orderDetails}">
                <tr>
                    <td>${od.orderId}</td>
                    <td>${od.jobName}</td>
                    <td><fmt:formatDate type="both" pattern="dd-MM-yyyy"
                                    value="${od.stDate}" /></td>
                    <td><fmt:formatDate type="both" pattern="dd-MM-yyyy"
                                    value="${od.endDate}" /></td>
                    <td>${od.quantity}</td>
                    <td><a href="OrderMgmtServlet?action=workerFreeTime&odId=${od.odId}&jobId=${od.jobId}&stDate=${od.stDate}&endDate=${od.endDate}">Xu ly</a></td>
                    <c:choose>
                        <c:when test="${od.active == 0}">
                            <td>Chua xu ly</td>
                        </c:when>
                        <c:otherwise>
                            <td>Xong</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
