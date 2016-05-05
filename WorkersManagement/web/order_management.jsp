<%@include file="Layout/_header.jsp" %>
<div class="tables">

    <div class="bs-example widget-shadow" data-example-id="contextual-table"> 
        <h4>Orders List</h4>
        <table class="table">
            <tr>
                <th>Oder ID</th>
                <th>Username</th>
                <th>Order Date</th>
                <th>View Details Order</th>
            </tr>
            <c:forEach var="o" items="${sessionScope.orders}">
                <c:if test="${o.active == 0}" >
                    <tr>
                        <td>${o.oderId}</td>
                        <td>${o.userName}</td>
                        <td><fmt:formatDate type="both" pattern="dd-MM-yyyy"
                                        value="${o.orderDate}" /></td>
                        <td><a href="OrderMgmtServlet?action=viewOrderDetails&orderId=${o.oderId}">Details</a></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
 </div>
</div>

<%@include file="Layout/_footer.jsp" %>  
