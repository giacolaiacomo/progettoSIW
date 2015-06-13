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

    <title>New Product &middot; SC Company</title>
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
                    <div class="form-group">Quantity: <h:inputText styleClass="form-control" value="#{productController.quantity}"
                                                                   required="true"
                                                                   requiredMessage="Quantity is mandatory"
                                                                   converterMessage="Quantity must be a number"
                                                                   id="quantity"/> <h:message for="quantity" styleClass="alert-danger"/>
                    </div>
                    <div class="form-group">Description: <h:inputTextarea styleClass="form-control" value="#{productController.description}"
                                                                          required="false"
                                                                          cols="20"
                                                                          rows="5" />
                    </div>
                    <div class="form-group">Provider: <h:inputText styleClass="form-control" value="#{productController.providername}"
                                                                   required="true"
                                                                   requiredMessage="Provider is mandatory"
                                                                   id="providername"/> <h:message for="providername" styleClass="alert-danger"/>
                    </div>
                    <div class="form-group">
                        <h:commandButton value="Submit"  action="#{productController.createProduct}" styleClass="btn btn-primary"/>
                    </div>
                </h:form>
            </form>
        </fieldset>
    </div>
</f:view>
</body>
</html>