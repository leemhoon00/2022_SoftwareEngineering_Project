<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="entity.Transaction_Record" %>
<%@ page import="control.Save_Review" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
String content = (String)request.getParameter("content");
String temp = (String)request.getParameter("score");
int score = Integer.parseInt(temp);

temp = (String)request.getParameter("number");
int number = Integer.parseInt(temp);

Transaction_Record p = new Transaction_Record();
p.setNumber(number);
p.setContent(content);
p.setScore(score);

Save_Review control = new Save_Review();

Boolean result = control.Update_Review(p);

if(result==false){
	System.out.println("실패");
}
else{
	System.out.println("성공");
}

%>
</body>
</html>