package com.org.model;

public class Contact {
	private int contactId;
	private String name;
	private String email;
	private String message;
	private String status;
	private String date;
	
	
	public Contact() {
		super();
	}

	public Contact(int contactId, String name, String email, String message, String status, String date) {
		super();
		this.contactId = contactId;
		this.name = name;
		this.email = email;
		this.message = message;
		this.status = status;
		this.date = date;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getContactId() {
		return contactId;
	}

	public void setContactId(int contactId) {
		this.contactId = contactId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
