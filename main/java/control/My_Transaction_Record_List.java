package control;

import java.sql.*;
import entity.Transaction_Record;
import java.util.ArrayList;
import java.util.List;


public class My_Transaction_Record_List {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String jdbcDriver = "jdbc:mysql://localhost:3306/se?" + "useUnicode=true&characterEncoding=utf8";
	private String dbUser = "usera";
	private String dbPass = "1234";
	
	
	
	
	
	public List<Transaction_Record> getBuyRecordList(String id){
		List<Transaction_Record> list = new ArrayList<Transaction_Record>();
		
		try {
			String sql = "select * from review where buyer='"+id+"'";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Transaction_Record p = new Transaction_Record();

				p.setNumber(rs.getInt("number"));
				p.setTitle(rs.getString("title"));
				p.setRegdate(rs.getString("regdate"));
				
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
	
	public List<Transaction_Record> getSellRecordList(String id){
		List<Transaction_Record> list = new ArrayList<Transaction_Record>();
		
		try {
			String sql = "select * from review where seller='"+id+"'";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Transaction_Record p = new Transaction_Record();
				p.setNumber(rs.getInt("number"));
				p.setTitle(rs.getString("title"));
				p.setRegdate(rs.getString("regdate"));
				
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
	
	
	public My_Transaction_Record_List() {
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
