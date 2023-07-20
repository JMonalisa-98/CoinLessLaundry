package com.org.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import com.org.model.Customer;
import com.org.util.CommonConstants;
import com.org.util.ConnectDB;
import com.org.util.QueryUtil;

public class CustomerServiceImple implements CustomerService {

	// Initializing logger
	public static final Logger logger = Logger.getLogger(CustomerServiceImple.class.getName());

	private static Connection connection;
	private static Statement statement;
	private static PreparedStatement preparedStatement;

	@Override
	public ArrayList<Customer> getCustomers() {
		ArrayList<Customer> customerList = new ArrayList<Customer>();

		// Get list of customers from database

		try {
			connection = com.org.util.ConnectDB.getDBConnection();
			statement = connection.createStatement();

			ResultSet resultSet = statement
					.executeQuery(QueryUtil.queryByID(CommonConstants.QUERY_VIEW_CUSTOMER_TABLE));

			// Initialize all the records to the array

			while (resultSet.next()) {
				Customer customer = new Customer();
				customer.setUserId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				customer.setfName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				customer.setlName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				customer.setAadhaarNo(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				customer.setEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				customer.setGender(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				customer.setAddress(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				customer.setProfilePic(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				customer.setPassword(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				customer.setMobile(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				customer.setRegisteredDate(resultSet.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
				customerList.add(customer);
			}

			/*
			 * Close statement and database connectivity at the end of transaction
			 */
			try {
				if (statement != null) {
					statement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		return customerList;
	}

	@Override
	public String addCustomer(Customer customer) {
		String status = "Fail";
		try {
			connection = ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_INSERT_INTO_CUSTOMER_TABLE);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, customer.getfName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, customer.getlName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, customer.getAadhaarNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, customer.getEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, customer.getGender());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, customer.getAddress());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, customer.getPassword());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, customer.getMobile());

			preparedStatement.executeUpdate();
			
			statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(QueryUtil.queryByID(CommonConstants.QUERY_GET_NEW_USERID));
			
			while (resultSet.next()) {
				status = resultSet.getString(CommonConstants.COLUMN_INDEX_ONE);
			}
		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
//			logger.log(Level.SEVERE, e.getMessage());
			e.printStackTrace();
		} finally {
			/*
			 * Close statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}

		return status;
	}

	@Override
	public int deleteCustomer(String userId) {
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_DELETE_FROM_CUSTOMER_TABLE);
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, userId);

			preparedStatement.executeUpdate();
			
			status = 1;
			/*
			 * Close statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
//				log.log(Level.SEVERE, e.getMessage());
				e.printStackTrace();
			}

		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
//			log.log(Level.SEVERE, e.getMessage());
			e.printStackTrace();
		}
		
		return status;

	}

	@Override
	public int updateCustomer(Customer customer) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_UPDATE_CUSTOMER_TABLE);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, customer.getfName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, customer.getlName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, customer.getAadhaarNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, customer.getEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, customer.getAddress());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, customer.getPassword());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, customer.getMobile());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, customer.getUserId());

			status = preparedStatement.executeUpdate();
		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
			logger.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}

		return status;

	}

	@Override
	public Customer getCustomerById(String customerId) {
		Customer customer = new Customer();
		try {
			connection = com.org.util.ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_VIEW_BY_ID_CUSTOMER_TABLE);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, customerId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				customer.setUserId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				customer.setfName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				customer.setlName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				customer.setAadhaarNo(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				customer.setEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				customer.setGender(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				customer.setAddress(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				customer.setProfilePic(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				customer.setPassword(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				customer.setMobile(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				customer.setRegisteredDate(resultSet.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
			}

			/*
			 * Close statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		return customer;
	}

	@Override
	public int getTotalCustomers() {
		int total = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			statement = connection.createStatement();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_TOTAL_CUSTOMERS);
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				total = resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE);
			}
		}catch (SQLException | IOException | ParseException | SAXException | ParserConfigurationException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		
		return total;
	}

	@Override
	public int getTodayRegisteredCustomers() {
		int total = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			statement = connection.createStatement();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_TOTAL_CUSTOMERS_TODAY);
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				total = resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE);
			}
		}catch (SQLException | IOException | ParseException | SAXException | ParserConfigurationException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		
		return total;
	}

	@Override
	public ArrayList<Customer> getCustomersById(String customerId) {
		ArrayList<Customer> array = new ArrayList<>();
		Customer customer = new Customer();
		try {
			connection = com.org.util.ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_VIEW_BY_ID_CUSTOMER_TABLE);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, customerId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				customer.setUserId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				customer.setfName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				customer.setlName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				customer.setAadhaarNo(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				customer.setEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				customer.setGender(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				customer.setAddress(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				customer.setProfilePic(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				customer.setPassword(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				customer.setMobile(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				customer.setRegisteredDate(resultSet.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
				
				array.add(customer);
			}

			/*
			 * Close statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		return array;
	}

}
