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


@WebServlet("/listEmployees")
public class listEmployees extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    EmployeeServiceImple employeeServiceImple= new EmployeeServiceImple();
	    
	    try {
        	  List<Employee> empDetails = employeeServiceImple.getEmployee();
        	  request.setAttribute("empDetails", empDetails);
	    }
	    catch (Exception e) {
		e.printStackTrace();
	    }
	    
	    
	    RequestDispatcher dis = request.getRequestDispatcher("listEmployees.jsp");
	    dis.forward(request, response);    
	    
	}

}
