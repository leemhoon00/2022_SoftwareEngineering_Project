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
	<div class="col-6" style="margin-right: 0px;">
		<div class="card" style="margin-right: 0px;">
			<div class="card-header"
				style="font-size: 20px; background-color: white;">상품 목록</div>
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
						<tr>
							<td>에어팟팔아요</td>
							<td>2022-05-18</td>
						</tr>
						<tr>
							<td>버즈팔아요</td>
							<td>2022-05-18</td>
						</tr>
					</tbody>
				</table>
				<script>
				$.ajax({
					type:"GET",
			        url:"./Product_Content_UI.jsp",
			        data:{},
			        dataType:"html",
			        success:function(data){
			            $("#Product_Content_UI").html(data);
			      }
			   });
				
				</script>
				<ul class="pagination justify-content-end" id="pageul">
					<li class="page-item" id="previous" onclick="previousbutton()"><a class="page-link">Previous</a></li>
					
					<li class="page-item active"><a class="page-link">1</a></li>
					<li class="page-item" id="next" onclick="nextbutton()"><a class="page-link">Next</a></li>
					
				</ul>
			</div>
		</div>
	</div>

	<div class="col-6" id="Product_Content_UI" style="margin-left:0px;">
	
	</div>
</div>
</body>
</html>