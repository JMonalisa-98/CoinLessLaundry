package com.org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.model.Contact;
import com.org.service.ContactServiceImple;

@WebServlet("/contactinsert")
public class contactinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Contact contact = new Contact();
		
	//get parameters (save)
		String C_name = request.getParameter("name");
		String C_Email = request.getParameter("subject");
		String C_Message = request.getParameter("msg");
		
		contact.setName(C_name);
		contact.setEmail(C_Email);
		contact.setMessage(C_Message);
		
		int isTrue;
		
		ContactServiceImple contactServiceImple = new ContactServiceImple();
		
		//call the method
		isTrue = contactServiceImple.addContact(contact);
		
		//Check DB connection 
		
		if(isTrue == 1) {
			
	//re-direct to the next page
			request.setAttribute("message", "Your message received. We'll contact you soon");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		}
		
		else {
			
	//re-direct to the next page
			request.setAttribute("message", "Sorry, something went wrong");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
