<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
<div class="container ">
        <div class="page-header">
		<h1>Sign Up</h1>
		<p class="lead">Please Fill your details here:</p>
			</div>


			<form:form class="form-horizontal" action="${pageContext.request.contextPath}/addCustomer"  method="post"  commandName="customer" >

			

				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="firstname">FIRST NAME</form:label>
					<div class="col-sm-4">
					<form:errors path="firstname" cssStyle="color: #ff0000" />
					<form:input path="firstname" type="text" class="form-control"/>
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="lastname">LAST NAME</form:label>
					<div class="col-sm-4">
					<form:errors path="lastname" cssStyle="color: #ff0000" />
					<form:input path="lastname" type="text" class="form-control" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="phoneno">PHONE MUNBER</form:label>
					<div class="col-sm-4">
					<form:input path="phoneno" type="text" class="form-control" />
				</div>
				</div>
				
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="email">EMAIL</form:label>
					<div class="col-sm-4">
					<form:errors path="email" cssStyle="color: #ff0000" />
					<form:input path="email" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="username">USER NAME</form:label>
					<div class="col-sm-4">
					<form:errors path="username" cssStyle="color: #ff0000" />
					<form:input path="username" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="password">PASSWORD</form:label>
					<div class="col-sm-4">
					<form:errors path="password" cssStyle="color: #ff0000" />
					<form:input path="password" type="password" class="form-control" placeholder="" />
				</div>
				</div>
				
				<!-- How to insert gender and birthday ?   -->
				
				<br>
				<br>

				<!-- BILLING ADDRESS  -->

				<h1>BILLING ADDRESS</h1>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="billingAddress.hno">H#</form:label>
					<div class="col-sm-4">
					<form:input path="billingAddress.hno" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="billingAddress.streetname">STREET NAME</form:label>
					<div class="col-sm-4">
					<form:input path="billingAddress.streetname" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="billingAddress.city">CITY</form:label>
					<div class="col-sm-4">
					<form:input path="billingAddress.city" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="billingAddress.state">STATE</form:label>
					<div class="col-sm-4">
					<form:input path="billingAddress.state" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="billingAddress.country">COUNTRY</form:label>
					<div class="col-sm-4">
					<form:input path="billingAddress.country" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="billingAddress.pincode">PINCODE</form:label>
					<div class="col-sm-4">
					<form:input path="billingAddress.pincode" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				
				<br>
				<br>

			<!-- SHIPPING ADDRESS -->				

			<h1>SHIPPING ADDRESS</h1>

				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="shippingAddress.hno">H#</form:label>
					<div class="col-sm-4">
					<form:input path="shippingAddress.hno" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="shippingAddress.streetname">STREET NAME</form:label>
					<div class="col-sm-4">
					<form:input path="shippingAddress.streetname" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="shippingAddress.city">CITY</form:label>
					<div class="col-sm-4">
					<form:input path="shippingAddress.city" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="shippingAddress.state">STATE</form:label>
					<div class="col-sm-4">
					<form:input path="shippingAddress.state" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="shippingAddress.country">COUNTRY</form:label>
					<div class="col-sm-4">
					<form:input path="shippingAddress.country" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="shippingAddress.pincode">PINCODE</form:label>
					<div class="col-sm-4">
					<form:input path="shippingAddress.pincode" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				

				<br />
				<br />

				<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" value="SUBMIT" class="btn btn-primary">
				</div>

			</form:form>
			</div>
			</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>