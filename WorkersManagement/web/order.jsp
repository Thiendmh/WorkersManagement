<%-- 
    Document   : order
    Created on : Apr 21, 2016, 10:54:19 AM
    Author     : Thiendmh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>orders</title>
    </head>
    <body>
        
        <sql:setDataSource var="sqlSource"
                           driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url="jdbc:sqlserver://localhost:1433;databaseName=Workers"
                           user="sa" password="123456"
                           scope="session"/>
        
        <sql:query dataSource="${sqlSource}" var="jobs">
            SELECT * FROM tblJobs WHERE categoryId = ${param.categoryId} and active = 1
        </sql:query>            
        
        <h1>Order Jobs from ${param.cName}</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>              
                <th>Quantity</th>              
                <th>Start Date</th>
                <th>End Date</th>
                <th>Cart</th>
            </tr>
            <c:forEach var="j" items="${jobs.rows}">
                <tr>
                    <td>${j.jobId}</td>
                    <td>${j.jName}</td>
                    <td>${j.price}</td>                  
                    <td><input type="text" name="txtQuantity" /></td>
                    <td><input type="text" name="txtStartDate" /></td>
                    <td><input type="text" name="txtEndDate" /></td>
                    <td><a href="jobs.jsp?action=delete&id=${j.jobId}">Add to Cart</a></td>
                </tr>
            </c:forEach>
        </table>        
    </body>
</html>
