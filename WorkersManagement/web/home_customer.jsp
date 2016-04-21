<%-- 
    Document   : home_customer
    Created on : Apr 18, 2016, 7:36:51 AM
    Author     : dinhd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home_customer</title>
    </head>
    <body>
        <sql:setDataSource var="sqlSource"
                           driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url="jdbc:sqlserver://localhost:1433;databaseName=Workers"
                           user="sa" password="123456"
                           scope="session"/>
        
        <sql:query dataSource="${sqlSource}" var="categories">
            SELECT * FROM tblCategories 
        </sql:query>            
         
        <h1>List Categories</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
            <c:forEach var="c" items="${categories.rows}">
                <tr>
                    <td><a href="order.jsp?categoryId=${c.categoryId}&cName=${c.cName}">${c.categoryId}</a></td>
                    <td><a href="order.jsp?categoryId=${c.categoryId}&cName=${c.cName}">${c.cName}</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
