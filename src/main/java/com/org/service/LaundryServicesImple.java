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

import org.xml.sax.SAXException;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import com.org.model.LaundryServices;
import com.org.util.CommonConstants;
import com.org.util.ConnectDB;
import com.org.util.QueryUtil;

public class LaundryServicesImple implements LaundryServicesInterface {

	private static Connection connection;
	private static Statement statement;
	private static PreparedStatement preparedStatement;

	@Override
	public int addService(LaundryServices lauServices) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_INSERT_INTO_SERVICES);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, lauServices.getName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, lauServices.getDescription());
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_THREE, lauServices.getUnitPrice());

			preparedStatement.executeUpdate();
			status = 1;
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
				logger.log(Level.SEVERE, e.getMessage());
			}
		}
		return status;
	}

	@Override
	public ArrayList<LaundryServices> viewLaundryServices() {
		ArrayList<LaundryServices> laundryServiceList = new ArrayList<LaundryServices>();

		try {
			connection = ConnectDB.getDBConnection();
			statement = connection.createStatement();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_SELECT_FROM_TABLE_SERVICES);

			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				LaundryServices laundryServices = new LaundryServices();
				laundryServices.setServiceId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				laundryServices.setName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				laundryServices.setDescription(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				laundryServices.setUnitPrice(resultSet.getDouble(CommonConstants.COLUMN_INDEX_FOUR));
				laundryServices.setServiceImg(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));

				laundryServiceList.add(laundryServices);
			}
		} catch (SQLException | ParseException | SAXException | IOException | ParserConfigurationException e) {
			logger.log(Level.SEVERE, e.getMessage());
		} finally {
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
				logger.log(Level.SEVERE, e.getMessage());
			}
		}
		return laundryServiceList;
	}

	@Override
	public int updateService(LaundryServices laundryServices) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_UPDATE_FROM_SERVICES);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, laundryServices.getName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, laundryServices.getDescription());
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_THREE, laundryServices.getUnitPrice());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, laundryServices.getServiceId());
			preparedStatement.executeUpdate();
			status = 1;
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
				logger.log(Level.SEVERE, e.getMessage());
			}
		}
		return status;
	}

	@Override
	public int deleteService(String id) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_DELETE_FROM_SERVICES);
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

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
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
			logger.log(Level.SEVERE, e.getMessage());
		}

		return status;
	}

	@Override
	public LaundryServices getServiceById(String id) {
		LaundryServices laundryServices = new LaundryServices();
		try {
			connection = com.org.util.ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_VIEW_SERVICE_BY_ID);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				laundryServices.setServiceId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				laundryServices.setName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				laundryServices.setDescription(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				laundryServices.setUnitPrice(resultSet.getDouble(CommonConstants.COLUMN_INDEX_FOUR));
				laundryServices.setServiceImg(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
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
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
			logger.log(Level.SEVERE, e.getMessage());
		}
		return laundryServices;
	}

	@Override
	public ArrayList<LaundryServices> getServicesById(String id) {
		LaundryServices laundryServices = new LaundryServices();
		ArrayList<LaundryServices> service = new ArrayList<LaundryServices>();
		
		try {
			connection = com.org.util.ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_VIEW_SERVICE_BY_ID);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				laundryServices.setServiceId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				laundryServices.setName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				laundryServices.setDescription(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				laundryServices.setUnitPrice(resultSet.getDouble(CommonConstants.COLUMN_INDEX_FOUR));
				laundryServices.setServiceImg(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				
				service.add(laundryServices);
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
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException | IOException | ParseException | org.xml.sax.SAXException
				| ParserConfigurationException e) {
			logger.log(Level.SEVERE, e.getMessage());
		}
		return service;
	}

}
