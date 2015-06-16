<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- Bootstrap Core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="bootstrap/css/business-frontpage.css" rel="stylesheet">
    <link href="bootstrap/css/msc.css" rel="stylesheet">
</head>
<h:form>
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
                <c:if test="${customerController.customer != null}">
                    <a class="navbar-brand" href="/faces/indexUser.jsp"><strong>Progetto SIW 2015 &middot; SC</strong></a>
                </c:if>
                <c:if test="${administratorController.administrator != null}">
                    <a class="navbar-brand" href="/faces/indexAdmin.jsp"><strong>Progetto SIW 2015 &middot; SC</strong></a>
                </c:if>
                <c:if test="${customerController.customer == null && administratorController.administrator == null}">
                    <a class="navbar-brand" href="/faces/index.jsp"><strong>Progetto SIW 2015 &middot; SC</strong></a>
                </c:if>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">

                    <c:if test="${customerController.customer != null}">
                        <li class ="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" >Control Panel &middot; Hi ${customerController.customer.firstname}!</a>
                            <ul class="dropdown-menu">
                                <li><a href='<c:url value="customer.jsp"/>'>Profile</a></li>
                                <li><h:commandLink action="#{customerController.logoutCustomer}" value="Logout" >
                                </h:commandLink>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <h:commandLink
                                    action="#{orderController.myBasket}"
                                    value="My Basket">
                                <span class="badge">
                                    <c:choose>
                                        <c:when test="${orderController.order.orderLines.size()==null}">
                                            0
                                        </c:when>
                                        <c:when test="${orderController.order.orderLines.size()!=null}">
                                            ${orderController.order.orderLines.size()}
                                        </c:when>
                                    </c:choose>
                                </span>
                            </h:commandLink>
                        </li>
                    </c:if>
                    <c:if test="${administratorController.administrator != null}">
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href='#'>Control Panel &middot; Admin</a>
                            <ul class="dropdown-menu">
                                <li><a href='<c:url value="admin.jsp"/>'>Admin page</a></li>
                                <li><h:commandLink action="#{administratorController.logout}" value="Logout" /></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Create</a>
                            <ul class="dropdown-menu">
                                <li><a href='<c:url value="newProduct.jsp"/>'>New Product</a> </li>
                                <li><a href='<c:url value="newProvider.jsp"/>'>New Provider</a> </li>
                                <li><a href='<c:url value="newCustomer.jsp"/>'>New Customer</a> </li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Lists</a>
                            <ul class="dropdown-menu">
                                <li><h:commandLink action="#{providerController.listProviders}" value="Providers List" /></li>
                                <li><h:commandLink action="#{customerController.listCustomers}" value="Customers List" /></li>
                                <li><h:commandLink action="#{productController.listProducts}" value="Products List" /></li>
                            </ul>
                        </li>
                                <li><h:commandLink action="#{administratorController.allClosedOrders}" value="Orders"/></li>

                    </c:if>
                </ul>
                <c:if test="${customerController.customer!=null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="navbar-form navbar-right" role="search">
                            <div class="input-group">
                                <h:inputText styleClass="form-control" value="#{productController.name}" id="name"/>
                            <span class="input-group-btn">
                            <h:commandButton styleClass="btn btn-default " value="Search Product!" action="#{productController.findProductByName(productController.name)}"/>
                            </span>
                            </div>
                        </li>
                    </ul>
                </c:if>
                <c:if test="${customerController.customer==null && administratorController.administrator == null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="navbar-form navbar-right" role="search">
                            <div class="row">
                                <div class="col-lg-5"> <h:inputText styleClass="form-control " value="#{customerController.email}" id="email"/></div>
                                <div class="col-lg-5"> <h:inputSecret styleClass="form-control " value="#{customerController.password}" id="password"/></div>
                                <div class="col-lg-2"> <h:commandButton styleClass="btn btn-default " value="Login" action="#{customerController.login}"/></div>
                            </div>
                        </li>
                    </ul>
                </c:if>
            </div>  <!-- /.navbar-collapse -->
            <!-- /.container -->
        </div>
    </nav>
</h:form>

<!-- include javascript, jQuery FIRST -->
<script
        src="bootstrap/js/jquery.js"></script>
<script
        src="bootstrap/js/bootstrap.min.js"></script>
</html>
