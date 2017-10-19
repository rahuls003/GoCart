<%@ include file="/WEB-INF/views/template/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<div class="container-wrapper">
			<div class="container">
			<div id="login-box">
			
			
			<div class="page-header">
			<h1>Login Please</h1>
			<p class="lead">Enter your Username and Password :</p>
			</div>
			
			<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
			</c:if>
			
			<!--j_spring_security_check"-->
			
			<form class="form-horizontal" name="loginform" action="<c:url value="/j_spring_security_check"/>" method="post">

			<c:if test="${not empty error}">
			<div class="error"style="color: #ff0000;">${error}</div>
			</c:if>

			<div class="form-group">
			<label  class="control-label col-sm-2" for="username">USERNAME: </label>
			<div class="col-sm-4">
			<input type="text" id="username" name="username" class="form-control"/>
			</div>
			</div>
			
			
			<div class="form-group">
			<label  class="control-label col-sm-2" for="password"> PASSWORD: </label>
			<div class="col-sm-4">
			<input type="password" id="password" name="password" class="form-control"/>
			</div>
			</div>
			
			 <div class="col-sm-offset-2 col-sm-10">
			<input type="submit" value="Submit" class="btnbtn-default">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</div>
			</form>
			
			</div>
			</div>
			</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>

