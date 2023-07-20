<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Wash Point | Home</title>
    <meta charset="utf-8">
    <link rel="icon" href="Images/logo.png">
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/contactUs.css">
    <script src="JS/myScript.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body style="backgrou11	nd-color: rgb(255, 255, 255); height: 100%; width: 100%;">
    <div class="container">
        <jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

         <!--Page Content-->
        
        
   <!--Contact Details-->
        
        <div class="Contact_contact">
            <div class="Contact_details">
                <table class="Contact_contactTable">
                    <tr>
                        <td colspan="2">
                            <br>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3742.308138095085!2d85.80380887515602!3d20.287508881182728!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a1909d32fffffff%3A0xdc4d4bcad001a31f!2sQSpiders%20Bhubaneswar!5e0!3m2!1sen!2sin!4v1682431653168!5m2!1sen!2sin"
                                width="350" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </td>
                    </tr>
                </table>
            </div>
			
		
			
	<!--Contact Form-->
			
			<div class="Contact_formC">
            <p align="center" class="Contact_formTitle"><br>Contact Form</p>
            
            <form method="post" action="contactinsert"  class= "Form">
            
                <input class="Contact_inputBox" type="text" id="name" placeholder="Name" name="name">
                <p class="error"></p>
                <input class="Contact_inputBox" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.+[a-z].{2,}$" type="text" id="email" placeholder="Email" name="subject">
                <p class="error"></p>
                <textarea class="Contact_inputBox" id="textArea_Message" type="text" placeholder="Message" name="msg"></textarea>
                <p class="error"></p>

                <button class="Contact_bnSubmit" id="bnSubmit" type="submit" name="button">Submit</button>
           
            </form>
			</div>


<%
String userId = "";
if(session.getAttribute("userId") != null) {
	userId = (String)session.getAttribute("userId");
	}
	%>
<!--Feedback-->
			
        <div class="Contact_formRate">
            <p align="center" class="Contact_formTitle"><br>Feedback</p>
            
            <form method="post" action="feedbackinsert" >
            	<input value="<%=userId %>" name="user" hidden>
                <textarea class="Contact_inputBox" id="textArea_Feedback" type="text" placeholder="Feedback" name="feedback" required></textarea>
                <p class="error"></p>
                <%
if(session.getAttribute("userId") != null) {%>
                <button class="Contact_bnSubmit" id="bnSubmit" type="submit" name="button">Submit</button>
                <%} %>
            </form>
        </div>
    </div>
    
			
			
<!--Contact FAQ-->
			
    <div class="Contact_FAQ">
        <div>
            <p align="left" class="Contact_faqTitle"><br>FAQ</p><br>
            <p class="Contact_faq">(1) How can I place an order ? <br>- You have to login to the system or you have to register to the system. <br><br> (2) If there any free delivery or offers available? <span id="Contact_readMore"><br>-Free collection and delivery in Selected Cities in Colombo.
            <br><br> (3) What are the available payment methods? <br>-There are few payment methods. Cash or card, you choose.
            <br><br> (4) How do you collect the orders?  <br>-Our Agent will come to your door step to collect your items.
            <br><br> (5) How can we know about delivery times? <br>-All you have to do is to schedule a convenient collection time and delivery time that works for you, and we will take care of the rest. We pick up and deliver 07 days a week till late, FREE OF CHARGE!</p></span>
                <button onclick="readMore()" id="Contact_bnFAQ">Read More</button>
        </div>
        <div>
            <image id="Contact_FAQ_img" src=" Images/washing.png"></image>
        </div>

    </div>
        <!--Footer-->
		<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
    </div>

</body>
</html>