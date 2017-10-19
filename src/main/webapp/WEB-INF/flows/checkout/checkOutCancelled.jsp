<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<br><br><br>

<div class="container-wrapper">
	<div class="container">

<section>
<div class="jumbotron abc">
				<div class="container">
<h3>
Checkout cancelled! </h3>
<h3>
Your checkout process is cancelled! You may continue shopping.
</h3>
</div>
</div>
</section>
<section>
<a href="<spring:url value="/" />" class="btn btn-success" role="button">PRODUCTS</a> 
</section>

</div>
</div>

<script src="<c:url value="/resources/js/controller.js"></c:url>"></script>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>
