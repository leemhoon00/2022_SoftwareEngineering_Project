package control;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import entity.Product;

public class Product_Search {
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String jdbcDriver = "jdbc:mysql://localhost:3306/se?" + "useUnicode=true&characterEncoding=utf8";
	private String dbUser = "usera";
	private String dbPass = "1234";
	
	public Product_Search() {
		DBconn();
	}
	
	public List<Product> getAllList(){
		
		List<Product> list = new ArrayList<Product>();
		
		
		try {
			String sql = "select * from product";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Product p = new Product();
				p.setNumber(rs.getInt("number"));
				p.setTitle(rs.getString("title"));
				p.setSeller(rs.getString("seller"));
				p.setDate(rs.getString("regdate"));
				
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
	
	public List<Product> getSearchedList(String category, String content){
		List<Product> list = new ArrayList<Product>();
		
		try {
			String sql;
			
			if(category.equals("Á¦¸ñ")) {
				sql = "select * from product where title like '%"+content+"%'";
			}
			else {
				sql = "select * from product where seller like '%"+content+"%'";
			}
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Product p = new Product();
				p.setNumber(rs.getInt("number"));
				p.setTitle(rs.getString("title"));
				p.setSeller(rs.getString("seller"));
				p.setDate(rs.getString("regdate"));
				
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
	
	private void DBconn() {
		try {
			Class.forName(driver);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
