<%@page import="com.org.model.LaundryServices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.service.LaundryServicesImple"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<% 
String userId = "";
if(session.getAttribute("userId") != null) {
	userId = (String)session.getAttribute("userId");
	if(userId.charAt(0) != 'C') {
	response.sendRedirect("index.jsp");
	}
} else {
	response.sendRedirect("login.jsp");
}
%>
<html>
<head>
    <title>Coin Less Laundry | Place Order</title>
    <meta charset="utf-8">
    <link rel="icon" href="Images/logo.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body style="backgrou11	nd-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="WEB-INF/views/header.jsp"></jsp:include>


       <!--Place Order Page Content-->

        <div class="myBucket">
            <div class="row">
                <div class="col-md-4 d-flex justify-content-center">
                    <img src="Images/washing.png" id="washImgGirl">
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-sm-12">
                            <label id="headingMyBucket">My Washing Bucket</label>
                        </div>
                        <div class="row">
                            <hr id="hLine" />
                        </div>
                    </div>
                    <table class="table  d-flex justify-content-center tableCart" id="tableMyBucket">
                        <tr>
                            <th></th>
                            <th>Service</th>
                            <th>Quantity</th>
                            <th>Unit Price</th>
                            <th style="min-width: 150px !important; max-width: 150px !important;">Total Price</th>
                            <th></th>
                        </tr>
                    </table>
                    <form method="post" action="PlaceAOrder" onsubmit="return purchaseClicked()">
                    <input name="customer" value="<%=userId %>" hidden>
                        <div class="cart-items">

                        </div>
                        <table class="table  d-flex justify-content-center tableCart" id="tableMyBucket">
                            <tr class="table-info">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><label>Total Price</label></td>
                                <td style="min-width: 150px !important; max-width: 150px !important;">INR <input class="inputBoxNo cart-total-price" name="totalP" id="totalPrice" value="0.00" readonly></td>
                                <td></td>
                            </tr>
                        </table>
                        <button class="btn btn-primary" type="submit" id="formSubmit">Place Order</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="row serviceSet d-flex justify-content-center">
        <%
				LaundryServicesImple laundryServicesImple = new LaundryServicesImple();
				ArrayList<LaundryServices> arrayLaundary = laundryServicesImple.viewLaundryServices();

				for (LaundryServices laundaryServices : arrayLaundary) {
				%>
            <div class="col-xs-12 col-md-3 d-flex justify-content-center serviceContainer">
                <div class="row shop-item">
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <img src="<%=laundaryServices.getServiceImg()%>" class="shop-item-image" id="imgForService">
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center labelShop">
                        <label id="titleService" class="shop-item-title"><%=laundaryServices.getName()%></label>
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <label id="priceService" style="margin-right: 5px;">INR</label> <label id="priceService" class="shop-item-price"><%=laundaryServices.getUnitPrice()%></label>
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <button class="btn btn-primary shop-item-button" id="btnAddtoCart">Add to Bucket</button>
                    </div>
                    <label id="titleService" class="shop-item-id" style="display:none"><%=laundaryServices.getServiceId()%></label>
                </div>
            </div>
            <%} %>
        </div>
        <!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>

</body>
</html>