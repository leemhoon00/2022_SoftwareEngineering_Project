<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="control.InsertUser"%>
<%@ page import="entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("IDTextbox");
String pw = request.getParameter("PWTextbox");
String name = request.getParameter("NameTextbox");
String region = request.getParameter("RegionTextbox");
String phoneNumber = request.getParameter("PhoneNumberTextbox");

// 필수값 체크
if(id==null || id.equals("") || pw==null || pw.equals("") || name==null || name.equals("") || phoneNumber==null || phoneNumber.equals("")){
	out.println("<script>alert('필수 입력칸을 입력하세요!');document.location.href='Signup_UI.jsp';</script>");
}

if(region==null || region.equals("")){
	region = "";
}

User user = new User(id,pw,name,region,phoneNumber);

InsertUser control = new InsertUser();
Boolean result = control.Insert_User(user);

// 이미 있는 아이디인지 체크
if(result == false){
	out.println("<script>alert('이미 있는 사용자입니다!');document.location.href='Signup_UI.jsp';</script>");
}
%>
<script>
window.open('','_self').close();
</script>
</body>
</html>