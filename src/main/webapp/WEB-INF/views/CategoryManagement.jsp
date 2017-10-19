<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Category Management</h1>


            <p class="lead">This is the category inventory page</p>
			</div>

    <div class="table-responsive ">
        <table  class="table table-hover">
            <thead>
            <tr class="bg-success">
                <th>Category Id</th>
                <th>Category Name</th>
                <th>Category Description</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${category}" var="category">
                <tr>
                   <td>${category.categoryId}</td>
                   <td>${category.categoryName}</td>
                   <td>${category.categoryDescription}</td>
                    <td>
                        <a href="<spring:url value="/category/deleteCategory/${category.categoryId}" />"><span class="glyphicon glyphicon-remove"></span></a>
                        &nbsp&nbsp&nbsp
                        <a href="<spring:url value="/category/editCategory/${category.categoryId}" />"><span class="glyphicon glyphicon-pencil"></span></a>
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
        <a href="<c:url value="/category/addCategory" />" class="btn btn-success" role="button">Add Category</a>
        <a href="<c:url value="/admin" />" class="btn btn-danger">Back</a>
        </c:if>	
</div>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>