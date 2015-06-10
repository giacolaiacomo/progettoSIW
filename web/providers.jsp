<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
  <link href="/bootstrap/css/business-frontpage.css" rel="stylesheet">
  <link rel="stylesheet" href="bootstrap/css/msc.css"/>
  <title>Providers</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp"/>

  <div class="container form-signin">
    <h1>Provider List</h1>
    <h:form>
      <table>
        <tr>
          <th>Name</th><th>Email</th><th>PhoneNumber</th><th>Vatin</th><th>Products</th>
        </tr>
        <c:forEach var="provider" items="#{providerController.listProviders}">
          <tr>
            <td>
              <h:commandLink action="#{providerController.findProvider}" value="#{provider.name}"/>
            </td>
            <td>${provider.email}</td>
            <td>${provider.phoneNumber}</td>
            <td>${provider.vatin}</td>
          </tr>
          <div class="container form-signin">
            <h1>Products List</h1>
            <h:form>
              <table>
                <tr>
                  <th>Name</th><th>Code</th><th>Price</th><th>Quantity</th><th>Description</th>
                </tr>
                <c:forEach var="product" items="#{providerController.listProducts}">
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
        </c:forEach>
      </table>
    </h:form>
  </div>
</f:view>
</body>
</html>