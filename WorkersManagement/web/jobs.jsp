<%@include file="Layout/_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

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
        INSERT INTO tblJobs(jName,categoryId,price,active) 
        VALUES (?,?,?,?)
        <sql:param value="${param.txtName}"/>
        <sql:param value="${param.categoryId}"/>
        <sql:param value="${param.txtPrice}"/>               
        <sql:param value="${param.rdoActive}"/>
    </sql:update>
</c:if>

<c:if test="${param.action == 'delete'}">
    <sql:update dataSource="${sqlSource}" var="countDel">
        DELETE FROM tblJobs WHERE jobId = ?
        <sql:param value="${param.id}"/>
    </sql:update>
</c:if>

<c:if test="${param.action == 'update'}">
    <sql:update dataSource="${sqlSource}" var="countAdd">
        UPDATE tblJobs SET categoryId=?,jName=?,price=?,active=? WHERE jobId = ${param.id}
        <sql:param value="${param.categoryId}"/>
        <sql:param value="${param.txtName}"/>
        <sql:param value="${param.txtPrice}"/>              
        <sql:param value="${param.rdoActive}"/>
    </sql:update>
</c:if>

<sql:query dataSource="${sqlSource}" var="selectAll">
    SELECT jobId,jName,cName,price,tblJobs.active
    FROM tblJobs
    INNER JOIN tblCategories
    ON tblJobs.categoryId = tblCategories.categoryId
</sql:query>    
    
<div class="tables">
    <h3 class="title1">Jobs Management!</h3>                        

    <div class="bs-example widget-shadow" data-example-id="contextual-table"> 
        <h4><a href="jobs_add.jsp">Add New Job</a></h4>

        <table class="table">
            <tr>
                <th>ID</th>
                <th>Category</th>
                <th>Name</th>
                <th>Price</th>              
                <th>Active</th>
                <th>Delete</th>
                <th>Update</th>
            </tr>
            <c:forEach var="j" items="${selectAll.rows}">
                <tr>
                    <td>${j.jobId}</td>
                    <td>${j.cName}</td>
                    <td>${j.jName}</td>                  
                    <td>${j.price}</td>
                    <td>${j.active}</td>
                    <td><a onclick="confirmGo('Sure to delete this record?', 'jobs.jsp?action=delete&id=${j.jobId}')" href="#">delete</a></td>
                    <td><a href="jobs_update.jsp?id=${j.jobId}">update</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>



<%@include file="Layout/_footer.jsp" %>

