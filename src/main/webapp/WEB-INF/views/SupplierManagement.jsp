<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Supplier Management</h1>


            <p class="lead">This is the supplier inventory page</p>
			</div>
			
<div class="table-responsive ">
        <table  class="table table-hover">
            <thead>
            <tr class="bg-success">
                <!-- <th>Image</th> -->
                <th>Supplier Id</th>
                <th>Supplier Name</th>
                <th>Supplier City</th>
                <th>supplierPhoneno</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${supplier}" var="supplier">
                <tr>
                   <td>${supplier.supplierId}</td>
                   <td>${supplier.supplierName}</td>
                   <td>${supplier.supplierCity}</td>
                   <td>${supplier.supplierPhoneno}</td>
                    <td>
                        <a href="<spring:url value="/supplier/deleteSupplier/${supplier.supplierId}" />"><span class="glyphicon glyphicon-remove"></span></a>
                        &nbsp&nbsp&nbsp
                        <a href="<spring:url value="/supplier/editSupplier/${supplier.supplierId}" />"><span class="glyphicon glyphicon-pencil"></span></a>
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
        <a href="<c:url value="/supplier/addSupplier" />" class="btn btn-success" role="button">Add Supplier</a>
        <a href="<c:url value="/admin" />" class="btn btn-danger">Back</a>
        </c:if>	
</div>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>