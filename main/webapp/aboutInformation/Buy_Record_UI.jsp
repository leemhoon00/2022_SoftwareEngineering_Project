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
<div class="modal-header">
	<h5 class="modal-title" id="exampleModalLabel">구매기록 조회</h5>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body" style="padding:1px">
	<div class="row" style="width:1000px; margin:0;">
		<div class="col-6">
			<label>판매자</label>
		</div>
		<div class="col-6">
			<label>가격</label>
		</div>
		
		<div class="col-6">
			<input type="text" class="form-control" value="판매자1" disabled>
		</div>
		<div class="col-6">
			<input type="text" class="form-control" value="50,000" disabled>
		</div>
		
		<div class="col-12">
			<label>제목</label>
		</div>
		<div class="col-12">
			<input type="text" class="form-control" value="에어팟팔아요" disabled>
		</div>
		
		<div class="col-12">
			<label">내용</label>
		</div>
		<div class="col-12">
			<p>
				<textarea class="form-control" rows="5" disabled>미개봉 중고</textarea>
			</p>
		</div>
		
		
		<div class="col-10">
			<label>후기 작성</label>
		</div>
		<div class="col-2">
			<label>점수</label>
		</div>
		<div class="col-10">
			<input type="text" class="form-control">
		</div>
		<div class="col-2">
			<input type="text" class="form-control">
		</div>
	</div>
	<div class="modal-footer" style="margin:5px;">
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">저장</button>
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	</div>
</div>
</body>
</html>