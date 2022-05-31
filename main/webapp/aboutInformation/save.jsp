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
if(content==null || content.equals("") || temp==null || temp.equals("")){
	out.println("<script>alert('필수란을 입력해주세요!');history.back();</script>");
}

int score = Integer.parseInt(temp);
if(score<0 || score>100){
	out.println("<script>alert('0<=점수<=100');history.back();</script>");
}
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