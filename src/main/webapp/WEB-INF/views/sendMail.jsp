<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Sending Favorite Product</h1>

            <p class="lead">Now Send Your Favorite Product to your Near and Dear Ones!!</p>
        </div>
        <form class="form-horizontal" method="post" action="<c:url value="/product/sendEmail" />">
				
  <div class="form-group">
    <label class="control-label col-sm-2"> To:</label>
    <div class="col-sm-6">
      <input type="text" class="form-control" name="recipient" >
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2"> Subject:</label>
    <div class="col-sm-6">
      <input type="text" class="form-control" name="subject" >
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="comment"> Message:</label>
    <div class="col-sm-6">
      <textarea class="form-control" name="message" rows="5"  id="comment"> </textarea>
    </div>
  </div>
     
     <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Send E-mail</button>
    </div>
  </div>
				
		</form>
		</div>
		</div>

		
<%@ include file="/WEB-INF/views/template/footer.jsp" %>  