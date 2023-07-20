package com.org.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.org.model.Feedback;

public interface FeedbackService {
	//Initialize logger
	public static final Logger logger = Logger.getLogger(FeedbackService.class.getName());
	
	/**
	 * Add Feedback for feedback table
	 * 
	 * @param feedback
	 */
	public int addFeedback(Feedback feedback);
	
	/**
	 * View feedback from Feedback table
	 * 
	 * @return ArrayList<Feedback>
	 */
	public ArrayList<Feedback> viewFeedback();
}
