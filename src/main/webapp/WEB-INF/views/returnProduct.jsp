<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    

    <title>Jackie Chen 3C</title>
</head>
<body>
	<%@include file="navbar2.jspf" %>
    <div class="container theme-showcase" role="main">
    
      <div class="jumbotron" >    
        <h1>Jackie Chen 3C</h1>
        <h2>已購買</h2>
        <p class="lead">Viewing Pleasure</p>
      </div>
      <form action="search">
	<input type="text" name="search" placeholder="Search Name...">
	<button  type="submit" class="glyphicon glyphicon-search"></button>
	</form>
	<input type="hidden" name="id" value="${SalesOrder.id}">
	<div class="container">
		<div class="row">
			<br>
			<div class="col-md-12">
				<table class="table">
				  	<tr>
				  		<th>商品類別</th><th>商品名稱</th><th>商品價格</th><th>購買時間</th>
				  	</tr>
				  	<c:forEach items="${SalesOrderList}" var="SalesOrder">
					  	<tr>
					  	   <td>${SalesOrder.category}</td>
					  		<td>${SalesOrder.desc}</td>
					  		<td>${SalesOrder.price}</td>
					    	<td>${SalesOrder.orderTime}</td>
					  	</tr>
				  	</c:forEach>
				</table>
				<div class="form-group">
						<label>描述:</label>
						<textarea rows="4" cols="50"
						type="hidden" name="reason" value= ${returnOrder.reason}>
						</textarea>
						<a class="btn btn-default" href="returnProduct?id=${SalesOrder.id}&reason=${returnOrder.reason}">確認退貨</a>
					</div>
			</div>
		</div>
	</div>
	

    </div><!-- /.container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

</body>
</html>