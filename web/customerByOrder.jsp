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
  <div align="center" class="container form-signin">
    <h1>${orderController.customerbyorder.firstname} ${orderController.customerbyorder.lastname}</h1>
    <h2>Customer's Info</h2>
    <div>Date of birth: ${orderController.customerbyorder.birthDate}</div>
    <div>Email: ${orderController.customerbyorder.email}</div>
    <div>Phone Number: ${orderController.customerbyorder.phonenumber}</div>
    <h3>Address:</h3>
    <div>Street: ${orderController.customerbyorder.address.street}</div>
    <div>City: ${orderController.customerbyorder.address.city}</div>
    <div>State: ${orderController.customerbyorder.address.state}</div>
    <div>ZipCode: ${orderController.customerbyorder.address.zipcode}</div>
  </div>
  <div align="right">
    Registration Date:
    <h:outputText
            value="#{orderController.customerbyorder.registrationDate.time}">
      <f:convertDateTime dateStyle="medium" locale="it_IT" type="both"
                         timeZone="Europe/Rome" />
    </h:outputText>
  </div>
</f:view>
</body>
</html>