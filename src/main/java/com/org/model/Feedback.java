package com.org.model;

public class Feedback {
	private int feedbackId;
	private String userId;
	private String feedback;
	private String date;
	
	
	public Feedback() {
		super();
	}

	public Feedback(int feedbackId, String userId, String feedback, String date) {
		super();
		this.feedbackId = feedbackId;
		this.userId = userId;
		this.feedback = feedback;
		this.date = date;
	}

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
