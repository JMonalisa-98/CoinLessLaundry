package com.org.service;
import java.util.logging.Logger;


public interface UserService {
	//Initializing logger
	public static final Logger logger = Logger.getLogger(UserService.class.getName());
	
	/**
	 * Login
	 * 
	 * @param userID, password
	 */
	public int validate(String userId, String password);
}
