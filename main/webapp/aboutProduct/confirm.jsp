<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="entity.Product" %>
<%@ page import="control.Product_Control" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%

String stringNumber = request.getParameter("number");
int number = Integer.parseInt(stringNumber);

String id = (String)session.getAttribute("id");

Product p = new Product();
p.setNumber(number);

Product_Control control = new Product_Control();
Boolean result = control.ConfirmProduct(id, p);

if(result==false){
	out.println("<script>alert('실패');history.back();</script>");
}
else{
	out.println("<script>history.back();</script>");
}
%>
</body>
</html>