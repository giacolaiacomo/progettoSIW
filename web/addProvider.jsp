<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
  <!-- Bootstrap Core CSS -->
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="bootstrap/css/business-frontpage.css" rel="stylesheet">
  <link href="bootstrap/css/msc.css" rel="stylesheet">

  <title>Add Provider &middot; SC Company</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp" />
  <div class="container">
    <div class="row">
      <h2>Insert a new product</h2>
    </div>
    <fieldset>
      <form class="form-signin">
        <h:form>
          <div class="form-group">Provider: <h:inputText styleClass="form-control" value="#{productController.providername}"
                                                         required="true"
                                                         requiredMessage="Provider is mandatory"
                                                         id="providername"/><h:message for="providername" styleClass="alert-danger"/>
          </div>
          <div class="form-group">
            <h:commandButton value="Submit"  action="#{productController.addProvider}" styleClass="btn btn-primary"/>
          </div>
        </h:form>
      </form>
    </fieldset>
  </div>
</f:view>
</body>
</html>