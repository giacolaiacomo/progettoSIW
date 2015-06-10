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

  <title>Provider</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp" />
  <div align="center">
    <h1>${providerController.provider.name}</h1>
    <h2>Provider's Info</h2>
    <div>Email: ${providerController.provider.email}</div>
    <div>Phone Number: ${providerController.provider.phoneNumber}</div>
    <div>Vatin: ${providerController.provider.vatin}</div>
    <h3>Address:</h3>
    <div>Street: ${providerController.provider.address.street}</div>
    <div>City: ${providerController.provider.address.city}</div>
    <div>State: ${providerController.provider.address.state}</div>
    <div>ZipCode: ${providerController.provider.address.zipcode}</div>
  </div>
</f:view>
</body>
</html>