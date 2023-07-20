<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<html>
<head>
    <title>Wash Point | Customer Profile</title>
    <meta charset="utf-8">
    <link rel="icon" href="Images/logo.png">
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/CustomerPr.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body style="backgrou11	nd-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

       <!--Customer Profile-->
            
			<div class= "ex">
				<img src="Images/undraw_private_data_7q35.png" class = "img" alt= "IMG" width="500px">
			</div>
			
			<div class = "tab">
				<img src = "Images/undraw_female_avatar_w3jk.png" class="mlogo" alt= "Name" width="110px">
				
            <p align="center" class="Contact_formTitle"><br>Customer Profile</p>
            
            
        <!-- Create a table -->    
          		<table cellspacing="3" cellpadding="5">
				
		<!-- get customer details -->
		
       			 	<c:forEach var="cus" items = "${cusDetails}">
       			 	
       			 		<c:set var="CusIntID" value="${cus.getUserId()}"></c:set>
       			 		<c:set var="C_firstname" value="${cus.getfName()}"></c:set>
       			 		<c:set var="C_lastname" value="${cus.getlName()}"></c:set>
       			 		<c:set var="C_Email" value="${cus.getEmail()}"></c:set>
       			 		<c:set var="C_aadhaarNo" value="${cus.getAadhaarNo()}"></c:set>
       			 		<c:set var="C_Gender" value="${cus.getGender()}"></c:set>
       			 		<c:set var="C_address" value="${cus.getAddress()}"></c:set>
       			 		<c:set var="C_profile_pic" value="${cus.getProfilePic()}"></c:set>
       			 		<c:set var="C_mobile_no" value="${cus.getMobile()}"></c:set>
       			 		<c:set var="password" value="${cus.getPassword()}"></c:set>
     					
     			<!-- using cus object-->
     					<tr>
     						<td>Customer Id</td>
     						<td>${cus.getUserId()}</td>
     					</tr>
     					<tr>
     						<td>First Name</td>
     						<td>${cus.getfName()}</td>
     					</tr>
     					<tr>
     						<td>Last Name</td>
     						<td>${cus.getlName()}</td>
     					</tr>
     					<tr>
     						<td>Email Address</td>
     						<td>${cus.getEmail()}</td>
     					</tr>
     					<tr>
     						<td>Aadhaar Number</td>
     						<td>${cus.getAadhaarNo()}</td>
     					</tr>
     					<tr>
     						<td>Gender</td>
     						<td>${cus.getGender()}</td>
     					</tr>
     					<tr>
     						<td>Address</td>
     						<td>${cus.getAddress()}</td>
     					</tr>
						<tr>
     						<td>Phone Number</td>
     						<td>${cus.getMobile()}</td>
     					</tr>
     					<tr>
     						<td>Password</td>
     						<td>${cus.getPassword()}</td>
     					</tr>
     						
          			</c:forEach>
          
           		</table>
           		
         <!-- End of the table -->
         
         <!-- Update values -->	
         
           		<c:url value="CustomerUpdate.jsp" var="updateCustomer">
           		
           			<c:param name="CusIntID" value="${CusIntID}"/>
           			<c:param name="C_firstname" value="${C_firstname}"/> 
           			<c:param name="C_lastname" value="${C_lastname}"/>  
           			<c:param name="C_Email" value="${C_Email}"/> 
           			<c:param name="C_aadhaarNo" value="${C_AadhaarNo}"/> 
           			<c:param name="C_Gender" value="${C_Gender}"/> 
           			<c:param name="C_address" value="${C_address}"/>
           			<c:param name="C_mobile_no" value="${C_mobile_no}"/> 
           			<c:param name="password" value="${password}"/> 
           		
           		</c:url>
           		 
           <!-- Delete values -->	 
           
           		 <c:url value="deleteCustomer.jsp" var="deleteCustomer">
           		 
           		 	<c:param name="newUserId" value="${CusIntID}"/>
           			
           		 </c:url>
           		 
           		 
            <!-- link Edit profile button -->
            
           		 <a href="${updateCustomer}">
           		 <button class="Contact_bnSubmit" id="bnSubmit" type="submit" name="button">Edit Profile</button> <br><br>
           		 </a>
           		 
           <!-- link Delete profile button --> 	
           	 
           		 <a href="${deleteCustomer}">
           		 <button class="Contact_bnSubmit" id="bnSubmit" type="submit" name="button">Delete Profile</button> <br><br>
           		 </a>
 			</div>
        <!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>

</body>
</html>