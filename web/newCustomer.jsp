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
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="row">
            <h2>Registration new customer</h2>
        </div>
        <fieldset>
            <form class="form-signin ">
                <h:form>
                    <div class="form-group">First Name: <h:inputText styleClass="form-control" value="#{customerController.firstname}"
                                                                     required="true"
                                                                     requiredMessage="FirstName is mandatory"
                                                                     id="firstname"/><h:message for="firstname" styleClass="alert-danger"/>
                    </div>
                    <div class="form-group">Last Name: <h:inputText styleClass="form-control" value="#{customerController.lastname}"
                                                                    required="true"
                                                                    requiredMessage="LastName is mandatory"
                                                                    id="lastname"/><h:message for="lastname" styleClass="alert-danger"/>
                    </div>
                    <div class="form-group">Date of Birth: <h:inputText styleClass="form-control" value="#{customerController.birthDate}"
                                                                        required="true"
                                                                        requiredMessage="Date is mandatory"
                                                                        id="birthDate"
                                                                        converter="javax.faces.DateTime"/>
                        <h:message for="birthDate" styleClass="alert-danger"/>
                    </div>
                    <div class="form-group">Phone Number: <h:inputText styleClass="form-control" value="#{customerController.phonenumber}"
                                                                       required="true"
                                                                       requiredMessage="LastName is mandatory"
                                                                       id="phonenumber"/><h:message for="phonenumber" styleClass="alert-danger"/>
                    </div>
                    <div class="form-group">Email: <h:inputText styleClass="form-control" value="#{customerController.email}"
                                                                required="true"
                                                                requiredMessage="Email is mandatory"
                                                                id="email"/><h:message for="email" styleClass="alert-danger"/>
                    </div>
                    <div class="form-group">Password: <h:inputSecret styleClass="form-control" value="#{customerController.password}"
                                                                     required="true"
                                                                     requiredMessage="Password is mandatory"
                                                                     id="password"/><h:message for="password" styleClass="alert-danger"/>
                    </div>
                    <div>
                            <h3><h:outputText value="Insert address"/></h3>
                    </div>
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
                        <h:commandButton value="Submit" action="#{customerController.createCustomer}"  styleClass="btn btn-primary"/>
                    </div>
                </h:form>
            </form>
        </fieldset>
    </div>
</f:view>
</body>
</html>