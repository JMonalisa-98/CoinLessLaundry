package com.org.servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.model.Customer;
import com.org.service.CustomerService;
import com.org.service.CustomerServiceImple;

/**
 * Servlet implementation class UpdateCustomer
 */
@WebServlet("/UpdateCustomer")
public class UpdateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		Customer customer = new Customer();
		
		String url = "";
		try {
		url = request.getParameter("url");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		customer.setfName(request.getParameter("fName"));
		customer.setlName(request.getParameter("lName"));
		customer.setAddress(request.getParameter("address"));
		customer.setEmail(request.getParameter("email"));
		customer.setMobile(request.getParameter("mobile"));
		customer.setAadhaarNo(request.getParameter("aadhaarno"));
		customer.setPassword(request.getParameter("password"));
		customer.setUserId(request.getParameter("newUserId"));
		
		CustomerService customerService = new CustomerServiceImple();
		int status = customerService.updateCustomer(customer);
		
		if(status == 1 && url.equals("admin")) {
			request.setAttribute("message", "Update Succesful");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0 && url.equals("admin")) {
			request.setAttribute("message", "Update Failed");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 1) {
			request.setAttribute("message", "Update Successful");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("message", "Update Failed");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
