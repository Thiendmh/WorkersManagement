<%@include file="Layout/_header.jsp" %>

<sql:setDataSource var="sqlSource"
                   driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url="jdbc:sqlserver://localhost:1433;databaseName=Workers"
                   user="sa" password="123456"
                   scope="session"/>

<sql:query dataSource="${sqlSource}" var="jobs">
    SELECT * FROM tblJobs WHERE jobId = ${param.id}
</sql:query>

<sql:query dataSource="${sqlSource}" var="categories">
    SELECT * FROM tblCategories           
</sql:query> 

<div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
    <div class="form-title">
        <h4>Update Job</h4>
    </div>
    <div class="form-body">
        <c:forEach var="j" items="${jobs.rows}">
            <form action="jobs.jsp?action=update&id=${param.id}" method="POST">
                <table class="table">               
                    <tr>
                        <th>ID</th>
                        <th>${param.id}</th>
                    </tr>
                    <tr>
                        <th>Categories</th>
                        <td>
                            <select name="categoryId">
                                <c:forEach var="c" items="${categories.rows}">
                                    <option value="${c.categoryId}"
                                            <c:if test="${c.categoryId == j.categoryId}">
                                                selected
                                            </c:if>
                                            >${c.cName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td><input type="text" name="txtName" value="${j.jName}" /></td>
                    </tr>                   
                    <tr>
                        <th>Price</th>
                        <td><input type="text" name="txtPrice" value="${j.price}"/></td>
                    </tr>
                    <tr>
                        <th>Active</th>
                        <td>
                            <c:choose>
                                <c:when test="${j.active==true}">
                                    Active <input type="radio" name="rdoActive" value=true checked="checked" />
                                    Not Active <input type="radio" name="rdoActive" value=false />
                                </c:when>
                                <c:otherwise>
                                    Active <input type="radio" name="rdoActive" value=true />
                                    Not Active <input type="radio" name="rdoActive" value=false checked="checked" />
                                </c:otherwise>
                            </c:choose>                            
                        </td>
                    </tr>                          
                </table>
                <button class="btn btn-primary" type="submit">Update</button>
            </form>
        </c:forEach>
    </div>
</div>

<%@include file="Layout/_footer.jsp" %>


