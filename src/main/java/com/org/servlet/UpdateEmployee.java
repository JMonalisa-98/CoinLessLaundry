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
 * Servlet implementation class UpdateEmployee
 */
@WebServlet("/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		Employee employee = new Employee();
		
		String url = request.getParameter("url");
		
		/*
		 * Initialize values for employee object
		 * */
		
		employee.setfName(request.getParameter("fName"));
		employee.setlName(request.getParameter("lName"));
		employee.setGender(request.getParameter("gender"));
		employee.setEmail(request.getParameter("email"));
		employee.setMobile(request.getParameter("mobile"));
		employee.setAadhaarNo(request.getParameter("aadhaarno"));
		employee.setPosition(request.getParameter("position"));
		employee.setPassword(request.getParameter("password"));
		employee.setUserId(request.getParameter("newUserId"));
	
		EmployeeService employeeService = new EmployeeServiceImple();
		int status = employeeService.updateEmployee(employee);
		
		if(status == 1 && url.equals("admin")) {
			request.setAttribute("message", "Update Succesful");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0 && url.equals("admin")) {
			request.setAttribute("message", "Update Failed");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if ((status == 1)) {
			request.setAttribute("message", "Update Succesful");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("message", "Update Failed");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		}
	}

}
