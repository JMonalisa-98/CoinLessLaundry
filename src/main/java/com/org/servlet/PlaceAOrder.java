package com.org.servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.model.LaundryServices;
import com.org.model.Order;
import com.org.service.LaundryServicesImple;
import com.org.service.OrderServiceImple;

/**
 * Servlet implementation class PlaceAOrder
 */
@WebServlet("/PlaceAOrder")
public class PlaceAOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceAOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		LaundryServicesImple laundryServicesImple = new LaundryServicesImple();
		Order order = new Order();
	
		ArrayList<LaundryServices> arrayList = laundryServicesImple.viewLaundryServices();
		
		String description = "";
		
		int  i = 1;
	
		for(LaundryServices lServ : arrayList) {
			if(request.getParameter(lServ.getServiceId()) != null) {
				int quantity = Integer.parseInt(request.getParameter(lServ.getServiceId()));
				description = description + " **( " + i + " ) " + lServ.getName() + " -> " + quantity + " ** ";
				i ++;
			}
		}
		
		order.setTotal(Double.parseDouble(request.getParameter("totalP")));
		order.setCustomerId(request.getParameter("customer"));
		order.setDescription(description);
			
		OrderServiceImple orderServiceImple = new OrderServiceImple();
		
		int status = orderServiceImple.addOrder(order);
		
		if(status == 1) {
			request.setAttribute("message", "Place Order Succesful. We will collect your garments soon.");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Sorry, something went wrong");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		}
	}

}
