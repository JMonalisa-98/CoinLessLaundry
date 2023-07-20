<%@page import="com.org.util.CreateTables"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Coin Less Laundry | Home</title>
    <meta charset="utf-8">
    <link rel="icon" href="Images/logo.png">
    <link rel="stylesheet" href="CSS/index.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

	
<body style="backgrou11	nd-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="WEB-INF/views/header.jsp"></jsp:include>
      	<%CreateTables createTables = new CreateTables(); %>
         <!--Home Page Content-->
        <img id="mainImage" src="Images/laundry.jpg">

        <div class="row">
            <div class="hidden-md-down col-md-6 d-flex justify-content-center">
            </div>
            <div class="hidden-md-down col-md-6">
                <h1 id="firstTag">Now laundary at your door</h1>
                <div class="row">
                    <div class="col-sm-4 d-flex justify-content-center">
                        <a href="placeOrder.jsp" style="text-decoration: none !important" ><button class="homePgBtn">Place Order</button></a>
                    </div>
                    <div class="col-sm-4 d-flex justify-content-center">
                        <button class="homePgBtn">Learn More</button>
                    </div>
                </div>
            </div>
        </div>

        <!--How the process go on-->
        <div class="col-xs-12 d-flex justify-content-center">
            <h1 id="howItWork">HOW IT WORKS</h1>
        </div>

        <div class="row d-flex justify-content-center rowHowIt">
            <div class="col-xs-12 col-md-6 col-lg-3 d-flex justify-content-center boxHowItWork">
                <div class="row">
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <img src="Images/placeOrder.png" class="imageHowItWorks">
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <h1 class="topicsHowIt">Place Order</h1>
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <p class="contentHowIt">You place order simply through your mobile or laptop at any time</p>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3 d-flex justify-content-center boxHowItWork">
                <div class="row">
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <img src="Images/pickUp.png" class="imageHowItWorks" id="pickUpImg">
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <h1 class="topicsHowIt">Pick Up</h1>
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <p class="contentHowIt">We come to your door step and pick up your order as soon as possible</p>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3 d-flex justify-content-center boxHowItWork">
                <div class="row">
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <img src="Images/washAndIron.png" class="imageHowItWorks">
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <h1 class="topicsHowIt">Wash and Iron</h1>
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <p class="contentHowIt">We wash and iron your clothes as per your need using our latest technology</p>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3 d-flex justify-content-center boxHowItWork">
                <div class="row">
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <img src="Images/pickUp.png" class="imageHowItWorks">
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <h1 class="topicsHowIt">Delivery</h1>
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <p class="contentHowIt">We deliver the cleaned fresh clothes to your door step very soon</p>
                    </div>
                </div>
            </div>
        </div>

        <!--Services Ad-->
        <div class="col-xs-12 getServiceAd">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <h1 id="headingSeeServices">See our services and get the latest price</h1>
                    <div class="row">
                        <div class="hidden-md-down col-sm-12">
                            <p id="textServiceAd">We provide a large variety of services to our customers at a very resonable price. The highest quality is always guranteed through our latest technlogy. We always offer the highest quality service in the country. We change
                                day by day and matuare with experiences. Thus we provide the best service to our customers.</p>
                        </div>
                    </div>
                    <div class="row" id="rowSpaceService">
                        <div class="col-xs-3 col-sm-6 d-flex justify-content-center">
                            <a href="services.jsp" style="text-decoration: none !important" ><button class="homePgBtn" id="findServices">Find Services</button></a>
                        </div>
                        <div class="col-xs-3 col-sm-6 d-flex justify-content-center">
                            <a href="placeOrder.jsp" style="text-decoration: none !important" ><button class="homePgBtn" id="placeOrder">Place Order</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="hidden-md-down col-md-6 d-flex justify-content-center">
                <img src="Images/washing.png" id="imgSerGirl">
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3 d-flex justify-content-center freeDelivery">
                <div class="row">
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <img src="Images/deliveryFree.png" class="imageHowItWorks">
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center delFree">
                        <h1 class="topicDel">Delivery Free</h1>
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <p class="contentHowIt">Now the delivery charges are absolutely free for orders above LKR 1000.00</p>
                    </div>
                </div>
            </div>
        </div>
        <!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>

</body>
</html>