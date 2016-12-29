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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="http://www.istayreal.com/css/themes/2016xmas/2016xmas.css" />

<title>Jackie Chen 3C</title>
</head>


<body>
<body style="background-color: #000;">

	<%@include file="navbar.jspf"%>
	<div class="container theme-showcase" role="main">

		<div class="jumbotron">
			<h1>Jackie Chen 3C</h1>
			<p class="lead">Viewing Pleasure</p>
		</div>
		<div class="container-fluid">
			<div class="row">

				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Carousel indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for carousel items -->
					<title>Bootstrap Example</title>
					<meta charset="utf-8" />
					<meta name="viewport" content="width=device-width, initial-scale=1" />
					<link rel="stylesheet"
						href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
					<script
						src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
					<script
						src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
					<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 40%;
	margin: auto;
}
</style>
					<div class="container">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
								<li data-target="#myCarousel" data-slide-to="3"></li>
							</ol>
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="resources/img/999.jpg" width=" 50%">
								</div>
								<div class="item">
									<img src="resources/img/353.jpg" width=" 50%">
								</div>

								<div class="item">
									<img src="resources/img/3333.jpg" width=" 50%">
								</div>

								<!-- Left and right controls -->
								<a class="left carousel-control" href="#myCarousel"
									role="button" data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a> <a class="right carousel-control" href="#myCarousel"
									role="button" data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>
						</form>
					</div>
<br><br><br>
					<div class="container">
						<div class="col-md-6">
							<form action="searchCat">
								<div class="form-group">
									<select class="form-control" name="c">
										<option>Mobile</option>
										<option>Camera</option>
										<option>Graphics Card</option>

									</select> 
									<br>
									<button type="submit" class="glyphicon glyphicon-search"></button>
								</div>

							</form>
						</div>
						<div class="container">
							<div class="col-md-6">
							<form method="get" action="search" id="searchForm">

								<div class="form-group">
						


									<select class="form-control" name="stype">
									
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


						<c:forEach items="${productList}" var="product">
							<div class="row">
								<br>
								<div class="col-md-4">
									<center>
										<img
											src="resources\fileUpload\<c:out value="${product.id}"/>.jpg"
											width="50%">
									</center>
								</div>
								<div class="col-md-8" style="color: white;">
									<h3>${product.desc}</h3>
									<h4>${product.category}</h4>
									<h5>${product.details}</h5>
									<h5>TWD ${product.price}</h5>
								</div>
							</div>
						</c:forEach>


					</div>
					<div class="footer-snow">
						<div class="footer-snow1">
							<div class="footer-snow2">
								<div class="footer-tree1" style="left: 0px; top: -40px;"></div>
								<div class="footer-elk" style="left: 48px; top: -40px;"></div>
								<div class="footer-tree2" style="left: 420px; top: -20px;"></div>
								<div class="footer-tree1" style="left: 480px; top: -27px;"></div>
								<div class="footer-tree2" style="left: 680px; top: -5px;"></div>
								<div class="footer-tree2" style="left: 1000px; top: -12px;"></div>
								<div class="footer-tree1" style="left: 1030px; top: -28px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
<script src="http://www.istayreal.com/js/jquery.min.js"></script>
<script type="text/javascript"
	src="http://www.istayreal.com/js/jquery.snow/snow.js"></script>
<script type="text/javascript">
	$(function() {
		$().jSnow();
	});
</script>
</html>
