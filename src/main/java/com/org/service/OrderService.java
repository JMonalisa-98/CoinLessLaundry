package com.org.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.org.model.Order;


public interface OrderService {
	/* initialize logger */
	public static final Logger log = Logger.getLogger(OrderService.class.getName());

	/**
	 * Add Orders for order table
	 * 
	 * @param order
	 */
	public int addOrder(Order order);

	/**
	 * Get all list of orders from order table
	 * 
	 * @return ArrayList<Order>
	 */
	public ArrayList<Order> getOrders();

	/**
	 * Change status by orderId
	 * 
	 * @return int
	 */
	public int changeStatus(String orderId, String status);
	
	/**
	 * Get order by orderId
	 * 
	 * @return Order
	 */
	public Order getOrderById(String orderId);
	
	/**
	 * Get total orders
	 * 
	 * @return totalNumber
	 */
	public int getTotalNumOrders();
	
	/**
	 * Get total orders today
	 * 
	 * @return totalNumber
	 */
	public int getTotalNumOrdersToday();
	
	/**
	 * Get total income today
	 * 
	 * @return totalIncome
	 */
	public float getTotalIncomeToday();
	
	/**
	 * Get total income 
	 * 
	 * @return totalIncome
	 */
	public float getTotalIncome();
}
