<%@include file="Layout/_header.jsp" %>
<sql:setDataSource var="sqlSource"
                   driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url="jdbc:sqlserver://localhost:1433;databaseName=Workers"
                   user="sa" password="123456"
                   scope="session"/>

<sql:query dataSource="${sqlSource}" var="workers">
    SELECT * FROM tblWorkers WHERE workerId = ${param.id}
</sql:query>

<sql:query dataSource="${sqlSource}" var="categories">
    SELECT * FROM tblCategories           
</sql:query> 

<div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
    <div class="form-title">
        <h4>Update Worker</h4>
    </div>
    <div class="form-body">
        <c:forEach var="w" items="${workers.rows}">
            <form action="workers.jsp?action=update&id=${param.id}" method="POST">
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
                                            <c:if test="${c.categoryId == w.categoryId}">
                                                selected
                                            </c:if>
                                            >${c.cName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td><input type="text" name="txtName" value="${w.wName}" /></td>
                    </tr>
                    <tr>
                        <th>DOB</th>
                        <td><input type="text" name="txtDOB" value="${w.dob}"/></td>
                    </tr>
                    <tr>
                        <th>Tel</th>
                        <td><input type="text" name="txtTel" value="${w.tel}"/></td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td><input type="text" name="txtAddress" value="${w.addr}"/></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><input type="text" name="txtEmail" value="${w.email}"/></td>
                    </tr>
                    <tr>
                        <th>About</th>
                        <td><input type="text" name="txtAbout" value="${w.about}"/></td>
                    </tr>
                    <tr>
                        <th>Active</th>
                        <td>
                            <c:choose>
                                <c:when test="${w.active==true}">
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
