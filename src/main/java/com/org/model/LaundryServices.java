package com.org.model;

public class LaundryServices {
	String serviceId;
	String name;
	String description;
	double unitPrice;
	String serviceImg;
	
	
	public LaundryServices() {
		super();
	}


	public LaundryServices(String serviceId, String name, String description, double unitPrice, String serviceImg) {
		super();
		this.serviceId = serviceId;
		this.name = name;
		this.description = description;
		this.unitPrice = unitPrice;
		this.serviceImg  =serviceImg;
	}


	public String getServiceId() {
		return serviceId;
	}


	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public double getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}


	public String getServiceImg() {
		return serviceImg;
	}


	public void setServiceImg(String serviceImg) {
		this.serviceImg = serviceImg;
	}

}
