<%--
  Created by IntelliJ IDEA.
  User: Gianluca
  Date: 24/05/15
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
<head>
  <title>Customer</title>
</head>
<body>
<f:view>
  <h1>${customerController.customer.firstname} ${customerController.customer.lastname}</h1>
  <h2>Details</h2>
  <div>DoB: ${customerController.customer.dob}</div>
  <div>Email: ${customerController.customer.email}</div>
  <div>Address: ${customerController.customer.address.toString()}</div>
  <div>Phone Number: ${customerController.customer.phonenumber}</div>
</f:view>
</body>
</html>