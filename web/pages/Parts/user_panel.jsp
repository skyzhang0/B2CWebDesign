<%@ page import="Entity.User.User" %><%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-18
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="user-panel mt-3 pb-3 mb-3 d-flex">

  <div class="image">
    <img src="${pageContext.request.contextPath}/dist/img/user.png" class="img-circle elevation-2"
         alt="User Image">
  </div>
  <div class="info">
    <a href="#" class="d-block">
      <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
          out.print("未登录");
        } else {
          out.print(user.getName());
        }
      %>
    </a>
  </div>
</div>
