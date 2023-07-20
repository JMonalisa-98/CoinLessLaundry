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
import com.org.model.Feedback;
import com.org.util.CommonConstants;
import com.org.util.ConnectDB;
import com.org.util.QueryUtil;

public class FeedbackServiceImple implements FeedbackService {

	private static Connection connection;
	private static Statement statement;
	private static PreparedStatement preparedStatement;

	@Override
	public int addFeedback(Feedback feedback) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = QueryUtil.queryByID(CommonConstants.QUERY_INSERT_INTO_FEEDBACK);

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, feedback.getUserId());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, feedback.getFeedback());

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
	public ArrayList<Feedback> viewFeedback() {
		ArrayList<Feedback> feedbackList = new ArrayList<Feedback>();
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_SELECT_FROM_TABLE_FEEDBACK);
			statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				Feedback feedback = new Feedback();
				feedback.setFeedbackId(resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE));
				feedback.setUserId(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				feedback.setFeedback(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				feedback.setDate(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				
				feedbackList.add(feedback);
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
		return feedbackList;
	}

}
