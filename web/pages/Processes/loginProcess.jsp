<%@ page import="Servlet.UserServlet.UserServlet" %>
<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-17
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<% UserServlet.login(request, response);%>
</body>
</html>
