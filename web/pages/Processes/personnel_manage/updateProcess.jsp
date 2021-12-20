<%@ page import="Servlet.UserServlet.AdministratorServlet" %><%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-19
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<%
  AdministratorServlet.awardUser(request, response);
%>
</body>
</html>
