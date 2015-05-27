
<%--
  Created by IntelliJ IDEA.
  User: Gianluca
  Date: 27/05/15
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
  <link href="/bootstrap/css/business-frontpage.css" rel="stylesheet">
  <link rel="stylesheet" href="bootstrap/css/msc.css"/>
  <title>Addresses</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp"/>

  <div class="container form-signin">
    <h1>Products List</h1>
    <h:form>
      <table>
        <tr>
          <th>Name</th><th>Code</th><th>Price</th><th>Quantity</th><th>Description</th>
        </tr>
        <c:forEach var="product" items="#{customerController.addresses}">
          <tr>
            <td>
              <h:commandLink action="#{productController.findProduct}" value="#{product.name}">
                <f:param name="id" value="#{product.id}" />
              </h:commandLink>
            </td>
            <td>${product.code}</td>
            <td>${product.price}</td>
            <td>${product.quantity}</td>
            <td>${product.description}</td>
          </tr>
        </c:forEach>
      </table>
    </h:form>
  </div>
</f:view>
</body>
</html>
