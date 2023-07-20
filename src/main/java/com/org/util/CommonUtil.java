package com.org.util;
import java.io.IOException;
import java.util.Properties;

public class CommonUtil {

	public static final Properties properties = new Properties();

	static {
		try {	
			// Read the property only once when load the class
			properties.load(QueryUtil.class.getResourceAsStream(CommonConstants.PROPERTY_FILE));
			
		} catch (IOException e) {
			System.out.println(e);
		}
	}
}
