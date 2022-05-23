package control;

import entity.Transaction_Record;
import java.sql.*;

public class Show_Transaction_Record {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String jdbcDriver = "jdbc:mysql://localhost:3306/se?" + "useUnicode=true&characterEncoding=utf8";
	private String dbUser = "usera";
	private String dbPass = "1234";
	
	
	
	public Transaction_Record get_Transaction_Record(int number) {
		Transaction_Record p = new Transaction_Record();
		
		try {
			String sql = "select * from review where number="+number;
			
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				p.setNumber(number);
				p.setSeller(rs.getString("seller"));
				p.setPrice(rs.getInt("price"));
				p.setTitle(rs.getString("title"));
				p.setP_content(rs.getString("p_content"));
				p.setRegdate(rs.getString("regdate"));
				p.setBuyer(rs.getString("buyer"));
				if(rs.getString("status").equals("0")) {
					p.setContent("");
					p.setScore(-1);
					p.setStatus("0");
				}
				else {
					p.setContent(rs.getString("content"));
					p.setScore(rs.getInt("score"));
					p.setStatus("1");
				}
				
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return p;
	}
	
	
	public Show_Transaction_Record() {
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
