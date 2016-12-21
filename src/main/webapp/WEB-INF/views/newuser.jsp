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
	<%@include file="navbar.jspf" %>
	<div class="container theme-showcase" role="main">
    
      <div class="jumbotron" >    
        <h1>管理員註冊介面</h1>
        <p class="lead">輸入資料 </p>
      </div>
      
      
      
  

<form action="newuser" method ="post" onsubmit="if(document.getElementById('agree').checked) { return true; } else { alert('Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy'); return false; }">
	帳號:<input type="text" name ="name"/></br>
	電話:<input type="text" name ="phone"/></br>
	地址:<input type="text" name ="address"/></br>
	密碼:<input type="password" name ="password"/></br>
	<div class="form-group">
					身份:<select name ="identity" class="selectpicker show-menu-arrow">
  						<option value="Customer">Customer </option>
  						<option value="Salesmen">Salesmen</option>
  						<option value="Warehouse">Warehouse</option>
  						<option value="Aftersales">After Sales</option>
						</select>
					</div>

	輸入驗證碼:(如果是顧客請忽略)</br>
	<input type="text" name ="code"/></br>
<input type="checkbox" name="checkbox" value="check" id="agree" /> I have read and agree to the Terms and Conditions and Privacy Policy<br>
	
	<button type="submit" class="btn btn-info btn-lg" >註冊</button> 
	
	
	
</form>
</body>
</html>

