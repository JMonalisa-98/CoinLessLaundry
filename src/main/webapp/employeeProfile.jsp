<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<% 
String userId;
if(session.getAttribute("userId") != null) {
	userId = (String)session.getAttribute("userId");
	if(userId.charAt(0) == 'C') {
	response.sendRedirect("index.jsp");
	}
} else {
	response.sendRedirect("index.jsp");
}
%>
<html>
<head>
    <title>Wash Point | Employee Profile</title>
    <meta charset="utf-8">
    <link rel="icon" href="Images/logo.png">
    <link rel="stylesheet" href="CSS/employeeProfile1.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body style="backgrou11	nd-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

         <!--Employee Profile Content-->
        <div class="card-container">	 
<div class="upper-container">
			<div class="image-container">
                <img src="Images/avatar.png"/>
                
            </div>
           <h1 class = "h1">Employee Profile</h1>
		</div>
		

	<c:forEach var="emp" items="${empDetails}">
		<c:set var = "id" value ="${emp.userId}"/>
		<c:set var = "fName" value ="${emp.fName}"/>
		<c:set var = "lName" value ="${emp.lName}"/>
		<c:set var = "email" value ="${emp.email}"/>
		<c:set var = "mobi" value ="${emp.mobile}"/>
		<c:set var = "gender" value ="${emp.gender}"/>
		<c:set var = "position" value ="${emp.position}"/>
		<c:set var = "aadhaarNo" value ="${emp.aadhaarNo}"/>
		<c:set var = "password" value ="${emp.password}"/>
         <div class = "de">
           
           <h2>User Id : ${emp.getUserId()}</h2><br>
            <h2>First Name: ${emp.getfName()}</h2><br>
            <h2>Last Name: ${emp.getlName()}</h2><br>
            <h2>Mobile: ${emp.getMobile()}</h2><br>
            <h2>Position : ${emp.getPosition()}</h2><br>
            <h2>Email: ${emp.getEmail()}</h2><br>
            <h2>Gender: ${emp.getGender()}</h2><br>
         	
        </div>
  		  
    	</c:forEach>
        
        <c:url value = "updateEmployee.jsp" var = "empUpdate">
        	<c:param name = "id" value = "${id}"/>
        	<c:param name = "fName" value = "${fName}"/>
        	<c:param name = "lName" value = "${lName}"/>
        	<c:param name = "email" value = "${email}"/>
        	<c:param name = "mobi" value = "${mobi}"/>
        	<c:param name = "gender" value = "${gender}"/>
        	<c:param name = "position" value = "${position}"/>
        	<c:param name = "aadhaarNo" value = "${aadhaarNo}"/>
        	<c:param name = "password" value = "${password}"/>
        </c:url>
        
        <a href = "${empUpdate}">
        	<button class="open-button">Update Profile</button>
        </a>
        
        <%
        userId = (String)session.getAttribute("userId");
        if(userId.charAt(0) == 'M') { %>
        <a href="managerFindServices.jsp">
        <button class="open-button" id="mgSer">Manager Services</button>
        </a>
        <%} %>
        
        <%
        userId = (String)session.getAttribute("userId");
        if(userId.charAt(0) == 'A') { %>
        <a href="adminHome.jsp">
        <button class="open-button" id="mgSer">Admin Dashboard</button>
        </a>
        <%} %>
        
        <% %>
 </div>
        <!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>

</body>
</html>