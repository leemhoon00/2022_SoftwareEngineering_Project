package control;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import entity.Transaction_Record;
import entity.User;


public class Show_Seller {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String jdbcDriver = "jdbc:mysql://localhost:3306/se?" + "useUnicode=true&characterEncoding=utf8";
	private String dbUser = "usera";
	private String dbPass = "1234";
	
	public List<Transaction_Record> getList(User user){
		List<Transaction_Record> list = new ArrayList<Transaction_Record>();
		
		try {
			String sql = "select * from review where seller='"+user.getId()+"' and status ='1'";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Transaction_Record p = new Transaction_Record();

				p.setScore(rs.getInt("score"));
				p.setContent(rs.getString("content"));
				
				list.add(p);
			}
			
			rs.close();
			stmt.close();
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public User Select_Seller(User user) {
		try {
			String sql = "select * from user where id='"+user.getId()+"'";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				user.setRegion(rs.getString("region"));
				user.setPhoneNumber(rs.getString("phone"));
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
	
	public Boolean Has_Record(User user) {
		Boolean result=false;
		try {
			String sql = "select count(*) from review where seller='"+user.getId()+"'";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int temp = rs.getInt(1);
				if(temp>0) {
					result=true;
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Show_Seller() {
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
