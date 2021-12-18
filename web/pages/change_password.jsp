<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="Components/header.jsp" %>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="${pageContext.request.contextPath}/index.jsp" class="h1">进销存管理系统</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">请输入密码</p>
      <%
        // 对传入的url错误参数进行处理
        String err = request.getParameter("err");
        if (!(err == null || err.equals(""))) {
          out.println("<div class=\"alert alert-danger alert-dismissible\">");
          out.println("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>");
          out.println("<p><span class=\"icon fas fa-exclamation-triangle\"></span>错误</p>");
          out.println(err);
          out.println("</div>");
        }
      %>
      <form action="${pageContext.request.contextPath}/pages/Processes/changePassword.jsp" method="post">
        <div class="input-group mb-3">
          <input type="password" name="password" class="form-control" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="retry_password" class="form-control" placeholder="Confirm Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">登录</button>
          </div>
        </div>
      </form>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<%@include file="Components/script_require.jsp" %>
</body>
</html>
