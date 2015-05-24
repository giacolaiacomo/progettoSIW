<%--
  Created by IntelliJ IDEA.
  User: Gianluca
  Date: 24/05/15
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
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
  <link href="/bootstrap/css/msc.css" rel="stylesheet">

  <title>Register a new user</title>
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
            <a href='<c:url value="faces/newUser.jsp"/>'>New Product</a>
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
      <h2>Insert a new product</h2>
    </div>
    <fieldset>
      <form class="form-signin text-center">

        <h:form>
          <div class="form-group">Name: <h:inputText styleClass="form-control" value="#{productController.name}"
                                                     required="true"
                                                     requiredMessage="Name is mandatory"
                                                     id="name"/><h:message for="name" styleClass="alert-danger"/>
          </div>
          <div class="form-group">Code: <h:inputText styleClass="form-control" value="#{productController.code}"
                                                     required="true"
                                                     requiredMessage="Code is mandatory"
                                                     id="code"/> <h:message for="code" styleClass="alert-danger"/>
          </div>
          <div class="form-group">Price: <h:inputText styleClass="form-control" value="#{productController.price}"
                                                      required="true"
                                                      requiredMessage="Price is mandatory"
                                                      converterMessage="Price must be a number"
                                                      id="price"/> <h:message for="price" styleClass="alert-danger"/>
          </div>
          <div class="form-group">Description: <h:inputTextarea styleClass="form-control" value="#{productController.description}"
                                                                required="false"
                                                                cols="20"
                                                                rows="5" />

          </div>
          <div class="form-group">
            <h:commandButton value="Submit"  action="#{productController.createProduct}" styleClass="btn btn-primary"/>
            <h:commandButton value="List all"  action="#{productController.listProducts}" styleClass="btn btn-primary"/>
          </div>
        </h:form>
      </form>
    </fieldset>

  </div>
</f:view>
</body>
</html>