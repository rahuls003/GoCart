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
        <table  class="table table-striped table-hover">
            <thead>
            <tr class="bg-success">
                		<th>ID</th>					
						<th>FIRSTNAME</th>
						<th>LASTNAME</th>
						<th>EMAIL</th>
						<th>PHONENO</th>
						<th>USERNAME</th>
						
						<th> </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${customer}">
						<tr>
							<td><c:out value="${p.custid}" /></td>
							<td><c:out value="${p.firstname}" /></td>
							<td><c:out value="${p.lastname}" /></td>
							<td><c:out value="${p.email}" /></td>
							<td><c:out value="${p.phoneno}" /></td>
							<td><c:out value="${p.username}" /></td>
							
							<td>    </td>
                    <%-- <td>
                        <a href="<spring:url value="/category/deleteCategory/${category.categoryId}" />"><span class="glyphicon glyphicon-remove"></span></a>
                        &nbsp&nbsp&nbsp
                        <a href="<spring:url value="/category/editCategory/${category.categoryId}" />"><span class="glyphicon glyphicon-pencil"></span></a>
                    </td> --%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
</div>
        <a href="<spring:url value="/" />" class="btn btn-primary">More Shopping</a>
        <a href="<c:url value="/admin" />" class="btn btn-danger">Back</a>
</div>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>