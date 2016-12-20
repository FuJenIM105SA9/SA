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


         <p class="lead">Upload File Request Page</p>
      
</div>
 
    <form method="POST" action="uploadFile" enctype="multipart/form-data">
    <input type="hidden" name = "id" value="${product.id}">
        File to upload: <input type="file" name="file"><br /> 
        <input type="submit" value="Upload"> Press here to upload the file! (<200mb)
    </form>
    ${message}<p>
    <img src="resources/fileUpload/<c:out value="${product.id}"/>.jpg" width="30%">
    <div class="col-md-12">

    	<a class="btn btn-primary" href="return">reutrn</a>
</body>
</html>