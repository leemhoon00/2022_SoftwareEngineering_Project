package control;

import java.sql.*;
import db.DBcon;

// 로그인 컨트롤 클래스
// 아이디 패스워드가 정상인지 확인
public class Login {
	
	private String ID;
	private String PW;
	
	public static Boolean Check_Login(String id, String pw) {
		DBcon db = new DBcon();
		
		db.setQuery("select count(*) from user where id='"+id+"'");
		
		ResultSet rs = db.getRS();
		try {
			rs.next();
			if(rs.getInt(1) == 0) {
				rs.close();
				return false;
			}
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		db.close();
		return true;
	}
}
