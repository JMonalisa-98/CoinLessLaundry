<%@page import="com.org.model.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.service.ContactServiceImple"%>
<%@page import="com.org.service.ContactService"%>
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
	<meta charset="ISO-8859-1">
<title>Admin | Contact</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="Images/logo.png">
</head>
<body style="background-color: rgb(255, 255, 255); height: 100%; width: 100%;">
<div class="container">
			<jsp:include page="WEB-INF/views/adminHeader.jsp"></jsp:include>
            <label id="textMainNavi">Main Navigation</label>
		<div class="mainSideNav">
			<a href="adminHome.jsp"><i
				class="fas fa-tachometer-alt iconMainNavi"></i>Dashboard</a> <a
				href="adminCustomers.jsp" ><i
				class="fas fa-user iconMainNavi"></i>Customers</a> <a
				href="adminEmployee.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Employees</a>
			<a href="adminOrders.jsp"><i
				class="fab fa-first-order iconMainNavi"></i>Orders</a> <a
				href="adminServices.jsp"><i class="fas fa-tasks iconMainNavi"></i>Services</a>
			<a href="adminFeedback.jsp"><i
				class="fas fa-comments iconMainNavi"></i>Feedback</a> <a
				href="adminContact.jsp" class="active"><i
				class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
            <hr/>
        </div>

        <!--Page Content-->
        <div class="PageContainerSmall" id="MainPageContainer">
            <div class="row">
                <label id="feedbackLabel">Contact Center</label>
            </div>

            <!--FeedBack-->
            <div class="row" id="feedBackAna">
                <input type="text" name="search" id="myInput" onkeyup="myFunction()" placeholder="Search..">
                <i class="fas fa-search" id="searchIcon"></i>
                </button>
                <table class="table table-responsive table-bordered feedbackTa" cellpadding="0" id="tableCustomerDetails">
                    <tr>
                        <th>Contact Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                        <th>Sent Date</th>
                        <th>Status</th>
                        <th>Change Status</th>
                    </tr>
                    <%
				ContactService contactService = new ContactServiceImple();
				ArrayList<Contact> contactList =  contactService.viewContact();
				
				for(Contact contact : contactList){ %>
                    <tr>
                        <td><%=contact.getContactId() %></td>
                        <td><%=contact.getName()%></td>
                        <td><%=contact.getEmail() %></td>
                        <td><%=contact.getMessage() %></td>
                        <td><%=contact.getDate()%></td>
                        <td><%=contact.getStatus() %></td>
                        <td>
                        <form action="#">
                        <input name="cId" value="<%=contact.getContactId()%>" hidden>
                        <button type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal" id="update">Change Status
                        </button>
                        </form>
                        </td>
                    </tr>
                    <%} %>
                </table>
            </div>

            <!--Moodal for Update Status-->
            <div class="modal fade" id="myModal" role="form">
                <div class="modal-dialog modal-dialog-centered">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <label class="modal-title">Update Status</label>
                            <button type="button" id="bnClose" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form class="modalUpd" action="ChangeReplyStatus" method="post">
							<input value="<%=request.getParameter("cId")%>" name="cId" hidden>
							<div class="form-row">
                                    <div class="col form-group">
                                        <label for="inputPosition">Status</label>
                                        <select name = "status" id="inputPosition" class="form-control">
                                            <option selected>Choose...</option>
                                            <option>Not Replied</option>
                                            <option>Replied</option>
                                        </select>
                                    </div>
                                    <!-- form-group end.// -->
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Update Status</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="WEB-INF/views/adminFooter.jsp"></jsp:include>
            </div>

</body>
</html>