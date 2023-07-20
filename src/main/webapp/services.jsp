<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cash Less Laundry | Services</title>
    <meta charset="utf-8">
    <link rel="icon" href="Images/logo.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body style="backgrou11	nd-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

        <!--Services Page Content-->
        <img id="servicesMainImage" src="Images/serviceBackground.jpg">

        <div class="row">
            <div class="hidden-md-down col-md-6">
                <h1 id="firstTag">We offer the best services at affordable prices</h1>
            </div>
        </div>

        <!--Services-->
        <div class="col-xs-12 d-flex justify-content-center">
            <h1 id="howItWork">OUR SERVICES</h1>
        </div>

        <div class="row d-flex justify-content-center rowHowIt">
            <div class="col-xs-12 col-md-6 col-lg-3 d-flex justify-content-center boxHowItWork">
                <div class="row">
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <img src="Images/onlyWash.png" class="imageHowItWorks">
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <h1 class="topicsHowIt">Only Wash</h1>
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <p class="contentHowIt">Only washing is done. There the stains will clean using our super cleaners. Definetly it will give fresh look to your garments.</p>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3 d-flex justify-content-center boxHowItWork">
                <div class="row">
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <img src="Images/dryClean.png" class="imageHowItWorks" id="pickUpImg">
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <h1 class="topicsHowIt">Dry Clean</h1>
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <p class="contentHowIt">Our dry cleaning process is with the latest technology. This will give really a nice look to your garments than you expect.</p>
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
                        <p class="contentHowIt">We wash your garments using the best cleaners. Then we iron and fold you garments which will give an awesome look.</p>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3 d-flex justify-content-center boxHowItWork">
                <div class="row">
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <img src="Images/expressLaundary.png" class="imageHowItWorks">
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <h1 class="topicsHowIt">Express Laundary</h1>
                    </div>
                    <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
                        <p class="contentHowIt">If you are in are hurry. Don't worry, we can wash your garments and deliver to your doorstep with 12 hours.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-lg-12 d-flex justify-content-center">
            <img src="Images/laudryServiceImg.jpg" id="washingImgService">
        </div>

        <!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>

</body>
</html>