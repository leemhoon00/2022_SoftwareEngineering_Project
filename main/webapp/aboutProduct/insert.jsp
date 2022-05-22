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
String title= request.getParameter("title");
String stringprice= request.getParameter("price"); 
String content= request.getParameter("content"); 
String id = (String)session.getAttribute("id");

//필수값체크
if(title==null || title.equals("") || stringprice==null || stringprice.equals("")){
	out.println("<script>alert('필수란을 입력해주세요!');history.back();</script>");
}

int price = Integer.parseInt(stringprice);

Product p = new Product(title,price,content);

Product_Control control = new Product_Control();
Boolean result = control.InsertProduct(id, p);

if(result==false){
	out.println("<script>alert('실패');history.back();</script>");
}
else{
	out.println("<script>history.back();</script>");
}
%>
</body>
</html>