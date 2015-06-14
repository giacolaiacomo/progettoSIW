<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Gianluca
  Date: 11/06/15
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
  <link href="/bootstrap/css/business-frontpage.css" rel="stylesheet">
  <link rel="stylesheet" href="bootstrap/css/msc.css"/>
  <title>Products</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp"/>

  <div class="container form-signin">
    <h1>Order number: <h:outputText value="#{orderController.order.id}"/></h1>
    <h:form>
      <table>
        <tr>
          <th>Name</th><th>Code</th><th>UnitPrice</th><th>Quantity</th>
        </tr>
        <c:forEach var="ordl" items="#{orderController.order.orderLines}">
          <tr>
            <td>
              <h:commandLink action="#{productController.findProduct}" value="#{ordl.product.name}">
                <f:param name="id" value="#{ordl.product.id}" />
              </h:commandLink>
            </td>
            <td>${ordl.product.code}</td>
            <td>${ordl.unitprice}</td>
            <td>${ordl.quantity}</td>
          </tr>
        </c:forEach>
      </table>
    </h:form>
  </div>
</f:view>
</body>
</html>
