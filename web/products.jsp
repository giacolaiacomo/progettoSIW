<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
	<link href="/bootstrap/css/business-frontpage.css" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap/css/msc.css"/>
	<title>Products</title>
</head>
<body>
<f:view>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="faces/index.jsp">Progetto SIW 2015 - MSC</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li>
						<a href='<c:url value="newProduct.jsp"/>'>New Product</a>
					</li>
					<li>
						<a href="#">Contact</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<div class="container form-signin">
		<h1>Products List</h1>
		<h:form>
			<table>
				<tr>
					<th>Name</th><th>Code</th><th>Price</th><th>Quantity</th><th>Description</th>
				</tr>
				<c:forEach var="product" items="#{productController.products}">
					<tr>
						<td>
							<h:commandLink action="#{productController.findProduct}" value="#{product.name}">
								<f:param name="id" value="#{product.id}" />
							</h:commandLink>
						</td>
						<td>${product.code}</td>
						<td>${product.price}</td>
						<td>${product.quantity}</td>
						<td>${product.description}</td>
					</tr>
				</c:forEach>
			</table>
		</h:form>
	</div>
</f:view>
</body>
</html>