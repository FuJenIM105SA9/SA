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
				<table class="table">
				  	<tr>
				  		<th>折讓編號</th><th>商品情況</th><th>買家描述</th><th>折讓價格</th>
				  	</tr>
				  	<c:forEach items="${AllowanceOrderList}" var="AllowanceOrder">
					  	<tr>
				
					  	    <td>${AllowanceOrder.getAId()}</td>
					  	    <td>
					  		<img src="resources/allowanceFileUpload/<c:out value="s${AllowanceOrder.soid}m${AllowanceOrder.managerId}p${AllowanceOrder.productId}"/>.jpg" width="30%">
					  		</td>
					  		<td>${AllowanceOrder.detail}</td>
					  		<td><form method="get" action="allowanceconfirm" id="allowanceconfirmForm">
					  		 <div class="form-group">
					  		 <input type="hidden" name = "count" value="${AllowanceOrder.count}">
                                 <input type="number" name="APrice" placeholder="輸入折讓金額" required>	
                             </div>
	                           <div class="form-group">
                             <button type="submit" class="btn btn-primary">確認折讓</button>
                            </div>
                            </form>
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