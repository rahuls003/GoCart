<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

        <!-- Carousel
        ================================================== -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="resources/images/bod7.jpg" alt="error" >
                    <!-- <div class="carousel-caption">
        			<button type="button" class="btn btn-success btn-lg">Default</button>
      				</div> -->   
                </div>

                <div class="item">
                    <img src="resources/images/bod5.jpg" alt="error" >
                </div>

                <div class="item">
                    <img src="resources/images/bod6.jpg" alt="error" >
                </div>

                <div class="item">
                    <img src="resources/images/bod8.jpg" alt="error" >
                </div>
                
                <div class="item">
                    <img src="resources/images/bod9.jpg" alt="error" >
                </div>
            
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        
        <div class="container">
        <div class="row">
            
            <div class="col-sm-6">
                <img src="resources/images/shopWomen.jpg" class="img-responsive" height="415" width="570" alt="Image">
                
            </div>

            <div class="col-sm-6">
                <img src="resources/images/shopMen.jpg" class="img-responsive" height="415" width="570" alt="Image">
                
            </div>
        </div>
        </div>
        <br/>
      <div class="container">
        <div class="row">
		<div class="col-sm-3">
			<a title="Shop Women's Flats" href="">
				<img alt="Women's Flats" src="resources/images/flats.jpg" class="img-responsive" height="250" width="270">
			</a>
		</div>
		
		<div class="col-sm-3">
			<a title="Shop Women's Heels" href="">
				<img alt="Women's Heels" src="resources/images/heels.jpg" class="img-responsive" height="250" width="270">
			</a>
		</div>
		
		<div class="col-sm-3">
			<a title="Shop Men's Sneakers" href="">
				<img alt="Men's Sneakers" src="resources/images/sneakers.jpg" class="img-responsive" height="250" width="270">
			</a>
		</div>
		
		<div class="col-sm-3">
			<a title="Shop Men's Shoes at Milano Shoes" href="">
				<img alt="Men's Shoes" src="resources/images/shoes.jpg" class="img-responsive" height="250" width="270">
			</a>
		</div>
	</div>
	</div>
<br/>
    <div class="container">
        <div class="row">
		<div class="col-sm-6">
			<a href="" title="Shop Kids Shoe Collections at Milano Shoes">
				<img alt="Kid's Shoes" src="resources/images/kids.jpg" class="img-responsive" height="225" width="570" />
			</a>
		</div>
		
		<div class="col-sm-6">
			<a href="" title="Shop Bag Collections at Milano Shoes">
				<img alt="Bag's" src="resources/images/bags.jpg" class="img-responsive" height="225" width="570" />
			</a>
		</div>
	</div>
    </div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>
