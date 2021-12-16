<%@ page import="Objs.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="header">
    <form action="">
        <label><input class="searchText" type="text" name="search"></label>
        <input class="searchButton" type="submit" value="搜索">
    </form>
    <p class="right">
        <%
            User cus = (User) session.getAttribute("customer");
            if (cus != null) {
                out.print(cus.getName() + ",欢迎您！");
                out.print("<a href ='logout.jsp'>注销</a>");
            } else {
                out.print("<a href=''>登录</a>&nbsp;&nbsp;<a href='register.jsp'>注册</a>&nbsp;&nbsp;");
            }
        %>
    </p>
</div>
</body>
</html>
