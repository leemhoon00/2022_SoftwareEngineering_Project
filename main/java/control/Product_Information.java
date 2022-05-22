package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import entity.Product;

public class Product_Information {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String jdbcDriver = "jdbc:mysql://localhost:3306/se?" + "useUnicode=true&characterEncoding=utf8";
	private String dbUser = "usera";
	private String dbPass = "1234";
	
	
	public Product_Information() {
		DBconn();
	}
	
	public Product getProductInformation(String id, int number) {
		Product p = new Product();
		
		//선택한 테이블이 없는 경우
		if(number == 0) {
			p.setBuy_confirm(false);
			p.setBuyer("");
			p.setCancel_button(false);
			p.setConfirm_button(false);
			p.setContent("");
			p.setDate("");
			p.setDelete_button(false);
			p.setInsert_button(true);
			p.setNumber(0);
			p.setPrice(0);
			p.setRequest_button(false);
			p.setSell_confirm(false);
			p.setSeller("");
			p.setSeller_button(false);
			p.setStatus("0");
			p.setTitle("");
			p.setUpdate_button(false);
		}
		
		
		else {
			p.setInsert_button(false);
			p.setSeller_button(true);
			
			try {
				String sql = "select * from product where number="+number;
				
				conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					p.setNumber(rs.getInt("number"));
					p.setTitle(rs.getString("title"));
					p.setSeller(rs.getString("seller"));
					p.setPrice(rs.getInt("price"));
					p.setDate(rs.getString("regdate"));
					p.setContent(rs.getString("content"));
					
					
					// 판매자
					if(rs.getString("seller").equals(id)) {
						
						
						
						// 거래요청이 있을때
						if(!rs.getString("buyer").equals("")) {
							
							p.setRequest_button(false);
							p.setDelete_button(false);
							p.setUpdate_button(false);
							
							// 이미 판매 확정을 햇을경우
							if(rs.getString("sell_confirm").equals("1")) {
								p.setConfirm_button(false);
								p.setCancel_button(false);
							}
							else {
								p.setConfirm_button(true);
								p.setCancel_button(true);
							}
						}
						// 거래요청이 없을때
						else {
							p.setConfirm_button(false);
							p.setCancel_button(false);
							p.setRequest_button(false);
							p.setDelete_button(true);
							p.setUpdate_button(true);
						}
					}
					
					// 구매자
					else {
						p.setDelete_button(false);
						p.setUpdate_button(false);
						
						
						
						//거래 중일때
						if(!rs.getString("buyer").equals("")) {
							p.setRequest_button(false);
							
							//그 거래 신청자가 자신일때
							if(rs.getString("buyer").equals(id)) {
								
								//이미 구매확정을 한 경우
								if(rs.getString("buy_confirm").equals("1")) {
									p.setConfirm_button(false);
									p.setCancel_button(false);
								}
								else {
									p.setConfirm_button(true);
									p.setCancel_button(true);
								}
							}
							
							//다른 사용자랑 거래중일 때
							else {
								p.setConfirm_button(false);
								p.setCancel_button(false);
								
							}
						}
						
						//거래 중이 아닐때
						else {
							p.setRequest_button(true);
							p.setConfirm_button(false);
							p.setCancel_button(false);
						}
					}
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return p;
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
