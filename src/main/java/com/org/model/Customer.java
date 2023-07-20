package com.org.model;

public class Customer extends User {
	private String address;

	//Costructor
	public Customer() {
		super();
	}
	
	public Customer(String userId, String password, String fName, String lName, String email, String mobile,
			String gender, String aadhaarNo, String profilePic, String registeredDate, String address) {
		super(userId, password, fName, lName, email, mobile, gender, aadhaarNo, profilePic, registeredDate);
		this.address = address;
	}

	//Setters and Getters
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}

