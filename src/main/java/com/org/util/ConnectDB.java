package com.org.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*Create database connection
 *In this project we use MySql Database*/

public class ConnectDB extends CommonUtil {

	private static Connection connection;

	public ConnectDB() {
		super();
		// TODO Auto-generated constructor stub
	}

	/*
	 * Database is created using the given URL, userName and password which is
	 * included in config.properties This will return Connection type object
	 * ClassNotFoundException and SQLException is included
	 */

	public static Connection getDBConnection() {
		/* Create new Connection when the connection is closed or Null */
		try {
			if (connection == null || connection.isClosed()) {

				Class.forName(properties.getProperty(CommonConstants.DRIVER_NAME));
				connection = DriverManager.getConnection(properties.getProperty(CommonConstants.URL), 
						properties.getProperty(CommonConstants.USERNAME), 
						properties.getProperty(CommonConstants.PASSWORD) );
			}
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		return connection;
	}
}
