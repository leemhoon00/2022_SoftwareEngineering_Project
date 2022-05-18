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
<label class="title" style="margin-left: 30px; margin-top: 10px;">내정보 보기</label>
<div class="row">
	<div class="col-6">
		<div class="card">
			<div class="card-header" style="font-size: 20px; background-color: white;">
				내 정보 수정
			</div>
			<div class="card-body">
				<form>
					<div class="row">
						<div class="col-4">
							<label>아이디</label>
						</div>
						<div class="col-4">
							<label>비밀번호</label>
						</div>
						<div class="col-4">
							<label>지역</label>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" value="아이디1">
						</div>
						<div class="col-4">
							<input type="text" class="form-control" value="password1">
						</div>
						<div class="col-4">
							<input type="text" class="form-control" value="부산">
						</div>
						<div class="col-6">
							<label>이름</label>
						</div>
						<div class="col-4">
							<label>전화번호</label>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" value="이름1">
						</div>
						<div class="col-4">
							<input type="text" class="form-control" value="010-1234-5678">
						</div>
						
						<div class="col-12">
							<button class="btn btn-info float-right" style="margin-right: 5px;">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="col-6">
		<div class="card">
			<div class="card-header" style="font-size: 20px; background-color: white;">
				내 구매기록 기록
			</div>
			<div class="card-body">
				<table id="mytable" class="table table-bordered" style="width: 100%;"
					role="grid">
					<thead>
						<tr>
							<th>제목</th>
							<th style="width:20%;">날짜</th>
						</tr>
					</thead>
					<tbody style="border-top: none;">
						<tr onclick="BuyRecordTableClickEvent()" data-bs-toggle="modal" data-bs-target="#exampleModal">
							<td>에어팟팔아요</td>
							<td>2022-05-18</td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</div>
		<div class="card">
			<div class="card-header" style="font-size: 20px; background-color: white;">
				내 판매기록 기록
			</div>
			<div class="card-body">
				<table id="mytable" class="table table-bordered" style="width: 100%;"
					role="grid">
					<thead>
						<tr>
							<th>제목</th>
							<th style="width:20%;">날짜</th>
						</tr>
					</thead>
					<tbody style="border-top: none;">
						<tr onclick="SellRecordTableClickEvent()" data-bs-toggle="modal" data-bs-target="#exampleModal">
							<td>버즈팔아요</td>
							<td>2022-05-18</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
function BuyRecordTableClickEvent(){
	$.ajax({
		type:"GET",
        url:"./Buy_Record_UI.jsp",
        data:{},
        dataType:"html",
        success:function(data){
            $("#modaldiv").html(data);
      }
   });
}

function SellRecordTableClickEvent(){
	$.ajax({
		type:"GET",
        url:"./Sell_Record_UI.jsp",
        data:{},
        dataType:"html",
        success:function(data){
            $("#modaldiv").html(data);
      }
   });
}
</script>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	 <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
	 	<div class="modal-content" id="modaldiv">
	 		
	 	</div>
	 </div>
</div>
</body>
</html>