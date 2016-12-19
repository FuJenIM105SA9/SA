<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <style>
  select {
    max-width: 100px;
}
  </style> 
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
        <p class="lead">Viewing Pleasure</p>
      </div>
      
	<div class="container">
	<form method="get" action="search2" id="searchForm">
	
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
	<form action="searchCat1">
	<div  class="form-group">
							<select class="form-control" name="c"> 
  							<option>Horror</option>
  							<option>Action</option>
  							<option>Drama</option>
  							<option>True Story</option>
  							<option>Comedy</option>
							</select><button  type="submit" class="glyphicon glyphicon-search"></button>							
					</div>	

	</form>
	</div>
	
	
	<c:forEach items="${productList}" var="product">
		<div class="row">
			<br>
			<div class="col-md-4">
                <center><img src="resources\fileUpload\<c:out value="${product.id}"/>.jpg" width="30%"></center>
            </div>
            <div class="col-md-8">
            	<h3>${product.desc}</h3>
                <h4>${product.category}</h4>
                <h5>${product.details}</h5>
             	<h5>TWD ${product.price}</h5>
             	<c:choose>
					  				<c:when test="${product.inventory <= 0}">
										存貨不足
    								</c:when>
    								<c:otherwise>
        								<a class="btn btn-default" href="addShoppingCart?id=${product.id}">加入購物車</a>
    								</c:otherwise>
								</c:choose>		
                
            </div>
       </div> 
    </c:forEach>    
	  			
			
			</div>
		</div>



</body>
</html>
