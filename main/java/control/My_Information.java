package control;

import java.sql.*;
import entity.User;

public class My_Information {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String jdbcDriver = "jdbc:mysql://localhost:3306/se?" + "useUnicode=true&characterEncoding=utf8";
	private String dbUser = "usera";
	private String dbPass = "1234";
	
	

	public User getUser(String id) {
		User user = new User(id);
		
		try {
			String sql = "select * from user where id='"+id+"'";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				user.setName(rs.getString("name"));
				user.setPhoneNumber(rs.getString("phone"));
				user.setPw(rs.getString("pw"));
				user.setRegion(rs.getString("region"));
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public My_Information() {
		DBconn();
	}
	
	private void DBconn() {
		try {
			Class.forName(driver);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
