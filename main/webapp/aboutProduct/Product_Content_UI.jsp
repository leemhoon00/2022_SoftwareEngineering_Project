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

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	 <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
	 	<div class="modal-content" id="modaldiv">
	 		
	 	</div>
	 </div>
</div>

<script>
function modalbutton(){
	$.ajax({
		type:"GET",
        url:"./Seller_Information_UI.jsp",
        data:{},
        dataType:"html",
        success:function(data){
            $("#modaldiv").html(data);
      }
   });
}
</script>
<div class="card">
	<div class="card-header"
		style="font-size: 20px; background-color: white;">판매자 : <button type="button" class="btn btn-info" data-bs-toggle="modal" onclick="modalbutton()" data-bs-target="#exampleModal">
			  임시아이디1
			</button></div>
	<div class="card-body">
		<form>
			<div class="row">
				<div class="col-12">
					<label>제목</label>
				</div>
				<div class="col-12">
					<input type="text" class="form-control" value="에어팟팔아요">
				</div>
				<div class="col-6">
					<label>날짜</label>
				</div>
				<div class="col-6">
					<label>가격</label>
				</div>
				<div class="col-6">
					<input type="text" class="form-control" value="2022-05-19">
				</div>
				<div class="col-6">
					<input type="text" class="form-control" value="50,000원">
				</div>
				<div class="col-12">
					<label>설명</label>
				</div>
				<div class="col-12">
					<p>
						<textarea class="form-control" rows="5">미개봉 중고</textarea>
					</p>
				</div>
				
				<div class="col-12">
					<button class="btn btn-danger float-right">삭제</button>
					<button class="btn btn-info float-right" style="margin-right: 5px;">수정</button>
					<button class="btn btn-info float-right" style="margin-right: 5px;">등록</button>
					<button class="btn btn-info float-right" style="margin-right: 5px;">거래요청</button>
					<button class="btn btn-info float-right" style="margin-right: 5px;">거래취소</button>
					<button class="btn btn-info float-right" style="margin-right: 5px;">거래확정</button>
					
				</div>
			</div>
		</form>
	</div>
</div>

</body>
</html>