<%@page import="com.org.model.Employee"%>
<%@page import="com.org.service.EmployeeServiceImple"%>
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
<title>Admin | Employees</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="Images/logo.png">
<body
	style="background-color: rgb(255, 255, 255); height: 100%; width: 100%;">
	<div class="container">
		<jsp:include page="WEB-INF/views/adminHeader.jsp"></jsp:include>
		<label id="textMainNavi">Main Navigation</label>
		<div class="mainSideNav">
			<a href="adminHome.jsp"><i class="fas fa-tachometer-alt iconMainNavi"></i>Dashboard</a> 
			<a href="adminCustomers.jsp"><i class="fas fa-user iconMainNavi"></i>Customers</a> 
			<a href="adminEmployee.jsp" class="active"><i class="fas fa-user-tie iconMainNavi"></i>Employees</a>
			<a href="adminOrders.jsp"><i class="fab fa-first-order iconMainNavi"></i>Orders</a>
			<a href="adminServices.jsp"><i class="fas fa-tasks iconMainNavi"></i>Services</a>
			<a href="adminFeedback.jsp"><i class="fas fa-comments iconMainNavi"></i>Feedback</a> 
			<a href="adminContact.jsp"><i class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
	</div>

	<!--Page Content Admin Customers-->
	<div class="PageContainerSmall" id="MainPageContainer">
		<div class="row">
			<label id="feedbackLabel">Employees</label>
		</div>
		<div class="row tablCus">
			<input type="text" name="search" id="myInput" onkeyup="myFunction()"
				placeholder="Search.."> <i class="fas fa-search"
				id="searchIcon"></i>
			<button class="btn btn-primary" data-toggle="modal"
				data-target="#insertEmpModal" id="btnAddEmp">Add Employee</button>
			<a href=" " style="text-decoration: none;"><button
					class="btn btn-success" id="btnRefresh">
					<i class="fas fa-sync-alt" id="refreshIcon"></i> Refresh
				</button></a>
				
			<table class="table table-responsive table-bordered" id="tableCustomerDetails">
				<tr>
					<th>Profile</th>
					<th>Employee Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Position</th>
					<th>Email</th>
					<th>Operations</th>
				</tr>
				<%
				EmployeeServiceImple employeeServiceImple = new EmployeeServiceImple();
				ArrayList<Employee> employeeArray = employeeServiceImple.getEmployee();

				for (Employee employee : employeeArray) {
				%>
				<tr>
					<td><img src="<%=employee.getProfilePic() %>" id="imgProfTabl"></td>
					<td><%=employee.getUserId() %></td>
					<td><%=employee.getfName() %></td>
					<td><%=employee.getlName() %></td>
					<td><%=employee.getPosition() %></td>
					<td><%=employee.getEmail()%></td>
					<td><form action="#">
							<input name="userId" value="<%=employee.getUserId()%>" hidden>
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
				<%} %>
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
						<form class="modalUpd" method="post" action="DeleteEmployee">
						<input value="admin" name="url" hidden>
							<div class="row">
								<%
									String userID = request.getParameter("userId");
								%>
								<input value="admin" name="url" hidden> <input
									value="<%=userID%>" name="newUserId" hidden> <label
									style="padding: 10px;">Are you sure you want to delete
									this account ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									class="btn btn-warning">Cancel</button>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<!--Moodal for Insert Employee-->
		<div class="modal fade" id="insertEmpModal" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Insert New Employee</label>
						<button type="button" id="bnClose" class="close"
							data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" action="InsertEmployee" method="post">
							<div class="row d-flex justify-content-center">
								<input type="file" id="updProPic" hidden> <label
									for="updProPic" class="lbPicUp"><img
									src="Images/avatar.png" id="profileUpdateImg"></label>
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>First name </label> <input type="text"
										class="form-control" name="fName" required>
								</div>
								<!-- form-group end.// -->
								<div class="col form-group">
									<label>Last name</label> <input type="text"
										class="form-control" name="lName" required>
								</div>
								<!-- form-group end.// -->
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label for="inputPosition">Position</label> <select
										id="inputPosition" name="position" class="form-control" required>
										<option value="" selected>Choose...</option>
										<option value="Manager">Manager</option>
										<option value="Admin">Admin</option>
										<option value="Employee">Employee</option>
									</select>
								</div>
								<!-- form-group end.// -->
								<div class="col form-group">
									<label for="inputGender">Gender</label> <select
										id="inputGender" name="gender" class="form-control" required>
										<option value="" selected>Choose...</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</div>
								<!-- form-group end.// -->
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>Aadhaar No</label> <input name="aadhaarNo" type="text" class="form-control"
										placeholder="" required>
								</div>
								<!-- form-group end.// -->
								<div class="col form-group">
									<label>Mobile</label> <input name="mobile" type="text" class="form-control"
										placeholder=" ">
								</div>
								<!-- form-group end.// -->
							</div>
							<!-- form-row end.// -->
							<div class="form-group">
								<label>Email address</label> <input type="email"
									class="form-control" name = "email" >
							</div>
							<!-- form-group end.// -->
							<!-- form-row.// -->
							<div class="form-group">
								<label>Password</label> <input name="password" class="form-control"
									type="password" required>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button type="reset" class="btn btn-danger">Reset</button>
								<button type="submit" class="btn btn-primary">Add New Employee</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		

		<!--Moodal for Employee update-->
		<div class="modal fade" id="myModal" role="form">
		<%
		    //Get the userId for query
			String userId = request.getParameter("userId");

			Employee employee = employeeServiceImple.getEmployeeById(userId);

			String fName = employee.getfName();
			String lName = employee.getlName();
			String aadhaarNo = employee.getAadhaarNo();
			String email = employee.getEmail();
			String position = employee.getPosition();
			String gender = employee.getGender();
			String profilePic = employee.getProfilePic();
			String password = employee.getPassword();
			String mobile = employee.getMobile();
			String regDate = employee.getRegisteredDate();
			String user = employee.getUserId();
			%>
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Profile Update - <%=user %></label>
						<button type="button" id="bnClose" class="close"
							data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="UpdateEmployee">
						<input value="<%=user %>" name="newUserId" hidden>
						<input value="admin" name="url" hidden> 
							<div class="row d-flex justify-content-center">
								<input type="file" id="updProPic" hidden> <label
									for="updProPic" class="lbPicUp"><img
									src="Images/avatar.png" id="profileUpdateImg"></label>
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>First name </label> <input type="text"
										class="form-control" name="fName" value="<%=fName%>" required>
								</div>
								<!-- form-group end.// -->
								<div class="col form-group">
									<label>Last name</label> <input type="text"
										class="form-control" name="lName" value="<%=lName%>" required>
								</div>
								<!-- form-group end.// -->
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label for="inputPosition">Position</label> <select
										id="inputPosition" name="position" class="form-control" required>
										<option value="" selected>Choose...</option>
										<option value="Manager">Manager</option>
										<option value="Admin">Admin</option>
										<option value="Employee">Employee</option>
									</select>
								</div>
								<!-- form-group end.// -->
								<div class="col form-group">
									<label for="inputGender" required>Gender</label> <select
										id="inputGender" name="gender" class="form-control">
										<option selected value="">Choose...</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>Aadhaar No</label> <input  name = "aadhaarNo" type="text" class="form-control"
										value="<%=aadhaarNo %>" required>
								</div>
								<!-- form-group end.// -->
								<div class="col form-group">
									<label>Mobile</label> <input name = "mobile" type="text" class="form-control"
										value="<%=mobile %>" required>
								</div>
								<!-- form-group end.// -->
							</div>
							<!-- form-row end.// -->
							<div class="form-group">
								<label>Email address</label> <input name="email" type="email"
									class="form-control" value="<%=email %>" required>
							</div>
							<!-- form-group end.// -->
							<!-- form-row.// -->
							<div class="form-group">
								<label>Password</label> <input name = "password" class="form-control"
									type="password" value="<%=password %>" required>
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
						<h4 class="modal-title">Profile - <%=user %></h4>
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
									First Name : </label> <label class="dataPro"><%=fName %></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-user iconPro"></i>
									Last Name : </label> <label class="dataPro"><%=lName %></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-user iconPro"></i>
									Position : </label> <label class="dataPro"><%=position%></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-phone iconPro"></i>
									Mobile : </label> <label class="dataPro"><%=mobile %></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i
									class="fas fa-mail-bulk iconPro"></i> Email : </label> <label
									class="dataPro">monalisarout1999@.com</label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i
									class="fas fa-transgender iconPro"></i> Gender : </label> <label
									class="dataPro"><%=gender %></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i
									class="fas fa-user-secret iconPro"></i> Password : </label> <label
									class="dataPro"><%=password %></label>
							</div>
							<div class="col-lg-12">
								<label class="tagPro"><i class="fas fa-calendar iconPro"></i>
									Registered Date : </label> <label class="dataPro"><%=regDate %></label>
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