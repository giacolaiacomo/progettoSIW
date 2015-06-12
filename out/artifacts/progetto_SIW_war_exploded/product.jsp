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

    <title>Product</title>
</head>
<body>
<f:view>
    <jsp:include page="header.jsp" />
    <h:form>
        <div align="center">
            <h1>${productController.product.name}</h1>
            <div>Code: ${productController.product.code}</div>
            <div>Price: ${productController.product.price}</div>
            <div>Quantity: ${productController.product.quantity}</div>
            <div>Description: ${productController.product.description}</div>
        </div>
        <c:if test="${customerController.customer!=null}">
            <div align="center">
                <h:commandButton styleClass="btn btn-default" value="Add to basket" action="#{orderController.addOrderLine}">
                    <f:setPropertyActionListener value="#{productController.product}" target="#{orderController.product}"/>
                </h:commandButton>
            </div>
        </c:if>
    </h:form>
</f:view>
</body>
</html>