<%@ page import="Servlet.UserServlet.AdministratorServlet" %>
<%@ page import="Servlet.UserServlet.UserServlet" %><%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-19
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<% UserServlet.find(request, response);%>
</body>
</html>
