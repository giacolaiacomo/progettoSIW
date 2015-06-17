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

  <title>Registration Complete</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp" />
      <div align="center">
        <h1>Registration Complete!</h1>
        <a href="loginCustomer.jsp" class="btn btn-default" role="button">LogIn</a>
      </div>
</f:view>
</body>
</html>