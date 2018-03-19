package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Properties;

import org.jasypt.util.password.StrongPasswordEncryptor;

public class Sqlhelper2 {

	private static StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();

	private static boolean check;
	private static String encryptedPassword;
	private static String dbhash;
	private static boolean check2;
	@SuppressWarnings("unused")
	private String lettertype;

	@SuppressWarnings("unused")
	private int number;
	private static Connection con1;
	private static ArrayList<Integer> Per_case_results = new ArrayList<Integer>(7);
	private static ArrayList<Integer> Total_per_Case_results = new ArrayList<Integer>();

	private static String connection = "com.mysql.jdbc.Driver";

	public static void getConnection() throws SQLException {
		try {
			Class.forName(connection);

		} catch (ClassNotFoundException ex) {
			System.out.println("Error: unable to load driver class!");
			System.exit(1);
		}

		// properties method form java.util that passes the properties of the

		 Properties properties = new Properties();
		 properties.setProperty("user", "root");
		 properties.setProperty("password", "campiones");
		 properties.setProperty("useSSL", "false");
		 properties.setProperty("autoReconnect", "true");
		 con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/UserAccounts", "root", "campiones");

////		DB_URL = "jdbc:mysql://aa1sre6rwhyu2hx.caffctpwkarx.ap-southeast-1.rds.amazonaws.com:3306/UserAccounts?user=root&password=east123voices";
//		con1 = DriverManager.getConnection("jdbc:mysql://aan41z9fsww80n.caffctpwkarx.ap-southeast-1.rds.amazonaws.com:3306/UserAccounts?user=root&password=east123voices");

	}
	// -----------------------------------------------------------------------------------------------------

	// -------------------------------------------------------------------------------------------------------------------//
	public static void addAccount(String firstname, String lastname, String email, String password)

			throws SQLException, ClassNotFoundException {

		Sqlhelper2.getConnection();

		PreparedStatement ps = con1
				.prepareStatement("insert into USERS(Firstname , Lastname , Email,Password ) values(?,?,?,?)");

		ps.setString(1, firstname);
		ps.setString(2, lastname);
		ps.setString(3, email);
		ps.setString(4, password);

		// Sqlhelper.encrypt(password)line was taken out and replaced with the
		// word password in line 66
		ps.executeUpdate();

		con1.close();

	}

	// ----------------------------------------------------------------------------------------------------------------//
	// method that encrypts the password before it gets saved into the database
	// using the jasypt library.

	public static String encryptpassword(String password) {

		encryptedPassword = passwordEncryptor.encryptPassword(password);

		return encryptedPassword;

	}

	// -----------------------------------------------------------------------------------------------------------

	public static boolean AccountExists(String email) throws SQLException {
		boolean exist_result = false;
		String checkUser = null;

		System.out.println("about to check whether account exists");
		Sqlhelper2.getConnection();

		java.sql.Statement st = con1.createStatement();
		ResultSet rs3 = st.executeQuery("select * from USERS where Email  = '" + email + "'");

		if (rs3.next()) {
			checkUser = rs3.getString("Email");
			if (checkUser.equals(email)) {
				exist_result = true;
			} else {
				exist_result = false;
			}
		}

		con1.close();

		System.out.println(exist_result);
		return exist_result;
	}
	// ----------------------------------------------------------------------------------------------------------------//

	public static boolean validate(String email, String password) throws SQLException {

		Sqlhelper2.getConnection();
		System.out.println("getting connection");

		java.sql.Statement st = con1.createStatement();

		ResultSet rs3 = st.executeQuery("select * from USERS where Email  = '" + email + "'");

		if (rs3.next()) {

			dbhash = rs3.getString(4);

			check = passwordEncryptor.checkPassword(password, dbhash);

			System.out.println("Just checked password, now it returns the  boolean for .checkpassword");

			if (check == true) {

				check2 = true;

			} else {
				check2 = false;

			}

		} else {
			check2 = false;
			// redirect to an error jsp pagewith a link to log in a again
		}
		con1.close();

		return check2;

	}

	public static void submitletter(Letter submitted_letter) throws SQLException {

		String email = submitted_letter.getName_of_user();
		String lettertype = submitted_letter.getCase_of_Letter();
		int num = submitted_letter.getQuantity();

		try {
			Sqlhelper2.getConnection();
			System.out.println("connection has been gotten");
		} catch (SQLException e) {

			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		java.sql.Timestamp time = new java.sql.Timestamp(calendar.getTime().getTime());

		for (int i = 1; i <= num; i++) {
			PreparedStatement ps = con1.prepareStatement("Insert into Letters(time, user, casetype) values(?,?,?)");

			System.out.println(time.toString());
			
			ps.setString(1, time.toString());

			ps.setString(2, email);

			ps.setString(3, lettertype);

			ps.executeUpdate();

		}
		con1.close();
		
	} 

	public static void user_submitted_per_case(String email) throws SQLException {

		// per Case
		Sqlhelper2.getConnection();

		Per_case_results = new ArrayList<Integer>();

		for (int i = 1; i <= 7; i++) {

			java.sql.Statement st = con1.createStatement();

			ResultSet rs3 = st.executeQuery("select count(*) from Letters where casetype = '" + "case" + i + "'"
					+ "and user = '" + email + "'");

			rs3.next();

			int num_letter_per_case = rs3.getInt(1);

			Per_case_results.add(num_letter_per_case);
			System.out.println(Per_case_results.toString());

		}

		con1.close();
		return;

	}
	

	/*
	 * this method is going to determine the total number of letters written per
	 * user.
	 */
	public static int user_total_submitted(String email) throws SQLException {
		Sqlhelper2.getConnection();
		java.sql.Statement st = con1.createStatement();

		ResultSet rs3 = st.executeQuery("select count(*) from Letters where user = '" + email + "'");

		rs3.next();

		int number = rs3.getInt(1);
		con1.close();
		return number;

	}
	

	public static ArrayList<Integer> Per_case_results() {
		return Per_case_results;
	}

	public static ArrayList<Integer> Total_per_Case_results() {
		return Total_per_Case_results;
	}


	public static void admin_total_percase() throws SQLException {
		Sqlhelper2.getConnection();

		Total_per_Case_results = new ArrayList<Integer>();

		for (int i = 1; i <= 7; i++) {

			java.sql.Statement st = con1.createStatement();

			ResultSet rs3 = st.executeQuery("select count(*) from Letters where casetype = '" + "case" + i + "'");

			rs3.next();

			int num_letter_per_case = rs3.getInt(1);

			Total_per_Case_results.add(num_letter_per_case);
			System.out.println(Total_per_Case_results.toString());

		}

		con1.close();

	}

	public static int admin_get_total_letters() throws SQLException {

		Sqlhelper2.getConnection();

		java.sql.Statement st = con1.createStatement();

		ResultSet rs3 = st.executeQuery("select count(*) from Letters");

		rs3.next();

		int number = rs3.getInt(1);
		con1.close();
		return number;

	}

	public static int admin_get_total_users() throws SQLException {

		Sqlhelper2.getConnection();

		java.sql.Statement st = con1.createStatement();

		ResultSet rs3 = st.executeQuery("select count(*) from USERS");
		rs3.next();

		int number = rs3.getInt(1);
		con1.close();
		return number;

	}

	public static boolean change_Password(boolean Account_Exists, String email_to_be_reset, String New_Password)
			throws SQLException {

		boolean status_of_change;

		if (Account_Exists == true) {

			Sqlhelper2.getConnection();

			java.sql.Statement st = con1.createStatement();

			try {
				st.executeUpdate("update USERS set Password = '" + New_Password + "'" + " where Email = '"
						+ email_to_be_reset + "'");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				status_of_change = false;
				e.printStackTrace();
			}

			status_of_change = true;

		} else {

			status_of_change = false;
		}

		return status_of_change;

	}
	
	
	public static String getTimesubmission() throws SQLException {
//method that gets the time already recorded in the database at which different letters were submitted.
		
		try {
			Sqlhelper2.getConnection();
			System.out.println("connection has been gotten");
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		java.sql.Statement st = con1.createStatement();
		ResultSet rs3 = st.executeQuery("select time from Letters");
		
		
			
			while(rs3.next()){
				
				//get the data from the columns perhaps into two variables - one a time object variable 
				//a string OR we might need to create another class to be able to hold both a time and 
				//string as one object to be passed into an Arraylist.
				
				// get code that will add objects(time/case) into the Arraylist
				
				
				
			}
			return connection;

//			System.out.println(time.toString());
//			
//			ps.setString(1, time.toString());
//
//			ps.setString(2, email);
//
//			ps.setString(3, lettertype);
//
//			ps.executeUpdate();
//
//		}
//		con1.close();
		
	} 

}
