<%-- 
    Document   : workers_add
    Created on : Apr 18, 2016, 5:05:01 PM
    Author     : dinhd
--%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jobs_add</title>
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

        <h1>Add New Job</h1>
        <form action="jobs.jsp?action=add" method="POST">
            <table>
                <tr>
                    <th>Categories</th> 
                    <td>
                        <select name="categoryId">
                            <c:forEach var="c" items="${categories.rows}">
                                <option value="${c.categoryId}">${c.cName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="txtName"/></td>
                </tr>               
                <tr>
                    <th>Price</th>
                    <td><input type="text" name="txtPrice"/></td>
                </tr>
                <tr>
                    <th>Active</th>
                    <td>
                        Active <input type="radio" name="rdoActive" value=true checked="checked" />
                        Not Active <input type="radio" name="rdoActive" value=false />
                    </td>
                </tr>                          
            </table>
            <input type="submit" value="Add" />
        </form>
    </body>
</html>
