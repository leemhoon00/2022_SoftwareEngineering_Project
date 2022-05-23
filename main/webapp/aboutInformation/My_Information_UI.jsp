<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="entity.User" %>
<%@ page import="control.My_Information" %>
<%@ page import="control.My_Transaction_Record_List" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Transaction_Record" %>

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

<%
My_Information control = new My_Information();

String id = (String)session.getAttribute("id");

User user  = control.getUser(id);

My_Transaction_Record_List control2 = new My_Transaction_Record_List();

List<Transaction_Record> buy_list;
List<Transaction_Record> sell_list;

buy_list = control2.getBuyRecordList(id);
sell_list = control2.getSellRecordList(id);

%>
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
							<input type="text" class="form-control" value="<%=user.getId()%>">
						</div>
						<div class="col-4">
							<input type="text" class="form-control" value="<%=user.getPw()%>">
						</div>
						<div class="col-4">
							<input type="text" class="form-control" value="<%=user.getRegion()%>">
						</div>
						<div class="col-4">
							<label>이름</label>
						</div>
						<div class="col-4">
							<label>전화번호</label>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" value="<%=user.getName()%>">
						</div>
						<div class="col-4">
							<input type="text" class="form-control" value="<%=user.getPhoneNumber()%>">
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="col-6">
		<div class="card">
			<div class="card-header" style="font-size: 20px; background-color: white;">
				내 구매기록
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
					
						<%for(Transaction_Record p: buy_list){ %>
						
						<tr onclick="BuyRecordTableClickEvent(this)" data-bs-toggle="modal" data-bs-target="#exampleModal">
							<td style="display:none"><%=p.getNumber() %></td>
							<td><%=p.getTitle() %></td>
							<td><%=p.getRegdate() %></td>
						</tr>
						
						<%} %>
						
						
					</tbody>
				</table>
			</div>
		</div>
		<div class="card">
			<div class="card-header" style="font-size: 20px; background-color: white;">
				내 판매기록
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
					
						<%for(Transaction_Record p: sell_list){ %>
						
						<tr onclick="SellRecordTableClickEvent(this)" data-bs-toggle="modal" data-bs-target="#exampleModal">
							<td style="display:none"><%=p.getNumber() %></td>
							<td><%=p.getTitle() %></td>
							<td><%=p.getRegdate() %></td>
						</tr>
						
						<%} %>
					
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
function BuyRecordTableClickEvent(element){
	
	var number = element.children[0].innerHTML;
	
	$.ajax({
		type:"GET",
        url:"./Buy_Record_UI.jsp",
        data:{number : number},
        dataType:"html",
        success:function(data){
            $("#modaldiv").html(data);
      }
   });
}

function SellRecordTableClickEvent(element){
	
	var number = element.children[0].innerHTML;
	
	$.ajax({
		type:"GET",
        url:"./Sell_Record_UI.jsp",
        data:{number : number},
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