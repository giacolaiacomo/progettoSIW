<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
    <!-- Bootstrap Core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/bootstrap/css/business-frontpage.css" rel="stylesheet">

    <title>New Product</title>
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
                        <a href='<c:url value="faces/newProduct.jsp"/>'>New Product</a>
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

    <div class="container">
        <div class="row">
            <fieldset>
            <form>
                <h:form>
                    <div>Name: <h:inputText value="#{productController.name}"
                                            required="true"
                                            requiredMessage="Name is mandatory"
                                            id="name"/> <h:message for="name" styleClass="alert-danger"/>
                    </div>
                    <div>Code: <h:inputText value="#{productController.code}"
                                            required="true"
                                            requiredMessage="Code is mandatory"
                                            id="code"/> <h:message for="code" styleClass="alert-danger"/>
                    </div>
                    <div>Price: <h:inputText value="#{productController.price}"
                                             required="true"
                                             requiredMessage="Price is mandatory"
                                             converterMessage="Price must be a number"
                                             id="price"/> <h:message for="price" styleClass="alert-danger"/>
                    </div>
                    <div>Description: <h:inputTextarea value="#{productController.description}"
                                                       required="false"
                                                       cols="20"
                                                       rows="5" />

                    </div>
                    <div>
                        <h:commandButton value="Submit"  action="#{productController.createProduct}" styleClass="btn btn-primary"/>
                        <h:commandButton value="List all"  action="#{productController.listProducts}" styleClass="btn btn-primary"/>
                    </div>
            </form>
            </fieldset>
            </h:form>
        </div>
    </div>
</f:view>
</body>
</html>