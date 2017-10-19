<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
		
		<br/>
			<h1>Customer</h1>


			<p class="lead">Customer Details:</p>
		</div>

		<form:form commandName="order" class="form-horizontal">

			
        <h3>Basic Info:</h3>
        
        
			<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.firstname">Name</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.firstname" type="text" class="form-control" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.email">Email</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.email" type="text" class="form-control" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.phoneno">Phone</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.phoneno" type="text" class="form-control" />
				</div>
				</div>

	        <br/>

			<h3>Billing Address:</h3>
			
			<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.shippingAddress.hno">House Number</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.billingAddress.hno" type="text" class="form-control" />
				</div>
				</div>
			
			<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.billingAddress.streetname">STREET NAME</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.billingAddress.streetname" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.billingAddress.city">CITY</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.billingAddress.city" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.billingAddress.state">STATE</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.billingAddress.state" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.billingAddress.country">COUNTRY</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.billingAddress.country" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.billingAddress.pincode">PINCODE</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.billingAddress.pincode" type="text" class="form-control" placeholder="" />
				</div>
				</div>
			
			<input type="hidden" name="_flowExecutionKey" />

			<br />
			<br />

	<!-- 		<button class="btn btn-default"
				name="_eventId_backToCollectCustomerInfo">Back</button> -->

			<input type="submit" value="Next" class="btn btn-success"
				name="_eventId_customerInfoCollected" />

			<button class="btn btn-danger" name="_eventId_cancel">Cancel</button>

		</form:form>

	</div>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>