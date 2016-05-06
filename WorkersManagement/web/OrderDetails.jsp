<%@include file="Layout/_header.jsp" %>
<div class="tables">

    <div class="bs-example widget-shadow" data-example-id="contextual-table"> 
        <h4>Order Details!</h4>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Job Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Quantity</th>
                <th>Process</th>
                <th>Status</th>
            </tr>
            <c:forEach var="od" items="${sessionScope.orderDetails}">
                <tr>
                    <td>${od.orderId}</td>
                    <td>${od.jobName}</td>
                    <td><fmt:formatDate type="both" pattern="dd-MM-yyyy"
                                    value="${od.stDate}" /></td>
                    <td><fmt:formatDate type="both" pattern="dd-MM-yyyy"
                                    value="${od.endDate}" /></td>
                    <td>${od.quantity}</td>
                    <td><a href="OrderMgmtServlet?action=workerFreeTime&odId=${od.odId}&jobId=${od.jobId}&stDate=${od.stDate}&endDate=${od.endDate}">Assign Workers</a></td>
                    <c:choose>
                        <c:when test="${od.active == 0}">
                            <td>Not Assign</td>
                        </c:when>
                        <c:otherwise>
                            <td>Done</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
 </div>
</div>

<%@include file="Layout/_footer.jsp" %>  
