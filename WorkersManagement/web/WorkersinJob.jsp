<%@include file="Layout/_header.jsp" %>
<div class="tables">

    <div class="bs-example widget-shadow" data-example-id="contextual-table"> 
        <h4>Assign Workers</h4>
        <form action="OrderMgmtServlet?action=addWIJ" method="post">
        <table class="table">
            <tr>
                <th>Worker ID</th>
                <th>Worker Name</th>
                <th>Tel</th>
                <th>Address</th>
                <th>Email</th>
                <th>About</th>
                <th>Assign</th>
            </tr>
            <c:forEach var="w" items="${sessionScope.workers}">
                <tr>
                    <td>${w.workerId}</td>
                    <td>${w.workerName}</td>
                    <td>${w.tel}</td>
                    <td>${w.addr}</td>
                    <td>${w.email}</td>
                    <td>${w.about}</td>
                    <td><input type="checkbox" name="selectedItems" value="${w.workerId}"/></td>
                </tr>
            </c:forEach>
                    
        </table>
            <input type="submit" value="Apply" class="btn btn-primary"/>
            <br><br>
            
        </form>
 </div>
</div>

<%@include file="Layout/_footer.jsp" %>   
