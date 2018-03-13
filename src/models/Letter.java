package models;

public class Letter {

	private String name_of_user;
	private String Case_of_Letter;
	private int quantity;

	// A letter has a case type
	// A letter has someone who is submitting it
	// I need to make a constructor that makes a letter that can be
	// submitted with the case type and quantity as well as the person
	// submitting it
	Letter(String user, String Case, int num) {
		this.setCase_of_Letter(Case);
		this.setName_of_user(user);
		this.setQuantity(num);
	}

	String getCase_of_Letter() {
		return Case_of_Letter;
	}

	void setCase_of_Letter(String case_of_Letter) {
		Case_of_Letter = case_of_Letter;
	}

	int getQuantity() {
		return quantity;
	}

	void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	String getName_of_user() {
		return name_of_user;
	}

	void setName_of_user(String name_of_user) {
		this.name_of_user = name_of_user;
	}

}
