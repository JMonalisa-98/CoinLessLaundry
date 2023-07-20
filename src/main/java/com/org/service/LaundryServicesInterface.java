package com.org.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.org.model.LaundryServices;

public interface LaundryServicesInterface {
	    //Initialize logger
		public static final Logger logger = Logger.getLogger(LaundryServicesInterface.class.getName());
		
		/**
		 * Add Services for Laundry services table
		 * 
		 * @param LaundaryServices
		 */
		public int addService(LaundryServices lauServices);
		
		/**
		 * View laudry services from Laudry Services table
		 * 
		 * @return ArrayList<LaundryServices>
		 */
		public ArrayList<LaundryServices> viewLaundryServices();
		

		/**
		 * Update laudry services from Laudry Services table
		 * 
		 * @return int
		 */
		public int updateService(LaundryServices laundryServices);
		
		/**
		 * Delete laudry services from Laudry Services table
		 * 
		 * @return int
		 */
		public int deleteService(String id);
		
		/**
		 * Select laudry services from Laudry Services table by Id
		 * 
		 * @return LaundaryServices
		 */
		public LaundryServices getServiceById(String id);
		
		/**
		 * Select laudry services from Laudry Services table by Id
		 * 
		 * @return ArrayList<LaundaryServices>
		 */
		public ArrayList<LaundryServices> getServicesById(String id);
	
		
}
