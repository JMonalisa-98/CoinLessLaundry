package com.org.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.model.Employee;
import com.org.service.EmployeeServiceImple;


@WebServlet("/empProfile")
public class empProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		String username = request.getParameter("user");
	    
	    EmployeeServiceImple employeeServiceImple = new EmployeeServiceImple();
	    
	    try {
        	  List<Employee> empDetails = employeeServiceImple.getEmployee(username);
        	  request.setAttribute("empDetails", empDetails);
	    }
	    catch (Exception e) {
		e.printStackTrace();
	    }
	    
	    
	    RequestDispatcher dis = request.getRequestDispatcher("employeeProfile.jsp");
	    dis.forward(request, response);    
	    
	}

}
