<%@include file="Layout/_header_customer.jsp" %>

<sql:setDataSource var="sqlSource"
                   driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url="jdbc:sqlserver://localhost:1433;databaseName=Workers"
                   user="sa" password="123456"
                   scope="session"/>

<sql:query dataSource="${sqlSource}" var="jobs">
    SELECT * FROM tblJobs WHERE categoryId = ${param.categoryId} and active = 1
</sql:query>            

<div class="tables">

    <div class="bs-example widget-shadow" data-example-id="contextual-table"> 
        <h4>Order Jobs from ${param.cName}</h4>
        <table class="table">
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
                <form action="CartServlet?action=viewall" method="POST">
                    <tr>
                        <td>${j.jobId}</td><input type="hidden" name="txtJobId" value="${j.jobId}"/>
                    <td>${j.jName}</td><input type="hidden" name="txtJName" value="${j.jName}"/>
                    <td>${j.price}</td><input type="hidden" name="txtPrice" value="${j.price}"/>                  
                    <td><input type="text" name="txtQuantity" /></td>
                    <td><input type="text" name="txtStartDate" /></td>
                    <td><input type="text" name="txtEndDate" /></td>
                    <td><button class="btn btn-info">Add to Cart</button></td>
                    </tr>
                </form>                 

            </c:forEach>
        </table>        
    </div>
</div>
<%@include file="Layout/_footer.jsp" %>
