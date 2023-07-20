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
    <link rel="stylesheet" href="CSS/UpdateCustomerProfile.css">
    <link rel="stylesheet" href="CSS/CustomerPr.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body style="backgrou11	nd-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

       <!--PAGE CONTENT-->
		
			<!--Customer Profile-->
            
            <!-- Java code -->
            <%
            	String CusIntID= request.getParameter("CusIntID");
            %>
        <!-- END OF THE Java code -->     
       
       
    <!-- CREATE A DIVITION FOR LOGO -->         
			<div class= "ex">
				<img src="Images/undraw_private_data_7q35.png" class = "img" alt= "IMG" >
			</div>
				
				
				
	 <!-- CREATE A DIVITION FOR IMAGE -->	
			<div class="Contact_formC">
			
				<img src = "Images/undraw_female_avatar_w3jk.png" class="mlogo" alt= "Name" width="110px">
				
            <p align="center" class="Contact_formTitle"><br>Delete Account</p>
            
            
       <!-- CREATE A FORM  -->      
            <form action="DeleteCustomer" method="post" class = "profile">
				<input value="customer" name="url" hidden>
			 	<input class="Contact_inputBox" type="text" id="name" placeholder="Customer ID" name="newUserId" value="<%=CusIntID %>" hidden> <br><br>
				<label>Are you sure you want to delete your account ?</label>
				
                <button class="Contact_bnSubmit" id="bnSubmit" type="submit" name="button">Delete Profile</button> <br><br>
                
            </form>
        <!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>

</body>
</html>