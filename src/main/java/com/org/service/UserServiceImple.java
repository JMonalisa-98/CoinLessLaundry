package com.org.service;
import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;

import javax.xml.parsers.ParserConfigurationException;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import com.org.util.CommonConstants;
import com.org.util.QueryUtil;

/*
 * @author : */
public class UserServiceImple implements UserService {

	private static Connection connection;
	private static PreparedStatement preparedStatement;

	@Override
	public int validate(String userId, String password) {
		int status = 0;
		
		try {
			connection = com.org.util.ConnectDB.getDBConnection();
			
			String sql = QueryUtil.queryByID(CommonConstants.QUERY_USER_VALIDATE);
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, userId);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			if(rs.next()) {
				if(password.equals(rs.getString(1))) {
					status = 1;
				}
			}
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
	
	
}
