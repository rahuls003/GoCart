<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container" ng-app = "cartApp">
        <div class="page-header">
            <h1>Product Detail</h1>

            <p class="lead">Here is the detail information of the product:</p>
        </div>

        
            <div class="row">
                <div class="col-xs-5">
                    <img src="<c:url value="/resources/images/${product.productId}.jpg" />" alt="image" style="width:100%"/>
                </div>
                <div class="col-xs-5">
                    <h3>${product.productName}</h3>
                    <p>${product.productDescription}</p>
                    <p><strong>Status</strong>: ${product.productStatus}</p>
                    <p><strong>Stock</strong>: ${product.unitInStock}</p>
                    <p><strong>Condition</strong>: ${product.productCondition}</p>
                    <p>Rs ${product.productPrice}</p>

                    <br/>

                    <div class="row"  ng-controller="cartCtrl">
                        <a href="#" class="btn btn-warning btn-large" ng-click="addToCart(${product.productId})"><span class="glyphicon glyphicon-shopping-cart"></span> Order Now</a>
                        <a href="<spring:url value="/customer/cart/getCartId" />" class="btn btn-default"><span class="glyphicon glyphicon-hand-right"></span> View Cart</a>
                         <a href="<c:url value="/product/allProduct" />" class="btn btn-danger">Back</a>
                    </div>

                </div>
            </div>
        </div>
</div>

<script src="<c:url value="/resources/js/Controller.js"/> "> </script>
