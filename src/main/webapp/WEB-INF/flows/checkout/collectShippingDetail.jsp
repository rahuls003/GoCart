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

			<h3>Shipping Address:</h3>

			<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.shippingAddress.hno">House Number</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.shippingAddress.hno" type="text" class="form-control" />
				</div>
				</div>
			
			<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.billingAddress.streetname">STREET NAME</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.shippingAddress.streetname" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.billingAddress.city">CITY</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.shippingAddress.city" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.billingAddress.state">STATE</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.shippingAddress.state" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.billingAddress.country">COUNTRY</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.shippingAddress.country" type="text" class="form-control" placeholder="" />
				</div>
				</div>
				
				<div class="form-group">
					<form:label class="col-sm-2 control-label" path="cart.customer.billingAddress.pincode">PINCODE</form:label>
					<div class="col-sm-6">
					<form:input path="cart.customer.shippingAddress.pincode" type="text" class="form-control" placeholder="" />
				</div>
				</div>

			<input type="hidden" name="_flowExecutionKey" />

			<br />
			<br />

			<button class="btn btn-default"
				name="_eventId_backToCollectCustomerInfo">Back</button>

			<input type="submit" value="Next" class="btn btn-success" name="_eventId_shippingDetailCollected" />

			<button class="btn btn-danger" name="_eventId_cancel">Cancel</button>

		</form:form>
	</div>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>