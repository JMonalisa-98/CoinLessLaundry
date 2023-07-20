package com.org.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.org.service.FeedbackService;

public class CreateTables {
	// Initalize logger
	public static final Logger logger = Logger.getLogger(FeedbackService.class.getName());

	private static Connection connection;
	private static Statement statement;
	
	static {
		createContactTable();
		createCusomerTables();
		createEmployeeTables();
		createFeedbackTable();
		createLaundaryServicesTable();
		createOrderTables();
		createUserLoginTable();
		insertAdmin();
	}

	private static void createContactTable() {
		try {
			connection = ConnectDB.getDBConnection();
			statement = connection.createStatement();

			// Drop tables if already exists and as per SQL query available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_DROP_TABLE_CONTACT));

			// Create new contact table as per SQL query
			// available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CREATE_TABLE_CONTACT));
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage());
		}
	}
	
	

	private static void createCusomerTables() {
		try {
			connection = com.org.util.ConnectDB.getDBConnection();
			statement = connection.createStatement();

			// Drop tables if already exists and as per SQL query available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CUTOMER_DROP_TABLE));
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_DROP_CUSTOMER_AUDIT_TABLE));

			// Create new customer and customerregaudit tables and triggers as per SQL query
			// available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CREATE_CUSTOMER_TABLE));
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CREATE_CUSTOMER_AUDIT_TABLE));
			statement.execute(QueryUtil.queryByID(CommonConstants.TRIGGER_INSERT_BEFORE_CUSTOMER_TABLE));
			statement.execute(QueryUtil.queryByID(CommonConstants.TRIGGER_INSERT_AFTER_CUSTOMER_TABLE_TO_USER_LOGIN));
			statement.execute(QueryUtil.queryByID(CommonConstants.TRIGGER_UPDATE_BEFORE_CUSTOMER_TABLE));
			statement.execute(QueryUtil.queryByID(CommonConstants.TRIGGER_DELETE_BEFORE_CUSTOMER_TABLE));
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage());
			e.printStackTrace();
		}
	}
	
	private static void createEmployeeTables() {
		try {
			connection = com.org.util.ConnectDB.getDBConnection();
			statement = connection.createStatement();

			// Drop tables if already exists and as per SQL query available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_DROP_TABLE_EMPLOYEE));
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_DROP_EMPLOYEE_AUDIT_TABLE));

			// Create new employee and employeeregaudit tables and triggers as per SQL query
			// available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CREATE_EMPLOYEE_TABLE));
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CREATE_EMPLOYEE_AUDIT_TABLE));
			statement.execute(QueryUtil.queryByID(CommonConstants.TRIGGER_INSERT_BEFORE_EMPLOYEE_TABLE));
			statement.execute(QueryUtil.queryByID(CommonConstants.TRIGGER_INSERT_AFTER_EMPLOYEE_TABLE_TO_USER_LOGIN));
			statement.execute(QueryUtil.queryByID(CommonConstants.TRIGGER_UPDATE_BEFORE_EMPLOYEE_TABLE));
			statement.execute(QueryUtil.queryByID(CommonConstants.TRIGGER_DELETE_BEFORE_EMPLOYEE_TABLE));
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage());
		}
	}
	
	private static void createFeedbackTable() {
		try {
			connection = ConnectDB.getDBConnection();
			statement = connection.createStatement();

			// Drop tables if already exists and as per SQL query available in
			// washpointQuery.xml
			System.out.println("hiiiii");
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_DROP_TABLE_FEEDBACK));

			System.out.println("dropped feedback");
			// Create new feedback table as per SQL query
			// available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CREATE_TABLE_FEEDBACK));
			System.out.println("feedback created");
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage());
			e.printStackTrace();
		}
	}
	
	private static void createLaundaryServicesTable() {
		try {
			connection = ConnectDB.getDBConnection();
			statement = connection.createStatement();

			// Drop tables if already exists and as per SQL query available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_DROP_TABLE_SERVICES));
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_DROP_TABLE_AUDIT_SERVICES));

			// Create new services table as per SQL query
			// available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CREATE_TABLE_SERVICES));
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CREATE_TABLE_AUDIT_SERVICES));
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.TRIGGER_INSERT_BEFORE_SERVICES_TABLE));
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage());
		}
	}
	
	private static void createOrderTables() {
		try {
			connection = ConnectDB.getDBConnection();
			statement = connection.createStatement();

			// Drop tables if already exists and as per SQL query available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_DROP_ORDERS_TABLE));
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_DROP_ORDER_AUDIT_TABLE));

			// Create new contact table as per SQL query
			// available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CREATE_ORDERS_TABLE));
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_CREATE_ORDER_AUDIT_TABLE));
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.TRIGGER_INSERT_BEFORE_ORDER_TABLE));
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage());
		}
	}
	

	
	public static void createUserLoginTable() {
		try {
			connection = com.org.util.ConnectDB.getDBConnection();
			statement = connection.createStatement();

			// Drop tables if already exists and as per SQL query available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_DROP_TABLE_USERLOGIN));
			
			// Create new userlogin tableas per SQL query available in
			// washpointQuery.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_USERLOGIN_TABLE));
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage());
		} 
	}
	
	public static void insertAdmin() {
		try {
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_INSERT_INTO_EMPLOYEE_TABLE);

			PreparedStatement preparedStatement= connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, "Nimal");
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, "Perera");
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, "909898787V");
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, "nimalperera@gmail.com");
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, "Male");
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, "123");
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, "Admin");
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, "0778787890");

			preparedStatement.executeUpdate();
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.getMessage());
		} 
	}

}
