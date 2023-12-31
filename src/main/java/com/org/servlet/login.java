package com.org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.service.UserService;
import com.org.service.UserServiceImple;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uid");
	    String password = request.getParameter("pass");
	    String url;
	    
	    UserService userService = new UserServiceImple();
	    
	    int status = userService.validate(username, password);
	    
	    if(username.charAt(0) == 'A') {
	    	url = "adminHome.jsp";
	    } else if (username.charAt(0) == 'E') {
	    	url = "profileEmployee.jsp";
	    } else if (username.charAt(0) == 'M') {
	    	url = "managerFindServices.jsp";
	    } else {
	    	url = "index.jsp";
	    }
	    
	    if(status == 1) {
	    	HttpSession httpSession = request.getSession();
	    	httpSession.setAttribute("userId", username);
	    	response.sendRedirect(url);
	    } else {
	    	request.setAttribute("message", "Credentials Mismatch");
	    	RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		    dis.forward(request, response);
	    }
	}

}
