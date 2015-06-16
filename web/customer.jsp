<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">

  <!-- Bootstrap Core CSS -->
  <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="/bootstrap/css/business-frontpage.css" rel="stylesheet">
  <link href="/bootstrap/css/msc.css" rel="stylesheet">

  <title>Customer</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp" />
  <c:choose></c:choose>
  <div align="center">
    <h1>${customerController.customer.firstname} ${customerController.customer.lastname}</h1>
    <h2>Customer's Info</h2>
    <div>Date of birth: ${customerController.customer.birthDate}</div>
    <div>Email: ${customerController.customer.email}</div>
    <div>Phone Number: ${customerController.customer.phonenumber}</div>
    <h3>Address:</h3>
    <div>Street: ${customerController.customer.address.street}</div>
    <div>City: ${customerController.customer.address.city}</div>
    <div>State: ${customerController.customer.address.state}</div>
    <div>ZipCode: ${customerController.customer.address.zipcode}</div>
  </div>
  <div align="right">
    Registration Date:
    <h:outputText
            value="#{customerController.customer.registrationDate.time}">
      <f:convertDateTime dateStyle="medium" locale="it_IT" type="both"
                         timeZone="Europe/Rome" />
    </h:outputText>
  </div>
</f:view>
</body>
</html>