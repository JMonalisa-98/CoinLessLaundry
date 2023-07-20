<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<% 
if(session.getAttribute("userId") != null) {
	String userId = (String)session.getAttribute("userId");
	if(userId.charAt(0) != 'M') {
	response.sendRedirect("index.jsp");
	}
} else {
	response.sendRedirect("index.jsp");
}
%>
<html>
<head>
<link rel="StyleSheet" type="text/css" href="CSS/stylesAd.css">
<link rel="StyleSheet" type="text/css" href="CSS/homeCSS.css">
<meta charset="ISO-8859-1">
<title>Manager Profile</title>
<link rel="icon" href="Images/logo.png">
    <link rel="stylesheet" href="CSS/index.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body style="backgrou11	nd-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="WEB-INF/views/header.jsp"></jsp:include>
	<div class="sidenav">
            <div>
                    <img src="Images/avatar.png" height="150px" width="150px">
            </div>
            <div class="sidenav-links link2">
                 <form method="post" id="list" action="listEmployees">
                <a onClick="submit()">View Employees</a>
                </form>
                <a href="managerInsertService.jsp">Create new Service</a>
                <a href="managerFindServices.jsp">Update Service</a>
                <a href="managerFindServices.jsp">Delete Service</a>
                <a href="managerFindServices.jsp">View items</a>
        </div>
        </div>
<div class="contentManager">
	 <form action="InsertService" method="post">

			<input name="type" value="mn" hidden>
			<div class="form-group">
				<label for="uname">Service Name:</label> <input type="text"
					class="form-control" id="text" placeholder="name"
					name="name" required>
			</div>
			<div class="form-group">
				<label for="uname">Description:</label> <input type="text"
					class="form-control" id="text" placeholder="description"
					name="description" >
			</div>
			<div class="form-group">
				<label for="uname">Price:</label> <input type="text"
					class="form-control" id="text" placeholder="price"
					name="price" required>
			</div>
			<div class="form-group">
				<label for="uname">Service Image:</label> <input type="text"
					class="form-control" id="text" placeholder="serviceImg"
					name="serviceImg">
			</div>
			<button type="submit" name="submit" value="Create Customer" class="btn btn-primary"><center>Create</center></button><br></br>
	</form>
	</div>
	
	<!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
function submit() {
	var form = document.getElementById('list');
	form.submit();
}
</script>
</html>