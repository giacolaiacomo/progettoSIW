<%--
  Created by IntelliJ IDEA.
  User: Gianluca
  Date: 12/06/15
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
  <!-- Bootstrap Core CSS -->
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="bootstrap/css/business-frontpage.css" rel="stylesheet">
  <link href="bootstrap/css/msc.css" rel="stylesheet">

  <title>New Order &middot; SC Company</title>
</head>
<body>
<f:view>
  <h:form>
    <jsp:include page="header.jsp"/>
    <div class=container" align="center">
      <h1>Congratulations, you have just created your order!</h1>
      <h2>Hurry up to find your wanted products!</h2>
      <h:commandButton styleClass="btn-primary btn" value="Products List" action="#{productController.listProducts}"/>
    </div>
  </h:form>
</f:view>
</body>
</html>
