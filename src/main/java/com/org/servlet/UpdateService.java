package com.org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.model.LaundryServices;
import com.org.service.LaundryServicesImple;

/**
 * Servlet implementation class UpdateService
 */
@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateService() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
		
		LaundryServices laundryServices = new LaundryServices();
		
		/*
		 * Initialize values for LaundaryService object
		 * */
		
		String type = request.getParameter("type");
		
		laundryServices.setName(request.getParameter("name"));
		laundryServices.setDescription(request.getParameter("description"));
		laundryServices.setUnitPrice(Double.parseDouble(request.getParameter("price")));
		laundryServices.setServiceId(request.getParameter("serviceId"));
		
		LaundryServicesImple laundryServicesImple = new LaundryServicesImple();
		int status = laundryServicesImple.updateService(laundryServices);
		
		if(type.equals("mn") && status == 1) {
			request.setAttribute("message", "Update Succesful");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		} else if(type.equals("mn") && status == 0) {
			request.setAttribute("message", "Update Failed");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		} else if(status == 1) {
			request.setAttribute("message", "Update Succesful");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Update Failed");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
