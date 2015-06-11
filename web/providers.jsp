<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
  <link href="bootstrap/css/business-frontpage.css" rel="stylesheet">
  <link rel="stylesheet" href="bootstrap/css/msc.css"/>
  <title>Providers</title>
</head>
<body>
<f:view>
  <h:form>
    <jsp:include page="header.jsp"/>
    <div class="container form-signin">
      <h1>All Providers</h1>
      <table>
        <tr>
          <th>Name</th><th>Email</th><th>Vatin</th><th>ID</th><th>PhoneNumber</th>
        </tr>
          <c:forEach var="provider" items="#{administratorController.providers}">
            <tr>
            <td>
              <h:commandLink action="#{providerController.findProvider}" value="#{provider.name}">
                <f:param name="id" value="#{provider.id}"/>
              </h:commandLink>
            </td>
            <td>${provider.email}</td>
            <td>${provider.vatin}</td>
            <td>${provider.id}</td>
            <td>${provider.phoneNumber}</td>
          </c:forEach>
        </tr>
      </table>
    </div>
  </h:form>
</f:view>
</body>
</html>