<%@page import="com.org.model.Employee"%>
<%@page import="com.org.service.EmployeeServiceImple"%>
<%@page import="com.org.service.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/admin.css">
<link rel="stylesheet" href="CSS/adminCustomers.css">
<link rel="stylesheet" href="CSS/navBarAdmin.css">
<link href="/fontawesome-free-5.13.0-web/css/all.css" rel="stylesheet">
<link rel="icon" href="Images/logo.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>
<% 
String userId="";
if(session.getAttribute("userId") != null) {
	userId = (String)session.getAttribute("userId");
	if(userId.charAt(0) != 'A') {
	response.sendRedirect("index.jsp");
	}
} else {
	response.sendRedirect("index.jsp");
}

EmployeeService employeeService = new EmployeeServiceImple();
Employee employee = employeeService.getEmployeeById(userId);

String name = employee.getfName() + " " + employee.getlName();
%>
<body
	style="background-color: rgb(255, 255, 255); height: 100%; width: 100%;">
	<nav class="navSmall" id="sideNavBarDrawer">
		<!--<label class="logoLabel">Admin Dashboard</label>-->
		<input type="checkbox" id="check"> <label for="check"
			class="checkbtn"> <img src="Images/menuBlack.png"
			onclick="navBarLoad()" id="sideNavBar"></label>

	</nav>

	<!--Admin NavBar-->
	<div class="sidenav" id="navBarSide">
		<a href="index.jsp" target="_BLANK" id="navToIndex"><label class="logoLabel">CoinLessLaundry</label></a>
		<hr />

		<div id="imgUserSideNav">
			<img src="Images/avatar.png" id="userSideNav"> <label
				class="userNameSideNavBar" id="userNameSide"><%=name %></label>
			<i class="fas fa-caret-down" id="dropDownIcon" onclick="dropDown1()"></i>
		</div>

		<div id="dropDown1">
			<div id="rowDropDown1">
				<a href="#about"> <i class="far fa-user"
					style="font-size: 18px;"></i> <label id="textProf">Profile</label>
				</a>
			</div>
			<div id="rowDropDown1">
				<a href="logout"> <i class="fas fa-power-off"></i><label
					id="textProf">Logout</label>
				</a>
			</div>
		</div>

		<hr />
</body>
</html>