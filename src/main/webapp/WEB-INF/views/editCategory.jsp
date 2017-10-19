<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Edit Category</h1>


            <p class="lead">Fill the below information to edit a category:</p>
        </div>
   <c:url value="/category/editCategory/${categoryId}" var="url"></c:url>
        <form:form class="form-horizontal" action="${url}" method="post" commandName="category1"> 
                   
         <div class="form-group">
				<form:label class="col-sm-2 control-label" path="categoryName">Name</form:label>
				<div class="col-sm-4">
			    <form:input path="categoryName" type="text" class="form-control" placeholder="Name" />
				</div>
			</div> 
			
			<div class="form-group">
				<form:label class="col-sm-2 control-label" path="categoryDescription">Description</form:label>
				<div class="col-sm-4">
			    <form:textarea path="categoryDescription" type="text" class="form-control"/>
				</div>
			</div>    
          
          <br/>
           <div class="form-group">
        <div class="col-sm-offset-2 col-sm-6"> 
        <input type="submit" value="submit" class="btn btn-success">
        <a href="<c:url value="/product/allProduct" />" class="btn btn-danger">Cancel</a>
		</div>
		</div>
		

    </form:form>
</div>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>