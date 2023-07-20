<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<% 
String userId;
if(session.getAttribute("userId") != null) {
	userId = (String)session.getAttribute("userId");
	if(userId.charAt(0) != 'M') {
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
    <link rel="stylesheet" href="CSS/EmplyeeDetails.css">
     <link rel="stylesheet" href="CSS/popup.css">
     
            <link rel="stylesheet" href="CSS/delPop.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="JS/delPopUp.js"></script>
</head>

<body style="backgrou11	nd-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

         <!--List Employee Profile Content-->
  		<div class="lbl">
                    <h1>Employee Details</h1>
                </div>
                <button class="open-button" onclick="openForm()">Delete</button>
                <div class="form-popup" id="myForm">
                    <form action="DeleteEmployee" class="form-container" method="post">
						<input value="manager" name="url" hidden>
                        <input type="text" placeholder="E123" name="newUserId" required>


                        <button type="submit" class="btn">Delete</button>
                        <button type="submit" class="btn cancel" onclick="closeForm()">Close</button>
                    </form>
                </div>

                <!--table Content-->

                <table  border=1>
                    <tr>
                        <th>Employee ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th style="width:300px">Email</th>
                        <th>Aadhaar Number</th>
                        <th>Gender</th>
                        <th>Position</th>
                        <th>Mobile</th>
                        <th>Password</th>
                    </tr>
                    <c:forEach var="empd" items="${empDetails}">
                        <tr>
                            <td>${empd.userId}</td>
                            <td>${empd.fName}</td>
                            <td>${empd.lName}</td>
                            <td>${empd.email}</td>
                            <td>${empd.aadhaarNo}</td>
                            <td>${empd.gender}</td>
                            <td>${empd.position}</td>
                            <td>${empd.mobile}</td>
                            <td>${empd.password}</td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
        <!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>

</body>
<script>
                function openForm() {
                    document.getElementById("myForm").style.display = "block";
                }

                function closeForm() {
                    document.getElementById("myForm").style.display = "none";
                }
            </script>
</html>