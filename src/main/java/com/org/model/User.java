package com.org.model;

public abstract class User {
	protected String userId;
	protected String password;
	protected String fName;
	protected String lName;
	protected String email;
	protected String mobile;
	protected String gender;
	protected String aadhaarNo;
	protected String profilePic;
	protected String registeredDate;
	
	//Constructor for user
	public User() {
		super();
	}

	
	
	public User(String userId, String password, String fName, String lName, String email, String mobile, String gender,
			String aadhaarNo, String profilePic, String registeredDate) {
		super();
		this.userId = userId;
		this.password = password;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.aadhaarNo = aadhaarNo ;
		this.profilePic = profilePic;
		this.registeredDate = registeredDate;
	}



	//Setters and Getters

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAadhaarNo() {
		return aadhaarNo;
	}

	public void setAadhaarNo(String aadhaarNo) {
		this.aadhaarNo = aadhaarNo;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(String registeredDate) {
		this.registeredDate = registeredDate;
	}
	
	
	
}
