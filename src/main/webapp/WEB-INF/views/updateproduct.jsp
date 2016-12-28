<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    

     <title>Jackie Chen產品管理</title>
</head>
<body>
	<%@include file="navbarLogin.jspf" %>
	<div class="container theme-showcase" role="main">
    
     
      <div class="jumbotron" >    
        <h1>Jackie Chen產品管理系統</h1>
        <p class="lead">本系統為Jackie Chen研發之程式</p>
      </div>
	<div class="container">
		<div class="row">
			<br>
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form method="post" action="updateProduct" id="insertForm">
				<input type="hidden" name="id" value="${product.id}">
					<div class="form-group">
						類別:<select class="form-control" name="category">
  						<option>Mobile</option>
  							<option>Camera</option>
  							<option>Graphics Card</option>
						</select>
					</div>
					<div class="form-group">
						<label>產品名稱:</label>
						<input type="text" name="desc" value= ${product.desc}>
						
					</div>
					<div class="form-group">
						<label>產品描述:</label>
						<textarea rows="4" cols="50"
						type="text" name="details" value= ${product.details}>
						</textarea>
					</div>
					<div class="form-group">
						<label>產品價格:</label>
						<input type="number" name="price" value= ${product.price}>
						
					</div>
					<div class="form-group">
						<label>安全存量:</label>
						<input type="number" name="reorderPoint" value= ${product.reorderPoint} required>
						<p class="help-block">當目前庫存數量低於此數字就應該進貨</p>
					</div>
					
			  		<button type="submit" class="btn btn-default">修改完成</button>
				</form>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	</div><!-- /.container -->
	    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.validate.js" />"></script>
    <script src="<c:url value="/resources/js/additional-methods.js" />"></script>
    <script src="<c:url value="/resources/js/messages_zh_TW.js" />"></script>
	<script>
	$("#insertForm").validate();
	</script>
    
</body>
</html>