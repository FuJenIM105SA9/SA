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
	<%@include file="navbarAfterSales.jspf" %>
    <div class="container theme-showcase" role="main">
    
    
      <div class="jumbotron" >    
        <h1>Jackie Chen產品管理系統</h1>
        <p class="lead">本系統為Jackie Chen研發之程式</p>
      </div>
     
     <div class="container">
	<form method="get" action="searchManager" id="searchForm">
	
<div class="form-group">
<input type="text" name="search" placeholder="輸入關鍵字" required>	
</div>
<div class="form-group">
<button type="submit" class="glyphicon glyphicon-search"></button>
</div>

</form>
     </div>
	<div class="container">
		<div class="row">
			<br>
			<div class="col-md-12">
	 
				<table class="table">
				  	<tr>
				  		<th>會員編號</th>
				  		<th>會員姓名</th>
				  		<th>TEL</th>
				  		<th>地址</th>
				  		<th>密碼</th>
				  		<th>身份</th>
				  		
				  	</tr>
				  	<c:forEach items="${managerList}" var="manager">
					  	<tr>
					  		<td>${manager.id}</td>
					  		<td>${manager.name}</td>
					  		<td>${manager.phone}</td>
					  		<td><textarea rows="6" cols="50">${manager.address}</textarea></td>
					  		<td>${manager.password}</td>
					  		<td>${manager.identity}</td>
					  	
					  		
					  		
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