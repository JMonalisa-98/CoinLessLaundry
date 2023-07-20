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
 * Servlet implementation class InsertService
 */
@WebServlet("/InsertService")
public class InsertService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertService() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String type = request.getParameter("type");
		
		LaundryServices laundryServices = new LaundryServices();
		
		/*
		 * Initialize values for LaundaryService object
		 * */
		
		laundryServices.setName(request.getParameter("name"));
		laundryServices.setDescription(request.getParameter("description"));
		laundryServices.setUnitPrice(Double.parseDouble(request.getParameter("price")));
		
		LaundryServicesImple laundryServicesImple = new LaundryServicesImple();
		int status = laundryServicesImple.addService(laundryServices);
		
		if(type.equals("mn") && status == 1) {
			request.setAttribute("message", "Insert Succesful");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		} else if(type.equals("mn") && status == 0) {
			request.setAttribute("message", "Insert Failed");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		} else if(status == 1) {
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
