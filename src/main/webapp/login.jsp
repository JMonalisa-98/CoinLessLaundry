<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Wash Point | Login</title>
<meta charset="utf-8">
<link rel="stylesheet" href="CSS/login.css">
<link rel="icon" href="Images/logo.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body
	style="backgrou11 nd-color: rgb(255, 255, 255backgrou11	nd-color: rgb(255, 255, 255)); height: 100%; width: 100%;">
	<div class="container">
		<jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

		<!--Login Page Content-->

        <div class="row boxLogIn">
            <div class="hidden-sm-down col-md-6 d-flex justify-content-center ">
                <img id="loginIllus" src="Images/loginIlustrator.svg">
            </div>
            <div class="col-sm-12 col-md-6">
                <form class="form" method="post" action="login">
                    <div class="col-sm-12 avatarDiv">
                        <img id="avatar" src="Images/avatar.png">
                    </div>
                    <div class="form-group col-sm-12 inputBox">
                        <input class="form-control" type="text" name="uid" placeholder="User Id">
                    </div>
                    <div class="form-group col-sm-12 inputBox">
                        <input class="form-control" type="password" name="pass" placeholder="Password">
                    </div>
                    <div class="col-sm-12 d-flex justify-content-center">
                        <label class="loginError">${message }</span>
                    </div>
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-primary" id="bnLogin" name="submit" value="login">Login</button>
                    </div>
                </form>
            </div>
        </div>

		<!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
	</div>

</body>
</html>