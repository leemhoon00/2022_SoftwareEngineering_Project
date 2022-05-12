package signup;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class User {
	private String ID;
	private String PW;
	private String name;
	private String phone;
	
	public User(String ID, String PW, String name, String phone) {
		this.ID = ID;
		this.PW = PW;
		this.name = name;
		this.phone = phone;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPW() {
		return PW;
	}

	public void setPW(String pW) {
		PW = pW;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
