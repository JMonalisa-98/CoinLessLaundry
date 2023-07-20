<%@page import="com.org.service.LaundryServicesImple"%>
<%@page import="com.org.model.Feedback"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.service.FeedbackServiceImple"%>
<%@page import="com.org.service.FeedbackService"%>
<%@page import="com.org.service.EmployeeServiceImple"%>
<%@page import="com.org.service.CustomerServiceImple"%>
<%@page import="com.org.service.UserServiceImple"%>
<%@page import="com.org.util.ConnectDB"%>
<%@page import="com.org.util.CommonConstants"%>
<%@page import="com.org.util.QueryUtil"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
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
<html>
<head>
<title>Admin | Feedback</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="Images/logo.png">
</head>

<body
	style="background-color: rgb(255, 255, 255); height: 100%; width: 100%;">
	<div class="container">
		<jsp:include page="WEB-INF/views/adminHeader.jsp"></jsp:include>
		<label id="textMainNavi">Main Navigation</label>
		<div class="mainSideNav">
			<a href="adminHome.jsp"><i class="fas fa-tachometer-alt iconMainNavi"></i>Dashboard</a> 
			<a href="adminCustomers.jsp"><i class="fas fa-user iconMainNavi"></i>Customers</a>
			<a href="adminEmployee.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Employees</a> 
			<a href="adminOrders.jsp"><i class="fab fa-first-order iconMainNavi"></i>Orders</a> 
			<a href="adminServices.jsp"><i class="fas fa-tasks iconMainNavi"></i>Services</a>
			<a href="adminFeedback.jsp" class="active"><i class="fas fa-comments iconMainNavi"></i>Feedback</a>
			<a href="adminContact.jsp"><i class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
	</div>

	<!--Page Content-->
	<div class="PageContainerSmall" id="MainPageContainer">

		<div class="row">
			<label id="feedbackLabel">Feedback Hub</label>
		</div>
		<!--FeedBack-->
		<div class="row" id="feedBackAna">
			<input type="text" name="search" id="myInput" onkeyup="myFunction()"
				placeholder="Search.."> <i class="fas fa-search"
				id="searchIcon"></i>
				
			<table class="table table-responsive table-bordered feedbackTa" id="tableCustomerDetails">
				<tr>
					<th>FeedBack Id</th>
					<th>Customer Id</th>
					<th>FeedBack</th>
					<th>Date</th>
				</tr>

				<%
				FeedbackService feedbackService = new FeedbackServiceImple();
				ArrayList<Feedback> feedbackList =  feedbackService.viewFeedback();
				
				for(Feedback feedback : feedbackList){ %>

				<tr>
					<td><%=feedback.getFeedbackId()%></td>
					<td><%=feedback.getUserId() %></td>
					<td><%=feedback.getFeedback() %></td>
					<td><%=feedback.getDate() %></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>
	<jsp:include page="WEB-INF/views/adminFooter.jsp"></jsp:include>
	</div>


</body>


</html>