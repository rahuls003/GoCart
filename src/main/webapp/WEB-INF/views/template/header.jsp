<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>My Style Gala</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="<c:url value="/resources/css/myStyle.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="" />" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


	<div class="navbar-wrapper">
		<div class="container">

			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header">

						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="<c:url value="/" />">My Style
							Gala</a>
					</div>

					<div class="collapse navbar-collapse" id="myNavbar">

						<ul class="nav navbar-nav">
							<li class="active"><a href="<c:url value="/" />">Home</a></li>

							<c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
								<c:if test="${pageContext.request.userPrincipal.name != null}">
									<li><a href="<c:url value="/product/allProduct" />">PRODUCTS</a></li>
								</c:if>
							</c:if>

							<li><a href="<c:url value="/about" />">About Us</a></li>

							<li class="dropdown">
							<a class="dropdown-toggle" role="button"
							 aria-expanded="false"  aria-haspopup="true"
								data-toggle="dropdown" href="#">Select by category<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><c:forEach items="${categories}" var="c">
											<c:url
												value="/searchbycategory?searchCondition=${c.categoryName }"
												var="url">
											</c:url>
											<a href="${url}">${c.categoryName}</a>
										</c:forEach> 
										<c:url value="/searchbycategory?searchCondition=All"
											var="url1"></c:url> 
											<a href="${url1}">All</a></li>
								</ul></li>

							<li>
								<form id="frmsearch" class="navbar-form navbar-left">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Search">
										<div class="input-group-btn">
											<button class="btn btn-default" type="submit">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</div>
									</div>
								</form>
							</li>


						</ul>


						<ul class="nav navbar-nav navbar-right">

							<c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
								<c:if test="${pageContext.request.userPrincipal.name != null}">
									<li><a
										href="<spring:url value="/customer/cart/getCartId" />"> <span
											class="glyphicon glyphicon-shopping-cart"></span>
									</a></li>
								</c:if>
							</c:if>


							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<li><a>Welcome:
										${pageContext.request.userPrincipal.name}</a></li>
								<li><a href="<c:url value="/j_spring_security_logout"/>">Logout</a></li>
							</c:if>

							<c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
								<li><a href="<c:url value="/admin" />">Admin</a></li>
							</c:if>

							<c:if test="${pageContext.request.userPrincipal.name == null}">

								<li><a href="<c:url value="/signup" />"><span
										class="glyphicon glyphicon-user"></span> Sign Up</a></li>

								<li><a href="<c:url value="/login" />"><span
										class="glyphicon glyphicon-log-in"></span> Login</a></li>

							</c:if>

						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>