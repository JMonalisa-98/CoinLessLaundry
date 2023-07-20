package com.org.model;

public class Order {
	String orderId;
	String customerId;
	String description;
	Double total;
	String date;
	String status;
	
	public Order(String orderId, String customerId, String description, Double total, String date, String status) {
		super();
		this.orderId = orderId;
		this.customerId = customerId;
		this.description = description;
		this.total = total;
		this.date = date;
		this.status = status;
	}

	public Order() {
		super();
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
