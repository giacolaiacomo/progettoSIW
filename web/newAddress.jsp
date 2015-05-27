<%--
  Created by IntelliJ IDEA.
  User: Gianluca
  Date: 26/05/15
  Time: 10:17
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
  <jsp:include page="header.jsp" />

  <div class="container">
    <div class="row">
      <h2>Registration new address</h2>
    </div>
    <fieldset>
      <form class="form-signin text-center">
        <h:form>
          <div class="form-group">Street: <h:inputText styleClass="form-control" value="#{customerController.street}"
                                                       required="true"
                                                       requiredMessage="Street is mandatory"
                                                       id="street"/><h:message for="street" styleClass="alert-danger"/>
          </div>
          <div class="form-group">City: <h:inputText styleClass="form-control" value="#{customerController.city}"
                                                     required="true"
                                                     requiredMessage="City is mandatory"
                                                     id="city"/><h:message for="city" styleClass="alert-danger"/>
          </div>
          <div class="form-group">State: <h:inputText styleClass="form-control" value="#{customerController.state}"
                                                      required="true"
                                                      requiredMessage="State is mandatory"
                                                      id="state"/><h:message for="state" styleClass="alert-danger"/>
          </div>
          <div class="form-group">ZIP code: <h:inputText styleClass="form-control" value="#{customerController.zipcode}"
                                                         required="true"
                                                         requiredMessage="ZIP code is mandatory"
                                                         id="zip"/><h:message for="zip" styleClass="alert-danger"/>
          </div>
          <div>
            <h:commandButton value="Submit" action="#{customerController.createAddress}"  styleClass="btn btn-primary"/>
          </div>
        </h:form>
      </form>
    </fieldset>
  </div>
</f:view>
</body>
</html>