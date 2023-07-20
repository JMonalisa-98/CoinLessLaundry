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
		
			<!-- CUSTOMER PROFILE -->
            
          <!-- Java code -->
            <%
            	String CusIntID= request.getParameter("CusIntID");
            	String C_firstname= request.getParameter("C_firstname");
            	String C_lastname= request.getParameter("C_lastname");
            	String CharID= request.getParameter("CharID");
            	String C_Email= request.getParameter("C_Email");
            	String C_aadhaarNo= request.getParameter("C_AadhaarNo");
            	String C_Gender= request.getParameter("C_Gender");
            	String C_address= request.getParameter("C_address");
            	String C_profile_pic= request.getParameter("C_profile_pic");
            	String C_mobile_no= request.getParameter("C_mobile_no");
            	String password= request.getParameter("password");
            	String C_password= request.getParameter("C_password");
            %>
        <!-- END OF THE Java code -->     
       
       
    <!-- CREATE A DIVITION FOR LOGO -->
			<div class= "ex">
				<img src="Images/undraw_private_data_7q35.png" class = "img" alt= "IMG" >
			</div>
			
			
	  <!-- CREATE A DIVITION FOR IMAGE -->	
			<div class="Contact_formC">
				<img src = "Images/undraw_female_avatar_w3jk.png" class="mlogo" alt= "Name" width="110px">
            <p align="center" class="Contact_formTitle"><br>Customer Profile</p>
         
         
            
       <!-- CREATE A FORM  -->
       
            <form action="UpdateCustomer" method="post" class = "profile">
			
			 	<input class="Contact_inputBox" type="text" id="name" placeholder="Customer ID" name="newUserId" value="<%=CusIntID %>" readonly> <br><br>
               
                <input class="Contact_inputBox" type="text" id="name" placeholder="First Name" name="fName" value="<%=C_firstname %>"> <br><br>
				
				<input class="Contact_inputBox" type="text" id="name" placeholder="Last Name" name="lName" value="<%=C_lastname %>"> <br><br>           
                
                <input class="Contact_inputBox" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.+[a-z].{2,}$" type="text" id="email" placeholder="Email" name="email" value="<%=C_Email %>"> <br><br>              
				
				<input class="Contact_inputBox" pattern = "[[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][v|V]]" type="text" id="name" placeholder="AadhaarNumber" name="AadhaarNo" value="<%=C_aadhaarNo %>"><br><br>				
				
				<input class="Contact_inputBox" type="text" id="name" placeholder="Address" name="address"  value="<%=C_address %>"> <br><br>				
				
				<input class="Contact_inputBox" type="text" id="name" placeholder="Mobile Number" name="mobile" value="<%=C_mobile_no %>"> <br><br>               
				
				<input class="Contact_inputBox" type="text" id="name" placeholder="Password" name="password" value="<%=password %>"> <br><br>  
                
				<input name="url" value="customer" hidden>
                <button class="Contact_bnSubmit" id="bnSubmit" type="submit" name="button">Update Profile</button> <br><br>
                
            </form>
    <!-- END OF THE FORM -->
    
			</div>		
	<!-- END OF THE DIVISION -->
        <!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>

</body>
</html>