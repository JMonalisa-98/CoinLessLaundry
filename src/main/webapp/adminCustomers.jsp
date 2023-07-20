<%@page import="com.org.model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.service.CustomerServiceImple"%>
<%@page import="com.org.util.ConnectDB"%>
<%@page import="com.org.util.CommonConstants"%>
<%@page import="java.util.Properties"%>
<%@page import="com.org.util.QueryUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@page import="java.sql.*"%>
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
<html lang="en">

<head>
<title>Admin | Customers</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="Images/logo.png">
<body
	style="background-color: rgb(255, 255, 255); height: 100%; width: 100%;">
	<div class="container">
		<jsp:include page="WEB-INF/views/adminHeader.jsp"></jsp:include>
		<label id="textMainNavi">Main Navigation</label>
		<div class="mainSideNav">
			<a href="adminHome.jsp"><i
				class="fas fa-tachometer-alt iconMainNavi"></i>Dashboard</a> <a
				href="adminCustomers.jsp" class="active"><i
				class="fas fa-user iconMainNavi"></i>Customers</a> <a
				href="adminEmployee.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Employees</a>
			<a href="adminOrders.jsp"><i
				class="fab fa-first-order iconMainNavi"></i>Orders</a> <a
				href="adminServices.jsp"><i class="fas fa-tasks iconMainNavi"></i>Services</a>
			<a href="adminFeedback.jsp"><i
				class="fas fa-comments iconMainNavi"></i>Feedback</a> <a
				href="adminContact.jsp"><i
				class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
	</div>

	<!--Page Content Admin Customers-->
	<div class="PageContainerSmall" id="MainPageContainer">
		<div class="row">
			<label id="feedbackLabel">Customers</label>
		</div>
		<div class="row tablCus">
			<input type="text" name="search" id="myInput" onkeyup="myFunction()"
				placeholder="Search.."> <i class="fas fa-search"
				id="searchIcon"></i> <a href=" " style="text-decoration: none;"><button
					class="btn btn-success" id="btnRefresh">
					<i class="fas fa-sync-alt" id="refreshIcon"></i> Refresh
				</button></a>
			<table class="table table-responsive table-bordered" cellpadding="0"
				id="tableCustomerDetails">

				<tr>
					<th>Profile</th>
					<th>Customer Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Mobile</th>
					<th>Email</th>
					<th>Operations</th>
				</tr>


				<%
				CustomerServiceImple customerServiceImple = new CustomerServiceImple();
				ArrayList<Customer> customerArray = customerServiceImple.getCustomers();

				for (Customer customer : customerArray) {
				%>
				<tr>
					<td><img id="imgProfTabl" src="<%=customer.getProfilePic()%>"></td>
					<td><%=customer.getUserId()%></td>
					<td><%=customer.getfName()%></td>
					<td><%=customer.getlName()%></td>
					<td><%=customer.getMobile()%></td>
					<td><%=customer.getEmail()%></td>
					<td><form action="#">
							<input name="userId" value="<%=customer.getUserId()%>" hidden>
							<button type="submit" class="btn btn-primary btn-sm"
								id="viewProf" data-toggle="modal" data-target="#viewProfile">
								<i class="fas fa-eye"></i>
							</button>
							<button type="submit" class="btn btn-warning btn-sm"
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

		<!--Moodal for delete customer-->
		<div class="modal fade" id="deleteModal" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete Account</label>
						<button type="button" id="bnClose" class="close"
							data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd"  method="post" action="DeleteCustomer">
							<div class="row">
								<%
									String userID = request.getParameter("userId");
								%>
								<input value="admin" name="url" hidden>
								<input value="<%=userID%>" name="newUserId" hidden> <label
									style="padding: 10px;">Are you sure you want to delete
									this account ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal" onclick="<% %>" class="btn btn-warning">Cancel</button>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<!--Moodal for customer update-->
		<div class="modal fade" id="myModal" role="form">
			<%
				//Get the userId for query
			String userId1 = request.getParameter("userId");

			Customer customer = customerServiceImple.getCustomerById(userId1);

			String fName = customer.getfName();
			String lName = customer.getlName();
			String aadhaarNo = customer.getAadhaarNo();
			String email = customer.getEmail();
			String gender = customer.getGender();
			String address = customer.getAddress();
			String profilePic = customer.getProfilePic();
			String password = customer.getPassword();
			String mobile = customer.getMobile();
			String regDate = customer.getRegisteredDate();
			String user = customer.getUserId();
			%>
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Profile Update <%=userId1%></label>
						<button type="button" id="bnClose" class="close"
							data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form action="UpdateCustomer" method="post" class="modalUpd">
							<input value="admin" name="url" hidden> 
							<input value="<%=user%>" name="newUserId" hidden>
							<div class="row d-flex justify-content-center">
								<input type="file" id="updProPic" name="NewprofilePic"
									value="<%=profilePic%>" hidden> <label for="updProPic"
									class="lbPicUp"><img src="<%=profilePic%>"
									id="profileUpdateImg"></label>
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>First name</label> <input type="text"
										class="form-control" value="<%=fName%>" name="fName" required>
								</div>
								<!-- form-group end.// -->
								<div class="col form-group">
									<label>Last name</label> <input type="text"
										class="form-control" value="<%=lName%>" name="lName" required>
								</div>
								<!-- form-group end.// -->
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>Aadhaar No </label> <input type="text" name="aadhaarNo"
										class="form-control" placeholder="" value="<%=aadhaarNo%>" required>
								</div>
								<!-- form-group end.// -->
								<div class="col form-group">
									<label>Mobile</label> <input type="text" class="form-control"
										name="mobile" value="<%=mobile%>" required>
								</div>
								<!-- form-group end.// -->
							</div>
							<!-- form-row end.// -->
							<div class="form-group">
								<label>Email address</label> <input type="email"
									class="form-control" value="<%=email%>" name="email" required>
							</div>
							<div class="form-group">
								<label>Address</label> <input type="address"
									class="form-control" value="<%=address%>" name="address"
									required>
							</div>
							<!-- form-group end.// -->
							<!-- form-row.// -->
							<div class="form-group">
								<label>Password</label> <input class="form-control"
									type="password" name="password" value="<%=password%>" required>
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



		<!--Moodal for View Profile-->
		<div class="modal fade" id="viewProfile" role="dialog">
			<div class="modal-dialog modal-dialog-centered">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">

						<h4 class="modal-title">
							Profile -
							<%=userId1%></h4>
						<button type="button" class="close" id="bnClose"
							style="outline: none;" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div class="row d-flex justify-content-center">
							<img src="Images/avatar.png" id="viewProPic">
						</div>
						<div class="row profileDetails">
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-user iconPro"></i>
									First Name : </label> <label class="dataPro"><%=fName%></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-user iconPro"></i>
									Last Name : </label> <label class="dataPro"><%=lName%></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-phone iconPro"></i>
									Mobile : </label> <label class="dataPro"><%=mobile%></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i
									class="fas fa-mail-bulk iconPro"></i> Email : </label> <label
									class="dataPro"><%=email%></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i
									class="fas fa-address-card iconPro"></i> Address : </label> <label
									class="dataPro"><%=address%></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i
									class="fas fa-transgender iconPro"></i> Gender : </label> <label
									class="dataPro"><%=gender%></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i
									class="fas fa-user-secret iconPro"></i> Password : </label> <label
									class="dataPro"><%=password%></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-calendar iconPro"></i>
									Registered Date : </label> <label class="dataPro"><%=regDate%></label>
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