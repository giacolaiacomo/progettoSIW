<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- Bootstrap Core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/bootstrap/css/business-frontpage.css" rel="stylesheet">
    <link href="/bootstrap/css/msc.css" rel="stylesheet">
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
                    <a class="navbar-brand" href="/faces/indexUser.jsp">Progetto SIW 2015 - MSC</a>
                </c:if>
                <c:if test="${administratorController.administrator != null}">
                    <a class="navbar-brand" href="/faces/indexAdmin.jsp">Progetto SIW 2015 - MSC</a>
                </c:if>
                <c:if test="${customerController.customer == null && administratorController.administrator == null}">
                    <a class="navbar-brand" href="/faces/index.jsp">Progetto SIW 2015 - MSC</a>
                </c:if>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">

                    <c:if test="${customerController.customer != null}">
                        <li class ="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Control Panel</a>
                            <ul class="dropdown-menu">
                                <li><a href='<c:url value="customer.jsp"/>'>Profile</a></li>
                                <li><h:commandLink
                                        action="#{productController.listProducts}"
                                        value="All Products" /></li>
                                <li><h:commandLink
                                        action="#{customerController.logoutCustomer}"
                                        value="Logout" /></li>
                            </ul>
                        </li>
                        <li>
                            <h:commandLink
                                    action="#{orderController.myBasket}"
                                    value="My Basket" />
                        </li>
                    </c:if>

                    <c:if test="${administratorController.administrator != null}">
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Control Panel</a>
                            <ul class="dropdown-menu">
                                <li><a href='<c:url value="admin.jsp"/>'>Admin page</a></li>
                                <li><h:commandLink
                                        action="#{administratorController.newProduct}"
                                        value="New Product" /></li>
                                <li><h:commandLink
                                        action="#{administratorController.newCustomer}"
                                        value="New Customer" /></li>
                                <li><h:commandLink
                                        action="#{administratorController.newProvider}"
                                        value="New Provider" /></li>

                            </ul>
                        </li>
                        <li><h:commandLink
                                action="#{administratorController.allProviders}"
                                value="All Providers" /></li>
                        <li><h:commandLink
                                action="#{administratorController.logout}"
                                value="Logout" /></li>
                    </c:if>
                    <c:if test="${customerController.customer == null && administratorController.administrator == null}">
                        <li>
                            <a href='<c:url value="loginCustomer.jsp"/>'>Login</a>
                        </li>
                        <li>
                            <a href='<c:url value="newCustomer.jsp"/>'>Sign up</a>
                        </li>
                    </c:if>
                </ul>
                <c:if test="${customerController.customer!=null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="navbar-form navbar-right" role="search">
                            <div class="input-group">
                                <h:inputText styleClass="form-control" value="#{productController.name}" id="name"/>
                            <span class="input-group-btn">
                            <h:commandButton styleClass="btn btn-default" value="Search Product!" action="#{productController.findProductByName}"/>
                            </span>
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
