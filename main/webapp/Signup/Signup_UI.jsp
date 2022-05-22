<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<link rel="stylesheet" href="../jh.css">

<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header"
				style="font-size: 20px; background-color: white;">회원 가입</div>
			<div class="card-body">
				<form>
					<div class="row">
						<div class="col-6">
							<label>아이디<span class="text-danger">*</span></label>
						</div>
						<div class="col-6">
							<label>비밀번호<span class="text-danger">*</span></label>
						</div>
						<div class="col-6">
							<input type="text" class="form-control" name="IDTextbox">
						</div>
						<div class="col-6">
							<input type="text" class="form-control" name="PWTextbox">
						</div>
						<div class="col-6">
							<label>이름<span class="text-danger">*</span></label>
						</div>
						<div class="col-6">
							<label>지역</label>
						</div>
						<div class="col-6">
							<input type="text" class="form-control" name="NameTextbox">
						</div>
						<div class="col-6">
							<input type="text" class="form-control" name="RegionTextbox">
						</div>
						<div class="col-12">
							<label>전화번호<span class="text-danger">*</span></label>
						</div>
						<div class="col-12">
							<input type="text" class="form-control" name="PhoneNumberTextbox">
						</div>
						
						<div class="col-12" style="margin:10px">
							<button type="submit" class="btn btn-info float-right" 
							formaction="insert.jsp" formmethod="post" style="margin-right: 5px;">가입하기</button>
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>