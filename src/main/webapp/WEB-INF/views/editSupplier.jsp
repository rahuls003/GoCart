<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Edit Category</h1>


            <p class="lead">Fill the below information to edit a category:</p>
        </div>
   <c:url value="/supplier/editSupplier/${supplierId}" var="url"></c:url>
        <form:form class="form-horizontal" action="${url}" method="post" commandName="supplier1"> 
                   
         <div class="form-group">
				<form:label class="col-sm-2 control-label" path="supplierName">Name</form:label>
				<div class="col-sm-4">
				<form:errors path="supplierName" cssStyle="color:#ff0000;" />
			    <form:input path="supplierName" type="text" class="form-control" placeholder="Name" />
				</div>
			</div>  
			
			<div class="form-group">
				<form:label class="col-sm-2 control-label" path="supplierCity">City</form:label>
				<div class="col-sm-4">
			    <form:input path="supplierCity" type="text" class="form-control" />
				</div>
			</div> 
		
			<div class="form-group">
				<form:label class="col-sm-2 control-label" path="supplierPhoneno">Phone Number</form:label>
				<div class="col-sm-4">
			    <form:input path="supplierPhoneno" type="text" class="form-control" />
				</div>
			</div>

			 <br/>
           <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10"> 
        <input type="submit" value="submit" class="btn btn-success">
        <a href="<c:url value="/supplier/allSupplier" />" class="btn btn-danger">Cancel</a>
		</div>
		</div>
		

    </form:form>
</div>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>