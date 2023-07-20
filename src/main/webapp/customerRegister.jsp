<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Wash Point | Register</title>
<meta charset="utf-8">
<link rel="stylesheet" href="CSS/login.css">
<link rel="stylesheet" href="CSS/regstyle.css">
<link rel="icon" href="Images/logo.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="JS/register.js"></script>
<script>
 	addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
	 function checkPassword()
	{
	if(document.getElementById("pwd").value != document.getElementById("cnfrmpwd").value)
	{
		alert("Password Mis Match");
		return false;
	}
	else
	{
		alert("Success");
		return true;
	}

}
function enableButton(){
	if(document.getElementById("checkbox").checked)
	{
		document.getElementById("submitBtn").disabled = false;
	}
	else{
		document.getElementById("submitBtn").disabled = true;
	}
</script>
</head>

<body
	style="backgrou11 nd-color: rgb(255, 255, 255backgrou11	nd-color: rgb(255, 255, 255)); height: 100%; width: 100%;">
	<div class="container">
		<jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

		<div class="main-w3layouts wrapper">
		<h1><b>Registration Form</b></h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form action="customerRegister" method="post">
					<input class="text" type="text" name="firstName" placeholder="First Name" required><br>
					<input class="text" type="text" name="lastName" placeholder="Last Name" required><br>
					<input class="text email" type="email" name="email" placeholder="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
					<input class="text" type="text" name="aadhaarNo" placeholder="Aadhaar Number" required><br><br>
					<h3>Gender:</h3>
					<input type="radio" name="gender" value = "Male">Male
					<input type="radio" name="gender" value = "Female">Female	<br><br/><br>
					<h3>Address:</h3>
					<textarea name="address" rows="5" cols="50"required></textarea><br><br>
					<input class = "text" type="text"name="mobile" placeholder="mobile" pattern="[0-9]{10}"required><br><br>
					<input class="text" type="password" id = "pwd" name="password" placeholder="Password" required>
					<input class="text w3lpass" id = "cnfrmpwd"type="password" name="password" placeholder="Confirm Password" required>
					
					<div class="wthree-text">
						<label class="anim">
							<input type="checkbox" id = "checkbox" class="checkbox" required>
							<span>I Agree To The Terms and Conditions</span>
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit" name = "sendValues" id = "submitBtn"  value="Register">
				</form>
			</div>
		</div>
	</div>

		<!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
	</div>

</body>
</html>