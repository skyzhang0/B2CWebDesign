<%@ page import="Entity.User.User" %><%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-18
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
  User user = (User) session.getAttribute("user");
%>
<div class="col-lg-6">
  <div class="card card-primary card-outline">
    <h5 class="card-header">用户信息：</h5>
    <div class="card-body">
      <div class="row">
        <div class="col-3"><p>用户名：</p></div>
        <div class="col-9">
          <p><%=user.getName()%>
            <a href="${pageContext.request.contextPath}/pages/change_username.jsp">
              <span class="fas fa-pen"></span></a>
          </p>
        </div>
      </div>
      <div class="row">
        <div class="col-3"><p>密码：</p></div>
        <div class="col-9">
          <p><%="*".repeat(user.getPassword().length())%>
            <a href="${pageContext.request.contextPath}/pages/change_password.jsp">
              <span class="fas fa-pen"></span></a>
          </p>
        </div>
      </div>
      <div class="row">
        <div class="col-3"><p>手机号：</p></div>
        <div class="col-9">
          <p><%=user.getPhone()%>
            <a href="${pageContext.request.contextPath}/pages/change_phone.jsp">
              <span class="fas fa-pen"></span></a>
          </p>
        </div>
      </div>
      <div class="row">
        <div class="col-3"><p>注册时间：</p></div>
        <div class="col-9">
          <p><%=user.getRegister_date()%>
          </p>
        </div>
      </div>
    </div>
    <div class="card-footer">
      <div class="row">
        <div class="col-3">
          <a href="${pageContext.request.contextPath}/pages/Processes/logoutProcess.jsp">
            <button type="button" class="btn btn-block btn-danger">登出
            </button>
          </a>
        </div>
      </div>
    </div>
  </div>
  <!-- /.card -->
</div>
<%-- col-lg-6 --%>