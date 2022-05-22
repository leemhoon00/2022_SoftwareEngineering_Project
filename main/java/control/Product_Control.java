package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import entity.Product;

public class Product_Control {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String jdbcDriver = "jdbc:mysql://localhost:3306/se?" + "useUnicode=true&characterEncoding=utf8";
	private String dbUser = "usera";
	private String dbPass = "1234";
	
	private Boolean result;
	
	
	public Boolean InsertProduct(String id, Product p) {
		
		int temp=0;
		try {
			String sql = "insert into product (title,seller,price,content) values(?,?,?,?)";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getTitle());
			pstmt.setString(2, id);
			pstmt.setInt(3, p.getPrice());
			pstmt.setString(4, p.getContent());
			
			
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
	
	public Boolean UpdateProduct(Product p) {
		int temp=0;
		try {
			String sql = "update product set title = ?, price = ?, content = ? where number = ?";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getTitle());
			pstmt.setInt(2, p.getPrice());
			pstmt.setString(3, p.getContent());
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
	
	public Boolean DeleteProduct(Product p) {

		int temp=0;
		
		try {
			String sql = "delete from product where number="+p.getNumber();
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			
			temp = stmt.executeUpdate(sql);
			
			stmt.close();
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
	
	public Boolean RequestProduct(String id, Product p) {
		int temp=0;
		try {
			String sql = "update product set buyer = ? where number = ?";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, p.getNumber());
			
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
	
	public Boolean CancelProduct(Product p) {
		int temp=0;
		try {
			String sql = "update product set buyer = ?, buy_confirm = ?, sell_confirm = ? where number = ?";
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "");
			pstmt.setString(2, "0");
			pstmt.setString(3, "0");
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
	
	
	public Boolean ConfirmProduct(String id, Product p) {
		int temp=0;
		
		try {
			String sql = "select * from product where number="+p.getNumber();
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				if(rs.getString("buy_confirm").equals("0") && rs.getString("sell_confirm").equals("0")) {
					if(rs.getString("seller").equals(id)) {
						sql = "update product set sell_confirm = '1' where number = "+p.getNumber();
						temp = stmt.executeUpdate(sql);
					}
					else {
						sql = "update product set buy_confirm = '1' where number = "+p.getNumber();
						temp = stmt.executeUpdate(sql);
					}
				}
				
				else {
					p.setSeller(rs.getString("seller"));
					p.setTitle(rs.getString("title"));
					p.setBuyer(rs.getString("buyer"));
					p.setContent(rs.getString("content"));
					
					sql = "delete from product where number="+p.getNumber();
					temp = stmt.executeUpdate(sql);
					
					sql = "insert into review (number,seller,title,buyer,p_content) values("+p.getNumber()+",'"+p.getSeller()+"','"+p.getTitle()+"','"+p.getBuyer()+"','"+p.getContent()+"')";
					temp = stmt.executeUpdate(sql);
				}
			}
			
			rs.close();
			stmt.close();
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
	
	public Product_Control() {
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
