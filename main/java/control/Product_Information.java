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
		
		//������ ���̺��� ���� ���
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
					
					
					// �Ǹ���
					if(rs.getString("seller").equals(id)) {
						
						
						
						// �ŷ���û�� ������
						if(!rs.getString("buyer").equals("")) {
							
							p.setRequest_button(false);
							p.setDelete_button(false);
							p.setUpdate_button(false);
							
							// �̹� �Ǹ� Ȯ���� �������
							if(rs.getString("sell_confirm").equals("1")) {
								p.setConfirm_button(false);
								p.setCancel_button(false);
							}
							else {
								p.setConfirm_button(true);
								p.setCancel_button(true);
							}
						}
						// �ŷ���û�� ������
						else {
							p.setConfirm_button(false);
							p.setCancel_button(false);
							p.setRequest_button(false);
							p.setDelete_button(true);
							p.setUpdate_button(true);
						}
					}
					
					// ������
					else {
						p.setDelete_button(false);
						p.setUpdate_button(false);
						
						
						
						//�ŷ� ���϶�
						if(!rs.getString("buyer").equals("")) {
							p.setRequest_button(false);
							
							//�� �ŷ� ��û�ڰ� �ڽ��϶�
							if(rs.getString("buyer").equals(id)) {
								
								//�̹� ����Ȯ���� �� ���
								if(rs.getString("buy_confirm").equals("1")) {
									p.setConfirm_button(false);
									p.setCancel_button(false);
								}
								else {
									p.setConfirm_button(true);
									p.setCancel_button(true);
								}
							}
							
							//�ٸ� ����ڶ� �ŷ����� ��
							else {
								p.setConfirm_button(false);
								p.setCancel_button(false);
								
							}
						}
						
						//�ŷ� ���� �ƴҶ�
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
