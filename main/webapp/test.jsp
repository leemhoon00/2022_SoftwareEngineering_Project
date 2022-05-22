<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String query= null;
String jdbcDriver = "jdbc:mysql://localhost:3306/se?" + "useUnicode=true&characterEncoding=utf8";
String dbUser = "usera";
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
query = "insert into user values('11','11','11','11','11')";
stmt.executeUpdate(query);
%>
</body>
</html>