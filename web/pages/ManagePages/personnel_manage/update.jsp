<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-19
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%-- header --%>
<%@include file="/pages/Components/header.jsp" %>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <%-- 导航栏 --%>
  <%@include file="/pages/Components/navbar.jsp" %>
  <%-- 侧边栏 --%>
  <%@include file="/pages/Components/sidebar.jsp" %>

  <%-- 页面内容 --%>
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">更新用户</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Starter Page</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <div class="card card-primary">
              <div class="card-header">
                <h3>目标用户信息</h3>
              </div>
              <form action="${pageContext.request.contextPath}/pages/Processes/personnel_manage/updateProcess.jsp"
                    method="post">
                <div class="card-body">
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
                    // 对传入的url成功参数进行处理
                    String scc = request.getParameter("scc");
                    if (!(scc == null || scc.equals(""))) {
                      out.println("<div class=\"alert alert-success alert-dismissible\">");
                      out.println("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>");
                      out.println("<p><span class=\"icon fas fa-check-circle\"></span>成功</p>");
                      out.println(scc);
                      out.println("</div>");
                    }
                  %>
                  <div class="form-group">
                    <label for="name">用户名</label>
                    <input type="text" name="name" class="form-control" placeholder="Name" id="name">
                  </div>
                  <div class="form-group">
                    <label for="type">修改类型为</label>
                    <select name="type" id="type" class="custom-select">
                      <option value="">未选择</option>
                      <option value="None">无权限</option>
                      <option value="Seller">销售员</option>
                      <option value="Buyer">采购员</option>
                      <option value="Inspector">验货员</option>
                      <option value="StoreKeeper">仓库管理员</option>
                    </select>
                  </div>
                </div>
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">submit</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <%-- 页面内容 --%>


  <%-- 底边栏 --%>
  <%@include file="/pages/Components/footer.jsp" %>
</div>
<%-- wapper --%>

<%-- js框架支持 --%>
<%@include file="/pages/Components/script_require.jsp" %>

</body>
</html>

