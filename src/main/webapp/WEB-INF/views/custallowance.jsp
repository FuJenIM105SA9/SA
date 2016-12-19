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
     
 
    <form method="POST" action="uploadAllowanceFile" enctype="multipart/form-data">
  <input type="hidden" name = "autoid" value="${SalesOrder.autoid}">
   <input type="hidden" name = "soid" value="${SalesOrder.soid}">
        File to upload: <input type="file" name="file"><br /> 
        <input type="submit" value="Upload"> Press here to upload the file! (<200mb)
    </form>
    ${message}<p>
    <img src="resources\allowanceFileUpload\<c:out value="s${SalesOrder.soid}m${SalesOrder.manid}p${SalesOrder.productId}"/>.jpg" width="30%">
   <div class="col-md-3"></div>
	<div class="col-md-6">
				<form method="get" action="aConfirm" id="aConfirmForm">
				<input type="hidden" name = "autoid" value="${SalesOrder.autoid}">
             <input type="hidden" name = "pid" value="${SalesOrder.productId}">
              <input type="hidden" name = "soid" value="${SalesOrder.soid}">
						<label>折讓狀況描述:</label>
				
						<input type="text" name="detail" placeholder="輸入產品情況" required>
				
			  		<button type="submit" class="btn btn-primary">確認折讓</button>
				</form>
			</div>
			<div class="col-md-3"></div>
    
</body>
</html>