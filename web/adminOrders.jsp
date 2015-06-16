<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Fabio
  Date: 16/06/15
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
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
                    <th>Id</th><th>Creation Time</th><th>Closed Time</th><th>Customer Email</th><th>Processed</th>
                </tr>
                <c:forEach var="order" items="#{administratorController.closedOrders}">
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
                            <h:commandLink action="#{customerController.findCustomer(order.customer_id.id)}" value="#{order.customer_id.email}">
                            </h:commandLink>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${order.processed != true}">
                                    <h:commandButton styleClass="btn-primary btn" value="Process" action="#{orderController.setProcessedOrder}">
                                        <f:setPropertyActionListener value="#{order}" target="#{orderController.order}"/>
                                    </h:commandButton>
                                </c:when>
                                <c:when test="${order.processed == true}">
                                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
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
