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
	<%@include file="navbarSalesmen.jspf" %>
    <div class="container theme-showcase" role="main">
    
    
      <div class="jumbotron" >    
        <h1>Jackie Chen產品管理系統</h1>
        <p class="lead">本系統為Jackie Chen研發之程式</p>
      </div>
     <div class="container">
	<form method="get" action="search1" id="searchForm">
	
	<div class="form-group">
	
						類別:<select class="form-control" name="stype">
  						<option>description</option>
  						<option>details</option>
  					
  					
						</select>
					</div>
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
	  			<a class="btn btn-primary" href="insertProduct">新增</a>
				<table class="table">
				  	<tr>
				  		<th>編號</th>
				  		<th>類別</th>
				  		<th>片名</th>
				  		<th>描述</th>
				  		<th>價格</th>
				  		<th>庫存量</th>
				  		<th>安全存量</th>
				  		<th>圖片上傳</th>
				  		<th>狀態</th>
				  		<th>編輯</th>
				  		
				  	</tr>
				  	<c:forEach items="${productList}" var="product" varStatus="status">
					  	<tr>
					  		<td>${product.id}</td>
					  		<td>${product.category}</td>
					  		<td>${product.desc}</td>
					  		<td><textarea rows="6" cols="50">${product.details}</textarea></td>
					  		<td>${product.price}</td>
					  		<td>${product.inventory}</td>
					  		<td>${product.reorderPoint}</td>
					  		
					  		<td>
					  		<img src="resources\fileUpload\<c:out value="${product.id}"/>.jpg" width="70%">
					  		
					  	    <br>
					  		<a class="btn btn-primary" href="pic?id=${product.id}">upload</a>
        				
    						</td>
    						<td>${product.state}</td>
					  		<td>
					  				<a class="btn btn-sm btn-danger deleteBtn" href="releaseProduct?id=${status.index}">上架</a>
					  			<a class="btn btn-sm btn-danger deleteBtn" href="deleteProduct?id=${status.index}">下架</a>
					  	
					  			<a class="btn btn-primary" href="updateProduct?id=${product.id}">修改</a>
					  			<a class="btn btn-primary" href="createPO?id=${product.id}">進貨</a>
					  		</td>
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