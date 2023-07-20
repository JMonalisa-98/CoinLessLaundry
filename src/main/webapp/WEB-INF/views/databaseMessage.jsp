<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@page import="java.sql.*"%>
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
<html lang="en">

<head>
<title>Admin | Database Message</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="Images/logo.png">
<link rel="stylesheet" href="../CSS/adminCustomers.css">
<body
	style="background-color: rgb(255, 255, 255); height: 100%; width: 100%;">
	<div class="container">
		<jsp:include page="adminHeader.jsp"></jsp:include>
		<label id="textMainNavi">Main Navigation</label>
		<div class="mainSideNav">
			<a href="adminHome.jsp"><i
				class="fas fa-tachometer-alt iconMainNavi"></i>Dashboard</a> <a
				href="adminCustomers.jsp"><i
				class="fas fa-user iconMainNavi"></i>Customers</a> <a
				href="adminEmployee.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Employees</a>
			<a href="adminOrders.jsp"><i
				class="fab fa-first-order iconMainNavi"></i>Orders</a> <a
				href="adminServices.jsp"><i class="fas fa-tasks iconMainNavi"></i>Services</a>
			<a href="adminFeedback.jsp"><i
				class="fas fa-comments iconMainNavi"></i>Feedback</a> <a
				href="adminContact.jsp"><i
				class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
	</div>
<!--Page Content Database Message-->
        <div class="PageContainerSmall" id="MainPageContainer">
            <div class="row">
                <label id="feedbackLabel">Message From Database</label>
            </div>
            <div class="row databaseMsg">
                <div class="col-md-8">
                    <img src="Images/database.jpg" id="databaseImg">
                </div>
                <div class="col-md-4">
                    <label id="messageDBR"> >> Connecting to the database<br>
                    >> Connected<br><br>
                ----------------------------------------------</label>
                    <label id="messageDB">${message}</label>
                </div>
            </div>
            <!--Footer-->
            <footer class="footerSmall" id="footer">
                <h3 id="Foot_copyright" style="display: inline">&copy; 2023 CoinLessLaundry Admin</h3>
            </footer>
        </div>
	
		<jsp:include page="adminFooter.jsp"></jsp:include>
	</div>

</body>


</html>