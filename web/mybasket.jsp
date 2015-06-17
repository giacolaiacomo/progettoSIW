<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <c:choose>
        <c:when test="${orderController.order!=null}">
          <h3>Current order: ${orderController.order.id}</h3>
          <div>Creation time:
            <h:outputText value="#{orderController.order.creationtime.time}">
              <f:convertDateTime dateStyle="medium" locale="it_IT" type="both" timeZone="Europe/Rome" />
            </h:outputText>
          </div>
          <hr>
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
                <h:commandButton styleClass="btn btn-danger" value="Remove" action="#{orderController.deleteOrderLine(ordl)}">
                  <f:setPropertyActionListener value="#{ordl.orders_id}" target="#{orderController.order}"/>
                </h:commandButton>
                </td>
              </tr>
            </c:forEach>
          </table>
          <hr>
          <div align="center">
            <h:commandButton styleClass="btn btn-primary" value="Close Order" onclick="return confirm('Are you sure?')" action="#{orderController.setClosedOrder}"/>
            <h:commandButton styleClass="btn btn-danger" value="Clean Basket" onclick="return confirm('Are you sure?')" action="#{orderController.deleteOrder}"/>
          </div>
        </c:when>
        <c:when test="${orderController.order==null || orderController.order.orderLines.size()==0}">
          <div align="center">
            <h2> Your Basket is empty</h2>
            <h3> Hurry up to fill it! </h3>
            <br>
            <h:commandButton styleClass="btn btn-default" value="Product List" action="#{productController.listProducts}"/>
          </div>
        </c:when>
      </c:choose>
    </div>
  </h:form>
</f:view>
</body>
</html>