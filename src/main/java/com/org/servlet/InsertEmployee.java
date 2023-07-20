package com.org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.model.Employee;
import com.org.service.EmployeeService;
import com.org.service.EmployeeServiceImple;

/**
 * Servlet implementation class InsertEmployee
 */
@WebServlet("/InsertEmployee")
public class InsertEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		Employee employee = new Employee();
		
		/*
		 * Initialize values for employee object
		 * */
		
		employee.setfName(request.getParameter("fName"));
		employee.setlName(request.getParameter("lName"));
		employee.setGender(request.getParameter("gender"));
		employee.setEmail(request.getParameter("email"));
		employee.setMobile(request.getParameter("mobile"));
		employee.setAadhaarNo(request.getParameter("aadhaarno"));
		employee.setPassword(request.getParameter("password"));
		employee.setPosition(request.getParameter("position"));
	
		EmployeeService employeeService = new EmployeeServiceImple();
		int status = employeeService.addEmployee(employee);
		
		if(status == 1) {
			request.setAttribute("message", "Insert Succesful");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
