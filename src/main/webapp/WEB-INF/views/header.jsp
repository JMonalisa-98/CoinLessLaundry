<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/navBar.css">
<link rel="stylesheet" href="CSS/services.css">
<link rel="stylesheet" href="CSS/index.css">
<link rel="stylesheet" href="CSS/about.css">
<link rel="stylesheet" href="CSS/placeOrder.css">
<script type="text/javascript" src="JS/placeOrder.js"></script>
<link rel="icon" href="Images/logo.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>

<body
	style="backgrou11 nd-color: rgb(255, 255, 255backgrou11	nd-color: rgb(255, 255, 255)); height: 100%; width: 100%;">
	<nav>
		<label class="logoLabel">Coin Less Laundry</label> <input type="checkbox"
			id="check"> <label for="check" class="checkbtn"> <i
			class="fas fa-bars"></i></label>

		<%
			if (session.getAttribute("userId") != null) {
			String username = (String) session.getAttribute("userId");
			String url = "index.jsp";

			if (username.charAt(0) == 'A') {
				url = "adminHome.jsp";
			} else if (username.charAt(0) == 'E') {
				url = "empProfile.java";
			} else if (username.charAt(0) == 'M') {
				url = "managerFindServices.jsp";
			} else if (username.charAt(0) == 'C') {
				url = "customerProfile.jsp";
			}
		%>
		<div class="dropdown">
			<img src="Images/avatar.png" class="dropdown-toggle" id="userIcon">

			<div class="dropdown-menu dropdown-menu-right" id="dropDownContent">
				<div id="rowDropDown2">
					<%
						if (username.charAt(0) == 'C') {
					%>
					<form id="form" method="post" action="customerProf">
						<input name="user" value="<%=username%>" hidden> <a
							onClick="submit()"> <i class="far fa-user"
							style="font-size: 18px;"></i> <label id="textLogOut">Profile</label>
						</a>
					</form>
					<%
						} else {
					%>
					<form id="form" method="post" action="empProfile">
						<input name="user" value="<%=username%>" hidden> <a
							onClick="submit()"> <i class="far fa-user"
							style="font-size: 18px;"></i> <label id="textLogOut">Profile</label>
						</a>
					</form>
					<%
						}
					%>
				</div>
				<div id="rowDropDown2">
					<a href="logout"> <i class="fas fa-power-off"></i><label
						id="textLogOut">Logout</label>
					</a>
				</div>
			</div>
		</div>
		<%
			}
		%>
		<%
			if (session.getAttribute("userId") == null) {
		%>
		<a href="login.jsp" style="text-decoration: none;"><button
				class="btn btn-primary" id="specialBtn" name="login" value="login">Login</button></a>
		<a href="customerRegister.jsp" style="text-decoration: none;"><button
				class="btn btn-primary" id="specialBtn" name="register"
				value="register">Register</button></a>
		<%
			}
		%>
		<ul>
			<li><a href="index.jsp" id="navPage"
				style="text-decoration: none;">Home</a></li>
			<li><a href="services.jsp" id="navPage"
				style="text-decoration: none;">Services</a></li>
			<li><a href="about.jsp" id="navPage"
				style="text-decoration: none;">About</a></li>
			<li><a href="contact.jsp" id="navPage"
				style="text-decoration: none;">Contact</a></li>
		</ul>

	</nav>
	
	<script>
	function submit() {
		var form = document.getElementById('form');
		form.submit();
	}
	</script>

</body>
</html>