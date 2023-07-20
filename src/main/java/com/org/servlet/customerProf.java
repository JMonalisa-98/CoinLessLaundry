package com.org.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.model.Customer;
import com.org.service.CustomerServiceImple;


@WebServlet("/customerProf")
public class customerProf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	//SAVE THE CharID, C_Email ( GET THE PARAMETERS)
		String CharID = request.getParameter("user");
		
		CustomerServiceImple customerServiceImple = new CustomerServiceImple();
		
		
	//CREATE AN EXCEPTION
		try {
	
			
	//CALL THE VALIDATE METHOD
		List<Customer> cusDetails = customerServiceImple.getCustomersById(CharID);
		
	//pass the attribute and object
		request.setAttribute("cusDetails", cusDetails);
		
		} 
		
	//CATCH THE EXCEPTION
		catch(Exception e) {
			e.printStackTrace();
		}
	
	//re-direct to the next page
		RequestDispatcher dis = request.getRequestDispatcher("CustomerProfile.jsp");
		dis.forward(request,response);
		
	}

}
//END OF THE SERVLET
