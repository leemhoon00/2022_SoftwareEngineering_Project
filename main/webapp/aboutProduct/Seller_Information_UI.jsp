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
	<h5 class="modal-title" id="exampleModalLabel">판매자정보</h5>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body" style="padding:1px">
	<div class="row" style="width:650px">
		<div class="col-6">
			<label style="margin:10px;">아이디</label>
		</div>
		<div class="col-6">
			<label style="margin:10px;">점수</label>
		</div>
		<div class="col-6">
			<input type="text" style="margin:10px; width:95%;" class="form-control" value="임시아이디1">
		</div>
		<div class="col-6">
			<input type="text" style="margin:10px; width:95%;" class="form-control" value="88">
		</div>
		<div class="col-12">
			<table class="table table-bordered" style="width: 100%;" role="grid">
				<thead>
					<tr>
						<th>후기</th>
					</tr>
				</thead>
				<tbody style="border-top: none;">
					<tr>
						<td>착해요</td>
					</tr>
					<tr>
						<td>사기꾼이네요</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	</div>
</div>
</body>
</html>