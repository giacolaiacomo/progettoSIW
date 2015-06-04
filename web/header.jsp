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
          <a class="navbar-brand" href="/faces/index.jsp">Progetto SIW 2015 - MSC</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <c:if test="${customerController.customer != null}">
                <li>
                    <a href='<c:url value="customer.jsp"/>'>Customer's Page</a>
                </li>
            </c:if>
            <c:if test="${customerController.customer == null}">
                <li>
                    <a href='<c:url value="signin.jsp"/>'>Login</a>
                </li>
                <li>
                    <a href='<c:url value="newCustomer.jsp"/>'>Sign up</a>
                </li>
            </c:if>
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </div>
      <!-- /.container -->
    </nav>
</h:form>
<!-- include javascript, jQuery FIRST -->
<script
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
        src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</html>
