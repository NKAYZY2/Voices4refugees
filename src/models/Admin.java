package models;

public class Admin extends User {

	final private String adminName = "wfr@2017";
	final private String adminPassword = "12345";

	String getAdminPassword() {
		return adminPassword;
	}

	String getAdminName() {
		return adminName;
	}

}
