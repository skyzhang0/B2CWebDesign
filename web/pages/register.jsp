<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="Components/header.jsp" %>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="${pageContext.request.contextPath}/index.jsp" class="h1">进销存管理系统</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">初次见面，请填写注册信息</p>
      <%
        String err = request.getParameter("err");
        if (!(err == null || err.equals(""))) {
          out.println("<div class=\"alert alert-danger alert-dismissible\">");
          out.println("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>");
          out.println("<p><span class=\"icon fas fa-exclamation-triangle\"></span>错误</p>");
          out.println(err);
          out.println("</div>");
        }
      %>
      <form action="${pageContext.request.contextPath}/pages/Processes/registerProcess.jsp" method="post">
        <div class="input-group mb-3">
          <input type="text" name="username" class="form-control" placeholder="Username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" name="phone" class="form-control" placeholder="Phone">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-phone"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="password" class="form-control" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="retry_password" class="form-control" placeholder="Retype password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">Register</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
      <p>已经拥有账户？
        <a href="${pageContext.request.contextPath}/pages/login.jsp" class="text-center">登录</a>
      </p></div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<%@include file="Components/script_require.jsp" %>
</body>
</html>
