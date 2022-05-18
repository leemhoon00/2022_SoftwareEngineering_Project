<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 페이지</title>
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
	
	<link href="index.css" rel="stylesheet">
	
</head>
<body class="text-center">
	<form class="form-signin" action="MainPage_UI.jsp" method="post">
		<div class="form-floating">
		    <input type="text" class="form-control" name="id" placeholder="ID">
            <label for="floatingInput">ID</label>
        </div>
		<div class="form-floating">
            <input type="password" class="form-control" name="pw" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>
		<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
		<a href="#" onclick="window.open('signup/signup.jsp','_blank','width=600 height=600')" class="float-right">회원가입</a>
		
	</form>
</body>
</html>