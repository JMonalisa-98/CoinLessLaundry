package com.org.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

import javax.xml.parsers.ParserConfigurationException;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import com.org.model.Employee;
import com.org.util.CommonConstants;
import com.org.util.ConnectDB;
import com.org.util.QueryUtil;

public class EmployeeServiceImple implements EmployeeService {
	private static Connection connection;
	private static Statement statement;
	private static PreparedStatement preparedStatement;

	@Override
	public int addEmployee(Employee employee) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_INSERT_INTO_EMPLOYEE_TABLE);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, employee.getfName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, employee.getlName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, employee.getAadhaarNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, employee.getEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, employee.getGender());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, employee.getPassword());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, employee.getPosition());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, employee.getMobile());

			preparedStatement.executeUpdate();
			status = 1;
		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
			log.log(Level.SEVERE, e.getMessage());
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
	public int deleteEmployee(String userId) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_DELETE_FROM_EMPLOYEE_TABLE);
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
				log.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return status;
	}

	@Override
	public int updateEmployee(Employee employee) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_UPDATE_EMPLOYEE_TABLE);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, employee.getfName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, employee.getlName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, employee.getAadhaarNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, employee.getEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, employee.getGender());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, employee.getPassword());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, employee.getPosition());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, employee.getMobile());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_NINE, employee.getUserId());

			preparedStatement.executeUpdate();
			status = 1;
		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
			log.log(Level.SEVERE, e.getMessage());
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
	public ArrayList<Employee> getEmployee() {
		ArrayList<Employee> employeeList = new ArrayList<Employee>();

		// Get list of employees from database

		try {
			connection = com.org.util.ConnectDB.getDBConnection();
			statement = connection.createStatement();

			ResultSet resultSet = statement.executeQuery(QueryUtil.queryByID(CommonConstants.QUERY_VIEW_EMPLOYEE_TABLE));

			// Initialize all the records to the array

			while (resultSet.next()) {
				Employee employee = new Employee();
				employee.setUserId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				employee.setfName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				employee.setlName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				employee.setAadhaarNo(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				employee.setEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				employee.setGender(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				employee.setProfilePic(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				employee.setPassword(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				employee.setPosition(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				employee.setMobile(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				employee.setRegisteredDate(resultSet.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
				employeeList.add(employee);
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
		return employeeList;
	}

	@Override
	public Employee getEmployeeById(String empId) {
		Employee employee = new Employee();
		try {
			connection = com.org.util.ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_VIEW_BY_ID_EMPLOYEE_TABLE);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, empId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				employee.setUserId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				employee.setfName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				employee.setlName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				employee.setAadhaarNo(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				employee.setEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				employee.setGender(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				employee.setProfilePic(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				employee.setPassword(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				employee.setPosition(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				employee.setMobile(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				employee.setRegisteredDate(resultSet.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
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
		return employee;
	}

	@Override
	public ArrayList<Employee> getEmployee(String empId) {
		Employee employee = new Employee();
		ArrayList<Employee> array = new ArrayList<Employee>();
		
		try {
			connection = com.org.util.ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_VIEW_BY_ID_EMPLOYEE_TABLE);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, empId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				employee.setUserId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				employee.setfName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				employee.setlName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				employee.setAadhaarNo(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				employee.setEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				employee.setGender(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				employee.setProfilePic(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				employee.setPassword(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				employee.setPosition(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				employee.setMobile(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				employee.setRegisteredDate(resultSet.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
				
				array.add(employee);
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
