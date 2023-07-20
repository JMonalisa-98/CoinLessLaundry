<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<% 
if(session.getAttribute("userId") != null) {
	String userId = (String)session.getAttribute("userId");
	if(userId.charAt(0) == 'C') {
	response.sendRedirect("index.jsp");
	}
} else {
	response.sendRedirect("index.jsp");
}
%>
<html>
<head>
    <title>Coin Less Laundry | Employee Profile</title>
    <meta charset="utf-8">
    <link rel="icon" href="Images/logo.png">
    <link rel="stylesheet" href="CSS/updateEmpProfile.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body style="backgrou11	nd-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

         <!--Employee Update Content-->
        <div class = "ht">
            <h1>Update Profile</h1>
        </div>
        
       <%
			String id = request.getParameter("id");
			String fName = request.getParameter("fName");
			String lName = request.getParameter("lName");
			String position = request.getParameter("position");
			String email = request.getParameter("email");
			String phone = request.getParameter("mobi");
			String gender = request.getParameter("gender");
			String aadhaarNo = request.getParameter("aadhaarNo");
			String password = request.getParameter("password");
		%>
		<div class="d-flex justify-content-center">
            <form action="UpdateEmployee" class="form-container" method= "post">
              
          
            <input type="text" name="newUserId" value="<%= id %>"readonly><br>
			<input type="text" name="fName" value="<%= fName %>"><br>
			<input type="text" name="lName" value="<%= lName %>"><br>
			<input type="text" name="email" value="<%= email %>"><br>
			<input type="text" name="mobile" value="<%= phone %>"><br>
		<input type="text" name="position" value="<%= position %>" readonly><br>
		<input type="text" name="nic" value="<%= aadhaarNo %>"><br>
		<input type="text" name="gender" value="<%= gender %>"><br>
			<input type="text" name="password" value="<%= password %>"><br>
			<input type="text" name="url" value="employee" hidden><br>
          
              <button type="submit" class="btn">Update</button>
              
            </form>
            </div>
        <!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>

</body>
</html>