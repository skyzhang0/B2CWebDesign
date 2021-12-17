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
      <p class="login-box-msg">好久不见，请登录！</p>
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
      <form action="${pageContext.request.contextPath}/pages/Processes/loginProcess.jsp" method="post">
        <div class="input-group mb-3">
          <input type="text" name="username" class="form-control" placeholder="Username/Phone">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
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
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">记住密码</label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">登录</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <p class="mb-0">
        没有账号？
        <a href="${pageContext.request.contextPath}/pages/register.jsp" class="text-center">注册</a>
      </p>

    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<%@include file="Components/script_require.jsp" %>
</body>
</html>
