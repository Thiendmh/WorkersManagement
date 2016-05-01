<%@include file="Layout/_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script>
    function confirmGo(m, u) {
        if (confirm(m)) {
            window.location = u;
        }
    }
</script>   

<sql:setDataSource var="sqlSource"
                   driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url="jdbc:sqlserver://localhost:1433;databaseName=Workers"
                   user="sa" password="123456"
                   scope="session"/>

<c:if test="${param.action == 'add'}">
    <sql:update dataSource="${sqlSource}" var="countAdd">
        INSERT INTO tblWorkers(categoryId,wName,dob,tel,addr,email,about,active) 
        VALUES (?,?,?,?,?,?,?,?)
        <sql:param value="${param.categoryId}"/>
        <sql:param value="${param.txtName}"/>
        <sql:param value="${param.txtDOB}"/>
        <sql:param value="${param.txtTel}"/>
        <sql:param value="${param.txtAddress}"/>
        <sql:param value="${param.txtEmail}"/>
        <sql:param value="${param.txtAbout}"/>
        <sql:param value="${param.rdoActive}"/>
    </sql:update>
</c:if>

<c:if test="${param.action == 'delete'}">
    <sql:update dataSource="${sqlSource}" var="countDel">
        DELETE FROM tblWorkers WHERE workerId = ?
        <sql:param value="${param.id}"/>
    </sql:update>
</c:if>

<c:if test="${param.action == 'update'}">
    <sql:update dataSource="${sqlSource}" var="countAdd">
        UPDATE tblWorkers SET categoryId=?,wName=?,dob=?,tel=?,addr=?,email=?,about=?,active=? WHERE workerId = ${param.id}
        <sql:param value="${param.categoryId}"/>
        <sql:param value="${param.txtName}"/>
        <sql:param value="${param.txtDOB}"/>
        <sql:param value="${param.txtTel}"/>
        <sql:param value="${param.txtAddress}"/>
        <sql:param value="${param.txtEmail}"/>
        <sql:param value="${param.txtAbout}"/>
        <sql:param value="${param.rdoActive}"/>
    </sql:update>
</c:if>

<sql:query dataSource="${sqlSource}" var="selectAll">
    SELECT workerId,cName,wName,dob,tel,addr,email,about,tblWorkers.active
    FROM tblWorkers
    INNER JOIN tblCategories
    ON tblWorkers.categoryId = tblCategories.categoryId
</sql:query>       

<div class="tables">
    <h3 class="title1">Workers Management</h3>                        

    <div class="bs-example widget-shadow" data-example-id="contextual-table"> 
        <h4><a href="workers_add.jsp">Add New Worker</a></h4>

        <table class="table">
            <tr>
                <th>ID</th>
                <th>Category</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Tel</th>
                <th>Address</th>
                <th>Email</th>
                <th>About</th>
                <th>Active</th>
                <th>Delete</th>
                <th>Update</th>
            </tr>
            <c:forEach var="w" items="${selectAll.rows}">
                <tr>
                    <td>${w.workerId}</td>
                    <td>${w.cName}</td>
                    <td>${w.wName}</td>
                    <td>
                        <f:formatDate pattern="dd/MM/yyyy" value="${w.dob}" />
                    </td>
                    <td>${w.tel}</td>
                    <td>${w.addr}</td>
                    <td>${w.email}</td>
                    <td>${w.about}</td>
                    <td>${w.active}</td>
                    <td><a onclick="confirmGo('Sure to delete this record?', 'workers.jsp?action=delete&id=${w.workerId}')" href="#">delete</a></td>
                    <td><a href="workers_update.jsp?id=${w.workerId}">update</a></td>
                </tr>
            </c:forEach>
        </table>

    </div>
</div>
<%@include file="Layout/_footer.jsp" %>
