<%-- 
    Document   : WorkersinJob
    Created on : May 5, 2016, 5:54:00 PM
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
        <h1>Worker Free!</h1>
        <form action="OrderMgmtServlet?action=addWIJ" method="post">
        <table border="1">
            <tr>
                <th>Worker ID</th>
                <th>Worker Name</th>
                <th>Tel</th>
                <th>Address</th>
                <th>Email</th>
                <th>About</th>
                <th>Order</th>
            </tr>
            <c:forEach var="w" items="${sessionScope.workers}">
                <tr>
                    <td>${w.workerId}</td>
                    <td>${w.workerName}</td>
                    <td>${w.tel}</td>
                    <td>${w.addr}</td>
                    <td>${w.email}</td>
                    <td>${w.about}</td>
                    <td><input type="checkbox" name="selectedItems" value="${w.workerId}"/></td>
                </tr>
            </c:forEach>
                    
        </table>
        <input type="submit" value="xong"/>
        </form>
    </body>
</html>
