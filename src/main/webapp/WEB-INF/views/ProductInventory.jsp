<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<script>

    $(document).ready(function(){
        var searchCondition = '${searchCondition}';

        $('.table').DataTable({
        	 "lengthMenu": [[1,2,3,5,10, -1], [1,2,3,5,10, "All"]],
            "oSearch" : {"sSearch": searchCondition}
        })
    });
</script>


<div class="container-wrapper">
    <div class="container">
        
        <div class="page-header">
            
            <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
            <h1>Product Inventory Page</h1>
            <p class="lead">This is the product inventory page</p>
            </c:if>
            
            <c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
		    <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h1>Product's For You : </h1>
            <p class="lead">Shop your need</p>
            </c:if>
            </c:if>
            
		</div>			
			
<div class="table-responsive ">
        <table  class="table table-hover">
	            <thead>
	            <tr class="bg-success">
	            	<c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
	                <th>Product Id</th>
	                </c:if>
	                <th>Product Name</th>
	                <th>Product_Image</th>
	                <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
	                <th>Description</th>
	                </c:if>
	                <th>Price</th>
	                <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
	                <th>Condition</th>
	                </c:if>
	                <th>Status</th>
	                <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
	                <th>unit In Stock</th>
	                </c:if>
	                <th>Category</th>
	                <th></th>
	            </tr>
	            </thead>
	            
	            <tbody>
	            <c:forEach items="${product}" var="product">
	                <tr>
	                <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
	                    <td>${product.productId}</td>
	                    </c:if>
	                    
	                    <td>${product.productName}</td>
	                    <td><img src="<c:url value="/resources/images/${product.productId}.jpg"/>" alt="error"
									height=70px width=70px></td>
						 <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">			
	                     <td>${product.productDescription}</td>
	                     </c:if>
	                     <td>Rs ${product.productPrice} </td>
	                     <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
	                     <td>${product.productCondition}</td>
	                     </c:if>
	                     <td>${product.productStatus}</td>
	                     <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
	                     <td>${product.unitInStock}</td>
	                     </c:if>
	                     <td>${product.category.categoryName}</td>
	                    <td>     
	                    
	                   <c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
		               <c:if test="${pageContext.request.userPrincipal.name != null}">                        
	                   <a href="<spring:url value="/product/viewProduct/${product.productId}" />"><span class="glyphicon glyphicon-info-sign"></span></a>
	                   &nbsp&nbsp&nbsp
	                   </c:if>
	                   </c:if>
	                   
	                   &nbsp&nbsp&nbsp 

					    <c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
						<c:if test="${pageContext.request.userPrincipal.name != null}">
						<a href="<spring:url value="/product/favorite/${product.productId}" />">
						<img src="<c:url value="/resources/images/fav.png" />" /></a> 
						 &nbsp&nbsp&nbsp 
						</c:if>
						</c:if>
	                   
	                   
                       <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                       <a href="<spring:url value="/product/deleteProduct/${product.productId}" />"><span class="glyphicon glyphicon-remove"></span></a>
	                   &nbsp&nbsp&nbsp
	                   <a href="<spring:url value="/product/editProduct/${product.productId}" />"><span class="glyphicon glyphicon-pencil"></span></a>
	                    	</c:if>
	                    </td>
	                </tr>
	            </c:forEach>
	            </tbody>
        </table>
</div>
		
		<c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
		    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <a href="<spring:url value="/" />" class="btn btn-primary">More Shopping</a>
        </c:if>
        </c:if>
        
        <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
        <a href="<c:url value="/product/addProduct" />" class="btn btn-success" role="button">Add Product</a>
        <a href="<c:url value="/admin" />" class="btn btn-danger">Back</a>
        </c:if>
       
</div>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>