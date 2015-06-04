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
  <title>Products</title>
</head>
<body>
<f:view>
  <jsp:include page="header.jsp"/>

  <div class="container form-signin">
    <h1>Customers List</h1>
    <h:form>
      <table>
        <tr>
          <th>FirstName</th><th>LastName</th><th>PhoneNumber</th><th>Email</th><th>RegistrationDate</th>
        </tr>
        <c:forEach var="customer" items="#{customerController.customers}">
          <tr>
            <td>${customer.firstname}</td>
            <td>${customer.lastname}</td>
            <td>${customer.phonenumber}</td>
            <td>${customer.email}</td>
            <td>
              <h:outputText value="#{customer.registrationDate.time}">
              <f:convertDateTime dateStyle="medium" locale="it_IT" type="both" timeZone="Europe/Rome" />
              </h:outputText>
            </td>
          </tr>
        </c:forEach>
      </table>
    </h:form>
  </div>
</f:view>
</body>
</html>