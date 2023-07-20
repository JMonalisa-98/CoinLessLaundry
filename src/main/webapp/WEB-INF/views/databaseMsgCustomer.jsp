<%@page import="com.org.model.LaundryServices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.service.LaundryServicesImple"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Coin Less Laundry | Message</title>
    <meta charset="utf-8">
    <link rel="icon" href="Images/logo.png">
    <link rel="stylesheet" href="CSS/dbMsgCustomer.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body style="background-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="header.jsp"></jsp:include>


       <!--Page Content Database Message-->
        <div class="d-flex justify-content-center">
            <div class="row databaseMsg d-flex justify-content-center align-items-center">
                <div class="col-md-6">
                    <img src="Images/database.jpg" id="databaseImg">
                </div>
                <div class="col-md-6">
                    <label id="messageDBR"> >> Connecting to the database<br>
                    >> Connected<br><br>
                ----------------------------------------------</label><br>
                    <label id="messageDB">${message}</label>
                </div>
            </div>
        </div>

        
        <!--Footer-->
		<jsp:include page="footer.jsp"></jsp:include>
    </div>

</body>
</html>