<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
		<br/>
			<h1>Order</h1>

			<p class="lead">Order confirmation</p>
		</div>

		<div class="container">

			<div class="row">

				<form:form commandName="order" class="form-horizontal">

					<div
						class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

						<div class="txt-center">
							<h1>Receipt</h1>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<address>
									<strong>Shipping Address</strong><br />
									${order.cart.customer.shippingAddress.hno}, 
									${order.cart.customer.shippingAddress.streetname} <br />
									${order.cart.customer.shippingAddress.city},
									${order.cart.customer.shippingAddress.state} <br />
									${order.cart.customer.shippingAddress.country},
									${order.cart.customer.shippingAddress.pincode}
								</address>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 text-right">
								<p>
									Shipping Date:
									<fmt:formatDate type="date" value="${now}" />
								</p>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<address>
									<strong>Billing Address</strong><br />
									${order.cart.customer.billingAddress.hno}
									${order.cart.customer.billingAddress.streetname} <br />
									${order.cart.customer.billingAddress.city},
									${order.cart.customer.billingAddress.state} <br />
									${order.cart.customer.billingAddress.country},
									${order.cart.customer.billingAddress.pincode}
								</address>
							</div>
						</div>

						<div class="row">
							<table class="table table-hover">
								<thead>
									<tr>
										<td>Product</td>
										<td>#</td>
										<td class="text-center">Price</td>
										<td class="text-center">Total</td>
									</tr>
								</thead>
								<tbody>
									<c:set var="grandTotal" value="0.0"></c:set>
									<c:forEach var="cartItem" items="${order.cart.cartItems}">
										<tr>
											<td class="col-md-9"><em>${cartItem.product.productName}</em></td>
											<td class="col-md-1" style="text-align: center">${cartItem.quantity}</td>
											<td class="col-md-1" style="text-align: center">${cartItem.product.productPrice}</td>
											<td class="col-md-1" style="text-align: center">${cartItem.totalPrice}</td>
											<c:set var="grandTotal"
												value="${grandTotal + cartItem.totalPrice }"></c:set>
										</tr>
									</c:forEach>

									<tr>
										<td></td>
										<td></td>
										<td class="text-right">
											<h4>
												<strong>Grand Total:</strong>
											</h4>
										</td>
										<td class="text-center text-danger">
											<h4>
												<strong>Rs. ${grandTotal}</strong>
											</h4>
										</td>
									</tr>

								</tbody>
							</table>
						</div>


						<input type="hidden" name="_flowExecutionKey" /> <br />
						<br />

						<button class="btn btn-default"
							name="_eventId_backToCollectShippingDetail">Back</button>

						<input type="submit" value="Submit Order" class="btn btn-success"
							name="_eventId_orderConfirmed" />

						<button class="btn btn-danger" name="_eventId_cancel">Cancel</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/template/footer.jsp" %>