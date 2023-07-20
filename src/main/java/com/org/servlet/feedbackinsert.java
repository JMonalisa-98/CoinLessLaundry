package com.org.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.model.Feedback;
import com.org.service.FeedbackServiceImple;

@WebServlet("/feedbackinsert")
public class feedbackinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//save the C_Feedback
		String userId = request.getParameter("user");
		String C_Feedback = request.getParameter("feedback");
		
		FeedbackServiceImple feedbackServiceImple = new FeedbackServiceImple();
		
		Feedback feedback = new Feedback();
		
		feedback.setUserId(userId);
		feedback.setFeedback(C_Feedback);
		
		int isExecute;
		
		//call the insertfeedback
		isExecute = feedbackServiceImple.addFeedback(feedback);
		
		//Check DB connection 
		if(isExecute == 1) {
			//re-direct to the next page
			request.setAttribute("message", "Thank You for the Feedback");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		}
		
		else {
			
	//re-direct to the next page
			request.setAttribute("message", "Sorry, something went wrong");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMsgCustomer.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

}
//end of the servlet
