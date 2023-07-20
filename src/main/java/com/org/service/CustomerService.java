package com.org.service;
import java.util.ArrayList;
import java.util.logging.Logger;
import com.org.model.Customer;

/**
 * Online Laudary Management System. Interface Customer Service
 * 
 * @author Yasiru Randika IT19131184
 */

public interface CustomerService {
	/* initialize logger */
	public static final Logger log = Logger.getLogger(CustomerService.class.getName());

	/**
	 * Add Customer for Customer table
	 * 
	 * @param customer
	 */
	public String addCustomer(Customer customer);

	/**
	 * Delete Customer from Customer table
	 * 
	 * @param customerId
	 */
	public int deleteCustomer(String userId);

	/**
	 * Update Customer for Customer Table
	 * 
	 * @param customer
	 */
	public int updateCustomer(Customer customer);

	/**
	 * Get all list of customers from customer table
	 * 
	 * @return ArrayList<Customer>
	 */
	public ArrayList<Customer> getCustomers();

	/**
	 * Get Customer by customerId from Customer table
	 * 
	 * @return customerId
	 */
	public Customer getCustomerById(String customerId);
	
	/**
	 * Get Customer by Id as Array
	 * 
	 * @return ArrayList
	 */
	
	public ArrayList<Customer> getCustomersById(String customerId);
	
	/**
	 * Get Total customers from table
	 * 
	 * @return totalCustomers
	 */

	public int getTotalCustomers();
	
	/**
	 * Get Total customers registered today from table 
	 * 
	 * @return totalCustomers
	 */
	public int getTodayRegisteredCustomers();

}
