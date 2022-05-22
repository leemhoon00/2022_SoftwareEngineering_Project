<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="control.Login"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

if(id == null || id.equals("") || pw == null || pw.equals("")){
	out.println("<script>alert('아이디와 비밀번호를 입력하세요!');document.location.href='Login_UI.jsp';</script>");
}

Boolean result = Login.Check_Login(id, pw);
if(result == false){
	out.println("<script>alert('아이디와 비밀번호에 해당하는 사용자가 없습니다!');document.location.href='Login_UI.jsp';</script>");
}

session.setAttribute("id", id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>중고 거래 플랫폼</title>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
    </script>
<style>
.sidebar-container {
  position: fixed;
  width: 220px;
  height: 100%;
  left: 0;
  overflow-x: hidden;
  overflow-y: auto;
  background: #1a1a1a;
  color: #fff;
}

.content-container {
  padding-top: 20px;
}

.sidebar-logo {
  padding: 10px 15px 10px 30px;
  font-size: 20px;
  background-color: #2574A9;
}

.sidebar-navigation {
  padding: 0;
  margin: 0;
  list-style-type: none;
  position: relative;
}

.sidebar-navigation li {
  background-color: transparent;
  position: relative;
  display: inline-block;
  width: 100%;
  line-height: 20px;
}

.sidebar-navigation li a {
  padding: 10px 15px 10px 30px;
  display: block;
  color: #fff;
}

.sidebar-navigation li .fa {
  margin-right: 10px;
}

.sidebar-navigation li a:active,
.sidebar-navigation li a:hover,
.sidebar-navigation li a:focus {
  text-decoration: none;
  outline: none;
}

.sidebar-navigation li::before {
  background-color: #2574A9;
  position: absolute;
  content: '';
  height: 100%;
  left: 0;
  top: 0;
  -webkit-transition: width 0.2s ease-in;
  transition: width 0.2s ease-in;
  width: 3px;
  z-index: -1;
}

.sidebar-navigation li:hover::before {
  width: 100%;
}

.sidebar-navigation .header {
  font-size: 12px;
  text-transform: uppercase;
  background-color: #151515;
  padding: 10px 15px 10px 30px;
}

.sidebar-navigation .header::before {
  background-color: transparent;
}

.content-container {
  padding-left: 220px;
}
#pframe{
		width: 100%;
		height: 95vh;
		overflow: scroll;
	}
</style>
<link rel="stylesheet" href="jh.css">
</head>
<body>
<div class="sidebar-container">
  <div class="sidebar-logo">
    중고거래 플랫폼
  </div>
  <ul class="sidebar-navigation">
    <li class="header"></li>
    <li>
      <a onclick="ProductButtonEvent()">
        <i class="fa fa-home" aria-hidden="true"></i> 메인화면
      </a>
    </li>
    <li>
      <a onclick="MyInformationButtonEvent()">
        <i class="fa fa-tachometer" aria-hidden="true"></i> 내정보보기
      </a>
    </li>
  </ul>
</div>

<div class="content-container">

  <div class="container-fluid">

   <iframe id="pframe" src="aboutProduct/Product_Search_UI.jsp" frameborder="0px"></iframe>

  </div>
</div>
<script>
function ProductButtonEvent(){
	document.getElementById("pframe").src="aboutProduct/Product_Search_UI.jsp";
}
function MyInformationButtonEvent(){
	document.getElementById("pframe").src="aboutInformation/My_Information_UI.jsp";
}
</script>
</body>
</html>