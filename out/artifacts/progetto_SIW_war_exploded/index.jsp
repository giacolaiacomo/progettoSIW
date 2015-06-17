<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">

	<!-- Bootstrap Core CSS -->
	<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="/bootstrap/css/business-frontpage.css" rel="stylesheet">
	<link href="/bootstrap/css/msc.css" rel="stylesheet">
	<link href="css/full-width-pics.css" rel="stylesheet">

	<title>SIWProject</title>

</head>
<body>
<f:view>
	<jsp:include page="header.jsp" />
	<h:form>

		<header class="business-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
					</div>
				</div>
			</div>
		</header>

		<!-- Content Section -->
		<section>

				<hr>

				<! --- Second row -->
				<div class="row">
					<c:if test="${customerController.customer==null && administratorController.administrator==null}">
					<div class="col-sm-6 col-md-4" align="center">
						<div class="thumbnail">
							<img src="bootstrap/css/joinus.jpg" width="200" height="242">
							<div class="caption">
								<h3>Enjoy our community!</h3>
								<p>Registered or logged in to be able to buy the best products on the market!</p>
								<a href="newCustomer.jsp" class="btn btn-primary" role="button">Sign Up</a> <a href="loginCustomer.jsp" class="btn btn-default" role="button">LogIn</a>
							</div>
						</div>
					</div>
					</c:if>
					<div class="col-sm-6 col-md-4" align="center">
						<div class="thumbnail">
							<img src="bootstrap/css/product.jpg" width="200" height="242">
							<div class="caption">
								<h3>Please see our product catalog</h3>
								<p>Click the button below to access the list of our products available for you!</p>
								<p><h:commandButton styleClass="btn-primary btn" value="Products List" action="#{productController.listProducts}"/> </p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4" align="center">
						<div class="thumbnail">
							<img src="bootstrap/css/provider.jpg" width="200" height="242">
							<div class="caption">
								<h3>Our Providers</h3>
								<p>We offer only the best providers available in the market!</p>
								<p><h:commandButton styleClass="btn btn-primary" value="Providers List" action="#{providerController.listProviders}"/> </p>
							</div>
						</div>
					</div>
					<c:if test="${customerController.customer!=null}">
					<div class="col-sm-6 col-md-4" align="center">
						<div class="thumbnail">
							<img src="bootstrap/css/joinus.jpg" width="200" height="242">
							<div class="caption">
								<h3>Enjoy our community!</h3>
								<p>Registered or logged in to be able to buy the best products on the market!</p>
								<a href="newCustomer.jsp" class="btn btn-primary" role="button">Sign Up</a> <a href="loginCustomer.jsp" class="btn btn-default" role="button">LogIn</a>
							</div>
						</div>
					</div>
					</c:if>
				</div>

			</div>

		</section>



		<!-- Footer -->
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<p>Copyright &copy; SC 2015</p>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</footer>

		<!-- jQuery -->
		<script src="js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>
	</h:form>
</f:view>
</body>

</html>

