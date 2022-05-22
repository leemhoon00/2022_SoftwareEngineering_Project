<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="entity.Product" %>
<%@ page import="control.Product_Information" %>
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
String id = (String)session.getAttribute("id");
int productNumber = Integer.parseInt(request.getParameter("selectedTable"));

Product_Information control = new Product_Information();
Product p = control.getProductInformation(id, productNumber);

%>

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
		style="font-size: 20px; background-color: white;">판매자 : <button style='<%=p.getSeller_button()?"":"display:none" %>' type="button" class="btn btn-info" data-bs-toggle="modal" onclick="modalbutton(this)" data-bs-target="#exampleModal" value="<%=p.getSeller()%>">
			  <%=p.getSeller() %>
			</button></div>
	<div class="card-body">
		<form>
			<div class="row">
				<div class="col-12">
					<label>제목</label>
				</div>
				<div class="col-12">
					<input type="text" class="form-control" value="<%=p.getTitle() %>" name="title">
				</div>
				<div class="col-6">
					<label>날짜</label>
				</div>
				<div class="col-6">
					<label>가격</label>
				</div>
				<div class="col-6">
					<input type="text" class="form-control" value="<%=p.getDate() %>" disabled>
				</div>
				<div class="col-6">
					<input type="text" class="form-control" value="<%=p.getPrice() %>" name="price">
				</div>
				<div class="col-12">
					<label>설명</label>
				</div>
				<div class="col-12">
					<p>
						<textarea name="content" class="form-control" rows="5"><%=p.getContent() %></textarea>
					</p>
				</div>
				
				<input style="display:none" name="number" value="<%=p.getNumber()%>">
				
				<div class="col-12">
					<button style='<%=p.getDelete_button()?"":"display:none" %>' class="btn btn-danger float-right" type="submit" formaction="delete.jsp" formmethod="post">삭제</button>
					<button style='<%=p.getUpdate_button()?"":"display:none" %>' class="btn btn-info float-right" style="margin-right: 5px;" type="submit" formaction="update.jsp" formmethod="post">수정</button>
					<button style='<%=p.getInsert_button()?"":"display:none" %>' class="btn btn-info float-right" style="margin-right: 5px;" type="submit" formaction="insert.jsp" formmethod="post">등록</button>
					<button style='<%=p.getRequest_button()?"":"display:none" %>' class="btn btn-info float-right" style="margin-right: 5px;" type="submit" formaction="request.jsp" formmethod="post">거래요청</button>
					<button style='<%=p.getCancel_button()?"":"display:none" %>' class="btn btn-info float-right" style="margin-right: 5px;" type="submit" formaction="cancel.jsp" formmethod="post">거래취소</button>
					<button style='<%=p.getConfirm_button()?"":"display:none" %>' class="btn btn-info float-right" style="margin-right: 5px;" type="submit" formaction="confirm.jsp" formmethod="post">거래확정</button>
					
				</div>
			</div>
		</form>
	</div>
</div>

</body>
</html>