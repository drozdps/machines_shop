
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="keywords" content="MediaCenter, Template, eCommerce">
<meta name="robots" content="all">

<title>Machines</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">

<!-- Customizable CSS -->
<link rel="stylesheet" href="resources/assets/css/main.css">
<link rel="stylesheet" href="resources/assets/css/green.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
<link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">

<!-- Demo Purpose Only. Should be removed in production -->
<link rel="stylesheet" href="resources/assets/css/config.css">

<link href="resources/assets/css/green.css" rel="alternate stylesheet"
	title="Green color">
<link href="resources/assets/css/blue.css" rel="alternate stylesheet"
	title="Blue color">
<link href="resources/assets/css/red.css" rel="alternate stylesheet"
	title="Red color">
<link href="resources/assets/css/orange.css" rel="alternate stylesheet"
	title="Orange color">
<link href="resources/assets/css/navy.css" rel="alternate stylesheet"
	title="Navy color">
<link href="resources/assets/css/dark-green.css"
	rel="alternate stylesheet" title="Darkgreen color">
<!-- Demo Purpose Only. Should be removed in production : END -->

<!-- Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Icons/Glyphs -->
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">

<!-- Favicon -->
<link rel="shortcut icon" href="resources/assets/images/favicon.ico">

<!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
<!--[if lt IE 9]>
            <script src="assets/js/html5shiv.js"></script>
            <script src="assets/js/respond.min.js"></script>
        <![endif]-->
</head>




<body>


	<div class="wrapper">
		<!-- ============================================================= TOP NAVIGATION ============================================================= -->

		<!-- ============================================================= TOP NAVIGATION ============================================================= -->
		<%@include file="in_machine/nav.jsp"%>
		<!-- ============================================================= TOP NAVIGATION : END ============================================================= -->
		<!-- ============================================================= HEADER ============================================================= -->
		<%@include file="in_machine/header.jsp"%>
		<!-- ============================================================= HEADER : END ============================================================= -->
		<div class="animate-dropdown">
			<!-- ========================================= BREADCRUMB ========================================= -->


			<!-- ============================================================= HEADER : END ============================================================= -->
			<div class="animate-dropdown">
				<!-- ========================================= BREADCRUMB ========================================= -->
				<div id="top-mega-nav">
					<div class="container">
						<nav>
							<ul class="inline">
								<!--                <li class="dropdown le-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-list"></i> shop by department
                    </a>-->

								<!--                    <ul class="dropdown-menu">
                        <li><a href="#">Machine</a></li>
                        <li><a href="#">CPUs, Processors</a></li>
                    </ul>-->
								<!--</li>-->
								<%@include file="in_machine/dropdown_le_dropdown.jsp"%>

								<li class="breadcrumb-nav-holder">
									<ul>

										<!--/.breadcrumb-item-->

										<li class="breadcrumb-item"><a href="index.htm">Home</a>
										</li>
										<!--/.breadcrumb-item-->

										<li class="breadcrumb-item current"><a href="#">Machines</a>
										</li>
										<!--/.breadcrumb-item-->
									</ul>
								</li>
								<!--/.breadcrumb-nav-holder-->

							</ul>
							<!--/.inline-->
						</nav>

					</div>
					<!--/.container-->
				</div>
				<!--/#top-mega-nav-->






				<!-- ========================================= BREADCRUMB : END ========================================= -->
			</div>
			<section id="category-grid">
				<div class="container">

					<!-- ========================================= SIDEBAR ========================================= -->
					<div class="col-xs-12 col-sm-3 no-margin sidebar narrow">

						<!-- ========================================= PRODUCT FILTER ========================================= -->
						<div class="widget">
							<h1>Filter</h1>

							<form action="search" method="GET">
								<input type="hidden" name="page" value="ru-allmachine">

								<div class="body bordered">
									<div class="category-filter">
										<h2>Manufacturer</h2>
										<hr>
										<ul>
											<!--<li><input checked="checked" class="le-checkbox" type="checkbox"  /> <label>Deckel Maho</label> <span class="pull-right">(2)</span></li>-->
											<c:forEach var='cur' items='${mapMachineManufacturers}'>
												<c:choose>
													<c:when test="${cur.value==1}">
														<li><input checked="checked" class="le-checkbox"
															type="checkbox" name='manufacturer${cur.key}' value='1' />
															<label>${cur.key}</label></li>
													</c:when>
													<c:otherwise>
														<li><input class="le-checkbox" type="checkbox"
															name='manufacturer${cur.key}' value='1' /> <label>${cur.key}</label>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>

										</ul>
									</div>
									<!-- /.category-filter -->




									<div class="category-filter">
										<h2>Location</h2>
										<hr>
										<ul>


											<c:forEach var='cur' items='${mapMachineLocations}'>
												<c:choose>
													<c:when test="${cur.value==1}">
														<li><input checked="checked" class="le-checkbox"
															type="checkbox" name='location${cur.key}' value='1' /> <label>${cur.key}</label>
														</li>
													</c:when>
													<c:otherwise>
														<li><input class="le-checkbox" type="checkbox"
															name='location${cur.key}' value='1' /> <label>${cur.key}</label>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>

										</ul>
									</div>



									<!--/.category-filter-->



									<div class="price-filter">
										<h2>Year</h2>
										<hr>
										<div id="item-count" class="le-select">
											<select name="fromYear">
												<option disabled>FROM</option>
												<c:forEach begin='1990' end='2016' var='i'>
													<c:choose>
														<c:when test="${i==fromYear}">
															<option selected value="${i}">${i}</option>
														</c:when>
														<c:otherwise>
															<option value="${i}">${i}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>

											</select>

										</div>

										<div id="item-count" class="le-select">
											<select name="toYear">
												<option disabled>TO</option>
												<c:forEach begin='1990' end='2016' var='i'>
													<c:choose>
														<c:when test="${i==toYear}">
															<option selected value="${i}">${i}</option>
														</c:when>
														<c:otherwise>
															<option value="${i}">${i}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>

											</select>
										</div>
									</div>
									<hr>
									<input type="submit" name="register" value="Choose Machine" />
								</div>
								<!-- /.body -->
							</form>
						</div>
						<!-- /.widget -->
						<!-- ========================================= PRODUCT FILTER : END ========================================= -->


						<!-- ========================================= FEATURED PRODUCTS ========================================= -->
						<!-- ========================================= FEATURED PRODUCTS : END ========================================= -->
					</div>
					<!-- ========================================= SIDEBAR : END ========================================= -->

					<!-- ========================================= CONTENT ========================================= -->

					<div class="col-xs-12 col-sm-9 no-margin wide sidebar">

						<!--            <section id="recommended-products" class="carousel-holder hover small">

    <div class="title-nav">
        <h2 class="inverse">Video</h2>
        <div class="nav-holder">
            <a href="#prev" data-target="#owl-recommended-products" class="slider-prev btn-prev fa fa-angle-left"></a>
            <a href="#next" data-target="#owl-recommended-products" class="slider-next btn-next fa fa-angle-right"></a>
        </div>
    </div>
                 /.title-nav 

    <div id="owl-recommended-products" class="owl-carousel product-grid-holder">
        
        
     <div class="product-item">
     <div class="ribbon red"><span>sale</span></div> 
            <div class="image">
             <iframe width="224" height="126"  src="https://www.youtube.com/embed/pR8AATYtAuE" frameborder="0" allowfullscreen></iframe>     
            </div>
            <div class="brand">How to Take a Screenshot on Your Haas Control</div>
     </div>
                
         <div class="product-item">
         <div class="ribbon red"><span>sale</span></div> 
                <div class="image">
                 <iframe width="224" height="126"  src="https://www.youtube.com/embed/Qq4LECgEchc" frameborder="0" allowfullscreen></iframe>     
                </div>
                <div class="brand">Easily Engrave Sequential Serial Numbers – G47 Part 2</div>
         </div>
                
         <div class="product-item">
         <div class="ribbon red"><span>sale</span></div> 
                <div class="image">
                 <iframe width="224" height="126"  src="https://www.youtube.com/embed/dXR2wDDFFm4" frameborder="0" allowfullscreen></iframe>     
                </div>
                <div class="brand">Spindle Speed Variation - Stop chatter on your CNC lathe</div>
                <div class="brand">Haas Automation</div>
         </div>

        
        <div class="no-margin carousel-item product-item-holder hover size-medium">
            <div class="product-item">
                <div class="ribbon red"><span>sale</span></div>
                <div class="ribbon blue"><span>new!</span></div> 
                <div class="image">
                 <iframe width="224" height="126"  src="https://www.youtube.com/embed/pR8AATYtAuE" frameborder="0" allowfullscreen></iframe> 
                    <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-11.jpg" />
                </div>
                <div class="body">
                    <div class="title">
                        <a href="single-product.html">How to Take a Screenshot on Your Haas Control</a>
                    </div>
                    <div class="brand">HAAS</div>
                </div>
            </div>
        </div> 
        /.carousel-item 
        
        
                <div class="no-margin carousel-item product-item-holder hover size-medium">
                    <div class="product-item">
                        <div class="ribbon red"><span>sale</span></div>
                        <div class="ribbon blue"><span>new!</span></div> 
                        <div class="image">
                         <iframe width="224" height="126" src="https://www.youtube.com/embed/Qq4LECgEchc" frameborder="0" allowfullscreen></iframe>
                        </div>
                        <div class="body">
                            <div class="title">
                                <a href="single-product.html">How to Take a Screenshot on Your Haas Control</a>
                            </div>
                            <div class="brand">Haas Automation</div>
                        </div>
                    </div>
                </div> 
  
        

        <div class="no-margin carousel-item product-item-holder hover size-medium">
            <div class="product-item">
                <div class="ribbon blue"><span>new!</span></div> 
                <div class="image">
                    <iframe width="224" height="126" src="https://www.youtube.com/embed/pR8AATYtAuE" frameborder="0" allowfullscreen></iframe>
                    <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-12.jpg" />
                </div>
                <div class="body">
                    <div class="title">
                        <a href="single-product.html">cinemizer OLED 3D virtual reality TV Video</a>
                    </div>
                    <div class="brand">zeiss</div>
                </div>
                <div class="prices">

                    <div class="price-current text-right">$1199.00</div>
                </div>
                <div class="hover-area">
                    <div class="add-cart-button">
                        <a href="single-product.html" class="le-button">add to cart</a>
                    </div>
                    <div class="wish-compare">
                        <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                        <a class="btn-add-to-compare" href="#">compare</a>
                    </div>
                </div>
            </div>
        </div> /.carousel-item 

        <div class="no-margin carousel-item product-item-holder hover size-medium">
            <div class="product-item">
                <div class="image">
                    <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-13.jpg" />
                </div>
                <div class="body">
                    <div class="title">
                        <a href="single-product.html">s2340T23" full HD multi-Touch Monitor</a>
                    </div>
                    <div class="brand">dell</div>
                </div>
                <div class="prices">
                    <div class="price-current text-right">$1199.00</div>
                </div>
                <div class="hover-area">
                    <div class="add-cart-button">
                        <a href="single-product.html" class="le-button">add to cart</a>
                    </div>
                    <div class="wish-compare">
                        <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                        <a class="btn-add-to-compare" href="#">compare</a>
                    </div>
                </div>
            </div>
        </div>
/.carousel-item 

        <div class="no-margin carousel-item product-item-holder hover size-medium">
            <div class="product-item">
                <div class="ribbon blue"><span>new!</span></div> 
                <div class="image">
                    <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-14.jpg" />
                </div>
                <div class="body">
                    <div class="title">
                        <a href="single-product.html">kardon BDS 7772/120 integrated 3D</a>
                    </div>
                    <div class="brand">harman</div>
                </div>
                <div class="prices">
                    <div class="price-current text-right">$1199.00</div>
                </div>
                <div class="hover-area">
                    <div class="add-cart-button">
                        <a href="single-product.html" class="le-button">add to cart</a>
                    </div>
                    <div class="wish-compare">
                        <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                        <a class="btn-add-to-compare" href="#">compare</a>
                    </div>
                </div>
            </div>
        </div> /.carousel-item 

        <div class="no-margin carousel-item product-item-holder hover size-medium">
            <div class="product-item">
                <div class="ribbon green"><span>bestseller</span></div> 
                <div class="image">
                    <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-15.jpg" />
                </div>
                <div class="body">
                    <div class="title">
                        <a href="single-product.html">netbook acer travel B113-E-10072</a>
                    </div>
                    <div class="brand">acer</div>
                </div>
                <div class="prices">
                    <div class="price-current text-right">$1199.00</div>
                </div>
                <div class="hover-area">
                    <div class="add-cart-button">
                        <a href="single-product.html" class="le-button">add to cart</a>
                    </div>
                    <div class="wish-compare">
                        <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                        <a class="btn-add-to-compare" href="#">compare</a>
                    </div>
                </div>
            </div>
        </div> /.carousel-item 

        <div class="no-margin carousel-item product-item-holder hover size-medium">
            <div class="product-item">
                <div class="image">
                    <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-16.jpg" />
                </div>
                <div class="body">
                    <div class="title">
                        <a href="single-product.html">iPod touch 5th generation,64GB, blue</a>
                    </div>
                    <div class="brand">apple</div>
                </div>
                <div class="prices">
                    <div class="price-current text-right">$1199.00</div>
                </div>
                <div class="hover-area">
                    <div class="add-cart-button">
                        <a href="single-product.html" class="le-button">add to cart</a>
                    </div>
                    <div class="wish-compare">
                        <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                        <a class="btn-add-to-compare" href="#">compare</a>
                    </div>
                </div>
            </div>
        </div> /.carousel-item 
        
        

        <div class="no-margin carousel-item product-item-holder hover size-medium">
            <div class="product-item">
                <div class="image">
                    <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-13.jpg" />
                </div>
                <div class="body">
                    <div class="title">
                        <a href="single-product.html">s2340T23" full HD multi-Touch Monitor</a>
                    </div>
                    <div class="brand">dell</div>
                </div>
                <div class="prices">
                    <div class="price-current text-right">$1199.00</div>
                </div>
                <div class="hover-area">
                    <div class="add-cart-button">
                        <a href="single-product.html" class="le-button">add to cart</a>
                    </div>
                    <div class="wish-compare">
                        <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                        <a class="btn-add-to-compare" href="#">compare</a>
                    </div>
                </div>
            </div>
        </div> /.carousel-item 

        <div class="no-margin carousel-item product-item-holder hover size-medium">
            <div class="product-item">
                <div class="ribbon blue"><span>new!</span></div> 
                <div class="image">
                    <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/product-14.jpg" />
                </div>
                <div class="body">

                    <div class="title">
                        <a href="single-product.html">kardon BDS 7772/120 integrated 3D</a>
                    </div>
                    <div class="brand">harman</div>
                </div>
                <div class="prices">

                    <div class="price-current text-right">$1199.00</div>
                </div>
                <div class="hover-area">
                    <div class="add-cart-button">
                        <a href="single-product.html" class="le-button">add to cart</a>
                    </div>
                    <div class="wish-compare">
                        <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                        <a class="btn-add-to-compare" href="#">compare</a>
                    </div>
                </div>
            </div>
        </div> /.carousel-item 

    </div>
                
              






 /#recommended-products-carousel .owl-carousel 
</section>-->
						<!--/.carousel-holder-->



						<section id="gaming">
							<div class="grid-list-products">
								<!--<h2 class="section-title">Gaming</h2>-->

								<div class="control-bar">


									<div class="grid-list-buttons">
										<ul>
											<li class="grid-list-button-item active"><a
												data-toggle="tab" href="#grid-view"><i
													class="fa fa-th-large"></i> Grid</a></li>
											<li class="grid-list-button-item "><a data-toggle="tab"
												href="#list-view"><i class="fa fa-th-list"></i> List</a></li>
										</ul>
									</div>
								</div>
								<!-- /.control-bar -->

	<div class="tab-content">
		<div id="grid-view"class="products-grid fade tab-pane in active">
			<div class="product-grid-holder">
				<div class="row no-margin">
					<c:forEach items="${listMachine}" var="machine">
						<div class="col-xs-12 col-sm-4 no-margin product-item-holder hover">
							<div class="product-item">
								<div class="ribbon red">
									<span>On sale</span>
															</div>
															<div class="image">
																<img alt=""
																	src="<c:url value="${machine.photo[3].path}"/>"
																	width="246" height="186" />
															</div>
															<div class="body">
																<!--<div class="label-discount green">-10 % sale</div>-->
																<div class="title">
																	<a href="machine-${machine.id}">${machine.manufacturer}
																		${machine.product_id}</a>
																</div>
																<div class="brand">${machine.year}</div>
																<div class="brand">${machine.country}:</div>

															</div>
															<!--                                <div class="prices">
                                    <div class="price-prev">${machine.id }</div>
                                    <div class="price-current pull-right">$1199.00</div>
                                </div>-->
															<div class="hover-area">
																<div class="add-cart-button">
																	<a href="add-product-to-customer-basket?id=${machine.id}&page=/"
																		class="le-button">в корзину</a>
																</div>
																<div class="wish-compare">
																	<a class="btn-add-to-wishlist"
																		href="add-product-to-wish-list.htm?id=${machine.id}">в
																		понравившиеся</a> <a class="btn-add-to-compare"
																		href="add-product-to-compare-list.htm?id=${machine.id}">сравнить</a>
																</div>
															</div>


														</div>
														<!-- /.product-item -->
													</div>
													<!-- /.product-item-holder -->
												</c:forEach>

											</div>
											<!-- /.row -->
										</div>
										<!-- /.product-grid-holder -->

										<div class="pagination-holder">
											<div class="row">

												<div class="col-xs-12 col-sm-6 text-left">
													<ul class="pagination ">

														<c:forEach var="i" begin="1" end="${kol_vo_page}">
															<c:choose>
																<c:when test="${i == page}">
																	<li class="current"><a
																		href="ru-index.htm?page_nomber=${i}"><c:out
																				value="${i}" /></a></li>
																</c:when>
																<c:otherwise>
																	<li><a href="ru-index.htm?page_nomber=${i}"><c:out
																				value="${i}" /></a></li>
																</c:otherwise>
															</c:choose>

														</c:forEach>

														<!--                                <li class="current" ><a href="index.htm?page=1">1</a></li>
                                <li><a href="index.htm?page=2">2</a></li>
                                <li><a href="index.htm?page=3">3</a></li>
                                <li><a href="index.htm?page=4">4</a></li>
                                <li><a href="index.htm?page=5">5</a></li>-->
														<!--<li><a href="#">next</a></li>-->
													</ul>
												</div>

												<div class="col-xs-12 col-sm-6">
													<div class="result-counter">
														<!--Показано <span> ${kol_vo_on_page*page_nomber-kol_vo_on_page+1} - ${kol_vo_on_page*page_nomber} </span> из <span>${kol_vo_prod}</span> найденых.-->
													</div>
												</div>

											</div>
											<!--/.row-->
										</div>
										<!-- /.pagination-holder -->
									</div>
									<!-- /.products-grid #grid-view -->

									<div id="list-view" class="products-grid fade tab-pane ">
										<div class="products-list">




											<c:forEach items="${listMachine}" var="machine">


												<div class="product-item product-item-holder">
													<div class="ribbon red">
														<span>sale</span>
													</div>
													<div class="ribbon blue">
														<span>new!</span>
													</div>
													<div class="row">
														<div class="no-margin col-xs-12 col-sm-4 image-holder">
															<div class="image">
																<img alt=""
																	src="<c:url value="${machine.photo[3].path}"/>"
																	width="246" height="186" />
															</div>
														</div>
														<!-- /.image-holder -->
														<div class="no-margin col-xs-12 col-sm-5 body-holder">
															<div class="body">
																<div class="label-discount green">-10% sale</div>
																<div class="title">
																	<a href="machine-${machine.id}.htm">${machine.manufacturer}
																		${machine.product_id}</a>
																</div>
																<div class="brand">${machine.year}
																	<br> ${machine.country}
																</div>
																<!--<div class="brand"></div>-->
																<div class="excerpt">
																	<p>${machine.description}</p>
																</div>
																<div class="addto-compare">
																	<a class="btn-add-to-compare"
																		href="add-product-to-compare-list.htm?id=${machine.id}">add
																		to compare list</a>
																</div>
															</div>
														</div>
														<div class="no-margin col-xs-12 col-sm-3 price-area">
															<div class="right-clmn">
																<!--                                    <div class="price-current">$1199.00</div>
                                    <div class="price-prev">$1399.00</div>-->
																<div class="availability">
																	<label>availability:</label><span class="available">
																		in stock</span>
																</div>
																<a class="le-button"
																	href="add-product-to-customer-basket.htm?id=${machine.id}">add
																	to cart</a> <a class="btn-add-to-wishlist"
																	href="add-product-to-wish-list.htm?id=${machine.id}">add
																	to wishlist</a>
															</div>
														</div>
													</div>
												</div>

											</c:forEach>


										</div>
										<!-- /.products-list -->



									</div>
									<!-- /.products-grid #list-view -->

								</div>
								<!-- /.tab-content -->
							</div>
							<!-- /.grid-list-products -->

						</section>
						<!-- /#gaming -->
					</div>
					<!-- /.col -->
					<!-- ========================================= CONTENT : END ========================================= -->
				</div>
				<!-- /.container -->

			</section>
			<!-- /#category-grid -->
			<!-- ============================================================= FOOTER ============================================================= -->
	<!--f-->
	<%@include file="in_machine/footer.jsp"%>
	<!-- ============================================================= FOOTER : END ============================================================= -->
		</div>
		<!-- /.wrapper -->

		<!-- JavaScripts placed at the end of the document so the pages load faster -->
		<script src="resources/assets/js/jquery-1.10.2.min.js"></script>
		<script src="resources/assets/js/jquery-migrate-1.2.1.js"></script>
		<script src="resources/assets/js/bootstrap.min.js"></script>
		<!-- <script
			src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script> -->
		<script src="resources/assets/js/gmap3.min.js"></script>
		<script src="resources/assets/js/bootstrap-hover-dropdown.min.js"></script>
		<script src="resources/assets/js/owl.carousel.min.js"></script>
		<script src="resources/assets/js/css_browser_selector.min.js"></script>
		<script src="resources/assets/js/echo.min.js"></script>
		<script src="resources/assets/js/jquery.easing-1.3.min.js"></script>
		<script src="resources/assets/js/bootstrap-slider.min.js"></script>
		<script src="resources/assets/js/jquery.raty.min.js"></script>
		<script src="resources/assets/js/jquery.prettyPhoto.min.js"></script>
		<script src="resources/assets/js/jquery.customSelect.min.js"></script>
		<script src="resources/assets/js/wow.min.js"></script>
		<script src="resources/assets/js/scripts.js"></script>

		<!-- For demo purposes â can be removed on production -->

		<script src="resources/assets/switchstylesheet/switchstylesheet.js"></script>

		<script>
        $(document).ready(function(){ 
            $(".changecolor").switchstylesheet( { seperator:"color"} );
            $('.show-theme-options').click(function(){
                $(this).parent().toggleClass('open');
                return false;
            });
        });

        $(window).bind("load", function() {
           $('.show-theme-options').delay(2000).trigger('click');
        });
    </script>
		<!-- For demo purposes â can be removed on production : End -->

	<!-- 	<script src="http://w.sharethis.com/button/buttons.js"></script> -->
</body>
</html>