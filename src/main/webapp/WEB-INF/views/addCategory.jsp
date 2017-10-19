<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Add Category</h1>


            <p class="lead">Fill the below information to add a Category:</p>
        </div>

        <form:form class="form-horizontal" action="${pageContext.request.contextPath}/category/addCategory1"
                   method="post" commandName="category"> 
                 
            <div class="form-group">
				<form:label class="col-sm-2 control-label" path="categoryName">Name</form:label>
				<div class="col-sm-4">
			    <form:input path="categoryName" type="text" class="form-control" placeholder="Name" />
				</div>
			</div> 
			
			<div class="form-group">
				<form:label class="col-sm-2 control-label" path="categoryDescription">Description</form:label>
				<div class="col-sm-4">
				<form:errors path="categoryDescription" cssStyle="color:#ff0000;" />
			    <form:textarea path="categoryDescription" type="text" class="form-control"/>
				</div>
			</div>      

			 <br/>
           <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10"> 
        <input type="submit" value="submit" class="btn btn-success">
        <a href="<c:url value="/category/allCategory" />" class="btn btn-danger">Cancel</a>
		</div>
		</div>

</form:form>
</div>
</div>



<%@ include file="/WEB-INF/views/template/footer.jsp" %>