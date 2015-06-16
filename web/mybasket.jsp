<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Gianluca
  Date: 10/06/15
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
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
  <title>My Basket</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp" />
  <h:form>
    <div class="container form-signin">
      <h1>My Basket</h1>
      <h3>Current order: ${orderController.order.id}</h3>
      <div>Creation time:
        <h:outputText value="#{orderController.order.creationtime.time}">
          <f:convertDateTime dateStyle="medium" locale="it_IT" type="both" timeZone="Europe/Rome" />
        </h:outputText>
      </div>
      <hr>
      <c:choose>
        <c:when test="${orderController.order.orderLines.size() != 0}">
          <table>
            <tr>
              <th>Name</th><th>Code</th><th>Price</th><th>Quantity</th><th>Description</th>
            </tr>
            <c:forEach var="ordl" items="#{orderController.order.orderLines}">
              <tr>
                <td>
                  <h:commandLink action="#{productController.findProductByName(ordl.product.name)}" value="#{ordl.product.name}">
                    <f:param name="id" value="#{ordl.product.id}" />
                  </h:commandLink>
                </td>
                <td>${ordl.product.code}</td>
                <td>${ordl.product.price}</td>
                <td>${ordl.quantity}</td>
                <td>${ordl.product.description}</td>
                <td>
                  <h:commandButton styleClass="btn btn-danger" value="Remove" action="#{orderController.deleteOrderLine}">
                    <f:setPropertyActionListener value="#{ordl.id}" target="#{orderController.ordlId}"/>
                  </h:commandButton>
                </td>
              </tr>
            </c:forEach>
          </table>
          <hr>
          <div align="center">
            <h:commandButton styleClass="btn btn-primary" value="Close Order" action="#"/>
          </div>
        </c:when>
        <c:when test="${orderController.order.orderLines.size() == 0}">
          <div align="center">
            <h1> Your Basket is empty</h1>
            <h2> Hurry up to fill it! </h2>
          </div>
        </c:when>
      </c:choose>
    </div>
  </h:form>
</f:view>
</body>
</html>