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
                    <th>Name</th><th>Code</th><th>Price</th><th>Quantity</th><th>Description</th>
                </tr>
                <c:forEach var="order" items="#{administratorController.closedOrders}">
                    <tr>
                        <td>
                            <h:commandLink action="#{productController.findProduct(product.id)}" value="#{product.name}">
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
