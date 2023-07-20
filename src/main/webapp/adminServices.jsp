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
<title>Admin | Services</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="Images/logo.png">
<body style="background-color: rgb(255, 255, 255); height: 100%; width: 100%;">
	<div class="container">
		<jsp:include page="WEB-INF/views/adminHeader.jsp"></jsp:include>
		<label id="textMainNavi">Main Navigation</label>
		<div class="mainSideNav">
			<a href="adminHome.jsp"><i
				class="fas fa-tachometer-alt iconMainNavi"></i>Dashboard</a> <a
				href="adminCustomers.jsp"><i class="fas fa-user iconMainNavi"></i>Customers</a>
			<a href="adminEmployee.jsp"><i
				class="fas fa-user-tie iconMainNavi"></i>Employees</a> <a
				href="adminOrders.jsp"><i
				class="fab fa-first-order iconMainNavi"></i>Orders</a> <a
				href="adminServices.jsp" class="active"><i
				class="fas fa-tasks iconMainNavi"></i>Services</a> <a
				href="adminFeedback.jsp"><i class="fas fa-comments iconMainNavi"></i>Feedback</a>
			<a href="adminContact.jsp"><i
				class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
	</div>
	<!--Page Content Admin Customers-->
	<div class="PageContainerSmall" id="MainPageContainer">
		<div class="row">
			<label id="feedbackLabel">Services</label>
		</div>
		<div class="row tablCus">
			<input type="text" name="search" id="myInput" onkeyup="myFunction()"
				placeholder="Search.."> <i class="fas fa-search"
				id="searchIcon"></i>
			<button class="btn btn-primary" data-toggle="modal"
				data-target="#insertEmpModal" id="btnAddEmp">Add Service</button>
			<a href=" " style="text-decoration: none;"><button
					class="btn btn-success" id="btnRefresh">
					<i class="fas fa-sync-alt" id="refreshIcon"></i> Refresh
				</button></a>

			<table class="table table-responsive table-bordered" cellpadding="0"
				id="tableCustomerDetails">
				<tr>
					<th></th>
					<th>Service Id</th>
					<th>Service</th>
					<th>Price</th>
					<th>Description</th>
					<th>Operations</th>
				</tr>
				 <%
     			String userId = request.getParameter("serviceId");
					LaundryServicesInterface lauServicesInterface = new LaundryServicesImple();
				ArrayList<LaundryServices> arrayServices = lauServicesInterface.viewLaundryServices();

				for (LaundryServices laundaryServices : arrayServices) {
				%>
				<tr>
					<td><img src="<%=laundaryServices.getServiceImg()%>"
						id="imgProfTabl"></td>
					<td><%=laundaryServices.getServiceId()%></td>
					<td><%=laundaryServices.getName()%></td>
					<td><%=laundaryServices.getUnitPrice()%></td>
					<td><%=laundaryServices.getDescription()%></td>
					<td><form  action="#">
							<input name="serviceId" value="<%=laundaryServices.getServiceId()%>" hidden>
							<button type="submit" onClick="passId('<%=laundaryServices.getServiceId()%>')" class="btn btn-primary btn-sm"
								id="viewProf" data-toggle="modal" data-target="#viewProfile">
								<i class="fas fa-eye"></i>
							</button>
							<button type="submit" onClick="passId('<%=laundaryServices.getServiceId()%>')" class="btn btn-warning btn-sm"
								data-toggle="modal" data-target="#myModal" id="update">
								<i class="far fa-edit"></i>
							</button>
							<button type="submit" class="btn btn-danger btn-sm"
								data-toggle="modal" data-target="#deleteModal" id="btnDelete">
								<i class="fas fa-trash-alt"></i>
							</button>
						</form></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>


		<!--Moodal for delete service-->
		<div class="modal fade" id="deleteModal" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete Service</label>
						<button type="button" id="bnClose" class="close"
							data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="DeleteService">
							<div class="row">
								<%
									String serId = request.getParameter("serviceId");
								%>
								<input value="admin" name="url" hidden> <input
									value="<%=serId%>" name="serviceId" hidden> <label
									style="padding: 10px;">Are you sure you want to delete
									this account ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal" class="btn btn-warning">Cancel</button>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<%
		String serviceId = request.getParameter("serviceId");

		LaundryServices laundryServices = lauServicesInterface.getServiceById(userId);

		String name = laundryServices.getName();
		String description = laundryServices.getDescription();
		Double price = laundryServices.getUnitPrice();
		String image = laundryServices.getServiceImg();
		%>

		<!--Moodal for Insert Service-->
            <div class="modal fade" id="insertEmpModal" role="form">
                <div class="modal-dialog modal-dialog-centered">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <label class="modal-title">Insert New Service</label>
                            <button type="button" id="bnClose" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form class="modalUpd" method="post" action="InsertService">
                            <input name="type" value="admin" hidden>
                                <div class="row d-flex justify-content-center">
                                    <input type="file" id="updProPic" hidden>
                                    <label for="updProPic" class="lbPicUp"><img src="Images/washAndFold.png" id="profileUpdateImg"></label>
                                </div>
                                <div class="form-row">
                                    <div class="col form-group">
                                        <label>Service</label>
                                        <input type="text" class="form-control" name="name" required>
                                    </div>
                                    <!-- form-group end.// -->
                                    <div class="col form-group">
                                        <label>Price</label>
                                        <input type="text" class="form-control" name="price"  required>
                                    </div>
                                    <!-- form-group end.// -->
                                </div>
                                <!-- form-row end.// -->
                                <div class="form-group">
                                    <label>Description</label>
                                    <input type="text" class="form-control" name="description">
                                </div>
                                <!-- form-group end.// -->
                                <div class="form-group">
                                    <button type="reset" class="btn btn-danger">Reset</button>
                                    <button type="submit" class="btn btn-primary">Add New Service</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--Moodal for Service update-->
            <div class="modal fade" id="myModal" role="form">
                <div class="modal-dialog modal-dialog-centered">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <label class="modal-title">Update Service</label>
                            <button type="button" id="bnClose" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form class="modalUpd" method="post" action="UpdateService">
                            <input name="type" value="admin" hidden>
                            <input value="<%=serviceId %>" name="serviceId" hidden>
                                <div class="row d-flex justify-content-center">
                                    <input type="file" id="updProPic" hidden>
                                    <label for="updProPic" class="lbPicUp"><img src="<%=image %>" id="profileUpdateImg"></label>
                                </div>
                                <div class="form-row">
                                    <div class="col form-group">
                                        <label>Service</label>
                                        <input type="text" class="form-control"  name="name" value="<%=name %>" required>
                                    </div>
                                    <!-- form-group end.// -->
                                    <div class="col form-group">
                                        <label>Price</label>
                                        <input type="text" class="form-control" name="price" value="<%=price %>" required>
                                    </div>
                                    <!-- form-group end.// -->
                                </div>
                                <!-- form-row end.// -->
                                <div class="form-group">
                                    <label>Description</label>
                                    <input type="text" class="form-control" name="description" value="<%=description %>">
                                </div>
                                <!-- form-group end.// -->
                                <div class="form-group">
                                    <button type="reset" class="btn btn-danger">Reset</button>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

		<!--Moodal for View Service-->
		<div class="modal fade" id="viewProfile" role="dialog">
			<div class="modal-dialog modal-dialog-centered">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">
							Service -
							<%=serviceId%></h4>
						<button type="button" class="close" id="bnClose"
							style="outline: none;" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div class="row d-flex justify-content-center">
							<img src="<%=image %>" id="viewProPic">
						</div>
						<div class="row profileDetails">
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-tasks iconPro"></i>
									Service : </label> <label class="dataPro"><%=name%></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-tasks iconPro"></i>
									Price : INR </label> <label class="dataPro"><%=price%></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-tasks iconPro"></i>
									Description : </label> <label class="dataPro"><%=description%></label>
							</div>
						</div>
						<div class="modal-footer">
							<p class="text-sm coprRight">&copy; 2023 CoinLessLaundry Admin</p>
							<div class="btn btn-danger" class="close" data-dismiss="modal">Close</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="WEB-INF/views/adminFooter.jsp"></jsp:include>
	</div>
</body>
</html>