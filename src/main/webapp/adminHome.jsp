<%@page import="com.org.service.OrderServiceImple"%>
<%@page import="com.org.service.OrderService"%>
<%@page import="com.org.service.CustomerServiceImple"%>
<%@page import="com.org.service.CustomerService"%>
<%@page import="com.org.model.LaundryServices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.service.LaundryServicesImple"%>
<%@page import="com.org.service.LaundryServicesInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<% 
if(session.getAttribute("userId") != null) {
	String userId = (String)session.getAttribute("userId");
	if(userId.charAt(0) != 'A') {
	response.sendRedirect("index.jsp");
	}
} else {
	response.sendRedirect("index.jsp");
}
%>
<html>
<head>
<title>Admin | Dashboard</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="Images/logo.png">
<body
	style="background-color: rgb(255, 255, 255); height: 100%; width: 100%;">
	<div class="container">
		<jsp:include page="WEB-INF/views/adminHeader.jsp"></jsp:include>
		<label id="textMainNavi">Main Navigation</label>
		<div class="mainSideNav">
			<a href="adminHome.jsp" class="active"><i
				class="fas fa-tachometer-alt iconMainNavi" ></i>Dashboard</a> <a
				href="adminCustomers.jsp"><i class="fas fa-user iconMainNavi"></i>Customers</a>
			<a href="adminEmployee.jsp"><i
				class="fas fa-user-tie iconMainNavi"></i>Employees</a> <a
				href="adminOrders.jsp"><i
				class="fab fa-first-order iconMainNavi"></i>Orders</a> <a
				href="adminServices.jsp" ><i
				class="fas fa-tasks iconMainNavi"></i>Services</a> <a
				href="adminFeedback.jsp"><i class="fas fa-comments iconMainNavi"></i>Feedback</a>
			<a href="adminContact.jsp"><i
				class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
	</div>


        <!--Total Statistics-->
        <%CustomerServiceImple customerServiceImple = new CustomerServiceImple();
        OrderService orderService = new OrderServiceImple();
        
        int totalOrders = 0, totalOrdersToday = 0, totalCustomers = 0, totalCustomersToday = 0;
        float totalIncome = 0, totalIncomeToday = 0;
        
        totalIncome = orderService.getTotalIncome();
        totalIncomeToday = orderService.getTotalIncomeToday();
        totalOrders = orderService.getTotalNumOrders();
        totalOrdersToday = orderService.getTotalNumOrdersToday();
        totalCustomers = customerServiceImple.getTotalCustomers();
        totalCustomersToday = customerServiceImple.getTodayRegisteredCustomers();%>
        
        <div class="PageContainerSmall" id="MainPageContainer">
            <div class="row d-flex justify-content-center">
                <div class="col-sm-12 col-md-6 col-lg-3 boxMainDisplay b1">
                    <div class="col-sm-4 d-flex justify-content-center">
                        <i class="fas fa-shopping-cart" style="font-size: 40px; color: white;"></i>
                    </div>
                    <div class="col-sm-8 d-flex justify-content-center">
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="totalOrdersLabel d-flex justify-content-center">Total Orders</label>
                            </div>
                            <div class="col-sm-12">
                                <label class="totalOrdersLabel d-flex justify-content-center" style="font-weight: bold; font-size: 18px;" id="totalOrders"><%=totalOrders %></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 boxMainDisplay b2">
                    <div class="col-sm-4 d-flex justify-content-center">
                        <i class="fas fa-users" style="font-size: 40px; color: white;"></i>
                    </div>
                    <div class="col-sm-8 d-flex justify-content-center">
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="totalOrdersLabel d-flex justify-content-center">Total Customers</label>
                            </div>
                            <div class="col-sm-12">
                                <label class="totalOrdersLabel d-flex justify-content-center" style="font-weight: bold; font-size: 18px;" id="totalCustomers"><%=totalCustomers %></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 boxMainDisplay b3">
                    <div class="col-sm-4 d-flex justify-content-center">
                        <i class="fab fa-chrome" style="font-size: 40px; color: white;"></i>
                    </div>
                    <div class="col-sm-8 d-flex justify-content-center">
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="totalOrdersLabel d-flex justify-content-center">Total Web Visits</label>
                            </div>
                            <div class="col-sm-12">
                                <label class="totalOrdersLabel d-flex justify-content-center" style="font-weight: bold; font-size: 18px;" id="totalCustomers">546</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 boxMainDisplay b4">
                    <div class="col-sm-4 d-flex justify-content-center">
                        <i class="fas fa-chart-line" style="font-size: 40px; color: white;"></i>
                    </div>
                    <div class="col-sm-8 d-flex justify-content-center">
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="totalOrdersLabel d-flex justify-content-center">Total Income</label>
                            </div>
                            <div class="col-sm-12">
                                <label class="totalOrdersLabel d-flex justify-content-center" style="font-weight: bold; font-size: 18px;" id="totalIncome"><%=totalIncome %></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Today Statistics-->
            <div class="row todayStat">
                <div class="col-md-6 todayStatistics">
                    <label id="textInfo">Today Transactions</label>
                    <hr id="divider1" />
                    <div class="row d-flex justify-content-center">
                        <div class="col-sm-12 col-md-6 boxMainDisplay b5">
                            <div class="col-sm-4 d-flex justify-content-center">
                                <i class="fas fa-chart-line" style="font-size: 40px; color: white;"></i>
                            </div>
                            <div class="col-sm-8 d-flex justify-content-center">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <label class="totalOrdersLabel d-flex justify-content-center">Total Income</label>
                                    </div>
                                    <div class="col-sm-12">
                                        <label class="totalOrdersLabel d-flex justify-content-center" style="font-weight: bold; font-size: 18px;" id="totalIncome"><%=totalIncomeToday %></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 boxMainDisplay b4">
                            <div class="col-sm-4 d-flex justify-content-center">
                                <i class="fas fa-user-plus" style="font-size: 40px; color: white;"></i>
                            </div>
                            <div class="col-sm-8 d-flex justify-content-center">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <label class="totalOrdersLabel d-flex justify-content-center">New Users</label>
                                    </div>
                                    <div class="col-sm-12">
                                        <label class="totalOrdersLabel d-flex justify-content-center" style="font-weight: bold; font-size: 18px;" id="totalIncomeToday"><%=totalCustomersToday %></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 boxMainDisplay b4">
                            <div class="col-sm-4 d-flex justify-content-center">
                                <i class="fas fa-shopping-cart" style="font-size: 40px; color: white;"></i>
                            </div>
                            <div class="col-sm-8 d-flex justify-content-center">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <label class="totalOrdersLabel d-flex justify-content-center">Total Orders</label>
                                    </div>
                                    <div class="col-sm-12">
                                        <label class="totalOrdersLabel d-flex justify-content-center" style="font-weight: bold; font-size: 18px;" id="totalOrderToday"><%=totalOrdersToday %></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 boxMainDisplay b5">
                            <div class="col-sm-4 d-flex justify-content-center">
                                <i class="fab fa-chrome" style="font-size: 40px; color: white;"></i>
                            </div>
                            <div class="col-sm-8 d-flex justify-content-center">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <label class="totalOrdersLabel d-flex justify-content-center">Web Visitors</label>
                                    </div>
                                    <div class="col-sm-12">
                                        <label class="totalOrdersLabel d-flex justify-content-center" style="font-weight: bold; font-size: 18px;" id="webVisitsToday">234</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 statisticsNew">
                    <label id="textInfo">Best Sales</label>
                    <hr id="divider1" />
                    <div class="row d-flex justify-content-center">
                        <img src="Images/dryClean.png" id="bestSaleImg">
                    </div>
                    <div class="row d-flex justify-content-center rowDisName">
                        <label id="bestSaleName">Dry Cleaning</label>
                    </div>
                </div>
            </div>
        </div>
		<jsp:include page="WEB-INF/views/adminFooter.jsp"></jsp:include>
	</div>
</body>
</html>