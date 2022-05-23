package control;

import java.sql.*;
import entity.Transaction_Record;

public class Save_Review {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String jdbcDriver = "jdbc:mysql://localhost:3306/se?" + "useUnicode=true&characterEncoding=utf8";
	private String dbUser = "usera";
	private String dbPass = "1234";
	
	
	
	public Boolean Update_Review(Transaction_Record p) {
		int temp=0;
		Boolean result;
		try {
			String sql = "update review set content = ?, score = ? , status = ? where number = ?";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getContent());
			pstmt.setInt(2, p.getScore());
			pstmt.setString(3, "1");
			pstmt.setInt(4, p.getNumber());
			
			
			temp = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		if(temp==0) {
			result=false;
		}
		else {
			result=true;
		}
		
		return result;
	}
	
	
	
	public Save_Review() {
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
