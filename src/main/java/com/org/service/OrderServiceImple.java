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
import com.org.model.Order;
import com.org.util.CommonConstants;
import com.org.util.ConnectDB;
import com.org.util.QueryUtil;

public class OrderServiceImple implements OrderService{
	private static Connection connection;
	private static Statement statement;
	private static PreparedStatement preparedStatement;

	@Override
	public int addOrder(Order order) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_INSERT_INTO_ORDERS_TABLE);
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, order.getCustomerId());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, order.getDescription());
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_THREE, order.getTotal());

			preparedStatement.execute();
			
			status = 1;
		} catch (SQLException | ParseException | SAXException | IOException | ParserConfigurationException e) {
			log.log(Level.SEVERE, e.getMessage());
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
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return status;
	}

	@Override
	public ArrayList<Order> getOrders() {
		ArrayList<Order> orderArray = new ArrayList<Order>();

		// Get list of orders from database

		try {
			connection = com.org.util.ConnectDB.getDBConnection();
			statement = connection.createStatement();

			ResultSet resultSet = statement.executeQuery(QueryUtil.queryByID(CommonConstants.QUERY_SELECT_FROM_ORDERS));

			// Initialize all the records to the array

			while (resultSet.next()) {
				Order order = new Order();
				order.setOrderId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				order.setCustomerId((resultSet.getString(CommonConstants.COLUMN_INDEX_TWO)));
				order.setDescription(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				order.setTotal(Double.parseDouble(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR)));
				order.setStatus(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				order.setDate(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				
				orderArray.add(order);
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
		return orderArray;
	}

	@Override
	public int changeStatus(String orderId, String status) {
		int status1 = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_CHANGE_STATUS_ORDER_TABLE);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, status);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, orderId);


			preparedStatement.executeUpdate();

			status1 = 1;
		} catch (SQLException | IOException | ParseException | SAXException | ParserConfigurationException e) {
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
		return status1;
	}

	@Override
	public Order getOrderById(String orderId) {
		Order order = new Order();
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_SELECT_BY_ID_ORDER_TABLE);
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, orderId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				order.setOrderId(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				order.setCustomerId(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				order.setDescription(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				order.setTotal(resultSet.getDouble(CommonConstants.COLUMN_INDEX_FOUR));
				order.setStatus(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				order.setDate(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
			}
		} catch (SQLException | IOException | ParseException | SAXException | ParserConfigurationException e) {
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
		return order;
	}

	@Override
	public int getTotalNumOrders() {
		int total = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			statement = connection.createStatement();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_TOTAL_NUM_ORDERS);
			
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
	public int getTotalNumOrdersToday() {
		int total = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			statement = connection.createStatement();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_TOTAL_NUM_ORDERS_TODAY);
			
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
	public float getTotalIncomeToday() {
		float total = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			statement = connection.createStatement();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_TOTAL_INCOME_ORDERS_TODAY);
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				total = resultSet.getFloat(CommonConstants.COLUMN_INDEX_ONE);
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
	public float getTotalIncome() {
		float total = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			statement = connection.createStatement();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_TOTAL_INCOME_ORDERS);
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				total = resultSet.getFloat(CommonConstants.COLUMN_INDEX_ONE);
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

}
