<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Add Product</h1>


            <p class="lead">Fill the below information to add a product:</p>
        </div>

        <form:form class="form-horizontal" action="${pageContext.request.contextPath}/product/addProduct1"
                   method="post" commandName="product" enctype="multipart/form-data"> 
                   
                   
            <div class="form-group">
				<form:label class="col-sm-2 control-label" path="productName">Name</form:label>
				<div class="col-sm-4">
				<form:errors path="productName" cssStyle="color:#ff0000;" />
			    <form:input path="productName" type="text" class="form-control" placeholder="Name" />
				</div>
			</div>       
         
           <div class="form-group">
				<form:label class="col-sm-2 control-label" path="image">Image</form:label>
				<div class="col-sm-6">
					<form:input  path="image"  type="file" class="control-label" placeholder="select a image"  />
				</div>
			</div>
           
          
            <div class="form-group">
				<form:label class="col-sm-2 control-label" path="productDescription">Description</form:label>
				<div class="col-sm-4">
			    <form:textarea path="productDescription" type="text" class="form-control" />
				</div>
			</div>   
        
             <div class="form-group">
				<form:label class="col-sm-2 control-label" path="productPrice">Price</form:label>
				<div class="col-sm-4">
				<form:errors path="productPrice" cssStyle="color:#ff0000;" />
			    <form:input path="productPrice" type="text" class="form-control" />
				</div>
			</div>  

            <div class="form-group">
            <form:label class="col-sm-2 control-label" path="productCondition">Condition</form:label>
                <div class="col-sm-4"> 
                <label class="checkbox-inline"><form:radiobutton path="productCondition" value="new" />New</label>
                <label class="checkbox-inline"><form:radiobutton path="productCondition" value="used" />Used</label>
            </div>
            </div>

            <div class="form-group">
            <form:label class="col-sm-2 control-label" path="productStatus">Status</form:label>
                <div class="col-sm-4"> 
                <label class="checkbox-inline"><form:radiobutton path="productStatus" value="active" />Active</label>
                <label class="checkbox-inline"><form:radiobutton path="productStatus" value="inactive" />Inactive</label>
            </div>
            </div>

			<div class="form-group">
				<form:label class="col-sm-2 control-label" path="unitInStock">Unit In Stock</form:label>
				<div class="col-sm-4">
				<form:errors path="unitInStock" cssStyle="color:#ff0000;" />
			    <form:input path="unitInStock" type="number" class="form-control" />
				</div>
			</div> 
          
          
          	<div class="form-group">
				<form:label class="col-sm-2 control-label" path="category">Category</form:label>
				<div class="col-sm-6">
					<form:select path="category.categoryDescription" onchange="selectcategory(${desc})"
						class="form-control" >
					<form:option value="" label="------ Select Category ------"></form:option>	
					<form:options items="${desc}" itemLabel="categoryDescription" itemValue="categoryDescription"/>
				</form:select>
				</div>
			</div>
			
			<div class="form-group">
				<form:label class="col-sm-2 control-label" path="supplier">Supplier</form:label>
				<div class="col-sm-6">
					<form:select path="supplier.supplierName" onchange="selectcategory(${supp})"
						class="form-control" >
					<form:option value="" label="------ Select Supplier ------"></form:option>	
					<form:options items="${supp}" itemLabel="supplierName" itemValue="supplierName"/>
				</form:select>
				</div>
			</div>
          
          
          <br/>
           <div class="form-group">
        <div class="col-sm-offset-2 col-sm-6"> 
        <input type="submit" value="submit" class="btn btn-success">
        <a href="<c:url value="/All_Product" />" class="btn btn-danger">Cancel</a>
		</div>
		</div>
		

    </form:form>
</div>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>