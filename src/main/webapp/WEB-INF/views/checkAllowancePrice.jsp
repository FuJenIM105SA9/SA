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
        <p class="lead">Viewing Pleasure</p>
      </div>  
     
	
	<c:forEach items="${AllowanceOrderList}" var="AllowanceOrder">
		<div class="row">
			
			
            <div class="col-md-8">
             <h3>折讓金額 : TWD ${AllowanceOrder.aPrice}</h3>
            	<h4>產品編號 : ${AllowanceOrder.productId}</h4>
                <h4>訂單編號 : ${AllowanceOrder.soid}</h4>
              
                 <h5>	<a class="btn btn-primary" href="acceptAllowance?soid=${AllowanceOrder.soid}&pid=${AllowanceOrder.productId}">接受折讓</a></h5>
                 <h5>   <a class="btn btn-primary" href="rejectAllowance?soid=${AllowanceOrder.soid}&pid=${AllowanceOrder.productId}">拒絕折讓</a></h5>
                 
            </div>
       </div> 
    </c:forEach>    
	  			

    </div><!-- /.container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

</body>
</html>