<%@include file="Layout/_header_customer.jsp" %>
<div class="tables">

    <div class="bs-example widget-shadow" data-example-id="contextual-table"> 
        <h4>Cart Details</h4>
        <form action="CartServlet?action=approve" method="POST">
            <table class="table">
                <tr>
                    <th>No</th>
                    <th>Job Name</th>
                    <th>Category Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                    <th>Delete</th>
                </tr>
                <c:set var="carts" value="${sessionScope.login.cart}"/>
                <c:set var="index" value="0"/>
                <c:set var="total" value="0"/>
                <c:forEach var="c" items="${carts}">                    
                    <tr>
                        <td>${index+1}</td>
                        <td>${c.jName}</td>
                        <td>${c.cName}</td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${c.startDate}"/></td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${c.endDate}"/></td>
                        <td>${c.quantity}</td>
                        <td>${c.price}</td>
                        <td>${c.quantity*c.price}</td>
                        <td><a href="CartServlet?action=delete&index=${index}">Delete</a></td>
                    </tr>     
                    <c:set var="index" value="${index+1}"/>
                    <c:set var="total" value="${total + c.quantity*c.price}"/>
                </c:forEach>
            </table>
            <h4>SumTotal: ${total}</h4>
            <input type="submit" value="Approve" class="btn btn-primary"/>
        </form>
        <br>
    </div>
</div>

<%@include file="Layout/_footer.jsp" %>

