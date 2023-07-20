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
import com.org.model.Contact;
import com.org.util.CommonConstants;
import com.org.util.ConnectDB;
import com.org.util.QueryUtil;

public class ContactServiceImple implements ContactService{
	private static Connection connection;
	private static Statement statement;
	private static PreparedStatement preparedStatement;


	@Override
	public int addContact(Contact contact) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_INSERT_INTO_CONTACT);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, contact.getName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, contact.getEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, contact.getMessage());


			preparedStatement.executeUpdate();

			status = 1;
		} catch (SQLException | IOException | ParseException | SAXException | ParserConfigurationException e) {
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
	public ArrayList<Contact> viewContact() {
		ArrayList<Contact> contactList = new ArrayList<Contact>();
		
		try {
			connection = ConnectDB.getDBConnection();
			statement = connection.createStatement();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_SELECT_FROM_TABLE_CONTACT);
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				Contact contact = new Contact();
				contact.setContactId(resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE));
				contact.setName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				contact.setEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				contact.setMessage(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				contact.setStatus(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				contact.setDate(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				
				contactList.add(contact);
			}
		} catch (SQLException |ParseException | SAXException | IOException | ParserConfigurationException e) {
			logger.log(Level.SEVERE, e.getMessage());
		}  finally {
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
		return contactList;
	}

	@Override
	public int updateStatus(int cId, String status) {
		int status1 = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_UPDATE_STATUS_CONTACT_TABLE);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, status);
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_TWO, cId);


			preparedStatement.executeUpdate();

			status1 = 1;
		} catch (SQLException | IOException | ParseException | SAXException | ParserConfigurationException e) {
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
		return status1;
	}

	@Override
	public int getUnrepliedMsg() {
		int count = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			statement = connection.createStatement();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_GET_UNREPLIED_MSG);
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				count = resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE);
			}
		} catch (SQLException |ParseException | SAXException | IOException | ParserConfigurationException e) {
			logger.log(Level.SEVERE, e.getMessage());
		}  finally {
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
		return count;
	}
}
