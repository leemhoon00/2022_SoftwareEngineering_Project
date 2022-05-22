<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entity.Product" %>
<%@ page import="control.Product_Search" %>
<%
String category = request.getParameter("category");
String content = request.getParameter("content");

Product_Search control = new Product_Search();
List<Product> list;

if(content == null || content.equals("")){
	list = control.getAllList();
}
else{
	list = control.getSearchedList(category, content);
}
%>
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
<script>

var selectedTable='0';
</script>
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
						
						<%for(Product p: list){ %>
						
						<tr class="trs" id="<%=p.getNumber() %>" onclick="TableClickEvent(this)">
							<td style="display:none"><%=p.getNumber() %></td>
							<td><%=p.getTitle() %></td>
							<td><%=p.getDate() %></td>
						</tr>
						
						<%} %>
					</tbody>
				</table>
				<script>
				function TableClickEvent(element){
					var trs = document.querySelectorAll(".trs");
					
					if(selectedTable == '0'){
						selectedTable = element.children[0].innerHTML;
						element.style.backgroundColor="lightgray";
					}
					else if(selectedTable != element.children[0].innerHTML){
						document.getElementById(selectedTable).style.backgroundColor="white";
						element.style.backgroundColor="lightgray";
						
						selectedTable = element.children[0].innerHTML;
						
					}
					else{
						selectedTable = '0';
						element.style.backgroundColor="white";
					}
					
					$.ajax({
						type:"GET",
				        url:"./Product_Content_UI.jsp",
				        data:{selectedTable : selectedTable},
				        dataType:"html",
				        success:function(data){
				            $("#Product_Content_UI").html(data);
				      }
				   });
				}
				
				$.ajax({
					type:"GET",
			        url:"./Product_Content_UI.jsp",
			        data:{selectedTable : '0'},
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