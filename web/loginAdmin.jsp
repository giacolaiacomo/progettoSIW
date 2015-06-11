<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html>
<html>
<head>
  <title>Sign in Admin &middot; SC Company</title>
  <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
  <!-- Bootstrap Core CSS -->
  <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="/bootstrap/css/business-frontpage.css" rel="stylesheet">
  <link href="/bootstrap/css/msc.css" rel="stylesheet">
</head>

<body>
<f:view>
  <jsp:include page="header.jsp" />
  <div align="center">
    <h:form id="loginAdmin" styleClass="form-horizontal">
      <h:message for="accedi" styleClass="error alert alert-danger" />
      <div>
        <h2>Login Admin</h2>
      </div>
      <div class="form-group">
          <%--@declare id="email"--%><label for="email" class="col-sm-1 control-label col-lg-offset-4">Email</label>
        <div class="col-sm-2">
          <h:inputText value="#{administratorController.email}" required="true"
                       requiredMessage="Email is mandatory!" id="email"
                       styleClass="form-control" />
          <h:message for="email" style="color:red" />
        </div>
      </div>
      <div class="form-group">
          <%--@declare id="password"--%><label for="password" class="col-sm-1 control-label col-lg-offset-4">Password</label>
        <div class="col-sm-2">
          <h:inputSecret value="#{administratorController.password}"
                         required="true" requiredMessage="Password is mandatory!"
                         id="password" styleClass="form-control" />
          <h:message for="password" style="color:red" />
        </div>
      </div>
      <div class="form-group">
        <div class="container">
          <h:commandButton styleClass="button" id="accedi" value="Log in" action="#{administratorController.loginAdministrator}"/>
        </div>
      </div>
    </h:form>
  </div>
</f:view>
</body>
</html>
