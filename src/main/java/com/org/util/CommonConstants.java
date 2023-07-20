	package com.org.util;

/*In this file common constants have been declared.
 * @author W.G. YASIRU RANDIKA IT19131184*/
 
public class CommonConstants {

	/** Constant for config.properties key for query file path */
	public static final String QUERY_XML = "queryFilePath";

	/** Constant for file path of config.properties */
	public static final String PROPERTY_FILE = "config.properties";

	/** Constant for query tag in washpointQuery.xml */
	public static final String TAG_NAME = "query";

	/** Constant for query id in EmployeeQuery.xml */
	public static final String ATTRIB_ID = "id";
	
	/** Constant for comma */
	public static final String COMMA = ",";

	/** Constant for url key of MySQL database in config.properties */
	public static final String URL = "url";

	/** Constant for user name key of MySQL database in config.properties */
	public static final String USERNAME = "username";

	/** Constant for password key of MySQL database in config.properties */
	public static final String PASSWORD = "password";

	/** Constant for driver name key of MySQL database in config.properties */
	public static final String DRIVER_NAME = "driverName";
	
	/** Constant for get all from feedback table**/
	public static final String QUERY_VIEW_FEEDBACK_TABLE = "select_feedback_table";
	
	/** Constant for a customer from customer table**/
	public static final String QUERY_VIEW_CUSTOMER_TABLE = "select_customer_table";
	
	/** Constant for get all from customer table**/
	public static final String QUERY_VIEW_BY_ID_CUSTOMER_TABLE = "select_byId_customer_table";
	
	/** Constant for drop table customer**/
	public static final String QUERY_CUTOMER_DROP_TABLE = "drop_customer_table";
	
	/** Constant for drop table customer**/
	public static final String QUERY_CREATE_CUSTOMER_TABLE = "create_customer_table";
	
	/** Constant for update values in customer table**/
	public static final String QUERY_UPDATE_CUSTOMER_TABLE = "update_customer_table";
	
	/** Constant for get the new userId values in customer table**/
	public static final String QUERY_GET_NEW_USERID = "get_newUserId";
	
	/** Constant for insert into customer table**/
	public static final String QUERY_INSERT_INTO_CUSTOMER_TABLE = "insert_into_customer_table";
	
	/** Constant for delete values in customer table**/
	public static final String QUERY_DELETE_FROM_CUSTOMER_TABLE = "delete_customr_from_customer_table";
	
	/** Constant for create customer audit table**/
	public static final String QUERY_CREATE_CUSTOMER_AUDIT_TABLE = "create_customer_audit_table";
	
	/** Constant for drop customer audit table**/
	public static final String QUERY_DROP_CUSTOMER_AUDIT_TABLE = "drop_customer_audit_table";
	
	/** Constant for trigger for insert before on customer table**/
	public static final String TRIGGER_INSERT_BEFORE_CUSTOMER_TABLE = "trigger_insert_to_customerregaudit";
	
	/** Constant for trigger for insert after on customer table**/
	public static final String TRIGGER_INSERT_AFTER_CUSTOMER_TABLE_TO_USER_LOGIN = "trigger_after_insert_customer";
	
	/** Constant for trigger for update to userlogin**/
	public static final String TRIGGER_UPDATE_BEFORE_CUSTOMER_TABLE = "trigger_update_to_userlogin";
	
	/** Constant for trigger for delete before a customer**/
	public static final String TRIGGER_DELETE_BEFORE_CUSTOMER_TABLE = "trigger_before_delete_customer";
	
	/** Constant for create tabel userlogin**/
	public static final String QUERY_USERLOGIN_TABLE = "create_table_userlogin";
	
	/** Constant for drop tabel userlogin**/
	public static final String QUERY_DROP_TABLE_USERLOGIN = "drop_table_userlogin";
	
	/** Constant for create table employee**/
	public static final String QUERY_CREATE_EMPLOYEE_TABLE = "create_employee_table";
	
	/** Constant for create table employee**/
	public static final String QUERY_DROP_TABLE_EMPLOYEE = "drop_employee_table";
	
	/** Constant for update values in employee table**/
	public static final String QUERY_UPDATE_EMPLOYEE_TABLE = "update_employee_table"; 
	
	/** Constant for insert into values in employee table**/
	public static final String QUERY_INSERT_INTO_EMPLOYEE_TABLE = "insert_into_employee_table";
	
	/** Constant for delete values in employee table**/
	public static final String QUERY_DELETE_FROM_EMPLOYEE_TABLE = "delete_employee_from_employee_table";
	
	/** Constant for create employee audit table**/
	public static final String QUERY_CREATE_EMPLOYEE_AUDIT_TABLE = "create_employee_audit_table";
	
	/** Constant for drop employee audit table**/
	public static final String QUERY_DROP_EMPLOYEE_AUDIT_TABLE = "drop_employee_audit_table";
	
	/** Constant for trigger for insert before on employee table**/
	public static final String TRIGGER_INSERT_BEFORE_EMPLOYEE_TABLE = "trigger_insert_to_employeeregaudit";
	
	/** Constant for trigger for insert after on employee table**/
	public static final String TRIGGER_INSERT_AFTER_EMPLOYEE_TABLE_TO_USER_LOGIN = "trigger_after_insert_employee";
	
	/** Constant for trigger for update to userlogin (employee)**/
	public static final String TRIGGER_UPDATE_BEFORE_EMPLOYEE_TABLE = "trigger_update_to_userlogin_employee";
	
	/** Constant for trigger for delete before a employee**/
	public static final String TRIGGER_DELETE_BEFORE_EMPLOYEE_TABLE = "trigger_before_delete_employee";
	
	/** Constant for get all from employee table**/
	public static final String QUERY_VIEW_EMPLOYEE_TABLE = "select_employee_table";
	
	/** Constant for get an employee from employee table**/
	public static final String QUERY_VIEW_BY_ID_EMPLOYEE_TABLE = "select_byId_employee_table";
	
	/** Constant for create table feedback**/
	public static final String QUERY_CREATE_TABLE_FEEDBACK = "create_table_feedback";
	
	/** Constant for drop table feedback**/
	public static final String QUERY_DROP_TABLE_FEEDBACK = "drop_table_feedback";
	
	/** Constant for select from table feedback**/
	public static final String QUERY_SELECT_FROM_TABLE_FEEDBACK = "select_table_feedback";
	
	/** Constant for insert into table feedback**/
	public static final String QUERY_INSERT_INTO_FEEDBACK = "insert_into_table_feedback";
	
	/** Constant for create table contact**/
	public static final String QUERY_CREATE_TABLE_CONTACT = "create_table_contact";
	
	/** Constant for drop table contact**/
	public static final String QUERY_DROP_TABLE_CONTACT = "drop_table_contact";
	
	/** Constant for count unreplied messages**/
	public static final String QUERY_GET_UNREPLIED_MSG = "count_unreplied_messages";
	
	/** Constant for select from table contact**/
	public static final String QUERY_SELECT_FROM_TABLE_CONTACT = "select_table_contact";
	
	/** Constant for insert into table contact**/
	public static final String QUERY_INSERT_INTO_CONTACT = "insert_into_table_contact";
	
	/** Constant for update status contact table**/
	public static final String QUERY_UPDATE_STATUS_CONTACT_TABLE = "update_contact_table_status";
	
	/** Constant for create table services**/
	public static final String QUERY_CREATE_TABLE_SERVICES = "create_services_table";
	
	/** Constant for drop table services**/
	public static final String QUERY_DROP_TABLE_SERVICES = "drop_services_table";
	
	/** Constant for select from table services**/
	public static final String QUERY_SELECT_FROM_TABLE_SERVICES = "seletct_from_table_services";
	
	/** Constant for insert into table services**/
	public static final String QUERY_INSERT_INTO_SERVICES = "insert_into_table_services";
	
	/** Constant for delete from services**/
	public static final String QUERY_DELETE_FROM_SERVICES = "delete_service_from_services_table";
	
	/** Constant for update from services**/
	public static final String QUERY_UPDATE_FROM_SERVICES = "update_service_table";
	
	/** Constant for create table auditServices**/
	public static final String QUERY_CREATE_TABLE_AUDIT_SERVICES = "create_service_audit_table";
	
	/** Constant for drop table auditServices**/
	public static final String QUERY_DROP_TABLE_AUDIT_SERVICES = "drop_service_audit_table";
	
	/** Constant for trigger for insert before a service**/
	public static final String TRIGGER_INSERT_BEFORE_SERVICES_TABLE = "trigger_insert_to_servicesaudit";
	
	/** Constant for query to view service by id**/
	public static final String QUERY_VIEW_SERVICE_BY_ID = "select_byId_services_table";
	
	/** Constant for query to create orders table**/
	public static final String QUERY_CREATE_ORDERS_TABLE = "create_table_orders";
	
	/** Constant for query to insert into orders table**/
	public static final String QUERY_INSERT_INTO_ORDERS_TABLE= "insert_into_table_orders";
	
	/** Constant for query to drop orders table**/
	public static final String QUERY_DROP_ORDERS_TABLE = "drop_orders_table";
	
	/** Constant for query to create order audit table**/
	public static final String QUERY_CREATE_ORDER_AUDIT_TABLE = "create_orders_audit_table";
	
	/** Constant for query to drop order audit table**/
	public static final String QUERY_DROP_ORDER_AUDIT_TABLE = "drop_orders_audit_table";
	
	/** Constant for query to select all from orders table**/
	public static final String QUERY_SELECT_FROM_ORDERS = "select_orders_table";
	
	/** Constant for trigger to insert before order table**/
	public static final String TRIGGER_INSERT_BEFORE_ORDER_TABLE = "trigger_insert_to_order_gaudit";
	
	/** Constant for change status of order**/
	public static final String QUERY_CHANGE_STATUS_ORDER_TABLE = "change_status_order_table";
	
	/** Constant for view order by id**/
	public static final String QUERY_SELECT_BY_ID_ORDER_TABLE = "get_order_by_id";
	
	/** Constant for view order by id**/
	public static final String QUERY_USER_VALIDATE = "user_login_validate";
	
	/** Constant for view total orders**/
	public static final String QUERY_TOTAL_NUM_ORDERS = "view_total_order";
	
	/** Constant for view total orders today**/
	public static final String QUERY_TOTAL_NUM_ORDERS_TODAY = "view_total_order_today";
	
	/** Constant for view total income today**/
    public static final String QUERY_TOTAL_INCOME_ORDERS_TODAY = "toal_income_today";
    
    /** Constant for view total income**/
    public static final String QUERY_TOTAL_INCOME_ORDERS = "view_toal_income";
    
    /** Constant for view total customers**/
    public static final String QUERY_TOTAL_CUSTOMERS = "view_total_customers";
    
    /** Constant for view new customers today**/
    public static final String QUERY_TOTAL_CUSTOMERS_TODAY = "view_new_customers_today";
			
	/** Constant for Column index one */
	public static final int COLUMN_INDEX_ONE = 1;
	
	/** Constant for Column index two */
	public static final int COLUMN_INDEX_TWO = 2;
	
	/** Constant for Column index three */
	public static final int COLUMN_INDEX_THREE = 3;
	
	/** Constant for Column index four */
	public static final int COLUMN_INDEX_FOUR = 4;
	
	/** Constant for Column index eight */
	public static final int COLUMN_INDEX_EIGHT = 8;
	
	/** Constant for Column index six */
	public static final int COLUMN_INDEX_SIX = 6;
	
	/** Constant for Column index seven */
	public static final int COLUMN_INDEX_SEVEN = 7;
	
	/** Constant for Column index five */
	public static final int COLUMN_INDEX_FIVE = 5;
	
	/** Constant for Column index nine */
	public static final int COLUMN_INDEX_NINE = 9;
	
	/** Constant for Column index ten */
	public static final int COLUMN_INDEX_TEN = 10;
	
	/** Constant for Column index eleven */
	public static final int COLUMN_INDEX_ELEVEN = 11;
	
	/** Constant for Column index twelve */
	public static final int COLUMN_INDEX_TWELEVE = 12;
}
