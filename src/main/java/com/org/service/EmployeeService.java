package com.org.service;
import java.util.ArrayList;
import java.util.logging.Logger;
import com.org.model.Employee;

/**
 * Online Laudary Management System. Interface Employee Service
 * 
 * @author Yasiru Randika IT19131184
 */
public interface EmployeeService {
	/* initialize logger */
	public static final Logger log = Logger.getLogger(EmployeeService.class.getName());

	/**
	 * Add Employee for Employee table
	 * 
	 * @param employee
	 */
	public int addEmployee(Employee employee);

	/**
	 * Delete Employee from Employee table
	 * 
	 * @param userId
	 */
	public int deleteEmployee(String userId);

	/**
	 * Update Customer for Customer Table
	 * 
	 * @param employee
	 */
	public int updateEmployee(Employee employee);

	/**
	 * Get all list of customers from customer table
	 * 
	 * @return ArrayList<Employee>
	 */
	public ArrayList<Employee> getEmployee();

	/**
	 * Get Employee by employeeId from Employee table
	 * 
	 * @return Employee
	 */
	public Employee getEmployeeById(String empId);
	
	/**
	 * Get Employee by employeeId from Employee table
	 * 
	 * @return ArrayList
	 */
	public ArrayList<Employee> getEmployee(String empId);
}
