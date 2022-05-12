package dbcon;

import java.sql.*;

public class dbcon {
	
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private String query= null;
	
	
	public dbcon(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://192.168.0.115:3306/team?" + "useUnicode=true&characterEncoding=utf8";
			String dbUser = "Usera";
			String dbPass = "1234";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			rs.close();
			stmt.close();
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setQuery(String a) {
		query = a;
	}
	
	public ResultSet getRS() {
		try {
			rs=stmt.executeQuery(query);
		}catch(Exception e) {}
		return rs;
	}
}
