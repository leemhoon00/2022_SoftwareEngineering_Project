<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="entity.Transaction_Record" %>
<%@ page import="control.Show_Seller" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.List" %>


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
String seller = request.getParameter("seller");
User user = new User(seller);
Show_Seller control = new Show_Seller();
user = control.Select_Seller(user);

List<Transaction_Record> list;

list = control.getList(user);

int sum=0;
int count=0;
double avg=0;

for(Transaction_Record p: list){
	sum += p.getScore();
	count++;
}

if(count==0){
	
}
else{
	avg = (double)sum / (double)count;
	avg = Math.floor(avg);
}

%>
<div class="modal-header">
	<h5 class="modal-title" id="exampleModalLabel">판매자정보</h5>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body" style="padding:1px">
	<div class="row" style="width:650px; margin:0;">
		<div class="col-6">
			<label style="margin:10px;">아이디</label>
		</div>
		<div class="col-6">
			<label style="margin:10px;">점수</label>
		</div>
		<div class="col-6">
			<input type="text" class="form-control" value="<%=user.getId()%>">
		</div>
		<div class="col-6">
			<input type="text" class="form-control" value="<%=avg%>">
		</div>
		
		<div class="col-6">
			<label style="margin:10px;">지역</label>
		</div>
		<div class="col-6">
			<label style="margin:10px;">전화번호</label>
		</div>
		<div class="col-6">
			<input type="text" class="form-control" value="<%=user.getRegion()%>">
		</div>
		<div class="col-6">
			<input type="text" class="form-control" value="<%=user.getPhoneNumber()%>">
		</div>
		<div class="col-12" style="margin-top: 10px;">
			<table class="table table-bordered" role="grid">
				<thead>
					<tr>
						<th>후기</th>
					</tr>
				</thead>
				<tbody style="border-top: none;">
				
					<%for(Transaction_Record p: list) {%>
					<tr>
						<td><%=p.getContent() %></td>
					</tr>
					<%} %>
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