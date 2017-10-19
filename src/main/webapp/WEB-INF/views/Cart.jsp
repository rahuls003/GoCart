<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
    <br/>
             <section>
            <div class="jumbotron abc">
                <div class="container">
               
                    <h1>Cart</h1>
                    <p>Your Cart</p>
                </div>
            </div>
        </section>

        <section class="container" ng-app="cartApp">

            <div ng-controller = "cartCtrl" ng-init="initCartId('${cartId}')">

         <div>
            <a class="btn btn-warning pull-left" ng-click = "clearCart(${cartItem.cartItemId})"><span class="glyphicon glyphicon-remove-sign"></span> Clear Cart</a>
                   
            <a href="<spring:url value="/order/${cartId}" />" class="btn btn-success pull-right"><span class="glyphicon glyphicon-shopping-cart"></span> Check out</a>
    
         </div> 

                

                <table class="table table-hover">
                    <tr>
                    	<th></th>
                        <th>Product</th>
                        <th>Unit Price</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    <tr ng-repeat = "item in cart.cartItems">
                    
                    <td><c:url var="src" value="/resources/images/{{item.product.productId}}.jpg"></c:url>
							<img class="img-thumbnail" src="${src}" width="120" height="120" /></td>
                        <td>{{item.product.productName}}</td>
                        <td>{{item.product.productPrice}}</td>
                        <td>{{item.quantity}}</td>
                        <td>{{item.totalPrice}}</td>
                        <td><a href="#" class="label label-danger"
									ng-click="removeFromCart(item.cartItemId)"> <span
										class="glyphicon glyphicon-remove">remove</span>
								</a></td>
                    </tr>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th>Grand Total</th>
                        <th>{{calGrandTotal()}}</th>
                        <th></th>
                    </tr>
                </table>

                <a href="<spring:url value="/" />" class="btn btn-info">Continue Shopping</a>
         
            </div>
        </section>

</div>
</div>

<script src="<c:url value="/resources/js/Controller.js"/> "> </script>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>