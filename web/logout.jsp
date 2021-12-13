<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
</body>
</html>
