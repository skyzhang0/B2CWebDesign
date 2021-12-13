<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.CustomerDAO" %>
<%@ page import="Instance.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");
    if (name == null || pwd == null || name.isEmpty() || pwd.isEmpty()) {
        response.sendRedirect("register.jsp?errMsg=Name and password cannot be empty!");
    } else {
        String gender = request.getParameter("gender");
        String area = request.getParameter("area");

        Customer cus = new Customer();
        cus.setName(name);
        cus.setPwd(pwd);
        cus.setGender(gender);
        cus.setArea(area);

        if (CustomerDAO.insertCustomerInfo(cus) != 0) {
            session.setAttribute("customer", cus);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("register.jsp?errMsg=The user name has been registered!");
        }
    }
%>
</body>
</html>
