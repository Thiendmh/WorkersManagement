<%-- 
    Document   : users.jsp
    Created on : May 5, 2016, 3:03:41 PM
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
        <h1>User list!</h1>
        <table border="1">
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Role</th>
                <th>Name</th>
                <th>Tel</th>
                <th>Email</th>
                <th>Status</th>
                <th>Active</th>
                <th>Decactive</th>
            </tr>
            <c:forEach var="u" items="${sessionScope.users}">
                <tr>
                    <td>${u.userId}</td>
                    <td>${u.userName}</td>
                    <c:choose>
                        <c:when test="${u.roleId == 1}">
                            <td>Admin</td>
                        </c:when>
                        <c:otherwise>
                            <td>Customer</td>
                        </c:otherwise>
                    </c:choose>
                    <td>${u.name}</td>
                    <td>${u.tel}</td>
                    <td>${u.email}</td>
                    <c:choose>
                        <c:when test="${u.active == 1}">
                            <td>Active</td>
                        </c:when>
                        <c:otherwise>
                            <td>Deactive</td>
                        </c:otherwise>
                    </c:choose>
                    <td><a href="ReisterServlet?action=changeActive&userId=${u.userId}&active=1">Active</a></td>
                    <td><a href="ReisterServlet?action=changeActive&userId=${u.userId}&active=0">Deactive</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
