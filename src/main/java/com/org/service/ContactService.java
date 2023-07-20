package com.org.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.org.model.Contact;;

public interface ContactService {
	//Initialize logger
		public static final Logger logger = Logger.getLogger(FeedbackService.class.getName());
		
		/**
		 * Add Contact for contact table
		 * 
		 * @param contact
		 */
		public int addContact(Contact contact);
		
		/**
		 * View contact forms from contact table
		 * 
		 * @return ArrayList<Contact>
		 */
		public ArrayList<Contact> viewContact();
		
		/**
		 * Update status of contact from contact table
		 * 
		 * @param cId, status
		 * @return int
		 */
		public int updateStatus(int cId, String status);
		
		/**
		 * Get number of unreplied messages
		 * 
		 * @return int
		 */
		public int getUnrepliedMsg();
}
