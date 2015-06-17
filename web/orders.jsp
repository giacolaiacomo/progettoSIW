<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
  <link href="/bootstrap/css/business-frontpage.css" rel="stylesheet">
  <link rel="stylesheet" href="bootstrap/css/msc.css"/>
  <title>Closed Orders</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp"/>
  <div class="container form-signin">
    <h1>Orders List</h1>
    <h:form>
      <table>
        <tr>
          <th>Id</th><th>Creation Time</th><th>Closed Time</th><th>Status</th>
        </tr>
        <c:forEach var="order" items="#{customerController.orders}">
          <tr>
            <td>
              <h:commandLink action="#{orderController.findOrderById(order.id)}" value="#{order.id}">
              </h:commandLink>
            </td>
            <td><h:outputText value="#{order.creationtime.time}">
              <f:convertDateTime dateStyle="medium" locale="it_IT" type="both" timeZone="Europe/Rome" />
            </h:outputText></td>
            <td><h:outputText value="#{order.completedTime.time}">
              <f:convertDateTime dateStyle="medium" locale="it_IT" type="both" timeZone="Europe/Rome" />
            </h:outputText></td>
            <td>
              <c:choose>
                <c:when test="${order.processed != true}">
                  <h:outputText value="Drawing"/>
                </c:when>
                <c:when test="${order.processed == true}">
                  <span class="glyphicon glyphicon-ok" aria-hidden="true"><h:outputText value=" Processed"/></span>
                </c:when>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
      </table>
    </h:form>
  </div>
</f:view>
</body>
</html>
