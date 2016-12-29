
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    

    <title>產品管理</title>
    </head>
<body>
	<%@include file="navbarSalesmen.jspf" %>
    <div class="container theme-showcase" role="main">
    
      <div class="jumbotron" >    
        <h1>Jackie Chen產品管理系統</h1>
        <p class="lead">本系統為Jackie Chen研發之程式</p>
      </div>
	<div class="container">
		<div class="row">
			<br>
			<div class="col-md-12">
				<table class="table">
				  	<tr>
				  		<th style= "width: 6%;">購買者編號</th>
				  		<th style= "width: 8%;">商品類別</th>
				  		<th style= "width: 15%;">商品名稱</th>
				  		<th style= "width: 5%;">商品價格</th><th>購買時間</th><th>註解</th><th>提醒</th>
				  	</tr>
				  	<c:forEach items="${overdueList}" var="SalesOrder" varStatus="status">
					  	<tr>
					  		<td>${SalesOrder.manid}</td>
					  		<td>${SalesOrder.category}</td>
					  		<td>${SalesOrder.desc}</td>
					  		<td>${SalesOrder.price}</td>
					    	<td>${SalesOrder.orderTime}</td>
					    	<td>${SalesOrder.comment}</td>
					    	<td><c:choose>
					  				<c:when test="${SalesOrder.comment == 'Normal'}">
										<a class="btn btn-primary" href="reminder?id=${SalesOrder.autoid}">通知</a>
    								</c:when>
    								<c:otherwise>
        							已通知
    								</c:otherwise>
    							</c:choose>	

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
    <script src="/resources/js/bootstrap.min.js"></script>

</body>
</html>
