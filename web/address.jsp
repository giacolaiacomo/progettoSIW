<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Gianluca
  Date: 26/05/15
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<f:view>
  <h2>Details</h2>
  <div>Street: ${addressController.address.street}</div>
  <div>City: ${addressController.address.city}</div>
  <div>State: ${addressController.address.state}</div>
  <div>Zip Code: ${addressController.address.zipcode}</div>
</f:view>
</body>
</html>
