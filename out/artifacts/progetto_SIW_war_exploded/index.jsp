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

	<title>SIWProject</title>

</head>
<body>
<f:view>
	<jsp:include page="header.jsp" />

	<header class="business-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<hr>

		<div class="row">
			<div class="col-sm-8">
				<h2>What We Do</h2>
				<p>Introduce the visitor to the business using clear, informative text. Use well-targeted keywords within your sentences to make sure search engines can find the business.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et molestiae similique eligendi reiciendis sunt distinctio odit? Quia, neque, ipsa, adipisci quisquam ullam deserunt accusantium illo iste exercitationem nemo voluptates asperiores.</p>
				<p>
                <div class="container">
                    <a href="#" class="button">Login</a><a href="#" class="button button-blue">Sign Up</a>
                </div>
				</p>
			</div>
			<div class="col-sm-4">
				<h2>Contact Us</h2>
				<address>
					<strong>MSC</strong>
					<br>Roma 3 University
					<br>Via della Vasca Navale 79/81, Rome
					<br>
				</address>
				<address>
					<abbr title="Maniscalchi">M: </abbr>Alessandro Maniscalchi
					<br>
					<abbr title="Sola">S: </abbr>Fabio Sola
					<br>
					<abbr title="Colaiacomo">C: </abbr>Gianluca Colaiacomo
				</address>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<div class="row">
			<div class="col-sm-4">
				<img class="img-circle img-responsive img-center" src="bootstrap/css/ListaProdotti.png" alt="">
				<h2>Visualizza i nostri prodotti</h2>
				<p>bla bla bla bla bla</p>
				<h:form>
					<h:commandLink action="#{productController.listProducts}" value="Lista prodotti" styleClass="btn btn-default btn-sm"/>
				</h:form>
			</div>
			<div class="col-sm-4">
				<img class="img-circle img-responsive img-center" src="http://placehold.it/300x300" alt="">
				<h2>Marketing Box #2</h2>
				<p>The images are set to be circular and responsive. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
			</div>
			<div class="col-sm-4">
				<img class="img-circle img-responsive img-center" src="http://placehold.it/300x300" alt="">
				<h2>Marketing Box #3</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; MSC Company 2015</p>
				</div>
			</div>
			<!-- /.row -->
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</f:view>
</body>
</html>

