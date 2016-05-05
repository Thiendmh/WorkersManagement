<%@include file="Layout/_header.jsp" %>
<div class="tables">

    <div class="bs-example widget-shadow" data-example-id="contextual-table"> 
        <h4>Users List</h4>

        <table class="table">
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Role</th>
                <th>Name</th>
                <th>Tel</th>
                <th>Email</th>
                <th>Status</th>
                <th>Active</th>
                <th>Deactive</th>
            </tr>
            <c:forEach var="u" items="${sessionScope.users}">
                <tr>
                    <td>${u.userId}</td>
                    <td>${u.userName}</td>
                    <c:choose>
                        <c:when test="${u.roleId == 1}">
                            <td>Admin</td>
                        </c:when>
                        <c:otherwise>
                            <td>Customer</td>
                        </c:otherwise>
                    </c:choose>
                    <td>${u.name}</td>
                    <td>${u.tel}</td>
                    <td>${u.email}</td>
                    <c:choose>
                        <c:when test="${u.active == 1}">
                            <td>Active</td>
                        </c:when>
                        <c:otherwise>
                            <td>Deactive</td>
                        </c:otherwise>
                    </c:choose>
                    <td><a href="ReisterServlet?action=changeActive&userId=${u.userId}&active=1">Active</a></td>
                    <td><a href="ReisterServlet?action=changeActive&userId=${u.userId}&active=0">Deactive</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<%@include file="Layout/_footer.jsp" %>
