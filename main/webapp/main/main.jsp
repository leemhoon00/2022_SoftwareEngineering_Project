<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="control.dbcon" %>


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
<%
	dbcon db1 = new dbcon();
	db1.setQuery("select * from board");
	ResultSet rs = db1.getRS();
	if(rs.next()){
		System.out.println(rs.getString("title"));
	}
	db1.close();
%>
<body>
<div class="card">
	<div class="card-body">
		<div class="form-inline">
			<select>
				<option value="제목">제목</option>
				<option value="작성자">작성자</option>
			</select>
			<label>검색:</label> <input type="text">
		</div>
	</div>
</div>
<div class="row">
	<div class="col-6">
		<div class="card">
			<div class="card-body">
				<div class="form-inline">
					<table>
						<thead>
							<tr>
								<th>제목</th>
								<th>내용</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-6">
		<div class="card">
			<div class="card-body">
				<div class="form-inline">
					<form>
						<div class="row">
							<div class="col-6">
								<label>제목<span class="text-danger">*</span></label>
							</div>
							<div class="col-6">
								<label>내용<span class="text-danger">*</span></label>
							</div>
							
							<div class="col-6">
								<input type="text" class="form-control" name="title">
							</div>
							<div class="col-6">
								<input type="text" class="form-control" name="content">
							</div>
							
							<div class="col-12">
								
								<button class="btn btn-info float-right"
									style="margin-right: 5px;" type="submit" formaction="insert.jsp" formmethod="post">등록</button>
							</div>
						</div>
						</form>
				</div>
			</div>
		</div>
	</div>
</div>

</html>