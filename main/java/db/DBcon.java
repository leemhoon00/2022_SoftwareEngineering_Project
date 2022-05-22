package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBcon {
	
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private String query= null;
	
	
	public DBcon(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/se?" + "useUnicode=true&characterEncoding=utf8";
			String dbUser = "usera";
			String dbPass = "1234";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}
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
		}catch(Exception e) {e.printStackTrace();}
		return rs;
	}
	
	public Boolean Execute() {
		try {
			stmt.executeUpdate(query);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}