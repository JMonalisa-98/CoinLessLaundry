package com.org.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.model.LaundryServices;
import com.org.service.LaundryServicesImple;


@WebServlet("/findService")
public class findService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		String id = request.getParameter("uid");
	    
	    LaundryServicesImple laundryServicesImple = new LaundryServicesImple();
	    
	    try {
        	  List<LaundryServices> serDetails = laundryServicesImple.getServicesById(id);
        	  request.setAttribute("serDetails", serDetails);
	    }
	    catch (Exception e) {
		e.printStackTrace();
	    }
	    
	    
	    RequestDispatcher dis = request.getRequestDispatcher("managerServices.jsp");
	    dis.forward(request, response);    
	    
	}

}
