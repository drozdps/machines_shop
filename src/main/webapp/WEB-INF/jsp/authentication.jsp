<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: Dimka
  Date: 06.05.2016
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<c:import url="fragments/head.jsp" />
<body>

	<div class="wrapper">


		<!-- ============================================================= TOP NAVIGATION ============================================================= -->
		<c:import url="fragments/top-navigation.jsp" />
		<!-- ============================================================= TOP NAVIGATION : END ============================================================= -->


		<!-- ============================================================= HEADER ============================================================= -->
		<header class="no-padding-bottom header-alt">
			<div class="container no-padding">

				<div class="col-xs-12 col-md-3 logo-holder">
					<!-- ============================================================= LOGO ============================================================= -->
					<c:import url="fragments/logo.jsp" />
					<!-- ============================================================= LOGO : END ============================================================= -->
				</div>
				<!-- /.logo-holder -->

				<div class="col-xs-12 col-md-6 top-search-holder no-margin">
					<div class="contact-row">
						<div class="phone inline">
							<i class="fa fa-phone"></i> (+800) 123 456 7890
						</div>
						<div class="contact inline">
							<i class="fa fa-envelope"></i> contact@<span class="le-color">oursupport.com</span>
						</div>
					</div>
					<!-- /.contact-row -->
					<!-- ============================================================= SEARCH AREA ============================================================= -->
					<c:import url="fragments/search-area.jsp" />
					<!-- ============================================================= SEARCH AREA : END ============================================================= -->
				</div>
				<!-- /.top-search-holder -->

				<!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->
				<c:import url="fragments/shopping-cart-dropdown.jsp" />
				<!-- ============================================================= SHOPPING CART DROPDOWN : END ============================================================= -->


			</div>
			<!-- /.container -->
			<div class="animate-dropdown">
				<!-- ========================================= BREADCRUMB ========================================= -->
				<div id="breadcrumb-alt">
					<div class="container">
						<div class="breadcrumb-nav-holder minimal">
							<ul>
								<li class="dropdown breadcrumb-item"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"> Media
										Center </a>
									<ul class="dropdown-menu">
										<li><a href="#">Computer Cases &amp; Accessories</a></li>
										<li><a href="#">CPUs, Processors</a></li>
										<li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
										<li><a href="#">Graphics, Video Cards</a></li>
										<li><a href="#">Interface, Add-On Cards</a></li>
										<li><a href="#">Laptop Replacement Parts</a></li>
										<li><a href="#">Memory (RAM)</a></li>
										<li><a href="#">Motherboards</a></li>
										<li><a href="#">Motherboard &amp; CPU Combos</a></li>
										<li><a href="#">Motherboard Components</a></li>
									</ul></li>
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item current"><a href="#">Authentication</a>
								</li>
							</ul>
						</div>
						<!-- /.breadcrumb-nav-holder -->
					</div>
					<!-- /.container -->
				</div>
				<!-- /#breadcrumb-alt -->
				<!-- ========================================= BREADCRUMB : END ========================================= -->
			</div>
		</header>
		<!-- ============================================================= HEADER : END ============================================================= -->

		<!-- ========================================= MAIN ========================================= -->
		<main id="authentication" class="inner-bottom-md">
		<div class="container">
			<div class="row">

				<div class="col-md-6">
					<section class="section sign-in inner-right-xs">
						<h2 class="bordered">Sign In</h2>
						<p>Hello, Welcome to your account</p>

						<div class="social-auth-buttons">
							<div class="row">
								<div class="col-md-6">
									<button class="btn-block btn-lg btn btn-facebook">
										<i class="fa fa-facebook"></i> Sign In with Facebook
									</button>
								</div>
								<div class="col-md-6">
									<button class="btn-block btn-lg btn btn-twitter">
										<i class="fa fa-twitter"></i> Sign In with Twitter
									</button>
								</div>
							</div>
						</div>

						<form role="form" class="login-form cf-style-1">
							<div class="field-row">
								<label>Email</label> <input type="text" class="le-input">
							</div>
							<!-- /.field-row -->

							<div class="field-row">
								<label>Password</label> <input type="text" class="le-input">
							</div>
							<!-- /.field-row -->

							<div class="field-row clearfix">
								<span class="pull-left"> <label class="content-color"><input
										type="checkbox" class="le-checbox auto-width inline">
										<span class="bold">Remember me</span></label>
								</span> <span class="pull-right"> <a href="#"
									class="content-color bold">Forgotten Password ?</a>
								</span>
							</div>

							<div class="buttons-holder">
								<button type="submit" class="le-button huge">Secure
									Sign In</button>
							</div>
							<!-- /.buttons-holder -->
						</form>
						<!-- /.cf-style-1 -->

					</section>
					<!-- /.sign-in -->
				</div>
				<!-- /.col -->

				<div class="col-md-6">
					<section class="section register inner-left-xs">
						<h2 class="bordered">Create New Account</h2>
						<p>Create your own Media Center account</p>

						<form role="form" class="register-form cf-style-1">
							<div class="field-row">
								<label>Email</label> <input type="text" class="le-input">
							</div>
							<!-- /.field-row -->

							<div class="buttons-holder">
								<button type="submit" class="le-button huge">Sign Up</button>
							</div>
							<!-- /.buttons-holder -->
						</form>

						<h2 class="semi-bold">Sign up today and you'll be able to :</h2>

						<ul class="list-unstyled list-benefits">
							<li><i class="fa fa-check primary-color"></i> Speed your way
								through the checkout</li>
							<li><i class="fa fa-check primary-color"></i> Track your
								orders easily</li>
							<li><i class="fa fa-check primary-color"></i> Keep a record
								of all your purchases</li>
						</ul>

					</section>
					<!-- /.register -->

				</div>
				<!-- /.col -->

			</div>
			<!-- /.row -->
		</div>
		<!-- /.container --> </main>
		<!-- /.authentication -->
		<!-- ========================================= MAIN : END ========================================= -->
		<!-- ============================================================= FOOTER ============================================================= -->
		<c:import url="fragments/footer.jsp" />
		<!-- ============================================================= FOOTER : END ============================================================= -->
	</div>
	<!-- /.wrapper -->
	<c:import url="fragments/scripts.jsp" />
</body>
</html>
