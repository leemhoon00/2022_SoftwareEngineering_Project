<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>


<!-- 데이터베이스 연결 -->
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String query= null;

String jdbcDriver = "jdbc:mysql://192.168.0.115:3306/team?" + "useUnicode=true&characterEncoding=utf8";
String dbUser = "Usera";
String dbPass = "1234";
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
stmt = conn.createStatement();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");

query = "insert into board(title,content) values('"+title+"', '"+content+"')";
stmt.executeUpdate(query);

response.sendRedirect("main.jsp");
%>
</body>
</html>