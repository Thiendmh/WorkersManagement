<%@include file="Layout/_header.jsp" %>

<sql:setDataSource var="sqlSource"
                   driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url="jdbc:sqlserver://localhost:1433;databaseName=Workers"
                   user="sa" password="123456"
                   scope="session"/>

<sql:query dataSource="${sqlSource}" var="categories">
    SELECT * FROM tblCategories           
</sql:query> 

<div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
    <div class="form-title">
        <h4><a href="jobs_add.jsp">Add New Job</a></h4>
    </div>
    <div class="form-body">
        <form action="jobs.jsp?action=add" method="POST">
            <table class="table">
                <tr>
                    <th>Categories</th> 
                    <td>
                        <select name="categoryId" class="col-md-4">
                            <c:forEach var="c" items="${categories.rows}">
                                <option value="${c.categoryId}">${c.cName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="txtName" class="col-md-4"/></td>
                </tr>               
                <tr>
                    <th>Price</th>
                    <td><input type="text" name="txtPrice" class="col-md-4"/></td>
                </tr>
                <tr>
                    <th>Active</th>
                    <td>
                        Active <input type="radio" name="rdoActive" value=true checked="checked" />
                        Not Active <input type="radio" name="rdoActive" value=false />
                    </td>
                </tr>                          
            </table>
            <button class="btn btn-primary" type="submit">Add</button>
        </form>
    </div>
</div>
    
<%@include file="Layout/_footer.jsp" %>
