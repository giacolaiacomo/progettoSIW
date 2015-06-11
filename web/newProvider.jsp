<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
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

  <title>New Provider &middot; SC Company</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp" />

  <div class="container">
    <div class="row">
      <h2>Registration new provider</h2>
    </div>
    <fieldset>
      <form class="form-signin ">
        <h:form>
          <div class="form-group">Name: <h:inputText styleClass="form-control" value="#{providerController.name}"
                                                           required="true"
                                                           requiredMessage="Name is mandatory"
                                                           id="name"/><h:message for="name" styleClass="alert-danger"/>
          </div>
          <div class="form-group">Email: <h:inputText styleClass="form-control" value="#{providerController.email}"
                                                          required="true"
                                                          requiredMessage="Email is mandatory"
                                                          id="email"/><h:message for="email" styleClass="alert-danger"/>
          </div>
          <div class="form-group">Phone Number: <h:inputText styleClass="form-control" value="#{providerController.phonenumber}"
                                                             required="true"
                                                             requiredMessage="Phone Number is mandatory"
                                                             id="phonenumber"/><h:message for="phonenumber" styleClass="alert-danger"/>
          </div>
          <div class="form-group">Vatin: <h:inputText styleClass="form-control" value="#{providerController.vatin}"
                                                         required="true"
                                                         requiredMessage="Vatin is mandatory"
                                                         id="vatin"/><h:message for="vatin" styleClass="alert-danger"/>
          </div>
          <div>
            <h3><h:outputText value="Insert address"/></h3>
          </div>
          <div class="form-group">Street: <h:inputText styleClass="form-control" value="#{providerController.street}"
                                                       required="true"
                                                       requiredMessage="Street is mandatory"
                                                       id="street"/><h:message for="street" styleClass="alert-danger"/>
          </div>
          <div class="form-group">City: <h:inputText styleClass="form-control" value="#{providerController.city}"
                                                     required="true"
                                                     requiredMessage="City is mandatory"
                                                     id="city"/><h:message for="city" styleClass="alert-danger"/>
          </div>
          <div class="form-group">State: <h:inputText styleClass="form-control" value="#{providerController.state}"
                                                      required="true"
                                                      requiredMessage="State is mandatory"
                                                      id="state"/><h:message for="state" styleClass="alert-danger"/>
          </div>
          <div class="form-group">ZIP code: <h:inputText styleClass="form-control" value="#{providerController.zipcode}"
                                                         required="true"
                                                         requiredMessage="ZIP code is mandatory"
                                                         id="zip"/><h:message for="zip" styleClass="alert-danger"/>
          </div>
          <div>
            <h:commandButton value="Submit" action="#{providerController.createProvider}"  styleClass="btn btn-primary"/>
          </div>
        </h:form>
      </form>
    </fieldset>
  </div>
</f:view>
</body>
</html>