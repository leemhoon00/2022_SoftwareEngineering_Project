package control;
import entity.User;

import java.sql.Connection;

import db.DBcon;

public class InsertUser {
	
	private String id;
	private String pw;
	private String name;
	private String region;
	private String phoneNumber;
	
	public Boolean Insert_User(User user) {
		DBcon db = new DBcon();
		id = user.getId();
		pw = user.getPw();
		name = user.getName();
		region = user.getRegion();
		phoneNumber = user.getPhoneNumber();
		
		db.setQuery("insert into user values ('"+id+"','"+pw+"','"+name+"','"+phoneNumber+"','"+region+"')");
		
		Boolean result = db.Execute();
		
		db.close();
		return result;
	}
}
