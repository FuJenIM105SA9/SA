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
	<%@include file="navbarWarehouse.jspf" %>
    <div class="container theme-showcase" role="main">
    
       <div class="jumbotron" >    
        <h1>Jackie Chen產品管理系統</h1>
        <p class="lead">本系統為Jackie Chen研發之程式</p>
      </div>
      <div class="container">
						<div class="col-md-6">
							<form action="searchComment">
								<div class="form-group">
									<select class="form-control" name="c">
										<option>Normal</option>
										<option>Emergency</option>

									</select> 
									<br>
									<button type="submit" class="glyphicon glyphicon-search"></button>
								</div>
								</form>
								</div>
								</div>
	<div class="container">
		<div class="row">
			<br>
			<div class="col-md-12">
				<table class="table">
				  	<tr>
				  		<th>銷貨編號</th><th>商品類別</th><th>商品名稱</th><th>商品價格</th><th>銷貨時間</th><th>購買者編號</th><th>逾期狀態</th><th>發貨</th>
				  	</tr>
				  	<c:forEach items="${SalesOrderList}" var="SalesOrder">
					  	<tr>
					  	    <td>${SalesOrder.soid}</td>
					  	    <td>${SalesOrder.category}</td>
					  		<td>${SalesOrder.desc}</td>
					  		<td>${SalesOrder.price}</td>
					    	<td>${SalesOrder.orderTime}</td>
					    	<td>${SalesOrder.manid}</td>
					    	<td>${SalesOrder.comment}</td> 
			             	<td><a class="btn btn-primary" href="sa?id=${SalesOrder.id}">發貨</a>

					  	</tr>
				  	</c:forEach>
				</table>
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