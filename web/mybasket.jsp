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
  <title>My Basket</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp" />
  <h:form>
    <div align="center">
      <h1>My Basket</h1>
      <h3>Current order: </h3>${orderController.order.id}
      <div>Creation time: <h:outputText value="#{orderController.order.creationtime.time}">
                          <f:convertDateTime dateStyle="medium" locale="it_IT" type="both" timeZone="Europe/Rome" />
                        </h:outputText>
      </div>
    </div>
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
          <td>${ordl.product.quantity}</td>
          <td>${ordl.product.description}</td>
          <td>
            <h:commandButton styleClass="btn btn-default" value="Remove" action="#{orderController.deleteOrderLine}">
              <f:setPropertyActionListener value="#{ordl.id}" target="#{orderController.ordlId}"/>
            </h:commandButton>
          </td>
        </tr>
      </c:forEach>
    </table>
  </h:form>
</f:view>
</body>
</html>