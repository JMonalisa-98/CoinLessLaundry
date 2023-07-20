<%@page import="com.org.model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.service.OrderServiceImple"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<% 
if(session.getAttribute("userId") != null) {
	String userId = (String)session.getAttribute("userId");
	if(userId.charAt(0) != 'A') {
	response.sendRedirect("index.jsp");
	}
} else {
	response.sendRedirect("index.jsp");
}
%>
<head>
<title>Admin | Orders</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="Images/logo.png">
</head>

<body style="background-color: rgb(255, 255, 255); height: 100%; width: 100%;">
	<div class="container">
		<jsp:include page="WEB-INF/views/adminHeader.jsp"></jsp:include>
		<label id="textMainNavi">Main Navigation</label>
		<div class="mainSideNav">
			<a href="adminHome.jsp"><i class="fas fa-tachometer-alt iconMainNavi"></i>Dashboard</a> 
			<a href="adminCustomers.jsp"><i class="fas fa-user iconMainNavi"></i>Customers</a>
			<a href="adminEmployee.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Employees</a> 
			<a href="adminOrders.jsp" class="active"><i class="fab fa-first-order iconMainNavi"></i>Orders</a> 
			<a href="adminServices.jsp"><i class="fas fa-tasks iconMainNavi"></i>Services</a>
			<a href="adminFeedback.jsp" ><i class="fas fa-comments iconMainNavi"></i>Feedback</a>
			<a href="adminContact.jsp"><i class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
	</div>
<!--Page Content Admin Customers-->
        <div class="PageContainerSmall" id="MainPageContainer">
            <div class="row">
                <label id="feedbackLabel">Orders</label>
            </div>
            <div class="row tablCus">
                <input type="text" name="search" id="myInput" onkeyup="myFunction()" placeholder="Search..">
                <i class="fas fa-search" id="searchIcon"></i>
                <a href=" " style="text-decoration: none;"><button class="btn btn-success" id="btnRefresh"><i class="fas fa-sync-alt" id="refreshIcon"></i>    Refresh</button></a>
                </button>
                <table class="table table-responsive table-bordered" cellpadding="0" id="tableCustomerDetails">
                    <tr>
                        <th>Order Id</th>
                        <th>Customer Id</th>
                        <th>Date</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                        <th>Operations</th>
                    </tr>
                    <%
				OrderServiceImple orderServiceImple = new OrderServiceImple();
				ArrayList<Order> orderList =  orderServiceImple.getOrders();
				
				for(Order order : orderList){ %>
                    <tr>
                        <td><%=order.getOrderId() %></td>
                        <td><%=order.getCustomerId() %></td>
                        <td><%=order.getDate() %></td>
                        <td><%=order.getTotal() %></td>
                        <td><%=order.getStatus() %></td>
                        <td><form action="#"><input name="orderId" value="<%=order.getOrderId()%>" hidden><button type="submit" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#viewProfile" id="viewOrder"><i class="fas fa-eye"></i></button>
                        <button type="submit" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal" id="update"><i class="far fa-edit"></i></button></form></td>
                    </tr>
                    <%} %>
                </table>
            </div>
            
            <%String selOrder = request.getParameter("orderId");
            Order selectedOrder = orderServiceImple.getOrderById(selOrder);
            %>

            <!--Moodal for Update Status-->
            <div class="modal fade" id="myModal" role="form">
                <div class="modal-dialog modal-dialog-centered">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <label class="modal-title">Update Status</label>
                            <button type="button" id="bnClose" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form class="modalUpd" action="UpdateStatusOrder" method="post">
                            <input value="<%=selOrder%>" name="orderID" hidden>
                                <div class="form-row">
                                    <div class="col form-group">
                                        <label for="inputPosition">Status</label>
                                        <select id="inputPosition" class="form-control" name="status" required>
                                            <option selected value="">Choose...</option>
                                            <option value="Processing">Processing</option>
                                            <option value="On Delivery">On Delivery</option>
                                            <option value="Completed">Completed</option>
                                            <option value="Canselled">Cancelled</option>
                                        </select>
                                    </div>
                                    <!-- form-group end.// -->
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Update Status</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--Moodal for View Order-->
            <div class="modal fade" id="viewProfile" role="dialog">
                <div class="modal-dialog modal-dialog-centered">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Order - <%=selOrder %></h4>
                            <button type="button" class="close" id="bnClose" style="outline: none;" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="row d-flex justify-content-center">
                                <img src="Images/order.jpg" id="viewProPic">
                            </div>
                            <div class="row profileDetails">
                                <div class="col-lg-12">
                                    <label class="tagPro"><i class="fas fa-shopping-cart"></i> Order Id : </label>
                                    <label class="dataPro"><%=selectedOrder.getOrderId() %></label>
                                </div>
                                <div class="col-lg-12">
                                    <label class="tagPro"><i class="fas fa-shopping-cart"></i> Customer Id :  </label>
                                    <label class="dataPro"><%=selectedOrder.getCustomerId() %></label>
                                </div>
                                <div class="col-lg-12">
                                    <label class="tagPro"><i class="fas fa-shopping-cart"></i> Description : </label>
                                    <label class="dataPro"><%=selectedOrder.getDescription() %></label>
                                </div>
                                <div class="col-lg-12">
                                    <label class="tagPro"><i class="fas fa-shopping-cart"></i> Price : </label>
                                    <label class="dataPro"><%=selectedOrder.getTotal() %></label>
                                </div>
                                <div class="col-lg-12">
                                    <label class="tagPro"><i class="fas fa-shopping-cart"></i> Order Date : </label>
                                    <label class="dataPro"><%=selectedOrder.getDate() %></label>
                                </div>
                                <div class="col-lg-12">
                                    <label class="tagPro"><i class="fas fa-shopping-cart"></i> Status : </label>
                                    <label class="dataPro"><%=selectedOrder.getStatus()%></label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <p class="text-sm coprRight">&copy; 2023 CoinLessLaundry Admin</p>
                                <div class="btn btn-danger" class="close" data-dismiss="modal">Close</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="WEB-INF/views/adminFooter.jsp"></jsp:include>
	</div>
</body>
</html>